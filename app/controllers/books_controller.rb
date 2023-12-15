class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.user.id)
  end

  def show
    @book = Book.new
    @user = current_user
    # @book_user = Book.find(params[:id])
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id, :image)
  end

end
