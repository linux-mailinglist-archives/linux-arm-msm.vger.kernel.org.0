Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C561C6417
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 00:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbgEEWrd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 18:47:33 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:46387 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726568AbgEEWrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 18:47:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588718851; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=xgPdxiWgqrt9fsFmtmQRXwbTFjJmJPGQzwijSSx6X7s=; b=QwAb+J3U0/Ic/DhW6OwpoDa1T82zAJEII2Moiotn8NuDHJC7rvzyrlPIwFXsT39uXHOWr1LX
 A0BZ2TMh04pubAX+0aeCt5vT+R8TDhZiptT45dpFlcMB7W7ZBNkyHsf7kfdJ5QuFj1AhhrqF
 M9rDf+1PubqFExG5TiIPr2GdVB0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb1ecf9.7f9baccccb90-smtp-out-n01;
 Tue, 05 May 2020 22:47:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4686C433D2; Tue,  5 May 2020 22:47:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 886B8C433F2;
        Tue,  5 May 2020 22:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 886B8C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 1/8] bus: mhi: core: Refactor mhi queue APIs
Date:   Tue,  5 May 2020 15:47:05 -0700
Message-Id: <1588718832-4891-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Move all the common code to generate TRE from mhi_queue_buf,
mhi_queue_dma and mhi_queue_skb to mhi_gen_tre. This helps
to centralize the TRE generation code which makes any future
bug fixing easier to manage in these APIs.

Suggested-by: Jeffrey Hugo <jhugo@codeaurora.org>
Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h |   3 +-
 drivers/bus/mhi/core/main.c     | 107 +++++++++++++++++-----------------------
 2 files changed, 47 insertions(+), 63 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 095d95b..40c47f9 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -670,8 +670,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 irqreturn_t mhi_intvec_handler(int irq_number, void *dev);
 
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
-		void *buf, void *cb, size_t buf_len, enum mhi_flags flags);
-
+		struct mhi_buf_info *info, enum mhi_flags flags);
 int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 			 struct mhi_buf_info *buf_info);
 int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index c26eed0..605640c 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -919,9 +919,7 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
 	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
-	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
-	struct mhi_buf_info *buf_info;
-	struct mhi_tre *mhi_tre;
+	struct mhi_buf_info buf_info = { };
 	int ret;
 
 	/* If MHI host pre-allocates buffers then client drivers cannot queue */
@@ -946,27 +944,15 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	/* Toggle wake to exit out of M2 */
 	mhi_cntrl->wake_toggle(mhi_cntrl);
 
-	/* Generate the TRE */
-	buf_info = buf_ring->wp;
-
-	buf_info->v_addr = skb->data;
-	buf_info->cb_buf = skb;
-	buf_info->wp = tre_ring->wp;
-	buf_info->dir = mhi_chan->dir;
-	buf_info->len = len;
-	ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
-	if (ret)
-		goto map_error;
-
-	mhi_tre = tre_ring->wp;
-
-	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
-	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_info->len);
-	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(1, 1, 0, 0);
+	buf_info.v_addr = skb->data;
+	buf_info.cb_buf = skb;
+	buf_info.len = len;
 
-	/* increment WP */
-	mhi_add_ring_element(mhi_cntrl, tre_ring);
-	mhi_add_ring_element(mhi_cntrl, buf_ring);
+	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
+	if (unlikely(ret)) {
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+		return ret;
+	}
 
 	if (mhi_chan->dir == DMA_TO_DEVICE)
 		atomic_inc(&mhi_cntrl->pending_pkts);
@@ -980,11 +966,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 
 	return 0;
-
-map_error:
-	read_unlock_bh(&mhi_cntrl->pm_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_queue_skb);
 
@@ -996,9 +977,8 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 							     mhi_dev->dl_chan;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
-	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
-	struct mhi_buf_info *buf_info;
-	struct mhi_tre *mhi_tre;
+	struct mhi_buf_info buf_info = { };
+	int ret;
 
 	/* If MHI host pre-allocates buffers then client drivers cannot queue */
 	if (mhi_chan->pre_alloc)
