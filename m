Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503D214668E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgAWLTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:19:20 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37278 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgAWLTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:19:18 -0500
Received: by mail-pj1-f66.google.com with SMTP id m13so1147205pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7x+RRKDQ+82parLCWdi8TmyvsjI5/vfpTHYZFDjvwR0=;
        b=MRgTl5Az91oaXaAfTU5deBxF8g2k5XHvtJaXQ+EN7dKBk1Uc0L5q82PJ1x30tnNWLE
         Zqr5fsErGMdPAPvzB4uKOd5B4sr+7iTtaYEFkpsRPk1zfHiuz/Sxp0eG1DiiBElWTh4u
         qfS+mKVIKDnnHmyBju6wRBo7vb5YAORb5AmAJryn2JeQ1WPpyzKHGLKfIcROg0frNRuF
         t41IhPywJo42L91rHKmBOq4zXYnINIVqGnno61NDZWOvn3SMJXNi7PIPw8D+au+H3/fj
         q2lFVgqH+bX8ymuD9fsSGb8ts7BHMt8OHiJvY2f6+g49oTRKIRZ49ESm1ioOfyzSIfZM
         cmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7x+RRKDQ+82parLCWdi8TmyvsjI5/vfpTHYZFDjvwR0=;
        b=PFr7NtCI7/Yq/+l1jm/DcnCV5k0qrc+Vwu0e49FDQf9QxT0IEdxKnAXbgL2b5+ACR1
         /sDDpihNNDOWZWsljZAdvywxh5G/fFJSXoMa3f4wZ89b8H7o4fBEoH2QGJRDNeB/7YgG
         cuie2mVEfeSZe6yabWw8CbfYSTRvObV76SH38nUg/flRi+txgRTjH2rCQudexAOvah8o
         j/yyZDaTbBDiKdMLTI/P4WT15g5z0qSG07uWgtki9qYnqPB3FKF03H5iKw9k/JAWp2KE
         3L9DjDUYUek6Gg28bLzHCnV77Pznh1rzD+7G1GDRUl6TYaKRxTrryUFHEHCM6H+soZiO
         m98w==
X-Gm-Message-State: APjAAAVZPvdCjWvKnqzvZcjnjRX5L6iMiWp2GeJIfqHMQ8Q6h/gSnmg8
        ZUrE+yGW3FY+zlCe/AZ0h3fJ
X-Google-Smtp-Source: APXvYqwXpk3yf/PGAa/Oqsk5+ZlEbUjkByryMmw7NQA+qPRKaJEQIhmL9OAtaJDbSjnd7nAsh/iTQw==
X-Received: by 2002:a17:902:fe0d:: with SMTP id g13mr2067516plj.124.1579778357255;
        Thu, 23 Jan 2020 03:19:17 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:19:16 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/16] bus: mhi: core: Add support for downloading RDDM image during panic
