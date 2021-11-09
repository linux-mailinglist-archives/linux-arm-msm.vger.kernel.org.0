Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F04144B26C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 19:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241671AbhKISJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 13:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241768AbhKISJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 13:09:20 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF22EC061767;
        Tue,  9 Nov 2021 10:06:34 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id n8so22390827plf.4;
        Tue, 09 Nov 2021 10:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2vAlt5rN35ztfy1GKsWbKvq1o/mJup/GEQEbn+KSs8=;
        b=Z7NiriiJtxL6OAOcHWMzYlsg6ccjM9isdi1B0lqCNONiLRX/a681HbSouit/gx/tm0
         04DMPdKumaY1s9l5otGEPnzR0v81tbLcD4bOPelipTmOC4mje4gz32HDVgygupp7NIvO
         Qj7GEoL4wLxB5hOuKzUmLBLSMxPq5LE0HfCJjKbxpxaogGl5Q4M4G1GPDAR5xqs+Troe
         mdAMM8PLXJ5ZiMBIuU/vMnx/s279FKkvQwTgd9Yo2KpOOsBT369k9L+6LL9iSrnJi9dH
         HNk8/RLzdVHgoLFM2zPtNHYBsO4qnQfJzC2LRvh5/35YbvyaTQsokelNxIkOxDiNSukl
         XN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2vAlt5rN35ztfy1GKsWbKvq1o/mJup/GEQEbn+KSs8=;
        b=W4NmuTnxdWFcWTwj4YIC6EVRlTcRlv0NgRBdjIERriwX8NpNIy21sTKNCv7cSlc3io
         GHZBDQKxhxSZOB8zJrU3Te0UPO3H+/nHuPxnjAlXC4drYv6/iaZbzf8Uycxzyl6Pf8NJ
         p0sOyjjOx3qjmfOjuTslsP5jvwv7/20rQUnIrUqBtDGzT3bhunkyjemXpRCztO05pnzH
         xREVsvJdwzaoJpgvCfatKPMhg2f4GL+EqMk8kBGjDNJLcTdbeSx8RKufIt4t2S+uzHzP
         QWaBnKkdKOC55bplO7P58qIsNOYpTD7UYQwxRt3v086YNemgb8ezakdyNR/zhG79FeWC
         YFdQ==
X-Gm-Message-State: AOAM533ljiAi35ZvTifDJwH8nadfsUtrtOCQTs27sOfjTBz6nQkf6aWy
        QGDN66h3UadPXc+wEsRRTDA=
X-Google-Smtp-Source: ABdhPJyBJVmTbwKQWggklUt7KzsNFsAE+MWAMDzF6FHyn565YU+tZ8/YJRNq6KVWCyqY3zNPvH8HOQ==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id oc11mr9523417pjb.237.1636481194352;
        Tue, 09 Nov 2021 10:06:34 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id t16sm3248991pja.10.2021.11.09.10.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 10:06:33 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] drm/msm: Handle fence rollover
Date:   Tue,  9 Nov 2021 10:11:04 -0800
Message-Id: <20211109181117.591148-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add some helpers for fence comparision, which handle rollover properly,
and stop open coding fence seqno comparisions.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.h | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_gpu.c   |  6 +++---
 drivers/gpu/drm/msm/msm_gpu.h   |  2 +-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 4783db528bcc..17ee3822b423 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -60,4 +60,16 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
 struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
 
+static inline bool
+fence_before(uint32_t a, uint32_t b)
+{
+   return (int32_t)(a - b) < 0;
+}
+
+static inline bool
+fence_after(uint32_t a, uint32_t b)
+{
+   return (int32_t)(a - b) > 0;
+}
+
 #endif
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 13de1241d595..0f78c2615272 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -172,7 +172,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_for_each_entry(submit, &ring->submits, node) {
-		if (submit->seqno > fence)
+		if (fence_after(submit->seqno, fence))
 			break;
 
 		msm_update_fence(submit->ring->fctx,
@@ -509,7 +509,7 @@ static void hangcheck_handler(struct timer_list *t)
 	if (fence != ring->hangcheck_fence) {
 		/* some progress has been made.. ya! */
 		ring->hangcheck_fence = fence;
-	} else if (fence < ring->seqno) {
+	} else if (fence_before(fence, ring->seqno)) {
 		/* no progress and not done.. hung! */
 		ring->hangcheck_fence = fence;
 		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
@@ -523,7 +523,7 @@ static void hangcheck_handler(struct timer_list *t)
 	}
 
 	/* if still more pending work, reset the hangcheck timer: */
-	if (ring->seqno > ring->hangcheck_fence)
+	if (fence_after(ring->seqno, ring->hangcheck_fence))
 		hangcheck_timer_reset(gpu);
 
 	/* workaround for missing irq: */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0dcc31c27ac3..bd4e0024033e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -258,7 +258,7 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
-		if (ring->seqno > ring->memptrs->fence)
+		if (fence_after(ring->seqno, ring->memptrs->fence))
 			return true;
 	}
 
-- 
2.31.1

