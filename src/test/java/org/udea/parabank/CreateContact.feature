Feature: Crear contacto

  Background:
    * url baseUrl
    * def login = call read('classpath:org/udea/parabank/login.feature')
    * def token = login.token
    * header Authorization = 'Bearer ' + token
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
 
  Scenario: Crear contacto exitosamente
    Given path '/contacts'
    And request
    """
    {
      "firstName": "John",
      "lastName": "Doe",
      "birthdate": "1970-01-01",
      "email": "jdoe@fake.com",
      "phone": "8005555555",
      "street1": "1 Main St.",
      "street2": "Apartment A",
      "city": "Anytown",
      "stateProvince": "KS",
      "postalCode": "12345",
      "country": "USA"
    }
    """
    When method POST
    Then status 201
