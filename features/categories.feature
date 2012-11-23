Feature: Create or Edit Categories
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to create categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add and edit categories
    When I follow "Categories"
    And I fill in "Name" with "Test1"
    And I fill in "Description" with "Test #1"
    And I press "Save"
    Then I should be on the admin categories
    Then I should see "Category was successfully saved."
    When I follow "Test1"
    And I fill in "Description" with "Testing for #1"
    And I press "Save"
    Then I should be on the admin categories
    Then I should see "Category was successfully saved."

