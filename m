Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2723D5C46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbhGZOQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 10:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234824AbhGZOQA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 10:16:00 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0417C061757;
        Mon, 26 Jul 2021 07:56:27 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id m1so13244430pjv.2;
        Mon, 26 Jul 2021 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/9kD03R/I14WeS9EvRH7N0IZXDfhlSexdVdh0n2rZY=;
        b=eEAiAKgjaHmZxwolent+wg3QattYfdkp1B0CmBm/n40uP0adslIMDfuPojzmUsbdyf
         AJDhZD2T9HzZzplabGfqo8gQPP9dME4H6pveaKZqKwobsfdPE8Y9OZYV3DC0p7/jsYPb
         YOxuwU+69NC2rkX1MN1uOs/XdYgs0dlDSGtqlBENN/5+Gj8eAVuRwLXex2mtVWEJ2KiE
         WtwNOkH3OTI1F5cxvTt0paNXzDkEUw/UmBl9iTo+DSoazqsv8Drb9dipj0XNLQoTo/H3
         ZUfPI5+sODHce6y1VBxcn9xfdPGo9dLvloP6ahN5m1HrZMDVssFSMndb71D66EeKJLqI
         Ofcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/9kD03R/I14WeS9EvRH7N0IZXDfhlSexdVdh0n2rZY=;
        b=mroBC7XxPam+d/97SAO+6hsiVDLHvDwrRSZfFEn0cCsxul0Xn9Te9LnLhtxyefVH5/
         CbDEBjEjp2fkwCcBxbF0iBvbf3Zf9Rx+8kiHTeF4edgH5Jp/BxffZz3/VXYVLxCj825y
         XVNLK5NfSH7AvSPS39psZq9nayu9OmV0y2LYG98JPER+By+PutMc+uz6gQPJUF8S376C
         ehhFA1JMez0dc9oxe/9vawCWe7KQCNq3m1Pj5OwNxSTFTK48ynEGxQV884GVixU2j50S
         yT2ZZbC0mzVXtrWmPzE3eQjLRkVvujHyw0Fn6h5wn7bLNv/wrM39/jFdLaFahmvuHwb1
         tR8w==
X-Gm-Message-State: AOAM532ZMStuV84HLiYwDJV8M8n7rCmapRxc+MKjhhAhVoQ/S79gF6OX
        FKXzKq5IyRmRsihc9cdFKts=
X-Google-Smtp-Source: ABdhPJzYzbwPC/fDpYJzGIRqBQhd3hO0AKLAC7XEJkJ8Quu2UsD6LRtVtgG9bMycjZdnKMhEwKgTuw==
X-Received: by 2002:a63:490e:: with SMTP id w14mr11480400pga.93.1627311387489;
        Mon, 26 Jul 2021 07:56:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id x14sm262652pfq.143.2021.07.26.07.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:56:26 -0700 (PDT)
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
Subject: [PATCH v2 01/12] drm/msm: Docs and misc cleanup
Date:   Mon, 26 Jul 2021 08:00:15 -0700
Message-Id: <20210726150038.2187631-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Fix a couple incorrect or misspelt comments, and add submitqueue doc
comment.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
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
index 710c3fedfbf3..96efcb31e502 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -250,6 +250,21 @@ struct msm_gpu_perfcntr {
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
index 7e92d9532454..054461662af5 100644
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

