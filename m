Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AEB21C3FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 13:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgGKLbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 07:31:41 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13526 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgGKLbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 07:31:41 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 11 Jul 2020 04:31:40 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jul 2020 04:31:38 -0700
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2020 17:01:16 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 5534B21515; Sat, 11 Jul 2020 17:01:15 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Bug fixes for SSR
Date:   Sat, 11 Jul 2020 17:01:12 +0530
Message-Id: <1594467072-13332-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1.During SSR for command time out if BT SoC goes to inresponsive
state, power cycling of BT SoC was not happening.Given the fix by
sending hw error event to reset the BT SoC.

2.If SSR is triggered then ignore the transmit data requests to
BT SoC until SSR is completed.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7e39546..bfebefa 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -72,7 +72,8 @@ enum qca_flags {
 	QCA_DROP_VENDOR_EVENT,
 	QCA_SUSPENDING,
 	QCA_MEMDUMP_COLLECTION,
-	QCA_HW_ERROR_EVENT
+	QCA_HW_ERROR_EVENT,
+	QCA_SSR_TRIGGERED
 };
 
 enum qca_capabilities {
@@ -854,6 +855,13 @@ static int qca_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 	BT_DBG("hu %p qca enq skb %p tx_ibs_state %d", hu, skb,
 	       qca->tx_ibs_state);
 
+	if (test_bit(QCA_SSR_TRIGGERED, &qca->flags)) {
+		/* As SSR is in progress,Ignore the packets */
+		bt_dev_dbg(hu->hdev, "SSR is in progress");
+		kfree_skb(skb);
+		return 0;
+	}
+
 	/* Prepend skb with frame type */
 	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
 
@@ -1123,6 +1131,7 @@ static int qca_controller_memdump_event(struct hci_dev *hdev,
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
 
+	set_bit(QCA_SSR_TRIGGERED, &qca->flags);
 	skb_queue_tail(&qca->rx_memdump_q, skb);
 	queue_work(qca->workqueue, &qca->ctrl_memdump_evt);
 
@@ -1481,6 +1490,7 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
 
+	set_bit(QCA_SSR_TRIGGERED, &qca->flags);
 	set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 	bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
 
@@ -1529,10 +1539,30 @@ static void qca_cmd_timeout(struct hci_dev *hdev)
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
 
-	if (qca->memdump_state == QCA_MEMDUMP_IDLE)
+	set_bit(QCA_SSR_TRIGGERED, &qca->flags);
+	if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
+		set_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 		qca_send_crashbuffer(hu);
-	else
-		bt_dev_info(hdev, "Dump collection is in process");
+		qca_wait_for_dump_collection(hdev);
+	} else if (qca->memdump_state == QCA_MEMDUMP_COLLECTING) {
+		/* Let us wait here until memory dump collected or
+		 * memory dump timer expired.
+		 */
+		bt_dev_info(hdev, "waiting for dump to complete");
+		qca_wait_for_dump_collection(hdev);
+	}
+
+	mutex_lock(&qca->hci_memdump_lock);
+	if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
+		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
+		if (!test_bit(QCA_HW_ERROR_EVENT, &qca->flags)) {
+			/* Inject hw error event to reset the device
+			 * and driver.
+			 */
+			hci_reset_dev(hu->hdev);
+		}
+	}
+	mutex_unlock(&qca->hci_memdump_lock);
 }
 
 static int qca_wcn3990_init(struct hci_uart *hu)
@@ -1643,6 +1673,8 @@ static int qca_setup(struct hci_uart *hu)
 	if (ret)
 		return ret;
 
+	clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
+
 	if (qca_is_wcn399x(soc_type)) {
 		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

