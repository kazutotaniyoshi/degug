class FavoritesController < ApplicationController
    def create

      book = Book.find(params[:book_id])
      favorite = current_user.favorites.new(book_id: book.id)
      favorite.save
      redirect_to books_path
    end

    def destroy
      book = Book.find(params[:book_id])
      favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
        redirect_to books_path
    end

    def show
      @book = Book.find(params[:id])
      @post_comment = PostComment.new
    end
end
