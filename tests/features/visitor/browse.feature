@api @javascript @visitor
Feature: Browser tests

  Background: Fresh module install
    Given all Marketo REST modules are clean and using "marketo_test_settings"

  @page_visibility
  Scenario: Page visibility when using default "All pages except those listed"
    And I am logged in as a user with the "administrator" role
    
    When I am on the homepage
    Then Munchkin tracking should be enabled
    
    When I am viewing a "Article" with the title "Foo"
    Then Munchkin tracking should be enabled
    
    When I visit "/admin"
    Then Munchkin tracking should be disabled
    
    When I visit "/admin/config/search/marketo_rest"
    Then Munchkin tracking should be disabled
    
    When I visit "/node/add"
    Then Munchkin tracking should be disabled
    
    When I visit "/node/add/article"
    Then Munchkin tracking should be disabled
    
  @page_visibility
  Scenario: Page visibility when using "Only the pages listed"
    Given I populate the Marketo REST config using "marketo_page_vis_only"
    And I am logged in as a user with the "administrator" role
    
    When I am on the homepage
    Then Munchkin tracking should be disabled
    
    When I am viewing a "Article" with the title "Foo"
    Then Munchkin tracking should be disabled
    
    When I visit "/admin"
    Then Munchkin tracking should be enabled
    
    When I visit "/admin/config/search/marketo_rest"
    Then Munchkin tracking should be enabled
    
    When I visit "/node/add"
    Then Munchkin tracking should be enabled
    
    When I visit "/node/add/article"
    Then Munchkin tracking should be enabled
    
  @role_visibility
  Scenario: Role visibility when using default "All roles except those selected"
    
    When I am an anonymous user
    And I am on the homepage
    Then Munchkin tracking should be enabled
    
    When I am logged in as a user with the "authenticated user" role
    And I am on the homepage
    Then Munchkin tracking should be enabled
    
    Given I populate the Marketo REST config using "marketo_role_vis_auth_exclude"
    
    When I am an anonymous user
    And I am on the homepage
    Then Munchkin tracking should be enabled
    
    When I am logged in as a user with the "authenticated user" role
    And I am on the homepage
    Then Munchkin tracking should be disabled

    Given I populate the Marketo REST config using "marketo_role_vis_auth_include"
    
    When I am an anonymous user
    And I am on the homepage
    Then Munchkin tracking should be disabled
    
    When I am logged in as a user with the "authenticated user" role
    And I am on the homepage
    Then Munchkin tracking should be enabled
