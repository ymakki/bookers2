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
    redirect_to book_path(@book.id)
  end

  def show
    @book_new = Book.new
    @user = current_user
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      # updateが成功したとき
      # flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      #updateが失敗したとき
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    # flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id, :image)
  end

end
