class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render 'tasks/index'
  end

  def create
    @task = Task.new(task_params)

    if @task.save 
      render 'tasks/create'
    end
  end



  def task_params
    params.require(:task).permit(:content)
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    if @task && @task.destroy 
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  

  def update
    @task = Task.find_by(id: params[:id])

    if @task && @task.completed == false
      @task.update(completed: true)
      render 'tasks/update'
    elsif @task && @task.completed == true
      @task.update(completed: false)
      render 'tasks/update'
    else
      render json: { success: false }
    end
  end

  private

end
