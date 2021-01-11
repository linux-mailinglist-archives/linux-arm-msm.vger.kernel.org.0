Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A240F2F1B66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 17:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbhAKQtQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 11:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbhAKQtQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 11:49:16 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B290C0617A4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 08:49:00 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d26so415056wrb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 08:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=H+jpU/kYrpZxBzklslDk/5E68fREmq5Qy6N54AxxeAE=;
        b=KmDKNoEYj2lyAcdLsN8xUMWkdtVLwsg6b3RW99pEtyZI+CwUp5jR42eo9LpdtU1CLn
         YVVqdT/ImbKAPAsM+O4UbdrzKB8N1w3zi+XX6+NFXG55p2tCchb/8ylJoQBoDFy4wMaZ
         s4KpkwZ7n1xoR7tVANASomJaCWeMc0/DWovjzpnFTjNRuAh7wNvMsC8q1dhTlQydLDRX
         xFI2tMZbtmJfDxoWy358P3UzNxIxoEwBPYWvMF12jqx074NoqPhkYYOae1TgQit0OzTU
         SXu74JNEVlkbhMuBXBLR9ojzj4RKrgM5JShQYUwu/vj04uz+j0aId6AzZlzpoOoc4yt/
         H/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=H+jpU/kYrpZxBzklslDk/5E68fREmq5Qy6N54AxxeAE=;
        b=P7CWZSX7Hg/N6IfMydwRqbItxjvylm0s1C96L8yTSONUziljnwvaTCek1GeuzAnBDA
         B4r29oyMILWrbM90brkJG//6Dxlj9T0EgpaQo+jrIsr/bNMyBEpr9vFV+BuIKosSMfGU
         1yuhyTH69sQ5IU8VqirB/B6y3LlmxXL4HeQUhrOJKx6sZ4p69/kI+/K/DZkiG4A+NDkL
         97xNIZQ/ii44x5eDm+Zh+0OasLzV1MjiRKfIzy5iiVSMfBdFwRoZdyvyR4QnudMdJRk/
         53MxFrULlijVlcYBVFG93QJ0+3mT5MWdlqPctN2XiQeuY7UDzVFTXLLRGURL9a2XiIB2
         dJcg==
X-Gm-Message-State: AOAM5312Bxa3SxhlsCOisHugUfS0p/A7kJaAOTFZtcFieqrWwnCh/I5w
        0SRVYKvjWG07Y933RuNrIybUgw==
X-Google-Smtp-Source: ABdhPJz/SnHcvcoFko9O6JtDk72WMbhwrtgNcXBmXzAaBIFcKnbH6Zy9Nh3besR2GZmawWTgmCltfw==
X-Received: by 2002:adf:9546:: with SMTP id 64mr2226wrs.343.1610383738938;
        Mon, 11 Jan 2021 08:48:58 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id u10sm349720wmd.43.2021.01.11.08.48.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 08:48:58 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3] mhi: core: Factorize mhi queuing
Date:   Mon, 11 Jan 2021 17:56:35 +0100
Message-Id: <1610384195-14211-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of duplicating queuing procedure in mhi_queue_dma(),
mhi_queue_buf() and mhi_queue_skb(), add a new generic mhi_queue()
as common helper.

Note that the unified mhi_queue align pm_lock locking on mhi_queue_buf
behavior, taking it with irqsave variant (vs _bh for former queue_skb
and queue_dma version).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: re-integrate pre_alloc check (Mani)
     comment about _bh to _irqsave unification
 v3: move pre_alloc check in queue_dma/queue_skb

 drivers/bus/mhi/core/main.c | 162 ++++++++++++--------------------------------
 1 file changed, 44 insertions(+), 118 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index effe94f..c1eb43d 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -969,118 +969,88 @@ static bool mhi_is_ring_full(struct mhi_controller *mhi_cntrl,
 	return (tmp == ring->rp);
 }
 
-int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
-		  struct sk_buff *skb, size_t len, enum mhi_flags mflags)
+static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
+		     enum dma_data_direction dir, enum mhi_flags mflags)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
 	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
-	struct mhi_buf_info buf_info = { };
+	unsigned long flags;
 	int ret;
 
-	/* If MHI host pre-allocates buffers then client drivers cannot queue */
-	if (mhi_chan->pre_alloc)
-		return -EINVAL;
+	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
+		return -EIO;
 
-	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
-		return -ENOMEM;
+	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
 
-	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
-		read_unlock_bh(&mhi_cntrl->pm_lock);
-		return -EIO;
+	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
+	if (unlikely(ret)) {
+		ret = -ENOMEM;
+		goto exit_unlock;
 	}
 
-	/* we're in M3 or transitioning to M3 */
+	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, buf_info, mflags);
+	if (unlikely(ret))
+		goto exit_unlock;
+
+	/* trigger M3 exit if necessary */
 	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
 		mhi_trigger_resume(mhi_cntrl);
 
