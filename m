Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E6E3D8529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 03:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhG1BDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 21:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234518AbhG1BDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 21:03:06 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FCAC06179B;
        Tue, 27 Jul 2021 18:03:05 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id k1so626859plt.12;
        Tue, 27 Jul 2021 18:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qGM6Ed6aQX7A3awTW5JWZ2DMzjNPHy+DrpaaPUL/9aE=;
        b=pDXlAhAUzKBCZQWG4ybwlNPg5RvSWaHLdOiwjou/MA9Jnz21hMgXdq80mXTgPIVC2+
         BdvVECQVk7H3OHACpIB2695Ili+Z7T5fIQmkqx2I5BjLBuULdO81tCiRu/P1urXK3mo4
         /9JpJVIZEqeJG6eurP42UdlADuGzhqmCPiUUUNI0Kjh11+VfwZKegZlG9CWRM+BeGOPk
         cg9Lbwq19/jyzam+72KZkV4LIVt9LWYyFrUaRbrsdXHw/XL3YrlXV6n5TGae9zCVWDbX
         NvD4EO6uqMDjEPTtSHa728jNFGaQ7iaK6PXPokNx8kPlT4k/8yborgmCVXdEvU3ciJdW
         8oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qGM6Ed6aQX7A3awTW5JWZ2DMzjNPHy+DrpaaPUL/9aE=;
        b=I1XiQDwDpJPOywkkRlwXyXuuHwZLlGTQoqPlupnoPJNlx0dfEtYu8kXdLsBFdmWZdX
         M2bsUnQvhsXhd8b17jVcxnh8xE4FCKvVUhP9Pye0zsPK69WJ2foiOL+Xi//J/mxnu4Ee
         ulluL1WypHMAOA3+5dIDmhJwelnSR8UPGG8qrEV8+Zzyvn2QupuC5BBYtFDqfWqUZ7Q+
         pV3YgZyjHHLNy2JVG7zOJf9vmsM1t3V/63BlEXMOxiT/vHto/G0afpl16rhssqkD1i/S
         N4jOL5/ca5ucMcqbDa3N0Hz8AiLu9Pa7zgeKoMrA8lBjliZKDGY0tIqRGR0lsg0zuqAR
         hBgA==
X-Gm-Message-State: AOAM5316o2we32wp51Vyv4X7k0ebyUgC8xU5ev+pinkleHtcdBWCGLSK
        dYWbpbBYffzNZTBZgXU7Y80=
X-Google-Smtp-Source: ABdhPJzJFu6Ld0Uz2Z4lyD+A/qzkAFKxtgz0Xxpx2SIzhPxhqcGrBN3sMBuU2ir+zEmqfp7PmS6k7Q==
X-Received: by 2002:a17:90a:4894:: with SMTP id b20mr5944996pjh.13.1627434184960;
        Tue, 27 Jul 2021 18:03:04 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l10sm4161010pjg.11.2021.07.27.18.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:03:03 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
Date:   Tue, 27 Jul 2021 18:06:17 -0700
Message-Id: <20210728010632.2633470-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The drm/scheduler provides additional prioritization on top of that
provided by however many number of ringbuffers (each with their own
priority level) is supported on a given generation.  Expose the
additional levels of priority to userspace and map the userspace
priority back to ring (first level of priority) and schedular priority
(additional priority levels within the ring).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
 drivers/gpu/drm/msm/msm_gpu.h           | 58 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
 include/uapi/drm/msm_drm.h              | 14 +++++-
 5 files changed, 88 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bad4809b68ef..748665232d29 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
 			return ret;
 		}
 		return -EINVAL;
-	case MSM_PARAM_NR_RINGS:
-		*value = gpu->nr_rings;
+	case MSM_PARAM_PRIORITIES:
+		*value = gpu->nr_rings * NR_SCHED_PRIORITIES;
 		return 0;
 	case MSM_PARAM_PP_PGTABLE:
 		*value = 0;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 450efe59abb5..c2ecec5b11c4 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
-	submit->ring = gpu->rb[queue->prio];
+	submit->ring = gpu->rb[queue->ring_nr];
 	submit->fault_dumped = false;
 
 	INIT_LIST_HEAD(&submit->node);
@@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	/* Get a unique identifier for the submission for logging purposes */
 	submitid = atomic_inc_return(&ident) - 1;
 
-	ring = gpu->rb[queue->prio];
+	ring = gpu->rb[queue->ring_nr];
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b912cacaecc0..0e4b45bff2e6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
 	const char *name;
 };
 
