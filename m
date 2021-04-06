Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D314354F55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 11:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240564AbhDFJDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 05:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240559AbhDFJDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 05:03:23 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D27C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 02:03:15 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id o6so4021718wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=hhElSehBICCLixw2Sc8DnTZQKYNCSKGbuQyHX9s80TU=;
        b=i8y+U33jxfRDkGCdX5fOtdblKXSPK+nAVJ2wFSl4ZASvEvtjknOwKAmEI8mhjpDYMl
         fvcREKX6n8Ir/oNM0boKfhH6bvaDcQRNG/WtExT6KLZoR4zddKFXpFjO60N6ObDp2JIC
         H0pZKhQTS1aYfQzqOSuMDFRnkxnhWMnlQpXjTaUxSDMqBrEqlGRS+3dbWn6TmnceGsWa
         rDwgFW2YJBKCxthNKhV4iEpVHGq2B01tLi72k3/EM1aAVEi+2f00ImhYTygHWBWkROR8
         tyRifP8KqN6BpQoFrjUv8fKVguEEGxzQyHt73ErRhZOkl9u39V99jQSRPx2Bd8uZkmB7
         +jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hhElSehBICCLixw2Sc8DnTZQKYNCSKGbuQyHX9s80TU=;
        b=TgrqJQhgMYwUXsZ6H27t3/MfkLMC6duDC7HAh2ASJXhU2fMXja4DLKdkoUX95m0YMh
         kkNcRY/DXFuwS9tB5UqNjcOXdBlYt+9h1L0D8C9XIH5Ahocq8vsyAD1pxMCi2buM9A19
         1eB0KHbiYzwOs0/NOvgcePejlHiBzcJAbXUMR1a8kDjVWyWthc+xVagQgAAZxEergpL9
         iUo8LT89BYV4ABo73J1WmrsHKTKcR2HlbDfOAZV8Ts0u5i91nGqSBEyhDjlrikzoBK76
         dXry5fGyvHMnSw6BP6KdmfyUTZquTzAf+KKEAV/+IeqcxBYzFuLckJLUMTaE5MUZrzuc
         UHiw==
X-Gm-Message-State: AOAM532LbhAfF6vRB1E746Mpj5jxHFtWNNcaI72x4klbln1sdb2KHQRu
        GFQIiYqcviL17HHnmNpkHtSML+UMIrtTml1h
X-Google-Smtp-Source: ABdhPJwffC1jz/y3DBJFsen4jzo3K/uZBBUf5UjnC4i77wlqJ/0+yAnb5lR7iU4JbCWK/GNb+HEZTg==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr3149612wma.10.1617699793574;
        Tue, 06 Apr 2021 02:03:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:49e5:d54d:f006:441f])
        by smtp.gmail.com with ESMTPSA id r1sm38266233wrj.63.2021.04.06.02.03.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Apr 2021 02:03:13 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
Date:   Tue,  6 Apr 2021 11:11:54 +0200
Message-Id: <1617700315-12492-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change ensures that PM reference is always get during packet
queueing and released either after queuing completion (RX) or once
the buffer has been consumed (TX). This guarantees proper update for
underlying MHI controller runtime status (e.g. last_busy timestamp)
and prevents suspend to be triggered while TX packets are flying,
or before we completed update of the RX ring.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: mhi_reset_data_chan: move put under existing DMA_TO_DEVICE if block

 drivers/bus/mhi/core/main.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index c780234..6e72239 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -584,8 +584,11 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			/* notify client */
 			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 
-			if (mhi_chan->dir == DMA_TO_DEVICE)
+			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
+				/* Release the reference got from mhi_queue() */
+				mhi_cntrl->runtime_put(mhi_cntrl);
+			}
 
 			/*
 			 * Recycle the buffer if buffer is pre-allocated,
@@ -1021,9 +1024,11 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (unlikely(ret))
 		goto exit_unlock;
 
-	/* trigger M3 exit if necessary */
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
+	/* Packet is queued, take a usage ref to exit M3 if necessary
+	 * for host->device buffer, balanced put is done on buffer completion
+	 * for device->host buffer, balanced put is after ringing the DB
+	 */
+	mhi_cntrl->runtime_get(mhi_cntrl);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1034,6 +1039,9 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
+	if (dir == DMA_FROM_DEVICE)
+		mhi_cntrl->runtime_put(mhi_cntrl);
+
 exit_unlock:
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1416,8 +1424,11 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 	while (tre_ring->rp != tre_ring->wp) {
 		struct mhi_buf_info *buf_info = buf_ring->rp;
 
-		if (mhi_chan->dir == DMA_TO_DEVICE)
+		if (mhi_chan->dir == DMA_TO_DEVICE) {
 			atomic_dec(&mhi_cntrl->pending_pkts);
+			/* Release the reference got from mhi_queue() */
+			mhi_cntrl->runtime_put(mhi_cntrl);
+		}
 
 		if (!buf_info->pre_mapped)
 			mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
-- 
2.7.4

