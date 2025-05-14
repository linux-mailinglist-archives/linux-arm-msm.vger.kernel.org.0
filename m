Return-Path: <linux-arm-msm+bounces-57904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3DAB737A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DC5917A16A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCADC28751D;
	Wed, 14 May 2025 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NadTJK6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A1928642F;
	Wed, 14 May 2025 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245363; cv=none; b=T3undbbupXYfUVOpr1JkewjXpJdI5a+zuAkFJzM9icnfX1qeNbThwY6+fjPWKnXjcoyJ5TN/6yqqqDA2a5qRJHCuw7vDvComlgCsXhrekdpeYprPcSpHJU2JY2XrbLVNPA/Ib7Kcca8zym4ZuG7kgCeq8m7jsFYgUSkelIC37nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245363; c=relaxed/simple;
	bh=S70AqtUkK5OmAkeX3+eW3Kz8b90sl271x2qby76umKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acFA2Lq+RJwcb7LH7Su1sCS9+7sEjXitWJ8MDHCQEYJwczMrvjN26hIL7g9Hfw8tWalC3SDl5Be3ZtnxWdLBpToKFhp5eb0nFYIb1IA4KUfWvUvHHbIoH43k8JD0AdEZBt7nhLOkQsqsDapMaIanM3myXq1rqdnhYFc0Fxe47QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NadTJK6d; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so1104438b3a.0;
        Wed, 14 May 2025 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245361; x=1747850161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0BW6GR7shhqIiAyRWPQuh4IbH82fM2o3KorXlQUa88=;
        b=NadTJK6dSH/VqoWtxzCRIkKEvXEKC++xqPzgE4qxq6a/K0CBshLN/+n8QbVhbIe6LM
         tCKgs1/FUh5ULii1Z3xYfF4MWjzdDUVmiNjsKABW5eVbjINiXOFgd16XxuIhabFd1Syj
         h0UBvz5ychIZXJnAI2DowWQcx82Bk/dJ5LoJPDJYgKwUHT/hkqf99EkOE3UPsn5H8fOv
         /A93q5h5EpUQMIiiHXwOTpHDokmqTu095Bh+DMdZlw5ay5yGGDZXSZSmXhA0iIhJkkjs
         TvgQa8Q9HWxBi1eROHA0zsZcmSeG/FMFMEVdMp354lwmZQD4amM9wWzhn2qbJkHiUopb
         ANdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245361; x=1747850161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0BW6GR7shhqIiAyRWPQuh4IbH82fM2o3KorXlQUa88=;
        b=vjoVv9oSGVDBcxcRA2/mis2hp+tDOqKdtDCt1hd0DSX9sh3BteW8QJjtWHUHBNS5/x
         rKleeGXdkP0ocBaSspF/WquzYuehuTuDfeYbQynFJ5FyvG5ogd1nzRLDUHy83lUlA5iS
         tNFpHiX3DCCNiAA6p/uCpHz7/gH3q4XCBvSg1CNGB2FBQaA65I7ntaAfe8YFuEoTORfz
         LIazC4HXqn3KyYF8Rvj+cHtlQNFxt+cahqMNdlM+uQZMOpos5iH0B0mBBE5rbaRayRDy
         NpAos2xH9A8ACVqA4xdyVUFiaTgZPbhid5ZnEu/ueUd17OSbUCmESjLDaCCnTg/vUC8a
         4PhA==
X-Forwarded-Encrypted: i=1; AJvYcCVPhwLtKk5F3TKuX+sRGSLe28A44LA1kTD0P1MBgBOFSMS8Z6KCcsASpoHP8pB2P1MUKB5oxwHVQLuKvwBQ@vger.kernel.org, AJvYcCXLT3ce77ccXd8+hYrMhEh6HzBJBSFKgYnBCzVNa8oD/h1dE56y7Jdu1ZIag4mCywT+z5JpYCbXq3Ids9vX@vger.kernel.org
X-Gm-Message-State: AOJu0YxODZ2KxgKm946JJl6LWTu+FGWBOVIoS4wK2DAh4lMrVot7BCu7
	TAYrnY+FhpYayT7sy9Blfm+HdAKEq0I5zZ9tSRQQhDsLICnU3pEb
X-Gm-Gg: ASbGncv96YYN7CVLYj+r8CAed5asPmP4sOol8QLAbtd2qtzEZ+mGAYL9fpIFeglc9Ua
	BlMGuYWjeeu9DHMDSuUVlsvIH3HU1KkArBUBndMRkdk9mmuEAYQmLvBEIIoUF/mGe+KprtovlNz
	qg+/2jkbEelj3EauRcJFt/3/AKYJZddMAGS3oV1RARN9TYRL3HBDbzDR5VppQ1gzanmFVbGJ+j9
	CUBhF9ThPifDTATZQajE8LIInaV7vk7mXuk7NG8S3DMppTQ/q9l0j/Arm0KYrVhQNRfx77x/DWO
	OTt7FlDEvIqgv6ydeJbUAqOYK7K/aO7A02m4BDAtGQq1q/lhKJxSXjxqIx4hUuV1aFm3x/Gr5HW
	q8pJLVdEwLlcZxYgeRNBZrPvlYg==
