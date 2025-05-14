Return-Path: <linux-arm-msm+bounces-57921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA2AB73D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BFB2177BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0338728EA47;
	Wed, 14 May 2025 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzDThVd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1CD28E565;
	Wed, 14 May 2025 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245424; cv=none; b=VKih0FbmkdP5XelK6Ky9sTQFXzfKioIry+EEDLu0UDRU9sq9hA/vDud+goj1KIYSUlDxDMdX0LmBJK31oxCJtJ7aItJISpYUtADlQc3yga3aJsB5DMks5pU9qipSmVa7geuViKaGYI3K6rSfMh6/UGo//e2q2AGC/x2hQg1EAZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245424; c=relaxed/simple;
	bh=6df3Fw3KMcVPbt6r7zSxQpAh//MdOcwZIhhM69w23Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6wDu/0m2mdh0fqnNXMwyO2gx5lhWdvxIPZS42flKGx0BV4DNK1W+tRyjS5djnl9FfvNsMT8LZdHNZwWcv0nDtwLM2nsF8H0xypJRl/xIvHmax63I1OlNnBqeG6zo7U46idb8ZYQrLGQ3cZoUdvZA8hM2GCAjh9GgIhRZriGtyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzDThVd+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e6a088e16so1128375ad.1;
        Wed, 14 May 2025 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245422; x=1747850222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIa4zkbiYwCq5hkomf6j7k76ux2vFMyL8rafeOKMG0E=;
        b=GzDThVd+mR8ZSoFIjxSUuD1Zy/X9Wzyz0bi84N/eoaQBuX2+V8GG33acHquoJtT+3F
         sUX2nYuEMPRY9EtvLozLAiKIPgaiO6bGHhX6sAvV66PhzORCZuM8RvGaDGfnXiz21MBt
         vTyVsBFbaxmPrcAcj0+0vIKPuD2oM0NrZKa/QPbjt8MBD8VlEH7CcGdrMYfe2C5prIbj
         khmjCBs/M/Ew90q2Qz+5eBEyvpbKhvMFyb+remJ7jvGIALGzGM1QJDD3ebD8gmeMaSrm
         reS0hzMg7nVJ2Y+nN3UIw2T7TWR+OoGJaflocJ72RsClDj72fqUwdA/ZynVFZYDJXN6M
         fAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245422; x=1747850222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIa4zkbiYwCq5hkomf6j7k76ux2vFMyL8rafeOKMG0E=;
        b=YO2I/uSopMYk86Vnjp2GCkXlZLAPbnxMNIzirvlxfNivt5BUh0FPkfebXQnP+p84dp
         xSXm7jDy9Y2jzi/jsagxdewzdjoIDSh46ZKCqSJxao2wE3xH/j10y8Fa9iRi3sZkE0Eh
         09532ykn6+5Wn8Ry4QtFOspNZqurziYAsij/aJ6AtoAfzFk0fcDcsFxObflYNDImmH7v
         qO9GLgmBZXiegc+wV71zpSW4prTX5NWej+hFpTft/vDW6Euoo1y6fRn9TeqbdWRRn/aa
         bDHIaHXCMsBZB1iFCDeKv7Bgwa7bkxwdAkI5wBrzBkr3O1O8InVqvq7zh+Se9Zatu1ZF
         Yeqw==
X-Forwarded-Encrypted: i=1; AJvYcCU/ocnewVyCs2ABUfr0wFHRyvbV7toWrXv+fx8LVNIeW8VMEYCriX0Hynh/JhGt2IGK7sT8mD43bwGvFXnh@vger.kernel.org, AJvYcCVZLc/a/7mPBxAVti/058+YQVqYPTDyoktqDomHx+SkizHvrDHNtCxy1Mp5OShDNeFxvsTwXW/WX9q+vQmD@vger.kernel.org
X-Gm-Message-State: AOJu0Yync+ZhOubYqchF2tr5Eo8lmGwAfqe/9O3kGgdaU1QBGGoF224M
	esj9J5o5fiTVCJsVmRZ6UVuPfdy4wRnu44qis12D43CRP7EjIVRK
X-Gm-Gg: ASbGncvNvaiWz6yX8T/eCuyN4UwyN2EBHOMaQuXG+L39hSYRBbKsr/E6Qr3XCDQSXEd
	MpRYq/B8KUQd4n/JSuZkCqwRq6L0BJohLzghGBImYnSi2ehliu1X8bW7oHyWEv65qxQcQN3QC1K
	Du/dqstBpwgW/JJQbnIsJCMmSfvDjphz+oC1in77iFxhufG7D1btlUcY94VMphgSVVlEdDJOG9O
	IFy2aiBPZAN28VPKgxEEmlm1Ge4koRaLZteMYe/8tUOt2+sgL5oKe3Cpa6aM+/3BTXl+xgNlR/3
	/q8vnGpKsgv9kEr5kP1buh1plMqj0AsLw9SwfUrcOzkKd1IDWanWLm6ndNVrkH93TzwGisGkP6X
	R2wB58D6GR3Eb/1feylwM6ie5hg==
