class PlaysController < ApplicationController

  # GET /plays/new
  def new
  end

  # POST /throw
  def throw
    @user_throw = play_params[:sign]
    throws = %w{Paper Scissors Rock}
    ut = throws.find_index @user_throw
    st = rand(3)
    @server_throw = throws[st]

    if ut == st
      @status = "Tie"
    elsif ut == 0 and  st == 2
      @status = "Win"
    elsif ut - st == 1
      @status = "Win"
    else
      @status = "Lose"
    end
    #binding.pry

  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def play_params
      params.permit(:sign)
    end
end
