Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1534E282D05
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgJDTVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgJDTVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28943C0613CE;
        Sun,  4 Oct 2020 12:21:20 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t23so2705310pji.0;
        Sun, 04 Oct 2020 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1yao+kQqGpfTGfpwPbzu0C0v9rS99roOK1Qab3jbPV8=;
        b=RdMiFjCT3+ax8ZcEBWacyU0tityOVST/sT2cPbYDgfVIO5chYKEUlVgZ8+DjZ3qFTP
         d/kXZHeYCtfZ4Hfd34lV/PpN6Uwi80Z2ChoCHFzQmjbcgE1rETp2SP1NLxD5F70sXoeD
         q51kg6OPmGkRztKMGpid1Ra5LNtl/okpgQfZ1bU4F8KegO/J6+PQcbU7OrBPacB3WNJI
         yAmjQf9N+HTPPr1NeWDtf/KVcIHH/30ZErvdu1u9/E62DGGUjX7WkIgJSJESxmAk9i49
         RNuWm3ToFuEwnUW+gajgB/7upGrQvu+bEKub9Njr+89iMNGgcHeOgTLGn77gUrMEeckK
         cylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1yao+kQqGpfTGfpwPbzu0C0v9rS99roOK1Qab3jbPV8=;
        b=ZiC5ceUqTMndK7VXF7LxF1VCqjsduPRYitn3Lk2NiXFKYLjYQqohKylH7Sv2+ChZ76
         KvMJRqFpt+IcI+oqUaorCKHXKmjFy4gTW61RoydS78/w7aLciFRQuDL6Zng3r8X+I+vu
         M8js9UgYfaeX5ISJxMPEVgXR4W2hbOPNustKqB7rylikdy7aYVa7Hi+k1O7wLs9d34ec
         jpM10oLhkCX7nvXQdE9KkEfyBd6GYpxZTnJfDGj7mnoFNeAPqx2m+09PBxCWZvgcCCHz
         0/Pw1Cz1GDLCOOSqLtr57E6/PRXPvOXhZGfQODhM7Lgn5309+MrO8qhb8Ws/DAgG3bnB
         WRwA==
X-Gm-Message-State: AOAM532ff6zzop337hYSOq3KI5lqj0YDHLxxMZjhMv0Xx2kBpWr152BS
        lrjCiqvFN8VYRtxaSD2FXEA=
X-Google-Smtp-Source: ABdhPJx5E+8SSfkHkv2UIR0BCoxwS+L5Oqm1HRtIqUmyRmWhq9M6CAN3QWS/Unou5PEr10cLdTXshw==
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr13127115pjx.119.1601839279592;
        Sun, 04 Oct 2020 12:21:19 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id ih12sm7858154pjb.24.2020.10.04.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:18 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Emil Velikov <emil.velikov@collabora.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/14] drm/msm: Document and rename preempt_lock
Date:   Sun,  4 Oct 2020 12:21:37 -0700
Message-Id: <20201004192152.3298573-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Before adding another lock, give ring->lock a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 ++--
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 ++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 ++--
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      |  7 ++++++-
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c941c8138f25..543437a2186e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -36,7 +36,7 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
 	}
 
-	spin_lock_irqsave(&ring->lock, flags);
+	spin_lock_irqsave(&ring->preempt_lock, flags);
 
 	/* Copy the shadow to the actual register */
 	ring->cur = ring->next;
@@ -44,7 +44,7 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	/* Make sure to wrap wptr if we need to */
 	wptr = get_wptr(ring);
 
-	spin_unlock_irqrestore(&ring->lock, flags);
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	/* Make sure everything is posted before making a decision */
 	mb();
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 7e04509c4e1f..183de1139eeb 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -45,9 +45,9 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (!ring)
 		return;
 
-	spin_lock_irqsave(&ring->lock, flags);
+	spin_lock_irqsave(&ring->preempt_lock, flags);
 	wptr = get_wptr(ring);
-	spin_unlock_irqrestore(&ring->lock, flags);
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
 }
@@ -62,9 +62,9 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 		bool empty;
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
-		spin_lock_irqsave(&ring->lock, flags);
+		spin_lock_irqsave(&ring->preempt_lock, flags);
 		empty = (get_wptr(ring) == ring->memptrs->rptr);
-		spin_unlock_irqrestore(&ring->lock, flags);
+		spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 		if (!empty)
 			return ring;
@@ -132,9 +132,9 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 	}
 
 	/* Make sure the wptr doesn't update while we're in motion */
-	spin_lock_irqsave(&ring->lock, flags);
+	spin_lock_irqsave(&ring->preempt_lock, flags);
 	a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
-	spin_unlock_irqrestore(&ring->lock, flags);
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	/* Set the address of the incoming preemption record */
 	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_LO,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8915882e4444..fc85f008d69d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -65,7 +65,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 		OUT_RING(ring, upper_32_bits(shadowptr(a6xx_gpu, ring)));
 	}
 
-	spin_lock_irqsave(&ring->lock, flags);
+	spin_lock_irqsave(&ring->preempt_lock, flags);
 
 	/* Copy the shadow to the actual register */
 	ring->cur = ring->next;
@@ -73,7 +73,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	/* Make sure to wrap wptr if we need to */
 	wptr = get_wptr(ring);
 
-	spin_unlock_irqrestore(&ring->lock, flags);
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	/* Make sure everything is posted before making a decision */
 	mb();
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 935bf9b1d941..1b6958e908dc 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -46,7 +46,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->memptrs_iova = memptrs_iova;
 
 	INIT_LIST_HEAD(&ring->submits);
-	spin_lock_init(&ring->lock);
+	spin_lock_init(&ring->preempt_lock);
 
 	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 0987d6bf848c..4956d1bc5d0e 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -46,7 +46,12 @@ struct msm_ringbuffer {
 	struct msm_rbmemptrs *memptrs;
 	uint64_t memptrs_iova;
 	struct msm_fence_context *fctx;
-	spinlock_t lock;
+
+	/*
+	 * preempt_lock protects preemption and serializes wptr updates against
+	 * preemption.  Can be aquired from irq context.
+	 */
+	spinlock_t preempt_lock;
 };
 
 struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
-- 
2.26.2

