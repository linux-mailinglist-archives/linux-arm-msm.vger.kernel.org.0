Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD7828ABF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbgJLCKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729763AbgJLCJh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:37 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0ACC0613D7;
        Sun, 11 Oct 2020 19:09:27 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n9so12815999pgf.9;
        Sun, 11 Oct 2020 19:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sDR5wASc9ZPDU+65532Xft9syZCOfG7kJBBHeoYHbg=;
        b=qs9Kwg6vcM9brPA6GlK1ADDUgEHmOOGzqCiBb2QaNa5kkmW0jkbU3dTeogS1OfDHaZ
         QeSRR77mwxQV6UCUPmtvIaO8UhLnmZHtl7U8HY90kvy2d/bgVuI6kx0O/bD0EycyIvU0
         W9TCbQkLW34ikTZ7CnHlhcRWhQQVtiSogLFTHf7RqpAQtxtavdef5MxSCyhjCfCZk/Hs
         IpcRZK5E5o0bydx9ymSirQmPKu/RFBF6ZVYo/fnnIeGkfZtYWXmB5ztu4H+I5ghZqt8B
         u1Cabn83lwSPn8Sl/Bnz0qJjpQUNuwTqvSPHRYiRNOz1SMWBGLLek+R4/YmKI4KoA+Th
         L9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sDR5wASc9ZPDU+65532Xft9syZCOfG7kJBBHeoYHbg=;
        b=FuLHM+tWOZqrgLX1Lih3JdU6ZAgmUvifw0mVn9aq1SLicCg+dXGGRavP1+4GDZCQNk
         Bj8vgpArJeUhLP8GBs2Hn2C/z9keFQdajoPtSjVb6AGevjqwmyDtC8YChd6YrD+r8VHX
         I0mSeK51+EGLOC2lrLt3V2yWrWSiJTyEivbnbh15Q6mQgGaWwEzNQrgYBy9p9CbJwyav
         JLGJfuXNQa2UwoCT2h6Oyx46A/XpcFzcjgTfFHkuXSC9VxBw2XG501wtO/SIMAjJN17q
         LAcos1lWC4W0TQkVJghTZI+nsqYx3O2FjRqN2Ny1Alchnaz/khrQHZ/SYqM7QaBOvJbp
         sYnA==
X-Gm-Message-State: AOAM531lViHscvBzfVH2S/w2KAH8/g23cHcfLcRpAXul8EIyu4EqmCM0
        AhY3n3XbbF1M9ycZsixHapU=
X-Google-Smtp-Source: ABdhPJwSmhu5yL3ga9OwBqL7M0FfmLC6fLlO0LI7uhSL0N+DrMYZdHT9en3D+tK808DyrOX1zSVS4w==
X-Received: by 2002:aa7:9358:0:b029:152:b349:8af8 with SMTP id 24-20020aa793580000b0290152b3498af8mr22631648pfn.9.1602468567273;
        Sun, 11 Oct 2020 19:09:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p6sm21597805pjd.1.2020.10.11.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:26 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 16/22] drm/msm: Remove obj->gpu
Date:   Sun, 11 Oct 2020 19:09:43 -0700
Message-Id: <20201012020958.229288-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It cannot be atomically updated with obj->active_count, and the only
purpose is a useless WARN_ON() (which becomes a buggy WARN_ON() once
retire_submits() is not serialized with incoming submits via
struct_mutex)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 --
 drivers/gpu/drm/msm/msm_gem.h | 1 -
 drivers/gpu/drm/msm/msm_gpu.c | 5 -----
 3 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 15f81ed2e154..cdbbdd848fe3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -760,7 +760,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
@@ -776,7 +775,6 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 		mutex_unlock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 93ee73c620ed..bf5f9e94d0d3 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -64,7 +64,6 @@ struct msm_gem_object {
 	 *
 	 */
 	struct list_head mm_list;
-	struct msm_gpu *gpu;     /* non-null if active */
 
 	/* Transiently in the process of submit ioctl, objects associated
 	 * with the submit are on submit->bo_list.. this only lasts for
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18a7948ac437..8278a4df331a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -800,11 +800,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		struct drm_gem_object *drm_obj = &msm_obj->base;
 		uint64_t iova;
 
-		/* can't happen yet.. but when we add 2d support we'll have
-		 * to deal w/ cross-ring synchronization:
-		 */
-		WARN_ON(is_active(msm_obj) && (msm_obj->gpu != gpu));
-
 		/* submit takes a reference to the bo and iova until retired: */
 		drm_gem_object_get(&msm_obj->base);
 		msm_gem_get_and_pin_iova_locked(&msm_obj->base, submit->aspace, &iova);
-- 
2.26.2

