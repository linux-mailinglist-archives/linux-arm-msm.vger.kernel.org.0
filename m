Return-Path: <linux-arm-msm+bounces-56551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D95AA7841
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F9547AAD00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C418626B099;
	Fri,  2 May 2025 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0peS3C0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E6826AABD;
	Fri,  2 May 2025 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205702; cv=none; b=aZZYLhUUpMo0Zx3Ofi+hQ5PcwHvYi+HoAMeKniZtkHIzRJYaE30FGwk7Bb1eYkwLPrrjLLUG/e/6bbAlqKK/eYh8Iqnp7EvfouTrvpzc8LVn22qZu5RUdHGckWa70OrYThWAaV4zn1aAh/FBSHM5JVEGDOk5uz6m93H/hP0UL0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205702; c=relaxed/simple;
	bh=Nxo1WinqzlZq3q7HTkm517ZJax9qyr42V2QMTWY3Jf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6kEOXCYsswo5yKE0hz9WPxNd6ztyXNKVtmkrWQw97+T9MgqJ4+haLSfQkj+9Pc7l5ldcUmuaM0PTD+IG26pt7JRTSmpPeic6u5cfVkqFXo9op1+zTtiAOcze3jjfCMwPh7uZUNzHbu8KH34o2sgpo2QD2uo/xXSPE1JMPbvikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0peS3C0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74019695377so2070659b3a.3;
        Fri, 02 May 2025 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205700; x=1746810500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7+FUVrnHu0sEAN1rbsWC/vG7L17cvvq+QOcbZKNWMI=;
        b=X0peS3C02MU88fkcgINMMzIDDlUsiQ/drfnXtgWouzSPXonBeUNShRhU8GXuYZzlkx
         /ufKSC53oYPa9YNbf5+iYKX1/iUk7O/PtJ5Cq/61TGjaFYnptjbuvj+/hRs47AgMjPvU
         kP/9jsrl1vwpG3AP5Pkq6zOc9hUlCLtpEUmkGha2TfR3PZHQ3eKQx9bSeammdSdtcyTo
         8EH/cbbHXi0MUtb5HKur6egLmunIUB88xsukT1MEu35EN6LhjQMtc4vxEo1v1tfSNUPf
         3kZgJdb59MKXyYARYmWVIDmcBRPN+QlftjayWzDA7JeHQNoWNYlcdOED797Oi89IHdCq
         E0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205700; x=1746810500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7+FUVrnHu0sEAN1rbsWC/vG7L17cvvq+QOcbZKNWMI=;
        b=qiaS3Q+fRdd+GT2bFE4d37PjLI7r61nL3h3gs3Xwk4zSpLl544c8Ox1lPyuQkaMOCa
         Rfc1wjVNYuOhi8RW8vmfPcsKs2M5DGHkNTdIb4mhcCeydfSTuO39ZYjDRWdv+XUjkjFQ
         RFmbHTosBkFfVtZA3TT1ndg/+tb9UKB49YdCKWl7y/w3RLlOmcPA7didyCCvcpTQN9hq
         Y1HDtlrRior5i4WsOH2loBrJthTOHEOXhEFkwVgKuo5XXUcnPFQ2wLGlSnIwf1nSpUzp
         p8jrmhFrNcYc2K8BMjVyY0PKQyq8wfrZnrUFr7q4e4yS1ZyNdGI2Rin92JlJHDIPl5t8
         Oytg==
X-Forwarded-Encrypted: i=1; AJvYcCW892Vgx2XEsl5rmumKNAcFh7wyGm4QZwX3Oy3v/aFEScB9i+zW2wfq5jFaEhpz/kaxsn6nSM1UHOCYOOOg@vger.kernel.org, AJvYcCXmfuIBDxAafGwo1JU+LNZLGh2tfub9Mq727vhsouTP/bce4VR1+b9dnITjoT3FUXmDInZvCQ9CqlOhAH/F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0fgYeC9jDrbJZyjGzJasJd2B6aXCTxjuNqtIbrq/A5oqr9E7T
	I9rKagpF1Plt9DGNRS5DiBlDp/fqaKCQShb+k1Z0d7cPqX+YePKPtIiClw==
