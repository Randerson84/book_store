require_relative 'database_connection'
require_relative 'book'

class BookRepository
    def all
        books = []
        # Executes the SQL query:
        sql = 'SELECT id, title, author_name FROM books;'
        result = DatabaseConnection.exec_params(sql, [])
        
        result.each do |record|
            book = Book.new
            book.id = record['id']
            book.title = record['title']
            book.author_name = record['author_name']
            books << book
        end
        return books
        # Returns an array of Book objects.
    end
    def find(id)
        # Executes the SQL query:
        sql = 'SELECT id, title, author_name FROM books WHERE id = 1;'
        result = DatabaseConnection.exec_params(sql, [])
        
        result.each do |record|
            book = Book.new
            book.id = record['id']
            book.title = record['title']
            book.author_name = record['author_name']
            return book
        end
        

        # Returns a single book object.
    end
end