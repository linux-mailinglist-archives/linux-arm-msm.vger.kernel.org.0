Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B7D3CC63E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 22:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhGQU25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 16:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235855AbhGQU2q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 16:28:46 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB69C061767;
        Sat, 17 Jul 2021 13:25:48 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id a6so6968797pgw.3;
        Sat, 17 Jul 2021 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdFTHD6jLUI9qxEH3vZzlumu96525aAvrYlO7/WiNW0=;
        b=a7BoAmAtvpH34qi6QByEmdOsJqhMdeb8oek4JDCdTIuiAEo/e2WNAJj/hu+pFm4Xai
         JpKrOtNnTrFsH3H6NXmtTHKisTYtu6yaHn304KRtwbccxfQ0Zns6wGNBHChDs89cX/FQ
         dS/N0CKyGatMynZeubsUq1uVaItC/flH4/p4xn+QUQSyoiNkfZ50oTrH3dRon4gTd3OE
         U/tc6BFeDmWto7Uay8d72N0hkYxMPGyaHuc7THSMQXfaC2NaKhpLaVcG2XxPvCVYfgqx
         YMOoII/1KDCmWd28j6wo6FM/3OYiO2WWT3kYXKSLXA1lEBDAMjr4368DoANZ+ZlsdVTZ
         TgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdFTHD6jLUI9qxEH3vZzlumu96525aAvrYlO7/WiNW0=;
        b=nitDvvXyKIYvg9m3h6p9DltOvgYfeXsBBN0kgLHFLSG3SrTpfparhsq4deI7YRxsn5
         yzXmeP9cGR2QoMprK4v0xlzLwLgiKS5u2alh9Dw0SEdZZWplfE2W2vp9rWixqO+0TJvZ
         BIC5sVQ/ECo05IQfqglFzKiLMaJ/VMCqYAixly2ANOoHNzJzmv8t7q5cs3G3J8Iaubz6
         OxPq6/0VEx/kA3ezUTqUAvirl4Va5JkHVCz1BsUIQfRzS7q/uwFsvGfjZqe5mq6moRrH
         L5/jWqXknUNttgbdQHQEOoauUyrkhBD7I7gm6KPdimyT8Kv4SQQGMBSN9nr0qXHgs04y
         4ABw==
X-Gm-Message-State: AOAM530M3erxyZc1qqeEZa/HnFC2XC7+dAja3q8huTkaf/LwYTiPgK2h
        OSt+7EnwPh91qooCOMNGLj4=
X-Google-Smtp-Source: ABdhPJxzL2Rsqyzo/ta2+hXzpRZBxiZYeT3Xv57OY6ocljyqwhq3WRhUjKBS9kRuGgP0ZfGHI87e2Q==
X-Received: by 2002:a63:fe51:: with SMTP id x17mr16478700pgj.58.1626553547973;
        Sat, 17 Jul 2021 13:25:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k8sm6022823pfu.116.2021.07.17.13.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 13:25:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/11] drm/msm: Drop struct_mutex in submit path
Date:   Sat, 17 Jul 2021 13:29:12 -0700
Message-Id: <20210717202924.987514-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is sufficient to serialize on the submit queue now.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 66316ea47c18..73bdea43e1ab 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -711,7 +711,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit;
+	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
@@ -755,7 +755,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
+	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		goto out_post_unlock;
 
@@ -876,10 +876,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
 	 * to the underlying fence.
 	 */
-	mutex_lock(&queue->lock);
 	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
 			submit->fence, 0, INT_MAX, GFP_KERNEL);
-	mutex_unlock(&queue->lock);
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
@@ -914,12 +912,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit_cleanup(submit, !!ret);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-	msm_gem_submit_put(submit);
 out_unlock:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
-	mutex_unlock(&dev->struct_mutex);
-
+	mutex_unlock(&queue->lock);
+	if (submit)
+		msm_gem_submit_put(submit);
 out_post_unlock:
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
-- 
2.31.1

