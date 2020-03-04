Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D00117911D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 14:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388106AbgCDNQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 08:16:56 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:19367 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729175AbgCDNQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 08:16:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583327815; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=K4q6i2AGe0LtekAkSNRrYuh3u8TmdkdQFpM4sYuSA1Y=; b=X6aNIugGTc2F3LsH05rYd3uAVcqTMEkZNoXxlzWi5xguYbm4wnRY71uwKuZZzBBtmVg8G4qV
 djQh1wNK/o2dNToLC/G88SFEoCkIsO8EggZEqN7iVXFJspRi4w3sKWq03jYyuctmkfRxg1IA
 tYMSxQ9jxpPacMh+S1sCrC5dLdU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5faa47.7f935e333c38-smtp-out-n03;
 Wed, 04 Mar 2020 13:16:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 04780C4479F; Wed,  4 Mar 2020 13:16:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1294C43383;
        Wed,  4 Mar 2020 13:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1294C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Replace devm_gpiod_get() with devm_gpiod_get_optional()
Date:   Wed,  4 Mar 2020 21:16:45 +0800
Message-Id: <20200304131645.22057-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch replaces devm_gpiod_get() with devm_gpiod_get_optional() to get
bt_en and replaces devm_clk_get() with devm_clk_get_optional() to get
susclk. It also uses NULL check to determine whether the resource is
available or not.

Fixes: 8a208b24d770 ("Bluetooth: hci_qca: Make bt_en and susclk not mandatory for QCA Rome")
Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 325baa046c3a..439392b1c043 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1562,7 +1562,7 @@ static int qca_power_on(struct hci_dev *hdev)
 		ret = qca_wcn3990_init(hu);
 	} else {
 		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (!IS_ERR(qcadev->bt_en)) {
+		if (qcadev->bt_en) {
 			gpiod_set_value_cansleep(qcadev->bt_en, 1);
 			/* Controller needs time to bootup. */
 			msleep(150);
@@ -1752,7 +1752,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 		host_set_baudrate(hu, 2400);
 		qca_send_power_pulse(hu, false);
 		qca_regulator_disable(qcadev);
-	} else if (!IS_ERR(qcadev->bt_en)) {
+	} else if (qcadev->bt_en) {
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
 }
@@ -1901,15 +1901,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	} else {
 		qcadev->btsoc_type = QCA_ROME;
-		qcadev->bt_en = devm_gpiod_get(&serdev->dev, "enable",
+		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
-		if (IS_ERR(qcadev->bt_en)) {
+		if (!qcadev->bt_en) {
 			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
 			power_ctrl_enabled = false;
 		}
 
-		qcadev->susclk = devm_clk_get(&serdev->dev, NULL);
-		if (IS_ERR(qcadev->susclk)) {
+		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
+		if (!qcadev->susclk) {
 			dev_warn(&serdev->dev, "failed to acquire clk\n");
 		} else {
 			err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
@@ -1924,7 +1924,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 		if (err) {
 			BT_ERR("Rome serdev registration failed");
-			if (!IS_ERR(qcadev->susclk))
+			if (qcadev->susclk)
 				clk_disable_unprepare(qcadev->susclk);
 			return err;
 		}
@@ -1945,7 +1945,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 
 	if (qca_is_wcn399x(qcadev->btsoc_type))
 		qca_power_shutdown(&qcadev->serdev_hu);
-	else if (!IS_ERR(qcadev->susclk))
+	else if (qcadev->susclk)
 		clk_disable_unprepare(qcadev->susclk);
 
 	hci_uart_unregister_device(&qcadev->serdev_hu);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
