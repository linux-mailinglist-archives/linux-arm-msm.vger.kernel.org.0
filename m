Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7132AE7CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 06:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgKKFPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 00:15:11 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:27900 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbgKKFPL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 00:15:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605071710; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x9qlp6TtMCuW6yDR1fjucGV8KPry0uQ9zQlaRPc/GQc=; b=xALWau24ducthZl/op99mfRhpKZ/0HGl7OnKO50+Tpvd+Cq/E2ZAW1k1cP8dQbU/XzfMIGen
 iyuzYWye+bM0KUfrJVDnex26JumZor+Am/iAcGWPnMhzB+E1gMj9xOZtVepEJt6tgVxs7HGu
 SbIL48rNUbEjyzIxnwV4ZSWTiV0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fab73321bdb18ae752b08d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 05:14:26
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7AEC4C433C9; Wed, 11 Nov 2020 05:14:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A146C433C8;
        Wed, 11 Nov 2020 05:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A146C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        abhishekpandit@chromium.org, seanpaul@chromium.org,
        gubbaven@codeaurora.org, rjliao@codeaurora.org
Subject: [Resend v1] Bluetooth: hci_qca: Enhance retry logic in qca_setup
Date:   Wed, 11 Nov 2020 10:44:13 +0530
Message-Id: <1605071653-5088-1-git-send-email-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently driver only retries to download FW if FW downloading
is failed. Sometimes observed command timeout for version request
command, if this happen on some platforms during boot time, then
a reboot is needed to turn ON BT. Instead to avoid a reboot, now
extended retry logic for version request command too.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
 drivers/bluetooth/hci_qca.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 2d3f1f1..1c9a2d46 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1672,7 +1672,7 @@ static int qca_setup(struct hci_uart *hu)
 retry:
 	ret = qca_power_on(hdev);
 	if (ret)
-		return ret;
+		goto out;
 
 	clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 
@@ -1681,7 +1681,7 @@ static int qca_setup(struct hci_uart *hu)
 
 		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
 		if (ret)
-			return ret;
+			goto out;
 	} else {
 		qca_set_speed(hu, QCA_INIT_SPEED);
 	}
@@ -1691,7 +1691,7 @@ static int qca_setup(struct hci_uart *hu)
 	if (speed) {
 		ret = qca_set_speed(hu, QCA_OPER_SPEED);
 		if (ret)
-			return ret;
+			goto out;
 
 		qca_baudrate = qca_get_baudrate_value(speed);
 	}
@@ -1700,7 +1700,7 @@ static int qca_setup(struct hci_uart *hu)
 		/* Get QCA version information */
 		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
@@ -1721,20 +1721,22 @@ static int qca_setup(struct hci_uart *hu)
 		 * patch/nvm-config is found, so run with original fw/config.
 		 */
 		ret = 0;
-	} else {
-		if (retries < MAX_INIT_RETRIES) {
-			qca_power_shutdown(hu);
-			if (hu->serdev) {
-				serdev_device_close(hu->serdev);
-				ret = serdev_device_open(hu->serdev);
-				if (ret) {
-					bt_dev_err(hdev, "failed to open port");
-					return ret;
-				}
+	}
+
+out:
+	if (ret && retries < MAX_INIT_RETRIES) {
+		bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
+		qca_power_shutdown(hu);
+		if (hu->serdev) {
+			serdev_device_close(hu->serdev);
+			ret = serdev_device_open(hu->serdev);
+			if (ret) {
+				bt_dev_err(hdev, "failed to open port");
+				return ret;
 			}
-			retries++;
-			goto retry;
 		}
+		retries++;
+		goto retry;
 	}
 
 	/* Setup bdaddr */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

