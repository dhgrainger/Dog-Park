require 'spec_helper'

feature "User creates dog", %q{
  As a dog owner
  I want to register my dog
  So that I can connect with other dog lovers
} do

  context 'with valid attributes' do
    it 'creates an iquiry with valid attributes' do
      visit '/dogs/new'

      fill_in "First name", with: "doug"
      fill_in "Last name", with: "grainger"
      fill_in "Dog name", with: "Max"
      fill_in "Email", with: "dhgrainger@gmail.com"

      click_on "New Dog"

      expect(page).to have_content "Max"
    end

    it 'requires a dog name' do
      visit '/dogs/new'

      fill_in "First name", with: "doug"
      fill_in "Last name", with: "grainger"
      fill_in "Dog name", with: ""
      fill_in "Email", with: "dhgrainger@gmail.com"

      click_on "New Dog"

      expect(page).to have_content("Dog name can't be blank")
    end
  end
end
