@RestResource(urlMapping='/Accounts/*/contacts/')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the Account Id from the end of the URL
        String AccountId = request.requestURI.substringBetween('/Accounts/', '/');
        // grab the Account Name
        Account myAcc = [SELECT Id, Name,  (SELECT Id, Name FROM Contacts) FROM Account WHERE Id = :AccountId LIMIT 1];
    return myAcc;
    }
}