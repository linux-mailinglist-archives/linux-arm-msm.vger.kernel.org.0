Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4967B12A64A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2019 07:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfLYGDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Dec 2019 01:03:33 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:29949 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726416AbfLYGDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Dec 2019 01:03:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577253811; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=oeRDJ8YBxG1EayBOnnnqVT+S7ve4iE7EuuMGy7WmKCE=; b=NXvzOASD0F8Rmkx1dko19Umv/y7O8ielUlLE81jmVEDUNF8vFopmw3MRvqYeAb7Rux7RbIC2
 DhoTx2iiPQaDhQzzjLdL+qU+wyog2mKWcZ+ynTyyrWZ12wiKiJHI4/sLAl8BkvqofZzoObNQ
 PnXIV7oWxcsJSFCK4bp/cwvB4rE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e02fbb3.7f9f6a097298-smtp-out-n03;
 Wed, 25 Dec 2019 06:03:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DB61C433A2; Wed, 25 Dec 2019 06:03:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A9F0C4479D;
        Wed, 25 Dec 2019 06:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A9F0C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v1 4/4] Bluetooth: hci_qca: Add HCI command timeout handling
Date:   Wed, 25 Dec 2019 14:03:17 +0800
Message-Id: <20191225060317.5258-4-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191225060317.5258-1-rjliao@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
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
 drivers/bluetooth/hci_qca.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7e202041ed77..bc74d69b3d80 100644
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
@@ -170,6 +175,7 @@ static int qca_regulator_enable(struct qca_serdev *qcadev);
 static void qca_regulator_disable(struct qca_serdev *qcadev);
 static void qca_power_shutdown(struct hci_uart *hu);
 static int qca_power_off(struct hci_dev *hdev);
+static void qca_cmd_timeout(struct hci_uart *hu);
 
 static enum qca_btsoc_type qca_soc_type(struct hci_uart *hu)
 {
@@ -1337,6 +1343,8 @@ static int qca_setup(struct hci_uart *hu)
 	if (!ret) {
 		set_bit(QCA_IBS_ENABLED, &qca->flags);
 		qca_debugfs_init(hdev);
+		hdev->cmd_timeout = qca_cmd_timeout;
+		qca->cmd_timeout_cnt = 0;
 	} else if (ret == -ENOENT) {
 		/* No patch/nvm-config found, run with original fw/config */
 		ret = 0;
@@ -1467,6 +1475,38 @@ static int qca_power_off(struct hci_dev *hdev)
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
+
+static void qca_cmd_timeout(struct hci_uart *hu)
+{
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
