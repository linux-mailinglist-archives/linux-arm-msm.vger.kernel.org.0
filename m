Return-Path: <linux-arm-msm+bounces-40879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E309E80F6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FB32822B2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE22D1AAA2A;
	Sat,  7 Dec 2024 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfxRy68B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9A71AAA2B;
	Sat,  7 Dec 2024 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588300; cv=none; b=Y9HNvCS93+hUHD/0wyKW5qiIvimrQhZ9eEx3vzrkjLuns8D29aavUH+02IPcvbIpnY72dD5kmlb6mcVSLv9pr1a4CxC6ZDLCW6U6CAzGAQAMsZmmNII54wI4DeTaTSwHedGjwGssWzJseFNHmclCSyGNTtVjjF9g130j/RogtGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588300; c=relaxed/simple;
	bh=UyItdtnL2oeiTvXYiI7gp8SWGOXyXGXpt174w2GPeYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dv74TpRcUud6iw1rPmJMXHRF4J1cnlx/KMoUxp9fuAZNGo8iN+RGmKUYVP+dob/lGp9ZPBvbLfj7wNP78DZwT7HGU0Cwvyr1Br2jJlcCUA9hlxQ8IA8zuUy+E0GP81x9JQQLyRjsmqMk818xgGilakZr2xN+UQ8VFCmh4+7cAsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfxRy68B; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21561af95c3so25781495ad.3;
        Sat, 07 Dec 2024 08:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588298; x=1734193098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acnaTz9Qz3U3hTbfKKAEfNYoY/uXenV7dJ0Db24xEM0=;
        b=LfxRy68Bw3HzhUcYT0Fp3Lnyk/D+LnGHv7oo+Aq79l1gvHeUiV4jWF3r95OKzX9TQf
         AotqtZKhrAyGZmpf2ZTSvw9nrW/ceqe93LqxTC+HxFPmt9ovWFucZE+un1ghAJD+5+AO
         sqgja2Pt1Y5pKdCO1kXQKTzlsAQojs4mOzUAS0SjTPLMtT1b/zeMUrW/Y9if9Zxz1P2N
         v6xJF96QJbpAS+qU+b0TgXVXUlPoOhFr1Ps5IT7wkJVWDYcY9VbsU4JBftcNwkoRlYfK
         qVfG/kvjLl3apMbn1fW7tsV5F1DwjdgXZB/NddNSGcAeqRFHUu6CmYYNVq8wn9+xqqrT
         UVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588298; x=1734193098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acnaTz9Qz3U3hTbfKKAEfNYoY/uXenV7dJ0Db24xEM0=;
        b=cJlnvypEyBgesWsSqaOlpUd+u1T97CilqomRnCxsDs6GZ8PnLmDu4VQjKaPNA9l5QU
         SrzHRoJagEl9EGT89ITmqptmqnJnyHtLSxiQQ3z+ldhO8qYNW5iYruwqdf+vSiYtL5Of
         PLJmkWgvkEN29xMytWpSVTWz7zsoTIexcIE0s+TB/5cO8DcaO27/e+sxlxD9YJZkJ3tN
         SZ1EzOIx3LyHc60AoGEyYCi69C7/7Q/gQ66M3TRumF/5M3AlmBicLGauRkxN770yU2bC
         +xpc4rMcKD7EG+rr2kwO7+PGbKD5dersv5bE8VqlPiUbAZNMlUWuOOPwdUANqCuA62hU
         9YeA==
X-Forwarded-Encrypted: i=1; AJvYcCXFRnpKNEVSN19Rc2EwdQr+9kvRKD38jJ2WQxRDXPGbxdeAZXxEL7k7h1qnoNrgRaGDviZDgJvin/AT4Ssj@vger.kernel.org, AJvYcCXlXjyo2jpe6NUpf+m7HYrPAVRgYg6UxDWMW0KkNCIQwvSZdxIgIl/Wq1gczsFpN2t/GSyk4q3ecYbJ6VpY@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVu+eehnnmj8TZphQKQXSxZtZKC/3nV3eG7Vo1YzvUIpO6iYQ
	8qnjOLg4k/MF6FVxO0zil2C4wMaYIbR+NQJMZoDx1XDa3j+RfKkx
X-Gm-Gg: ASbGncswVWNfOQurgluF2FkJGtRZ+sLQWFUcqHw8K85Tr4xdq3NRZtc6s17Nz1KmcZq
	kZ4L8yRPiKeyrfhNkMb36vP2rqmWOqjKZUHcV0so5jV/WkDk6qPZ69dH4IfcKgJPSovMjXkvsKc
	7HJ8BBc8HFyR3oOMmYhQ+W65lBr7h+J77mn2OaulD3LW9eeDUzXZ5Tc8WyjrE5xfWX079VhAdjO
	gLaiWJ1+ik/zmyEUnd8LhDqiuyrz8asXudESrhabD4JERxPMjiX7LGj/wY9+nXZws9ikJLX+H9h
	elSQA9nX
