Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8A9284EC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 17:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgJFPUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 11:20:35 -0400
Received: from z5.mailgun.us ([104.130.96.5]:32911 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFPUf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 11:20:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601997634; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=VZtluZ0uMsNr7qvIzd32PfxEWPgcdsHHlyK7tcvavwo=; b=kgE9/imP06eGZ9UM/gQPS/rjd9ESWxlxF1EzFZYneOLplpCamYiLamMhST02I3CKmSXrjkoB
 vHliYm4Msv4APbGwxdYuZfsIB2/4U0/q0cC9j9FJgs1BMlHVTwKLFb9f7ZBmGhpQ9LCgR/cE
 qOCG8KLlcglI6nd1vZBvZny49e4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f7c8b413711fec7b1f359a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Oct 2020 15:20:33
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0706EC433F1; Tue,  6 Oct 2020 15:20:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0344C433C8;
        Tue,  6 Oct 2020 15:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0344C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org,
        abhishekpandit@chromium.org, rjliao@codeaurora.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Wait for timeout during suspend
Date:   Tue,  6 Oct 2020 20:50:21 +0530
Message-Id: <1601997621-12056-1-git-send-email-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>

Currently qca_suspend() is relied on IBS mechanism. During
FW download and memory dump collections, IBS will be disabled.
In those cases, driver will allow suspend and still uses the
serdev port, which results to errors. Now added a wait timeout
if suspend is triggered during FW download and memory collections.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 48 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3d13002..652a84c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -50,6 +50,8 @@
 #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
 #define CMD_TRANS_TIMEOUT_MS		100
 #define MEMDUMP_TIMEOUT_MS		8000
+#define IBS_DISABLE_SSR_TIMEOUT_MS	(MEMDUMP_TIMEOUT_MS + 1000)
+#define FW_DOWNLOAD_TIMEOUT_MS		3000
 
 /* susclk rate */
 #define SUSCLK_RATE_32KHZ	32768
@@ -68,12 +70,13 @@
 #define QCA_MEMDUMP_BYTE		0xFB
 
 enum qca_flags {
-	QCA_IBS_ENABLED,
+	QCA_IBS_DISABLED,
 	QCA_DROP_VENDOR_EVENT,
 	QCA_SUSPENDING,
 	QCA_MEMDUMP_COLLECTION,
 	QCA_HW_ERROR_EVENT,
-	QCA_SSR_TRIGGERED
+	QCA_SSR_TRIGGERED,
+	QCA_BT_OFF
 };
 
 enum qca_capabilities {
@@ -871,7 +874,7 @@ static int qca_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 	 * Out-Of-Band(GPIOs control) sleep is selected.
 	 * Don't wake the device up when suspending.
 	 */
-	if (!test_bit(QCA_IBS_ENABLED, &qca->flags) ||
+	if (test_bit(QCA_IBS_DISABLED, &qca->flags) ||
 	    test_bit(QCA_SUSPENDING, &qca->flags)) {
 		skb_queue_tail(&qca->txq, skb);
 		spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
@@ -1016,7 +1019,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			 * the controller to send the dump is 8 seconds. let us
 			 * start timer to handle this asynchronous activity.
 			 */
-			clear_bit(QCA_IBS_ENABLED, &qca->flags);
+			set_bit(QCA_IBS_DISABLED, &qca->flags);
 			set_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 			dump = (void *) skb->data;
 			dump_size = __le32_to_cpu(dump->dump_size);
@@ -1620,6 +1623,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	struct qca_serdev *qcadev;
+	struct qca_data *qca = hu->priv;
 	int ret = 0;
 
 	/* Non-serdev device usually is powered by external power
@@ -1639,6 +1643,7 @@ static int qca_power_on(struct hci_dev *hdev)
 		}
 	}
 
+	clear_bit(QCA_BT_OFF, &qca->flags);
 	return ret;
 }
 
@@ -1658,7 +1663,7 @@ static int qca_setup(struct hci_uart *hu)
 		return ret;
 
 	/* Patch downloading has to be done without IBS mode */
-	clear_bit(QCA_IBS_ENABLED, &qca->flags);
+	set_bit(QCA_IBS_DISABLED, &qca->flags);
 
 	/* Enable controller to do both LE scan and BR/EDR inquiry
 	 * simultaneously.
@@ -1707,7 +1712,7 @@ static int qca_setup(struct hci_uart *hu)
 	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, soc_ver,
 			firmware_name);
 	if (!ret) {
-		set_bit(QCA_IBS_ENABLED, &qca->flags);
+		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca_debugfs_init(hdev);
 		hu->hdev->hw_error = qca_hw_error;
 		hu->hdev->cmd_timeout = qca_cmd_timeout;
@@ -1813,7 +1818,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	 * data in skb's.
 	 */
 	spin_lock_irqsave(&qca->hci_ibs_lock, flags);
-	clear_bit(QCA_IBS_ENABLED, &qca->flags);
+	set_bit(QCA_IBS_DISABLED, &qca->flags);
 	qca_flush(hu);
 	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
 
@@ -1833,6 +1838,8 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	} else if (qcadev->bt_en) {
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
+
+	set_bit(QCA_BT_OFF, &qca->flags);
 }
 
 static int qca_power_off(struct hci_dev *hdev)
@@ -2082,11 +2089,34 @@ static int __maybe_unused qca_suspend(struct device *dev)
 	bool tx_pending = false;
 	int ret = 0;
 	u8 cmd;
+	u32 wait_timeout = 0;
 
 	set_bit(QCA_SUSPENDING, &qca->flags);
 
-	/* Device is downloading patch or doesn't support in-band sleep. */
-	if (!test_bit(QCA_IBS_ENABLED, &qca->flags))
+	if (test_bit(QCA_BT_OFF, &qca->flags))
+		return 0;
+
+	if (test_bit(QCA_IBS_DISABLED, &qca->flags)) {
+		wait_timeout = test_bit(QCA_SSR_TRIGGERED, &qca->flags) ?
+					IBS_DISABLE_SSR_TIMEOUT_MS :
+					FW_DOWNLOAD_TIMEOUT_MS;
+
+		/* QCA_IBS_DISABLED flag is set to true, During FW download
+		 * and during memory dump collection. It is reset to false,
+		 * After FW download complete and after memory dump collections.
+		 */
+		wait_on_bit_timeout(&qca->flags, QCA_IBS_DISABLED,
+			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(wait_timeout));
+
+		if (test_bit(QCA_IBS_DISABLED, &qca->flags)) {
+			bt_dev_err(hu->hdev, "SSR or FW download time out");
+			ret = -ETIMEDOUT;
+			goto error;
+		}
+	}
+
+	/* After memory dump collection, Controller is powered off.*/
+	if (test_bit(QCA_BT_OFF, &qca->flags))
 		return 0;
 
 	cancel_work_sync(&qca->ws_awake_device);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

