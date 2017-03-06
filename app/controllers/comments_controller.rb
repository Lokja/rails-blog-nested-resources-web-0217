class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(id_param)
    @comment.post_id = @post.id
    @comment.user_id = @post.user_id
    @comment.save
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def id_param
    params.require(:post_id)
  end

end
