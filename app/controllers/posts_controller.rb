class PostsController < ApplicationController
 
 skip_before_action :verify_authenticity_token, :only => :create
 
 #We'll use @new_post in the view to render a form. We'll use @all_posts to render a list 
 #of all posts, sorted in descending order.
 def index
 @new_post = Post.new
 @all_posts = Post.order(created_at: :desc).all 
 end
 
  def create
    @new_post = Post.new(post_params)
   if @new_post.save
    redirect_to root_path
   end
  end
  
  #In the Posts controller, write a private method named post_params. 
  # Require the model name post and permit the column name comment.
 # In the Posts controller, make an action named create. Use post_params to create a new Post object. 
 #After saving to the database, redirect to root_path.
  private 
  def post_params
   params.require(:post).permit(:comment)
  end

end
  


