class IdeasController < ApplicationController
	def index
		@ideas=Idea.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)	
	end
	
	def create
		@idea=Idea.create(idea_params)
		if @idea.valid?
			flash[:success] = "you succesfully created your idea"
		else
			flash[:alert] = "Oops!!something went wrong"
		end
		redirect_to root_path
	end
	def edit
  		@idea = Idea.find(params[:id])
	end

	def update
		@idea=Idea.find(params[:id])
		if @idea.update(idea_parms)
			flash[:success] ="succesful"
			redirect_to root_path
		else
			flash[:alert] ="try again!!"
			redirect_to edit_idea_path(params[:id])
		end	
	end
	def destroy
		@idea = Idea.find(params[:id])
		@idea.destroy
		flash[:success] ="the idea was deleted succesfully!"
		redirect_to root_path
	end
	private
	def idea_params
		  params.require(:idea).permit(:description, :author)
	end
end
