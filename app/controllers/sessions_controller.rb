class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to 'users#new'
    else
      flash[:danger] = "El usuario o contraseña son incorrectos"
      render 'new'
    end
  end

  def destroy
  end
end
