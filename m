Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93763F1EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 19:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhHSRSA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 13:18:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35986 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbhHSRR6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 13:17:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629393442; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qsjiNZZmhJ2lxpeax0zIFAcgAukhXiwsMABC0SKz7EU=; b=brz7bxAzZHou2AFxD/BARMzekhNRIFdq8cVt16+X4i+DX9KTEtvcaooHdl3KQ/ZnCA/N6lJI
 yCub8OcLEJleLSSYp2roKBZxo4X1cTRmK3SPKrBf1+WKy3Z5Xio9iaHqhkCdRjU37WxaRqlU
 ESHUq/U/WczpDVsXANbRHj2Nd0U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 611e91d59507ca1a34ea1613 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 17:16:05
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6EFB0C43619; Thu, 19 Aug 2021 17:16:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 63C19C43460;
        Thu, 19 Aug 2021 17:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 63C19C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        quic_jhugo@quicinc.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 1/2] bus: mhi: core: Bail on writing register fields if read fails
Date:   Thu, 19 Aug 2021 10:15:53 -0700
Message-Id: <1629393354-20769-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629393354-20769-1-git-send-email-bbhatt@codeaurora.org>
References: <1629393354-20769-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Helper API to write register fields relies on successful reads
of the register/address prior to the write. Bail out if a failure
is seen when reading the register before the actual write is
performed.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/core/boot.c     | 25 +++++++++++++++++--------
 drivers/bus/mhi/core/init.c     | 24 ++++++++++++++++++------
 drivers/bus/mhi/core/internal.h |  7 ++++---
 drivers/bus/mhi/core/main.c     |  9 ++++++---
 drivers/bus/mhi/core/pm.c       | 18 +++++++++++++-----
 5 files changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 0a97262..13eacda 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -19,8 +19,8 @@
 #include "internal.h"
 
 /* Setup RDDM vector table for RDDM transfer and program RXVEC */
-void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
-		      struct image_info *img_info)
+int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
+		     struct image_info *img_info)
 {
 	struct mhi_buf *mhi_buf = img_info->mhi_buf;
 	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
@@ -28,6 +28,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	u32 sequence_id;
 	unsigned int i;
+	int ret;
 
 	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
 		bhi_vec->dma_addr = mhi_buf->dma_addr;
@@ -45,12 +46,17 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECSIZE_OFFS, mhi_buf->len);
 	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_RXVECSTATUS_SEQNUM_BMSK);
 
-	mhi_write_reg_field(mhi_cntrl, base, BHIE_RXVECDB_OFFS,
-			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
-			    sequence_id);
+	ret = mhi_write_reg_field(mhi_cntrl, base, BHIE_RXVECDB_OFFS,
+				  BHIE_RXVECDB_SEQNUM_BMSK,
+				  BHIE_RXVECDB_SEQNUM_SHFT, sequence_id);
+	if (ret) {
+		dev_err(dev, "Failed to write sequence ID for BHIE_RXVECDB\n");
+		return ret;
+	}
 
 	dev_dbg(dev, "Address: %p and len: 0x%zx sequence: %u\n",
 		&mhi_buf->dma_addr, mhi_buf->len, sequence_id);
+	return 0;
 }
 
 /* Collect RDDM buffer during kernel panic */
@@ -202,11 +208,14 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 
 	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECSIZE_OFFS, mhi_buf->len);
 
-	mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
-			    BHIE_TXVECDB_SEQNUM_BMSK, BHIE_TXVECDB_SEQNUM_SHFT,
-			    sequence_id);
+	ret = mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
+				  BHIE_TXVECDB_SEQNUM_BMSK,
+				  BHIE_TXVECDB_SEQNUM_SHFT, sequence_id);
 	read_unlock_bh(pm_lock);
 
+	if (ret)
+		return ret;
+
 	/* Wait for the image download to complete */
 	ret = wait_event_timeout(mhi_cntrl->state_event,
 				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5aaca6d..0917465 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -544,10 +544,15 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING].ring.db_addr = base + CRDB_LOWER;
 
 	/* Write to MMIO registers */
-	for (i = 0; reg_info[i].offset; i++)
-		mhi_write_reg_field(mhi_cntrl, base, reg_info[i].offset,
-				    reg_info[i].mask, reg_info[i].shift,
-				    reg_info[i].val);
+	for (i = 0; reg_info[i].offset; i++) {
+		ret = mhi_write_reg_field(mhi_cntrl, base, reg_info[i].offset,
+					  reg_info[i].mask, reg_info[i].shift,
+					  reg_info[i].val);
+		if (ret) {
+			dev_err(dev, "Unable to write to MMIO registers");
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -1118,8 +1123,15 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 		 */
 		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
 				     mhi_cntrl->rddm_size);
-		if (mhi_cntrl->rddm_image)
-			mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
+		if (mhi_cntrl->rddm_image) {
+			ret = mhi_rddm_prepare(mhi_cntrl,
+					       mhi_cntrl->rddm_image);
+			if (ret) {
+				mhi_free_bhie_table(mhi_cntrl,
+						    mhi_cntrl->rddm_image);
+				goto error_reg_offset;
+			}
+		}
 	}
 
 	mutex_unlock(&mhi_cntrl->pm_mutex);
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 721739c..3d17ec3 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -663,8 +663,9 @@ int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
 				    u32 shift, u32 val, u32 delayus);
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val);
-void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
-			 u32 offset, u32 mask, u32 shift, u32 val);
+int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
+				     void __iomem *base, u32 offset,
+				     u32 mask, u32 shift, u32 val);
 void mhi_ring_er_db(struct mhi_event *mhi_event);
 void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
 		  dma_addr_t db_val);
@@ -678,7 +679,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl);
 int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
-void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
+int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index c01ec2f..902d854 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -66,19 +66,22 @@ void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 	mhi_cntrl->write_reg(mhi_cntrl, base + offset, val);
 }
 
-void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
-			 u32 offset, u32 mask, u32 shift, u32 val)
+int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
+				     void __iomem *base, u32 offset,
+				     u32 mask, u32 shift, u32 val)
 {
 	int ret;
 	u32 tmp;
 
 	ret = mhi_read_reg(mhi_cntrl, base, offset, &tmp);
 	if (ret)
-		return;
+		return ret;
 
 	tmp &= ~mask;
 	tmp |= (val << shift);
 	mhi_write_reg(mhi_cntrl, base, offset, tmp);
+
+	return 0;
 }
 
 void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fb99e37..ba45abe 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -129,14 +129,22 @@ enum mhi_pm_state __must_check mhi_tryset_pm_state(struct mhi_controller *mhi_cn
 
 void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl, enum mhi_state state)
 {
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
+
 	if (state == MHI_STATE_RESET) {
-		mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
-				    MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 1);
+		ret = mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+					  MHICTRL_RESET_MASK,
+					  MHICTRL_RESET_SHIFT, 1);
 	} else {
-		mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
-				    MHICTRL_MHISTATE_MASK,
-				    MHICTRL_MHISTATE_SHIFT, state);
+		ret = mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+					  MHICTRL_MHISTATE_MASK,
+					  MHICTRL_MHISTATE_SHIFT, state);
 	}
+
+	if (ret)
+		dev_err(dev, "Failed to set MHI state to: %s",
+			TO_MHI_STATE_STR(state));
 }
 
 /* NOP for backward compatibility, host allowed to ring DB in M2 state */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

