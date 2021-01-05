***Settings***
Library             SeleniumLibrary
Variables           variables.yaml

***Keywords***
Play
    FOR    ${i}    IN RANGE    999999
        #Get the current count of elements in the game container
        ${state1}=          Compute the sum of all the numbers
        Basic Moves
        #Get the count after basic algorithm
        ${state2}=          Compute the sum of all the numbers

        #will execute if the initial and outcome state is still the same after the basic algorithm
        Run Keyword if      ${state1}==${state2}    ShakeUp  

        #Check if the bot lost
        ${gameOver}=        Check Game Over Screen
        Exit For Loop If    ${gameOver}
    END

Basic Moves
    #The basic moves aims that the lasrgest tile should be at the lower left corner (based on how most of the players plays it)
    FOR    ${i}    IN RANGE    5
        Press keys      ${game}     ARROW_DOWN
        Press keys      ${game}     ARROW_LEFT
    END

Shake Up
    Press keys          ${game}     ARROW_RIGHT
    Press keys          ${game}     ARROW_LEFT

Check Game Over Screen
    ${gameOverVisibility}=  Run keyword and return status       Page Should Contain Element     ${gameOverScreen}
    [Return]            ${gameOverVisibility}

Compute the sum of all the numbers
    ${value}=           Get Element Count       ${tileContainer}
    log to console      ${value}
    [Return]            ${value}