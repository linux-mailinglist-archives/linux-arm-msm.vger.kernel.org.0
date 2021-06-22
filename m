Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B213B0E56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhFVUJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:09:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45028 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233189AbhFVUJj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:09:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624392443; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=u3icivfzXW7SeHvViiugEBlyiKme/+4SqEK6XCji1N0=; b=s39v6u0XD0nlB+uQpad9YwVH/4dCmdap4cJtvUCitsQeVtQJ0Lg4bATYpzwhmBVzpZ98b6pW
 8VjG/5OGNN1fVKkYBd4wxOfbkZZKBS1wepsDxRBmA7ys02j+tjXunIkCfTqC0gNB2Yv6S8mH
 1QvJNZxsbby3W1DNmhLjArwbzZk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60d242f801dd9a9431d2ec9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 20:07:20
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6DE99C41622; Tue, 22 Jun 2021 20:07:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A921C2AC8B;
        Tue, 22 Jun 2021 20:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A921C2AC8B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Replace DMA allocation wrappers with original APIs
Date:   Tue, 22 Jun 2021 13:07:08 -0700
Message-Id: <1624392428-9328-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is nothing special done within the mhi_alloc_coherent() and
the mhi_free_coherent() wrapper functions. They only directly
call the equivalent DMA allocation functions. Replace them with
the original function calls such that the implementation is clear
and direct.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c     | 17 +++++++++--------
 drivers/bus/mhi/core/init.c     | 32 ++++++++++++++++----------------
 drivers/bus/mhi/core/internal.h | 20 --------------------
 drivers/bus/mhi/core/main.c     |  6 +++---
 4 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 8100cf5..0a97262 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -302,8 +302,8 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 	struct mhi_buf *mhi_buf = image_info->mhi_buf;
 
 	for (i = 0; i < image_info->entries; i++, mhi_buf++)
-		mhi_free_coherent(mhi_cntrl, mhi_buf->len, mhi_buf->buf,
-				  mhi_buf->dma_addr);
+		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
+				  mhi_buf->buf, mhi_buf->dma_addr);
 
 	kfree(image_info->mhi_buf);
 	kfree(image_info);
@@ -339,8 +339,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 			vec_size = sizeof(struct bhi_vec_entry) * i;
 
 		mhi_buf->len = vec_size;
-		mhi_buf->buf = mhi_alloc_coherent(mhi_cntrl, vec_size,
-						  &mhi_buf->dma_addr,
+		mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
+						  vec_size, &mhi_buf->dma_addr,
 						  GFP_KERNEL);
 		if (!mhi_buf->buf)
 			goto error_alloc_segment;
@@ -354,8 +354,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 
 error_alloc_segment:
 	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
-		mhi_free_coherent(mhi_cntrl, mhi_buf->len, mhi_buf->buf,
-				  mhi_buf->dma_addr);
+		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
+				  mhi_buf->buf, mhi_buf->dma_addr);
 
 error_alloc_mhi_buf:
 	kfree(img_info);
@@ -442,7 +442,8 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (size > firmware->size)
 		size = firmware->size;
 
-	buf = mhi_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
+	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
+				 GFP_KERNEL);
 	if (!buf) {
 		release_firmware(firmware);
 		goto error_fw_load;
@@ -451,7 +452,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	/* Download image using BHI */
 	memcpy(buf, firmware->data, size);
 	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
-	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
+	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 4446760..c7ba715 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -129,7 +129,7 @@ static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
 				  u64 len)
 {
 	ring->alloc_size = len + (len - 1);
-	ring->pre_aligned = mhi_alloc_coherent(mhi_cntrl, ring->alloc_size,
+	ring->pre_aligned = dma_alloc_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
 					       &ring->dma_handle, GFP_KERNEL);
 	if (!ring->pre_aligned)
 		return -ENOMEM;
@@ -221,13 +221,13 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
 		ring = &mhi_cmd->ring;
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
 				  ring->pre_aligned, ring->dma_handle);
 		ring->base = NULL;
 		ring->iommu_base = 0;
 	}
 
-	mhi_free_coherent(mhi_cntrl,
+	dma_free_coherent(mhi_cntrl->cntrl_dev,
 			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
 			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
 
@@ -237,17 +237,17 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 			continue;
 
 		ring = &mhi_event->ring;
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
 				  ring->pre_aligned, ring->dma_handle);
 		ring->base = NULL;
 		ring->iommu_base = 0;
 	}
 
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
+	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
 			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
 			  mhi_ctxt->er_ctxt_addr);
 
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
+	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
 			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
 			  mhi_ctxt->chan_ctxt_addr);
 