X-Google-Smtp-Source: AGHT+IH9ASrEh97rkZ68eKiC0ycuLAP9gnKMJ/sdXibkRO5fP2Ze6CdxBccFaSLMJtqsa/B/em2zdg==
X-Received: by 2002:a17:903:491:b0:221:751f:cfbe with SMTP id d9443c01a7336-231b39a7cb7mr5857725ad.19.1747245361294;
        Wed, 14 May 2025 10:56:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82893f7sm101425855ad.159.2025.05.14.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Date: Wed, 14 May 2025 10:53:18 -0700
Message-ID: <20250514175527.42488-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Similar to the existing credit limit mechanism, but applying to jobs
enqueued to the scheduler but not yet run.

The use case is to put an upper bound on preallocated, and potentially
unneeded, pgtable pages.  When this limit is exceeded, pushing new jobs
will block until the count drops below the limit.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++++--
 drivers/gpu/drm/scheduler/sched_main.c   |  3 +++
 include/drm/gpu_scheduler.h              | 13 ++++++++++++-
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index dc0e60d2c14b..c5f688362a34 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -580,11 +580,21 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  * under common lock for the struct drm_sched_entity that was set up for
  * @sched_job in drm_sched_job_init().
  */
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
+int drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
+	struct drm_gpu_scheduler *sched = sched_job->sched;
 	bool first;
 	ktime_t submit_ts;
+	int ret;
+
+	ret = wait_event_interruptible(
+			sched->job_scheduled,
+			atomic_read(&sched->enqueue_credit_count) <=
+			sched->enqueue_credit_limit);
+	if (ret)
+		return ret;
+	atomic_add(sched_job->enqueue_credits, &sched->enqueue_credit_count);
 
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
@@ -609,7 +619,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			spin_unlock(&entity->lock);
 
 			DRM_ERROR("Trying to push to a killed entity\n");
-			return;
+			return -EINVAL;
 		}
 
 		rq = entity->rq;
@@ -626,5 +636,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		drm_sched_wakeup(sched);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9412bffa8c74..1102cca69cb4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1217,6 +1217,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	trace_drm_run_job(sched_job, entity);
 	fence = sched->ops->run_job(sched_job);
+	atomic_sub(sched_job->enqueue_credits, &sched->enqueue_credit_count);
 	complete_all(&entity->entity_idle);
 	drm_sched_fence_scheduled(s_fence, fence);
 
@@ -1253,6 +1254,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 
 	sched->ops = args->ops;
 	sched->credit_limit = args->credit_limit;
+	sched->enqueue_credit_limit = args->enqueue_credit_limit;
 	sched->name = args->name;
 	sched->timeout = args->timeout;
 	sched->hang_limit = args->hang_limit;
@@ -1308,6 +1310,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->credit_count, 0);
+	atomic_set(&sched->enqueue_credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index da64232c989d..d830ffe083f1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -329,6 +329,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
  * @credits: the number of credits this job contributes to the scheduler
+ * @enqueue_credits: the number of enqueue credits this job contributes
  * @work: Helper to reschedule job kill to different context.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
@@ -366,6 +367,7 @@ struct drm_sched_job {
 
 	enum drm_sched_priority		s_priority;
 	u32				credits;
+	u32				enqueue_credits;
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned int			last_dependency;
 	atomic_t			karma;
@@ -485,6 +487,10 @@ struct drm_sched_backend_ops {
  * @ops: backend operations provided by the driver.
  * @credit_limit: the credit limit of this scheduler
  * @credit_count: the current credit count of this scheduler
+ * @enqueue_credit_limit: the credit limit of jobs pushed to scheduler and not
+ *                        yet run
+ * @enqueue_credit_count: the current crdit count of jobs pushed to scheduler
+ *                        but not yet run
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
@@ -518,6 +524,8 @@ struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
 	u32				credit_limit;
 	atomic_t			credit_count;
+	u32				enqueue_credit_limit;
+	atomic_t			enqueue_credit_count;
 	long				timeout;
 	const char			*name;
 	u32                             num_rqs;
@@ -550,6 +558,8 @@ struct drm_gpu_scheduler {
  * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
  *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
+ * @enqueue_credit_limit: the number of credits that can be enqueued before
+ *                        drm_sched_entity_push_job() blocks
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
@@ -564,6 +574,7 @@ struct drm_sched_init_args {
 	struct workqueue_struct *timeout_wq;
 	u32 num_rqs;
 	u32 credit_limit;
+	u32 enqueue_credit_limit;
 	unsigned int hang_limit;
 	long timeout;
 	atomic_t *score;
@@ -600,7 +611,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.49.0


