Return-Path: <linux-arm-msm+bounces-58777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A7ABE367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FCEF8A4354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E034281362;
	Tue, 20 May 2025 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmHH20w6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C928003E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768147; cv=none; b=B+bn0ECMO2yMcSH1zRuTjGkSxQcyeTtGDxCjBil3+0Nr4v0GF7Kc4M9xtJgGGOFPXB81B0CY7lkwRFKMHjPy7/k/s3UErseSl0C7qIWDTnWwp99RVf+3klmR3V98VG/PVJjXz0T3fVdX9gn5/YMe9okiuWTAs45u0zeIqd2QDmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768147; c=relaxed/simple;
	bh=gk8DwE6MH3TUftDA43LAG4YX9fts1PWBfmK+nfds2g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6zCVhFQ4q6N5Wg55TaCpo4nPli63LoIKHqR9r6RTlOeMeg7myzajxq5+S7nEW1DkERO5LFX/MeIWyNNFC2XkW9UTqnFM3Kg/z7aMKfkvUvDVvWEZTZOAOEvpRyTRPitsTH57mIQzshVsNIOSck5J87jrFeSzwMQTpcbZrgm5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmHH20w6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5445cb72dso59874785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768145; x=1748372945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
        b=VmHH20w6OejqgQKGBRruhkpIV/Z+AlPvPZoIrF0hUlCN/XNJvIlMw90sbrk3+z50+r
         TruAsCCBtRQoyz2OCCSmyzb6xhLJo6GJYRQNhPtCn5n1iydM3wvNIfJt2S3A8gmuLZj4
         kQ686x3qbi1ec1Q2KDiyNlFeHTinBEwbJR5hH1mePsfg/St9oUE3tO07qOt8n4VYyleQ
         E0qUqqlNFcc1WMhZuf/nYXfHCPqUc+izj7Q6aLOmO0UKzQ0F3XN+1rZbheRt3LkVeB1I
         lgPPkUVzw2QmnwNhEHGLtxunu+E4QchdqUCMxtel2NJ0vGmmiie3DOl6gHS4hIwVEp+t
         0ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768145; x=1748372945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
        b=MJFD8uADQt+1xd8Fju9O4o2ZMtJwmLiKjqg0yHI5JaFPjvUa1x+HyW8t39RRKntx7m
         ppXLsuFgpisZ0rJNDRnNO4U2z8bnJ03DzivO/Y7DPhggoOPlrsHqHQQta65a6M18Vgav
         y1kw7aV36WbiITJ1QsYNsEba4ENBAN6mqx4zd5pI3IdoEknwNO1+fX5wbKrIXYUMGl4k
         L9n58b59G79zxtCkZikXB3NOOUKa/zjeUYYD/6T9tldh9lrpbXEYqQlZl/6H6hL7PTmP
         01Pjr5dSHxiJB/8r2eJ7Z1hKbqe5o+oy9XMnP5744z5clYQkH+ufFM+lCWQV5j1DZV33
         zRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqv3xaFlbRdYYEigJ9Jd35SSaBaZOQpteXTENsd+M+FyU4nfB4Uj/1SYCj12JqD8c7HaQJxvYADGOXyVzX@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPMwC9ewUYFSTHlEkMugLGhDc8GsdkRMTrmkKs7IZpAj8AxZy
	4n9MO7Fe/YFuCiJ4I8Meb/dQgMlL4E2/nhnoi8Dtd3K7p1akC1mq59hI
X-Gm-Gg: ASbGncuHkZDgCYg/NyfxVJ2sBkkz8fTOYHPNNEc3q4brA8tTek+adY05PfhQPeCX8/G
	Re8+ZiQ+ZL3gPvoD/qkONpK1Tr0S/4TMVJ84fG1Av/Ihea7np9rZaKayogpxwcubHRC3YUgXT/H
	R3YVw9VUeIcvIMDMgkCDI/4++XMtj0ROMpjsP2RcblsiaV43e0JACEey193TyeY7gEkSj2JHvzj
	IqZDlUiLewBpIa4jrlOyJTmg5jh7bzbi//qiOAYoEDY37zUc9DgXZFMF7GWBQi9aAlXgjoJtL5n
	VkiFy2Mz+wiLdRH8hMgoTyjtH5tNGIJjnAGnejNuXwL8ogeuCTHmPFxGsV5d1MJCHStZzu41BU7
	YMsCNeuZcfA5DrvBej7DikonK2eMfLg==
X-Google-Smtp-Source: AGHT+IGTEuOT5AKSY9QNH3BI4uSkpEqMzwIX5HeR3aoY35A9UU3EKtm3GcLNIXZ3fsDigIbw6flk4w==
X-Received: by 2002:a05:622a:2c9:b0:474:fcf8:8f0e with SMTP id d75a77b69052e-494ae3736d5mr107613701cf.8.1747768144604;
        Tue, 20 May 2025 12:09:04 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:04 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:57 -0400
Subject: [PATCH v8 4/7] drm/msm: Don't use a worker to capture fault
 devcoredump
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-4-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=6008;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=gk8DwE6MH3TUftDA43LAG4YX9fts1PWBfmK+nfds2g0=;
 b=B32zCFW6SjtAi/CSZwadfMTfzVtd5ahW7RYfl/ZOrAxW3x+ocg/HybRu5g3ZhTJm3x1MT8Sqx
 WcJt0qdXT4yBHPiW79Lj1VsiIe6m5qQgOqfSuL7uWBBsyLhmx41dhDo
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


