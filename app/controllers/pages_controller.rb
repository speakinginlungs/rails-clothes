class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search blog]

  def home
    @feed = policy_scope(Style).order(created_at: :desc).first(3)
    @my_styles = policy_scope(Style).where(user: current_user).order(created_at: :desc).first(3)
    @liked_styles = current_user.favorited_by_type('Style').order(created_at: :asc).first(3)
  end

  def about; end

  def show
    @item = Item.find(params[:id])
  end

  def blog; end
end
