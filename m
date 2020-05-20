Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292241DA69B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 02:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgETAay (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 20:30:54 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21923 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726348AbgETAax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 20:30:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589934652; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=W5+ip9yPJniF0Gb/X/D61hDFdXHwFiE0VFNFjBrMTl4=; b=CHtb57ylL26K5NkhxE8H//sb8pAJ9/sbhmzQagJrnUdOmffQaS+25rLV+4d8edWEf2NHqjkv
 PhuoWAJNydIcvxKYGZP+jVZeB5MCpBS1X3rTzac1mt5ajM90wfTRXiZnEy1yulYcMl7xF8Wc
 1/oU7jew5hVmtdPTbHxRGizY9L8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec47a30.7fd919ce99d0-smtp-out-n05;
 Wed, 20 May 2020 00:30:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A12AC433CB; Wed, 20 May 2020 00:30:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0AC3C433A0;
        Wed, 20 May 2020 00:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0AC3C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 5/6] bus: mhi: core: Introduce support for manual AMSS loading
Date:   Tue, 19 May 2020 17:30:30 -0700
Message-Id: <1589934631-22752-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
References: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During full boot chain firmware load, the PM state worker called in PBL
mode waits for SBL and then does the AMSS image download. This does not
allow usage of any SBL-specific channels and should only be done when
powering the device up synchronously. If the controller plans to use any
SBL channels using an asynchronous bootup flow, SBL device creation
cannot be neglected and the option to manually load the AMSS image when
the controller is ready also becomes necessary.

To allow this, introduce an optional boolean for 'manual_amss_load' and
give the controller a callback once the bus is ready to move out of SBL.
Introduce a public API for the controller to download the AMSS image and
rename the internal download function to use the generic _bhie suffix
over _amss.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 90 ++++++++++++++++++++++-----------------------
 drivers/bus/mhi/core/pm.c   |  6 +++
 include/linux/mhi.h         | 10 +++++
 3 files changed, 61 insertions(+), 45 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 34ce102..2528fb3 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -171,7 +171,7 @@ int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic)
 }
 EXPORT_SYMBOL_GPL(mhi_download_rddm_img);
 
-static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
+static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
 {
 	void __iomem *base = mhi_cntrl->bhie;
@@ -187,7 +187,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	}
 
 	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_TXVECSTATUS_SEQNUM_BMSK);
-	dev_dbg(dev, "Starting AMSS download via BHIe. Sequence ID:%u\n",
+	dev_dbg(dev, "Starting image download via BHIe. Sequence ID:%u\n",
 		sequence_id);
 	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECADDR_HIGH_OFFS,
 		      upper_32_bits(mhi_buf->dma_addr));
@@ -218,6 +218,34 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	return (!ret) ? -ETIMEDOUT : 0;
 }
 
+int mhi_download_amss_image(struct mhi_controller *mhi_cntrl)
+{
+	struct image_info *image_info = mhi_cntrl->fbc_image;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
+
+	if (!mhi_cntrl->fbc_download)
+		return -EINVAL;
+
+	if (!image_info)
+		return -EIO;
+
+	if (mhi_cntrl->ee != MHI_EE_SBL) {
+		dev_err(dev, "MHI could not load AMSS, EE:%s\n",
+			TO_MHI_EXEC_STR(mhi_cntrl->ee));
+		return -EINVAL;
+	}
+
+	ret = mhi_fw_load_bhie(mhi_cntrl,
+			       /* Vector table is the last entry */
+			       &image_info->mhi_buf[image_info->entries - 1]);
+	if (ret)
+		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_download_amss_image);
+
 static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 			   dma_addr_t dma_addr,
 			   size_t size)
