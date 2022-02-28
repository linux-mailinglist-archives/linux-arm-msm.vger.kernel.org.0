Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51D94C6CE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbiB1MpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236641AbiB1MpH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:45:07 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D8D47569
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:44:19 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id iq13-20020a17090afb4d00b001bc4437df2cso11254898pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxtZZOug5pAozaT+Hjy+nXQP3phus2MtPvrSLnbfFXs=;
        b=o2n1A/YUUqp4OCKi0bGq3tGbM0g2TFyXUpC8rF1mqzC9s3i4SLRWAgZh0co9+JDc2P
         8qgGIhFjpyKAqDRKftF/2a6cMEeiOOTvFZnrDTkYTTO5S58qTqq20BuscQ5JncFk6V4C
         jGuLd40x9kpkJ/LuFbjFYENl+lDOY+VsxFPaqUKa44MoyEkLZaz4uYOKHIxrc6HbdaOk
         HdPs09SZc6z5tIO6wFyCbbkbBwLQhacZsheqwtkYRszSyMMOvZ/yxqhHsHAQ8fLJLgSx
         ZoN1t1L4T3inCZn2DBDskN50KBURXHgoWYu+8qgUal6zG/QF9AW6IDWQbgjkMvz9XZig
         TUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxtZZOug5pAozaT+Hjy+nXQP3phus2MtPvrSLnbfFXs=;
        b=Dum6zD6bjoB2xZszy+SB83qAcvpQ4BupcbpdH0vxQCUooXGAmgiy57CDxfPxqbnXGL
         xPkBfamojoeHim05u/YBs2/254TgTG3soliBKrG0TOtAncglafR7w3izOgwKIPTKSaTg
         ndfxDRPOweMxCIMSGrJtPjLygSu/LhOUYPcHNTjWUQEHsGpDy9dG7Gdq6S+jU5eL7SSX
         ZmX6eYmJa0klKfgIDDuPcUcEuotifoeIb8j7zjTWjLKFWjmykszBj/HMioJFcLZ3aFXt
         9Xs79IOwZb5UMgwHOr1enJ7JJC2QeIsWeX5Pk2EImthfPsvfwK1u+F4ZdGDCv/zjG2ta
         L89A==
X-Gm-Message-State: AOAM532DioZkQXGbhJCmEoKDRrdGg8F5GO0DRV4Qv7oBWyO+jgM6dceI
        slAv/48N89L/IEA6o/cq5M4s
X-Google-Smtp-Source: ABdhPJz8N+rFTg1EoHnoTkkFgFU71E0bSwYHkhCZ3gPpDUxO3ESVXGVyI745j0u1kEwVnZrwnJjEbQ==
X-Received: by 2002:a17:90a:6c05:b0:1bc:94af:13d4 with SMTP id x5-20020a17090a6c0500b001bc94af13d4mr16561779pjj.170.1646052259098;
        Mon, 28 Feb 2022 04:44:19 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:44:18 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 04/27] bus: mhi: Use bitfield operations for register read and write
Date:   Mon, 28 Feb 2022 18:13:21 +0530
Message-Id: <20220228124344.77359-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Functions like mhi_read_reg_field(), mhi_poll_reg_field() and
mhi_write_reg_field() could be modified to not depend on the shift value
passed as an argument. Instead, the bitfield operation could be used to
extract the shift value from the mask itself.

This eliminates the need to define _SHIFT (and _SHFT) macros and
simplifies the code a bit. For shift values those cannot be determined
during build time, "__ffs()" helper is used find the shift value during
runtime.

While at it, let's also get rid of 32-bit masks like CHDBOFF_CHDBOFF_MASK
by doing the full 32-bit register read.

Suggested-by: Alex Elder <elder@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/boot.c     |  15 ++--
 drivers/bus/mhi/host/debugfs.c  |  10 +--
 drivers/bus/mhi/host/init.c     |  67 ++++++++----------
 drivers/bus/mhi/host/internal.h | 120 +++++++-------------------------
 drivers/bus/mhi/host/main.c     |  16 ++---
 drivers/bus/mhi/host/pm.c       |  18 ++---
 6 files changed, 76 insertions(+), 170 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 74295d3cc662..d5ba3c7efb61 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -46,8 +46,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_RXVECSTATUS_SEQNUM_BMSK);
 
 	mhi_write_reg_field(mhi_cntrl, base, BHIE_RXVECDB_OFFS,
-			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
-			    sequence_id);
+			    BHIE_RXVECDB_SEQNUM_BMSK, sequence_id);
 
 	dev_dbg(dev, "Address: %p and len: 0x%zx sequence: %u\n",
 		&mhi_buf->dma_addr, mhi_buf->len, sequence_id);
