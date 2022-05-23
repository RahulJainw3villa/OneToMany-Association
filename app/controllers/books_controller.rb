class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end
    
    def new
        @author = Author.find(params[:author_id])
        @book = @author.books.build
    end
    
      def create
        @author = Author.find(params[:book][:author][:id])
        @book = @author.books.build(book_params)
        if @book.save
            redirect_to root_path
            else
                render :new
            end 
        end
        
        def destroy
            @book = Book.find(params[:id])
            @Book.destroy
        
            redirect_to root_path, status: :see_other
          end
        

      private
      def book_params
        params.require(:book).permit(:name,:author_id)
      end

end
