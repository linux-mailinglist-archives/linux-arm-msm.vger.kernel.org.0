Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6281228ABF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbgJLCKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729777AbgJLCJh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:37 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F305C0613D8;
        Sun, 11 Oct 2020 19:09:30 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t18so7761805plo.1;
        Sun, 11 Oct 2020 19:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ycYG7+4yZf0+EawqBCWFVGsugPtbJtT4YGGzzwI3EFY=;
        b=afbaQ4gVwtW7UpRdOzzW2yXOcH1/zUxpxTtkIMNtP7+mHx5erxv40REjWFquDcrnu7
         aKtsd7Ny1Kgeb2np5L4Tk6gVFnLei/u8KKP6szTjkLPm8/XeQtaa3yieh71HEy7UOGob
         swQDSNZWnXlbMLD6bmylhV2w0o/B7ELqBaEaCxgihbIGhDKOK2Ishd2Dwphu8fiYzYbP
         hQvPa4GZSug7CD54x8aLpJGPlJ8ZcQNht/53yGmoYcmZddTLxtzv/R/btas+my/I0xqt
         ideudZNuUUDjVtj9Bze7+Jk/rPeOITf7g8aMOGvDLZexHzZ8XybPZFa8Av/MOpTPTF45
         gGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ycYG7+4yZf0+EawqBCWFVGsugPtbJtT4YGGzzwI3EFY=;
        b=jsmLfdTpzOy7AGwrmZPuTcolaAPVoacuTPgXstnDdJhKiyUVqm7+p4RqfHLSDQXy1w
         HzUnOFpfEVKZRjeyHpy9+rlAv0rCbx5MqBdwrnUGE9ZguSVIQ2ZaCy4jhGmKNruaNRNI
         c4sBGYyWC+FKB2L1gsRn1rf+nPakdsAMSQn5B9H2HxmkgMol/i4DDCgJfy5HLxpUSY8z
         5GUNQIO61j0pF36REu4QBNvz7cKFYf+PXihb1ATrwmpnm3VH/3Jhq9zsnUoZ4/oUj0jY
         VjV6nBRmp/MtUxpZ/LfC8ElzpHPq6q577GeilNM9ttS+dDGHqLLBOmDeB2NpxsW2Z/AX
         YqBg==
X-Gm-Message-State: AOAM530izyVDTcYFeTzDn+reTPc/s6EVXQPyg2730KWF8N+Op+l/7AB8
        vcOl8hiIUWsQOvNA2Rozjj4=
X-Google-Smtp-Source: ABdhPJz4Kg/jGVAqQXCBqhA6ZjgK+Nv2BP6zRV2+ijSWDL3K4XKVh1dGgPPwaINSnIHTRCVz5ZZ9lg==
X-Received: by 2002:a17:902:8307:b029:d3:89e2:7866 with SMTP id bd7-20020a1709028307b02900d389e27866mr21601707plb.42.1602468569792;
        Sun, 11 Oct 2020 19:09:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id i1sm22456217pjh.52.2020.10.11.19.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:28 -0700 (PDT)
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
Subject: [PATCH v2 17/22] drm/msm: Drop struct_mutex from the retire path
Date:   Sun, 11 Oct 2020 19:09:44 -0700
Message-Id: <20201012020958.229288-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index 8278a4df331a..a754e84b8b5d 100644
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

