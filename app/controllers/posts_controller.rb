class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "post created successfully"
			redirect_to post_path(@post)
		else 
			flash[:notice] = "Title or Body too short or missing."
			render :new
		end
	end

	def show
		
	end

	def edit
		
	end
	def update
		
		if @post.update(post_params)
			flash[:notice] = "post updated successfully"
			redirect_to post_path(@post)
		else
			flash[:notice] = "Title or Body too short or missing."
			render :new
		end
	end

	def destroy
		
		@post.destroy
		flash[:notice] = "post was successfully deleted"
		redirect_to posts_path
	end

	private
	def find_post
		@post = Post.find(params[:id])
	end
	def post_params
	params.require(:post).permit(:title, :body)	

	end
end
