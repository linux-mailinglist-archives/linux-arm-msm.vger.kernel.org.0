Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD49615AC59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 16:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgBLPvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 10:51:00 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:15146 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727458AbgBLPvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 10:51:00 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Feb 2020 21:19:44 +0530
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 12 Feb 2020 21:19:18 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id AF9D3214A7; Wed, 12 Feb 2020 21:19:16 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, robh@kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v2] Bluetooth: hci_qca: Bug fixes while collecting controller memory dump
Date:   Wed, 12 Feb 2020 21:18:28 +0530
Message-Id: <1581522508-31337-1-git-send-email-gubbaven@codeaurora.org>
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

Possible scenarios while collecting memory dump:

Scenario 1:

Memdump event from firmware
Some number of memdump events with seq #
Hw error event
Reset

Scenario 2:

Memdump event from firmware
Some number of memdump events with seq #
Timeout schedules hw_error_event if hw error event is not received already
hw_error_event clears the memdump activity
reset

Scenario 3:

hw_error_event sends memdump command to firmware and waits for completion
Some number of memdump events with seq #
hw error event
reset

Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 96 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 27 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index eacc65b..80ee838 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -29,6 +29,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/serdev.h>
+#include <linux/mutex.h>
 #include <asm/unaligned.h>
 
 #include <net/bluetooth/bluetooth.h>
@@ -69,7 +70,8 @@ enum qca_flags {
 	QCA_IBS_ENABLED,
 	QCA_DROP_VENDOR_EVENT,
 	QCA_SUSPENDING,
-	QCA_MEMDUMP_COLLECTION
+	QCA_MEMDUMP_COLLECTION,
+	QCA_HW_ERROR_EVENT
 };
 
 
@@ -145,11 +147,13 @@ struct qca_data {
 	struct work_struct ws_rx_vote_off;
 	struct work_struct ws_tx_vote_off;
 	struct work_struct ctrl_memdump_evt;
+	struct work_struct ctrl_memdump_timeout;
 	struct qca_memdump_data *qca_memdump;
 	unsigned long flags;
 	struct completion drop_ev_comp;
 	wait_queue_head_t suspend_wait_q;
 	enum qca_memdump_states memdump_state;
+	struct mutex hci_memdump_lock;
 
 	/* For debugging purpose */
 	u64 ibs_sent_wacks;
@@ -524,21 +528,33 @@ static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
 
 static void hci_memdump_timeout(struct timer_list *t)
 {
-	struct qca_data *qca = from_timer(qca, t, tx_idle_timer);
-	struct hci_uart *hu = qca->hu;
-	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
-	char *memdump_buf = qca_memdump->memdump_buf_tail;
-
-	bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
-	/* Inject hw error event to reset the device and driver. */
-	hci_reset_dev(hu->hdev);
-	vfree(memdump_buf);
-	kfree(qca_memdump);
-	qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
+	struct qca_data *qca = from_timer(qca, t, memdump_timer);
+
+	queue_work(qca->workqueue, &qca->ctrl_memdump_timeout);
 	del_timer(&qca->memdump_timer);
-	cancel_work_sync(&qca->ctrl_memdump_evt);
 }
 
+static void qca_controller_memdump_timeout(struct work_struct *work)
+{
+	struct qca_data *qca = container_of(work, struct qca_data,
+					ctrl_memdump_timeout);
+	struct hci_uart *hu = qca->hu;
+
+	mutex_lock(&qca->hci_memdump_lock);
+	if (test_bit(QCA_MEMDUMP_COLLECTION, &qca->flags)) {
+		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
+		if (!test_bit(QCA_HW_ERROR_EVENT, &qca->flags)) {
+			/* Inject hw error event to reset the device
+			 * and driver.
+			 */
+			hci_reset_dev(hu->hdev);
+		}
+	}
+
+	mutex_unlock(&qca->hci_memdump_lock);
+}
+
+
 /* Initialize protocol */
 static int qca_open(struct hci_uart *hu)
 {
@@ -558,6 +574,7 @@ static int qca_open(struct hci_uart *hu)
 	skb_queue_head_init(&qca->tx_wait_q);
 	skb_queue_head_init(&qca->rx_memdump_q);
 	spin_lock_init(&qca->hci_ibs_lock);
+	mutex_init(&qca->hci_memdump_lock);
 	qca->workqueue = alloc_ordered_workqueue("qca_wq", 0);
 	if (!qca->workqueue) {
 		BT_ERR("QCA Workqueue not initialized properly");
@@ -570,6 +587,7 @@ static int qca_open(struct hci_uart *hu)
 	INIT_WORK(&qca->ws_rx_vote_off, qca_wq_serial_rx_clock_vote_off);
 	INIT_WORK(&qca->ws_tx_vote_off, qca_wq_serial_tx_clock_vote_off);
 	INIT_WORK(&qca->ctrl_memdump_evt, qca_controller_memdump);
+	INIT_WORK(&qca->ctrl_memdump_timeout, qca_controller_memdump_timeout);
 	init_waitqueue_head(&qca->suspend_wait_q);
 
 	qca->hu = hu;
@@ -963,11 +981,20 @@ static void qca_controller_memdump(struct work_struct *work)
 
 	while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
 
+		mutex_lock(&qca->hci_memdump_lock);
+		/* Skip processing the received packets if timeout detected. */
+		if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
+			mutex_unlock(&qca->hci_memdump_lock);
+			return;
+		}
+
 		if (!qca_memdump) {
 			qca_memdump = kzalloc(sizeof(struct qca_memdump_data),
 					      GFP_ATOMIC);
-			if (!qca_memdump)
+			if (!qca_memdump) {
+				mutex_unlock(&qca->hci_memdump_lock);
 				return;
+			}
 
 			qca->qca_memdump = qca_memdump;
 		}
@@ -992,6 +1019,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			if (!(dump_size)) {
 				bt_dev_err(hu->hdev, "Rx invalid memdump size");
 				kfree_skb(skb);
+				mutex_unlock(&qca->hci_memdump_lock);
 				return;
 			}
 
@@ -1016,6 +1044,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca_memdump);
 			kfree_skb(skb);
 			qca->qca_memdump = NULL;
+			mutex_unlock(&qca->hci_memdump_lock);
 			return;
 		}
 
