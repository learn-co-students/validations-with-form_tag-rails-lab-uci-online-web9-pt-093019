class AuthorsController < ApplicationController
  def show
    find_author
  end

  def new
    @author = Author.new
  end

  def edit
    find_author
  end 

  def update
    find_author    
    @update = Author.new(author_params)

    if @update.valid?
      @author.update(author_params)
      redirect_to author_path(@author)
    else 
      @author.errors = @update.errors 
      render :edit
    end 
  end 

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new 
    end 
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end 

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
