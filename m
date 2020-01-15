Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6827D13BB97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 09:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgAOI4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 03:56:07 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:27172 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729164AbgAOI4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 03:56:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579078566; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9Mzek4TbadeoYMk/0W+CHntDAT6lGDwJBFpJtzZP33M=; b=sjNjmOfFLzvHrD8paNiJ4gT3xNKeORWxzSwq1vqnAvSA4OI6x8JX0xEFmQN1FqjmO2/Cjl9I
 VXRPpbgQ1T1acMhF2ev51Uu3OVcJhOaI1A4pohtOH7Xm+JqHJhUfDZeEZ60Oyyg/RxiW04TW
 9Ec2+2leC+BKdlUkgB7+iDYnoWA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1ed3a3.7f4669ab8730-smtp-out-n03;
 Wed, 15 Jan 2020 08:56:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B6C9C447A6; Wed, 15 Jan 2020 08:56:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0043BC447AC;
        Wed, 15 Jan 2020 08:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0043BC447AC
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, hemantg@codeaurora.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v4 2/3] Bluetooth: hci_qca: Retry btsoc initialize when it fails
Date:   Wed, 15 Jan 2020 16:55:51 +0800
Message-Id: <20200115085552.11483-2-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115085552.11483-1-rjliao@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20200115085552.11483-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the retry of btsoc initialization when it fails. There are
reports that the btsoc initialization may fail on some platforms but the
repro ratio is very low. The symptoms is the firmware downloading failed
due to the UART write timed out. The failure may be caused by UART,
platform HW or the btsoc itself but it's very difficlut to root cause,
given the repro ratio is very low. Add a retry for the btsoc initialization
can work around most of the failures and make Bluetooth finally works.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---

Changes in v2: None
Changes in v3: None
Changes in v4:
  -rebased the patch with latet code
  -refined macro and variable name
  -updated commit message

 drivers/bluetooth/hci_qca.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ecb74965be10..1139142e8eed 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -55,6 +55,9 @@
 /* Controller debug log header */
 #define QCA_DEBUG_HANDLE	0x2EDC
 
+/* max retry count when init fails */
+#define MAX_INIT_RETRIES 3
+
 /* Controller dump header */
 #define QCA_SSR_DUMP_HANDLE		0x0108
 #define QCA_DUMP_PACKET_SIZE		255
@@ -1539,6 +1542,7 @@ static int qca_setup(struct hci_uart *hu)
 	struct hci_dev *hdev = hu->hdev;
 	struct qca_data *qca = hu->priv;
 	unsigned int speed, qca_baudrate = QCA_BAUDRATE_115200;
+	unsigned int retries = 0;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	const char *firmware_name = qca_get_firmware_name(hu);
 	int ret;
@@ -1559,6 +1563,7 @@ static int qca_setup(struct hci_uart *hu)
 	bt_dev_info(hdev, "setting up %s",
 		qca_is_wcn399x(soc_type) ? "wcn399x" : "ROME");
 
+retry:
 	ret = qca_power_on(hdev);
 	if (ret)
 		return ret;
@@ -1613,6 +1618,20 @@ static int qca_setup(struct hci_uart *hu)
 		 * patch/nvm-config is found, so run with original fw/config.
 		 */
 		ret = 0;
+	} else {
+		if (retries < MAX_INIT_RETRIES) {
+			qca_power_shutdown(hu);
+			if (hu->serdev) {
+				serdev_device_close(hu->serdev);
+				ret = serdev_device_open(hu->serdev);
+				if (ret) {
+					bt_dev_err(hdev, "failed to open port");
+					return ret;
+				}
+			}
+			retries++;
+			goto retry;
+		}
 	}
 
 	/* Setup bdaddr */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