@@ -275,7 +275,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		return -ENOMEM;
 
 	/* Setup channel ctxt */
-	mhi_ctxt->chan_ctxt = mhi_alloc_coherent(mhi_cntrl,
+	mhi_ctxt->chan_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
 						 sizeof(*mhi_ctxt->chan_ctxt) *
 						 mhi_cntrl->max_chan,
 						 &mhi_ctxt->chan_ctxt_addr,
@@ -307,7 +307,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	}
 
 	/* Setup event context */
-	mhi_ctxt->er_ctxt = mhi_alloc_coherent(mhi_cntrl,
+	mhi_ctxt->er_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
 					       sizeof(*mhi_ctxt->er_ctxt) *
 					       mhi_cntrl->total_ev_rings,
 					       &mhi_ctxt->er_ctxt_addr,
@@ -354,7 +354,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 
 	/* Setup cmd context */
 	ret = -ENOMEM;
-	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
+	mhi_ctxt->cmd_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
 						sizeof(*mhi_ctxt->cmd_ctxt) *
 						NR_OF_CMD_RINGS,
 						&mhi_ctxt->cmd_ctxt_addr,
@@ -389,10 +389,10 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	for (--i, --mhi_cmd; i >= 0; i--, mhi_cmd--) {
 		struct mhi_ring *ring = &mhi_cmd->ring;
 
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
 				  ring->pre_aligned, ring->dma_handle);
 	}
-	mhi_free_coherent(mhi_cntrl,
+	dma_free_coherent(mhi_cntrl->cntrl_dev,
 			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
 			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
 	i = mhi_cntrl->total_ev_rings;
@@ -405,15 +405,15 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		if (mhi_event->offload_ev)
 			continue;
 
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
 				  ring->pre_aligned, ring->dma_handle);
 	}
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
+	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
 			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
 			  mhi_ctxt->er_ctxt_addr);
 
 error_alloc_er_ctxt:
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
+	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
 			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
 			  mhi_ctxt->chan_ctxt_addr);
 
@@ -567,7 +567,7 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	if (!chan_ctxt->rbase) /* Already uninitialized */
 		return;
 
-	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
+	dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
 			  tre_ring->pre_aligned, tre_ring->dma_handle);
 	vfree(buf_ring->base);
 
@@ -610,7 +610,7 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	buf_ring->base = vzalloc(buf_ring->len);
 
 	if (!buf_ring->base) {
-		mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
+		dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
 				  tre_ring->pre_aligned, tre_ring->dma_handle);
 		return -ENOMEM;
 	}
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 672052f..b5594fa 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -690,26 +690,6 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 void mhi_reset_chan(struct mhi_controller *mhi_cntrl,
 		    struct mhi_chan *mhi_chan);
 
-/* Memory allocation methods */
-static inline void *mhi_alloc_coherent(struct mhi_controller *mhi_cntrl,
-				       size_t size,
-				       dma_addr_t *dma_handle,
-				       gfp_t gfp)
-{
-	void *buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, dma_handle,
-				       gfp);
-
-	return buf;
-}
-
-static inline void mhi_free_coherent(struct mhi_controller *mhi_cntrl,
-				     size_t size,
-				     void *vaddr,
-				     dma_addr_t dma_handle)
-{
-	dma_free_coherent(mhi_cntrl->cntrl_dev, size, vaddr, dma_handle);
-}
-
 /* Event processing methods */
 void mhi_ctrl_ev_task(unsigned long data);
 void mhi_ev_task(unsigned long data);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 02c8c09..409c68bc 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -193,7 +193,7 @@ int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
 			  struct mhi_buf_info *buf_info)
 {
-	void *buf = mhi_alloc_coherent(mhi_cntrl, buf_info->len,
+	void *buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, buf_info->len,
 				       &buf_info->p_addr, GFP_ATOMIC);
 
 	if (!buf)
@@ -220,8 +220,8 @@ void mhi_unmap_single_use_bb(struct mhi_controller *mhi_cntrl,
 	if (buf_info->dir == DMA_FROM_DEVICE)
 		memcpy(buf_info->v_addr, buf_info->bb_addr, buf_info->len);
 
-	mhi_free_coherent(mhi_cntrl, buf_info->len, buf_info->bb_addr,
-			  buf_info->p_addr);
+	dma_free_coherent(mhi_cntrl->cntrl_dev, buf_info->len,
+			  buf_info->bb_addr, buf_info->p_addr);
 }
 
 static int get_nr_avail_ring_elements(struct mhi_controller *mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