X-Gm-Gg: ASbGncvkpmL5cM941twO6k+XrsSR2XgA80wj0/YK+OkwCRm998q8mqSvR87X7V2b0OK
	oRC/NPQq7/M7ENpZbJU4K1sseTMKN2hluf6wR5I/GBtE/RH4CyN4JSSwDgouaW/W7cR5sYkr5ZX
	0DjsL2guZ92WqrKNYyseQa45P2nRVyUERJUXpxVscmcaZJ9SIi8Hux7kpKqfAB/pE7MS/uqkpwD
	qPnmsAiJR/MC6g0LFPWu2cqx3bPN2xR6aZc+e+FXBacrB2Zqkr9M24loLb2UDNaQ+SizmvQWgBf
	Ur8Mwy5AmxAYbPGH9oOcZ+lr+s5G85j1xLQgvGEePuWKZS/5UKrQPDJ+aqjSKhOE66a6x3jAzY6
	5XsdUGWdEITmNJQlcHkYZYy1Obg==
X-Google-Smtp-Source: AGHT+IEYEETRDjENVgrPKbFbL7u3qoXwlhhSUU9UGgATFcWTEn2ppqUlJlu8QFVm9f+ZmUaia/0n5A==
X-Received: by 2002:a05:6a20:12d3:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-20cde85d1demr5597370637.13.1746205700068;
        Fri, 02 May 2025 10:08:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbe46sm1834926b3a.46.2025.05.02.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/33] drm/msm: Convert vm locking
Date: Fri,  2 May 2025 09:56:39 -0700
Message-ID: <20250502165831.44850-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Convert to using the gpuvm's r_obj for serializing access to the VM.
This way we can use the drm_exec helper for dealing with deadlock
detection and backoff.

This will let us deal with upcoming locking order conflicts with the
VM_BIND implmentation (ie. in some scenarious we need to acquire the obj
lock first, for ex. to iterate all the VMs an obj is bound in, and in
other scenarious we need to acquire the VM lock first).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 35 ++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gem.h          | 37 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c   |  9 ++++++-
 drivers/gpu/drm/msm/msm_gem_vma.c      | 27 ++++++++-----------
 5 files changed, 78 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 523e6dd3ad06..f767452f168d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -52,6 +52,7 @@ static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bo
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
 
@@ -70,9 +71,9 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
 			      msecs_to_jiffies(1000));
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, &ctx->vm->base, true);
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 }
 
 /*
@@ -538,11 +539,12 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
+	struct drm_exec exec;
 	int ret;
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, vm);
 	ret = get_and_pin_iova_range_locked(obj, vm, iova, range_start, range_end);
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	return ret;
 }
@@ -562,16 +564,17 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm, uint64_t *iova)
 {
 	struct msm_gem_vma *vma;
+	struct drm_exec exec;
 	int ret = 0;
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, vm);
 	vma = get_vma_locked(obj, vm, 0, U64_MAX);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
 		*iova = vma->base.va.addr;
 	}
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	return ret;
 }
@@ -600,9 +603,10 @@ static int clear_iova(struct drm_gem_object *obj,
 int msm_gem_set_iova(struct drm_gem_object *obj,
 		     struct msm_gem_vm *vm, uint64_t iova)
 {
+	struct drm_exec exec;
 	int ret = 0;
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, vm);
 	if (!iova) {
 		ret = clear_iova(obj, vm);
 	} else {
@@ -615,7 +619,7 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 			ret = -EBUSY;
 		}
 	}
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	return ret;
 }
@@ -1007,12 +1011,27 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_exec exec;
 
 	mutex_lock(&priv->obj_lock);
 	list_del(&msm_obj->node);
 	mutex_unlock(&priv->obj_lock);
 
+	/*
+	 * We need to lock any VMs the object is still attached to, but not
+	 * the object itself (see explaination in msm_gem_assert_locked()),
+	 * so just open-code this special case:
+	 */
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked (&exec) {
+		struct drm_gpuvm_bo *vm_bo;
+		drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(vm_bo->vm));
+			drm_exec_retry_on_contention(&exec);
+		}
+	}
 	put_iova_spaces(obj, NULL, true);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f7f7e7910754..36a846e9b943 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -62,12 +62,6 @@ struct msm_gem_vm {
 	 */
 	struct drm_mm mm;
 
-	/** @mm_lock: protects @mm node allocation/removal */
-	struct spinlock mm_lock;
-
-	/** @vm_lock: protects gpuvm insert/remove/traverse */
-	struct mutex vm_lock;
-
 	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
 
@@ -246,6 +240,37 @@ msm_gem_unlock(struct drm_gem_object *obj)
 	dma_resv_unlock(obj->resv);
 }
 
