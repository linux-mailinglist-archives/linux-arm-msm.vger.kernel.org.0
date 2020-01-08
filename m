Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B3C133DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 10:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgAHJIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 04:08:16 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:28994 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726921AbgAHJIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 04:08:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578474495; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=IYgOyQID9FWtcNH2f8jj8HDLZy8aqYdaotmPOLn64AE=; b=h/kFLln8pHh2WOMpm1/XW6Pv+MLeeF/m3t6ITLFH8naxBZLWGNXdiALyLXSpgmKRsIw2robr
 /qXpo3ajX7kxZPKL2KiZ3i1SHoK7Viw1yTXxedH7aBIloWpJNhY9cG5oE8QlFnvICX8w/v1E
 sswEy8t4CI4reR+tcmpLvb1+mbw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e159bfe.7f9b9ec4a688-smtp-out-n03;
 Wed, 08 Jan 2020 09:08:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21E11C4479C; Wed,  8 Jan 2020 09:08:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D1B0CC433CB;
        Wed,  8 Jan 2020 09:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D1B0CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v2 1/3] Bluetooth: hci_qca: Add qca_power_on() API to support both wcn399x and Rome power up
Date:   Wed,  8 Jan 2020 17:08:02 +0800
Message-Id: <20200108090804.22889-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107052601.32216-1-rjliao@codeaurora.org>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a unified API qca_power_on() to support both wcn399x and
Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---

Changes in v2: None

 drivers/bluetooth/hci_qca.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9392cc7f9908..f6555bd1adbc 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1532,6 +1532,27 @@ static int qca_wcn3990_init(struct hci_uart *hu)
 	return 0;
 }
 
+static int qca_power_on(struct hci_dev *hdev)
+{
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
+	struct qca_serdev *qcadev;
+	int ret = 0;
+
+	if (qca_is_wcn399x(soc_type)) {
+		ret = qca_wcn3990_init(hu);
+	} else {
+		if (hu->serdev) {
+			qcadev = serdev_device_get_drvdata(hu->serdev);
+			gpiod_set_value_cansleep(qcadev->bt_en, 1);
+			/* Controller needs time to bootup. */
+			msleep(150);
+		}
+	}
+
+	return ret;
+}
+
 static int qca_setup(struct hci_uart *hu)
 {
 	struct hci_dev *hdev = hu->hdev;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
