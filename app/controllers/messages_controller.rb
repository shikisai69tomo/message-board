class MessagesController < ApplicationController
    def index
        @messages = Message.all
    end
    
    def show
        @message = Message.find(params[:id])
    end
    
    def new
        @message = Message.new
    end
    
    def create
        @message.save
        flash[:success] = 'Message が正常に投稿されました'
        redirect_to @message
      else
        flash.now[:danger] = 'Message　が投稿されませんでした'
        render :new
    end
    
    def edit
        @message = Message.find(params[:id])
    end
    
    def update
        @meassge = Message.find(params[:id])
        
        if @message.update(message_params)
            flash[:success] = 'Message は正常に更新されました'
            redirect_to @message
         else
            flash.now[:danger] = 'Message は更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        
        flash[:success] = 'Message は正常に削除されました'
        redirect_to message_url
    end
    
    private
    
    def message_params
        parms.require(:message).permit(:content)
    end
end