@@ -127,9 +126,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 
 	while (retry--) {
 		ret = mhi_read_reg_field(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS,
-					 BHIE_RXVECSTATUS_STATUS_BMSK,
-					 BHIE_RXVECSTATUS_STATUS_SHFT,
-					 &rx_status);
+					 BHIE_RXVECSTATUS_STATUS_BMSK, &rx_status);
 		if (ret)
 			return -EIO;
 
@@ -168,7 +165,6 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 			   mhi_read_reg_field(mhi_cntrl, base,
 					      BHIE_RXVECSTATUS_OFFS,
 					      BHIE_RXVECSTATUS_STATUS_BMSK,
-					      BHIE_RXVECSTATUS_STATUS_SHFT,
 					      &rx_status) || rx_status,
 			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
@@ -203,8 +199,7 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECSIZE_OFFS, mhi_buf->len);
 
 	mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
-			    BHIE_TXVECDB_SEQNUM_BMSK, BHIE_TXVECDB_SEQNUM_SHFT,
-			    sequence_id);
+			    BHIE_TXVECDB_SEQNUM_BMSK, sequence_id);
 	read_unlock_bh(pm_lock);
 
 	/* Wait for the image download to complete */
@@ -213,7 +208,6 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 				 mhi_read_reg_field(mhi_cntrl, base,
 						   BHIE_TXVECSTATUS_OFFS,
 						   BHIE_TXVECSTATUS_STATUS_BMSK,
-						   BHIE_TXVECSTATUS_STATUS_SHFT,
 						   &tx_status) || tx_status,
 				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
@@ -265,8 +259,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	ret = wait_event_timeout(mhi_cntrl->state_event,
 			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
 			   mhi_read_reg_field(mhi_cntrl, base, BHI_STATUS,
-					      BHI_STATUS_MASK, BHI_STATUS_SHIFT,
-					      &tx_status) || tx_status,
+					      BHI_STATUS_MASK, &tx_status) || tx_status,
 			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
 		goto invalid_pm_state;
diff --git a/drivers/bus/mhi/host/debugfs.c b/drivers/bus/mhi/host/debugfs.c
index d818586c229d..bdc875d7bd4d 100644
--- a/drivers/bus/mhi/host/debugfs.c
+++ b/drivers/bus/mhi/host/debugfs.c
@@ -61,9 +61,9 @@ static int mhi_debugfs_events_show(struct seq_file *m, void *d)
 
 		seq_printf(m, "Index: %d intmod count: %lu time: %lu",
 			   i, (le32_to_cpu(er_ctxt->intmod) & EV_CTX_INTMODC_MASK) >>
-			   EV_CTX_INTMODC_SHIFT,
+			   __ffs(EV_CTX_INTMODC_MASK),
 			   (le32_to_cpu(er_ctxt->intmod) & EV_CTX_INTMODT_MASK) >>
-			   EV_CTX_INTMODT_SHIFT);
+			   __ffs(EV_CTX_INTMODT_MASK));
 
 		seq_printf(m, " base: 0x%0llx len: 0x%llx", le64_to_cpu(er_ctxt->rbase),
 			   le64_to_cpu(er_ctxt->rlen));
@@ -107,10 +107,10 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
 		seq_printf(m,
 			   "%s(%u) state: 0x%lx brstmode: 0x%lx pollcfg: 0x%lx",
 			   mhi_chan->name, mhi_chan->chan, (le32_to_cpu(chan_ctxt->chcfg) &
-			   CHAN_CTX_CHSTATE_MASK) >> CHAN_CTX_CHSTATE_SHIFT,
+			   CHAN_CTX_CHSTATE_MASK) >> __ffs(CHAN_CTX_CHSTATE_MASK),
 			   (le32_to_cpu(chan_ctxt->chcfg) & CHAN_CTX_BRSTMODE_MASK) >>
-			   CHAN_CTX_BRSTMODE_SHIFT, (le32_to_cpu(chan_ctxt->chcfg) &
-			   CHAN_CTX_POLLCFG_MASK) >> CHAN_CTX_POLLCFG_SHIFT);
+			   __ffs(CHAN_CTX_BRSTMODE_MASK), (le32_to_cpu(chan_ctxt->chcfg) &
+			   CHAN_CTX_POLLCFG_MASK) >> __ffs(CHAN_CTX_POLLCFG_MASK));
 
 		seq_printf(m, " type: 0x%x event ring: %u", le32_to_cpu(chan_ctxt->chtype),
 			   le32_to_cpu(chan_ctxt->erindex));
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index d8787aaa176b..ca068a017a42 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -4,6 +4,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
@@ -295,11 +296,11 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 
 		tmp = le32_to_cpu(chan_ctxt->chcfg);
 		tmp &= ~CHAN_CTX_CHSTATE_MASK;
