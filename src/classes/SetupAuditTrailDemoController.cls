public with sharing class SetupAuditTrailDemoController {

    public List<String> fields {get; set;}
    public List<SetupAuditTrail> setupAuditTrailList {get; set;}

    public SetupAuditTrailDemoController() {
        this.fields = this.getFields();
        this.setupAuditTrailList = this.getSetupAuditTrail();
    }

    private List<String> getFields() {
        List<String> results = new List<String>();
        Map<String, Schema.SObjectType> m = Schema.getGlobalDescribe();
        Schema.SObjectType s = m.get('SetupAuditTrail');
        Schema.DescribeSObjectResult r = s.getDescribe();
        Map<String, Schema.SObjectField> fields = r.fields.getMap();
        for (String f : fields.KeySet()) {
            results.add(f);
        }

        return results;
    }

    private List<SetupAuditTrail> getSetupAuditTrail() {
        return [
            SELECT
                 id
                ,action
                ,section
                ,createddate
                ,createdbyid
                ,display
            FROM
                SetupAuditTrail
        ];    
    }
}