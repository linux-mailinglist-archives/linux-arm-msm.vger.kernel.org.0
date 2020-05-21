Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FDB1DD3B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbgEURDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728581AbgEURDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:03 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F24C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:03 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b12so3056566plz.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PU9OwzltPLDT4f+s9e2qtfRofzQWh3nwnXTDWG0n58I=;
        b=PNSdsd+5mMV7oxaHy1yqfGKAhcKpzLbMsdVxj36VCLV5NIqp79R7Zi2W1DJVYn1tXy
         6pU6cSbuJw8bNrhSJW6aSPwD+YLppcsKSdzUXDHhT5RJ7nwz2EbkqEwUp90R4cDlomL5
         ezXJJjGD76Zunn+pWVrLHzS8jEb2467myjylhzl9w1B24+gxpTYB/Z9ZeHtgIUAIi+qo
         hM+BcZ3wjBBC6zCf0ZSHu6W66QQHaHYuIQ2KeH08ep5CLT5wVuaat9f7kfKdL7/1ODaD
         sN9h7OkdE5CUGAZYz1dnguZRPOL48cg3h0pOFo2SojKeU/DI9B0NGwfiFKHYKQ0ZKAWk
         XaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PU9OwzltPLDT4f+s9e2qtfRofzQWh3nwnXTDWG0n58I=;
        b=EcUSIvSB+lzlC98bBalySoRYbluVVCYz2XTMLiPTa5qCtNTqJHcBlLjjOBBkQ310DN
         QZUXkx1SB9+s42pY/VptXY7MkzqdxTc9KfGy9gOF6B32FzLpoRX2o8ekl/jCVcxs3Lq+
         IipCo1wJPxd/s/FeKnxQ1ozUBXkm7Fe/Ver1ovGnSxG09XREfZQYY+lsCvLTFVKhTMC3
         E9+Hi4lvT1aGx+PXz7hBTLAIL+LQn0/PfhILYo8bXLL7t3hTC63NIp1Md0dZHVjOvKoI
         nZ3H5qEE+y04Ejqxil/Nz6qxHmrhCU+rpoK0t8dt2yjoduXcitFM8lVJbbMAWCvZ0bky
         cYXg==
X-Gm-Message-State: AOAM530vWqoNE73wKO0CGy4Ta+W6VrFoIAJJfa2Dn8OdakgrfhhIAo9Q
        ZZC/oN3+5UhERPyyfhRYGu1g
X-Google-Smtp-Source: ABdhPJymOMmtSl8AhTsA8TzIGFNNnydZ4WZUQNLNgND6ydvNlcIt6k3qweWNVG36FWQk8FeBK31E2g==
X-Received: by 2002:a17:902:348:: with SMTP id 66mr10679447pld.267.1590080582831;
        Thu, 21 May 2020 10:03:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id e26sm4874693pff.137.2020.05.21.10.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:03:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 01/14] bus: mhi: core: Refactor mhi queue APIs
Date:   Thu, 21 May 2020 22:32:36 +0530
Message-Id: <20200521170249.21795-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
References: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h |   3 +-
 drivers/bus/mhi/core/main.c     | 107 ++++++++++++++------------------
 2 files changed, 47 insertions(+), 63 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 095d95bc0e37..40c47f918ca3 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -670,8 +670,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev);
 irqreturn_t mhi_intvec_handler(int irq_number, void *dev);
 
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
-		void *buf, void *cb, size_t buf_len, enum mhi_flags flags);
-
+		struct mhi_buf_info *info, enum mhi_flags flags);
 int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 			 struct mhi_buf_info *buf_info);
 int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 0ac064327e35..beac8d33d1cb 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -918,9 +918,7 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
 	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
-	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
-	struct mhi_buf_info *buf_info;
-	struct mhi_tre *mhi_tre;
+	struct mhi_buf_info buf_info = { };
 	int ret;
 
 	/* If MHI host pre-allocates buffers then client drivers cannot queue */
@@ -945,27 +943,15 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
@@ -979,11 +965,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 
 	return 0;
-
-map_error:
-	read_unlock_bh(&mhi_cntrl->pm_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_queue_skb);
 
@@ -995,9 +976,8 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
@@ -1024,25 +1004,16 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
@@ -1060,7 +1031,7 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 EXPORT_SYMBOL_GPL(mhi_queue_dma);
 
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
-		void *buf, void *cb, size_t buf_len, enum mhi_flags flags)
+			struct mhi_buf_info *info, enum mhi_flags flags)
 {
 	struct mhi_ring *buf_ring, *tre_ring;
 	struct mhi_tre *mhi_tre;
@@ -1072,15 +1043,22 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
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
@@ -1089,7 +1067,7 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 
 	mhi_tre = tre_ring->wp;
 	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
-	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_len);
+	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
 	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
 
 	/* increment WP */
@@ -1106,6 +1084,7 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
 	struct mhi_ring *tre_ring;
+	struct mhi_buf_info buf_info = { };
 	unsigned long flags;
 	int ret;
 
@@ -1121,7 +1100,11 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
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
 
@@ -1322,7 +1305,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 
 		while (nr_el--) {
 			void *buf;
-
+			struct mhi_buf_info info = { };
 			buf = kmalloc(len, GFP_KERNEL);
 			if (!buf) {
 				ret = -ENOMEM;
@@ -1330,8 +1313,10 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
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
2.17.1

