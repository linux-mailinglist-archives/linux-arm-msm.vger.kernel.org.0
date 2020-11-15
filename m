Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CB02B3782
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Nov 2020 19:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgKOR7k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Nov 2020 12:59:40 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41834 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgKOR7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Nov 2020 12:59:39 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 15 Nov 2020 09:59:38 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Nov 2020 09:59:35 -0800
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Nov 2020 23:29:15 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 2F75921D51; Sun, 15 Nov 2020 23:29:13 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Handle spurious wakeup from SoC
Date:   Sun, 15 Nov 2020 23:29:03 +0530
Message-Id: <1605463143-4635-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added timer to handle spurious wakeup from SoC.
Timer is started when wake indicator is received from SoC.
Timer is restarted when valid data is received from SoC.
Timer is stopped when sleep indicator is received from SoC.
SSR is triggered upon timer expiry.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 99 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 5cc7b16..6953001 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -48,6 +48,7 @@
 #define IBS_WAKE_RETRANS_TIMEOUT_MS	100
 #define IBS_BTSOC_TX_IDLE_TIMEOUT_MS	200
 #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
+#define IBS_SOC_SPURIOUS_WAKE_TIMEOUT_MS 10000
 #define CMD_TRANS_TIMEOUT_MS		100
 #define MEMDUMP_TIMEOUT_MS		8000
 #define IBS_DISABLE_SSR_TIMEOUT_MS	(MEMDUMP_TIMEOUT_MS + 1000)
