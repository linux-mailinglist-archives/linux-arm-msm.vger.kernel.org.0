Return-Path: <linux-arm-msm+bounces-58532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10556ABC6B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C11797B1B96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FCE28B7FB;
	Mon, 19 May 2025 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH+mZaPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6164528B7D3;
	Mon, 19 May 2025 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677506; cv=none; b=LjeHCOVyWxgS4yhqTQCl3f7GEfBBhj/l7OSSjIMiSBoyeS6MFAr3CObJwqycVrHltl/KonEUIlgeC+Y6bMu/j3uWqtBK0pXQLRoB9WcT6szEAeJWHA3H80R5IveBVCqrk9EisaeHABv8hFLBk9YVSYDHCwLK1kcdOtqdroyZE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677506; c=relaxed/simple;
	bh=kMxwx2gjYDrvMLl0c/kJ8NnU0wTbC67hrTtpx/XVn4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/5trghGWrMaU8fCkEEB9xOG16gbPwznClo0IVPJ4CKCfmXhwcB+nY1oR1JIo9mY2sco2GvFAH3c40OVHEf4QqHQWsb5SK0UAWmARpkdIVwYne/cEj8Htg7p+l+1yd1n2xKGFP/Bo7hP+TgzMNdI+s54Yb+WLNIHUgGI5HJ+Vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH+mZaPX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b1fd59851baso2885587a12.0;
        Mon, 19 May 2025 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677503; x=1748282303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiPABw7s71Q3Gj4b/BfPSrooDItesEXFLbstK5lSkBY=;
        b=dH+mZaPXL/gcw+dIzHW1xC00NK777LTRmLvvp07DysNv1fHKW0KRckgIv9ysLIXcJb
         rjcrfx9LzDETnKhcZ7ycDVxqrmz+ZVO7gbaPdTL0i2fPLkwGOmbEaX6u+S0+l9jiBNUd
         Rkik4/eYCJeVx4Odm0bVCSIIXwdJjivx/1+Kq27DPOsvUdcektCc0wAF8CbgzaT0prgt
         2vSB1QVSk7S19DGnFMjkZ0Rp67orFKQv1S8X8k4HITHpxrIJHw8NPVBiIec6jOQ5Oanc
         +mEgx7JoUdBebEFtAjONVMDAfBnnn2ie98I+5e8VeMzagBvfjEz4JM8BwddNXoeDGpMv
         Cf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677503; x=1748282303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiPABw7s71Q3Gj4b/BfPSrooDItesEXFLbstK5lSkBY=;
        b=HyWVPWl7ad+K1d6Z+QUTntuhh88AcJtZZ/rqrWHkw46Z6Ubd3Cyv1aJvk2WZWLwcbi
         sDWaz0GStIxwV1ZnYObXnoUfkOlRbdfQ7Sgb/bIDWe+i4CRRaymhyrWNDCWKqD5YiwyL
         0AVkrOnsM2TM/XcbFPuTzfIKP3aizw06Qkr7oSdd8mIO7cTJSHwEGmT5GYYMTWtJ9r36
         JBXM1i0qeHhjGvcEyXr/ict5GrOLpzv2nA4vjcaB4ULI/+zF/n4aYRsM17NNCJSynwKU
         7/h/QsJcwCedWOMzDT498zJAEeSR6Sk2dMIVGvCU+FmqAo0nNSj+MksDHBD7Y58Gbk3b
         zi7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhxwp/waRzz/pRVZK2zfkA4SPPaNSlYQxV/aIimrs+UcSi3XSic2Ugq5JpVNScMznz6+j6acs7SZGPtJLy@vger.kernel.org, AJvYcCXQ9J6lMT2JhOegqTQAc+9ODODKR7yMSCAVfBc2CIkQlC7yNduEEoxts17t59JR95x9BKyso4pUWi9qqEA7@vger.kernel.org
X-Gm-Message-State: AOJu0YwakjMziiSdNfd7EAatMqNP9rD2csdtE2i/0uUCvkg96HI9e3YN
	Xreqv6uhkAlxS0d4XyV4mZeDKoffBgaXmfkrz/7K2ukJ7aLRK9vs3CAO
X-Gm-Gg: ASbGnctz6eWppesK3dHMVJNhjRiuC//rStQs8K5mmtbbjkPVxzS21Xdhk04kyXj/WaC
	L/1V0/b0+A31IFQxGMqsP2EOa3/BOHY7d2hYUyx4RdVOoIBoOd5lgwsfnLTUvJf+1Y6Gp9MMzmf
	PNy3EfuaFTb50O6KsqQtSlJbbb6qyqabSl25YzaVHDEL86PfFD0qP5HL2IqtLkSkIQy0idBNBKa
	vTIZLsKpUDh54snIzP3Cu4kNWidMDgPfjE1O66gDJa5Av3wLC+SsayotkAiGNxqr4z5p+VPigEh
	3bjGed+GfQer4VKgL6UpROSv5NOkXgz5llv9tNswl+mQq3ZZ2kr9E2TPQi40u9muMO8yJJgeIxD
	ThcHMIRdSunNKH/G3AToH2f5dUg==
X-Google-Smtp-Source: AGHT+IGIfdGP76/d1hQeN1WKrdW7mwDTsv1d5jFl6DDl86WgSp19cSzTHpqPczKqp3xN1i73FsonhQ==
X-Received: by 2002:a17:903:b8f:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-231de37f1d8mr164935675ad.50.1747677503513;
        Mon, 19 May 2025 10:58:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebba01sm62541715ad.208.2025.05.19.10.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:22 -0700 (PDT)
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
Subject: [PATCH v5 21/40] drm/msm: Lazily create context VM
Date: Mon, 19 May 2025 10:57:18 -0700
Message-ID: <20250519175755.13037-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index c43a443661e4..0d7c2a2eeb8f 100644
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
index e24f627daf37..b70ed4bc0e0d 100644
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