-		tmp |= (MHI_CH_STATE_DISABLED << CHAN_CTX_CHSTATE_SHIFT);
+		tmp |= FIELD_PREP(CHAN_CTX_CHSTATE_MASK, MHI_CH_STATE_DISABLED);
 		tmp &= ~CHAN_CTX_BRSTMODE_MASK;
-		tmp |= (mhi_chan->db_cfg.brstmode << CHAN_CTX_BRSTMODE_SHIFT);
+		tmp |= FIELD_PREP(CHAN_CTX_BRSTMODE_MASK, mhi_chan->db_cfg.brstmode);
 		tmp &= ~CHAN_CTX_POLLCFG_MASK;
-		tmp |= (mhi_chan->db_cfg.pollcfg << CHAN_CTX_POLLCFG_SHIFT);
+		tmp |= FIELD_PREP(CHAN_CTX_POLLCFG_MASK, mhi_chan->db_cfg.pollcfg);
 		chan_ctxt->chcfg = cpu_to_le32(tmp);
 
 		chan_ctxt->chtype = cpu_to_le32(mhi_chan->type);
@@ -331,7 +332,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		tmp = le32_to_cpu(er_ctxt->intmod);
 		tmp &= ~EV_CTX_INTMODC_MASK;
 		tmp &= ~EV_CTX_INTMODT_MASK;
-		tmp |= (mhi_event->intmod << EV_CTX_INTMODT_SHIFT);
+		tmp |= FIELD_PREP(EV_CTX_INTMODT_MASK, mhi_event->intmod);
 		er_ctxt->intmod = cpu_to_le32(tmp);
 
 		er_ctxt->ertype = cpu_to_le32(MHI_ER_TYPE_VALID);