@@ -147,7 +148,9 @@ struct qca_data {
 	bool tx_vote;		/* Clock must be on for TX */
 	bool rx_vote;		/* Clock must be on for RX */
 	struct timer_list tx_idle_timer;
+	struct timer_list spurious_wake_timer;
 	u32 tx_idle_delay;
+	u32 spurious_wake;
 	struct timer_list wake_retrans_timer;
 	u32 wake_retrans;
 	struct workqueue_struct *workqueue;
@@ -156,6 +159,7 @@ struct qca_data {
 	struct work_struct ws_rx_vote_off;
 	struct work_struct ws_tx_vote_off;
 	struct work_struct ctrl_memdump_evt;
+	struct work_struct spurious_wake_timeout;
 	struct delayed_work ctrl_memdump_timeout;
 	struct qca_memdump_data *qca_memdump;
 	unsigned long flags;
@@ -229,6 +233,7 @@ static void qca_regulator_disable(struct qca_serdev *qcadev);
 static void qca_power_shutdown(struct hci_uart *hu);
 static int qca_power_off(struct hci_dev *hdev);
 static void qca_controller_memdump(struct work_struct *work);
+static void qca_wq_spurious_wake_timeout(struct work_struct *work);
 
 static enum qca_btsoc_type qca_soc_type(struct hci_uart *hu)
 {
@@ -530,6 +535,15 @@ static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
 		hci_uart_tx_wakeup(hu);
 }
 
+static void hci_ibs_spurious_wake_timeout(struct timer_list *t)
+{
+	struct qca_data *qca = from_timer(qca, t, spurious_wake_timer);
+	struct hci_uart *hu = qca->hu;
+
+	bt_dev_warn(hu->hdev, "hu %p spurious wake timeout in %d state", hu, qca->rx_ibs_state);
+
+	queue_work(qca->workqueue, &qca->spurious_wake_timeout);
+}
 
 static void qca_controller_memdump_timeout(struct work_struct *work)
 {
@@ -584,6 +598,7 @@ static int qca_open(struct hci_uart *hu)
 	INIT_WORK(&qca->ws_rx_vote_off, qca_wq_serial_rx_clock_vote_off);
 	INIT_WORK(&qca->ws_tx_vote_off, qca_wq_serial_tx_clock_vote_off);
 	INIT_WORK(&qca->ctrl_memdump_evt, qca_controller_memdump);
+	INIT_WORK(&qca->spurious_wake_timeout, qca_wq_spurious_wake_timeout);
 	INIT_DELAYED_WORK(&qca->ctrl_memdump_timeout,
 			  qca_controller_memdump_timeout);
 	init_waitqueue_head(&qca->suspend_wait_q);
@@ -615,6 +630,9 @@ static int qca_open(struct hci_uart *hu)
 	timer_setup(&qca->tx_idle_timer, hci_ibs_tx_idle_timeout, 0);
 	qca->tx_idle_delay = IBS_HOST_TX_IDLE_TIMEOUT_MS;
 
+	timer_setup(&qca->spurious_wake_timer, hci_ibs_spurious_wake_timeout, 0);
+	qca->spurious_wake = IBS_SOC_SPURIOUS_WAKE_TIMEOUT_MS;
+
 	BT_DBG("HCI_UART_QCA open, tx_idle_delay=%u, wake_retrans=%u",
 	       qca->tx_idle_delay, qca->wake_retrans);
 
@@ -694,6 +712,7 @@ static int qca_close(struct hci_uart *hu)
 	skb_queue_purge(&qca->rx_memdump_q);
 	del_timer(&qca->tx_idle_timer);
 	del_timer(&qca->wake_retrans_timer);
+	del_timer(&qca->spurious_wake_timer);
 	destroy_workqueue(qca->workqueue);
 	qca->hu = NULL;
 
@@ -710,7 +729,7 @@ static int qca_close(struct hci_uart *hu)
  */
 static void device_want_to_wakeup(struct hci_uart *hu)
 {
-	unsigned long flags;
+	unsigned long flags, wake_timeout;
 	struct qca_data *qca = hu->priv;
 
 	BT_DBG("hu %p want to wake up", hu);
@@ -731,6 +750,10 @@ static void device_want_to_wakeup(struct hci_uart *hu)
 		 * receiving the wake up indicator awake rx clock.
 		 */
 		queue_work(qca->workqueue, &qca->ws_awake_rx);
+		if (!test_bit(QCA_SSR_TRIGGERED, &qca->flags)) {
+			wake_timeout = msecs_to_jiffies(qca->spurious_wake);
+			mod_timer(&qca->spurious_wake_timer, jiffies + wake_timeout);
+		}
 		spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
 		return;
 
@@ -777,9 +800,11 @@ static void device_want_to_sleep(struct hci_uart *hu)
 		qca->rx_ibs_state = HCI_IBS_RX_ASLEEP;
 		/* Vote off rx clock under workqueue */
 		queue_work(qca->workqueue, &qca->ws_rx_vote_off);
+		del_timer(&qca->spurious_wake_timer);
 		break;
 
 	case HCI_IBS_RX_ASLEEP:
+		del_timer(&qca->spurious_wake_timer);
 		break;
 
 	default:
@@ -955,6 +980,16 @@ static int qca_ibs_wake_ack(struct hci_dev *hdev, struct sk_buff *skb)
 
 static int qca_recv_acl_data(struct hci_dev *hdev, struct sk_buff *skb)
 {
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct qca_data *qca = hu->priv;
+	u32 wake_timeout;
+
+	if (!test_bit(QCA_IBS_DISABLED, &qca->flags) &&
+	    !test_bit(QCA_SSR_TRIGGERED, &qca->flags)) {
+		wake_timeout = msecs_to_jiffies(qca->spurious_wake);
+		mod_timer(&qca->spurious_wake_timer, jiffies + wake_timeout);
+	}
+
 	/* We receive debug logs from chip as an ACL packets.
 	 * Instead of sending the data to ACL to decode the
 	 * received data, we are pushing them to the above layers
@@ -966,6 +1001,22 @@ static int qca_recv_acl_data(struct hci_dev *hdev, struct sk_buff *skb)
 	return hci_recv_frame(hdev, skb);
 }
 
+static int qca_recv_sco_data(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct qca_data *qca = hu->priv;
+	u32 wake_timeout;
+
+	if (!test_bit(QCA_IBS_DISABLED, &qca->flags) &&
+	    !test_bit(QCA_SSR_TRIGGERED, &qca->flags)) {
+		wake_timeout = msecs_to_jiffies(qca->spurious_wake);
+		mod_timer(&qca->spurious_wake_timer, jiffies + wake_timeout);
+	}
+
+	return hci_recv_frame(hdev, skb);
+}
+
+
 static void qca_controller_memdump(struct work_struct *work)
 {
 	struct qca_data *qca = container_of(work, struct qca_data,
@@ -1134,6 +1185,7 @@ static int qca_controller_memdump_event(struct hci_dev *hdev,
 	struct qca_data *qca = hu->priv;
 
 	set_bit(QCA_SSR_TRIGGERED, &qca->flags);
+	del_timer(&qca->spurious_wake_timer);
 	skb_queue_tail(&qca->rx_memdump_q, skb);
 	queue_work(qca->workqueue, &qca->ctrl_memdump_evt);
 
@@ -1144,6 +1196,7 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
+	u32 wake_timeout;
 
 	if (test_bit(QCA_DROP_VENDOR_EVENT, &qca->flags)) {
 		struct hci_event_hdr *hdr = (void *)skb->data;
@@ -1174,6 +1227,12 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	    (get_unaligned_be16(skb->data + 2) == QCA_SSR_DUMP_HANDLE))
 		return qca_controller_memdump_event(hdev, skb);
 
+	if (!test_bit(QCA_IBS_DISABLED, &qca->flags) &&
+	    !test_bit(QCA_SSR_TRIGGERED, &qca->flags)) {
+		wake_timeout = msecs_to_jiffies(qca->spurious_wake);
+		mod_timer(&qca->spurious_wake_timer, jiffies + wake_timeout);
+	}
+
 	return hci_recv_frame(hdev, skb);
 }
 
@@ -1200,7 +1259,7 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 
 static const struct h4_recv_pkt qca_recv_pkts[] = {
 	{ H4_RECV_ACL,             .recv = qca_recv_acl_data },
-	{ H4_RECV_SCO,             .recv = hci_recv_frame    },
+	{ H4_RECV_SCO,             .recv = qca_recv_sco_data },
 	{ H4_RECV_EVENT,           .recv = qca_recv_event    },
 	{ QCA_IBS_WAKE_IND_EVENT,  .recv = qca_ibs_wake_ind  },
 	{ QCA_IBS_WAKE_ACK_EVENT,  .recv = qca_ibs_wake_ack  },
@@ -1567,6 +1626,40 @@ static void qca_cmd_timeout(struct hci_dev *hdev)
 	mutex_unlock(&qca->hci_memdump_lock);
 }
 
+static void qca_wq_spurious_wake_timeout(struct work_struct *work)
+{
+	struct qca_data *qca = container_of(work, struct qca_data,
+					    spurious_wake_timeout);
+	struct hci_uart *hu = qca->hu;
+
+	bt_dev_info(hu->hdev, "mem_dump_status: %d", qca->memdump_state);
+
+	set_bit(QCA_SSR_TRIGGERED, &qca->flags);
+	if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
+		set_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+		qca_send_crashbuffer(hu);
+		qca_wait_for_dump_collection(hu->hdev);
+	} else if (qca->memdump_state == QCA_MEMDUMP_COLLECTING) {
+		/* Let us wait here until memory dump collected or
+		 * memory dump timer expired.
+		 */
+		bt_dev_info(hu->hdev, "waiting for dump to complete");
+		qca_wait_for_dump_collection(hu->hdev);
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
+}
+
 static int qca_wcn3990_init(struct hci_uart *hu)
 {
 	struct qca_serdev *qcadev;
@@ -1816,6 +1909,8 @@ static void qca_power_shutdown(struct hci_uart *hu)
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
+	del_timer(&qca->spurious_wake_timer);
+
 	/* From this point we go into power off state. But serial port is
 	 * still open, stop queueing the IBS data and flush all the buffered
 	 * data in skb's.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

