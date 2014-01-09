Feature: Setting up basic page layout for site
  As a user
  So that I can navigate the site
  I should see a basic design elements

Background:
  Given I visit the site

Scenario: Load basic design elements
  Then I should see a navigation header
  And I should see a main content area
  And I should see a footer area

Scenario: Render navigation bar
  Then I should see a navigation bar
  And I should see a "Our projects" link
  And I should see a "Check in" link
  And I should see a "Sign up" link
  And I should see no other links, except for "Our projects, Check in, Sign up"


