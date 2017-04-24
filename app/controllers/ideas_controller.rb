class IdeasController < ApplicationController
	def index
		@ideas=Idea.all
	end
	
	def create
		@idea=Idea.create(idea_params)
		if @idea.valid?
			#implement later
		else
			#implement later
		end
		redirect_to root_path
	end
	def edit
		@idea=Idea.find(params[:id])
		if @idea.update(idea_parms)
			redirect_to root_path
		else
			redirect_to edit_idea_path(params[:id])
		end	
	end
	private
	def idea_params
		  params.require(:idea).permit(:description, :author)
	end
end
