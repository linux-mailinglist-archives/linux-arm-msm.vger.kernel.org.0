Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE58FC152
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 09:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfKNIOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 03:14:43 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34050 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfKNIOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 03:14:43 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 30AC0601E7; Thu, 14 Nov 2019 08:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573719282;
        bh=UiF0+gnF4eB8dUSiLw/KMBeKnt4Fl+raj9NHWbCWzVA=;
        h=From:To:Cc:Subject:Date:From;
        b=HKz/vjirNKzLTHWNR7D4+jmm+6Tsmd65akG1UHLPGyfFnnM+QFufcFJHKolaOyjT1
         eQ0rz/Gg7nT9D7o+0VdaQlaKSt/OjBY8XgxCmLGOLpTcnpl7XBuymr/WGmpIPktoRc
         LliRLAfoQYF/+6Z5L9ofplQlzb+YmpapRfr8Hxgo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23A9F601E7;
        Thu, 14 Nov 2019 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573719281;
        bh=UiF0+gnF4eB8dUSiLw/KMBeKnt4Fl+raj9NHWbCWzVA=;
        h=From:To:Cc:Subject:Date:From;
        b=LB5755oWBSZO8HhBv1jljCwyGot9VJU6ECZXAnAGlcE5g+6Y9IlwOzsovwzvWwfoa
         Yk09SpAd8VXUmZ+7AJeTvMJwSKh7Ga3s4k4bQS4Jv538eoLJEkjdtV33hXJHYI6i6X
         z9Lwoatdix16BKPFInLR1F8pICL90AywX6SXjsPw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 23A9F601E7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org
Subject: [PATCH v1] Bluetooth: hci_qca: Enable clocks required for BT SOC
Date:   Thu, 14 Nov 2019 13:44:30 +0530
Message-Id: <20191114081430.25427-1-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of relying on other subsytem to turn ON clocks
required for BT SoC to operate, voting them from the driver.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index f10bdf8e1fc5..dc95e378574b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -164,6 +164,7 @@ struct qca_serdev {
 };
 
 static int qca_regulator_enable(struct qca_serdev *qcadev);
+static int qca_power_on(struct qca_serdev *qcadev);
 static void qca_regulator_disable(struct qca_serdev *qcadev);
 static void qca_power_shutdown(struct hci_uart *hu);
 static int qca_power_off(struct hci_dev *hdev);
@@ -528,7 +529,7 @@ static int qca_open(struct hci_uart *hu)
 		} else {
 			hu->init_speed = qcadev->init_speed;
 			hu->oper_speed = qcadev->oper_speed;
-			ret = qca_regulator_enable(qcadev);
+			ret = qca_power_on(qcadev);
 			if (ret) {
 				destroy_workqueue(qca->workqueue);
 				kfree_skb(qca->rx_skb);
@@ -1214,7 +1215,7 @@ static int qca_wcn3990_init(struct hci_uart *hu)
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 	if (!qcadev->bt_power->vregs_on) {
 		serdev_device_close(hu->serdev);
-		ret = qca_regulator_enable(qcadev);
+		ret = qca_power_on(qcadev);
 		if (ret)
 			return ret;
 
@@ -1408,6 +1409,9 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	host_set_baudrate(hu, 2400);
 	qca_send_power_pulse(hu, false);
 	qca_regulator_disable(qcadev);
+
+	if (qcadev->susclk)
+		clk_disable_unprepare(qcadev->susclk);
 }
 
 static int qca_power_off(struct hci_dev *hdev)
@@ -1423,6 +1427,20 @@ static int qca_power_off(struct hci_dev *hdev)
 	return 0;
 }
 
+static int qca_power_on(struct qca_serdev *qcadev)
+{
+	int err;
+
+	if (qcadev->susclk) {
+		err = clk_prepare_enable(qcadev->susclk);
+		if (err)
+			return err;
+	}
+
+	qca_regulator_enable(qcadev);
+	return 0;
+}
+
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
 	struct qca_power *power = qcadev->bt_power;
@@ -1523,6 +1541,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		qcadev->bt_power->vregs_on = false;
 
+		if (qcadev->btsoc_type == QCA_WCN3990 ||
+		    qcadev->btsoc_type == QCA_WCN3991) {
+			qcadev->susclk = devm_clk_get(&serdev->dev, NULL);
+			if (IS_ERR(qcadev->susclk)) {
+				dev_err(&serdev->dev, "failed to acquire clk\n");
+				return PTR_ERR(qcadev->susclk);
+			}
+		}
+
 		device_property_read_u32(&serdev->dev, "max-speed",
 					 &qcadev->oper_speed);
 		if (!qcadev->oper_speed)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

