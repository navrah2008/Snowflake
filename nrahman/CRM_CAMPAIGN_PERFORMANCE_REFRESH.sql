Alter external table CRM_CAMPAIGN_PERFORMANCE_EXT Refresh;

MERGE INTO CRM_EM_INTERACTIONS BASE
USING CRM_CAMPAIGN_PERFORMANCE_EXT PRE
ON Base.CAMPAIGN_CD = Pre.CAMPAIGN_CD
AND Base.DAY_DT = Pre.DAY_DT
AND Base.CELL_CD = Pre.CELL_CD
WHEN MATCHED
THEN
UPDATE
SET base.CAMPAIGN_CD=Pre.CAMPAIGN_CD,
base.DAY_DT=Pre.DAY_DT,
base.CELL_CD=Pre.CELL_CD,
base.EMAIL_SENT_CNT=Pre.EMAIL_SENT_CNT,
base.EMAIL_OPEN_CNT=Pre.EMAIL_OPEN_CNT,
base.EMAIL_BOUNCE_CNT=Pre.EMAIL_BOUNCE_CNT,
base.EMAIL_CLICK_CNT=Pre.EMAIL_CLICK_CNT,
base.EMAIL_UNSUBSCRIBE_CNT=Pre.EMAIL_UNSUBSCRIBE_CNT,
base.EMAIL_DELIVERED_CNT=Pre.EMAIL_DELIVERED_CNT,
base.EMAIL_OPEN_RATE=Pre.EMAIL_OPEN_RATE,
base.EMAIL_CLICK_RATE=Pre.EMAIL_CLICK_RATE,
base.EMAIL_CTO_RATE=Pre.EMAIL_CTO_RATE,
base.EMAIL_BOUNCE_RATE=Pre.EMAIL_BOUNCE_RATE,
base.EMAIL_UNSUBSCRIBE_RATE=Pre.EMAIL_UNSUBSCRIBE_RATE,
base.EMAIL_DELIVERY_RATE=Pre.EMAIL_DELIVERY_RATE,
base.EMAIL_REACTIVATE_CUST_CNT=Pre.EMAIL_REACTIVATE_CUST_CNT,
base.EMAIL_NEW_CUST_CNT=Pre.EMAIL_NEW_CUST_CNT,
base.UPDATE_TSTMP=CURRENT_TIMESTAMP()

WHEN NOT MATCHED
THEN
INSERT (
base.DAY_DT,
base.CAMPAIGN_CD,
base.CELL_CD,
base.EMAIL_SENT_CNT,
base.EMAIL_OPEN_CNT,
base.EMAIL_BOUNCE_CNT,
base.EMAIL_CLICK_CNT,
base.EMAIL_UNSUBSCRIBE_CNT,
base.EMAIL_DELIVERED_CNT,
base.EMAIL_OPEN_RATE,
base.EMAIL_CLICK_RATE,
base.EMAIL_CTO_RATE,
base.EMAIL_BOUNCE_RATE,
base.EMAIL_UNSUBSCRIBE_RATE,
base.EMAIL_DELIVERY_RATE,
base.EMAIL_REACTIVATE_CUST_CNT,
base.EMAIL_NEW_CUST_CNT,
base.UPDATE_TSTMP,
base.LOAD_TSTMP
)
VALUES (
pre.DAY_DT,
pre.CAMPAIGN_CD,
pre.CELL_CD,
pre.EMAIL_SENT_CNT,
pre.EMAIL_OPEN_CNT,
pre.EMAIL_BOUNCE_CNT,
pre.EMAIL_CLICK_CNT,
pre.EMAIL_UNSUBSCRIBE_CNT,
pre.EMAIL_DELIVERED_CNT,
pre.EMAIL_OPEN_RATE,
pre.EMAIL_CLICK_RATE,
pre.EMAIL_CTO_RATE,
pre.EMAIL_BOUNCE_RATE,
pre.EMAIL_UNSUBSCRIBE_RATE,
pre.EMAIL_DELIVERY_RATE,
pre.EMAIL_REACTIVATE_CUST_CNT,
pre.EMAIL_NEW_CUST_CNT,
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP()
);
