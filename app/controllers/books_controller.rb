class BooksController < ApplicationController
  def top
  end

  def index
    @Book = Book.new
    
  end

  def create
    @Books = Book.new(book_params)
    if @Book.save
      falsh[:notice] = "Book was successfully created."
      redirect_to book_path(@Book.id)
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
