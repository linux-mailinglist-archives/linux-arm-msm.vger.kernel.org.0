Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEA5408486
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 08:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237373AbhIMGMM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 02:12:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15559 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237330AbhIMGMF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 02:12:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631513450; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=X0lqQRbWV8fWiShZFkmLGQXY4Cdbj1ipT5h/wddHdkw=; b=xXn+hJ9Tfr9jGMqCYp+G50T24AzloGT+RbXkDvq2R4ZnztOmtstnWKSMbokS3iaq9J3j7iDw
 c/ZAsQrGcMuVkiovAmkp+am7CPY+K4oqmnsxZjVSMp3/UxJ5IAA2zVhdNAOrkOt05pZEEKnT
 NzrH9TkUuNFaf1x5S/A45iSbh5s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 613eeb3e648642cc1cc3d5b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 06:10:06
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59DFBC4360C; Mon, 13 Sep 2021 06:10:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C88DAC4338F;
        Mon, 13 Sep 2021 06:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C88DAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v9] Bluetooth: btusb: Add support using different nvm for variant WCN6855 controller
Date:   Mon, 13 Sep 2021 14:09:59 +0800
Message-Id: <1631513399-22826-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

the RF performance of wcn6855 soc chip from different foundries will be
difference, so we should use different nvm to configure them.

Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
---
 drivers/bluetooth/btusb.c | 51 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 928cbfa4c42d..7b23cfd131f6 100644
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
+	char *sep = (strlen(variant) == 0) ? "" : "_";
+	u16 board_id = le16_to_cpu(ver->board_id);
+	u32 rom_version = le32_to_cpu(ver->rom_version);
+
+	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
+		/* if boardid equal 0, use default nvm without suffix */
+		if (board_id == 0x0) {
+			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s.bin",
+				rom_version, sep, variant);
+		} else {
+			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s_%04x.bin",
+				rom_version, sep, variant, board_id);
+		}
+	} else {
+		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin",
+			rom_version);
+	}
+
+}
+
 static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 				    struct qca_version *ver,
 				    const struct qca_device_info *info)
@@ -3354,19 +3383,15 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
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
+
+	default:
+			btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "");
+		break;
 	}
 
 	err = request_firmware(&fw, fwname, &hdev->dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

