Return-Path: <linux-arm-msm+bounces-52001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F6A69294
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6858A276A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CA821D3DC;
	Wed, 19 Mar 2025 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBLmmT8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067E321D001;
	Wed, 19 Mar 2025 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396162; cv=none; b=rPzsF6do143Ym9e+AVaHXGslHrRWGtfux6lUEy55XotsmfjQaAt5o2jnM+CQNf9yuasRUmD1ZvVYAAaAXyhBhCpVNY644KhtRODbuEBlH/6AYQNJcYxNTFdfGDhX7CjZC1+pjapw69xqwIEAi0RF6Isd6+C4kDtf17rs0/nfHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396162; c=relaxed/simple;
	bh=1X+qbZxa9F+NcTL67XT4jiTLjUrLRWWhtE3pMYBf59M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSlEyZpIkyk75aoCTB0l+p7m/t133XRvPDMCsfdttrDa3VpQCJRN8WRAfjrxQpuK++FmxBUYmxOPh15hBPsJSC/82XfFKq3+biq5VTftJD/7eFnSAbvnK9CIxV2A6JDomvqL99iem5n5FX8QfY4XAV6VB1S9QN7TJan6NzqSpgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBLmmT8Z; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so45678905ad.3;
        Wed, 19 Mar 2025 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396160; x=1743000960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzrclKqnSLuC6igPSGd4oKUZVxjgZgQQ21kYeu+qNAw=;
        b=WBLmmT8ZI+WIRhTuHdmltlHu2B5SJL64lM3HSq1Hj1evWG4yF6P6MR7Avm03uDuOjt
         R2fpnZ2zzfcoljfo62n5ehyWUKzxGNDZBmkVFO/jeTlo5PmJw0WGFTztIqQ83QJUsZ5J
         le5UWb59oT78T/JjWiP3zwbkFGngHxn4BRUFsZfTrgoFuErSwFUDhhG3TFRcsXzozroQ
         pTaD2JZeKm5FmdCDAiFyStaJDPcebt2hD96ksEUTSsuCkGX5QophXvWXdwEfYA/jNDth
         2KEIjyk51n2SLDfVrtaswkBvNLnRzCKRRmSEHNdd/nf7iVl2JY0LdWag3ulmzbz+OpYl
         ybYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396160; x=1743000960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzrclKqnSLuC6igPSGd4oKUZVxjgZgQQ21kYeu+qNAw=;
        b=JWCNtPJpfvSqWqxLCHC+v+ZndFccj3+dGoIC2NhONz29hMnXNqtf1C1Wwidv8+ScRs
         gvGjaqRWSrEOn3QcRdFil7rCMHeqX61LrwDlJ3gxil97W0NivNVF6DWtog14pwPbAiYA
         gCWWkfmp8x8HqzlgGPM0aIt/YErCTutY7VeFwLWw4uEwrMr5mFZaubat1hJtF7S1Yw1U
         NOh7pymiTkH7KlsuicIw90HpVIKxGj2SGmqOacglEPA4gok3BkNltbCweIuwqtP9bkW4
         cvj+oeNTQdsWl6hItBWRNOds+gLxBeemL59YwozP97S8/mwaghIOOGjnRtHw/n/RMdC1
         ivFw==
X-Forwarded-Encrypted: i=1; AJvYcCVTJpYpG/SjQu5rl2i1qPxYO2UOpCDaBX0tACqWgtrdeyw5JgtBpylp4KE/oGF7QRqbr+2GXKwujW+f6jr4@vger.kernel.org, AJvYcCWd7+KqKv6E1fsGJ/GZBfFqqaA1WtQLxyszGnV/XB6bkOLtYfUdEJfiqKFkucJCf+LtfNIi4FQ4pvYe84Pc@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKbKcQisRfzBPiGe4vMELtW43SSie7hd/c00ohc1aTlXIhwAv
	WVZthmpyhGtWpKVk6JKaD+qaLBzx+GmQC/scnx6ia9WWcBRzFAfX
