Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B7F165AD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 11:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgBTJ7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 04:59:55 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34894 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgBTJ7y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 04:59:54 -0500
Received: by mail-pg1-f196.google.com with SMTP id v23so1692467pgk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=692zWF+n/5ULWO7Kzf5TWf9hgHH7PNN1jeFwNhvpPVE=;
        b=xx80UvHVUAGQeG4ucSGxAAHOqwbDlDQvRXlQRDiQyZZdSWkj8mKDelhYstq072i1wv
         L7smjBWu0Hf9J3iLasujIZVHgsfQxW7WWlp0bIlCalp0mkID7HE2JfhcDbMNlgb5oJgC
         +Z01TX3ZWUelJrz7upnH33341l92MHVSQsMam7gGWHNDqcNVxdcgaCujEtJDyc/n1aT3
         7nKoysMtKArjQXc9oKAOovbI5rNswB6GpVgWveSM1QncvVUIE8bEkbQvp1iHZm/hx1Lk
         KiMBHfGAmgCkfq6Y7XQ2f1UKlQYI+9SkDzEd2K+6zsaMy0DvSPNKEBEQaUeEwFJ3W+Jl
         VKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=692zWF+n/5ULWO7Kzf5TWf9hgHH7PNN1jeFwNhvpPVE=;
        b=GKVP5RfD1zjDxltCpKTSCDx+EvdhDtTLkGza6uQet3AAo0CYp68Ei2bPrw7gCvq1Oy
         L9dnfZfHLtA///mdpFDjrqpl2SMGHfILe4rrwcxwhSFJOTUUjSbX+/hlkWFWNFCbe5zU
         thZbQBixOlH7V3DrmFzKpw8oyAA3bHxCLxm7+i6mCXolNgjlsga+HADkbhUd6Kg0HM3J
         wFojinW9kLklODOF47JokrAwRL043U4ZgrXR+fzrU90gT/AXsS+VLy/vsZKaRqQyJdDG
         zSfL6eIarZD+iiwUA+q4jWXR5NuC2z1uzk6ER+3rjyvdYBVpV5brAaf2PNVwv10meSEr
         SpQw==
X-Gm-Message-State: APjAAAVFQFZ0MKyrheuvhkr0hijYhPkdczuVY8DO3j0j7eb8yjVHaNL+
        DfA/EbiW+b+mXfi+vTJaaEzh
X-Google-Smtp-Source: APXvYqx7EksR3KDoiybqH3hmFwXRAoOAc7v4/3bnyAGlrWxpk6G0hEkoplYwr5BLPGEJ2i0N5+753Q==
X-Received: by 2002:aa7:84c4:: with SMTP id x4mr31202923pfn.144.1582192793920;
        Thu, 20 Feb 2020 01:59:53 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:315:9501:edda:4222:88ae:442f])
        by smtp.gmail.com with ESMTPSA id b3sm2678644pjo.30.2020.02.20.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 01:59:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 09/16] bus: mhi: core: Add support for downloading RDDM image during panic
Date:   Thu, 20 Feb 2020 15:28:47 +0530
Message-Id: <20200220095854.4804-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
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
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c     | 152 ++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c     |  39 ++++++++
 drivers/bus/mhi/core/internal.h |   2 +
 drivers/bus/mhi/core/pm.c       |  32 +++++++
 include/linux/mhi.h             |  24 +++++
 5 files changed, 249 insertions(+)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 26422a7da35b..220faa886eb3 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -18,6 +18,158 @@
 #include <linux/wait.h>
 #include "internal.h"
 
+/* Setup RDDM vector table for RDDM transfer and program RXVEC */
+void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
+		      struct image_info *img_info)
+{
+	struct mhi_buf *mhi_buf = img_info->mhi_buf;
+	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
+	void __iomem *base = mhi_cntrl->bhie;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	u32 sequence_id;
+	unsigned int i;
+
+	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
+		bhi_vec->dma_addr = mhi_buf->dma_addr;
+		bhi_vec->size = mhi_buf->len;
+	}
+
+	dev_dbg(dev, "BHIe programming for RDDM\n");
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
+	dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u\n",
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
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+
+	dev_dbg(dev, "Entered with pm_state:%s dev_state:%s ee:%s\n",
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
+		dev_dbg(dev, "Trigger device into RDDM mode using SYS ERR\n");
+		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
+
+		dev_dbg(dev, "Waiting for device to enter RDDM\n");
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
+			dev_dbg(dev,
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
+	dev_dbg(dev, "Waiting for image download completion, current EE: %s\n",
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
+	dev_err(dev, "Did not complete RDDM transfer\n");
+	dev_err(dev, "Current EE: %s\n", TO_MHI_EXEC_STR(ee));
+	dev_err(dev, "RXVEC_STATUS: 0x%x\n", rx_status);
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
 static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
 {
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index fffcbcdeb6c6..e81cdd0207e2 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -843,6 +843,8 @@ EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	u32 bhie_off;
 	int ret;
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
@@ -851,12 +853,44 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
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
+			dev_err(dev, "Error getting BHIE offset\n");
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
 
@@ -871,6 +905,11 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
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
index 0f6246c6162e..e1d3f2ca4922 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -614,6 +614,8 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl);
 int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
+void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
+		      struct image_info *img_info);
 
 /* Memory allocation methods */
 static inline void *mhi_alloc_coherent(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index bfe0371f6e75..2ba2f6aba9d5 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -450,6 +450,16 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 
 	/* We must notify MHI control driver so it can clean up first */
 	if (transition_state == MHI_PM_SYS_ERR_PROCESS) {
+		/*
+		 * If controller supports RDDM, we do not process
+		 * SYS error state, instead we will jump directly
+		 * to RDDM state
+		 */
+		if (mhi_cntrl->rddm_image) {
+			dev_dbg(dev,
+				 "Controller supports RDDM, so skip SYS_ERR\n");
+			return;
+		}
 		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
 	}
 
@@ -895,3 +905,25 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 	return (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
 }
 EXPORT_SYMBOL(mhi_sync_power_up);
+
+int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
+
+	/* Check if device is already in RDDM */
+	if (mhi_cntrl->ee == MHI_EE_RDDM)
+		return 0;
+
+	dev_dbg(dev, "Triggering SYS_ERR to force RDDM state\n");
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
index 630643f6b4a4..d3453a1de835 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -283,9 +283,11 @@ struct mhi_controller_config {
  * @iova_stop: IOMMU stop address for data (required)
  * @fw_image: Firmware image name for normal booting (required)
  * @edl_image: Firmware image name for emergency download mode (optional)
+ * @rddm_size: RAM dump size that host should allocate for debugging purpose
  * @sbl_size: SBL image size downloaded through BHIe (optional)
  * @seg_len: BHIe vector size (optional)
  * @fbc_image: Points to firmware image buffer
+ * @rddm_image: Points to RAM dump buffer
  * @mhi_chan: Points to the channel configuration table
  * @lpm_chans: List of channels that require LPM notifications
  * @irq: base irq # to request (required)
@@ -343,9 +345,11 @@ struct mhi_controller {
 	dma_addr_t iova_stop;
 	const char *fw_image;
 	const char *edl_image;
+	size_t rddm_size;
 	size_t sbl_size;
 	size_t seg_len;
 	struct image_info *fbc_image;
+	struct image_info *rddm_image;
 	struct mhi_chan *mhi_chan;
 	struct list_head lpm_chans;
 	int *irq;
@@ -545,4 +549,24 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
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