@@ -386,7 +414,6 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 {
 	const struct firmware *firmware = NULL;
-	struct image_info *image_info;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	const char *fw_name;
 	void *buf;
@@ -441,27 +468,22 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		size = firmware->size;
 
 	buf = mhi_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
-	if (!buf) {
-		release_firmware(firmware);
-		return;
-	}
+	if (!buf)
+		goto exit_fw_load;
 
 	/* Download SBL or EDL image using BHI */
 	memcpy(buf, firmware->data, size);
 	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
 	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
 
-	if (!mhi_cntrl->fbc_download || ret || mhi_cntrl->ee == MHI_EE_EDL)
-		release_firmware(firmware);
-
 	/* Error or in EDL mode, we're done */
 	if (ret) {
 		dev_err(dev, "MHI did not load SBL/EDL image, ret:%d\n", ret);
-		return;
+		goto exit_fw_load;
 	}
 
 	if (mhi_cntrl->ee == MHI_EE_EDL)
-		return;
+		goto exit_fw_load;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_cntrl->dev_state = MHI_STATE_RESET;
@@ -474,8 +496,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (mhi_cntrl->fbc_download) {
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
 					   firmware->size);
-		if (ret)
-			goto error_alloc_fw_table;
+		if (ret) {
+			mhi_cntrl->fbc_image = NULL;
+			goto exit_fw_load;
+		}
 
 		/* Load the firmware into BHIE vec table */
 		mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
@@ -484,42 +508,18 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 fw_load_ee_pthru:
 	/* Transitioning into MHI RESET->READY state */
 	ret = mhi_ready_state_transition(mhi_cntrl);
-
-	if (!mhi_cntrl->fbc_download)
-		return;
-
 	if (ret) {
 		dev_err(dev, "MHI did not enter READY state\n");
-		goto error_read;
-	}
-
-	/* Wait for the SBL event */
-	ret = wait_event_timeout(mhi_cntrl->state_event,
-				 mhi_cntrl->ee == MHI_EE_SBL ||
-				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
-				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
-	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
-		dev_err(dev, "MHI did not enter SBL\n");
-		goto error_read;
+		if (mhi_cntrl->fbc_download) {
+			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
+			mhi_cntrl->fbc_image = NULL;
+		}
 	}
 
-	/* Start full firmware image download */
-	image_info = mhi_cntrl->fbc_image;
-	ret = mhi_fw_load_amss(mhi_cntrl,
-			       /* Vector table is the last entry */
-			       &image_info->mhi_buf[image_info->entries - 1]);
-	if (ret)
-		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
-
-	release_firmware(firmware);
+exit_fw_load:
+	if (firmware)
+		release_firmware(firmware);
 
 	return;
-
-error_read:
-	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
-	mhi_cntrl->fbc_image = NULL;
-
-error_alloc_fw_table:
-	release_firmware(firmware);
 }
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 52c290c6..5041df9 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -655,6 +655,12 @@ void mhi_pm_st_worker(struct work_struct *work)
 			 * either SBL or AMSS states
 			 */
 			mhi_create_devices(mhi_cntrl);
+
+			/* notify controller it can move out of SBL */
+			if (mhi_cntrl->manual_amss_load)
+				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_SBL);
+			else
+				mhi_download_amss_image(mhi_cntrl);
 			break;
 		case DEV_ST_TRANSITION_MISSION_MODE:
 			mhi_pm_mission_mode_transition(mhi_cntrl);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 42e4d1e..2eb98a9 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -33,6 +33,7 @@
  * @MHI_CB_PENDING_DATA: New data available for client to process
  * @MHI_CB_LPM_ENTER: MHI host entered low power mode
  * @MHI_CB_LPM_EXIT: MHI host about to exit low power mode
+ * @MHI_CB_EE_SBL: MHI device entered SBL exec env (for manually loading AMSS)
  * @MHI_CB_EE_RDDM: MHI device entered RDDM exec env
  * @MHI_CB_EE_MISSION_MODE: MHI device entered Mission Mode exec env
  * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
@@ -44,6 +45,7 @@ enum mhi_callback {
 	MHI_CB_PENDING_DATA,
 	MHI_CB_LPM_ENTER,
 	MHI_CB_LPM_EXIT,
+	MHI_CB_EE_SBL,
 	MHI_CB_EE_RDDM,
 	MHI_CB_EE_MISSION_MODE,
 	MHI_CB_SYS_ERROR,
@@ -354,6 +356,7 @@ struct mhi_controller_config {
  * @buffer_len: Bounce buffer length
  * @bounce_buf: Use of bounce buffer
  * @fbc_download: MHI host needs to do complete image transfer (optional)
+ * @manual_amss_load: Set to manually trigger AMSS image transfer (optional)
  * @pre_init: MHI host needs to do pre-initialization before power up
  * @wake_set: Device wakeup set flag
  *
@@ -444,6 +447,7 @@ struct mhi_controller {
 	size_t buffer_len;
 	bool bounce_buf;
 	bool fbc_download;
+	bool manual_amss_load;
 	bool pre_init;
 	bool wake_set;
 };
@@ -646,6 +650,12 @@ void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
 int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic);
 
 /**
+ * mhi_download_amss_image - Download AMSS/mission mode image to the device
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_download_amss_image(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_force_rddm_mode - Force device into rddm mode
  * @mhi_cntrl: MHI controller
  */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
