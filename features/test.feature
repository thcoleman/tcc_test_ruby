Feature: get status code from tcc website service links

  Scenario: test services links
    Given that the browser is started
    And user goes to tcc website
    And wait until services tab is present
    And wait until Discover our Services div is present
    Then get http status code for each link
    Then quit browser




