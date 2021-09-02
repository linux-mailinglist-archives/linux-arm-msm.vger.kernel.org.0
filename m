Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4FB3FEAE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 10:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244888AbhIBI57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 04:57:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43537 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244850AbhIBI57 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 04:57:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630573021; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=H6hpSVRunzvfqnycIZ6/BaR3NskiDQJfsejgtp/GrDE=; b=NEq+umCZMD5zJa/t0qsfjEhvhAjus3UPDCPV/Uyf75lqoRzd2zw0mvvbLs10P+E/IS0ELwbs
 j9qDCX1u3nZAlZU7AjjvkINTIwXMZa/1BBsoS4Fh2HsVIjtjxIozNLPLj3omgM8Hy5aU6NEO
 61m/ViQsJENlYDz4eDi8hXPTSsw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 613091c6cd680e8969802f80 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 08:56:38
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94BA5C4360D; Thu,  2 Sep 2021 08:56:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C3EFC4338F;
        Thu,  2 Sep 2021 08:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2C3EFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v7] Bluetooth: btusb: Add support using different nvm for variant WCN6855 controller
Date:   Thu,  2 Sep 2021 16:56:26 +0800
Message-Id: <1630572986-30786-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tim Jiang <tjiang@codeaurora.org>

the RF perfermence of wcn6855 soc chip from different foundries will be
difference, so we should use different nvm to configure them.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
 drivers/bluetooth/btusb.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 928cbfa4c42d..218547f6097e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3161,6 +3161,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
 #define QCA_DFU_TIMEOUT		3000
 #define QCA_FLAG_MULTI_NVM      0x80
 
+#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
+#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
+
 struct qca_version {
 	__le32	rom_version;
 	__le32	patch_version;
@@ -3192,6 +3195,7 @@ static const struct qca_device_info qca_devices_table[] = {
 	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
 	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
 	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
+	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
 };
 
 static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
@@ -3346,6 +3350,31 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
 	return err;
 }
 
+static void btusb_generate_qca_nvm_name(char *fwname,
+					size_t max_size,
+					struct qca_version *ver,
+					char *variant)
+{
+	char *separator = (strlen(variant) == 0) ? "" : "_";
+	u16 board_id = le16_to_cpu(ver->board_id);
+	u32 rom_version = le32_to_cpu(ver->rom_version);
+
+	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
+		/* if boardid equal 0, use default nvm without suffix */
+		if (board_id == 0x0) {
+			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s.bin",
+				 rom_version, separator, variant);
+		} else {
+			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s_%04x.bin",
+				rom_version, separator,	variant, board_id);
+		}
+	} else {
+		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin",
+			 rom_version);
+	}
+
+}
+
 static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 				    struct qca_version *ver,
 				    const struct qca_device_info *info)
@@ -3354,19 +3383,14 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 	char fwname[64];
 	int err;
 
-	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
-		/* if boardid equal 0, use default nvm without surfix */
-		if (le16_to_cpu(ver->board_id) == 0x0) {
-			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
-				 le32_to_cpu(ver->rom_version));
-		} else {
-			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
-				le32_to_cpu(ver->rom_version),
-				le16_to_cpu(ver->board_id));
-		}
-	} else {
-		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
-			 le32_to_cpu(ver->rom_version));
+	switch (ver->ram_version) {
+	case WCN6855_2_0_RAM_VERSION_GF:
+	case WCN6855_2_1_RAM_VERSION_GF:
+			btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "gf");
+		break;
+	default:
+			btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "");
+		break;
 	}
 
 	err = request_firmware(&fw, fwname, &hdev->dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

