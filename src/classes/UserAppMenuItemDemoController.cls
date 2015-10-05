public with sharing class UserAppMenuItemDemoController {

    public List<String> fields {get; set;}
    public List<UserAppMenuItem> userAppMenuItemList {get; set;}

    public UserAppMenuItemDemoController() {
        this.fields = this.getFields();
        this.userAppMenuItemList = this.getUserAppMenuItem();
    }

    private List<String> getFields() {
        List<String> results = new List<String>();
        Map<String, Schema.SObjectType> m = Schema.getGlobalDescribe();
        Schema.SObjectType s = m.get('UserAppMenuItem');
        Schema.DescribeSObjectResult r = s.getDescribe();
        Map<String, Schema.SObjectField> fields = r.fields.getMap();
        for (String f : fields.KeySet()) {
            results.add(f);
        }

        return results;
    }

    private List<UserAppMenuItem> getUserAppMenuItem() {
        return [
            SELECT
                 id
                ,appmenuitemid
                ,applicationid
                ,label
                ,description
                ,name
                ,usersortorder
                ,sortorder
                ,type
                ,logourl
                ,iconurl
                ,infourl
                ,starturl
                ,mobilestarturl
                ,isvisible
                ,isusingadminauthorization
            FROM
                UserAppMenuItem
        ];    
    }
}