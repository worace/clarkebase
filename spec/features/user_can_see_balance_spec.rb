require 'rails_helper'

RSpec.feature "User can see their balance" do
  scenario "a registered user with a wallet can see their balance", js: true do
    VCR.use_cassette("balance", record: :new_episodes) do
      wallet = create(:wallet)
      user   = wallet.user

      login_as user, scope: :user

      visit whallet_dashboard_path(wallet)


      expect(page).to have_content "Balance: #{wallet.balance}"

    end
  end
end
