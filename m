Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9841D88D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 22:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbgERUEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 16:04:35 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23565 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726916AbgERUEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 16:04:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589832271; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=V94ZBtElrYKPuW5itFPhUi9hnQTxAz3rOMgMz//e1VI=; b=UJ/c2lXlTe/8nBbFdE85rorGt3X6VxnPpSF3Am9TvlUJSvM4Vj6ZNZBnJK09tBrB5iJAoGIs
 ebmcsHZuEjqE5S3OHGNp0f5nBKuJdhV79tn+TwVL65VTAfOhwUYtB7N4/0ObgDQRYvNJraqt
 zOnd4d/oN4BsxIUaAYicpW5lVwk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec2ea3b.7fdc5f16c538-smtp-out-n05;
 Mon, 18 May 2020 20:04:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18405C432C2; Mon, 18 May 2020 20:04:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D9BFC432C2;
        Mon, 18 May 2020 20:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D9BFC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 6/7] bus: mhi: core: Read and save device hardware information from BHI
Date:   Mon, 18 May 2020 13:04:00 -0700
Message-Id: <1589832241-13867-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
References: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device hardware specific information such as serial number and the OEM
PK hash can be read using BHI and saved on host to identify the
endpoint.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 17 ++++++++++++++++-
 include/linux/mhi.h         |  6 ++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 0b38014..24422f5 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -392,13 +392,28 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	void *buf;
 	dma_addr_t dma_addr;
 	size_t size;
-	int ret;
+	int i, ret;
 
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "Device MHI is not in valid state\n");
 		return;
 	}
 
+	/* save hardware info from BHI */
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
+			   &mhi_cntrl->serial_number);
+	if (ret)
+		dev_err(dev, "Could not capture serial number via BHI\n");
+
+	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
+				   &mhi_cntrl->oem_pk_hash[i]);
+		if (ret) {
+			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
+			break;
+		}
+	}
+
 	/* If device is in pass through, do reset to ready state transition */
 	if (mhi_cntrl->ee == MHI_EE_PTHRU)
 		goto fw_load_ee_pthru;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 026a624..42e4d1e 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -19,6 +19,8 @@
 #define MHI_VOTE_BUS BIT(0) /* do not disable the mhi bus */
 #define MHI_VOTE_DEVICE BIT(1) /* prevent mhi device from entering lpm */
 
+#define MHI_MAX_OEM_PK_HASH_SEGMENTS 16
+
 struct mhi_chan;
 struct mhi_event;
 struct mhi_ctxt;
@@ -318,6 +320,8 @@ struct mhi_controller_config {
  * @device_number: MHI controller device number
  * @major_version: MHI controller major revision number
  * @minor_version: MHI controller minor revision number
+ * @serial_number: MHI controller serial number obtained from BHI
+ * @oem_pk_hash: MHI controller OEM PK Hash obtained from BHI
  * @mhi_event: MHI event ring configurations table
  * @mhi_cmd: MHI command ring configurations table
  * @mhi_ctxt: MHI device context, shared memory between host and device
@@ -397,6 +401,8 @@ struct mhi_controller {
 	u32 device_number;
 	u32 major_version;
 	u32 minor_version;
+	u32 serial_number;
+	u32 oem_pk_hash[MHI_MAX_OEM_PK_HASH_SEGMENTS];
 
 	struct mhi_event *mhi_event;
 	struct mhi_cmd *mhi_cmd;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
