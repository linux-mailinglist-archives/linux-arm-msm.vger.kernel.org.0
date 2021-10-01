Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7276B41F3F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355523AbhJAR4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355506AbhJAR4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:56:05 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A10C061775;
        Fri,  1 Oct 2021 10:54:21 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id h1so4512125pfv.12;
        Fri, 01 Oct 2021 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/vkapvopYf4d5OFUhbMrXMMqppSzZJW52FlsHM4D2c4=;
        b=hmfioFfHp3myRG8xL2Vimz4bhlUsEmsQ5w/5loL8YUFNXitmPoqDKjoJy+eU3BJ0Sm
         UTouiGZf6HsnBUeVP8a5KfgEzUH6Ecvghy2OXopp/wfTuW7ClfI5ICpwh9XtrdkA5F4t
         XtEDXSN7fjA8Q8QzSL3cyh3jtUtx6u4tDyuROQg5QVEAQBUvkMwackCQp60NUy/RYZOX
         Sa3PmtLnYh8vEyRkEZE4CN9f7snYHJXeKCu6p4Pa740XljJmBIs8xn7lC8nSQ8xL4sH3
         XI+679qiA/z2JZ5iJmZunF/NBCmgF0VPtajerE8bF00U459+IAGrxaLv8cgEKUbN22le
         9lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/vkapvopYf4d5OFUhbMrXMMqppSzZJW52FlsHM4D2c4=;
        b=TmWr8jTmIkl425HpmWwKPDl9XpqB7E0RjiO6kFM1KKzRagnqGP+B9RpVGYY40LhvBD
         mzjI6L6PcUqi6LAJzTlFl+QVkB1vaE2sN/qyQwAvtshuvTr7VD34MNdPmX2yaJVt1RCq
         JBvGhghuMIVfVmk4jqEU8qhlNMnyxiDSiLOv7fe3Pxx+RAsdRFu+PpQ0kDqANPEkaGPg
         eBUJbQ5Y9FpE7WGS9Te/TNdatcuL2Z0xXxpJPhGGI4UIXgg07qEC+5k8dopY/Py0okiZ
         HwqSLRBC18G2nS9+W9Vzl1mY3KHGFMIHRzcwevcDoh2lao6r0J/ACdbZHylThyEVEY95
         rzcQ==
X-Gm-Message-State: AOAM531Xm4/7IsbiRftFh01SnedXoG7Ni/KghLu5g9amB99/fCl25dFM
        8xvVaLuMHA/3c93l3ZfLC6A=
X-Google-Smtp-Source: ABdhPJwFeagFYohF2YDXBtuImhEfzKCFXXvdMI6HiUv534qRyggQdwW9qG5pS90u5G9eQTdTjKY8RA==
X-Received: by 2002:a05:6a00:9a:b0:44b:b8f9:1d72 with SMTP id c26-20020a056a00009a00b0044bb8f91d72mr11545734pfj.21.1633110861123;
        Fri, 01 Oct 2021 10:54:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id t23sm2260261pgn.25.2021.10.01.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:54:20 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: A bit more docs + cleanup
Date:   Fri,  1 Oct 2021 10:58:55 -0700
Message-Id: <20211001175857.1324712-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211001175857.1324712-1-robdclark@gmail.com>
References: <20211001175857.1324712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

msm_file_private is more gpu related, and in the next commit it will
need access to other GPU specific #defines.  While we're at it, add
some comments.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 44 --------------------------
 drivers/gpu/drm/msm/msm_gpu.h | 58 ++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8633d0059a3e..31b39c27156d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -53,15 +53,6 @@ struct msm_disp_state;
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
-struct msm_file_private {
-	rwlock_t queuelock;
-	struct list_head submitqueues;
-	int queueid;
-	struct msm_gem_address_space *aspace;
-	struct kref ref;
-	int seqno;
-};
-
 enum msm_mdp_plane_property {
 	PLANE_PROP_ZPOS,
 	PLANE_PROP_ALPHA,
@@ -511,41 +502,6 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
 			   clockid_t clock_id,
 			   enum hrtimer_mode mode);
 
-struct msm_gpu_submitqueue;
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
-		u32 id);
-int msm_submitqueue_create(struct drm_device *drm,
-		struct msm_file_private *ctx,
-		u32 prio, u32 flags, u32 *id);
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
-		struct drm_msm_submitqueue_query *args);
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id);
-void msm_submitqueue_close(struct msm_file_private *ctx);
-
-void msm_submitqueue_destroy(struct kref *kref);
-
-static inline void __msm_file_private_destroy(struct kref *kref)
-{
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
-
-	msm_gem_address_space_put(ctx->aspace);
-	kfree(ctx);
-}
-
-static inline void msm_file_private_put(struct msm_file_private *ctx)
-{
-	kref_put(&ctx->ref, __msm_file_private_destroy);
-}
-
-static inline struct msm_file_private *msm_file_private_get(
-	struct msm_file_private *ctx)
-{
-	kref_get(&ctx->ref);
-	return ctx;
-}
-
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2fcb6c195865..592334cb9a0b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -272,6 +272,26 @@ struct msm_gpu_perfcntr {
  */
 #define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
 
+/**
+ * struct msm_file_private - per-drm_file context
+ *
+ * @queuelock:    synchronizes access to submitqueues list
+ * @submitqueues: list of &msm_gpu_submitqueue created by userspace
+ * @queueid:      counter incremented each time a submitqueue is created,
+ *                used to assign &msm_gpu_submitqueue.id
+ * @aspace:       the per-process GPU address-space
+ * @ref:          reference count
+ * @seqno:        unique per process seqno
+ */
+struct msm_file_private {
+	rwlock_t queuelock;
+	struct list_head submitqueues;
+	int queueid;
+	struct msm_gem_address_space *aspace;
+	struct kref ref;
+	int seqno;
+};
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
@@ -319,6 +339,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
 }
 
 /**
+ * struct msm_gpu_submitqueues - Userspace created context.
+ *
  * A submitqueue is associated with a gl context or vk queue (or equiv)
  * in userspace.
  *
@@ -336,7 +358,7 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @lock:      submitqueue lock
  * @ref:       reference count
- * @entity: the submit job-queue
+ * @entity:    the submit job-queue
  */
 struct msm_gpu_submitqueue {
 	int id;
@@ -436,6 +458,40 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
 
+int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+		u32 id);
+int msm_submitqueue_create(struct drm_device *drm,
+		struct msm_file_private *ctx,
+		u32 prio, u32 flags, u32 *id);
+int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+		struct drm_msm_submitqueue_query *args);
+int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id);
+void msm_submitqueue_close(struct msm_file_private *ctx);
+
+void msm_submitqueue_destroy(struct kref *kref);
+
+static inline void __msm_file_private_destroy(struct kref *kref)
+{
+	struct msm_file_private *ctx = container_of(kref,
+		struct msm_file_private, ref);
+
+	msm_gem_address_space_put(ctx->aspace);
+	kfree(ctx);
+}
+
+static inline void msm_file_private_put(struct msm_file_private *ctx)
+{
+	kref_put(&ctx->ref, __msm_file_private_destroy);
+}
+
+static inline struct msm_file_private *msm_file_private_get(
+	struct msm_file_private *ctx)
+{
+	kref_get(&ctx->ref);
+	return ctx;
+}
+
 void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
-- 
2.31.1

