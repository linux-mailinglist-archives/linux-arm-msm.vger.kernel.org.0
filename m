Return-Path: <linux-arm-msm+bounces-1779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388ED7F6BB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 06:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDFFC281839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 05:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6764416;
	Fri, 24 Nov 2023 05:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATkuxrak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D34D4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 21:28:12 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-42381f46968so7734121cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 21:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700803691; x=1701408491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEd37+CS0g7W2kV0CM4B4vaKMhhE6SvNFqz9yzetcmY=;
        b=ATkuxrakTrVW7Wlz3JHuxhJeuifJ8sUUX/dS5UvbNKGxfFAW1B763cN7xIFbhzPNMG
         EvfupLVHAIbULq0RlTAsGYbGVQNUHPJEq8cvjmu2QKAwdImCxgVdqBXeGclQu+GZnnDL
         5KLXPV4St9pqrDZlXJJ/iVE9rU013xTqvEUVdHMisvfD0Vh4O6XeTG5EGPDGS1LcDoxZ
         o0bswhvfzIcxUqVaoWElu7LWkQqcoJbp/IGgsVnGno8v1nNRythNtWnKDTO9DkH7irvQ
         GbITFqAVIWm32CB9AGDz5NSZSJtqORT2qwJuMokPUrGjGEKMvGxIXT3hFy5pB6+nxwQ6
         m/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700803691; x=1701408491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEd37+CS0g7W2kV0CM4B4vaKMhhE6SvNFqz9yzetcmY=;
        b=Tar4r6KWjaON7gQvlZzyMzKL37Rvax6X71lKrYdAFunxgnfeWVavKbzB4Lj4DS2E91
         0EvHbZl44vQMhpUiY4/1YMszjNtNDH7YSNA2JLJHkrw9ZOIocGLUbcjClpfGrXjkVy6/
         BsKK+7PWum0O4Ns47+uaWVPj0DtZCfWWLFspoVS+NWyMEejy+xGBsjUq811CIU+5mtDC
         lxz3bVwGuL4k1zyQjWCb44xqx1OTZ0UtoHobVO7ZQkYBFG5wZRgZag1V9HI2gbaFA59o
         eEvv7LeJeqYZL1w+Ad+OXRmNKxXTOznXzPUk3NkTBYl69/GTCiU+vsipaJtaPn+lAcnt
         NPUg==
X-Gm-Message-State: AOJu0YxXAO4TbN57OuNlXLFnckDLPyJeQBiL4h279dBVF+ufqgHjpGOD
	pq/FPuXryQeWvdyWyDw02R4=
X-Google-Smtp-Source: AGHT+IHu6/lP+pf5+jiv8agN8Uc2o5gGxzEud+66NSdFFbDySiTp4WwIJz2IT2AG9g6lyeFBvxWX+A==
X-Received: by 2002:a05:622a:150:b0:423:7d92:ddba with SMTP id v16-20020a05622a015000b004237d92ddbamr2218061qtw.5.1700803691086;
        Thu, 23 Nov 2023 21:28:11 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
        by smtp.gmail.com with ESMTPSA id g11-20020ac842cb000000b004181c32dcc3sm1017819qtm.16.2023.11.23.21.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 21:28:10 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
Date: Fri, 24 Nov 2023 00:27:55 -0500
Message-ID: <20231124052752.6915-6-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124052752.6915-4-ltuikov89@gmail.com>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reverse run-queue priority enumeration such that the higest priority is now 0,
and for each consecutive integer the prioirty diminishes.

Run-queues correspond to priorities. To an external observer a scheduler
created with a single run-queue, and another created with
DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedule
sched->sched_rq[0] with the same "priority", as that index run-queue exists in
both schedulers, i.e. a scheduler with one run-queue or many. This patch makes
it so.

In other words, the "priority" of sched->sched_rq[n], n >= 0, is the same for
any scheduler created with any allowable number of run-queues (priorities), 0
to DRM_SCHED_PRIORITY_COUNT.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
 drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
 include/drm/gpu_scheduler.h              |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1a25931607c514..71a5cf37b472d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index eb0c97433e5f8a..2bfcb222e35338 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cb7445be3cbb4e..6e2b02e45e3a32 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -81,14 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-		/* The "priority" of an entity cannot exceed the number
-		 * of run-queues of a scheduler.
+		/* The "priority" of an entity cannot exceed the number of
+		 * run-queues of a scheduler. Choose the lowest priority
+		 * available.
 		 */
 		if (entity->priority >= sched_list[0]->num_rqs) {
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_LOW);
+						 (s32) DRM_SCHED_PRIORITY_KERNEL);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b6d7bc49ff6ef4..682aebe96db781 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1051,8 +1051,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	/* Start with the highest priority.
+	 */
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1292,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1313,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,9 +1391,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_LOW;
-		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
-		     i++) {
+		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d8e2d84d9223e3..5acc64954a8830 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,10 +63,10 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_LOW,
-	DRM_SCHED_PRIORITY_NORMAL,
-	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
+	DRM_SCHED_PRIORITY_HIGH,
+	DRM_SCHED_PRIORITY_NORMAL,
+	DRM_SCHED_PRIORITY_LOW,
 
 	DRM_SCHED_PRIORITY_COUNT
 };
-- 
2.43.0


