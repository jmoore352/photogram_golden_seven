class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find_by({ :id => params[:id]})
  end

  def new_form

  end

  def create_row
    p = Photo.new
    p.caption = params[:caption]
    p.source = params[:source]
    p.save

    #render("create_row.html.erb")
    redirect_to("http://localhost:3000/photos")
  end

  def destroy
    @photo_delete = Photo.find_by({ :id => params[:id]})
    @photo_delete.destroy

    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @photo = Photo.find(params[:id])
  end

  def update_row
    photo = Photo.find(params[:id])
    photo.caption = params[:caption]
    photo.source = params[:source]
    photo.save
    redirect_to("http://localhost:3000/photos/#{params[:id]}")
  end
end
