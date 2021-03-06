class ApplicationController < ActionController::Base
    before_action :authenticate_user!,except: [:top, :index]
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
    def after_sign_up_path_for(resoursce)
      user_path(current_user.id)
  end
  def after_sign_in_path_for(resoursce)
      user_path(current_user.id)
  end

end
