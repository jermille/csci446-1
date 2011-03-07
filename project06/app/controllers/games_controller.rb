class GamesController < ActionController::Base

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(params[:game])

		if @game.save
			flash[:notice] = "New game added."
			redirect_to @game
		else
			flash[:notice] = "Unable to add game"
			redirect_to root_url
		end
  end

  def update
    @game = Game.find(params[:id])

		if @game.update_attributes(params[:game])
			flash[:notice] = "Game updated."
			redirect_to @game
		else
			flash[:notice] = "Unable to update game."
			redirect_to root_url
		end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
  end

end
