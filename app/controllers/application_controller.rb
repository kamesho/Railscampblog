class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # ログイン後、リダイレクト先メソッドafter_sign_in_path_forをオーバーライドする。
  def after_sign_in_path_for(resource)
    # POSTの場合、after_login_to_post_pathに遷移
    if session[:after_login_to_show]
      after_login_to_post_show
    # そうじゃない時はtopへリダイレクト
    else
      root_path
    end
  end
end