X-Google-Smtp-Source: AGHT+IEEIY/NWs/APAaC5gCzW3w7uuF3DOjm9F5VzP5FH7UnFLgz8Ca6qsVWNLt1vhIazNyu7btbCw==
X-Received: by 2002:a17:903:234a:b0:215:6093:e384 with SMTP id d9443c01a7336-21614dd7fbcmr99352225ad.49.1733588297951;
        Sat, 07 Dec 2024 08:18:17 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd430cec7bsm260676a12.67.2024.12.07.08.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:17 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 23/24] drm/msm: Wire up gpuvm ops
Date: Sat,  7 Dec 2024 08:15:23 -0800
Message-ID: <20241207161651.410556-24-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gem.h     |  10 ++
 drivers/gpu/drm/msm/msm_gem_vma.c | 269 ++++++++++++++++++++++++++++--
 2 files changed, 263 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 27ed5bde7893..5655eb026fba 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -75,6 +75,16 @@ struct msm_gem_vm {
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
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8d79e123ed9a..00d70784da22 100644
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
@@ -79,17 +97,16 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 
 	GEM_WARN_ON(msm_vma->mapped);
 
-	spin_lock(&vm->mm_lock);
-	if (vma->va.addr && vm->managed)
+	if (vma->va.addr && vm->managed) {
+		spin_lock(&vm->mm_lock);
 		drm_mm_remove_node(&msm_vma->node);
-	spin_unlock(&vm->mm_lock);
+		spin_unlock(&vm->mm_lock);
+	}
 
-	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
 	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(vma);
 	drm_gpuva_unlink(vma);
 	mutex_unlock(&vm->vm_lock);
-	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
 
 	kfree(vma);
 }
@@ -110,6 +127,7 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 
 	if (vm->managed) {
 		BUG_ON(offset != 0);
+		BUG_ON(!obj);  /* NULL mappings not valid for kernel managed VM */
 		spin_lock(&vm->mm_lock);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
@@ -123,7 +141,8 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 		range_end   = range_start + obj->size;
 	}
 
-	GEM_WARN_ON((range_end - range_start) > obj->size);
+	if (obj)
+		GEM_WARN_ON((range_end - range_start) > obj->size);
 
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
@@ -134,6 +153,9 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	if (ret)
 		goto err_free_range;
 
+	if (!obj)
+		return &vma->base;
+
 	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
 	if (IS_ERR(vm_bo)) {
 		ret = PTR_ERR(vm_bo);
@@ -159,38 +181,234 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	return ERR_PTR(ret);
 }
 
+static int
+msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
+{
+	// TODO
+	pr_err("%s:%d\n", __func__, __LINE__);
+	return 0;
+}
+
+static struct drm_gpuva *
+vma_from_op(struct drm_gpuvm *vm, struct drm_gpuva_op_map *op)
+{
+	return msm_gem_vma_new(vm, op->gem.obj, op->gem.offset, op->va.addr,
+			       op->va.addr + op->va.range);
+}
+
+/*
+ * In a few places, we have to deal with map/unmap of potentially NULL (PRR)
+ * mappings.  The cond_lock()/cond_unlock() helpers simplify that.
+ */
+
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
+msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_gem_object *obj = op->map.gem.obj;
+	struct drm_gpuvm *vm = priv;
+	struct drm_gpuva *vma;
+	struct sg_table *sgt;
+	unsigned prot;
+	int ret;
+
+	cond_lock(obj);
+	vma = vma_from_op(vm, &op->map);
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
+	if (WARN_ON(IS_ERR(vma))) {
+		ret = PTR_ERR(vma);
+		goto out_unlock;
+	}
+
+	ret = msm_gem_vma_map(vma, prot, sgt);
+
+out_unlock:
+	cond_unlock(obj);
+
+	return ret;
+}
+
+static int
+msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_gpuvm *vm = priv;
+	struct drm_gpuva *orig_vma = op->remap.unmap->va;
+	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
+	struct drm_gem_object *obj = orig_vma->gem.obj;
+	uint64_t unmap_start, unmap_range;
+
+	vm_dbg("orig_vma: %p:%p: %016llx %016llx", vm, orig_vma, orig_vma->va.addr, orig_vma->va.range);
+
+	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
+
+	cond_lock(obj);
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
+	msm_gem_vma_close(orig_vma);
+
+	if (op->remap.prev) {
+		prev_vma = vma_from_op(vm, op->remap.prev);
+		if (WARN_ON(IS_ERR(prev_vma)))
+			return PTR_ERR(prev_vma);
+		vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
+		to_msm_vma(prev_vma)->mapped = true;
+	}
+
+	if (op->remap.next) {
+		next_vma = vma_from_op(vm, op->remap.next);
+		if (WARN_ON(IS_ERR(next_vma)))
+			return PTR_ERR(next_vma);
+		vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
+		to_msm_vma(next_vma)->mapped = true;
+	}
+
+	cond_unlock(obj);
+
+	return 0;
+}
+
+static int
+msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_gpuva *vma = op->unmap.va;
+	struct drm_gem_object *obj = vma->gem.obj;
+
+	vm_dbg("%p:%p: %016llx %016llx", vma->vm, vma, vma->va.addr, vma->va.range);
+
+	cond_lock(obj);
+	msm_gem_vma_unmap(vma);
+	msm_gem_vma_close(vma);
+	cond_unlock(obj);
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
 
