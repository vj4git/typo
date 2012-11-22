When /I visit the edit article page(?: for "(.*)")?/ do |article_id|
   '/admin/content/edit/#{article_id}'
end

Given /^I am not admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'vjpub'
  fill_in 'user_password', :with => 'bbbbbbbb'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /the article is setup/ do
  steps %{
  Given I am on the new article page
  When I fill in "article_title" with "Foobar"
  And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
  And I press "Publish"
  Then I should be on the admin content page
  When I go to the home page
  Then I should see "Foobar"
  Given I am on the new article page
  When I fill in "article_title" with "TwoFoobar"
  And I fill in "article__body_and_extended_editor" with "Topic 2"
  And I press "Publish"
  Then I should be on the admin content page
  When I go to the home page
  Then I should see "TwoFoobar"
  }
end
