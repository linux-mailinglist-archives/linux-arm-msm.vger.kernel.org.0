Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6F0813BB96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 09:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbgAOI4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 03:56:04 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:27172 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729134AbgAOI4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 03:56:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579078563; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=dw3OGlWe85GTH5+3pzosjlG6zFFR0KXM6IS6Rg1yNew=; b=dOlwh97bLWpvV51sm4Xd0EAQUxtGsqT6Wg//+hZ70+5qYacHNh6jri9lLX7OVvIQ8GjmlWl9
 WM8saYFpEnG32U/THeez/SODHA/sl9JOFw06fPA722rZdKDuOU8dIGpK22xf9gTbH5VOEga+
 9lTOu9hMYMoyeDGlo+KPDcke9Tc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1ed3a0.7f093b78ff48-smtp-out-n01;
 Wed, 15 Jan 2020 08:56:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34BDFC447AA; Wed, 15 Jan 2020 08:55:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFD40C447A6;
        Wed, 15 Jan 2020 08:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFD40C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, hemantg@codeaurora.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v4 1/3] Bluetooth: hci_qca: Add QCA Rome power off support to the qca_power_shutdown()
Date:   Wed, 15 Jan 2020 16:55:50 +0800
Message-Id: <20200115085552.11483-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191225060317.5258-1-rjliao@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current qca_power_shutdown() only supports wcn399x, this patch adds Rome
power off support to it. For Rome it just needs to pull down the bt_en
GPIO to power off it. This patch also replaces all the power off operation
in qca_close() with the unified qca_power_shutdown() call.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---

Changes in v2: None
Changes in v3: None
Changes in v4:
  -rebased the patch with latest code base
  -moved the change from qca_power_off() to qca_power_shutdown()
  -replaced all the power off operation in qca_close() with
   qca_power_shutdown()
  -updated commit message

 drivers/bluetooth/hci_qca.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 992622dc1263..ecb74965be10 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -663,7 +663,6 @@ static int qca_flush(struct hci_uart *hu)
 /* Close protocol */
 static int qca_close(struct hci_uart *hu)
 {
-	struct qca_serdev *qcadev;
 	struct qca_data *qca = hu->priv;
 
 	BT_DBG("hu %p qca close", hu);
@@ -679,14 +678,7 @@ static int qca_close(struct hci_uart *hu)
 	destroy_workqueue(qca->workqueue);
 	qca->hu = NULL;
 
-	if (hu->serdev) {
-		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (qca_is_wcn399x(qcadev->btsoc_type))
-			qca_power_shutdown(hu);
-		else
-			gpiod_set_value_cansleep(qcadev->bt_en, 0);
-
-	}
+	qca_power_shutdown(hu);
 
 	kfree_skb(qca->rx_skb);
 
@@ -1685,6 +1677,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	struct qca_serdev *qcadev;
 	struct qca_data *qca = hu->priv;
 	unsigned long flags;
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
@@ -1697,11 +1690,22 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	qca_flush(hu);
 	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
 
-	host_set_baudrate(hu, 2400);
-	qca_send_power_pulse(hu, false);
-	qca_regulator_disable(qcadev);
 	hu->hdev->hw_error = NULL;
 	hu->hdev->cmd_timeout = NULL;
+
+	/* Non-serdev device usually is powered by external power
+	 * and don't need additional action in driver for power down
+	 */
+	if (!hu->serdev)
+		return;
+
+	if (qca_is_wcn399x(soc_type)) {
+		host_set_baudrate(hu, 2400);
+		qca_send_power_pulse(hu, false);
+		qca_regulator_disable(qcadev);
+	} else {
+		gpiod_set_value_cansleep(qcadev->bt_en, 0);
+	}
 }
 
 static int qca_power_off(struct hci_dev *hdev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
