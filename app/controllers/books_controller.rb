class BooksController < ApplicationController
  def create 
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:notice] = "Creation was unsuccessful"
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.new
    @book = Book.find(params[:id])
  end
  
  def update 
    @book = Book.find(params[:id])
    if @book.update(book_params) 
      flash[:notice] = "Book was successfully editted"
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "Edit was unsuccessful"
      render :edit
    end
  end
  
  def destroy 
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed"
      redirect_to '/books'
    else 
      flash[:notice] = "Deletion was unsuccessful"
      render :index
    end
  end
  
  private 
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
