class BooksController < ApplicationController
  def create 
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿が成功しました"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:notice] = "投稿が失敗しました"
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
    @book = Book.find(params[:id])
  end
  
  def update 
    @book = Book.find(params[:id])
    if @book.update(book_params) 
      flash[:notice] = "編集が成功しました"
      redirect_to book_path(@book.id)
    else
      @book = Book.find(params[:id])
      flash[:notice] = "編集が失敗しました"
      render :edit
    end
  end
  
  def destroy 
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "削除が成功しました"
      redirect_to '/books'
    else 
      flash[:notice] = "削除が失敗しました"
      render :index
    end
  end
  
  private 
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
