Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDAC44DC14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 20:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234434AbhKKTWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 14:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhKKTWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 14:22:42 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90371C061766;
        Thu, 11 Nov 2021 11:19:53 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so4599411pjb.1;
        Thu, 11 Nov 2021 11:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmBLUrJ1pjWQ4c27cD0iWXnDGV3xPRlcSYls26QLyvM=;
        b=SFYqejm6GHXh73rIi8sp5NbmZZ3W339y3vnR/UWO+Jo8FFki88Vptu7yo08uDxeORl
         jrR1wf7rtOOAPSV7gsXIxcwdY2uOQn8ULunE1lgPmgqWt1+xbk4uJ8g20ajVoVVXHvTh
         SlA8XqRMoWaKnvIIz5bPYa97IhT5Kl8y+395Fna9MHkXn3/Oh7DizRDknkpiSdxR04DM
         2SrtmFdrsaf07sGdza6bMWcAzXspNnF+gpf13RjguY/dyIOCSORWeGaCZ/V5IYf1XPNu
         CHa9NB5z0f2XueMxFQ6Z3b3CGErWBnoYu7Zz3pifXLSRRygMNZonyPpjN3l6YJKEOsh/
         kbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmBLUrJ1pjWQ4c27cD0iWXnDGV3xPRlcSYls26QLyvM=;
        b=IwFEB8J+lEhJ7Os+14Ij2XfbH1vMi79j/w+yietnLrorR+JTKoyh7rEd5Br7IGOGdL
         JvYd48J59bPbx27CiZA8LD12zYd6+Z11IEyBC9QIwqMyztCGLd35ly5VLPLzRImV5b62
         5rFanW/X7yzk96bIhgr1elRZm0seSaxRXiDY8jnhonVbnAxCwAem06EGq1Z+PESdlOLu
         vitO2oeJTErjr8mpMStSsJzO5WWbU0cKwc7F+/J5EcLwcYb38TFY4+mcPN0i0wHGxniF
         yluzOJq/KoGp90VWBnQ9xsquvNyCiIT7pUCIzrV0bTWxdJV/yhe4Tjg7kXTFYbd5Ps1/
         4cog==
X-Gm-Message-State: AOAM532AmkSfJDfde5jPMcJHaoedh2abL/+nxPx7B1E5G+Pc4+KX/GGB
        zK1b52k6mCS3evb3phq5s0GrFpjAeWw=
X-Google-Smtp-Source: ABdhPJwUDT3B3FYu1EtS/05ERDv63SGfgPigtC2o1eHKy2r6IRLrQnTx/ASkxfHvaAdLa0zev4uyww==
X-Received: by 2002:a17:90b:3e8c:: with SMTP id rj12mr11006957pjb.152.1636658393183;
        Thu, 11 Nov 2021 11:19:53 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j6sm2855418pgf.60.2021.11.11.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 11:19:52 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Fix wait_fence submitqueue leak
Date:   Thu, 11 Nov 2021 11:24:55 -0800
Message-Id: <20211111192457.747899-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111192457.747899-1-robdclark@gmail.com>
References: <20211111192457.747899-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We weren't dropping the submitqueue reference in all paths.  In
particular, when the fence has already been signalled. Split out
a helper to simplify handling this in the various different return
paths.

Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 49 +++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73e827641024..cb14d997c174 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -961,29 +961,12 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
-		struct drm_file *file)
+static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
+		      ktime_t timeout)
 {
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_wait_fence *args = data;
-	ktime_t timeout = to_ktime(args->timeout);
-	struct msm_gpu_submitqueue *queue;
-	struct msm_gpu *gpu = priv->gpu;
 	struct dma_fence *fence;
 	int ret;
 
-	if (args->pad) {
-		DRM_ERROR("invalid pad: %08x\n", args->pad);
-		return -EINVAL;
-	}
-
-	if (!gpu)
-		return 0;
-
-	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
-	if (!queue)
-		return -ENOENT;
-
 	/*
 	 * Map submitqueue scoped "seqno" (which is actually an idr key)
 	 * back to underlying dma-fence
@@ -995,7 +978,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		return ret;
-	fence = idr_find(&queue->fence_idr, args->fence);
+	fence = idr_find(&queue->fence_idr, fence_id);
 	if (fence)
 		fence = dma_fence_get_rcu(fence);
 	mutex_unlock(&queue->lock);
@@ -1011,6 +994,32 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	}
 
 	dma_fence_put(fence);
+
+	return ret;
+}
+
+static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_wait_fence *args = data;
+	struct msm_gpu_submitqueue *queue;
+	int ret;
+
+	if (args->pad) {
+		DRM_ERROR("invalid pad: %08x\n", args->pad);
+		return -EINVAL;
+	}
+
+	if (!priv->gpu)
+		return 0;
+
+	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
+	if (!queue)
+		return -ENOENT;
+
+	ret = wait_fence(queue, args->fence, to_ktime(args->timeout));
+
 	msm_submitqueue_put(queue);
 
 	return ret;
-- 
2.31.1

