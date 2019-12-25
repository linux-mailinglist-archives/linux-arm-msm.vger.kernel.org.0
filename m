Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7400812A644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2019 07:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfLYGD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Dec 2019 01:03:26 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:29949 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725869AbfLYGD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Dec 2019 01:03:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577253805; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x07ZjvCdtDiGfeXavvjtkSB2/7CUoW3zwEVQTTaNaJo=; b=cvt4SoFAxYNbMQGqXC/Bt9Q/3nafTCMIvT3Rsgh6aar8hoOI+bJL7n1H1sCrvPnJL78Tsj91
 XSQ4uyahF41upmiZbx7GN0GwmIdNOTTwbH0fdnxM5FJK4vdxYvalccO4Icn7PDkMCuo6gR2H
 s+5IKEYFUYSISyG/MRpU5kGev+s=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e02fbab.7fdb039df228-smtp-out-n02;
 Wed, 25 Dec 2019 06:03:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76D37C4479C; Wed, 25 Dec 2019 06:03:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CBCAC43383;
        Wed, 25 Dec 2019 06:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CBCAC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v1 1/4] Bluetooth: hci_qca: Add QCA Rome power off support to the qca_power_off()
Date:   Wed, 25 Dec 2019 14:03:14 +0800
Message-Id: <20191225060317.5258-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We will need to call the qca_power_off() API to power off Rome, add the
support into it. QCA Rome is using bt_en GPIO for power off, so we just
need to pull down this bt_en GPIO to power off it.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b602ed01505b..43fd84028786 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1413,13 +1413,26 @@ static void qca_power_shutdown(struct hci_uart *hu)
 static int qca_power_off(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct qca_serdev *qcadev;
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
+
+	if (qca_is_wcn399x(soc_type)) {
+		/* Perform pre shutdown command */
+		qca_send_pre_shutdown_cmd(hdev);
+
+		usleep_range(8000, 10000);
 
-	/* Perform pre shutdown command */
-	qca_send_pre_shutdown_cmd(hdev);
+		qca_power_shutdown(hu);
+	} else {
+		if (hu->serdev) {
+			qcadev = serdev_device_get_drvdata(hu->serdev);
+
+			gpiod_set_value_cansleep(qcadev->bt_en, 0);
 
-	usleep_range(8000, 10000);
+			usleep_range(8000, 10000);
+		}
+	}
 
-	qca_power_shutdown(hu);
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