Date:   Thu, 23 Jan 2020 16:48:29 +0530
Message-Id: <20200123111836.7414-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI protocol supports downloading RDDM (RAM Dump) image from the
device through BHIE. This is useful to debugging as the RDDM image
can capture the firmware state.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/989

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[mani: splitted the data transfer patch and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c     | 153 ++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c     |  38 ++++++++
 drivers/bus/mhi/core/internal.h |   2 +
 drivers/bus/mhi/core/pm.c       |  31 +++++++
 include/linux/mhi.h             |  24 +++++
 5 files changed, 248 insertions(+)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 36956fb6eff2..facfec26eca1 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -20,6 +20,159 @@
 #include <linux/wait.h>
 #include "internal.h"
 
+/* Setup RDDM vector table for RDDM transfer and program RXVEC */
+void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
+		      struct image_info *img_info)
+{
+	struct mhi_buf *mhi_buf = img_info->mhi_buf;
+	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
+	void __iomem *base = mhi_cntrl->bhie;
+	u32 sequence_id;
+	unsigned int i;
+
+	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
+		bhi_vec->dma_addr = mhi_buf->dma_addr;
+		bhi_vec->size = mhi_buf->len;
+	}
+
+	dev_dbg(mhi_cntrl->dev, "BHIe programming for RDDM\n");
+
+	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECADDR_HIGH_OFFS,
+		      upper_32_bits(mhi_buf->dma_addr));
+
+	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECADDR_LOW_OFFS,
+		      lower_32_bits(mhi_buf->dma_addr));
+
+	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECSIZE_OFFS, mhi_buf->len);
+	sequence_id = prandom_u32() & BHIE_RXVECSTATUS_SEQNUM_BMSK;
+
+	if (unlikely(!sequence_id))
+		sequence_id = 1;
+
+	mhi_write_reg_field(mhi_cntrl, base, BHIE_RXVECDB_OFFS,
+			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
+			    sequence_id);
+
+	dev_dbg(mhi_cntrl->dev, "Address: %p and len: 0x%lx sequence: %u\n",
+		&mhi_buf->dma_addr, mhi_buf->len, sequence_id);
+}
+
+/* Collect RDDM buffer during kernel panic */
+static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
+{
+	int ret;
+	u32 rx_status;
+	enum mhi_ee_type ee;
+	const u32 delayus = 2000;
+	u32 retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
+	const u32 rddm_timeout_us = 200000;
+	int rddm_retry = rddm_timeout_us / delayus;
+	void __iomem *base = mhi_cntrl->bhie;
+
+	dev_dbg(mhi_cntrl->dev,
+		"Entered with pm_state:%s dev_state:%s ee:%s\n",
+		to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		TO_MHI_EXEC_STR(mhi_cntrl->ee));
+
+	/*
+	 * This should only be executing during a kernel panic, we expect all
+	 * other cores to shutdown while we're collecting RDDM buffer. After
+	 * returning from this function, we expect the device to reset.
+	 *
+	 * Normaly, we read/write pm_state only after grabbing the
+	 * pm_lock, since we're in a panic, skipping it. Also there is no
+	 * gurantee that this state change would take effect since
+	 * we're setting it w/o grabbing pm_lock
+	 */
+	mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
+	/* update should take the effect immediately */
+	smp_wmb();
+
+	/*
+	 * Make sure device is not already in RDDM. In case the device asserts
+	 * and a kernel panic follows, device will already be in RDDM.
+	 * Do not trigger SYS ERR again and proceed with waiting for
+	 * image download completion.
+	 */
+	ee = mhi_get_exec_env(mhi_cntrl);
+	if (ee != MHI_EE_RDDM) {
+		dev_dbg(mhi_cntrl->dev,
+			"Trigger device into RDDM mode using SYS ERR\n");
+		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
+
+		dev_dbg(mhi_cntrl->dev, "Waiting for device to enter RDDM\n");
+		while (rddm_retry--) {
+			ee = mhi_get_exec_env(mhi_cntrl);
+			if (ee == MHI_EE_RDDM)
+				break;
+
+			udelay(delayus);
+		}
+
+		if (rddm_retry <= 0) {
+			/* Hardware reset so force device to enter RDDM */
+			dev_dbg(mhi_cntrl->dev,
+				"Did not enter RDDM, do a host req reset\n");
+			mhi_write_reg(mhi_cntrl, mhi_cntrl->regs,
+				      MHI_SOC_RESET_REQ_OFFSET,
+				      MHI_SOC_RESET_REQ);
+			udelay(delayus);
+		}
+
+		ee = mhi_get_exec_env(mhi_cntrl);
+	}
+
+	dev_dbg(mhi_cntrl->dev,
+		"Waiting for image download completion, current EE: %s\n",
+		TO_MHI_EXEC_STR(ee));
+
+	while (retry--) {
+		ret = mhi_read_reg_field(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS,
+					 BHIE_RXVECSTATUS_STATUS_BMSK,
+					 BHIE_RXVECSTATUS_STATUS_SHFT,
+					 &rx_status);
+		if (ret)
+			return -EIO;
+
+		if (rx_status == BHIE_RXVECSTATUS_STATUS_XFER_COMPL)
+			return 0;
+
+		udelay(delayus);
+	}
+
+	ee = mhi_get_exec_env(mhi_cntrl);
+	ret = mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx_status);
+
+	dev_err(mhi_cntrl->dev, "Did not complete RDDM transfer\n");
+	dev_err(mhi_cntrl->dev, "Current EE: %s\n", TO_MHI_EXEC_STR(ee));
+	dev_err(mhi_cntrl->dev, "RXVEC_STATUS: 0x%x\n", rx_status);
+
+	return -EIO;
+}
+
+/* Download RDDM image from device */
+int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic)
+{
+	void __iomem *base = mhi_cntrl->bhie;
+	u32 rx_status;
+
+	if (in_panic)
+		return __mhi_download_rddm_in_panic(mhi_cntrl);
+
+	/* Wait for the image download to complete */
+	wait_event_timeout(mhi_cntrl->state_event,
+			   mhi_read_reg_field(mhi_cntrl, base,
+					      BHIE_RXVECSTATUS_OFFS,
+					      BHIE_RXVECSTATUS_STATUS_BMSK,
+					      BHIE_RXVECSTATUS_STATUS_SHFT,
+					      &rx_status) || rx_status,
+			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
+
+	return (rx_status == BHIE_RXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
+}
+EXPORT_SYMBOL_GPL(mhi_download_rddm_img);
+
 /* Download AMSS image to device */
 static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 2f06bf958f58..f54429c9b7fc 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -830,6 +830,7 @@ EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
 	int ret;
+	u32 bhie_off;
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 
@@ -837,12 +838,44 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 	if (ret)
 		goto error_dev_ctxt;
 
+	/*
+	 * Allocate RDDM table if specified, this table is for debugging purpose
+	 */
+	if (mhi_cntrl->rddm_size) {
+		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
+				     mhi_cntrl->rddm_size);
+
+		/*
+		 * This controller supports RDDM, so we need to manually clear
+		 * BHIE RX registers since POR values are undefined.
+		 */
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
+				   &bhie_off);
+		if (ret) {
+			dev_err(mhi_cntrl->dev, "Error getting BHIE offset\n");
+			goto bhie_error;
+		}
+
+		memset_io(mhi_cntrl->regs + bhie_off + BHIE_RXVECADDR_LOW_OFFS,
+			  0, BHIE_RXVECSTATUS_OFFS - BHIE_RXVECADDR_LOW_OFFS +
+			  4);
+
+		if (mhi_cntrl->rddm_image)
+			mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
+	}
+
 	mhi_cntrl->pre_init = true;
 
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
 	return 0;
 
