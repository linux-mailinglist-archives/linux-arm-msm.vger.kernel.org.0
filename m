Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500842AC63E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 21:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730678AbgKIUrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 15:47:45 -0500
Received: from z5.mailgun.us ([104.130.96.5]:40981 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730521AbgKIUro (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 15:47:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604954864; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9JLvaei8pjPvmW4rG4OT2A3wtry0NTvBRn9ZvctJPgc=; b=DrfujZCQ/nxH42hThkKCLF5Jg7MZRP2P8MaHh0vY7p0YnI1sxiFEIDnz9I7YxDbrNndkMfdE
 ts8/d7enOI44j+N4l7qcmBrkNYcmT76/T//PQOtdlmw3Tg72Ktl0L3Z5kZitgSGqaB4/tFTt
 kwhPfBKgqJu7ltMDrNu9JgOTbAQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fa9aaefc6df09e2f240dc66 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 20:47:43
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E00FC43382; Mon,  9 Nov 2020 20:47:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B17BC433C6;
        Mon,  9 Nov 2020 20:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B17BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 06/12] bus: mhi: core: Move to an error state on any firmware load failure
Date:   Mon,  9 Nov 2020 12:47:25 -0800
Message-Id: <1604954851-23396-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move MHI to a firmware download error state for a failure to find
the firmware files or to load SBL or EBL image using BHI/BHIe. This
helps detect an error state sooner and shortens the wait for a
synchronous power up timeout.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 2d7752c..7b57bb9a 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -428,13 +428,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 						     !mhi_cntrl->seg_len))) {
 		dev_err(dev,
 			"No firmware image defined or !sbl_size || !seg_len\n");
-		return;
+		goto error_fw_load;
 	}
 
 	ret = request_firmware(&firmware, fw_name, dev);
 	if (ret) {
 		dev_err(dev, "Error loading firmware: %d\n", ret);
-		return;
+		goto error_fw_load;
 	}
 
 	size = (mhi_cntrl->fbc_download) ? mhi_cntrl->sbl_size : firmware->size;
@@ -446,7 +446,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	buf = mhi_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
 	if (!buf) {
 		release_firmware(firmware);
-		return;
+		goto error_fw_load;
 	}
 
 	/* Download image using BHI */
@@ -454,17 +454,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
 	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
 
-	if (!mhi_cntrl->fbc_download || ret || mhi_cntrl->ee == MHI_EE_EDL)
-		release_firmware(firmware);
-
 	/* Error or in EDL mode, we're done */
 	if (ret) {
 		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
-		return;
+		release_firmware(firmware);
+		goto error_fw_load;
 	}
 
-	if (mhi_cntrl->ee == MHI_EE_EDL)
+	if (mhi_cntrl->ee == MHI_EE_EDL) {
+		release_firmware(firmware);
 		return;
+	}
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_cntrl->dev_state = MHI_STATE_RESET;
@@ -477,13 +477,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (mhi_cntrl->fbc_download) {
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
 					   firmware->size);
-		if (ret)
-			goto error_alloc_fw_table;
+		if (ret) {
+			release_firmware(firmware);
+			goto error_fw_load;
+		}
 
 		/* Load the firmware into BHIE vec table */
 		mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
 	}
 
+	release_firmware(firmware);
+
 fw_load_ee_pthru:
 	/* Transitioning into MHI RESET->READY state */
 	ret = mhi_ready_state_transition(mhi_cntrl);
@@ -512,11 +516,11 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_bhie(mhi_cntrl,
 			       /* Vector table is the last entry */
 			       &image_info->mhi_buf[image_info->entries - 1]);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "MHI did not load image over BHIe, ret: %d\n",
 			ret);
-
-	release_firmware(firmware);
+		goto error_fw_load;
+	}
 
 	return;
 
@@ -524,6 +528,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 	mhi_cntrl->fbc_image = NULL;
 
-error_alloc_fw_table:
-	release_firmware(firmware);
+error_fw_load:
+	mhi_cntrl->pm_state = MHI_PM_FW_DL_ERR;
+	wake_up_all(&mhi_cntrl->state_event);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

