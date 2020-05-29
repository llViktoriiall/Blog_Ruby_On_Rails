class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_post, only: [:show, :edit, :destroy, :update]


	def index
		@posts = Post.all
	end


	def show
	end


	def new
		@post = Post.new
	end


	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, success: 'The article was succesfully added' 
		else
			render :new, danger: 'The article was not updated'
		end
	end

	def edit
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to @post

		else
			render :edit
		end
	end


	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
	end

	def set_post
		@post = Post.find(params[:id])
	end 
end


