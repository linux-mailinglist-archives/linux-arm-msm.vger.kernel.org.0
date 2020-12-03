Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC2A2CCE26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 05:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbgLCE6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 23:58:14 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:49067 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbgLCE6N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 23:58:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606971468; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HWuXebYv12wNMeG1Ca/OcvuDX/u/4CvTfnBhCKp9NuU=; b=Ra0sK4y2K1wOZcuV28lqOKnl6kOT1985EsjLJFD+gKp/F/eSHiX3abcHo4009/AjTXCYB6dh
 uf3Qt2QMVgqXTR8lcyzWLAR1TiCNDqbNf1m7up7G773D5itFKMBXpWbD5KGRy6JxCLnijApl
 HpvW3JyB+AVbdqq5XLhCeiZeIRk=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fc8703235b60e964a8d86ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 04:57:22
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 419ACC43463; Thu,  3 Dec 2020 04:57:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5688C43460;
        Thu,  3 Dec 2020 04:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5688C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v1] Bluetooth: btusb: support download nvm with different board id for wcn6855
Date:   Thu,  3 Dec 2020 12:57:14 +0800
Message-Id: <1606971434-23709-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tim Jiang <tjiang@codeaurora.org>

we define many nvm files for wcn6855 btsoc and host driver
should find the correct nvm file based on board ID and then
download it.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
 drivers/bluetooth/btusb.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 3bbe8f43e7fa..c5d4a3084282 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3469,12 +3469,14 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
 #define QCA_SYSCFG_UPDATED	0x40
 #define QCA_PATCH_UPDATED	0x80
 #define QCA_DFU_TIMEOUT		3000
+#define QCA_FLAG_MULTI_NVM      0x80
 
 struct qca_version {
 	__le32	rom_version;
 	__le32	patch_version;
 	__le32	ram_version;
-	__le32	ref_clock;
+	__le16	board_id;
+	__le16	flag;
 	__u8	reserved[4];
 } __packed;
 
@@ -3657,8 +3659,14 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
 	char fwname[64];
 	int err;
 
-	snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
-		 le32_to_cpu(ver->rom_version));
+	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
+		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
+			 le32_to_cpu(ver->rom_version),
+			 le16_to_cpu(ver->board_id));
+	} else {
+		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
+			 le32_to_cpu(ver->rom_version));
+	}
 
 	err = request_firmware(&fw, fwname, &hdev->dev);
 	if (err) {
@@ -3725,6 +3733,11 @@ static int btusb_setup_qca(struct hci_dev *hdev)
 			return err;
 	}
 
+	err = btusb_qca_send_vendor_req(udev, QCA_GET_TARGET_VERSION, &ver,
+					sizeof(ver));
+	if (err < 0)
+		return err;
+
 	if (!(status & QCA_SYSCFG_UPDATED)) {
 		err = btusb_setup_qca_load_nvm(hdev, &ver, info);
 		if (err < 0)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

