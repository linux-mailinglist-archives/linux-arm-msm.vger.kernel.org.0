Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C05131F46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 06:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgAGF13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 00:27:29 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:44496 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbgAGF12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 00:27:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578374847; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vgKhB3s7JYy/GZx22dlIXelC1zIwKoYUxSawh99Gnj0=; b=aVTZXkcdjr4r8n29bdgELM6c9zF0WCvPAdtguE+KjRGGrOAVMvfAdDwwRlKPJ9VLYgJDQoQH
 FPAS9keU8opY+aWjQKXDhLhyvHvohAmplzyavkq8pPoVm4augbAPh10yVASiemK4BN6k8zqE
 wjSbI4tB4fUhIepV+4QvE4DUxH4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1416be.7f9253902c70-smtp-out-n02;
 Tue, 07 Jan 2020 05:27:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C23CC43383; Tue,  7 Jan 2020 05:27:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07A65C433CB;
        Tue,  7 Jan 2020 05:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07A65C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Add qca_power_on() API to support both wcn399x and Rome power up
Date:   Tue,  7 Jan 2020 13:26:01 +0800
Message-Id: <20200107052601.32216-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a unified API qca_power_on() to support both wcn399x and
Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
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
