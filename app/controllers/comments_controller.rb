class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :edit, :update, :destroy] before_action :set_user, only: [:create, :edit, :update, :destroy] before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to user_post_path(@user, @post), success: 'Comment created!'
    else render '#' #FIXME:正しく当てる
    end
  end

  def edit end

  def update
    if @comment.update(comment_params)
      redirect_to user_post_path(@user, @post), success: 'Comment updated!'
    else render 'edit'
    end
  end

  def destroy
    @comment.destroy redirect_to user_post_path(@user, @post)
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = @post.user
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end