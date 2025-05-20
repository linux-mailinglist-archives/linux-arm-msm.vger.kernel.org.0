Return-Path: <linux-arm-msm+bounces-58761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4933ABE20D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 438EA7B3D19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363412594BD;
	Tue, 20 May 2025 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KilHrOv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720462441B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763108; cv=none; b=hdZ9tGXt09U2PqrYWIUFeY5B8T+qhIakAi/0f1ZY4gVaFRT0eTfDJ0zZB/7aPJwIfxCYU9vildEmVzwzKqpewE+gF7bCQJJVxnqBcy4m32vqMwfJCmEzsj2pmeUzjlKcFL4eeJM2wED5qfVlIoDiOwzk3OgIBA4OIhJJY7netww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763108; c=relaxed/simple;
	bh=gk8DwE6MH3TUftDA43LAG4YX9fts1PWBfmK+nfds2g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hjuTwpovk8U9CMvZGhQl7NNaq6iKJZnqF/WskB78uXiZ1TAhKnMap9rSvO2d2xeGARJz0hQ2X267dCEGvdDx/5Mn0ncdYFtFn910gxwy9ayvUEzLZB+jYk6xcaEaychOsNCeHtckBrhAk5GhZFCurNU6Oc8Cq6w3rHpeQvLWjO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KilHrOv3; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f8b0f7c42dso9874406d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763105; x=1748367905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
        b=KilHrOv3w7uT/+Z4WuNHWgJe4PLA0ZDjaTwx8uXk9YMjnNJR5nMxlOx54o7tCYVjhO
         XBH3bi4kgP0/OvGt5a5JRUeI6avYTNo5T1J4lGP783eE/hoZkFKHbFbDCF4PZj83rAsL
         VoN0z5FcbCqfQBmLHHYdLFctoGJdB9HwYGF3djpVNVOGw0ZDeSQIBKKKolP/rjl7tyTB
         q1zQj5anqQN3H55DTKAC/kF9eTcEoDFqKqpJkoElvuN4dlMknlzvRTNy/0BqaGxRFX9F
         bYjc/92kW3b3/cXtm3eF1lXDM+hU3pM7Op6IqExHW3btHlYKPwzFDvaeEziIZ60QN3BA
         E/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763105; x=1748367905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
        b=e2QTNPWh5x+YaG3C8oh1DkhagAoXrpqBfSINYqtk5dFZlaMfVI09h8G+nOirigqkB5
         9GtP6t0C57OmO9GDc3rOXDQ9qxcVSTZS9mMY0eP68zysqI3sOFm0bl0TFj++Y/fBYbip
         qxF/jMOeH7yiyoMlGPNwrXdzIE9KaIOIge/Lt/abzgkmDNJrjnLYXBveRUqIKwGegIOf
         Slgyt9+vfnerxNMcqdWjtIc7Ozf+Zs67xtUCqaZjt5EsYCFBGJ6YlOAFG793azxLsQ5F
         9K7l+mvmqn397GKr/n71/b6papPGsLEyRoZjm7e4pQBjcCQ6OVhHzVSwyZMcdhPF9/Jy
         9HCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF3XVnmumxNoZnZmw9tQBQnn6BlzvGWQKSjwpJwnDk3PpDe+UsRksOF3m1TUjyLoSoUOd8sc3SacRMRFVd@vger.kernel.org
X-Gm-Message-State: AOJu0YyottC0s2hcih+OMwyPdsHrvmn/A7bHvtxIK3oKAvCy19ZDx5UX
	Ql/WGVY59WEe5bJg17eiahswlskJtuJ3Y46yMBlTU2FoRBpw67QQuAIj8855D1QC
X-Gm-Gg: ASbGnctC997rWfeAjpIMAZ7RW2XQuYY509YNq4XoNEY3aoSC+iP/CzzsjMOlI3TUnGV
	p486D+hgS/5kqlLHRy+PXzjBqXOH/+OmzCfHf2ZgxYyCtWBLDhEm3PP+7soSFSQzNAj5qGZThzs
	V6o+1TSt6o8MUv3zFkL+d81DnQJAC6a6pApV/ieHawmI2+qoHDrnkBjt2QnxakoTOktWgD/ZLKK
	M10gqIb4LT/SNqtfYc3VZvGsIrJvUz2TNll3CyROZfPA9qGKBVI9+8VT2ph5RNvJ9R4p5wXrlOy
	KgL5IlRATDIDLvyLQCscPAWZc1rxFV4CbYkDSAr+Yer3badQ/iQx8pHnFJuk0Wqig+piSLShBnA
	0nowp5Pi9pl9azN8Vxxg=
