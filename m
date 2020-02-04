Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC79D151E04
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 17:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbgBDQQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 11:16:03 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:25863 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727433AbgBDQQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 11:16:03 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Feb 2020 21:45:58 +0530
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Feb 2020 21:45:33 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id ED47821447; Tue,  4 Feb 2020 21:45:31 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, robh@kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Bug fixes while collecting controller memory dump
Date:   Tue,  4 Feb 2020 21:45:29 +0530
Message-Id: <1580832929-2067-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch will fix the below issues
   1.Fixed race conditions while accessing memory dump state flags.
   2.Updated with actual context of timer in hci_memdump_timeout()
   3.Updated injecting hardware error event if the dumps failed to receive.
   4.Once timeout is triggered, stopping the memory dump collections.

Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 104 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index eacc65b..ea956c3 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -69,7 +69,8 @@ enum qca_flags {
 	QCA_IBS_ENABLED,
 	QCA_DROP_VENDOR_EVENT,
 	QCA_SUSPENDING,
-	QCA_MEMDUMP_COLLECTION
+	QCA_MEMDUMP_COLLECTION,
+	QCA_HW_ERROR_EVENT
 };
 
 
@@ -150,6 +151,7 @@ struct qca_data {
 	struct completion drop_ev_comp;
 	wait_queue_head_t suspend_wait_q;
 	enum qca_memdump_states memdump_state;
+	spinlock_t hci_memdump_lock;
 
 	/* For debugging purpose */
 	u64 ibs_sent_wacks;
@@ -524,19 +526,19 @@ static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
 
 static void hci_memdump_timeout(struct timer_list *t)
 {
-	struct qca_data *qca = from_timer(qca, t, tx_idle_timer);
+	struct qca_data *qca = from_timer(qca, t, memdump_timer);
 	struct hci_uart *hu = qca->hu;
-	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
-	char *memdump_buf = qca_memdump->memdump_buf_tail;
+	unsigned long flags;
 
-	bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
-	/* Inject hw error event to reset the device and driver. */
-	hci_reset_dev(hu->hdev);
-	vfree(memdump_buf);
-	kfree(qca_memdump);
+	spin_lock_irqsave(&qca->hci_memdump_lock, flags);
 	qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
+	if (!test_bit(QCA_HW_ERROR_EVENT, &qca->flags)) {
+		/* Inject hw error event to reset the device and driver. */
+		hci_reset_dev(hu->hdev);
+	}
+
 	del_timer(&qca->memdump_timer);
-	cancel_work_sync(&qca->ctrl_memdump_evt);
+	spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
 }
 
 /* Initialize protocol */
@@ -558,6 +560,7 @@ static int qca_open(struct hci_uart *hu)
 	skb_queue_head_init(&qca->tx_wait_q);
 	skb_queue_head_init(&qca->rx_memdump_q);
 	spin_lock_init(&qca->hci_ibs_lock);
+	spin_lock_init(&qca->hci_memdump_lock);
 	qca->workqueue = alloc_ordered_workqueue("qca_wq", 0);
 	if (!qca->workqueue) {
 		BT_ERR("QCA Workqueue not initialized properly");
@@ -960,14 +963,25 @@ static void qca_controller_memdump(struct work_struct *work)
 	char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
 	u16 seq_no;
 	u32 dump_size;
+	unsigned long flags;
 
 	while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
 
+		spin_lock_irqsave(&qca->hci_memdump_lock, flags);
+		/* Skip processing the received packets if timeout detected. */
+		if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
+			spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
+			return;
+		}
+
 		if (!qca_memdump) {
 			qca_memdump = kzalloc(sizeof(struct qca_memdump_data),
 					      GFP_ATOMIC);
-			if (!qca_memdump)
+			if (!qca_memdump) {
+				spin_unlock_irqrestore(&qca->hci_memdump_lock,
+								flags);
 				return;
+			}
 
 			qca->qca_memdump = qca_memdump;
 		}
@@ -992,6 +1006,8 @@ static void qca_controller_memdump(struct work_struct *work)
 			if (!(dump_size)) {
 				bt_dev_err(hu->hdev, "Rx invalid memdump size");
 				kfree_skb(skb);
+				spin_unlock_irqrestore(&qca->hci_memdump_lock,
+							flags);
 				return;
 			}
 
@@ -1001,7 +1017,24 @@ static void qca_controller_memdump(struct work_struct *work)
 				  msecs_to_jiffies(MEMDUMP_TIMEOUT_MS)));
 
 			skb_pull(skb, sizeof(dump_size));
