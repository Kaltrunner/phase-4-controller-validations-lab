class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_author_error
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def invalid_author_error(invalid)
    render json: {errors: invalid.record.errors.full_massages}, status: :unprocessable_entity
  end
  
end
