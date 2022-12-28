*** Settings ***
Documentation       Insert the sales data for the week and export it as a PDF.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.HTTP
Library             RPA.Excel.Files
Library             RPA.PDF
Library             Collections
Resource            .history/tasks_20221227123022.robot
Resource            .history/tasks_20221228111914.robot


*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Create a list and append List
    Create two list and combine two List
    Copying a list
    Counting a value in the list
    Get Values form list
    Get Index value From List
    Slice the list
    Insert a value to the list
    Remove all the duplicates in a list
    Removing a single value from the list
    Removing multiple values from the given list
    Reversing a list
    Replacing a value in the list
    Sorting the given List


*** Keywords ***
#Append to list doesn't work if the list is not created with the keyword createList
Create a list and append List
    ${s}=    Create List    1    2
    Append To List    ${s}    3
    Log To Console    ${s}

Create two list and combine two List
    ${list1}=    Create List    1    2    3
    ${list2}=    Create List    2    3    4
    ${combinedList}=    Combine Lists    ${list1}    ${list2}
    Log To Console    ${combinedList}

Copying a list
    #Copying a list from another has a special feature.if a list is copied and its value are being changed in original list,copied list doesnt change whereaes original list only changes
    ${list1}=    Create List    1    2    3    4
    ${w}=    Copy List    ${list1}
    Append To List    ${list1}    3
    Log To Console    ${w}
    Log To Console    ${list1}

Counting a value in the list
    ${list1}=    Create List    1    2    3    4    3
    ${countedValues}=    Count Values In List    ${list1}    3
    Log To Console    ${countedValues}

Get Values form list
    ${list1}=    Create List    1    2    3    4    3
    ${x}=    Get From List    ${list1}    2
    Log To Console    ${x}

Get Index value From List
    ${list1}=    Create List    1    2    3    4
    ${x}=    Get Index From List    ${list1}    2
    Log To Console    ${x}

Slice the list
    ${list1}=    Create List    1    2    3    4
    ${X}=    Get Slice From List    ${list1}    1    3
    Log To Console    ${x}

Insert a value to the list
    ${list1}=    Create List    1    2    3    4
    Insert Into List    ${list1}    0    xxx
    Log To Console    ${list1}

Remove all the duplicates in a list
#Here if we want to remove duplicates it requires an another list which contains no duplicate values of the previous list
    ${list1}=    Create List    1    2    3    4    2
    ${list2}=    Create List    2    3
    ${check}=    Remove Duplicates    ${list1}
    Log To Console    ${list1}
    Log To Console    ${check}

Removing a single value from the list
#it works based on index
#It removes values from the list based on index not value and it returns the removed value from the list
    ${list1}=    Create List    1    2    3    4    2
    ${x}=    Remove From List    ${list1}    3
    Log To Console    ${x}
    Log To Console    ${list1}

Removing multiple values from the given list
#it works based on values not index
    ${list1}=    Create List    1    2    3    4    2
    Remove Values From List    ${list1}    1    2
    Log To Console    ${list1}

Reversing a list
    ${list1}=    Create List    1    2    3    4    2
    Reverse List    ${list1}
    Log To Console    ${list1}

Replacing a value in the list
    ${list1}=    Create List    1    2    3    4    2
    Set List Value    ${list1}    1    xxx
    Log To Console    ${list1}

Sorting the given List
    ${list1}=    Create List    1    2    3    4    2
    Sort List    ${list1}
    Log To Console    ${list1}
