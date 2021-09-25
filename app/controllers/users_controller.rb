class UsersController < ApplicationController
    before_action :authenticate_user!, if: :use_auth?

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
  @users = User.all
  @user = current_user
end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
            render "edit"
          else
            redirect_to user_path(@current_user.id)
          end
  end

  def update

    @user = User.find(params[:id])
   if  @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render :edit
  end
end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
def use_auth?
    unless controller_name == 'user' && action_name == 'index'
      true
    end
end
end