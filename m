Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FAA3DCFFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhHBFOH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbhHBFOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:14:05 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B715AC0617A4
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:55 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id j18-20020a17090aeb12b029017737e6c349so14641379pjz.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqIs5ez0yorHF8hi6nCrdcbZPSdMhWpZ9fYEm1qjcAw=;
        b=wOFZEb/WqfJKzEdKXugNDdj3teMzTtprSWqXYz0yfF1+I+vog70+J2eEulFhYCO7ri
         igArQTRp74gNfRyPmPeYM5jp+WQsy6d5GYJTfvyyrNVdFpfoYejdubakPY3wFDfXhOZf
         qtxpsq5pcdLonhFNMiEhgp+k7xvFtkmDD1H1eUtT4TDF9YgOGeCHVypWQrWyeLHcS5t4
         L3yip/8Zy0CoeldM9BLuGjHZm2WoKcwVj7B4iEZT/+EcQT/ESN1UMvtf7OUpTmvvwiOO
         FjVO8KAzmiV3mwLdgzR9LQGDjf+KBsioaYYuPeZfv8XeFJUfKITIVS18T1gr+xaPoKWX
         2adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqIs5ez0yorHF8hi6nCrdcbZPSdMhWpZ9fYEm1qjcAw=;
        b=TKyoSAz50G2Qd5wfF2hFpDnF3LqgBHKNwTlp47Er4Rj1T9cluKz3mD6t7HrxRcOgk/
         b1B4DZetX8rkVufln3XpIQDXIk47Nuch4scYiX6HN7+5VwDP9mlBbPbPj7PSROPkBvA8
         lPQ3hR4rfLG1iGKsFSeW+trBvQDNKeEkidmRWn/AYgfjwxxYvBWh+Oi7x96kjtjYUWuc
         4Bj1+9qFNPsl3vg+dgX0FmZ2S/2uZ5KuzUrMfIr08Xpfq9eRyhHyl3lJOd9ak0UUNIO3
         1SaqqzOXJkCr6bIK1i5E4BEQ/5pZZRguKDc8vPm50Dc6peIVttuP93Ij4aEN50ukcTJ9
         iLAA==
X-Gm-Message-State: AOAM530EqI9HQUaxkd9Ys29mxrwVAC51m/KKedrQunM+A66ubZ0TqaQT
        xNlxKCBq5c4jVUgGo19m34dE
X-Google-Smtp-Source: ABdhPJxbQpDewSzctNxoCsfyx7gJOa8TXXgua9rpp4RCaiXcmS+ZUuRiTFIc8u55lwHZIK1wuV7Nrw==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id a1-20020a056a000c81b029030e21bf4c15mr15034419pfv.70.1627881235173;
        Sun, 01 Aug 2021 22:13:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:54 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/10] bus: mhi: core: Replace DMA allocation wrappers with original APIs
Date:   Mon,  2 Aug 2021 10:42:54 +0530
Message-Id: <20210802051255.5771-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
References: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

There is nothing special done within the mhi_alloc_coherent() and
the mhi_free_coherent() wrapper functions. They only directly
call the equivalent DMA allocation functions. Replace them with
the original function calls such that the implementation is clear
and direct.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1624392428-9328-1-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c     | 17 +++++++++--------
 drivers/bus/mhi/core/init.c     | 32 ++++++++++++++++----------------
 drivers/bus/mhi/core/internal.h | 20 --------------------
 drivers/bus/mhi/core/main.c     |  6 +++---
 4 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 8100cf51cd09..0a972620a403 100644
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
index aeb1e3c2cdc4..5aaca6d0f52b 100644
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
index bc239a11aa69..721739c5e0d5 100644
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
index 69cd9dcde6d8..c67fd001ded1 100644
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
2.25.1

