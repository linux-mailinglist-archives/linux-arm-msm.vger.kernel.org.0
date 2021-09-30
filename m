Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6AC41E0FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 20:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349286AbhI3SWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 14:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350389AbhI3SWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 14:22:18 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D99C06176A;
        Thu, 30 Sep 2021 11:20:34 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k17so5741964pff.8;
        Thu, 30 Sep 2021 11:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjZZ/ucXOWL7CIsLTW5U/ybZd+F2uJjp6RNFoIb1zYc=;
        b=IM4363ZIbg2YekiDwC2QFrRe/u/VVnOy6LGDPj2DxxC80vB/bOfCcCbiFuMFIWZ1VD
         egrxrxplwBr3BfS2iZtDxAXuQI+ZVZMTXW9vaKbwndqAUU6h59HYajlupBrbOFqhZyv1
         XN/caWJJGDoFsb/w/6/FvfWwMUXpFD7LwuNaMz9x5mZbnvQTjx8Uoy3BBTDmV/9AHsIq
         kppWrjC0Kx1w7witsYITJB69FqKzc6P19HJYyJkeTrX5Mx4Q0p6N6M212gjo0FqDyJgb
         giE9hSAnnqreGeV5AA+P1XmKRdceNwGXRpezVtyavpscF1IzHumjkfH9YJGkkjhTDwSk
         JI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjZZ/ucXOWL7CIsLTW5U/ybZd+F2uJjp6RNFoIb1zYc=;
        b=Fi+1BPs0ooaLPl3NeWSyL5sPxfThLbobYCVQ6wxV9/1W94vGfjFIoEsIVeegw7PLCh
         KSW7u6nAqGcAvtQX2HMOErpWQvBYUbxJhpyQ8vH4fal6EWkELMA088C+yAdDW3YS+z4t
         w/+6hJJ1ToB7Q++MxeInLX4QyBGAbziMkZoN0ydgF+DYL0lkCzXRJEWfz7wcVSZ3WIvw
         pYqwkzErywK507GOkCLvwUOsIMSQjsrnQpjaazi66xdMg2w1JU2nOHiGIf9caeWZ+SFS
         KXXAqgn5HiU3uxDdUcMn/AFAwUAEIusw50SV7pqQZnknIxURYWrPHhMOyHWCMAQoJtd7
         cOiA==
X-Gm-Message-State: AOAM530yvoVSuuuT/g9RX0XyakAVVCFDeN65AhgZ6vOIJ74QSx8gHgRV
        e61GwN47FHJFpfI8mqyT/Cg=
X-Google-Smtp-Source: ABdhPJyUCr7ygKUx86DaLgetw9p4qlMD/xpSRDWXB7zvz7jE7HLv8Cc6vDLV6GdHS5ZUTKVwxpoHVg==
X-Received: by 2002:a63:191a:: with SMTP id z26mr6084310pgl.373.1633026034126;
        Thu, 30 Sep 2021 11:20:34 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q18sm3629863pfh.170.2021.09.30.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 11:20:32 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Track current ctx by seqno
Date:   Thu, 30 Sep 2021 11:25:02 -0700
Message-Id: <20210930182506.1236811-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In theory a context can be destroyed and a new one allocated at the same
address, making the pointer comparision to detect when we don't need to
update the current pagetables invalid.  Instead assign a sequence number
to each context on creation, and use this for the check.

Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 ++++++++++-
 drivers/gpu/drm/msm/msm_drv.c         |  3 +++
 drivers/gpu/drm/msm/msm_drv.h         |  1 +
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5e1ae3df42ba..e0a8b2fd1ff0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -106,7 +106,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
-	if (ctx == a6xx_gpu->cur_ctx)
+	if (ctx->seqno == a6xx_gpu->cur_ctx_seqno)
 		return;
 
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
@@ -139,7 +139,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
 	OUT_RING(ring, 0x31);
 
-	a6xx_gpu->cur_ctx = ctx;
+	a6xx_gpu->cur_ctx_seqno = ctx->seqno;
 }
 
 static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
@@ -1081,7 +1081,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
-	a6xx_gpu->cur_ctx = NULL;
+	a6xx_gpu->cur_ctx_seqno = 0;
 
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0bc2d062f54a..8e5527c881b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -19,7 +19,16 @@ struct a6xx_gpu {
 	uint64_t sqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
-	struct msm_file_private *cur_ctx;
+
+	/**
+	 * cur_ctx_seqno:
+	 *
+	 * The ctx->seqno value of the context with current pgtables
+	 * installed.  Tracked by seqno rather than pointer value to
+	 * avoid dangling pointers, and cases where a ctx can be freed
+	 * and a new one created with the same address.
+	 */
+	int cur_ctx_seqno;
 
 	struct a6xx_gmu gmu;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 624078b3adf2..30c1efc3d8a0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -711,6 +711,7 @@ static void load_gpu(struct drm_device *dev)
 
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
+	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx;
 
@@ -727,6 +728,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
 	file->driver_priv = ctx;
 
+	ctx->seqno = atomic_inc_return(&ident);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index de062450add4..8633d0059a3e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -59,6 +59,7 @@ struct msm_file_private {
 	int queueid;
 	struct msm_gem_address_space *aspace;
 	struct kref ref;
+	int seqno;
 };
 
 enum msm_mdp_plane_property {
-- 
2.31.1

