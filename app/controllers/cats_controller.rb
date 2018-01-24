class CatsController < ApplicationController
  def index
    @cats = Cat.all.order(rank: :desc)
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
      if @cat.update(params.require(:cat).permit(:name, :url, :description, :rank))
        redirect_to cats_path, notice: "cat was successfully updated."
      else
        render :edit
      end
  end

  def create
    @cat = Cat.new(params.require(:cat).permit(:name, :url, :description, :rank))
    if @cat.save
      redirect_to cats_path, notice: "cat was created successfully."
    else
      render :new
    end
  end

  def destroy
    @cat = Cat.all.find(params[:id])
    @cat.destroy
    redirect_to cats_path, notice: "cat was successfully destroyed."
  end

  def upvote
    @cat = Cat.all.find(params[:id])
    @cat.rank += 1
    redirect_to cats_path
    @cat.save
  end

  def downvote
    @cat = Cat.all.find(params[:id])
    if @cat.rank >= 1
      @cat.rank -= 1
    end
    @cat.save
    redirect_to cats_path
  end
end
