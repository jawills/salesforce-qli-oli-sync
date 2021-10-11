public class QuoteLineItemTriggerHandler {
    public static void updateOpportunityLineItems(List<QuoteLineItem> qlis){
        Map<Id, QuoteLineItem> qliMap = new Map<Id, QuoteLineItem>();
        for(QuoteLineItem qli : qlis){
            if(qli.Opportunity_Line_Item_Id__c != null){
                qliMap.put(qli.Opportunity_Line_Item_Id__c, qli);
            }
        }

        List<OpportunityLineItem> olis = [SELECT Id FROM OpportunityLineItem WHERE Id in : qliMap.keySet()];

        for(OpportunityLineItem oli : olis){
            /// Map Fields
            oli.shipment_date__c = qliMap.get(oli.Id).shipment_date__c;
            oli.Warehouse__c = qliMap.get(oli.Id).Account__c;

        }

        update olis;
    }
}
