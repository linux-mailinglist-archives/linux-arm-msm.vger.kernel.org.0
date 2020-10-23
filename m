Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB99297534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752788AbgJWQut (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752750AbgJWQus (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:48 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6B4C0613CE;
        Fri, 23 Oct 2020 09:50:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 19so1673233pge.12;
        Fri, 23 Oct 2020 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ROvGXTXV5iRZVbSVby/8TK0BFiX1W2qsGpGNQ6b5ENE=;
        b=QDM0eNzGyb+yFV42+dhVV+GpM3z/3cW0gDbGDjTIMzxd21TPdnaf/GJMjfhXu0s5Jp
         rlebbniN+Y0b+r2fCioQicjFgAwI/yJb6AtFomLROHqbuaCjWfhWapmPMsrHN4GW6kVJ
         mezMoRpheXGUNeX4WfWou77Ae11Dxl9lWaASkOm9Jhb4VTjfgOAhVCbri2eC+KGrj0Vj
         0DgV7BlxxhN2FxJ+w3deDJwRdnJceXUrfTZDEBW2XVthg9Mgr4hLEEGusyh7AB57zeb0
         Gxwo1wyNcm9xB6ADnxvst/ajQbzgOdKVBV3HfsMZKJ8tqaN5KzAOsDTqpWvTGSdu5YmC
         Kkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ROvGXTXV5iRZVbSVby/8TK0BFiX1W2qsGpGNQ6b5ENE=;
        b=GLU1NaLBYtBmpfg3VFhIVxInyQTGLGvtTpyFnAmChXOGpVLpUXhLmAHeKKod9OQMlT
         BVOouX0LMhr+hPwqSkby9hCu/Rjl/A8UqTP3GnrOOrYHDBbeAYw5yITbxCs8onEnR2h+
         4vyuOCsVLXXb/mJeGhGBkHXbEzEeHMLSWmeMj/8f5BYMBa6C+Nj7W5Cb/1kAX7RzZclb
         LGXPckZ9+e3V4ziFqwkZQhbjE+W1D1m5qI2N9/0JzqZbiWIUnSo/cTrp7rVZRzAZAywn
         qCjlOVdKGXdjHLjtekb1a9LtG2rt4USp3qUYNvGrezWUESpNvIonx2ikZaOp0fh9inEJ
         1TNw==
X-Gm-Message-State: AOAM530ekiZFOW+cnJEkoWgv/B3I28qmkBIHDgt1tAcZu1ZqPxxwDcRl
        HFwnfoWiEyTFiUnBy4zA904=
X-Google-Smtp-Source: ABdhPJx9y+L8TYuGxVQ7Ra3q1nEMc2p6MU+fIUgmsSvbW8Szs4dwCvnm+D+KBRtHF4B7ygm2hlruJQ==
X-Received: by 2002:aa7:9575:0:b029:152:97f9:f884 with SMTP id x21-20020aa795750000b029015297f9f884mr88532pfq.80.1603471846145;
        Fri, 23 Oct 2020 09:50:46 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k9sm2585582pgt.72.2020.10.23.09.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 14/23] drm/msm: Document and rename preempt_lock
Date:   Fri, 23 Oct 2020 09:51:15 -0700
Message-Id: <20201023165136.561680-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Before adding another lock, give ring->lock a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 ++--
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 ++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 ++--
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      |  7 ++++++-
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 2180650a03bc..a1b9419a59c9 100644
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
index 16eaaf0804ca..eb44e0dbef34 100644
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