@@ -1025,25 +1005,16 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	/* Toggle wake to exit out of M2 */
 	mhi_cntrl->wake_toggle(mhi_cntrl);
 
-	/* Generate the TRE */
-	buf_info = buf_ring->wp;
-	WARN_ON(buf_info->used);
-	buf_info->p_addr = mhi_buf->dma_addr;
-	buf_info->pre_mapped = true;
-	buf_info->cb_buf = mhi_buf;
-	buf_info->wp = tre_ring->wp;
-	buf_info->dir = mhi_chan->dir;
-	buf_info->len = len;
-
-	mhi_tre = tre_ring->wp;
-
-	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
-	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_info->len);
-	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(1, 1, 0, 0);
+	buf_info.p_addr = mhi_buf->dma_addr;
+	buf_info.cb_buf = mhi_buf;
+	buf_info.pre_mapped = true;
+	buf_info.len = len;
 
-	/* increment WP */
-	mhi_add_ring_element(mhi_cntrl, tre_ring);
-	mhi_add_ring_element(mhi_cntrl, buf_ring);
+	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
+	if (unlikely(ret)) {
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+		return ret;
+	}
 
 	if (mhi_chan->dir == DMA_TO_DEVICE)
 		atomic_inc(&mhi_cntrl->pending_pkts);
@@ -1061,7 +1032,7 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 EXPORT_SYMBOL_GPL(mhi_queue_dma);
 
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
-		void *buf, void *cb, size_t buf_len, enum mhi_flags flags)
+			struct mhi_buf_info *info, enum mhi_flags flags)
 {
 	struct mhi_ring *buf_ring, *tre_ring;
 	struct mhi_tre *mhi_tre;
@@ -1073,15 +1044,22 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	tre_ring = &mhi_chan->tre_ring;
 
 	buf_info = buf_ring->wp;
-	buf_info->v_addr = buf;
-	buf_info->cb_buf = cb;
+	WARN_ON(buf_info->used);
+	buf_info->pre_mapped = info->pre_mapped;
+	if (info->pre_mapped)
+		buf_info->p_addr = info->p_addr;
+	else
+		buf_info->v_addr = info->v_addr;
+	buf_info->cb_buf = info->cb_buf;
 	buf_info->wp = tre_ring->wp;
 	buf_info->dir = mhi_chan->dir;
-	buf_info->len = buf_len;
+	buf_info->len = info->len;
 
-	ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
-	if (ret)
-		return ret;
+	if (!info->pre_mapped) {
+		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
+		if (ret)
+			return ret;
+	}
 
 	eob = !!(flags & MHI_EOB);
 	eot = !!(flags & MHI_EOT);
@@ -1090,7 +1068,7 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 
 	mhi_tre = tre_ring->wp;
 	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
-	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_len);
+	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
 	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
 
 	/* increment WP */
@@ -1107,6 +1085,7 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
 	struct mhi_ring *tre_ring;
+	struct mhi_buf_info buf_info = { };
 	unsigned long flags;
 	int ret;
 
@@ -1122,7 +1101,11 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
 		return -ENOMEM;
 
-	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, buf, buf, len, mflags);
+	buf_info.v_addr = buf;
+	buf_info.cb_buf = buf;
+	buf_info.len = len;
+
+	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
 	if (unlikely(ret))
 		return ret;
 
@@ -1323,7 +1306,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 
 		while (nr_el--) {
 			void *buf;
-
+			struct mhi_buf_info info = { };
 			buf = kmalloc(len, GFP_KERNEL);
 			if (!buf) {
 				ret = -ENOMEM;
@@ -1331,8 +1314,10 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 			}
 
 			/* Prepare transfer descriptors */
-			ret = mhi_gen_tre(mhi_cntrl, mhi_chan, buf, buf,
-					  len, MHI_EOT);
+			info.v_addr = buf;
+			info.cb_buf = buf;
+			info.len = len;
+			ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &info, MHI_EOT);
 			if (ret) {
 				kfree(buf);
 				goto error_pre_alloc;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