@@ -437,71 +438,70 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	struct {
 		u32 offset;
 		u32 mask;
-		u32 shift;
 		u32 val;
 	} reg_info[] = {
 		{
-			CCABAP_HIGHER, U32_MAX, 0,
+			CCABAP_HIGHER, U32_MAX,
 			upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
 		},
 		{
-			CCABAP_LOWER, U32_MAX, 0,
+			CCABAP_LOWER, U32_MAX,
 			lower_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
 		},
 		{
-			ECABAP_HIGHER, U32_MAX, 0,
+			ECABAP_HIGHER, U32_MAX,
 			upper_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
 		},
 		{
-			ECABAP_LOWER, U32_MAX, 0,
+			ECABAP_LOWER, U32_MAX,
 			lower_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
 		},
 		{
-			CRCBAP_HIGHER, U32_MAX, 0,
+			CRCBAP_HIGHER, U32_MAX,
 			upper_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
 		},
 		{
-			CRCBAP_LOWER, U32_MAX, 0,
+			CRCBAP_LOWER, U32_MAX,
 			lower_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
 		},
 		{
-			MHICFG, MHICFG_NER_MASK, MHICFG_NER_SHIFT,
+			MHICFG, MHICFG_NER_MASK,
 			mhi_cntrl->total_ev_rings,
 		},
 		{
-			MHICFG, MHICFG_NHWER_MASK, MHICFG_NHWER_SHIFT,
+			MHICFG, MHICFG_NHWER_MASK,
 			mhi_cntrl->hw_ev_rings,
 		},
 		{
-			MHICTRLBASE_HIGHER, U32_MAX, 0,
+			MHICTRLBASE_HIGHER, U32_MAX,
 			upper_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHICTRLBASE_LOWER, U32_MAX, 0,
+			MHICTRLBASE_LOWER, U32_MAX,
 			lower_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHIDATABASE_HIGHER, U32_MAX, 0,
+			MHIDATABASE_HIGHER, U32_MAX,
 			upper_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHIDATABASE_LOWER, U32_MAX, 0,
+			MHIDATABASE_LOWER, U32_MAX,
 			lower_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHICTRLLIMIT_HIGHER, U32_MAX, 0,
+			MHICTRLLIMIT_HIGHER, U32_MAX,
 			upper_32_bits(mhi_cntrl->iova_stop),
 		},
 		{
-			MHICTRLLIMIT_LOWER, U32_MAX, 0,
+			MHICTRLLIMIT_LOWER, U32_MAX,
 			lower_32_bits(mhi_cntrl->iova_stop),
 		},
 		{
-			MHIDATALIMIT_HIGHER, U32_MAX, 0,
+			MHIDATALIMIT_HIGHER, U32_MAX,
 			upper_32_bits(mhi_cntrl->iova_stop),
 		},
 		{
-			MHIDATALIMIT_LOWER, U32_MAX, 0,
+			MHIDATALIMIT_LOWER, U32_MAX,
 			lower_32_bits(mhi_cntrl->iova_stop),
 		},
 		{ 0, 0, 0 }
@@ -510,8 +510,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	dev_dbg(dev, "Initializing MHI registers\n");
 
 	/* Read channel db offset */
-	ret = mhi_read_reg_field(mhi_cntrl, base, CHDBOFF, CHDBOFF_CHDBOFF_MASK,
-				 CHDBOFF_CHDBOFF_SHIFT, &val);
+	ret = mhi_read_reg(mhi_cntrl, base, CHDBOFF, &val);
 	if (ret) {
 		dev_err(dev, "Unable to read CHDBOFF register\n");
 		return -EIO;
@@ -527,8 +526,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		mhi_chan->tre_ring.db_addr = base + val;
 
 	/* Read event ring db offset */
-	ret = mhi_read_reg_field(mhi_cntrl, base, ERDBOFF, ERDBOFF_ERDBOFF_MASK,
-				 ERDBOFF_ERDBOFF_SHIFT, &val);
+	ret = mhi_read_reg(mhi_cntrl, base, ERDBOFF, &val);
 	if (ret) {
 		dev_err(dev, "Unable to read ERDBOFF register\n");
 		return -EIO;
@@ -549,8 +547,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	/* Write to MMIO registers */
 	for (i = 0; reg_info[i].offset; i++)
 		mhi_write_reg_field(mhi_cntrl, base, reg_info[i].offset,
-				    reg_info[i].mask, reg_info[i].shift,
-				    reg_info[i].val);
+				    reg_info[i].mask, reg_info[i].val);
 
 	return 0;
 }
@@ -583,7 +580,7 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 
 	tmp = le32_to_cpu(chan_ctxt->chcfg);
 	tmp &= ~CHAN_CTX_CHSTATE_MASK;
-	tmp |= (MHI_CH_STATE_DISABLED << CHAN_CTX_CHSTATE_SHIFT);
+	tmp |= FIELD_PREP(CHAN_CTX_CHSTATE_MASK, MHI_CH_STATE_DISABLED);
 	chan_ctxt->chcfg = cpu_to_le32(tmp);
 
 	/* Update to all cores */
@@ -620,7 +617,7 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 
 	tmp = le32_to_cpu(chan_ctxt->chcfg);
 	tmp &= ~CHAN_CTX_CHSTATE_MASK;
-	tmp |= (MHI_CH_STATE_ENABLED << CHAN_CTX_CHSTATE_SHIFT);
+	tmp |= FIELD_PREP(CHAN_CTX_CHSTATE_MASK, MHI_CH_STATE_ENABLED);
 	chan_ctxt->chcfg = cpu_to_le32(tmp);
 
 	chan_ctxt->rbase = cpu_to_le64(tre_ring->iommu_base);
@@ -964,14 +961,10 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto err_destroy_wq;
 
-	mhi_cntrl->family_number = (soc_info & SOC_HW_VERSION_FAM_NUM_BMSK) >>
-					SOC_HW_VERSION_FAM_NUM_SHFT;
-	mhi_cntrl->device_number = (soc_info & SOC_HW_VERSION_DEV_NUM_BMSK) >>
-					SOC_HW_VERSION_DEV_NUM_SHFT;
-	mhi_cntrl->major_version = (soc_info & SOC_HW_VERSION_MAJOR_VER_BMSK) >>
-					SOC_HW_VERSION_MAJOR_VER_SHFT;
-	mhi_cntrl->minor_version = (soc_info & SOC_HW_VERSION_MINOR_VER_BMSK) >>
-					SOC_HW_VERSION_MINOR_VER_SHFT;
+	mhi_cntrl->family_number = FIELD_GET(SOC_HW_VERSION_FAM_NUM_BMSK, soc_info);
+	mhi_cntrl->device_number = FIELD_GET(SOC_HW_VERSION_DEV_NUM_BMSK, soc_info);
+	mhi_cntrl->major_version = FIELD_GET(SOC_HW_VERSION_MAJOR_VER_BMSK, soc_info);
+	mhi_cntrl->minor_version = FIELD_GET(SOC_HW_VERSION_MINOR_VER_BMSK, soc_info);
 
 	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
 	if (mhi_cntrl->index < 0) {
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 37c39bf1c7a9..156bf65b6810 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -12,120 +12,65 @@
 extern struct bus_type mhi_bus_type;
 
 #define MHIREGLEN (0x0)
-#define MHIREGLEN_MHIREGLEN_MASK (0xFFFFFFFF)
-#define MHIREGLEN_MHIREGLEN_SHIFT (0)
 
 #define MHIVER (0x8)
-#define MHIVER_MHIVER_MASK (0xFFFFFFFF)
-#define MHIVER_MHIVER_SHIFT (0)
 
 #define MHICFG (0x10)
-#define MHICFG_NHWER_MASK (0xFF000000)
-#define MHICFG_NHWER_SHIFT (24)
-#define MHICFG_NER_MASK (0xFF0000)
-#define MHICFG_NER_SHIFT (16)
-#define MHICFG_NHWCH_MASK (0xFF00)
-#define MHICFG_NHWCH_SHIFT (8)
-#define MHICFG_NCH_MASK (0xFF)
-#define MHICFG_NCH_SHIFT (0)
+#define MHICFG_NHWER_MASK (GENMASK(31, 24))
+#define MHICFG_NER_MASK (GENMASK(23, 16))
+#define MHICFG_NHWCH_MASK (GENMASK(15, 8))
+#define MHICFG_NCH_MASK (GENMASK(7, 0))
 
 #define CHDBOFF (0x18)
-#define CHDBOFF_CHDBOFF_MASK (0xFFFFFFFF)
-#define CHDBOFF_CHDBOFF_SHIFT (0)
 
 #define ERDBOFF (0x20)
-#define ERDBOFF_ERDBOFF_MASK (0xFFFFFFFF)
-#define ERDBOFF_ERDBOFF_SHIFT (0)
 
 #define BHIOFF (0x28)
-#define BHIOFF_BHIOFF_MASK (0xFFFFFFFF)
-#define BHIOFF_BHIOFF_SHIFT (0)
 
 #define BHIEOFF (0x2C)
-#define BHIEOFF_BHIEOFF_MASK (0xFFFFFFFF)
-#define BHIEOFF_BHIEOFF_SHIFT (0)
 
 #define DEBUGOFF (0x30)
-#define DEBUGOFF_DEBUGOFF_MASK (0xFFFFFFFF)
-#define DEBUGOFF_DEBUGOFF_SHIFT (0)
 
 #define MHICTRL (0x38)
-#define MHICTRL_MHISTATE_MASK (0x0000FF00)
-#define MHICTRL_MHISTATE_SHIFT (8)
-#define MHICTRL_RESET_MASK (0x2)
-#define MHICTRL_RESET_SHIFT (1)
+#define MHICTRL_MHISTATE_MASK (GENMASK(15, 8))
+#define MHICTRL_RESET_MASK (BIT(1))
 
 #define MHISTATUS (0x48)
-#define MHISTATUS_MHISTATE_MASK (0x0000FF00)
-#define MHISTATUS_MHISTATE_SHIFT (8)
-#define MHISTATUS_SYSERR_MASK (0x4)
-#define MHISTATUS_SYSERR_SHIFT (2)
-#define MHISTATUS_READY_MASK (0x1)
-#define MHISTATUS_READY_SHIFT (0)
+#define MHISTATUS_MHISTATE_MASK (GENMASK(15, 8))
+#define MHISTATUS_SYSERR_MASK (BIT(2))
+#define MHISTATUS_READY_MASK (BIT(0))
 
 #define CCABAP_LOWER (0x58)
-#define CCABAP_LOWER_CCABAP_LOWER_MASK (0xFFFFFFFF)
-#define CCABAP_LOWER_CCABAP_LOWER_SHIFT (0)
 
 #define CCABAP_HIGHER (0x5C)
-#define CCABAP_HIGHER_CCABAP_HIGHER_MASK (0xFFFFFFFF)
-#define CCABAP_HIGHER_CCABAP_HIGHER_SHIFT (0)
 
 #define ECABAP_LOWER (0x60)
-#define ECABAP_LOWER_ECABAP_LOWER_MASK (0xFFFFFFFF)
-#define ECABAP_LOWER_ECABAP_LOWER_SHIFT (0)
 
 #define ECABAP_HIGHER (0x64)
-#define ECABAP_HIGHER_ECABAP_HIGHER_MASK (0xFFFFFFFF)
-#define ECABAP_HIGHER_ECABAP_HIGHER_SHIFT (0)
 
 #define CRCBAP_LOWER (0x68)
-#define CRCBAP_LOWER_CRCBAP_LOWER_MASK (0xFFFFFFFF)
-#define CRCBAP_LOWER_CRCBAP_LOWER_SHIFT (0)
 
 #define CRCBAP_HIGHER (0x6C)
-#define CRCBAP_HIGHER_CRCBAP_HIGHER_MASK (0xFFFFFFFF)
-#define CRCBAP_HIGHER_CRCBAP_HIGHER_SHIFT (0)
 
 #define CRDB_LOWER (0x70)
-#define CRDB_LOWER_CRDB_LOWER_MASK (0xFFFFFFFF)
-#define CRDB_LOWER_CRDB_LOWER_SHIFT (0)
 
 #define CRDB_HIGHER (0x74)
-#define CRDB_HIGHER_CRDB_HIGHER_MASK (0xFFFFFFFF)
-#define CRDB_HIGHER_CRDB_HIGHER_SHIFT (0)
 
 #define MHICTRLBASE_LOWER (0x80)
-#define MHICTRLBASE_LOWER_MHICTRLBASE_LOWER_MASK (0xFFFFFFFF)
-#define MHICTRLBASE_LOWER_MHICTRLBASE_LOWER_SHIFT (0)
 
 #define MHICTRLBASE_HIGHER (0x84)
-#define MHICTRLBASE_HIGHER_MHICTRLBASE_HIGHER_MASK (0xFFFFFFFF)
-#define MHICTRLBASE_HIGHER_MHICTRLBASE_HIGHER_SHIFT (0)
 
 #define MHICTRLLIMIT_LOWER (0x88)
-#define MHICTRLLIMIT_LOWER_MHICTRLLIMIT_LOWER_MASK (0xFFFFFFFF)
-#define MHICTRLLIMIT_LOWER_MHICTRLLIMIT_LOWER_SHIFT (0)
 
 #define MHICTRLLIMIT_HIGHER (0x8C)
-#define MHICTRLLIMIT_HIGHER_MHICTRLLIMIT_HIGHER_MASK (0xFFFFFFFF)
-#define MHICTRLLIMIT_HIGHER_MHICTRLLIMIT_HIGHER_SHIFT (0)
 
 #define MHIDATABASE_LOWER (0x98)
-#define MHIDATABASE_LOWER_MHIDATABASE_LOWER_MASK (0xFFFFFFFF)
-#define MHIDATABASE_LOWER_MHIDATABASE_LOWER_SHIFT (0)
 
 #define MHIDATABASE_HIGHER (0x9C)
-#define MHIDATABASE_HIGHER_MHIDATABASE_HIGHER_MASK (0xFFFFFFFF)
-#define MHIDATABASE_HIGHER_MHIDATABASE_HIGHER_SHIFT (0)
 
 #define MHIDATALIMIT_LOWER (0xA0)
-#define MHIDATALIMIT_LOWER_MHIDATALIMIT_LOWER_MASK (0xFFFFFFFF)
-#define MHIDATALIMIT_LOWER_MHIDATALIMIT_LOWER_SHIFT (0)
 
 #define MHIDATALIMIT_HIGHER (0xA4)
-#define MHIDATALIMIT_HIGHER_MHIDATALIMIT_HIGHER_MASK (0xFFFFFFFF)
-#define MHIDATALIMIT_HIGHER_MHIDATALIMIT_HIGHER_SHIFT (0)
 
 /* Host request register */
 #define MHI_SOC_RESET_REQ_OFFSET (0xB0)
@@ -139,8 +84,7 @@ extern struct bus_type mhi_bus_type;
 #define BHI_IMGSIZE (0x10)
 #define BHI_RSVD1 (0x14)
 #define BHI_IMGTXDB (0x18)
-#define BHI_TXDB_SEQNUM_BMSK (0x3FFFFFFF)
-#define BHI_TXDB_SEQNUM_SHFT (0)
+#define BHI_TXDB_SEQNUM_BMSK (GENMASK(29, 0))
 #define BHI_RSVD2 (0x1C)
 #define BHI_INTVEC (0x20)
 #define BHI_RSVD3 (0x24)
@@ -156,8 +100,7 @@ extern struct bus_type mhi_bus_type;
 #define BHI_MSMHWID(n) (0x4C + (0x4 * (n)))
 #define BHI_OEMPKHASH(n) (0x64 + (0x4 * (n)))
 #define BHI_RSVD5 (0xC4)
-#define BHI_STATUS_MASK (0xC0000000)
-#define BHI_STATUS_SHIFT (30)
+#define BHI_STATUS_MASK (GENMASK(31, 30))
 #define BHI_STATUS_ERROR (3)
 #define BHI_STATUS_SUCCESS (2)
 #define BHI_STATUS_RESET (0)
@@ -168,13 +111,10 @@ extern struct bus_type mhi_bus_type;
 #define BHIE_TXVECADDR_HIGH_OFFS (0x0030)
 #define BHIE_TXVECSIZE_OFFS (0x0034)
 #define BHIE_TXVECDB_OFFS (0x003C)
-#define BHIE_TXVECDB_SEQNUM_BMSK (0x3FFFFFFF)
-#define BHIE_TXVECDB_SEQNUM_SHFT (0)
+#define BHIE_TXVECDB_SEQNUM_BMSK (GENMASK(29, 0))
 #define BHIE_TXVECSTATUS_OFFS (0x0044)
-#define BHIE_TXVECSTATUS_SEQNUM_BMSK (0x3FFFFFFF)
-#define BHIE_TXVECSTATUS_SEQNUM_SHFT (0)
-#define BHIE_TXVECSTATUS_STATUS_BMSK (0xC0000000)
-#define BHIE_TXVECSTATUS_STATUS_SHFT (30)
+#define BHIE_TXVECSTATUS_SEQNUM_BMSK (GENMASK(29, 0))
+#define BHIE_TXVECSTATUS_STATUS_BMSK (GENMASK(31, 30))
 #define BHIE_TXVECSTATUS_STATUS_RESET (0x00)
 #define BHIE_TXVECSTATUS_STATUS_XFER_COMPL (0x02)
 #define BHIE_TXVECSTATUS_STATUS_ERROR (0x03)
@@ -182,32 +122,23 @@ extern struct bus_type mhi_bus_type;
 #define BHIE_RXVECADDR_HIGH_OFFS (0x0064)
 #define BHIE_RXVECSIZE_OFFS (0x0068)
 #define BHIE_RXVECDB_OFFS (0x0070)
-#define BHIE_RXVECDB_SEQNUM_BMSK (0x3FFFFFFF)
-#define BHIE_RXVECDB_SEQNUM_SHFT (0)
+#define BHIE_RXVECDB_SEQNUM_BMSK (GENMASK(29, 0))
 #define BHIE_RXVECSTATUS_OFFS (0x0078)
-#define BHIE_RXVECSTATUS_SEQNUM_BMSK (0x3FFFFFFF)
-#define BHIE_RXVECSTATUS_SEQNUM_SHFT (0)
-#define BHIE_RXVECSTATUS_STATUS_BMSK (0xC0000000)
-#define BHIE_RXVECSTATUS_STATUS_SHFT (30)
+#define BHIE_RXVECSTATUS_SEQNUM_BMSK (GENMASK(29, 0))
+#define BHIE_RXVECSTATUS_STATUS_BMSK (GENMASK(31, 30))
 #define BHIE_RXVECSTATUS_STATUS_RESET (0x00)
 #define BHIE_RXVECSTATUS_STATUS_XFER_COMPL (0x02)
 #define BHIE_RXVECSTATUS_STATUS_ERROR (0x03)
 
 #define SOC_HW_VERSION_OFFS (0x224)
-#define SOC_HW_VERSION_FAM_NUM_BMSK (0xF0000000)
-#define SOC_HW_VERSION_FAM_NUM_SHFT (28)
-#define SOC_HW_VERSION_DEV_NUM_BMSK (0x0FFF0000)
-#define SOC_HW_VERSION_DEV_NUM_SHFT (16)
-#define SOC_HW_VERSION_MAJOR_VER_BMSK (0x0000FF00)
-#define SOC_HW_VERSION_MAJOR_VER_SHFT (8)
-#define SOC_HW_VERSION_MINOR_VER_BMSK (0x000000FF)
-#define SOC_HW_VERSION_MINOR_VER_SHFT (0)
+#define SOC_HW_VERSION_FAM_NUM_BMSK (GENMASK(31, 28))
+#define SOC_HW_VERSION_DEV_NUM_BMSK (GENMASK(27, 16))
+#define SOC_HW_VERSION_MAJOR_VER_BMSK (GENMASK(15, 8))
+#define SOC_HW_VERSION_MINOR_VER_BMSK (GENMASK(7, 0))
 
 #define EV_CTX_RESERVED_MASK GENMASK(7, 0)
 #define EV_CTX_INTMODC_MASK GENMASK(15, 8)
-#define EV_CTX_INTMODC_SHIFT 8
 #define EV_CTX_INTMODT_MASK GENMASK(31, 16)
-#define EV_CTX_INTMODT_SHIFT 16
 struct mhi_event_ctxt {
 	__le32 intmod;
 	__le32 ertype;
@@ -220,11 +151,8 @@ struct mhi_event_ctxt {
 };
 
 #define CHAN_CTX_CHSTATE_MASK GENMASK(7, 0)
-#define CHAN_CTX_CHSTATE_SHIFT 0
 #define CHAN_CTX_BRSTMODE_MASK GENMASK(9, 8)
-#define CHAN_CTX_BRSTMODE_SHIFT 8
 #define CHAN_CTX_POLLCFG_MASK GENMASK(15, 10)
-#define CHAN_CTX_POLLCFG_SHIFT 10
 #define CHAN_CTX_RESERVED_MASK GENMASK(31, 16)
 struct mhi_chan_ctxt {
 	__le32 chcfg;
@@ -659,14 +587,14 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 			      void __iomem *base, u32 offset, u32 *out);
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset, u32 mask,
-				    u32 shift, u32 *out);
+				    u32 *out);
 int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset, u32 mask,
-				    u32 shift, u32 val, u32 delayus);
+				    u32 val, u32 delayus);
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val);
 void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
