Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A05D15E801
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 17:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404559AbgBNQRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 11:17:47 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:21101 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404552AbgBNQRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 11:17:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581697066; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=BrhdK7FVgZzmzOzx/07qWewoXds4IOKGRXRuVesHqR8=; b=POEJ+DQPNv5ycWA6AEGAbZrJrjeEK80pxHfWzhrepjGAcbjj/JS5SG9YyfK/gMryigKT1Rgj
 vII+Y0D7/mP+E9g9Jm7CzxCHN8/DEodyvTMuMfV39Qu+0Z1mi+JHBrg+ZSig8Yd49xxcrYHU
 ldsD3c9diBTHLgcMG1hieL+Cv8o=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e46c81c.7efdac11a3e8-smtp-out-n03;
 Fri, 14 Feb 2020 16:17:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 88A7CC447B6; Fri, 14 Feb 2020 16:17:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B57B6C433A2;
        Fri, 14 Feb 2020 16:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B57B6C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, yshavit@google.com,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v4] Bluetooth: hci_qca: Bug fixes while collecting controller memory dump
Date:   Fri, 14 Feb 2020 21:47:15 +0530
Message-Id: <20200214161715.2166-1-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>

This patch will fix the below issues
 1. Discarding memory dump events if memdump state is moved to
    MEMDUMP_TIMEOUT.
 2. Fixed race conditions between qca_hw_error() and qca_controller_memdump
    while free memory dump buffers using mutex lock
 3. Moved timeout timer to delayed work queue
 4. Injecting HW error event in a case when dumps failed to receive and HW
    error event is not yet received.
 5. Clearing hw error and command timeout function callbacks before
    sending pre shutdown command.

 Collecting memory dump will follow any of the below sequence.

 Sequence 1:
   Receiving Memory dump events from the controller
   Received entire dump in stipulated time
   Received HW error event from the controller
   Controller Reset from HOST

 Sequence 2:
   Receiving Memory dump events from the controller
   Failed to Receive entire dump in stipulated time
   A Timeout schedules and if no HW error event received a fake HW
     error event will be injected.
   Controller Reset from HOST.

 Sequence 3:
   Received HW error event
   HOST trigger SSR by sending crash packet to controller.
   Received entire dump in stipulated time
   Controller Reset from HOST

Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
 drivers/bluetooth/hci_qca.c | 101 ++++++++++++++++++++++++------------
 1 file changed, 67 insertions(+), 34 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 8e95bfe750d4..1e4d6118d9bf 100644
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
 
 
@@ -138,18 +140,19 @@ struct qca_data {
 	u32 tx_idle_delay;
 	struct timer_list wake_retrans_timer;
 	u32 wake_retrans;
-	struct timer_list memdump_timer;
 	struct workqueue_struct *workqueue;
 	struct work_struct ws_awake_rx;
 	struct work_struct ws_awake_device;
 	struct work_struct ws_rx_vote_off;
 	struct work_struct ws_tx_vote_off;
 	struct work_struct ctrl_memdump_evt;
+	struct delayed_work ctrl_memdump_timeout;
 	struct qca_memdump_data *qca_memdump;
 	unsigned long flags;
 	struct completion drop_ev_comp;
 	wait_queue_head_t suspend_wait_q;
 	enum qca_memdump_states memdump_state;
+	struct mutex hci_memdump_lock;
 
 	/* For debugging purpose */
 	u64 ibs_sent_wacks;
@@ -522,23 +525,28 @@ static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
 		hci_uart_tx_wakeup(hu);
 }
 
-static void hci_memdump_timeout(struct timer_list *t)
+
+static void qca_controller_memdump_timeout(struct work_struct *work)
 {
-	struct qca_data *qca = from_timer(qca, t, tx_idle_timer);
+	struct qca_data *qca = container_of(work, struct qca_data,
+					ctrl_memdump_timeout.work);
 	struct hci_uart *hu = qca->hu;
-	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
-	char *memdump_buf = qca_memdump->memdump_buf_tail;
-
-	bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
-	/* Inject hw error event to reset the device and driver. */
-	hci_reset_dev(hu->hdev);
-	vfree(memdump_buf);
-	kfree(qca_memdump);
-	qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
-	del_timer(&qca->memdump_timer);
-	cancel_work_sync(&qca->ctrl_memdump_evt);
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
 }
 
