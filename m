Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17783FF93A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 06:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbhICEEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 00:04:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:31704 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbhICEDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 00:03:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630641771; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EMhgptSs9B0phDTNF/T32JFQu6DIrhsYsE9MW/ujn2U=; b=hH5QWV7k0lEcKUQBdbFcXxrBqF/rCyV9jklv2ZKO71ozqnE0HV/vRnmmM89AXI7wzooTR+2C
 QT6yzgiX/t/igk8au0r/ydUGwwooU201tM6ZHTUD+FZH4MvrAgXikkUrVNZ0bwru8FJ5SNeP
 9ef7sJMydOgFyjFWJLZ2Y7Q+JWw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61319e66e0fcecca190f8542 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 04:02:46
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDEADC43617; Fri,  3 Sep 2021 04:02:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 283BBC4338F;
        Fri,  3 Sep 2021 04:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 283BBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v8] Bluetooth: btusb: Add support using different nvm for variant WCN6855 controller
Date:   Fri,  3 Sep 2021 12:02:38 +0800
Message-Id: <1630641758-22281-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tim Jiang <tjiang@codeaurora.org>

the RF perfermance of wcn6855 soc chip from different foundries will be
difference, so we should use different nvm to configure them.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
 drivers/bluetooth/btusb.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 928cbfa4c42d..0f5d2222d624 100644
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