X-Gm-Gg: ASbGnctja6xtpBo2rbOx1yUjGOuVf2urlgnX84bTNc217FEoYag491/Iag7xWGvndaC
	BmRS3d3Zda5/fJaBHOkATJ+U/UUKTvn2ysKsx6U8Z9mPx8BCsEGms1EAZ2cfIdwpZQDAYydTRrW
	IfwP6jjXy3rwGc0v8wDzzOjL8kf2XzZg24N8A0KxCJbAUkJewjlciQ7x2kMUBCMqFTcTw+TEmLy
	+GFxEBRqj9i56RmqMcwRrOmQMlsDWKE2JvkLB8Hz1S/2Hn60wokBwSAYdKbFUhU0Q5/a5As4yi2
	dNg0ER39ZWAiOtKM7CXssnE7L3gbfgwljabdos0cZggqukKDiEhnAH4+uJSX3NEnE4XE+VexC9v
	Mx8iurgmT/LKtQcxGp4/2CVBmUd0SjA==
X-Google-Smtp-Source: AGHT+IHdDL0qktvi0766ilD4DZ91nDGI11VuBNzb7WvAPu6gZEBkKU3yNLQGg0sf610Nty8FPhSWEQ==
X-Received: by 2002:a17:902:e952:b0:223:5379:5e4e with SMTP id d9443c01a7336-2264981dc4dmr63164075ad.10.1742396160120;
        Wed, 19 Mar 2025 07:56:00 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6a13sm115019115ad.118.2025.03.19.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 28/34] drm/msm: Wire up gpuvm ops
Date: Wed, 19 Mar 2025 07:52:40 -0700
Message-ID: <20250319145425.51935-29-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Hook up the map/remap/unmap ops to apply MAP/UNMAP operations.  The
MAP/UNMAP operations are split up by drm_gpuvm into a series of map/
remap/unmap ops, for example an UNMAP operation which spans multiple
vmas will get split up into a sequence of unmap (and possibly remap)
ops which each apply to a single vma.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h     |  12 ++
 drivers/gpu/drm/msm/msm_gem_vma.c | 329 ++++++++++++++++++++++++++++--
 2 files changed, 320 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 117f0e35e628..7f6315a66751 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,16 @@ struct msm_gem_vm {
 	/** @vm_lock: protects gpuvm insert/remove/traverse */
 	struct mutex vm_lock;
 
+	/**
+	 * @op_lock:
+	 *
+	 * Serializes VM operations.  Typically operations are serialized
+	 * by virtue of running on the VM_BIND queue, but in the cleanup
+	 * path (or if multiple VM_BIND queues) the @op_lock provides the
+	 * needed serialization.
+	 */
+	struct mutex op_lock;
+
 	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
 
@@ -121,6 +131,8 @@ void msm_vma_job_cleanup(struct msm_gem_submit *submit);
 
 struct msm_fence_context;
 
+#define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
+
 /**
  * struct msm_gem_vma - a VMA mapping
  *
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 554ec93456a0..09d4746248c2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,8 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -20,18 +22,29 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+msm_gem_vma_unmap_range(struct drm_gpuva *vma, uint64_t unmap_start, uint64_t unmap_range)
+{
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+
+	vm_dbg("%p:%p: %016llx %016llx", vma->vm, vma, unmap_start, unmap_start + unmap_range);
+
+	if (vma->gem.obj)
+		msm_gem_assert_locked(vma->gem.obj);
+
+	vm->mmu->funcs->unmap(vm->mmu, unmap_start, unmap_range);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	msm_gem_vma_unmap_range(vma, vma->va.addr, vma->va.range);
 
 	msm_vma->mapped = false;
 }
@@ -52,6 +65,11 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 
 	msm_vma->mapped = true;
 
+	vm_dbg("%p: %016llx %016llx", vma, vma->va.addr, vma->va.range);
+
+	if (vma->gem.obj)
+		msm_gem_assert_locked(vma->gem.obj);
+
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
@@ -79,10 +97,11 @@ static void __vma_close(struct drm_gpuva *vma)
 	GEM_WARN_ON(msm_vma->mapped);
 	GEM_WARN_ON(!mutex_is_locked(&vm->vm_lock));
 
-	spin_lock(&vm->mm_lock);
-	if (vma->va.addr && vm->managed)
+	if (vma->va.addr && vm->managed) {
+		spin_lock(&vm->mm_lock);
 		drm_mm_remove_node(&msm_vma->node);
-	spin_unlock(&vm->mm_lock);
+		spin_unlock(&vm->mm_lock);
+	}
 
 	drm_gpuva_remove(vma);
 	drm_gpuva_unlink(vma);
@@ -101,11 +120,9 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 	 */
 	GEM_WARN_ON(!vm->managed);
 
-	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
 	mutex_lock(&vm->vm_lock);
 	__vma_close(vma);
 	mutex_unlock(&vm->vm_lock);
-	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
 }
 
 static struct drm_gpuva *
