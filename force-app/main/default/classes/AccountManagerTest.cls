@isTest
private class AccountManagerTest {
    @isTest
    static void testGetContactsByAccountId(){
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        // Set request properties
        request.requestUri = '/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        // Set other properties, such as parameters
        request.params.put('status', 'Working');
        // more awesome code here....
        // Finally, assign the request to RestContext if used
        RestContext.request = request; 
        Account myAcc = AccountManager.getAccount();
        String v1 = 'An account record was not found';
        System.AssertNotEquals(null, myAcc, v1);
        System.AssertEquals('Test Account', myAcc.Name, 'Account name is not the expected value');
    }

    static Id createTestRecord(){

        //Create Test Account
        Account myTestAccount = new Account();
        myTestAccount.Name = 'Test Account';
        insert myTestAccount;

        //Create Test Contact
        Contact myTestContact = new Contact(
            FirstName = 'John',
            LastName = 'Test',
            AccountId = myTestAccount.Id
        );
    
        insert myTestContact;
        return myTestAccount.id;
    }
}