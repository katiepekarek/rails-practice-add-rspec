require 'rails_helper'

feature 'Events' do
  scenario 'User edits an event' do
    Event.create!(
    description: 'My aweeesome event'
    )

    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'edit'
    fill_in 'Description', with: 'My awesome event'
    click_on 'Update Event'

    expect(page).to have_content('My awesome event')
    expect(page).to have_no_content('My aweeesome event')
  end
end

feature 'Events' do
  scenario 'User creates an event' do
    visit root_path
    click_on 'New Event'
    fill_in 'Description', with: 'My best event'
    click_on 'Create Event'

    expect(page).to have_content('My best event')
  end
end

feature 'Events' do
  scenario 'User deletes an event' do
    Event.create!(
    description: 'My crazy event'
    )

    visit root_path
    click_on 'delete'

    expect(page).to have_no_content('My crazy event')
  end
end

feature 'Events' do
  scenario 'Event link takes you to event show page' do
    Event.create!(
    description: 'My crazy event'
    )
    visit root_path
    expect(page).to have_content('My crazy event')
    click_on 'My crazy event'
    expect(page).to have_content('My crazy event')
  end
end

# current_path.should eq(params[:show])
