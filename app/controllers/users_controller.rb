class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def create 
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully Created User!"
      redirect_to '/'
    else
      flash[:warning] = "invalid Email or Password"
      redirect_to '/sessions/new'
    end
  end

  def new
    @user = User.new
  end
end
