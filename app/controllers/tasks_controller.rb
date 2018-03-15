class TasksController < ApplicationController
  before_action :set_tasks, only: [:new, :index, :update]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      flash.now[:alert] =@task.errors.full_messages
      @tasks =  Task.all
      render :index
    end
  end

  def edit
  end

  def update
    @tasks = Task.all
    if @task.update(task_params)
      redirect_to tasks_path
    else
      flash.now[:alert] = @task.errors.full_messages
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_tasks
    @task= Task.new
  end

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
