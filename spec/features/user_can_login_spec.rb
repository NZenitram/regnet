require 'rails_helper'

describe 'user visits root' do
  scenario 'they can log in' do
    user = stub_omniauth

    visit '/'
    page.should have_content 'Sign in with Google'

    click_link "Sign in"
    page.should have_content("Sign Out")
  end
end
