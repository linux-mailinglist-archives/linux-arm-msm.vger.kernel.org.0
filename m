Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABEA43F551
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 05:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhJ2DYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 23:24:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59596 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbhJ2DYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 23:24:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635477696; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=f9ELE3XFHgCqFFWaYVemj6qQsCZZydJmyA2ZOMfqJhk=; b=XN7vGWaItDb74o4FBf/lHm3qehZuNxQ8Hf5UMXprWT6/DeIcU2XHkYP0S2ot5deUJedHZ4Wv
 4hZyygDvf20wpiejkRlVgcKbRMqMenv4bhVpCZJF0C8icGw92t1j2LkxFlt6Tu9E+j4jj237
 OMLpJJXmQ+xaapx2IjUU+HdB40g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 617b68b4f6a3eeacf92824a4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 03:21:24
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE06FC43460; Fri, 29 Oct 2021 03:21:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC362C4338F;
        Fri, 29 Oct 2021 03:21:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 29 Oct 2021 11:21:21 +0800
From:   tjiang@codeaurora.org
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v16] Bluetooth: btusb: Add support using different nvm for 
 variant WCN6855 controller
Message-ID: <4c12452739c0d7fa1c6a4f5998515767@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

the RF performance of wcn6855 soc chip from different foundries will be
difference, so we should use different nvm to configure them.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
  drivers/bluetooth/btusb.c | 54 
+++++++++++++++++++++++++++++++++++------------
  1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 87b71740fad8..16bb5de3ce2f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3195,6 +3195,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev 
*hdev,
  #define QCA_DFU_TIMEOUT		3000
  #define QCA_FLAG_MULTI_NVM      0x80

+#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
+#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
+
  struct qca_version {
  	__le32	rom_version;
  	__le32	patch_version;
@@ -3226,6 +3229,7 @@ static const struct qca_device_info 
qca_devices_table[] = {
  	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
  	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
  	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
+	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
  };

  static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 
request,
@@ -3380,6 +3384,41 @@ static int btusb_setup_qca_load_rampatch(struct 
hci_dev *hdev,
  	return err;
  }

+static void btusb_generate_qca_nvm_name(char *fwname,
+					size_t max_size,
+					const struct qca_version *ver)
+{
+	u32 rom_version = le32_to_cpu(ver->rom_version);
+	u16 flag = le16_to_cpu(ver->flag);
+
+	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
+		u16 board_id = le16_to_cpu(ver->board_id);
+		const char *variant ;
+
+		switch (le32_to_cpu(ver->ram_version)) {
+		case WCN6855_2_0_RAM_VERSION_GF:
+		case WCN6855_2_1_RAM_VERSION_GF:
+			variant = "_gf";
+			break;
+		default:
+			variant = "";
+			break;
+		}
+
+		if (board_id == 0) {
+			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s.bin",
+				rom_version, variant);
+		} else {
+			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s_%04x.bin",
+				rom_version, variant, board_id);
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
@@ -3388,20 +3427,7 @@ static int btusb_setup_qca_load_nvm(struct 
hci_dev *hdev,
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
-	}
+	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);

  	err = request_firmware(&fw, fwname, &hdev->dev);
  	if (err) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
