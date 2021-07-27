Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40043D7BC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 19:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhG0RIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 13:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbhG0RIH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 13:08:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD855C061764;
        Tue, 27 Jul 2021 10:08:07 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so5256546pja.5;
        Tue, 27 Jul 2021 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
        b=aQmQKagbmnZ+BHethyxgK75k8Tv9Hm8vBues9pvulMioSMv8z4qG9zvXALbyG8a7vF
         /8P59Pd01G5S+JStEv4uqVUggPgkn3ejzJM/X3P7jISOqU/N84HupaSz7VjleB84bw+V
         GPgE6YL6CWSN0/RC+qn3L0+wD5M6aWE6YGxZyGjYcCNWWZiE3LVZ5pcsEVI67JB1KOrP
         0E+jPh5p4tPMfVxzEk2wpdx3oDtUDNeHp2si4k1uuXj32QHmzgWM8tdRFCIfrM71rsHd
         x7vTve1rBNqAwMmizhAQSOCx9V1WTUeBEm2cUn3mhtWcmnjNLesT79K7uEt3/UrMpl+s
         Zdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
        b=RqjyH0wnYnXfSBkAVRdNeW6ZE5xL7jZX0gPjEwLU5xf0E0l4FWDTeI8uWuTvR3KqiO
         cWI41rjUofR3mLWhZG1wI7B48vuY912iMrpAyqDaWTUyt9f2o25pZK41dOtMJE0c89qj
         Cw17RbeSRHpNyk9irFZjchFn3Koq6TWL4U2SEOcLoHUJXi8uF/2MDZpGjgPF8gdd7bGv
         P/vpRfPNnIgBOASrBoTE0/NHJdU569cSZFkjfhLxlQT8G8Y+pWI7pv1BauWBxC+FN51n
         rB5hXGyU7KtZg47TbfRH6JTiTt0eMiDjqWrK2Cizuzy0lzGttXHkddMb53M7glhsn4VJ
         pFwg==
X-Gm-Message-State: AOAM531JWUlUMkBfwqi4yrc7KKML/wzziYRBHlGzpabGOiZJ+l/YJdO3
        vrwDPg+BDlbE0GFRphiOZvg=
X-Google-Smtp-Source: ABdhPJy5R/8jkP0MbJEF2Oq7xrFn4gXezJ7NHToxQwoOC3cQr6uYgKiWLKQCRw6L8WJMbjv+NgTcCw==
X-Received: by 2002:a17:902:76cc:b029:12b:ecc5:c176 with SMTP id j12-20020a17090276ccb029012becc5c176mr15537321plt.42.1627405687324;
        Tue, 27 Jul 2021 10:08:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id n14sm3334052pjv.34.2021.07.27.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 10:08:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 11/13] drm/msm: Drop struct_mutex in submit path
Date:   Tue, 27 Jul 2021 10:11:27 -0700
Message-Id: <20210727171143.2549475-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is sufficient to serialize on the submit queue now.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e11e4bb63695..450efe59abb5 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -709,7 +709,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit;
+	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
@@ -753,7 +753,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
+	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		goto out_post_unlock;
 
@@ -874,10 +874,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
 	 * to the underlying fence.
 	 */
-	mutex_lock(&queue->lock);
 	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
 			submit->user_fence, 0, INT_MAX, GFP_KERNEL);
-	mutex_unlock(&queue->lock);
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
@@ -912,12 +910,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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

