Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE8014EDF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgAaNu4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:50:56 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44435 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbgAaNuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:50:51 -0500
Received: by mail-pl1-f193.google.com with SMTP id d9so2752620plo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MdP9OdCGYmb4BkV2P+W8/I4kFu/otHZ6reFe6dFpKTM=;
        b=vF+jJuhcQAPpQ7f5/rJlKIAPD1fXi5AprUIH5I68y4EsI/491N2ZpojLd6H2U+vdNy
         BVrQBI0xOEzV7PWOxQwMzF3o7w481HBhVWurEX9nlWSheMn0xN69EIWEV5V5Ep/17nVg
         ZG7S4Vb4Yh6ZYuveXwZCMZwP7FUOOSzgkvrVA6zJ776mDU5njgkGvh5xva/9i8/2UY6E
         UOY6g9oVxofWY7635cZFs+YdxPISpOIs5xl+oKPDLjVbMIH0Z8Nh314/IoXL9T6psDLa
         uOEIHY6PGdd9OtUaLAmAK867Clw4OjE4DyUg9aYPfVB6IPqAYdJwKycz1WKl9/W6HoY+
         oZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MdP9OdCGYmb4BkV2P+W8/I4kFu/otHZ6reFe6dFpKTM=;
        b=DSJUlQcSu0o6K9vB7Qd7vOubiO8jwHgMBZ7Ld1s1V8phRkMyqecqpbQ8nBLU7f7qaP
         O5yOW0vfHhIJmTdsDmUV8Pum9voPLpxIj4fYMMbZ2iPYOBysJANjJwwSupQqhmPUgLtc
         ypgT/vAQT/KtGPTUhZFeaqBBIaHgyEi05ARmlB3Av3dUa5Wg6l23lUMWmKIf7a8FB3ws
         EpqUQnjVvzRUAayM4PG8GYHDFTkb//hU1HmeCd//Cu+FCCsgH/zkSX6PRjAS1GwKASWE
         ncUNvHYb7O9SmQ5MfPnAik+4o4kx5RLV7W0ROt1yhYx/Y4fzBJ6sQu9t62HOxnaLov6d
         ZFMg==
X-Gm-Message-State: APjAAAWU7whfrRm+mzTh0tundOm+PRRf/Bu3dTTUhLDSGaM7viQLoykU
        xbGfKpDN9PhNt/WAJvrit0si
X-Google-Smtp-Source: APXvYqw8fRmTETBHRZrAFFGP17okMFxT3KRKYo5YZQeb+yVnJEjH8Q+ZIlUXYFBdSV4enmBTq3OhSA==
X-Received: by 2002:a17:902:7e4b:: with SMTP id a11mr10244546pln.61.1580478650672;
        Fri, 31 Jan 2020 05:50:50 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:50:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 09/16] bus: mhi: core: Add support for downloading RDDM image during panic
Date:   Fri, 31 Jan 2020 19:20:02 +0530
Message-Id: <20200131135009.31477-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
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
 drivers/bus/mhi/core/boot.c     | 157 +++++++++++++++++++++++++++++++-
 drivers/bus/mhi/core/init.c     |  38 ++++++++
 drivers/bus/mhi/core/internal.h |   2 +
 drivers/bus/mhi/core/pm.c       |  31 +++++++
 include/linux/mhi.h             |  24 +++++
 5 files changed, 249 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 36956fb6eff2..564d61f98257 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -20,7 +20,159 @@
 #include <linux/wait.h>
 #include "internal.h"
 
-/* Download AMSS image to device */
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
 static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
 {
@@ -64,7 +216,6 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	return (tx_status == BHIE_TXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
 }
 
-/* Download SBL image to device */
 static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
 			   dma_addr_t dma_addr,
 			   size_t size)
@@ -90,7 +241,7 @@ static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
 		goto invalid_pm_state;
 	}
 
-	/* Start SBL download via BHI protocol */
+	dev_dbg(mhi_cntrl->dev, "Starting SBL download via BHI\n");
 	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
 		      upper_32_bits(dma_addr));
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 68071d0130f1..d0886de1c8bb 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -843,6 +843,7 @@ EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
 	int ret;
+	u32 bhie_off;
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 
@@ -850,12 +851,44 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
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
 
@@ -870,6 +903,11 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
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
index 01047a8c47e1..8ce1f11b8074 100644
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
index b4bedf139184..19987068b475 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -447,6 +447,16 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 
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
 		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
 	}
 
@@ -894,3 +904,24 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
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
index e6dc0a517b33..5ce99939a624 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -306,9 +306,11 @@ struct mhi_controller_config {
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
@@ -362,9 +364,11 @@ struct mhi_controller {
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
@@ -565,4 +569,24 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
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

