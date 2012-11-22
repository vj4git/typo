Feature: Merge Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to merge articles to my blog

  Background:
    Given the blog is set up

  Scenario: A non-admin cannot merge two articles
    Given I am not admin
    When I visit the edit article page
    Then I should not see "Merge Articles"

  Scenario: Successfully merge articles
    And I am logged into the admin panel
    Given the article is setup
    When I go to the admin content page
    When I follow "Foobar"
    When I fill in "merge_with" with "2"
    When I press "Merge With This Article"
    Then I should be on the admin content page
    Then I should see "Article was successfully merged."

