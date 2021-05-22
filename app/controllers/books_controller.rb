class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book,only: [:edit]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end