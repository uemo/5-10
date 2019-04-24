class UsersController < ApplicationController

  def top
  end

  def about
  end

  def mypage
    @user = current_user
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def index
  	# @user = User.find(params[:id])
  	@book = Book.new
  	@users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
   end

end
