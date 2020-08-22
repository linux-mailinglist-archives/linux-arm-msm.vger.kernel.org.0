Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D5224E925
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Aug 2020 19:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgHVRwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Aug 2020 13:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbgHVRwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Aug 2020 13:52:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35742C061573;
        Sat, 22 Aug 2020 10:52:01 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f193so2671583pfa.12;
        Sat, 22 Aug 2020 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6pe9e9T2twD5/s7EIOh11y2F9Qe9Loy+s9jYVy+9GcQ=;
        b=Kae2hkjtqCH1AQ3t4ujJSspPFilOMnRYd30SkprY1/HQlAqanO9AnTcVRpuFx1naL3
         jvJZFzPdgU8U5LkBJm/ThV/bfJgxViwpzT6V4SCi+j8C5XVTSAc4aj5KtUHQbkKrhAyz
         Ty3YxQXHJDRyx9UsRAW8ZRO5EEo4brOuXoOfRuP+k+TokknisUrOix68px/R6BRJ85yX
         epWv9DFDNYSA8dfjoIwwCnaxGoZRbOt/r7Cqk9+Yv7OGX/fFEg6P+EEt2o77qyKYxTUn
         PzMA0P23jZeEatVaUuDbqHNoI9LAx97fH3I1x1Z3sMhBr38uDZJTEsNtJGWgGj1iSH08
         bZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6pe9e9T2twD5/s7EIOh11y2F9Qe9Loy+s9jYVy+9GcQ=;
        b=bj0CR8RHmt4xDe2z1wtFcyOzm+2+jiyh4U4+7u/6eEqx5z4mcCekAUIuUGfZY+W0IY
         roM95rP46NEJIhrcHVNJj51nqmJ0L7sTDl8F26iliab4L/6iuTMZK2swmlTdfZqFroGU
         lNBOtZ7HRAAllG2P6m9Tzy0Ia2ltikmP+yjbxUrcuSt9888GsnLqhxoZG1IQPuehsnVU
         gALLrWzQ9hQRI/oFG6f8WT2aaTdJfO57v53bkmEUK1GxPYuK0opX5so28LSJvzGd811A
         Drap7UTLUq1yMCpRrsLaZFlY7tOiRAXFsIM7/3Z6cnTdEUlop0XKpmOtpSogqKsqzSC/
         zHgQ==
X-Gm-Message-State: AOAM533xB6k9a6Qex5iSvE7SMKmr0mtvyMtamjf65m0vWr9G0ibBlXHg
        Tj5NnuPvrmlzug+mabb1M10=
X-Google-Smtp-Source: ABdhPJxTIF8SEg5kQ7iKSi30Rkzh/VQZDW09KS3xVrB6DSdOUljq+/rLGKP+iwW+mx/5pQhPJb/Byg==
X-Received: by 2002:a65:49c9:: with SMTP id t9mr526692pgs.256.1598118720669;
        Sat, 22 Aug 2020 10:52:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id f19sm5496232pgn.10.2020.08.22.10.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 10:51:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: drop cache sync hack
Date:   Sat, 22 Aug 2020 10:52:54 -0700
Message-Id: <20200822175254.1105377-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that it isn't causing problems to use dma_map/unmap, we can drop the
hack of using dma_sync in certain cases.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b2f49152b4d4..3cb7aeb93fd3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -52,26 +52,16 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
 
-	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	} else {
-		dma_map_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	}
+	dma_map_sg(dev, msm_obj->sgt->sgl,
+		msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
 }
 
 static void sync_for_cpu(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
 
-	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	} else {
-		dma_unmap_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	}
+	dma_unmap_sg(dev, msm_obj->sgt->sgl,
+		msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
 }
 
 /* allocate pages from VRAM carveout, used when no IOMMU: */
-- 
2.26.2

