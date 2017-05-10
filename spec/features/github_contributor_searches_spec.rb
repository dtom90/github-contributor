require 'rails_helper'

RSpec.feature 'GitHub Contributor Searches', type: :feature, js: true do
  
  before(:each) do
    visit '/'
  end
  
  scenario 'User visits the home page' do
    expect(page).to have_content 'GitHub Contributor'
    expect(page).to have_content 'Username'
    expect(page).to have_button 'Get Contributions'
  end
  
  scenario 'User tries to get contributions with a blank username' do
    click_button 'Get Contributions'
    expect(page).to have_text "can't be blank"
  end
  
  scenario 'User tries to get contributions from a nonexistent username' do
    fill_in 'contributor_username', with: 'fdusao9fudlsdfskaydlksufykdzheus'
    click_button 'Get Contributions'
    expect(page).to have_text "Couldn't find a GitHub profile for this username"
  end
  
  scenario 'User tries to get contributions from dtom90' do
    fill_in 'contributor_username', with: 'dtom90'
    click_button 'Get Contributions'
    expect(page).to have_text 'Contributor dtom90'
    expect(page).to have_text 'contributions in the last year'
    expect(page).to have_text 'Contribution Statistics'
  end
  
end
