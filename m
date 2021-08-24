Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F55B3F59D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 10:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbhHXI3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 04:29:01 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44874 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbhHXI3A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 04:29:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629793696; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=WuylCgi/4XPRgUijyBbcjv2AT4kx6jzyKw0PfJfAgfc=; b=RtmqUNSHJYwPc9czy48nfnqoLt3IcS7dhfA+HsyoYmbnxfjLwMpz0HIzWz0jELQ4B0uU5K1b
 LVmxY9NhMyOOs4j2Jo7ADmIz7sHBcWf5PMZCc2/DhTzbum9sPFFNTdEMi4RbnOXQjzhbgCps
 6wx5HwBqeiuSdbaB2Tca7EUNqLk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6124ada01567234b8c83463a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Aug 2021 08:28:16
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 52D8AC43617; Tue, 24 Aug 2021 08:28:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9609C4338F;
        Tue, 24 Aug 2021 08:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A9609C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v5] Bluetooth: btusb: Add support using different nvm for variant WCN6855 controller
Date:   Tue, 24 Aug 2021 16:28:03 +0800
Message-Id: <1629793683-28770-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tim Jiang <tjiang@codeaurora.org>

we have variant wcn6855 soc chip from different foundries, so we should
use different nvm file with suffix to distinguish them.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
 drivers/bluetooth/btusb.c | 57 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 60d2fce59a71..ad7734f8917c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3141,6 +3141,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
 #define QCA_DFU_TIMEOUT		3000
 #define QCA_FLAG_MULTI_NVM      0x80
 
+#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
+#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
+
 struct qca_version {
 	__le32	rom_version;
 	__le32	patch_version;
@@ -3172,6 +3175,7 @@ static const struct qca_device_info qca_devices_table[] = {
 	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
 	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
 	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
+	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
 };
 
 static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
@@ -3326,27 +3330,56 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
 	return err;
 }
 
-static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
-				    struct qca_version *ver,
-				    const struct qca_device_info *info)
+static void btusb_generate_qca_nvm_name(char **fwname,
+					int max_size,
+					struct qca_version *ver,
+					char *foundry)
 {
-	const struct firmware *fw;
-	char fwname[64];
-	int err;
+	char *separator;
+	u16 board_id;
+	u32 rom_version;
+
+	separator = (foundry == NULL) ? "" : "_";
+	board_id = le16_to_cpu(ver->board_id);
+	rom_version = le32_to_cpu(ver->rom_version);
 
 	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
 		/* if boardid equal 0, use default nvm without surfix */
 		if (le16_to_cpu(ver->board_id) == 0x0) {
-			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
-				 le32_to_cpu(ver->rom_version));
+			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x%s%s.bin",
+				 rom_version,
+				 separator,
+				 foundry);
 		} else {
-			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
-				le32_to_cpu(ver->rom_version),
-				le16_to_cpu(ver->board_id));
+			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x%s%s%04x.bin",
+				rom_version,
+				separator,
+				foundry,
+				board_id);
 		}
 	} else {
 		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
-			 le32_to_cpu(ver->rom_version));
+			 rom_version);
+	}
+
+}
+
+static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
+				    struct qca_version *ver,
+				    const struct qca_device_info *info)
+{
+	const struct firmware *fw;
+	char fwname[64];
+	int err;
+
+	switch (ver->ram_version) {
+	case WCN6855_2_0_RAM_VERSION_GF:
+	case WCN6855_2_1_RAM_VERSION_GF:
+			btusb_generate_qca_nvm_name(&fwname, sizeof(fwname), ver, "gf");
+		break;
+	default:
+			btusb_generate_qca_nvm_name(&fwname, sizeof(fwname), ver, NULL);
+		break;
 	}
 
 	err = request_firmware(&fw, fwname, &hdev->dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

