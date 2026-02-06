*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Open SauceDemo
    Open Browser  https://www.saucedemo.com/     firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Page Should Contain Element    //*[@id="shopping_cart_container"]
    Close Browser

*** Test Cases ***
Right username wrong password
    Open Browser  https://www.saucedemo.com/     firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password    sdafasfdasdf
    Click Button    id=login-button

    Page Should Not Contain Element    //*[@id="shopping_cart_container"]
    Page Should Contain    text=Epic sadface: Username and password do not match any user in this service
    Close Browser

*** Test Cases ***
Wrong username
    Open Browser  https://www.saucedemo.com/     firefox
    Input Text    id=user-name    wronguser
    Input Password    id=password    rightpassword
    Click Button    id=login-button

    Page Should Not Contain Element    //*[@id="shopping_cart_container"]
    Page Should Contain    text=Epic sadface: Username and password do not match any user in this service
    Close Browser

*** Test Cases ***
Wrong username
    Open Browser  https://www.saucedemo.com/     firefox
    Input Password    id=password    rightpassword
    Click Button    id=login-button

    Page Should Not Contain Element    //*[@id="shopping_cart_container"]
    Page Should Contain    text=Epic sadface: Username is required
    Close Browser

*** Test Cases ***
Wrong username
    Open Browser  https://www.saucedemo.com/     firefox
    Input Text    id=user-name    wronguser
    Click Button    id=login-button

    Page Should Not Contain Element    //*[@id="shopping_cart_container"]
    Page Should Contain    text=Epic sadface: Password is required
    Close Browser