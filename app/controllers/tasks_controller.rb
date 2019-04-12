class TasksController < ApplicationController
    before_action :set_task,only:[:show,:edit,:update,:destroy]
    
    def index
        @tasks=Task.all
        render "task/index.html.erb"
    end
     
    def create
        @task=Task.new(task_params)
        
        if @task.save
            flash[:success]="Taskが正常に投稿されました"
            redirect_to @task
        else
            flash.now[:danger]="Taskが投稿されませんでした"
            render :new
        end    
    end 
    
    def new
        @task=Task.new
        render "task/new.html.erb"
    end 
    
    def edit
    set_task
    end 
    
    def show
    set_task
    
    end 
    
    def update
        @task =Task.find(params[:id])
        
        if @task.update(task_params)
            flash[:success]="Taskは正常に更新されました"
            redirect_to @task
        else 
            flash.now[:danger]="Taskは更新されませんでした"
            render :edit
        end
    end 
    
    
    
    def destroy
        @tasks=Task.find(params[:id])
        @tasks.destroy
        
        flash[:success]="Taskは正常に削除されました"
        redirect_to tasks_url
    end 
    
    private
    def set_task
        @task=Task.find(params[:id])
        
    end    
        
        
    def task_params
        params.require(:task).permit(:content)
    end
end