@@ -124,6 +141,7 @@ __vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
 
 	if (vm->managed) {
 		BUG_ON(offset != 0);
+		BUG_ON(!obj);  /* NULL mappings not valid for kernel managed VM */
 		spin_lock(&vm->mm_lock);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
@@ -137,7 +155,8 @@ __vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
 		range_end   = range_start + obj->size;
 	}
 
-	GEM_WARN_ON((range_end - range_start) > obj->size);
+	if (obj)
+		GEM_WARN_ON((range_end - range_start) > obj->size);
 
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
@@ -146,6 +165,9 @@ __vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
 	if (ret)
 		goto err_free_range;
 
+	if (!obj)
+		return &vma->base;
+
 	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
 	if (IS_ERR(vm_bo)) {
 		ret = PTR_ERR(vm_bo);
@@ -190,39 +212,289 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	return &vma->base;
 }
 
+static int
+msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = vm_bo->obj;
+	struct drm_gpuva *vma;
+	int ret;
+
+	msm_gem_assert_locked(obj);
+
+	drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+		ret = msm_gem_pin_vma_locked(obj, vma);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+struct op_arg {
+	unsigned flags;
+	struct drm_gpuvm *vm;
+	struct msm_gem_submit *submit;
+};
+
+static struct drm_gpuva *
+vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
+{
+	struct msm_gem_vma *vma;
+
+	if (WARN_ON(list_empty(&arg->submit->preallocated_vmas)))
+		return NULL;
+
+	vma = list_first_entry(&arg->submit->preallocated_vmas,
+			       struct msm_gem_vma, base.rb.entry);
+
+	list_del(&vma->base.rb.entry);
+
+	return __vma_init(vma, arg->vm, op->gem.obj, op->gem.offset,
+			  op->va.addr, op->va.addr + op->va.range);
+}
+
+static int
+msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
+{
+	struct drm_gem_object *obj = op->map.gem.obj;
+	struct drm_gpuva *vma;
+	struct sg_table *sgt;
+	unsigned prot;
+
+	vma = vma_from_op(arg, &op->map);
+
+	vm_dbg("%p:%p: %016llx %016llx", vma->vm, vma, vma->va.addr, vma->va.range);
+
+	if (obj) {
+		sgt = to_msm_bo(obj)->sgt;
+		prot = msm_gem_prot(obj);
+	} else {
+		sgt = NULL;
+		prot = IOMMU_READ | IOMMU_WRITE;
+	}
+
+	if (WARN_ON(IS_ERR(vma)))
+		return PTR_ERR(vma);
+
+	vma->flags = ((struct op_arg *)arg)->flags;
+
+	return msm_gem_vma_map(vma, prot, sgt);
+}
+
+static int
+msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
+{
+	struct drm_gpuvm *vm = ((struct op_arg *)arg)->vm;
+	struct drm_gpuva *orig_vma = op->remap.unmap->va;
+	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
+	uint64_t unmap_start, unmap_range;
+	unsigned flags;
+
+	vm_dbg("orig_vma: %p:%p: %016llx %016llx", vm, orig_vma, orig_vma->va.addr, orig_vma->va.range);
+
+	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
+
+	msm_gem_vma_unmap_range(op->remap.unmap->va, unmap_start, unmap_range);
+
+	/*
+	 * Part of this GEM obj is still mapped, but we're going to kill the
+	 * existing VMA and replace it with one or two new ones (ie. two if)
+	 * the unmapped range is in the middle of the existing (unmap) VMA.
+	 * So just set the state to unmapped:
+	 */
+	to_msm_vma(orig_vma)->mapped = false;
+
+	/*
+	 * The prev_vma and/or next_vma are replacing the unmapped vma, and
+	 * therefore should preserve it's flags:
+	 */
+	flags = orig_vma->flags;
+
+	__vma_close(orig_vma);
+
+	if (op->remap.prev) {
+		prev_vma = vma_from_op(arg, op->remap.prev);
+		if (WARN_ON(IS_ERR(prev_vma)))
+			return PTR_ERR(prev_vma);
+
+		vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
+		to_msm_vma(prev_vma)->mapped = true;
+		prev_vma->flags = flags;
+	}
+
+	if (op->remap.next) {
+		next_vma = vma_from_op(arg, op->remap.next);
+		if (WARN_ON(IS_ERR(next_vma)))
+			return PTR_ERR(next_vma);
+
+		vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
+		to_msm_vma(next_vma)->mapped = true;
+		next_vma->flags = flags;
+	}
+
+	return 0;
+}
+
+static int
+msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_gpuva *vma = op->unmap.va;
+
+	vm_dbg("%p:%p: %016llx %016llx", vma->vm, vma, vma->va.addr, vma->va.range);
+
+	msm_gem_vma_unmap(vma);
+	__vma_close(vma);
+
+	return 0;
+}
+
 static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