+
 /* Initialize protocol */
 static int qca_open(struct hci_uart *hu)
 {
@@ -558,6 +566,7 @@ static int qca_open(struct hci_uart *hu)
 	skb_queue_head_init(&qca->tx_wait_q);
 	skb_queue_head_init(&qca->rx_memdump_q);
 	spin_lock_init(&qca->hci_ibs_lock);
+	mutex_init(&qca->hci_memdump_lock);
 	qca->workqueue = alloc_ordered_workqueue("qca_wq", 0);
 	if (!qca->workqueue) {
 		BT_ERR("QCA Workqueue not initialized properly");
@@ -570,6 +579,8 @@ static int qca_open(struct hci_uart *hu)
 	INIT_WORK(&qca->ws_rx_vote_off, qca_wq_serial_rx_clock_vote_off);
 	INIT_WORK(&qca->ws_tx_vote_off, qca_wq_serial_tx_clock_vote_off);
 	INIT_WORK(&qca->ctrl_memdump_evt, qca_controller_memdump);
+	INIT_DELAYED_WORK(&qca->ctrl_memdump_timeout,
+			  qca_controller_memdump_timeout);
 	init_waitqueue_head(&qca->suspend_wait_q);
 
 	qca->hu = hu;
@@ -596,7 +607,6 @@ static int qca_open(struct hci_uart *hu)
 
 	timer_setup(&qca->tx_idle_timer, hci_ibs_tx_idle_timeout, 0);
 	qca->tx_idle_delay = IBS_HOST_TX_IDLE_TIMEOUT_MS;
-	timer_setup(&qca->memdump_timer, hci_memdump_timeout, 0);
 
 	BT_DBG("HCI_UART_QCA open, tx_idle_delay=%u, wake_retrans=%u",
 	       qca->tx_idle_delay, qca->wake_retrans);
@@ -677,7 +687,6 @@ static int qca_close(struct hci_uart *hu)
 	skb_queue_purge(&qca->rx_memdump_q);
 	del_timer(&qca->tx_idle_timer);
 	del_timer(&qca->wake_retrans_timer);
-	del_timer(&qca->memdump_timer);
 	destroy_workqueue(qca->workqueue);
 	qca->hu = NULL;
 
@@ -963,11 +972,20 @@ static void qca_controller_memdump(struct work_struct *work)
 
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
@@ -992,13 +1010,15 @@ static void qca_controller_memdump(struct work_struct *work)
 			if (!(dump_size)) {
 				bt_dev_err(hu->hdev, "Rx invalid memdump size");
 				kfree_skb(skb);
+				mutex_unlock(&qca->hci_memdump_lock);
 				return;
 			}
 
 			bt_dev_info(hu->hdev, "QCA collecting dump of size:%u",
 				    dump_size);
-			mod_timer(&qca->memdump_timer, (jiffies +
-				  msecs_to_jiffies(MEMDUMP_TIMEOUT_MS)));
+			queue_delayed_work(qca->workqueue,
+					   &qca->ctrl_memdump_timeout,
+					msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
 
 			skb_pull(skb, sizeof(dump_size));
 			memdump_buf = vmalloc(dump_size);
@@ -1016,6 +1036,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca_memdump);
 			kfree_skb(skb);
 			qca->qca_memdump = NULL;
+			mutex_unlock(&qca->hci_memdump_lock);
 			return;
 		}
 
@@ -1046,16 +1067,20 @@ static void qca_controller_memdump(struct work_struct *work)
 			memdump_buf = qca_memdump->memdump_buf_head;
 			dev_coredumpv(&hu->serdev->dev, memdump_buf,
 				      qca_memdump->received_dump, GFP_KERNEL);
-			del_timer(&qca->memdump_timer);
+			cancel_delayed_work(&qca->ctrl_memdump_timeout);
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
@@ -1406,30 +1431,21 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
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
@@ -1449,6 +1465,23 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
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
+		cancel_delayed_work(&qca->ctrl_memdump_timeout);
+		skb_queue_purge(&qca->rx_memdump_q);
+		mutex_unlock(&qca->hci_memdump_lock);
+		cancel_work_sync(&qca->ctrl_memdump_evt);
+	}
+
+	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
 static void qca_cmd_timeout(struct hci_dev *hdev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