X-Google-Smtp-Source: AGHT+IFTqd75mHTZ8Dry9U/KyddBYh5izM1B5rLRjSWYJfgDK7iCYETSlVU1v9sItOhcedAtz+wkkw==
X-Received: by 2002:a17:902:f707:b0:21a:7e04:7021 with SMTP id d9443c01a7336-231b39cc302mr5920265ad.24.1747245422334;
        Wed, 14 May 2025 10:57:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271a9dsm102094535ad.113.2025.05.14.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 21/40] drm/msm: Lazily create context VM
Date: Wed, 14 May 2025 10:53:35 -0700
Message-ID: <20250514175527.42488-22-robdclark@gmail.com>
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

In the next commit, a way for userspace to opt-in to userspace managed
VM is added.  For this to work, we need to defer creation of the VM
until it is needed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++-----
 drivers/gpu/drm/msm/msm_drv.c           | 29 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++-
 5 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7f7dcdd1f97d..bfc11f6bda97 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -112,6 +112,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
 	struct msm_context *ctx = submit->queue->ctx;
+	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
@@ -120,7 +121,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
-	if (msm_iommu_pagetable_params(to_msm_vm(ctx->vm)->mmu, &ttbr, &asid))
+	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index cb4ee277721d..7e50de5c5110 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -373,6 +373,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct drm_device *drm = gpu->dev;
+	/* Note ctx can be NULL when called from rd_open(): */
+	struct drm_gpuvm *vm = ctx ? msm_context_vm(drm, ctx) : NULL;
 
 	/* No pointer params yet */
 	if (*len != 0)
@@ -418,8 +420,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = 0;
 		return 0;
 	case MSM_PARAM_FAULTS:
-		if (ctx->vm)
-			*value = gpu->global_faults + to_msm_vm(ctx->vm)->faults;
+		if (vm)
+			*value = gpu->global_faults + to_msm_vm(vm)->faults;
 		else
 			*value = gpu->global_faults;
 		return 0;
@@ -427,14 +429,14 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = gpu->suspend_count;
 		return 0;
 	case MSM_PARAM_VA_START:
-		if (ctx->vm == gpu->vm)
+		if (vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->mm_start;
+		*value = vm->mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
-		if (ctx->vm == gpu->vm)
+		if (vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->mm_range;
+		*value = vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5909720be48d..ac8a5b072afe 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -214,10 +214,29 @@ static void load_gpu(struct drm_device *dev)
 	mutex_unlock(&init_lock);
 }
 
+/**
+ * msm_context_vm - lazily create the context's VM
+ *
+ * @dev: the drm device
+ * @ctx: the context
+ *
+ * The VM is lazily created, so that userspace has a chance to opt-in to having
+ * a userspace managed VM before the VM is created.
+ *
+ * Note that this does not return a reference to the VM.  Once the VM is created,
+ * it exists for the lifetime of the context.
+ */
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	if (!ctx->vm)
+		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
+	return ctx->vm;
+}
+
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_context *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -230,7 +249,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	ctx->seqno = atomic_inc_return(&ident);
@@ -409,7 +427,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, ctx->vm, iova);
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -418,18 +436,19 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 
 	if (!priv->gpu)
 		return -EINVAL;
 
 	/* Only supported if per-process address space is supported: */
-	if (priv->gpu->vm == ctx->vm)
+	if (priv->gpu->vm == vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
 
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
-	return msm_gem_set_iova(obj, ctx->vm, iova);
+	return msm_gem_set_iova(obj, vm, iova);
 }
 
 static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c4569e7b5a02..7a9bd20363dd 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -63,7 +63,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
-	submit->vm = queue->ctx->vm;
+	submit->vm = msm_context_vm(dev, queue->ctx);
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bfaec80e5f2d..d1530de96315 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -370,7 +370,12 @@ struct msm_context {
 	 */
 	bool closed;
 
-	/** @vm: the per-process GPU address-space */
+	/**
+	 * @vm:
+	 *
+	 * The per-process GPU address-space.  Do not access directly, use
+	 * msm_context_vm().
+	 */
 	struct drm_gpuvm *vm;
 
 	/** @kref: the reference count */
@@ -455,6 +460,8 @@ struct msm_context {
 	atomic64_t ctx_mem;
 };
 
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
-- 
2.49.0


