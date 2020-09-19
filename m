Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420172709E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgISCD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:03:27 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:32247 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgISCDW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:03:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600481001; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tNfBCn8uDHAVYw2elYSQKwcfEDctqDNWrrV4Glkme4s=; b=Il+oTpq/B1se4xAEFWL1p71Br3Bbd5pTHYTcHj+NrFbMnnr+cJkTNzZul4lxY71C6gymwQ0Z
 UF/pY55zRLqGFCiZo2PhpyTZKBu0BUfAnrn89ZWjaX1o6YcYa5mjgRuITWSeiVMvdivmm9A2
 +PwHACRjT8PIqK4aO2fOS936c/o=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f6566c97334da8678b091b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:02:49
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48F88C43385; Sat, 19 Sep 2020 02:02:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F0D0C43382;
        Sat, 19 Sep 2020 02:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F0D0C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 08/10] bus: mhi: core: Move to an error state on any firmware load failure
Date:   Fri, 18 Sep 2020 19:02:33 -0700
Message-Id: <1600480955-16827-9-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move MHI to a firmware download error state for a failure to find
the firmware files or to load SBL or EBL image using BHI/BHIe. This
helps detect an error state sooner and shortens the wait for a
synchronous power up timeout.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 43 +++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 92b8dd3..fcc71f2 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -425,13 +425,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
@@ -443,7 +443,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	buf = mhi_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
 	if (!buf) {
 		release_firmware(firmware);
-		return;
+		goto error_fw_load;
 	}
 
 	/* Download SBL or EDL image using BHI */
@@ -451,17 +451,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
 	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
 
-	if (!mhi_cntrl->fbc_download || ret || mhi_cntrl->ee == MHI_EE_EDL)
-		release_firmware(firmware);
-
 	/* Error or in EDL mode, we're done */
 	if (ret) {
 		dev_err(dev, "MHI did not load SBL/EDL image, ret:%d\n", ret);
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
@@ -474,13 +474,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
@@ -490,7 +494,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (ret) {
 		dev_err(dev, "MHI did not enter READY state\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Wait for the SBL event */
@@ -501,7 +505,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "MHI did not enter SBL\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Start full firmware image download */
@@ -509,17 +513,20 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_bhie(mhi_cntrl,
 			       /* Vector table is the last entry */
 			       &image_info->mhi_buf[image_info->entries - 1]);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
-
-	release_firmware(firmware);
+		goto error_fw_load;
+	}
 
 	return;
 
-error_read:
+error_ready_state:
 	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 	mhi_cntrl->fbc_image = NULL;
 
-error_alloc_fw_table:
-	release_firmware(firmware);
+error_fw_load:
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	mhi_cntrl->pm_state = MHI_PM_FW_DL_ERR;
+	wake_up_all(&mhi_cntrl->state_event);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

