Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB3A1E35B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgE0CdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:33:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15153 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbgE0CdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:33:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590546785; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8BrMrQ0WHpE6sJzBsEoUZuHRlDMDeWrAghmgXNEp9HY=; b=bT5Xb43FueDQkg30J2tRizeUGYOMxPCCHwubEIFMxpz8I4RTplGb5qH+8nT2xQ13WdePfD/S
 9YMcplP/6s75jsaCMuaBq2jKtsBxv2CFmlWkyz08aIBwGs9iPGfqqRTc4tRlTGBj+P5v3IR3
 2akwFaZ6gdTOAW93hhpZHQoOBGo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ecdd14fc28b2cdd986e96a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 02:32:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E13DC433C9; Wed, 27 May 2020 02:32:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C1F4C433C6;
        Wed, 27 May 2020 02:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7C1F4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: [PATCH v3] bluetooth: hci_qca: Fix qca6390 enable failure after warm reboot
Date:   Wed, 27 May 2020 10:32:39 +0800
Message-Id: <1590546759-27387-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Warm reboot can not restore qca6390 controller baudrate
to default due to lack of controllable BT_EN pin or power
supply, so fails to download firmware after warm reboot.

Fixed by sending EDL_SOC_RESET VSC to reset controller
within added device shutdown implementation.

Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e4a6823..4b6f8b6 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1975,6 +1975,34 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	hci_uart_unregister_device(&qcadev->serdev_hu);
 }
 
+static void qca_serdev_shutdown(struct device *dev)
+{
+	int ret;
+	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	const u8 ibs_wake_cmd[] = { 0xFD };
+	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };
+
+	if (qcadev->btsoc_type == QCA_QCA6390) {
+		serdev_device_write_flush(serdev);
+		serdev_device_write_buf(serdev,
+				ibs_wake_cmd, sizeof(ibs_wake_cmd));
+		serdev_device_wait_until_sent(serdev, timeout);
+		usleep_range(8000, 10000);
+
+		serdev_device_write_flush(serdev);
+		ret = serdev_device_write_buf(serdev,
+				edl_reset_soc_cmd, sizeof(edl_reset_soc_cmd));
+		if (ret < 0) {
+			BT_ERR("QCA send EDL_RESET_REQ error: %d", ret);
+			return;
+		}
+		serdev_device_wait_until_sent(serdev, timeout);
+		usleep_range(8000, 10000);
+	}
+}
+
 static int __maybe_unused qca_suspend(struct device *dev)
 {
 	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
@@ -2100,6 +2128,7 @@ static struct serdev_device_driver qca_serdev_driver = {
 		.name = "hci_uart_qca",
 		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
 		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
+		.shutdown = qca_serdev_shutdown,
 		.pm = &qca_pm_ops,
 	},
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

