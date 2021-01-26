class UsersController < ApplicationController
  before_action :authenticate_user!,


  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
   def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
   end
  
  def edit
    @user = User.find(params[:id])
    if @book.user == current_user
            render "edit"
    else
            redirect_to books_path
    end
  end
  
  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully"
   else
    render :edit
   end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end