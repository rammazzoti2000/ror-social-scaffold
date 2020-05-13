module FriendshipsHelper
  def friendship_button(friend)
    if friend.friend_requests.any?(current_user)
      'Pending request'
    elsif !current_user.friend?(friend)
      link_to 'Add friend', request_friendship_user_path(friend.id), method: :post, class: 'profile-link'
    else
      link_to 'Unfriend', unfriend_user_path(friend), method: :delete, class: 'profile-link'
    end
  end
end
