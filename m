Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0487312B265
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 08:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfL0HVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 02:21:48 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:18616 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727074AbfL0HVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 02:21:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577431305; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=3XiPykcnQMfX9C3BwmKaqmlebl0iDBuuAvhWUm2I778=; b=Ct1BOPnF38Re6qUg/LLKncEz1SN9kxgTL24JuJA9cvezNaPbUMkZeJKR12MRoZLSFvuXRNEd
 woyjOo+E8l8f/uj0pvUXbD0QnGY+wasjFYrcI4h94hEWmvN63ka959RnZv031teMevCCo53H
 PNe1dZDQZ2GrxWKluuEW6zXNahs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05b108.7f4db995c7d8-smtp-out-n02;
 Fri, 27 Dec 2019 07:21:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70EF9C433CB; Fri, 27 Dec 2019 07:21:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6425AC43383;
        Fri, 27 Dec 2019 07:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6425AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v3 4/4] Bluetooth: hci_qca: Add HCI command timeout handling
Date:   Fri, 27 Dec 2019 15:21:30 +0800
Message-Id: <20191227072130.29431-4-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191227072130.29431-1-rjliao@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the HCI command timeout handling, it will trigger btsoc
to report its memory dump via vendor specific events when hit the defined
max HCI command timeout count. After all the memory dump VSE are sent, the
btsoc will also send a HCI_HW_ERROR event to host and this will cause a new
hci down/up process and the btsoc will be re-initialized.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---

Changes in v2:
- Fix build error
Changes in v3:
- Remove the function declaration 
- Move the cmd_timeout() callback register to probe()
- Remove the redundant empty line

 drivers/bluetooth/hci_qca.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ca0b38f065e5..026e2e2cdd30 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -47,6 +47,8 @@
 #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
 #define CMD_TRANS_TIMEOUT_MS		100
 
+#define QCA_BTSOC_DUMP_CMD	0xFB
+
 /* susclk rate */
 #define SUSCLK_RATE_32KHZ	32768
 
@@ -56,6 +58,9 @@
 /* max retry count when init fails */
 #define QCA_MAX_INIT_RETRY_COUNT 3
 
+/* when hit the max cmd time out count, trigger btsoc dump */
+#define QCA_MAX_CMD_TIMEOUT_COUNT 3
+
 enum qca_flags {
 	QCA_IBS_ENABLED,
 	QCA_DROP_VENDOR_EVENT,
@@ -123,6 +128,8 @@ struct qca_data {
 	u64 rx_votes_off;
 	u64 votes_on;
 	u64 votes_off;
+
+	u32 cmd_timeout_cnt;
 };
 
 enum qca_speed_type {
@@ -1332,6 +1339,11 @@ static int qca_setup(struct hci_uart *hu)
 	if (!ret) {
 		set_bit(QCA_IBS_ENABLED, &qca->flags);
 		qca_debugfs_init(hdev);
+
+		/* clear the command time out count every time after
+		 * initializaiton done
+		 */
+		qca->cmd_timeout_cnt = 0;
 	} else if (ret == -ENOENT) {
 		/* No patch/nvm-config found, run with original fw/config */
 		ret = 0;
@@ -1462,6 +1474,38 @@ static int qca_power_off(struct hci_dev *hdev)
 	return 0;
 }
 
+static int qca_send_btsoc_dump_cmd(struct hci_uart *hu)
+{
+	int err = 0;
+	struct sk_buff *skb = NULL;
+	struct qca_data *qca = hu->priv;
+
+	BT_DBG("hu %p sending btsoc dump command", hu);
+
+	skb = bt_skb_alloc(1, GFP_ATOMIC);
+	if (!skb) {
+		BT_ERR("Failed to allocate memory for qca dump command");
+		return -ENOMEM;
+	}
+
+	skb_put_u8(skb, QCA_BTSOC_DUMP_CMD);
+
+	skb_queue_tail(&qca->txq, skb);
+
+	return err;
+}
+
+static void qca_cmd_timeout(struct hci_dev *hdev)
+{
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct qca_data *qca = hu->priv;
+
+	BT_ERR("hu %p hci cmd timeout count=0x%x", hu, ++qca->cmd_timeout_cnt);
+
+	if (qca->cmd_timeout_cnt >= QCA_MAX_CMD_TIMEOUT_COUNT)
+		qca_send_btsoc_dump_cmd(hu);
+}
+
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
 	struct qca_power *power = qcadev->bt_power;
@@ -1605,6 +1649,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		hdev = qcadev->serdev_hu.hdev;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 		hdev->shutdown = qca_power_off;
+		hdev->cmd_timeout = qca_cmd_timeout;
 	}
 
 out:	return err;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
