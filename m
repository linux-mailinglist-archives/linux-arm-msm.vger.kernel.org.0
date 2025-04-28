Return-Path: <linux-arm-msm+bounces-55965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DCCA9FB55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B48501A86F19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33822163B6;
	Mon, 28 Apr 2025 20:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUKqgGr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4A6215760;
	Mon, 28 Apr 2025 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873850; cv=none; b=YUrY9Qt0YOOge2/JhMymMitlVFtDVirrjICRzJVSqtzCepxtLV1Zf4dFM26EDmRHx8wG1E2KZ4aZAJWiVkcRE359HcLa0D6UWUdAfPFjQzZEHZaDkIs8xakAu6y4Lfd1+TF0LlSw9Z0fv/MqZx9nhcP1S4aYh5rLLXbRVYUfIR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873850; c=relaxed/simple;
	bh=FT9JTAs6DgKZiydKczF4iBLBoAOxxbek2P9ZjW++Yl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhhuQDZpXpxbtAgN9T8yJ3Ls+w2/lhfo+nHkR1G+cYZxjp0qbVCrXNz7I+Nk/m71VV67lTQI0cwrEjvnJTJSsWj5n/7+phw+pBfH9ZSrp6rmMJfBJzEGjqvphRmrQyx83ajYolJkV8Unqyo5eJAqyb+NRIZFHZA3ouZjIGsSQjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUKqgGr/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fb0f619dso59791665ad.1;
        Mon, 28 Apr 2025 13:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873848; x=1746478648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwEmLNSHdQi+isgnaI/SqiO8ObOqDpzEublwqmn1odg=;
        b=AUKqgGr/KtfwYO/UhLckKFb5JC1m4DP1eqput6kYip6+BlcuYmb2UTF1F4axxb+SuI
         MyEnQ5DAEVq9gB1FMYwZ+43ypfNd58rGR56MzOpde7t21ITk9qPWbcpcxlzcroJMJssp
         v8g7HOhzz+pt4JBHUWe2nLd26vW5Ep3wWxdRT9QezDHwAUlaeaNt11v9Z/TEH+3qp2YB
         0BUUVdM+rioOqFBhuvWHwEVj6lxCB9SRmzmjiMRUOjFF2MtrWXhAwByLwttS3bKkAXKC
         0U+S+qNFX+FHmfrHmNL2etGtqxXTirmMEP/qpfJ+t/xV8hIM6iKjRy+q1ezSaIAgxCWi
         RFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873848; x=1746478648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwEmLNSHdQi+isgnaI/SqiO8ObOqDpzEublwqmn1odg=;
        b=XBzoMEFTbyfgAdfapobEULLU1kUro1gb4rJO9cB5124pnRO0HuKgfwYW1C6UgtHCW6
         JGWyKfXY/EyzT/g4osMty6vxmxuXpQnFi8dZl6vx8YxqbifC3dUDd92Wf/HzPAUGlhbl
         fpHfQAmE71T4GY6UjnAtq8MmwcRBXstTSDb4t4+rpFLLoipWO3+uGQh01Qa9vDDUysk3
         D1HWqqqwGBGK/Xz13ChKMy76PBmDuZj2eSMgEYrvCQ2hhFepgPvgN48qfz4Jh9VwuLeX
         cKwjGdU9GAdyArAZ6PSsHLTVpELXjiojKtO8s4hffOPCKLttz0p5sWFWRKUDei0hduu3
         3PCw==
X-Forwarded-Encrypted: i=1; AJvYcCXC77B+bA3rEYdPwSs7ivxo3rhydUpA4e5BD+MFKCaDupIb/E0GMrzvM0cSTkdeDcFhRMvat2A62Sxxn1F0@vger.kernel.org, AJvYcCXRYkyomJj7C5qo/+iaxdmoA+d0TgB2bfHR12r3m+IvfZ5OET/nTjbyBZqu3d+DD/pYNS4Zm9uChx3KWajQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwL9yOsEk5BWQyDON0wzRDhPJmNd3djA5ahx0k/wNyf+nlUFjEc
	fURCoKwLmKOp+pn+RMRl6/WBRjWJP3yx6eSDymgGVFRuzYTr3JuO
X-Gm-Gg: ASbGncvRfuMaI6OnP2mbv7XTWv11f+BOBzRncW5Ds24taFXOpPA8bPDtSIUaUkOTvTN
	BjFDCWdtq6ha2fVE7aDqyZRYNsHA0HgWWz9zuA3PWleEAysI5G2gp7b1aIU7Ps9nStWqHpZRdJV
	LyvV46i9MRhAiiVw/gPec2bC+N04X2e2lnMgusqO6UhjoomiymqTEdTZgl7TqtNqO20MOVPNgFJ
	pO1uhktGgsjsPltxbgpxhNcx/MIlnk5PvSiLkTXx1FkO+SRZoznE4ls6hEyottXvOoBSO/g6Ck1
	1PFlrhyYe1NR41C5N7SHbwvZd6GWWwdFQzlgdXl0wO8AjDaKoYLT6I3tI6cy5Y/tYveSYdvO4Yu
	QZV/rp/dDKheV7EY=
X-Google-Smtp-Source: AGHT+IEX0D4wt/DeWll7YvTsB9ofXjbJo0Cn6MEw9fPXzpTzu2WlM3CTMtk370D/vIhcDxW3kc2unw==
X-Received: by 2002:a17:902:e787:b0:226:3781:379d with SMTP id d9443c01a7336-22de6f13cc9mr7113775ad.33.1745873848120;
        Mon, 28 Apr 2025 13:57:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7715sm88051795ad.145.2025.04.28.13.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:27 -0700 (PDT)
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
Subject: [PATCH v3 18/33] drm/msm: Lazily create context VM
Date: Mon, 28 Apr 2025 13:54:25 -0700
Message-ID: <20250428205619.227835-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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
index 6ef29bc48bb0..6fd981ee6aee 100644
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
@@ -408,7 +426,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, ctx->vm, iova);
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -417,18 +435,19 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
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
index 973473e6da7a..b7c7f6460aa3 100644
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
index d8425e6d7f5a..c15aad288552 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,7 +362,12 @@ struct msm_context {
 	 */
 	int queueid;
 
-	/** @vm: the per-process GPU address-space */
+	/**
+	 * @vm:
+	 *
+	 * The per-process GPU address-space.  Do not access directly, use
+	 * msm_context_vm().
+	 */
 	struct drm_gpuvm *vm;
 
 	/** @kref: the reference count */
@@ -447,6 +452,8 @@ struct msm_context {
 	atomic64_t ctx_mem;
 };
 
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
-- 
2.49.0


