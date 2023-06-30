class BooksController < ApplicationController

  def index
    @Book = Book.new
    @Books = Book.all
  end

  def create
    @Book = Book.new(book_params)
    if @Book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@Book.id)
    else
      @Books = Book.all
      render :index
    end
  end

  def show
    @Book = Book.find(params[:id])
  end

  def edit
    @Book = Book.find(params[:id])
  end

  def update
    @Book = Book.find(params[:id])
    if @Book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@Book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
