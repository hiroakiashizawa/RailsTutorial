module SessionsHelper
  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # ログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # ログイン中のユーザを返す(無ければnil)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ログイン中のユーザがいる(true)、いない(false)
  def logged_in?
    !current_user.nil?
  end
end
