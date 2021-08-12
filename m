Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB203EA101
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 10:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbhHLIvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 04:51:20 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30536 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235234AbhHLIvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 04:51:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628758254; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ya9+Ha0SGv8ND1/LQ97Qs9nz9/yO8+sXj545J9GZXEQ=; b=tuP22MvE8QyAWUCTeXXndBC6n8eEqVBm6usLkXxOttLpwX6KLv2bjoh4T1ZEqUaZ4gs9dGsd
 dYJVFiwFrIhML4WvXNecbGZ2eVgtp0q4qaGax7/BVdJCh/uNndPBmHPa0D9wmYUC31AfQdQ2
 XqCOdSlAKKp1lWbkWkN6HqAJ2EM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6114e0d176c3a9a17204dd6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 08:50:25
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86A29C43460; Thu, 12 Aug 2021 08:50:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2263C433F1;
        Thu, 12 Aug 2021 08:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2263C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v3] Bluetooth: btusb: Add support different nvm to distinguish different factory for WCN6855 controller
Date:   Thu, 12 Aug 2021 16:50:16 +0800
Message-Id: <1628758216-3201-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tim Jiang <tjiang@codeaurora.org>

we have different factory to produce wcn6855 soc chip, so we should
use different nvm file with suffix to distinguish them.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
 drivers/bluetooth/btusb.c | 60 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b1a05bb9f4bf..d7b4e0f1c3e3 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4013,6 +4013,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
 #define QCA_DFU_TIMEOUT		3000
 #define QCA_FLAG_MULTI_NVM      0x80
 
+#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
+#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
+
 struct qca_version {
 	__le32	rom_version;
 	__le32	patch_version;
@@ -4044,6 +4047,7 @@ static const struct qca_device_info qca_devices_table[] = {
 	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
 	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
 	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
+	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
 };
 
 static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
@@ -4198,6 +4202,39 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
 	return err;
 }
 
+static int btusb_setup_qca_form_nvm_name(char **fwname,
+					int max_size,
+					struct qca_version *ver,
+					char *factory)
+{
+	/* if boardid equal 0, use default nvm without suffix */
+	switch (le16_to_cpu(ver->board_id)) {
+	case 0x0:
+		/* we add suffix factory to distinguish with different factory. */
+		if (factory != NULL) {
+			snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%s.bin",
+				 le32_to_cpu(ver->rom_version),
+				 factory);
+		} else {
+			snprintf(*fwname, max_size, "qca/nvm_usb_%08x.bin",
+				 le32_to_cpu(ver->rom_version));
+		}
+		break;
+	default:
+		if (factory != NULL) {
+			snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%s_%04x.bin",
+				le32_to_cpu(ver->rom_version),
+				factory,
+				le16_to_cpu(ver->board_id));
+		} else {
+			snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%04x.bin",
+				le32_to_cpu(ver->rom_version),
+				le16_to_cpu(ver->board_id));
+		}
+		break;
+	}
+}
+
 static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 				    struct qca_version *ver,
 				    const struct qca_device_info *info)
@@ -4206,19 +4243,24 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 	char fwname[64];
 	int err;
 
-	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
-		/* if boardid equal 0, use default nvm without surfix */
-		if (le16_to_cpu(ver->board_id) == 0x0) {
+	switch (ver->ram_version) {
+	case WCN6855_2_0_RAM_VERSION_GF:
+	case WCN6855_2_1_RAM_VERSION_GF:
+		if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
+			btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, "gf");
+		} else {
 			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
 				 le32_to_cpu(ver->rom_version));
+		}
+		break;
+	default:
+		if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
+			btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, NULL);
 		} else {
-			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
-				le32_to_cpu(ver->rom_version),
-				le16_to_cpu(ver->board_id));
+			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
+				 le32_to_cpu(ver->rom_version));
 		}
-	} else {
-		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
-			 le32_to_cpu(ver->rom_version));
+		break;
 	}
 
 	err = request_firmware(&fw, fwname, &hdev->dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

