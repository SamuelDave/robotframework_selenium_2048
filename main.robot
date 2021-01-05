*** Setting ***
Documentation    2048 Simple Bot (a bot that plays the game and is yet to win)
Library          SeleniumLibrary
Resource         Resources/moves.robot

Suite Setup     Launch Chrome
Suite Teardown  Close All Browsers

***Keywords***
Launch Chrome
    Open Browser                    https://play2048.co/        chrome
    Maximize Browser Window         
    Click Element                   ${closeAdButton}
    Scroll Element Into View        ${game}

***Test Cases***
Test Run
    Play

    #TO DO: Get all the sum of all the values in the table