@@ -1050,12 +1079,16 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca->qca_memdump);
 			qca->qca_memdump = NULL;
 			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
+			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 		}
+
+		mutex_unlock(&qca->hci_memdump_lock);
 	}
 
 }
 
-int qca_controller_memdump_event(struct hci_dev *hdev, struct sk_buff *skb)
+static int qca_controller_memdump_event(struct hci_dev *hdev,
+					struct sk_buff *skb)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
@@ -1406,30 +1439,21 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
-	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
-	char *memdump_buf = NULL;
 
 	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
 			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
 
 	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
-	if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
-		bt_dev_err(hu->hdev, "Clearing the buffers due to timeout");
-		if (qca_memdump)
-			memdump_buf = qca_memdump->memdump_buf_tail;
-		vfree(memdump_buf);
-		kfree(qca_memdump);
-		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
-		del_timer(&qca->memdump_timer);
-		cancel_work_sync(&qca->ctrl_memdump_evt);
-	}
 }
 
 static void qca_hw_error(struct hci_dev *hdev, u8 code)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
+	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
+	char *memdump_buf = NULL;
 
+	set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 	bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
 
 	if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
@@ -1449,6 +1473,24 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		bt_dev_info(hdev, "waiting for dump to complete");
 		qca_wait_for_dump_collection(hdev);
 	}
+
+	if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
+		bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
+		mutex_lock(&qca->hci_memdump_lock);
+		if (qca_memdump)
+			memdump_buf = qca_memdump->memdump_buf_head;
+		vfree(memdump_buf);
+		kfree(qca_memdump);
+		qca->qca_memdump = NULL;
+		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
+		del_timer(&qca->memdump_timer);
+		skb_queue_purge(&qca->rx_memdump_q);
+		mutex_unlock(&qca->hci_memdump_lock);
+		cancel_work_sync(&qca->ctrl_memdump_timeout);
+		cancel_work_sync(&qca->ctrl_memdump_evt);
+	}
+
+	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
 static void qca_cmd_timeout(struct hci_dev *hdev)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

