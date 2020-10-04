Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E6D282D11
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgJDTVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbgJDTV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:29 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02E0C0613E7;
        Sun,  4 Oct 2020 12:21:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 22so393763pgv.6;
        Sun, 04 Oct 2020 12:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VQDv9qIxfo9dLvFA8eAM/RvSpOEqDt7DqCgJQnSkF2g=;
        b=cwzFQmZfAdfXp0bNqEXXYtFrzbDUEWHIcvy2jgZDLsdLVzHxLNY0pi0IRZ9cnwwS5A
         SZ7h3np2ofACQq1T28kFs6VRsonTnhAoPtW+/BY2X2qfZ2gkLvdRfZuDe77h1qSUkwPm
         jMm7Lk/tbqF59ZFnWHPsMUAEVdpWV7WjujveCj9odqxixbhkvjcRg+Pft5q0CfHKyo/x
         mkAqDeP0KKLLjwszFhXfhbUeqaIl12cUq2A51Zxs6AUytjWts1KAYtAG5Widp45CBnir
         FOB2G0rHii338QzygGN28F4iFavxqBRY13F5ZAnevNQs9GTTVwOvN2HlI677T17RUMEx
         1i0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VQDv9qIxfo9dLvFA8eAM/RvSpOEqDt7DqCgJQnSkF2g=;
        b=TBwZMmHIon1s+QZoyROhqW5gDnkWk2fR7PmLgfT22ia7LFEa7mxbp9pBxiRFX4J5Wr
         dl3+QqzBPGTRtqK0nRBjeqW0Z3cxdwnMebwzK58T+3P2LRLoy+Sh+1G2AtRa8DZ8swSr
         XFAVa18mJH9gKv14x4r+9Fuh9nTARKDbxoSc2+A4xC8GXvEHxfFtDq7N5hq0X7ZUkc1g
         D1CMQjwDz2y/3JySSKUGOBzitt1rAiZUhB8ax+F/eNG/hK98uXnMO8/2nC9KJLnWGVw8
         kvNqhmzdoW6ROrHotNLCL2Ufmc2MbNLnbVKpRszMcKBCeHnZxGGR9IyzVjmEhJh/azge
         z+7Q==
X-Gm-Message-State: AOAM530fu8ILaNwWuxlfjMIUike/yv2RLKKBmYybaSHh3S/aueZ1pqCo
        HZv/g8nQ8OXoZUwt14a7Ja2C4WK6E74pFWDU
X-Google-Smtp-Source: ABdhPJw3vlcyj1RE09j9A4+U3ke0Uu7ufkZiGJqKrFh6RUJK5jwfMyQdxSzvx3K3DZdmxPpEpzKjKQ==
X-Received: by 2002:a63:140e:: with SMTP id u14mr10479449pgl.91.1601839288416;
        Sun, 04 Oct 2020 12:21:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id ie13sm8103315pjb.5.2020.10.04.12.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:27 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 09/14] drm/msm: Drop struct_mutex from the retire path
Date:   Sun,  4 Oct 2020 12:21:41 -0700
Message-Id: <20201004192152.3298573-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that we are not relying on dev->struct_mutex to protect the
ring->submits lists, drop the struct_mutex lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c9ff19a75169..5e351d1c00e9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -707,7 +707,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		msm_gem_active_put(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put_locked(&msm_obj->base);
+		drm_gem_object_put(&msm_obj->base);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
@@ -722,11 +722,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void retire_submits(struct msm_gpu *gpu)
 {
-	struct drm_device *dev = gpu->dev;
 	int i;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* Retire the commits starting with highest priority */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -756,15 +753,12 @@ static void retire_submits(struct msm_gpu *gpu)
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