+	.vm_bo_validate = msm_gem_vm_bo_validate,
+	.sm_step_map = msm_gem_vm_sm_step_map,
+	.sm_step_remap = msm_gem_vm_sm_step_remap,
+	.sm_step_unmap = msm_gem_vm_sm_step_unmap,
 };
 
+static void
+cond_lock(struct drm_gem_object *obj)
+{
+	if (!obj)
+		return;
+
+	/*
+	 * Hold a ref while we have the obj locked, so drm_gpuvm doesn't
+	 * manage to drop the last ref to the obj while it is locked:
+	 */
+	drm_gem_object_get(obj);
+	msm_gem_lock(obj);
+}
+
+static void
+cond_unlock(struct drm_gem_object *obj)
+{
+	if (!obj)
+		return;
+
+	msm_gem_unlock(obj);
+	/* Drop the ref obtained in cond_lock(): */
+	drm_gem_object_put(obj);
+}
+
+static int
+run_bo_unmap(struct op_arg *arg, u64 req_addr, u64 req_range)
+{
+	struct drm_gpuva *vma, *next;
+	struct drm_gpuvm *vm = arg->vm;
+	int ret;
+	u64 req_end = req_addr + req_range;
+
+	GEM_WARN_ON(!mutex_is_locked(&to_msm_vm(vm)->op_lock));
+
+	/*
+	 * There are two locks at play when it comes to inserting/
+	 * removing objs into a VM.  There is vm->vm_lock and the
+	 * obj resv lock.  Because there are N objs and M VMs, and
+	 * an obj can be attached to an arbitrary # of VMs, the only
+	 * alternative is a single global lock.
+	 *
+	 * With two locks at play, there are two possible orderings
+	 * of locking:
+	 *
+	 * 1) locking obj first, and then vm_lock.  The problem with
+	 *    this ordering is that OP_UNMAP can be touching an
+	 *    arbitrary # of VMAs, with their own objs.  So we have
+	 *    no way to know which objs to lock without traversing
+	 *    the VM.  Which requires vm_lock!
+	 *
+	 * 2) vm_lock first, and then obj lock.  The problem with this
+	 *    ordering is that non-VM_BIND (ie. kernel managed VM)
+	 *    userspace relies on implicit VMA teardown when a BO is
+	 *    freed.  Which means there are paths where we need to
+	 *    traverse the obj's gpuva list to find the VM(s).  Which
+	 *    requires the obj lock!
+	 *
+	 * To resolve this we rely on the fact that, with a VM_BIND
+	 * userspace the legacy paths are disallowed.  And all paths
+	 * which modify the VM also hold op_lock.  So we can savely
+	 * reach into the VM to find the first object to lock.  But
+	 * it means having to bypass drm_gpuvm_sm_unmap(), and pull
+	 * out the impacted VMAs ourself.
+	 *
+	 * (The other option would be to use drm_gpuvm_sm_unmap_ops_create(),
+	 * but that requires memory allocation.. which we can't do
+	 * here.)
+	 */
+	drm_gpuvm_for_each_va_range_safe(vma, next, vm, req_addr, req_end) {
+		struct drm_gem_object *obj = vma->gem.obj;
+
+		cond_lock(obj);
+		mutex_lock(&to_msm_vm(vm)->vm_lock);
+
+		ret = drm_gpuvm_sm_unmap_va(vma, arg,
+					    vma->va.addr,
+					    vma->va.range);
+
+		mutex_unlock(&to_msm_vm(vm)->vm_lock);
+		cond_unlock(obj);
+
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static int
 run_bo_op(struct msm_gem_submit *submit, const struct msm_gem_submit_bo *bo)
 {
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	struct op_arg arg = {
+		.vm = submit->vm,
+		.submit = submit,
+	};
 	unsigned op = bo->flags & MSM_SUBMIT_BO_OP_MASK;
+	int ret;
 
-	switch (op) {
-	case MSM_SUBMIT_BO_OP_MAP:
-	case MSM_SUBMIT_BO_OP_MAP_NULL:
-		return drm_gpuvm_sm_map(submit->vm, submit->vm, bo->iova,
-					bo->range, bo->obj, bo->bo_offset);
-		break;
-	case MSM_SUBMIT_BO_OP_UNMAP:
-		return drm_gpuvm_sm_unmap(submit->vm, submit->vm, bo->iova,
-					  bo->bo_offset);
+	if (op == MSM_SUBMIT_BO_OP_UNMAP) {
+		vm_dbg("UNMAP: %p: %016llx %016llx", vm, bo->iova, bo->range);
+		ret = run_bo_unmap(&arg, bo->iova, bo->range);
+	} else {
+		if ((op == MSM_SUBMIT_BO_OP_MAP) &&
+		    (bo->flags & MSM_SUBMIT_BO_DUMP))
+			arg.flags |= MSM_VMA_DUMP;
+
+		cond_lock(bo->obj);
+		mutex_lock(&vm->vm_lock);
+
+		vm_dbg("MAP: %p: %016llx %016llx", vm, bo->iova, bo->range);
+		ret = drm_gpuvm_sm_map(submit->vm, &arg,
+				       bo->iova, bo->range,
+				       bo->obj, bo->bo_offset);
+
+		mutex_unlock(&vm->vm_lock);
+		cond_unlock(bo->obj);
 	}
 
-	return -EINVAL;
+	return ret;
 }
 
 static struct dma_fence *
 msm_vma_job_run(struct drm_sched_job *job)
 {
 	struct msm_gem_submit *submit = to_msm_submit(job);
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	int ret = 0;
+
+	vm_dbg("");
+
+	mutex_lock(&vm->op_lock);
+	vm->mmu->prealloc = &submit->prealloc;
 
 	for (unsigned i = 0; i < submit->nr_bos; i++) {
 		int ret = run_bo_op(submit, &submit->bos[i]);
 		if (ret) {
 			to_msm_vm(submit->vm)->unusable = true;
-			return ERR_PTR(ret);
 		}
 	}
 
@@ -240,8 +512,11 @@ msm_vma_job_run(struct drm_sched_job *job)
 		msm_gem_unlock(obj);
 	}
 
+	vm->mmu->prealloc = NULL;
+	mutex_unlock(&vm->op_lock);
+
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static void
@@ -404,6 +679,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	spin_lock_init(&vm->mm_lock);
 	mutex_init(&vm->vm_lock);
+	mutex_init(&vm->op_lock);
 
 	vm->mmu = mmu;
 	vm->managed = managed;
@@ -433,6 +709,9 @@ void
 msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 {
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
+	struct op_arg arg = {
+		.vm = gpuvm,
+	};
 
 	/*
 	 * For kernel managed VMs, the VMAs are torn down when the handle is
@@ -444,4 +723,12 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
 	drm_sched_stop(&vm->sched, NULL);
 	drm_sched_fini(&vm->sched);
+
+	/* Serialize against vm scheduler thread: */
+	mutex_lock(&vm->op_lock);
+
+	/* Tear down any remaining mappings: */
+	run_bo_unmap(&arg, gpuvm->mm_start, gpuvm->mm_range);
+
+	mutex_unlock(&vm->op_lock);
 }
-- 
2.48.1


