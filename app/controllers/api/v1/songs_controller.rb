class Api::V1::SongsController < ApplicationController

    def index 
        @songs = Song.all

        render json: @songs
    end

    def show
        @song = Song.find(params[:id])

        render json: @song
    end


    def create 
        @song = Song.create(song_params)

        render json: @song
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)

        render json: @song 

    end

    def destory
        @song = Song.find(params[:id])
        @song.delete

        render json: @song.id

    end

    private
    def song_params
        params.require(:song).permit(:title)
    end
end
