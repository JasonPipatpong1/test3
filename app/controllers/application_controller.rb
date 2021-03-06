class ApplicationController < ActionController::Base
  # before_action :set_current_user , :authenticate!
    protected # prevents method from being invoked by a route
    def set_current_user
      # we exploit the fact that the below query may return nil
      # @current_user ||= Moviegoer.find_by(:id => session[:user_id])
      @current_user = user_id # y add

    end
    def authenticate!
      unless @current_user
          redirect_to OmniAuth.login_path(:provider)
      end
    end
    require 'themoviedb'
    Tmdb::Api.key("84b6d78b692ce56905293d36159048ed")

    def set_config
      @configuration = Tmdb::Configuration.new
    end

end