+
+			/* vmalloc() might go to sleep while trying to allocate
+			 * memory.As calling sleep function under spin lock is
+			 * not allowed so unlocking spin lock and will be locked
+			 * again after vmalloc().
+			 */
+			spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
 			memdump_buf = vmalloc(dump_size);
+			spin_lock_irqsave(&qca->hci_memdump_lock, flags);
+			/* Skip processing the received packets if timeout
+			 * detected.
+			 */
+			if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
+				spin_unlock_irqrestore(&qca->hci_memdump_lock,
+							flags);
+				return;
+			}
+
 			qca_memdump->memdump_buf_head = memdump_buf;
 			qca_memdump->memdump_buf_tail = memdump_buf;
 		}
@@ -1016,6 +1049,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca_memdump);
 			kfree_skb(skb);
 			qca->qca_memdump = NULL;
+			spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
 			return;
 		}
 
@@ -1044,18 +1078,37 @@ static void qca_controller_memdump(struct work_struct *work)
 			bt_dev_info(hu->hdev, "QCA writing crash dump of size %d bytes",
 				   qca_memdump->received_dump);
 			memdump_buf = qca_memdump->memdump_buf_head;
+
+			/* dev_coredumpv() might go to sleep.As calling sleep
+			 * function under spin lock is not allowed so unlocking
+			 * spin lock and will be locked again after
+			 * dev_coredumpv().
+			 */
+			spin_unlock_irqrestore(&qca->hci_memdump_lock,
+						flags);
 			dev_coredumpv(&hu->serdev->dev, memdump_buf,
 				      qca_memdump->received_dump, GFP_KERNEL);
+			spin_lock_irqsave(&qca->hci_memdump_lock, flags);
+			if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
+				spin_unlock_irqrestore(&qca->hci_memdump_lock,
+							flags);
+				return;
+			}
+
 			del_timer(&qca->memdump_timer);
 			kfree(qca->qca_memdump);
 			qca->qca_memdump = NULL;
 			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
+			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 		}
+
+		spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
 	}
 
 }
 
-int qca_controller_memdump_event(struct hci_dev *hdev, struct sk_buff *skb)
+static int qca_controller_memdump_event(struct hci_dev *hdev,
+					struct sk_buff *skb)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
@@ -1408,19 +1461,25 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
 	struct qca_data *qca = hu->priv;
 	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
 	char *memdump_buf = NULL;
+	unsigned long flags;
 
 	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
 			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
 
 	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
-	if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
+	if (qca->memdump_state == QCA_MEMDUMP_IDLE ||
+	    qca->memdump_state == QCA_MEMDUMP_COLLECTING) {
 		bt_dev_err(hu->hdev, "Clearing the buffers due to timeout");
+		spin_lock_irqsave(&qca->hci_memdump_lock, flags);
 		if (qca_memdump)
-			memdump_buf = qca_memdump->memdump_buf_tail;
+			memdump_buf = qca_memdump->memdump_buf_head;
 		vfree(memdump_buf);
 		kfree(qca_memdump);
+		qca->qca_memdump = NULL;
 		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
 		del_timer(&qca->memdump_timer);
+		skb_queue_purge(&qca->rx_memdump_q);
+		spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
 		cancel_work_sync(&qca->ctrl_memdump_evt);
 	}
 }
@@ -1429,7 +1488,11 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
+	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
+	char *memdump_buf = NULL;
+	unsigned long flags;
 
+	set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 	bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
 
 	if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
@@ -1448,7 +1511,20 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		 */
 		bt_dev_info(hdev, "waiting for dump to complete");
 		qca_wait_for_dump_collection(hdev);
+	} else if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
+		bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
+		spin_lock_irqsave(&qca->hci_memdump_lock, flags);
+		if (qca_memdump)
+			memdump_buf = qca_memdump->memdump_buf_head;
+		vfree(memdump_buf);
+		kfree(qca_memdump);
+		qca->qca_memdump = NULL;
+		skb_queue_purge(&qca->rx_memdump_q);
+		spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
+		cancel_work_sync(&qca->ctrl_memdump_evt);
 	}
+
+	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
 static void qca_cmd_timeout(struct hci_dev *hdev)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

