class SecretsController < ApplicationController

  def new
  end

  def show
  	unless session[:name]
  		redirect_to login_path
  	end
  end

end