+bhie_error:
+	if (mhi_cntrl->rddm_image) {
+		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
+		mhi_cntrl->rddm_image = NULL;
+	}
+
 error_dev_ctxt:
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
@@ -857,6 +890,11 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->fbc_image = NULL;
 	}
 
+	if (mhi_cntrl->rddm_image) {
+		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
+		mhi_cntrl->rddm_image = NULL;
+	}
+
 	mhi_deinit_dev_ctxt(mhi_cntrl);
 	mhi_cntrl->pre_init = false;
 }
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index eab9c051ca5e..889e91bcb2f8 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -626,6 +626,8 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl);
 int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
+void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
+		      struct image_info *img_info);
 
 /* Memory allocation methods */
 static inline void *mhi_alloc_coherent(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index b67ae2455fc5..0bdc667830f0 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -453,6 +453,16 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 
 	/* We must notify MHI control driver so it can clean up first */
 	if (transition_state == MHI_PM_SYS_ERR_PROCESS) {
+		/*
+		 * If controller supports RDDM, we do not process
+		 * SYS error state, instead we will jump directly
+		 * to RDDM state
+		 */
+		if (mhi_cntrl->rddm_image) {
+			dev_dbg(mhi_cntrl->dev,
+				 "Controller supports RDDM, so skip SYS_ERR\n");
+			return;
+		}
 		mhi_cntrl->status_cb(mhi_cntrl, mhi_cntrl->priv_data,
 				     MHI_CB_SYS_ERROR);
 	}
@@ -901,3 +911,24 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 	return (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
 }
 EXPORT_SYMBOL(mhi_sync_power_up);
+
+int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
+{
+	int ret;
+
+	/* Check if device is already in RDDM */
+	if (mhi_cntrl->ee == MHI_EE_RDDM)
+		return 0;
+
+	dev_dbg(mhi_cntrl->dev, "Triggering SYS_ERR to force RDDM state\n");
+	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
+
+	/* Wait for RDDM event */
+	ret = wait_event_timeout(mhi_cntrl->state_event,
+				 mhi_cntrl->ee == MHI_EE_RDDM,
+				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+	ret = ret ? 0 : -EIO;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_force_rddm_mode);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 04c500323214..1b018e0d04f4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -290,9 +290,11 @@ struct mhi_controller_config {
  * @fw_image: Firmware image name for normal booting
  * @edl_image: Firmware image name for emergency download mode
  * @fbc_download: MHI host needs to do complete image transfer
+ * @rddm_size: RAM dump size that host should allocate for debugging purpose
  * @sbl_size: SBL image size
  * @seg_len: BHIe vector size
  * @fbc_image: Points to firmware image buffer
+ * @rddm_image: Points to RAM dump buffer
  * @max_chan: Maximum number of channels the controller supports
  * @mhi_chan: Points to the channel configuration table
  * @lpm_chans: List of channels that require LPM notifications
@@ -356,9 +358,11 @@ struct mhi_controller {
 	const char *fw_image;
 	const char *edl_image;
 	bool fbc_download;
+	size_t rddm_size;
 	size_t sbl_size;
 	size_t seg_len;
 	struct image_info *fbc_image;
+	struct image_info *rddm_image;
 	u32 max_chan;
 	struct mhi_chan *mhi_chan;
 	struct list_head lpm_chans;
@@ -583,4 +587,24 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
  */
 void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl);
 
+/**
+ * mhi_download_rddm_img - Download ramdump image from device for
+ *                         debugging purpose.
+ * @mhi_cntrl: MHI controller
+ * @in_panic: Download rddm image during kernel panic
+ */
+int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic);
+
+/**
+ * mhi_force_rddm_mode - Force device into rddm mode
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl);
+
+/**
+ * mhi_get_mhi_state - Get MHI state of the device
+ * @mhi_cntrl: MHI controller
+ */
+enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
+
 #endif /* _MHI_H_ */
-- 
2.17.1

