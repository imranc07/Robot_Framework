*** Settings ***

Documentation    Test GUI Elements using robot

Library     SeleniumLibrary
Library    DateTime


*** Variables ***
${BASE_URL}    https://testautomationpractice.blogspot.com/
${BROWSER}    chrome
${NAME}    Lara Croft
${EMAIL}    lara@tombraider.com
${PHONE}    9211921192
${ADDRESS}    Lara Mansion
${START_DATE}    12-11-2024
${END_DATE}    15-11-2024

*** Test Cases ***

TestCase-1
    [Documentation]    Start automation
    [Tags]    Start
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    30s

TestCase-2
    [Documentation]    Enter name
    [Tags]    Name
    Element Should Be Visible    id=name
    Input Text    id=name    ${NAME}

TestCase-3
    [Documentation]    Enter email
    [Tags]    Email
    Element Should Be Visible    id=email
    Input Text    id=email    ${EMAIL}

TestCase-4
    [Documentation]    Enter phone number
    [Tags]    Phone
    Element Should Be Visible    id=phone
    Input Text    id=phone    ${PHONE}

TestCase-5
    [Documentation]     Enter address
    [Tags]    Address
    Element Should Be Visible    id=textarea
    Input Text    id=textarea    ${ADDRESS}

TestCase-6
    [Documentation]    Select gender
    [Tags]    Gender
    Element Should Be Enabled    id=female
    Click Element    female

TestCase-7
    [Documentation]    Select Day
    [Tags]     Day
    Element Should Be Enabled    id=sunday
    Click Element    sunday
    Element Should Be Enabled    id=saturday
    Click Element    saturday

TestCase-8
    [Documentation]    Select Country
    [Tags]    Country
    Element Should Be Enabled    id=country
    Select From List By Value    id=country    india

TestCase-9
    [Documentation]    Select Colour
    [Tags]    Colour
    Element Should Be Enabled    id=colors
    Select From List By Value    id=colors    green

TestCase-10
    [Documentation]    Select Sorted List
    [Tags]    Sorted List
    Element Should Be Enabled    id=animals
    Select From List By Value    id=animals    lion

TestCase-11
    [Documentation]    Select Date from Picker 1
    [Tags]    Date Picker 1

    Element Should Be Enabled    id=datepicker
    Click Element    datepicker
    Element Should Be Visible    XPATH=//*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[2]/a
    Click Element    //*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[2]/a

TestCase-12
    [Documentation]    Select date from Date Picker 2
    [Tags]    Date Picker 2
    Element Should Be Disabled    id=txtDate
    CLick Element    txtDate
    Element Should Be Visible    XPATH=//*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[6]/a
    Click Element    //*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[6]/a

TestCase-13
    [Documentation]    Select start and end date from Date Picker 3
    [Tags]    Date Picker 3
    Element Should Be Visible    id=start-date
    Input Text    id=start-date    ${START_DATE}

    Element Should Be Visible    id=end-date
    Input Text    id=end-date    ${END_DATE}

    Element Should Be Enabled    XPATH=//*[@class="date-picker-box"]/button
    Click Element    //*[@class="date-picker-box"]/button
    Page Should Contain   You selected a range of 3 days. 

TestCase-14
    [Documentation]    Drag and Drop operation
    [Tags]    dragdrop
    Drag And Drop    id=draggable    id=droppable
    Element Text Should Be    id=droppable    Dropped!


TestCase-15
    [Documentation]    Shutdown
    [Tags]    Stop
    Close All Browsers