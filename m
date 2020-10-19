Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E9E292FE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgJSUqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729583AbgJSUqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:46:11 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53971C0613CE;
        Mon, 19 Oct 2020 13:46:11 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v12so405236ply.12;
        Mon, 19 Oct 2020 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dS6hhGeeNo+o5stc1m3klvV0MU6/9n7XgjyibfTeKXY=;
        b=OJA+wyn6JLDMhTDG8WBs5XhLEe+X/qKDVSrazR34UOgIx3ndbLBu0K4nMx9XTq+BvL
         stx+uZloX5mxvTaRfAG3QyomeD2JM5nfXfqLP+i66IwToKfmXgQU0ke3NcyxY2Nfwt8P
         Q2nom7x7JnBoZa+2BBHPbFHEt34vdYCpkNC3Pq+NID7HLLtY+D4V7ZdPkTNLFbSHliPO
         mcflihkizr6cjRY48OVU97eerG9StIrxFZuN3jDX+4Iv4PidM/FBT5m6z9omtu6xRvA5
         oqnP7ZQ1pzIgjM2mmlJR5fvtc23X6dksKe0PZO/ne//8W/nUBzp/Pnwf2rT6vnNXXVG0
         cECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dS6hhGeeNo+o5stc1m3klvV0MU6/9n7XgjyibfTeKXY=;
        b=dcQC3W2mhbrD5YbNPy1o1PK+v+JCMbkbajh7rzcWmbNYfh8dCp7phkXxzEmq+XVMtK
         /nZwWwUjPW0YMpTMSGW9q34xbEfFFcjEh8Vvu0n01wC+X0DCV5qw5/lfG3g0s3EcSgOO
         gmzX7F5f7mf39s8Vbp/r/KG5M36wIEtYEbyHE/bGZ9N7IwzKAmy+LEnTWBvTQX6ULaAn
         3tXh3s9UZWKqo+7zJS6SqIrFHOEuGJFSFcLNGZGNixotVzO2cYQ9ShuxqbTWFuJcVRCz
         t+70K+Pr4yOj7z2yW2Q+zvTjA6Azw2iy6tuFopxGPAcHU4m8zFfBJi4krhpOHa5dqOwn
         4d5g==
X-Gm-Message-State: AOAM532rkIQzgyEhwMQUtrL16DXjlIz3qsvAPF2fp5gEATDTi8QwZXM/
        Pw0Omc3/KK57kfZQ2oToMAw=
X-Google-Smtp-Source: ABdhPJz2M/XIYWLX70uK3IG3ufRB/qD6L5QWHxAYEGC47AuIcoKtxDnfwWscnnNh8cWb5PKS+LXQiA==
X-Received: by 2002:a17:90b:ecb:: with SMTP id gz11mr1215247pjb.25.1603140370892;
        Mon, 19 Oct 2020 13:46:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n139sm600427pfd.167.2020.10.19.13.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:46:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 17/23] drm/msm: Remove obj->gpu
Date:   Mon, 19 Oct 2020 13:46:18 -0700
Message-Id: <20201019204636.139997-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
index 092ed152999e..e4876498be47 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -775,7 +775,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
@@ -791,7 +790,6 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 		mutex_unlock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2f289c436ddd..f4e73c6f07bf 100644
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
index bcd9b4fa98b2..d0f625112a97 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -810,11 +810,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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