X-Google-Smtp-Source: AGHT+IEyEUyH2vl1JTCDZI6jpmWqWoPCvlggrK4ph7zQMR3tU98Bv33QLELDeAy8ZRJ0aZSyr67kCw==
X-Received: by 2002:a05:6214:1cce:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6f8b0903d96mr87113196d6.6.1747763104581;
        Tue, 20 May 2025 10:45:04 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:04 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:53 -0400
Subject: [PATCH v7 4/7] drm/msm: Don't use a worker to capture fault
 devcoredump
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-4-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=6008;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=gk8DwE6MH3TUftDA43LAG4YX9fts1PWBfmK+nfds2g0=;
 b=Xbbc65pCLYyCTay/ace0inHb9u2gnbjiBQZT8I8BJ7JLe66r3VHZSlBkbYGTPfcn0j9dxIYsI
 MFFMeqbGxduCj1nFzecw6hgKb69GY0r6oorsy/XMU2zdZFC//qYGoFg
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Now that we use a threaded IRQ, it should be safe to do this in the
fault handler.

We can also remove fault_info from struct msm_gpu and just pass it
directly.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++++--------------
 drivers/gpu/drm/msm/msm_gpu.c           | 20 +++++++++-----------
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++------
 3 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 26db1f4b5fb90930bdbd2f17682bf47e35870936..4a6dc29ff7071940e440297f5fbbe4e2d06c3ffd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -257,14 +257,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	const char *type = "UNKNOWN";
 	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
 
-	/*
-	 * If we aren't going to be resuming later from fault_worker, then do
-	 * it now.
-	 */
-	if (!do_devcoredump) {
-		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
-	}
-
 	/*
 	 * Print a default message if we couldn't get the data from the
 	 * adreno-smmu-priv
@@ -291,16 +283,18 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
 
 	if (do_devcoredump) {
+		struct msm_gpu_fault_info fault_info = {};
+
 		/* Turn off the hangcheck timer to keep it from bothering us */
 		timer_delete(&gpu->hangcheck_timer);
 
-		gpu->fault_info.ttbr0 = info->ttbr0;
-		gpu->fault_info.iova  = iova;
-		gpu->fault_info.flags = flags;
-		gpu->fault_info.type  = type;
-		gpu->fault_info.block = block;
+		fault_info.ttbr0 = info->ttbr0;
+		fault_info.iova  = iova;
+		fault_info.flags = flags;
+		fault_info.type  = type;
+		fault_info.block = block;
 
-		kthread_queue_work(gpu->worker, &gpu->fault_work);
+		msm_gpu_fault_crashstate_capture(gpu, &fault_info);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c380d9d9f5af10b90ef733b05f5b0295c0445f38..457f019d507e954daeb609c313d37ee64fd492f9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -257,7 +257,8 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 }
 
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
+		char *comm, char *cmd)
 {
 	struct msm_gpu_state *state;
 
@@ -276,7 +277,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Fill in the additional crash state information */
 	state->comm = kstrdup(comm, GFP_KERNEL);
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
-	state->fault_info = gpu->fault_info;
+	if (fault_info)
+		state->fault_info = *fault_info;
 
 	if (submit) {
 		int i;
@@ -308,7 +310,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 }
 #else
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
+		char *comm, char *cmd)
 {
 }
 #endif
@@ -405,7 +408,7 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
 	kfree(cmd);
 	kfree(comm);
@@ -459,9 +462,8 @@ static void recover_worker(struct kthread_work *work)
 	msm_gpu_retire(gpu);
 }
 
-static void fault_worker(struct kthread_work *work)
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info)
 {
-	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
@@ -484,16 +486,13 @@ static void fault_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
 	kfree(cmd);
 	kfree(comm);
 
 resume_smmu:
-	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
-	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
-
 	mutex_unlock(&gpu->lock);
 }
 
@@ -882,7 +881,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	init_waitqueue_head(&gpu->retire_event);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
-	kthread_init_work(&gpu->fault_work, fault_worker);
 
 	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579c08f7b98d4461a75757d1093734a..bed0692f5adb30e50d0448640a329158d1ffe5e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -253,12 +253,6 @@ struct msm_gpu {
 #define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
 	struct timer_list hangcheck_timer;
 
-	/* Fault info for most recent iova fault: */
-	struct msm_gpu_fault_info fault_info;
-
-	/* work for handling GPU ioval faults: */
-	struct kthread_work fault_work;
-
 	/* work for handling GPU recovery: */
 	struct kthread_work recover_work;
 
@@ -705,6 +699,8 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->lock);
 }
 
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
+
 /*
  * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can
  * support expanded privileges

-- 
2.47.1


