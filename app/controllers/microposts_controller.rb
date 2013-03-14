class MicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	before_filter :correct_user, only: :destroy

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:suceess] = "Micropost created!"
			redirect_to root_url
		else
			redirect_to 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private
	def correct_user
		@micropost = current_user.microposts.find_by_id(params[:id])
		redirect_to root_url if @micropost.nil?
	end
end