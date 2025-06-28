Feature: Login to App contacts

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer Login
    Given path '/users/login'
    And request 
    """
    {
      "email": "marit@gmail.com",
      "password": "User1234."
    }
    """
    When method POST
    Then status 200
    And match response ==
    """
    {
      "user": {
        "_id": "#string",
        "firstName": "#string",
        "lastName": "#string",
        "email": "#string",
        "__v": "#number"
      },
      "token": "#string"
    }
    """
    * def token = response.token
  Scenario: Login failed with invalid credentials
    Given path '/users/login'
    And request { "email": "marit@gmail.com", "password": "wrong" }
    When method POST
    Then status 401
    And match response.message == "Incorrect email or password"