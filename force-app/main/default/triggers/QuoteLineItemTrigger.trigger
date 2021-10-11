trigger QuoteLineItemTrigger on QuoteLineItem (after insert, after update) {
    if(Trigger.isAfter){
        QuoteLineItemTriggerHandler.updateOpportunityLineItems(Trigger.new);
    }
}