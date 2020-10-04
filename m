Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14410282D0E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgJDTV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgJDTV1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:27 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1991DC0613D0;
        Sun,  4 Oct 2020 12:21:27 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d6so5074862pfn.9;
        Sun, 04 Oct 2020 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vEBEzHX4FK8oW5uL67k1FNFvzQH83mQw0CZJtsDsaKw=;
        b=Hzjye1b980xxUdFLsacO7q0N6hoEnDM3nQWNzKYMilrw33DARbC/5FepZSqAxq7Ki3
         i/UmpWsE8CXF9AY7kWKEoCCO4QCkygaK5mhPGW+Aqe8br15sDIbcTv1+iW3fr8gfHPeV
         oP9ASgE5PqY7PLNOVJf+GGDVy+IugIVkJG7wEb3jFMoxbgdnZk9uX4Nh+3CdsYHoh/dh
         u/PgrmuHq1QbLebRAb5UV76b8RRALp74tIeM7cAUDgwo06Nwd1mwT8wZyk4XvoD1b9q/
         19ZpBMJPMOY+Y/n5MyDn6nIdpK1vP69bMDY2yE+zUgM82IiGYMuPyRPSfM7JWfJggrS/
         TvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vEBEzHX4FK8oW5uL67k1FNFvzQH83mQw0CZJtsDsaKw=;
        b=tlCu/gNbtKOeQ9jYy3YVsyHFYZJC0sj5wuSlbFx3Hv9gW06SMJMC1fJtzG0ytQf5Fe
         Zo+q9RX42/dgv98Z5Nz3kIGliciDDZQ0eijjYWxie2W6siJqmQnRfi/W/L0tq8u8dL2b
         p1H3KRSDmQ1PQxTrQHgQjGhTQYqNgtpb/MwRaAxCC+LRP56dNHFpIKgEPuTsBQVXIxy8
         A9or8XcZsW2wL0WpSsDwEGVmbTAcBr1jeJ9OW0jxniyg3D2qbgWefywCgu4IqjivkKkn
         woup/yuCacHjUl8Zl97Qt+YHu1WqB0T5avsxXMn9VEditpS7GHmYuXQnzWBKfK5/bRYG
         o/9w==
X-Gm-Message-State: AOAM532dFMv2/MhfjtkD3fki3JFzhsccNrrRk1++Ev/ZxxJoqogBHWeu
        mThySLfr8uy0UacMf2YM+geGXtITCsG+PTLb
X-Google-Smtp-Source: ABdhPJxEXUizQpJydRPL5ncBxX0cny9DJU36ltWrqRo5u/wcFIoY6p7FzGE8l3EOH6JuFvZ6fqAecw==
X-Received: by 2002:a62:dd02:0:b029:142:2501:398c with SMTP id w2-20020a62dd020000b02901422501398cmr12607535pff.81.1601839286605;
        Sun, 04 Oct 2020 12:21:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q66sm5106416pfc.109.2020.10.04.12.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:25 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 08/14] drm/msm: Remove obj->gpu
Date:   Sun,  4 Oct 2020 12:21:40 -0700
Message-Id: <20201004192152.3298573-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
index b04ed8b52f9d..c52a3969e60b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -753,7 +753,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
@@ -769,7 +768,6 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 		mutex_unlock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e05b1530aca6..61147bd96b06 100644
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
index fd3fc6f36ab1..c9ff19a75169 100644
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
 		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
-- 
2.26.2

