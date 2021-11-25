Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5C945DBF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 15:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355532AbhKYOLt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 09:11:49 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33636 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbhKYOJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 09:09:49 -0500
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 06:06:38 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2021 06:06:36 -0800
X-QCInternal: smtphost
Received: from hyd-lablnx377.qualcomm.com ([10.204.178.226])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 Nov 2021 19:36:22 +0530
Received: by hyd-lablnx377.qualcomm.com (Postfix, from userid 4035820)
        id 2256C2132F; Thu, 25 Nov 2021 19:36:21 +0530 (IST)
From:   saluvala <saluvala@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org, mcchou@chromium.org,
        saluvala@codeaurora.org
Subject: [RFC PATCH v1] Bluetooth: hci_qca: Add new hci_uart proto callback to power off voltage sources
Date:   Thu, 25 Nov 2021 19:36:19 +0530
Message-Id: <1637849179-18382-1-git-send-email-saluvala@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds a new hci_uart proto callback entry i.e., power off.
This poweroff Callback is exposed to the drivers and called during BT OFF
immediately after port close. This will ensure that Voltages sources are
powered off after sending all the data before port close. Previously as
part of hdev shutdown callback, voltages sources are powered off. But we
have seen cases where post shutdown sequence completion some packets which
are already queued are sent to UART. As controller is powered off, UART
can’t send the data out or it is sending partial data due RTS line high.

Signed-off-by: saluvala <saluvala@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c    | 26 +++++++++++++++++++-------
 drivers/bluetooth/hci_serdev.c |  3 +++
 drivers/bluetooth/hci_uart.h   |  1 +
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index dd768a8..e1dee75 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -231,6 +231,7 @@ static int qca_regulator_enable(struct qca_serdev *qcadev);
 static void qca_regulator_disable(struct qca_serdev *qcadev);
 static void qca_power_shutdown(struct hci_uart *hu);
 static int qca_power_off(struct hci_dev *hdev);
+static int qca_power_off_reg(struct hci_uart *hu);
 static void qca_controller_memdump(struct work_struct *work);
 
 static enum qca_btsoc_type qca_soc_type(struct hci_uart *hu)
@@ -554,7 +555,6 @@ static void qca_controller_memdump_timeout(struct work_struct *work)
 	mutex_unlock(&qca->hci_memdump_lock);
 }
 
-
 /* Initialize protocol */
 static int qca_open(struct hci_uart *hu)
 {
@@ -1815,6 +1815,7 @@ static const struct hci_uart_proto qca_proto = {
 	.flush		= qca_flush,
 	.setup		= qca_setup,
 	.recv		= qca_recv,
+	.poweroff	= qca_power_off_reg,
 	.enqueue	= qca_enqueue,
 	.dequeue	= qca_dequeue,
 };
@@ -1881,7 +1882,6 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	struct qca_data *qca = hu->priv;
 	unsigned long flags;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
-	bool sw_ctrl_state;
 
 	/* From this point we go into power off state. But serial port is
 	 * still open, stop queueing the IBS data and flush all the buffered
@@ -1904,7 +1904,22 @@ static void qca_power_shutdown(struct hci_uart *hu)
 		host_set_baudrate(hu, 2400);
 		qca_send_power_pulse(hu, false);
 		qca_regulator_disable(qcadev);
-	} else if (soc_type == QCA_WCN6750) {
+	} else if (qcadev->bt_en) {
+		gpiod_set_value_cansleep(qcadev->bt_en, 0);
+	}
+
+	set_bit(QCA_BT_OFF, &qca->flags);
+}
+
+static int qca_power_off_reg(struct hci_uart *hu)
+{
+	struct qca_serdev *qcadev;
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
+	bool sw_ctrl_state;
+
+	qcadev = serdev_device_get_drvdata(hu->serdev);
+
+	if (soc_type == QCA_WCN6750) {
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -1912,11 +1927,8 @@ static void qca_power_shutdown(struct hci_uart *hu)
 			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
 			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
 		}
-	} else if (qcadev->bt_en) {
-		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
-
-	set_bit(QCA_BT_OFF, &qca->flags);
+	return 0;
 }
 
 static int qca_power_off(struct hci_dev *hdev)
diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 3b00d82..b3fec15 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -157,6 +157,9 @@ static int hci_uart_close(struct hci_dev *hdev)
 		serdev_device_close(hu->serdev);
 	}
 
+	if (hu->proto->poweroff)
+		hu->proto->poweroff(hu);
+
 	return 0;
 }
 
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index fb4a2d0..fc3cd77f 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -59,6 +59,7 @@ struct hci_uart_proto {
 	int (*recv)(struct hci_uart *hu, const void *data, int len);
 	int (*enqueue)(struct hci_uart *hu, struct sk_buff *skb);
 	struct sk_buff *(*dequeue)(struct hci_uart *hu);
+	int (*poweroff)(struct hci_uart *hu);
 };
 
 struct hci_uart {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

