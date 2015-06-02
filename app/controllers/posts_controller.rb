class PostsController < ApplicationController

  def show
  end

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post), success: 'Post created!'
    else
      render 'new'
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end