-			 u32 offset, u32 mask, u32 shift, u32 val);
+			 u32 offset, u32 mask, u32 val);
 void mhi_ring_er_db(struct mhi_event *mhi_event);
 void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
 		  dma_addr_t db_val);
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 85f4f7c8d7c6..3e6e615466b7 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -24,7 +24,7 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset,
-				    u32 mask, u32 shift, u32 *out)
+				    u32 mask, u32 *out)
 {
 	u32 tmp;
 	int ret;
@@ -33,21 +33,20 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		return ret;
 
-	*out = (tmp & mask) >> shift;
+	*out = (tmp & mask) >> __ffs(mask);
 
 	return 0;
 }
 
 int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset,
-				    u32 mask, u32 shift, u32 val, u32 delayus)
+				    u32 mask, u32 val, u32 delayus)
 {
 	int ret;
 	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
 
 	while (retry--) {
-		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
-					 &out);
+		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, &out);
 		if (ret)
 			return ret;
 
@@ -67,7 +66,7 @@ void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 }
 
 void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
-			 u32 offset, u32 mask, u32 shift, u32 val)
+			 u32 offset, u32 mask, u32 val)
 {
 	int ret;
 	u32 tmp;
@@ -77,7 +76,7 @@ void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		return;
 
 	tmp &= ~mask;
-	tmp |= (val << shift);
+	tmp |= (val << __ffs(mask));
 	mhi_write_reg(mhi_cntrl, base, offset, tmp);
 }
 
