class SessionsController < ApplicationController
	before_action :require_login
	skip_before_action :require_login, only: [:index, :new, :create]
  def new
  end

  def create
  	if params[:name] && !params[:name].empty?
  		session[:name] = params[:name]
  		redirect_to show_path
  	else
  		redirect_to login_path
  	end
  end

  def show
  	render :show
  end

  def destroy
  	session.destroy
  	redirect_to login_path
  end

  private
  def require_login
  	return head(:forbidden) unless session.include? :name
  end
end
