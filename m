Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C191E0A98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 11:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389477AbgEYJbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 05:31:47 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:20929 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389328AbgEYJbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 05:31:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590399106; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rcy53dhh00j/cAlkf1xHyg4tWgvBbT8cJ1wghUEPwrA=; b=DwtyaKIS9GfLiN0L9M+mb0+KwuI28CeYg/fKyIwtIHFP+tzYQZGZ3qikOE+v0cDM36RiQooU
 6GUhRmg9c9+jIlKmTtmv+A+rSqV8qFOgigI67BX0gu8UMyJY2zkpVA40CyBs1wRc5sMsM27G
 bnIfxvRCygMG9CbmQ/Mz+RAeEw0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ecb907c7171b6d7e4bc3080 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 May 2020 09:31:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13391C433CA; Mon, 25 May 2020 09:31:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1767EC433C9;
        Mon, 25 May 2020 09:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1767EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: [PATCH v1] bluetooth: hci_qca: Fix qca6390 enable failure after warm reboot
Date:   Mon, 25 May 2020 17:31:12 +0800
Message-Id: <1590399072-32407-1-git-send-email-zijuhu@codeaurora.org>
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
 drivers/bluetooth/btqca.c   |  8 ++++----
 drivers/bluetooth/hci_qca.c | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 3ea866d..7bbdf4d 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -74,10 +74,10 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
 
 	ver = (struct qca_btsoc_version *)(edl->data);
 
-	BT_DBG("%s: Product:0x%08x", hdev->name, le32_to_cpu(ver->product_id));
-	BT_DBG("%s: Patch  :0x%08x", hdev->name, le16_to_cpu(ver->patch_ver));
-	BT_DBG("%s: ROM    :0x%08x", hdev->name, le16_to_cpu(ver->rom_ver));
-	BT_DBG("%s: SOC    :0x%08x", hdev->name, le32_to_cpu(ver->soc_id));
+	BT_INFO("%s: Product:0x%08x", hdev->name, le32_to_cpu(ver->product_id));
+	BT_INFO("%s: Patch  :0x%08x", hdev->name, le16_to_cpu(ver->patch_ver));
+	BT_INFO("%s: ROM    :0x%08x", hdev->name, le16_to_cpu(ver->rom_ver));
+	BT_INFO("%s: SOC    :0x%08x", hdev->name, le32_to_cpu(ver->soc_id));
 
 	/* QCA chipset version can be decided by patch and SoC
 	 * version, combination with upper 2 bytes from SoC
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e4a6823..a4f86e4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1975,6 +1975,32 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	hci_uart_unregister_device(&qcadev->serdev_hu);
 }
 
+static void qca_serdev_shutdown(struct device *dev)
+{
+	int res;
+	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	u8 ibs_wake_cmd[] = {0xfd};
+	u8 edl_reset_soc_cmd[] = {0x01, 0x00, 0xfc, 0x01, 0x05};
+
+	if (qcadev->btsoc_type == QCA_QCA6390) {
+		serdev_device_write_flush(serdev);
+		res = serdev_device_write_buf(serdev,
+				ibs_wake_cmd, sizeof(ibs_wake_cmd));
+		BT_INFO("%s: send ibs_wake_cmd res = %d", __func__, res);
+		serdev_device_wait_until_sent(serdev, timeout);
+		usleep_range(8000, 10000);
+
+		serdev_device_write_flush(serdev);
+		res = serdev_device_write_buf(serdev,
+				edl_reset_soc_cmd, sizeof(edl_reset_soc_cmd));
+		BT_INFO("%s: send edl_reset_soc_cmd res = %d", __func__, res);
+		serdev_device_wait_until_sent(serdev, timeout);
+		usleep_range(8000, 10000);
+	}
+}
+
 static int __maybe_unused qca_suspend(struct device *dev)
 {
 	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
@@ -2100,6 +2126,7 @@ static struct serdev_device_driver qca_serdev_driver = {
 		.name = "hci_uart_qca",
 		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
 		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
+		.shutdown = qca_serdev_shutdown,
 		.pm = &qca_pm_ops,
 	},
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