@@ -159,8 +158,7 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
 {
 	u32 state;
 	int ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MHISTATUS,
-				     MHISTATUS_MHISTATE_MASK,
-				     MHISTATUS_MHISTATE_SHIFT, &state);
+				     MHISTATUS_MHISTATE_MASK, &state);
 	return ret ? MHI_STATE_MAX : state;
 }
 EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index c35c5ddc7220..bb8a23e80e19 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -131,11 +131,10 @@ void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl, enum mhi_state state)
 {
 	if (state == MHI_STATE_RESET) {
 		mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
-				    MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 1);
+				    MHICTRL_RESET_MASK, 1);
 	} else {
 		mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
-				    MHICTRL_MHISTATE_MASK,
-				    MHICTRL_MHISTATE_SHIFT, state);
+				    MHICTRL_MHISTATE_MASK, state);
 	}
 }
 
@@ -167,16 +166,14 @@ int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
 
 	/* Wait for RESET to be cleared and READY bit to be set by the device */
 	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
-				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
-				 interval_us);
+				 MHICTRL_RESET_MASK, 0, interval_us);
 	if (ret) {
 		dev_err(dev, "Device failed to clear MHI Reset\n");
 		return ret;
 	}
 
 	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHISTATUS,
-				 MHISTATUS_READY_MASK, MHISTATUS_READY_SHIFT, 1,
-				 interval_us);
+				 MHISTATUS_READY_MASK, 1, interval_us);
 	if (ret) {
 		dev_err(dev, "Device failed to enter MHI Ready\n");
 		return ret;
@@ -470,8 +467,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 
 		/* Wait for the reset bit to be cleared by the device */
 		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
-				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
-				 25000);
+				 MHICTRL_RESET_MASK, 0, 25000);
 		if (ret)
 			dev_err(dev, "Device failed to clear MHI Reset\n");
 
@@ -602,7 +598,6 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 							    mhi_cntrl->regs,
 							    MHICTRL,
 							    MHICTRL_RESET_MASK,
-							    MHICTRL_RESET_SHIFT,
 							    &in_reset) ||
 					!in_reset, timeout);
 		if (!ret || in_reset) {
@@ -1093,8 +1088,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	if (state == MHI_STATE_SYS_ERR) {
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
-				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
-				 interval_us);
+				 MHICTRL_RESET_MASK, 0, interval_us);
 		if (ret) {
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
 			goto error_exit;
-- 
2.25.1