-	/* Toggle wake to exit out of M2 */
+	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
 
-	buf_info.v_addr = skb->data;
-	buf_info.cb_buf = skb;
-	buf_info.len = len;
-
-	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
-	if (unlikely(ret)) {
-		read_unlock_bh(&mhi_cntrl->pm_lock);
-		return ret;
-	}
-
 	if (mhi_chan->dir == DMA_TO_DEVICE)
 		atomic_inc(&mhi_cntrl->pending_pkts);
 
-	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
-		read_lock_bh(&mhi_chan->lock);
-		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
-		read_unlock_bh(&mhi_chan->lock);
+	if (unlikely(!MHI_DB_ACCESS_VALID(mhi_cntrl))) {
+		ret = -EIO;
+		goto exit_unlock;
 	}
 
-	read_unlock_bh(&mhi_cntrl->pm_lock);
+	mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	return 0;
+exit_unlock:
+	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(mhi_queue_skb);
 
-int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
-		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
+int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
+		  struct sk_buff *skb, size_t len, enum mhi_flags mflags)
 {
-	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
 							     mhi_dev->dl_chan;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
 	struct mhi_buf_info buf_info = { };
-	int ret;
-
-	/* If MHI host pre-allocates buffers then client drivers cannot queue */
-	if (mhi_chan->pre_alloc)
-		return -EINVAL;
-
-	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
-		return -ENOMEM;
 
-	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
-		dev_err(dev, "MHI is not in activate state, PM state: %s\n",
-			to_mhi_pm_state_str(mhi_cntrl->pm_state));
-		read_unlock_bh(&mhi_cntrl->pm_lock);
+	buf_info.v_addr = skb->data;
+	buf_info.cb_buf = skb;
+	buf_info.len = len;
 
-		return -EIO;
-	}
+	if (unlikely(mhi_chan->pre_alloc))
+		return -EINVAL;
 
-	/* we're in M3 or transitioning to M3 */
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
+	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
+}
+EXPORT_SYMBOL_GPL(mhi_queue_skb);
 
-	/* Toggle wake to exit out of M2 */
-	mhi_cntrl->wake_toggle(mhi_cntrl);
+int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
+		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
+{
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
+							     mhi_dev->dl_chan;
+	struct mhi_buf_info buf_info = { };
 
 	buf_info.p_addr = mhi_buf->dma_addr;
 	buf_info.cb_buf = mhi_buf;
 	buf_info.pre_mapped = true;
 	buf_info.len = len;
 
-	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
-	if (unlikely(ret)) {
-		read_unlock_bh(&mhi_cntrl->pm_lock);
-		return ret;
-	}
-
-	if (mhi_chan->dir == DMA_TO_DEVICE)
-		atomic_inc(&mhi_cntrl->pending_pkts);
-
-	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
-		read_lock_bh(&mhi_chan->lock);
-		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
-		read_unlock_bh(&mhi_chan->lock);
-	}
-
-	read_unlock_bh(&mhi_cntrl->pm_lock);
+	if (unlikely(mhi_chan->pre_alloc))
+		return -EINVAL;
 
-	return 0;
+	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
 }
 EXPORT_SYMBOL_GPL(mhi_queue_dma);
 
@@ -1134,57 +1104,13 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 		  void *buf, size_t len, enum mhi_flags mflags)
 {
-	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
-	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
-							     mhi_dev->dl_chan;
-	struct mhi_ring *tre_ring;
 	struct mhi_buf_info buf_info = { };
-	unsigned long flags;
-	int ret;
-
-	/*
-	 * this check here only as a guard, it's always
-	 * possible mhi can enter error while executing rest of function,
-	 * which is not fatal so we do not need to hold pm_lock
-	 */
-	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
-		return -EIO;
-
-	tre_ring = &mhi_chan->tre_ring;
-	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
-		return -ENOMEM;
 
 	buf_info.v_addr = buf;
 	buf_info.cb_buf = buf;
 	buf_info.len = len;
 
-	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
-	if (unlikely(ret))
-		return ret;
-
-	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
-
-	/* we're in M3 or transitioning to M3 */
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
-
-	/* Toggle wake to exit out of M2 */
-	mhi_cntrl->wake_toggle(mhi_cntrl);
-
-	if (mhi_chan->dir == DMA_TO_DEVICE)
-		atomic_inc(&mhi_cntrl->pending_pkts);
-
-	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
-		unsigned long flags;
-
-		read_lock_irqsave(&mhi_chan->lock, flags);
-		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
-		read_unlock_irqrestore(&mhi_chan->lock, flags);
-	}
-
-	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
-
-	return 0;
+	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
 }
 EXPORT_SYMBOL_GPL(mhi_queue_buf);
 
-- 
2.7.4

