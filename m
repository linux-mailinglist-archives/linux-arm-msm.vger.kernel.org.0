Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471BA28ABFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbgJLCKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgJLCJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:20 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE64EC0613CE;
        Sun, 11 Oct 2020 19:09:19 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x16so12832621pgj.3;
        Sun, 11 Oct 2020 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ndjT/5bxuvqBvTi00Id+BLmDSJw4qRZ7/j5AVgTmjhg=;
        b=RazKJWqE7grplBA/jh3dthZ3fOyd4oW+YFlRUQ1FeUMeyHgxA3OQ5NaOS8rlFqP/rJ
         EDe/lq+yZuj1Qty2VUVQ9zW8narHyfW/Hy2whbsdHvygNzoNG35LtuOczZO8anuWBF8d
         rfud3qI2nFO+p7YtFaJo1/sbcTtsYtXrYgtNGXr0AY9ZOU4NoFV3QX9M/Neyr0vbC3j3
         sQjPr/SFDlRvgO5uVTAe4l6Z6LgjlPfysN4nRxC1+R3mgU2oFP75j27Cibm6HbECGIO+
         a2xbEakmIm5MFlL6aEI/zmW+lVX/+qOpF0cCaVwiBJRYJnxuDVw3WiYT3OuSQDHlPljV
         ZgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ndjT/5bxuvqBvTi00Id+BLmDSJw4qRZ7/j5AVgTmjhg=;
        b=H7Ej3zC+LeuD6y2vAzFPCtTwyc3GGnHsLLHUNYoBBaKNZTdgNuX/cO5b+vuPkv9A1M
         NUsKVHdFh4EDOncWlpz6sOUGZDWrX9XhqYemAPP3AfOVxf3kD5eY4HG+SbR4f+XOvGQf
         5s/KbtD/MwWGGlb5mnN+OQ+2VlegmkdSpafrxjpLx+J9Ks5Tc7sTKc9FABRbvVt+qp/t
         jSK166SivpXnltSIzJzyCVrHHk/ByoQf3LW1zMtfee8lV+LNuEUTmrj4xAnequjyShK0
         NnyThrlnLQ11PCXnCHJ40a98itOsKXQ9WFH4LGpVcYsVet04AalQbFv9jntSOZvxTwlj
         M3TA==
X-Gm-Message-State: AOAM532zi3HYzIMQ0a/1Ad530Y331qioJZ9qiYvM40XoJG14EpKxmM/J
        dsYjVnOhWjA7esCBe2OIgZs=
X-Google-Smtp-Source: ABdhPJxzgd1jr4nHh6sHHjJ0l/yUeChZPcVDF0wpW7VXyTjFzyXu4JEY9I2OFQ5KrDe/3isXOxlRfA==
X-Received: by 2002:a17:90a:e697:: with SMTP id s23mr16865949pjy.16.1602468559365;
        Sun, 11 Oct 2020 19:09:19 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q16sm18644029pfj.117.2020.10.11.19.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:18 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 13/22] drm/msm: Document and rename preempt_lock
Date:   Sun, 11 Oct 2020 19:09:40 -0700
Message-Id: <20201012020958.229288-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Before adding another lock, give ring->lock a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
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

