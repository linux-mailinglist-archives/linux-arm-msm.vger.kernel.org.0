Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CEE3F4704
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 10:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhHWI7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 04:59:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:40721 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233944AbhHWI7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 04:59:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629709118; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=T55Merzr/SXckbGnhzfre8Q+hDjDewsq/TcE4N/rGG0=; b=UfCN9QkAmeh54aD3GznHPR61i96cxKWXUvc6yY9FCIafs1NLEpn9g2f3HvODK3NaSwZvPxHW
 hcYtUMLbn08NIcbXQ94E8M9CrWMG6u3PL1G3BPLD204eR/kV6yKzF9e/PixR/nOiCvnxOcn2
 PESIR1HW3BjN/liM/lKlbWEsrxo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 612363370f9b337f11b6e5e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 08:58:31
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63064C4360C; Mon, 23 Aug 2021 08:58:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9158EC4338F;
        Mon, 23 Aug 2021 08:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9158EC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v4] Bluetooth: btusb: Add support using different nvm for variant WCN6855 controller
Date:   Mon, 23 Aug 2021 16:58:20 +0800
Message-Id: <1629709100-9099-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tim Jiang <tjiang@codeaurora.org>

we have variant wcn6855 soc chip from different vendors, so we should
use different nvm file with suffix to distinguish them.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
 drivers/bluetooth/btusb.c | 46 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 60d2fce59a71..9b4408307138 100644
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
@@ -3326,22 +3330,24 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
 	return err;
 }
 
-static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
-				    struct qca_version *ver,
-				    const struct qca_device_info *info)
+static void btusb_generate_qca_nvm_name(char **fwname,
+					int max_size,
+					struct qca_version *ver,
+					char *separator,
+					char *vendor)
 {
-	const struct firmware *fw;
-	char fwname[64];
-	int err;
-
 	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
 		/* if boardid equal 0, use default nvm without surfix */
 		if (le16_to_cpu(ver->board_id) == 0x0) {
-			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
-				 le32_to_cpu(ver->rom_version));
+			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x%s%s.bin",
+				 le32_to_cpu(ver->rom_version),
+				 separator,
+				 vendor);
 		} else {
-			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
+			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x%s%s%04x.bin",
 				le32_to_cpu(ver->rom_version),
+				separator,
+				vendor,
 				le16_to_cpu(ver->board_id));
 		}
 	} else {
@@ -3349,6 +3355,26 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 			 le32_to_cpu(ver->rom_version));
 	}
 
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
+			btusb_generate_qca_nvm_name(&fwname, sizeof(fwname), ver, "_", "gf");
+		break;
+	default:
+			btusb_generate_qca_nvm_name(&fwname, sizeof(fwname), ver, NULL, NULL);
+		break;
+	}
+
 	err = request_firmware(&fw, fwname, &hdev->dev);
 	if (err) {
 		bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