+/**
+ * msm_gem_lock_vm_and_obj() - Helper to lock an obj + VM
+ * @exec: the exec context helper which will be initalized
+ * @obj: the GEM object to lock
+ * @vm: the VM to lock
+ *
+ * Operations which modify a VM frequently need to lock both the VM and
+ * the object being mapped/unmapped/etc.  This helper uses drm_exec to
+ * acquire both locks, dealing with potential deadlock/backoff scenarios
+ * which arise when multiple locks are involved.
+ */
+static inline int
+msm_gem_lock_vm_and_obj(struct drm_exec *exec,
+			struct drm_gem_object *obj,
+			struct msm_gem_vm *vm)
+{
+	int ret = 0;
+
+	drm_exec_init(exec, 0, 2);
+	drm_exec_until_all_locked (exec) {
+		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(&vm->base));
+		if (!ret && (obj->resv != drm_gpuvm_resv(&vm->base)))
+			ret = drm_exec_lock_obj(exec, obj);
+		drm_exec_retry_on_contention(exec);
+		if (GEM_WARN_ON(ret))
+			break;
+	}
+
+	return ret;
+}
+
 static inline void
 msm_gem_assert_locked(struct drm_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 07ca4ddfe4e3..4cd75001aca8 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -123,7 +123,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		stages[i].freed =
 			drm_gem_lru_scan(stages[i].lru, nr,
 					&stages[i].remaining,
-					 stages[i].shrink);
+					stages[i].shrink);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 		remaining += stages[i].remaining;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e8a670566147..71fe43825f2c 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -247,11 +247,18 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
+	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
 	int ret;
 
-	drm_exec_init(&submit->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, submit->nr_bos);
+// TODO need to add vm_bind path which locks vm resv + external objs
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
 	drm_exec_until_all_locked (&submit->exec) {
+		ret = drm_exec_lock_obj(&submit->exec,
+					drm_gpuvm_resv_obj(&submit->vm->base));
+		drm_exec_retry_on_contention(&submit->exec);
+		if (ret)
+			goto error;
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d1621761ef36..e294e7f6e723 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -92,15 +92,13 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 
 	GEM_WARN_ON(vma->mapped);
 
-	spin_lock(&vm->mm_lock);
+	drm_gpuvm_resv_assert_held(&vm->base);
+
 	if (vma->base.va.addr)
 		drm_mm_remove_node(&vma->node);
-	spin_unlock(&vm->mm_lock);
 
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(&vma->base);
 	drm_gpuva_unlink(&vma->base);
-	mutex_unlock(&vm->vm_lock);
 
 	kfree(vma);
 }
@@ -114,16 +112,16 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	struct msm_gem_vma *vma;
 	int ret;
 
+	drm_gpuvm_resv_assert_held(&vm->base);
+
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
 	if (vm->managed) {
-		spin_lock(&vm->mm_lock);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
 						range_start, range_end, 0);
-		spin_unlock(&vm->mm_lock);
 
 		if (ret)
 			goto err_free_vma;
@@ -137,9 +135,7 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
 	vma->mapped = false;
 
-	mutex_lock(&vm->vm_lock);
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
-	mutex_unlock(&vm->vm_lock);
 	if (ret)
 		goto err_free_range;
 
@@ -149,18 +145,14 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		goto err_va_remove;
 	}
 
-	mutex_lock(&vm->vm_lock);
 	drm_gpuvm_bo_extobj_add(vm_bo);
 	drm_gpuva_link(&vma->base, vm_bo);
-	mutex_unlock(&vm->vm_lock);
 	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
 	return vma;
 
 err_va_remove:
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(&vma->base);
-	mutex_unlock(&vm->vm_lock);
 err_free_range:
 	if (vm->managed)
 		drm_mm_remove_node(&vma->node);
@@ -191,7 +183,13 @@ struct msm_gem_vm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed)
 {
-	enum drm_gpuvm_flags flags = managed ? DRM_GPUVM_VA_WEAK_REF : 0;
+	/*
+	 * We mostly want to use DRM_GPUVM_RESV_PROTECTED, except that
+	 * makes drm_gpuvm_bo_evict() a no-op for extobjs (ie. we loose
+	 * tracking that an extobj is evicted) :facepalm:
+	 */
+	enum drm_gpuvm_flags flags =
+		(managed ? DRM_GPUVM_VA_WEAK_REF : 0);
 	struct msm_gem_vm *vm;
 	struct drm_gem_object *dummy_gem;
 	int ret = 0;
@@ -213,9 +211,6 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
 
-	spin_lock_init(&vm->mm_lock);
-	mutex_init(&vm->vm_lock);
-
 	vm->mmu = mmu;
 	vm->managed = managed;
 
-- 
2.49.0


