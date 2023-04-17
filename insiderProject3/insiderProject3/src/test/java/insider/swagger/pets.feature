Feature: pets


  Background:

    * url baseUrl
    * header Accept = 'application/json'
    * def requestParams = read('insiderPath.json')


  Scenario: Yeni evcil hayvan ekleme
    Given path '/v2/pet'
    And request requestParams.hayvanEklemeRequest
    When method post
    Then status 200
    And print response


  Scenario: Hayvan Güncelleme
    Given path '/v2/pet'
    And request requestParams.hayvanGuncelleme
    When method post
    Then status 200
    And print response


  Scenario: Durumu satilmis olan Hayvan Filtreleme
    Given path 'v2/pet/findByStatus'
    And params {status : 'sold'}
    When method get
    Then status 200
    And print response
    * match response[*].status contains 'sold'

  Scenario: Evcil hayvan silme
    Given path '/v2/pet/5'
    When method delete
    Then status 200
    And print response

  Scenario: Evcil hayvan silme negatif
    Given path '/v2/pet/4'
    When method delete
    Then status 404
    And print response
