class BooksController < ApplicationController
  def index
    @books_all = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @books_all = Book.all
    @edit = Book.new
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books_all = Book.all
      render :index
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