+/*
+ * The number of priority levels provided by drm gpu scheduler.  The
+ * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
+ * cases, so we don't use it (no need for kernel generated jobs).
+ */
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
+
+/**
+ * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
+ *
+ * @gpu:        the gpu instance
+ * @prio:       the userspace priority level
+ * @ring_nr:    [out] the ringbuffer the userspace priority maps to
+ * @sched_prio: [out] the gpu scheduler priority level which the userspace
+ *              priority maps to
+ *
+ * With drm/scheduler providing it's own level of prioritization, our total
+ * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
+ * Each ring is associated with it's own scheduler instance.  However, our
+ * UABI is that lower numerical values are higher priority.  So mapping the
+ * single userspace priority level into ring_nr and sched_prio takes some
+ * care.  The userspace provided priority (when a submitqueue is created)
+ * is mapped to ring nr and scheduler priority as such:
+ *
+ *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
+ *   sched_prio = NR_SCHED_PRIORITIES -
+ *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
+ *
+ * This allows generations without preemption (nr_rings==1) to have some
+ * amount of prioritization, and provides more priority levels for gens
+ * that do have preemption.
+ */
+static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
+		unsigned *ring_nr, enum drm_sched_priority *sched_prio)
+{
+	unsigned rn, sp;
+
+	rn = div_u64_rem(prio, NR_SCHED_PRIORITIES, &sp);
+
+	/* invert sched priority to map to higher-numeric-is-higher-
+	 * priority convention
+	 */
+	sp = NR_SCHED_PRIORITIES - sp - 1;
+
+	if (rn >= gpu->nr_rings)
+		return -EINVAL;
+
+	*ring_nr = rn;
+	*sched_prio = sp;
+
+	return 0;
+}
+
 /**
  * A submitqueue is associated with a gl context or vk queue (or equiv)
  * in userspace.
@@ -257,7 +310,8 @@ struct msm_gpu_perfcntr {
  * @id:        userspace id for the submitqueue, unique within the drm_file
  * @flags:     userspace flags for the submitqueue, specified at creation
  *             (currently unusued)
- * @prio:      the submitqueue priority
+ * @ring_nr:   the ringbuffer used by this submitqueue, which is determined
+ *             by the submitqueue's priority
  * @faults:    the number of GPU hangs associated with this submitqueue
  * @ctx:       the per-drm_file context associated with the submitqueue (ie.
  *             which set of pgtables do submits jobs associated with the
@@ -272,7 +326,7 @@ struct msm_gpu_perfcntr {
 struct msm_gpu_submitqueue {
 	int id;
 	u32 flags;
-	u32 prio;
+	u32 ring_nr;
 	int faults;
 	struct msm_file_private *ctx;
 	struct list_head node;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 682ba2a7c0ec..32a55d81b58b 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -68,6 +68,8 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
 	struct drm_gpu_scheduler *sched;
+	enum drm_sched_priority sched_prio;
+	unsigned ring_nr;
 	int ret;
 
 	if (!ctx)
@@ -76,8 +78,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	if (prio >= priv->gpu->nr_rings)
-		return -EINVAL;
+	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
+	if (ret)
+		return ret;
 
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 
@@ -86,24 +89,13 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-	queue->prio = prio;
+	queue->ring_nr = ring_nr;
 
-	ring = priv->gpu->rb[prio];
+	ring = priv->gpu->rb[ring_nr];
 	sched = &ring->sched;
 
-	/*
-	 * TODO we can allow more priorities than we have ringbuffers by
-	 * mapping:
-	 *
-	 *    ring = prio / 3;
-	 *    ent_prio = DRM_SCHED_PRIORITY_MIN + (prio % 3);
-	 *
-	 * Probably avoid using DRM_SCHED_PRIORITY_KERNEL as that is
-	 * treated specially in places.
-	 */
 	ret = drm_sched_entity_init(&queue->entity,
-			DRM_SCHED_PRIORITY_NORMAL,
-			&sched, 1, NULL);
+			sched_prio, &sched, 1, NULL);
 	if (ret) {
 		kfree(queue);
 		return ret;
@@ -134,16 +126,19 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
-	int default_prio;
+	int default_prio, max_priority;
 
 	if (!priv->gpu)
 		return -ENODEV;
 
+	max_priority = (priv->gpu->nr_rings * NR_SCHED_PRIORITIES) - 1;
+
 	/*
-	 * Select priority 2 as the "default priority" unless nr_rings is less
-	 * than 2 and then pick the lowest priority
+	 * Pick a medium priority level as default.  Lower numeric value is
+	 * higher priority, so round-up to pick a priority that is not higher
+	 * than the middle priority level.
 	 */
-	default_prio = clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1);
+	default_prio = DIV_ROUND_UP(max_priority, 2);
 
 	INIT_LIST_HEAD(&ctx->submitqueues);
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index f075851021c3..6b8fffc28a50 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -73,11 +73,19 @@ struct drm_msm_timespec {
 #define MSM_PARAM_MAX_FREQ   0x04
 #define MSM_PARAM_TIMESTAMP  0x05
 #define MSM_PARAM_GMEM_BASE  0x06
-#define MSM_PARAM_NR_RINGS   0x07
+#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
 #define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
 #define MSM_PARAM_FAULTS     0x09
 #define MSM_PARAM_SUSPENDS   0x0a
 
+/* For backwards compat.  The original support for preemption was based on
+ * a single ring per priority level so # of priority levels equals the #
+ * of rings.  With drm/scheduler providing additional levels of priority,
+ * the number of priorities is greater than the # of rings.  The param is
+ * renamed to better reflect this.
+ */
+#define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
+
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
 	__u32 param;          /* in, MSM_PARAM_x */
@@ -304,6 +312,10 @@ struct drm_msm_gem_madvise {
 
 #define MSM_SUBMITQUEUE_FLAGS (0)
 
+/*
+ * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
+ * a lower numeric value is higher priority.
+ */
 struct drm_msm_submitqueue {
 	__u32 flags;   /* in, MSM_SUBMITQUEUE_x */
 	__u32 prio;    /* in, Priority level */
-- 
2.31.1

