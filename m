Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAD6297527
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752796AbgJWQux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752791AbgJWQuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:51 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47776C0613D2;
        Fri, 23 Oct 2020 09:50:51 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id j18so1807141pfa.0;
        Fri, 23 Oct 2020 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GKxFRnjWbzeynLjiAycb1bjQvjSpLQB6o5QawmkEOkA=;
        b=rIiKuuNVvOgMEozh4x6fmQlP5rcSe4l3M7Ynk4bzHcFIzKYXi48PE/YOJ7fyUv1Gjm
         Vbfp0+kL8aGEF1jVEOr8FTZ3EtHt9nHleQuiIFUuEGTMdYG/Flksc36R/VQvBXb8+jZ8
         jhkiU+3uV0jwo02K36IWwL1+FLnN2HFwIjr8PyNRCbT5H62xKj9OhOk77vr4UQYfxfBv
         qRoGgPMEak8JfXysY4PGG/VhZS88yYKFijKvAA0O1EM26TrqiLHlite0H18FXKwnH6br
         uWd+TJCriUHlui0qg4DXChSEkHc0Q19ZD1PnnLF1plLU3WmbxN50YcntFCMym1CA6lEi
         yqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GKxFRnjWbzeynLjiAycb1bjQvjSpLQB6o5QawmkEOkA=;
        b=q7Dpn38YNCSBze0xSYcn/Wr2XUqOiF6RVcBt8A34fv7GJnkaVnkpdEwNMXtg8Wwn5f
         iOpsgKmp8N08AT++wgy7XKdXellSdAt9eJJ/Zzhw96scYj+nqawlTqPCqsbP6XJeK3l0
         XYgkCtN7FqY57H/f7i56aJ8oCYUAqPOx31JLorreHtp5hZdLhNFToMnPTLrwQ5bBCORI
         tkLdNYVp5ET+93xDbu5iq9Vr55y07II6pZq9CNy9gSAZBwNUUZqFnh9Kj+ks9kYlWNwl
         32E69413uZrF0VIYXyecnYL0/ph5/ZTfxtFOMFBM/xS1QI46/7R7oS0lUVsslI+7o2n1
         DObg==
X-Gm-Message-State: AOAM533rm2AGRL0x6r8CryTahxhDMgoY6xvzidy37MS/vQAie2ZsU0L/
        4867ZJx/dNSHWsI0SWNoj1c=
X-Google-Smtp-Source: ABdhPJwRvknrForq9c0tmRaatGiXS5uxRbvnYUkSD0tCwEvqSkO/ctwT1h0MipvB2W4kg657j9Wtcw==
X-Received: by 2002:a63:3004:: with SMTP id w4mr2714510pgw.249.1603471850767;
        Fri, 23 Oct 2020 09:50:50 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id e6sm2684025pfn.190.2020.10.23.09.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:49 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 16/23] drm/msm: Refcount submits
Date:   Fri, 23 Oct 2020 09:51:17 -0700
Message-Id: <20201023165136.561680-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Before we remove dev->struct_mutex from the retire path, we have to deal
with the situation of a submit retiring before the submit ioctl returns.

To deal with this, ring->submits will hold a reference to the submit,
which is dropped when the submit is retired.  And the submit ioctl path
holds it's own ref, which it drops when it is done with the submit.

Also, add to submit list *after* getting/pinning bo's, to prevent badness
in case the completed fence is corrupted, and retire_worker mistakenly
believes the submit is done too early.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_drv.h        |  1 -
 drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c | 11 +++++------
 drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
 4 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a17dadd38685..2ef5cff19883 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
 bool msm_use_mmu(struct drm_device *dev);
 
-void msm_gem_submit_free(struct msm_gem_submit *submit);
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f0608d96ef03..2f289c436ddd 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -213,6 +213,7 @@ void msm_gem_free_work(struct work_struct *work);
  * lasts for the duration of the submit-ioctl.
  */
 struct msm_gem_submit {
+	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
 	struct msm_gem_address_space *aspace;
@@ -249,6 +250,18 @@ struct msm_gem_submit {
 	} bos[];
 };
 
+void __msm_gem_submit_destroy(struct kref *kref);
+
+static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
+{
+	kref_get(&submit->ref);
+}
+
+static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
+{
+	kref_put(&submit->ref, __msm_gem_submit_destroy);
+}
+
 /* helper to determine of a buffer in submit should be dumped, used for both
  * devcoredump and debugfs cmdstream dumping:
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 24ce4c65429d..d04c349d8112 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (!submit)
 		return NULL;
 
+	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
@@ -60,14 +61,13 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	return submit;
 }
 
-void msm_gem_submit_free(struct msm_gem_submit *submit)
+void __msm_gem_submit_destroy(struct kref *kref)
 {
+	struct msm_gem_submit *submit =
+			container_of(kref, struct msm_gem_submit, ref);
 	unsigned i;
 
 	dma_fence_put(submit->fence);
-	spin_lock(&submit->ring->submit_lock);
-	list_del(&submit->node);
-	spin_unlock(&submit->ring->submit_lock);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
@@ -847,8 +847,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-	if (ret)
-		msm_gem_submit_free(submit);
+	msm_gem_submit_put(submit);
 out_unlock:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 1d6f3dc3fe78..bcd9b4fa98b2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -722,7 +722,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
-	msm_gem_submit_free(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_del(&submit->node);
+	spin_unlock(&ring->submit_lock);
+
+	msm_gem_submit_put(submit);
 }
 
 static void retire_submits(struct msm_gpu *gpu)
@@ -796,10 +801,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	submit->seqno = ++ring->seqno;
 
-	spin_lock(&ring->submit_lock);
-	list_add_tail(&submit->node, &ring->submits);
-	spin_unlock(&ring->submit_lock);
-
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
 	update_sw_cntrs(gpu);
@@ -826,6 +827,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		msm_gem_active_get(drm_obj, gpu);
 	}
 
+	/*
+	 * ring->submits holds a ref to the submit, to deal with the case
+	 * that a submit completes before msm_ioctl_gem_submit() returns.
+	 */
+	msm_gem_submit_get(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_add_tail(&submit->node, &ring->submits);
+	spin_unlock(&ring->submit_lock);
+
 	gpu->funcs->submit(gpu, submit);
 	priv->lastctx = submit->queue->ctx;
 
-- 
2.26.2

