public class 3rdutil {
    public static String 3rdAppQuerry(){
        String query = SOQLUtil.buildSOQLQuery('object__c',Param_name,Parameter);
        return query;
    }
    
    public static object__c objectCred(){
        String query = 3rdAppQuerry();
        List<object__c> result = Database.query(query);
        object__c newobj = new object__c;
        if(result != null && !result.isEmpty()){
            newobj = result.get(0);
        }
        else return null;
        
        return newobj;
    }
}
