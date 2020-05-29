Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0975A1E7F62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 15:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgE2N5G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 09:57:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51148 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgE2N5G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 09:57:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590760626; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Wr5sKPj3cbNRii8RkVOZIpAdi+WCB6wAQ6VS4PDVqSA=; b=q589Y4D8HQQ7rKP0a2rSyFg01ibq/YZSqe7z2iJR27Z84kV/udZgfNTChzxH1Oub4qZuCWVp
 leJv4/K28VB0zfi0SfmLhiMwQDtrptMtgzLJxAjzuxAtEWsKKwZ8jqZvOecevyKChbl6+qxJ
 +Zwz57epmQYMfEOiE3wFW7RyOg8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ed114b13ac6f4f603b949cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 May 2020 13:57:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3136C43387; Fri, 29 May 2020 13:57:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F978C433C9;
        Fri, 29 May 2020 13:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2F978C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: [PATCH v2] Bluetooth: hci_qca: Fix qca6390 enable failure after warm reboot
Date:   Fri, 29 May 2020 21:56:57 +0800
Message-Id: <1590760617-30285-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Warm reboot can not reset controller qca6390 due to
lack of controllable power supply, so causes firmware
download failure during enable.

Fixed by sending VSC EDL_SOC_RESET to reset qca6390
within added device shutdown implementation.

Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
Tested-by: Zijun Hu <zijuhu@codeaurora.org>
---
Changes in v2:
- rebase

 drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index adcbe00a2275..aa957d749d6f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1975,6 +1975,38 @@ static void qca_serdev_remove(struct serdev_device *serdev)
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
+		ret = serdev_device_write_buf(serdev, ibs_wake_cmd,
+					      sizeof(ibs_wake_cmd));
+		if (ret < 0) {
+			BT_ERR("QCA send IBS_WAKE_IND error: %d", ret);
+			return;
+		}
+		serdev_device_wait_until_sent(serdev, timeout);
+		usleep_range(8000, 10000);
+
+		serdev_device_write_flush(serdev);
+		ret = serdev_device_write_buf(serdev, edl_reset_soc_cmd,
+					      sizeof(edl_reset_soc_cmd));
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
 	struct serdev_device *serdev = to_serdev_device(dev);
@@ -2102,6 +2134,7 @@ static struct serdev_device_driver qca_serdev_driver = {
 		.name = "hci_uart_qca",
 		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
 		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
+		.shutdown = qca_serdev_shutdown,
 		.pm = &qca_pm_ops,
 	},
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

