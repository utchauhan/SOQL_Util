global without sharing class SOQLUtil {
    private static final String Query_select = 'SELECT ';
    private static final String Query_where = ' WHERE ';
    private static final String Query_from = ' FROM ';
    private static final String Query_limit = ' LIMIT ';
    private static final String Security_enforced = ' WITH SECURITY ENFORCED ';

    global static String buildSOQLQUERY(String objName,String filter_name,String filter){
        Schema.sObjectType sobj = Schema.getGlobalDescribe().get(objName);
        DescribeSObjectResult objectdescribe = sobj.getDescribe();
        Map<String, Schema.SObjectField> fieldMap = objectdescribe.fields.getMap();

        String whereClause = filter_name+' = '+'\''+filter+'\'';
        String query = buildqueryallstring(fieldMap.values(),objectdescribe,whereClause,1);

        return query;
    }    
    private static String buildqueryallstring(List<Schema.SObjectField> allfields, DescribeSObjectResult obj, String filter, Integer rLimit){
        String query = Query_select;
        for(Scheme.SObjectField dfr : allfields){
            query += dfr.getDescribe().getName() + ',';
        }
        query = query.subString(0,query.length()-1);
        if(!String.isBlank(filter)){
            query += Query_where;
            query += filter;
        }
        query += Security_enforced;
        query += Query_limit;
        query += rLimit;
        return query;
    }
}
