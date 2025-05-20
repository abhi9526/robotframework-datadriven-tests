*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    ../../testdata/users.csv
Suite Setup       Open my Browser
Suite Teardown    Close All Browsers
Test Template     Invalid Login

*** Test Cases ***
Login Test With Excel

*** Keywords ***
Open my Browser
    Open Browser    https://the-internet.herokuapp.com/login    chrome
    Maximize Browser Window

Invalid Login
    [Arguments]    ${username}    ${password}
    Input Text    xpath=//input[@id="username"]    ${username}
    Input Text    xpath=//input[@id="password"]    ${password}
    Click Button  xpath=//button[@type="submit"]
    Page Should Contain    Your username is invalid!