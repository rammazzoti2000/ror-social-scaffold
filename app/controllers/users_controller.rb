class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all_except_current(current_user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.friends_and_own_posts.ordered_by_most_recent
    @pending_request = current_user.incoming_friendships
  end

  def hui
    @user = User.find(params[:id])
    current_user.confirm_friend(@user)
    redirect_to users_path, notice: 'U are now friends'
  end
end
