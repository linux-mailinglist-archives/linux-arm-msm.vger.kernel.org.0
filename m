Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40A63CC614
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 22:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbhGQU2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 16:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235163AbhGQU2R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 16:28:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38ACC061762;
        Sat, 17 Jul 2021 13:25:19 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso9685206pjp.5;
        Sat, 17 Jul 2021 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/gYOFyIjSDGauDczoQBbmlpItXDrO5+1nb16k3Nv9iU=;
        b=iKG/KtYmrWlmYWpiIA/PBbpdof61i98iY9+DJwFhhYusNVNdKZ9NxtfhUIcAQUS4kU
         pwsxPLER74BFQQZgiTkggkhes8HxX5NzTHOhmDwSh1lP45bZAZL6EQPJbwrMKN+GTtdc
         7LRusUUEcvcXHdUxLFaR8YRMOk8TMDv8plumWhK0fSxwRqWuEDEPWqZXvWO+XTEMi4uy
         W2nCcJ2C6z9u+PL0La6dS+tSL0PuQM/vPk8eRmwtRQmf+SEpXhSNnPRQVUpkCguX/+12
         yNZtRNbWsDqXdsysiF6TT4Sfq6FBFEjiPdJNZeXqjUBtr/KE07CpY6l1FBqsbAAFQBAg
         xp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gYOFyIjSDGauDczoQBbmlpItXDrO5+1nb16k3Nv9iU=;
        b=S9zlVhnDhN03i3OCIA243JdhVcF2ZgXdBvFx6OgFfSID/Z6Sd7BhIuqoqU1Mz9LuNT
         9n8Hc4qR+trMGXQsvdNy1tFK1roZrsH24GBCV9Sp3x/j7n/biX8ain1XToPepU1ObbsQ
         vXEGy7LOLG/6fqHyONMOBh0/8IWNC05jbUN+prgUFFz2S8Qnbe8AF4x2sOJNDIJqQXaO
         zG6zfi3hre6XkCVh8+rYTOMSsWHR8kMCpyQ4JC/2RwsUMYDbekVFAd91CYxHIXc7qmw6
         TSiEAimuwnAHww7ddWI25/zvmj3C7Ze9HKfgstvn6NFNpIMocLxkwWxHA6s2ifvWi1nq
         Cvnw==
X-Gm-Message-State: AOAM533q+eINIEYWyr1UMFwGbZOFhGMkAae5rgjNoZ3k/ci3OfKJOodT
        XPcYCS7tzfoPnBv6NSmRXp4=
X-Google-Smtp-Source: ABdhPJygNA1M7UFEN6V8Y5oMmOrV63wOQx6tLRJuKTGQxXNyspFEeo/hQ484J8fvKyGrH/ZO2r9T3w==
X-Received: by 2002:a17:90a:1749:: with SMTP id 9mr15850117pjm.97.1626553518620;
        Sat, 17 Jul 2021 13:25:18 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n33sm15500437pgm.55.2021.07.17.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 13:25:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/11] drm/msm: Docs and misc cleanup
Date:   Sat, 17 Jul 2021 13:29:03 -0700
Message-Id: <20210717202924.987514-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Fix a couple incorrect or misspelt comments, and add submitqueue doc
comment.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h         |  3 +--
 drivers/gpu/drm/msm/msm_gem_submit.c  |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c |  9 +++++----
 5 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 405f8411e395..d69fcb37ce17 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -313,8 +313,7 @@ void msm_gem_vunmap(struct drm_gem_object *obj);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
  * associated with the cmdstream submission for synchronization (and
- * make it easier to unwind when things go wrong, etc).  This only
- * lasts for the duration of the submit-ioctl.
+ * make it easier to unwind when things go wrong, etc).
  */
 struct msm_gem_submit {
 	struct kref ref;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 44f84bfd0c0e..6d46f9275a40 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -655,6 +655,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	bool has_ww_ticket = false;
 	unsigned i;
 	int ret, submitid;
+
 	if (!gpu)
 		return -ENXIO;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index c22813e312c7..f3609eca5c8f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -208,6 +208,21 @@ struct msm_gpu_perfcntr {
 	const char *name;
 };
 
+/**
+ * A submitqueue is associated with a gl context or vk queue (or equiv)
+ * in userspace.
+ *
+ * @id:        userspace id for the submitqueue, unique within the drm_file
+ * @flags:     userspace flags for the submitqueue, specified at creation
+ *             (currently unusued)
+ * @prio:      the submitqueue priority
+ * @faults:    the number of GPU hangs associated with this submitqueue
+ * @ctx:       the per-drm_file context associated with the submitqueue (ie.
+ *             which set of pgtables do submits jobs associated with the
+ *             submitqueue use)
+ * @node:      node in the context's list of submitqueues
+ * @ref:       reference count
+ */
 struct msm_gpu_submitqueue {
 	int id;
 	u32 flags;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 4d2a2a4abef8..b9b8a3b2547b 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -32,7 +32,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-		ring->start = 0;
+		ring->start = NULL;
 		goto fail;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index c3d206105d28..e5eef11ed014 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -98,17 +98,18 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	return 0;
 }
 
+/*
+ * Create the default submit-queue (id==0), used for backwards compatibility
+ * for userspace that pre-dates the introduction of submitqueues.
+ */
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio;
 
-	if (!ctx)
-		return 0;
-
 	/*
 	 * Select priority 2 as the "default priority" unless nr_rings is less
-	 * than 2 and then pick the lowest pirority
+	 * than 2 and then pick the lowest priority
 	 */
 	default_prio = priv->gpu ?
 		clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1) : 0;
-- 
2.31.1

