class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to movie_path
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy

    redirect_to movie_path
  end

####### STRONG PARAMS ##############
  private
  def movie_params
    params.require(:movie).permit(:id, :name, :director, :description, :ranking)
  end
end
