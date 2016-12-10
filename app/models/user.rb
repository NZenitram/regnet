class User < ApplicationRecord

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = user.uid
      user.name = auth.info.name
      use.oauthtoken = auth.credentials.token
      use.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
  end
end
