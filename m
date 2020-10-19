Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32283292FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730101AbgJSUqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbgJSUqN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:46:13 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A02C0613CE;
        Mon, 19 Oct 2020 13:46:13 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w21so675154pfc.7;
        Mon, 19 Oct 2020 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DjvKpJElljP1CGKDtyawiR3HJwFiK2kIC8fsb2FEuqQ=;
        b=OidWH+e5WlxD+T+8SIqVgzIV0i57nSDWJzr8VsRClLS9yF3wX3zBj1yfnQp7tmCcPb
         1zse+ri+TKCix/FWRIeuSFDzhusItfK4B0cc8xH/bet7cUNNzMGcHWvIbBC2I9bC2QB9
         uT/3O55E+w4b/BEVAU3YaoE1kN0spOpIELIuhKL/EUYGACTtShBjQLu+kvKNEVGWA9Ug
         hxuUOXrlidD47Ixp2+g8lZ266tUI+Nly9/OSeA4xM4y3KpW4a7ms5Z9jHOaRlLyzKn5d
         yPbyZws1wS0dcj+imFZSta+mXIn/uwqraMBdKbaB2mxguT04kh0AHY/FzqYD2lWSvs3y
         Mejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DjvKpJElljP1CGKDtyawiR3HJwFiK2kIC8fsb2FEuqQ=;
        b=GChlJRIE8x5EYZG1AHQ//53LNpfhNnArSnVPQmd4643FMPKQ8GlpiZxLi8BPBqXlXi
         BUjMCzuQGgLQvAp9pzMWXOjDEsztErLL6f0ubClIJ9sLJEMngwBAQQVPYzXvvrNpvtfS
         KSjjZAxtWhH0cxuF/2HEK7r5UGpv7VZFq9pkw1tBGSYvvHQpH9dk80KgjNkB2SwFjkk9
         H1iHuqyeWgBePPvwUUPz3gcWcG2AVj0TW2OVnWGu/BkkJUfnaL/PwFc6a4CLb9+MlTSC
         U19H9dxFgfb1vXn6Nyaa4j3nG6gkXnY4e97yIc7hInAcw55uET/Y6z7h2fblDObrG1Cr
         2Mpg==
X-Gm-Message-State: AOAM531lhbsz7Z3EGyIeEPx477ZQCnIkV6Wl9NslOxHimxEqopvgn++0
        tR35dI8kL5l6Xvqz6ZI01IE=
X-Google-Smtp-Source: ABdhPJy4A2xGRFyNaIiOmsSayiLrZ8+3WMkfP8VzoC7DsZ27VqqF4SvAljhJDjshN/gS2YxPj4quHg==
X-Received: by 2002:a63:370f:: with SMTP id e15mr1360758pga.124.1603140373089;
        Mon, 19 Oct 2020 13:46:13 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y10sm612527pff.119.2020.10.19.13.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:46:12 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 18/23] drm/msm: Drop struct_mutex from the retire path
Date:   Mon, 19 Oct 2020 13:46:19 -0700
Message-Id: <20201019204636.139997-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that we are not relying on dev->struct_mutex to protect the
ring->submits lists, drop the struct_mutex lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d0f625112a97..30ba3beaad0a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -717,7 +717,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		msm_gem_active_put(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put_locked(&msm_obj->base);
+		drm_gem_object_put(&msm_obj->base);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
@@ -732,11 +732,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void retire_submits(struct msm_gpu *gpu)
 {
-	struct drm_device *dev = gpu->dev;
 	int i;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* Retire the commits starting with highest priority */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -766,15 +763,12 @@ static void retire_submits(struct msm_gpu *gpu)
 static void retire_worker(struct work_struct *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
-	struct drm_device *dev = gpu->dev;
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++)
 		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
 
-	mutex_lock(&dev->struct_mutex);
 	retire_submits(gpu);
-	mutex_unlock(&dev->struct_mutex);
 }
 
 /* call from irq handler to schedule work to retire bo's */
-- 
2.26.2