+static int
+run_and_free_steps(struct drm_gpuvm *vm, struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *op;
+	int ret = 0;
+
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+
+	drm_gpuva_for_each_op (op, ops) {
+
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			ret = msm_gem_vm_sm_step_map(op, vm);
+			break;
+		case DRM_GPUVA_OP_REMAP:
+			ret = msm_gem_vm_sm_step_remap(op, vm);
+			break;
+		case DRM_GPUVA_OP_UNMAP:
+			ret = msm_gem_vm_sm_step_unmap(op, vm);
+			break;
+		default:
+			ret = -EINVAL;
+		}
+
+		if (ret)
+			break;
+	}
+
+	drm_gpuva_ops_free(vm, ops);
+
+	return ret;
+}
+
 static int
 run_bo_op(struct msm_gem_submit *submit, const struct msm_gem_submit_bo *bo)
 {
-	unsigned op = bo->flags & MSM_SUBMIT_BO_OP_MASK;
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	struct drm_gpuva_ops *ops;
 
-	switch (op) {
+	mutex_lock(&vm->vm_lock);
+	switch (bo->flags & MSM_SUBMIT_BO_OP_MASK) {
 	case MSM_SUBMIT_BO_OP_MAP:
 	case MSM_SUBMIT_BO_OP_MAP_NULL:
-		return drm_gpuvm_sm_map(submit->vm, submit->vm, bo->iova,
-					bo->range, bo->obj, bo->bo_offset);
+		vm_dbg("MAP: %p: %016llx %016llx", vm, bo->iova, bo->range);
+		ops = drm_gpuvm_sm_map_ops_create(submit->vm, bo->iova,
+						  bo->range, bo->obj,
+						  bo->bo_offset);
 		break;
 	case MSM_SUBMIT_BO_OP_UNMAP:
-		return drm_gpuvm_sm_unmap(submit->vm, submit->vm, bo->iova,
-					  bo->bo_offset);
+		vm_dbg("UNMAP: %p: %016llx %016llx", vm, bo->iova, bo->range);
+		ops = drm_gpuvm_sm_unmap_ops_create(submit->vm, bo->iova,
+						    bo->bo_offset);
+		break;
+	default:
+		ops = ERR_PTR(-EINVAL);
+		break;
 	}
+	mutex_unlock(&vm->vm_lock);
 
-	return -EINVAL;
+	return run_and_free_steps(submit->vm, ops);
 }
 
 static struct dma_fence *
 msm_vma_job_run(struct drm_sched_job *job)
 {
 	struct msm_gem_submit *submit = to_msm_submit(job);
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+	mutex_lock(&vm->op_lock);
 
 	for (unsigned i = 0; i < submit->nr_bos; i++) {
 		int ret = run_bo_op(submit, &submit->bos[i]);
 		if (ret) {
 			to_msm_vm(submit->vm)->unusable = true;
+			mutex_unlock(&vm->op_lock);
 			return ERR_PTR(ret);
 		}
 	}
@@ -209,6 +427,8 @@ msm_vma_job_run(struct drm_sched_job *job)
 		msm_gem_unlock(obj);
 	}
 
+	mutex_unlock(&vm->op_lock);
+
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
 	return NULL;
 }
@@ -276,6 +496,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	spin_lock_init(&vm->mm_lock);
 	mutex_init(&vm->vm_lock);
+	mutex_init(&vm->op_lock);
 
 	vm->mmu = mmu;
 	vm->managed = managed;
@@ -305,6 +526,7 @@ void
 msm_gem_vm_close(struct drm_gpuvm *_vm)
 {
 	struct msm_gem_vm *vm = to_msm_vm(_vm);
+	struct drm_gpuva_ops *ops;
 
 	/*
 	 * For kernel managed VMs, the VMAs are torn down when the handle is
@@ -316,4 +538,19 @@ msm_gem_vm_close(struct drm_gpuvm *_vm)
 	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
 	drm_sched_stop(&vm->sched, NULL);
 	drm_sched_fini(&vm->sched);
+
+	/* Serialize against vm scheduler thread: */
+	mutex_lock(&vm->op_lock);
+
+	/*
+	 * To avoid nested locking problems, while still holding the lock
+	 * during the necessary vm traversal, generate a list of unmap ops:
+	 */
+	mutex_lock(&vm->vm_lock);
+	ops = drm_gpuvm_sm_unmap_ops_create(_vm, _vm->mm_start, _vm->mm_range);
+	mutex_unlock(&vm->vm_lock);
+
+	run_and_free_steps(_vm, ops);
+
+	mutex_unlock(&vm->op_lock);
 }
-- 
2.47.1


