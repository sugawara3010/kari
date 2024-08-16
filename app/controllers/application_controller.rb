class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :require_login
  helper_method :user_signed_in?

  def user_signed_in?
    !current_user.nil?
  end

  private

  def not_authenticated
    redirect_to login_path
  end
end
