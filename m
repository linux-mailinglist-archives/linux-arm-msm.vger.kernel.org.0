Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C694A1BE925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 22:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgD2Uwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 16:52:49 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:57234 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727110AbgD2Uws (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 16:52:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588193567; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lEs6L2yislRXJmnPp78fvmNo55W3guoPRto/jHfjHwk=; b=tV9ElWB2ApwnwMinEPNssBR+Rmd7UYknf0lXfRExQ3IOP5Gree4YFph3lGrKU1ZrL6o7Ah//
 H17JITF19chsBQQ8h3m/qRdsGiIJYpdUyQ/iCaeQhNrgKkEJrAvM7XHmulK3pYCrVPKMSgTw
 KgGYAPEsiQ7T/SxzhcpweQBkraI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9e917.7fc2f805f260-smtp-out-n05;
 Wed, 29 Apr 2020 20:52:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF9F2C433D2; Wed, 29 Apr 2020 20:52:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0379C433F2;
        Wed, 29 Apr 2020 20:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0379C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 1/9] bus: mhi: core: Refactor mhi queue APIs
Date:   Wed, 29 Apr 2020 13:52:23 -0700
Message-Id: <1588193551-31439-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Move all the common code to generate TREs from mhi_queue_dma and
mhi_queue_skb to mhi_gen_tre. This helps to centralize the TRE
generation code which makes any future bug fixing easier to manage
in these APIs.

Suggested-by: Jeffrey Hugo <jhugo@codeaurora.org>
Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h |   3 +-
 drivers/bus/mhi/core/main.c     | 107 +++++++++++++++++-----------------------
 2 files changed, 47 insertions(+), 63 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 5deadfa..a9087aa 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -673,8 +673,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 irqreturn_t mhi_intvec_handler(int irq_number, void *dev);
 
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
-		void *buf, void *cb, size_t buf_len, enum mhi_flags flags);
-
+		struct mhi_buf_info *info, enum mhi_flags flags);
 int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 			 struct mhi_buf_info *buf_info);
 int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index eb4256b..aee64f9 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -926,9 +926,7 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
 	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
-	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
-	struct mhi_buf_info *buf_info;
-	struct mhi_tre *mhi_tre;
+	struct mhi_buf_info buf_info = { };
 	int ret;
 
 	/* If MHI host pre-allocates buffers then client drivers cannot queue */
@@ -953,27 +951,15 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
@@ -987,11 +973,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 
 	return 0;
-
-map_error:
-	read_unlock_bh(&mhi_cntrl->pm_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_queue_skb);
 
@@ -1003,9 +984,8 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
@@ -1032,25 +1012,16 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
@@ -1068,7 +1039,7 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 EXPORT_SYMBOL_GPL(mhi_queue_dma);
 
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
-		void *buf, void *cb, size_t buf_len, enum mhi_flags flags)
+			struct mhi_buf_info *info, enum mhi_flags flags)
 {
 	struct mhi_ring *buf_ring, *tre_ring;
 	struct mhi_tre *mhi_tre;
@@ -1080,15 +1051,22 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
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
@@ -1097,7 +1075,7 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 
 	mhi_tre = tre_ring->wp;
 	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
-	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_len);
+	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
 	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
 
 	/* increment WP */
@@ -1114,6 +1092,7 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
 	struct mhi_ring *tre_ring;
+	struct mhi_buf_info buf_info = { };
 	unsigned long flags;
 	int ret;
 
@@ -1129,7 +1108,11 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
 
@@ -1330,7 +1313,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 
 		while (nr_el--) {
 			void *buf;
-
+			struct mhi_buf_info info = { };
 			buf = kmalloc(len, GFP_KERNEL);
 			if (!buf) {
 				ret = -ENOMEM;
@@ -1338,8 +1321,10 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
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
