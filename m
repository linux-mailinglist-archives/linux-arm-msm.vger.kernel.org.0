Return-Path: <linux-arm-msm+bounces-88116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E9D04C99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C71C034F7A12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 16:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8F32550D5;
	Thu,  8 Jan 2026 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mBUUT4Mm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A2E231832
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888469; cv=none; b=qoETSDLgUFzk9QOxAkRJeenFruPN8dkzDZZfouBTupQJa0mJJC4++x0ZUYIVt4teb2SDMXhpnUVactOcGfo/HpsBVkmVJWCKOAwQWAltAwCQUrn8zwF5KWHencSqRFDkZeWMMoxko8LZ615LccvwQqCAfa7BfsarJQPsmDr33V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888469; c=relaxed/simple;
	bh=kOPMqTsyPdJtTu+kHbIrT/g3rtE4MKWOeM6qXQOCcWs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lvefr+qUEs/v0UElswI7HBH2XKi+exvMmKia/WQL+22ugw2jgQyd74rm4mAzZitTqJBV6tqBW0qWoqla7Fs0qCJPm0oIPPXRZVpRjs4GnfALf076Lw5uYz3G8x73ID1PXZH4J85ollGH8NUCPLwwG2bcW/J7TJbAcZdnETargh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mBUUT4Mm; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3ffa98fcso24273075e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888466; x=1768493266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t5f5dl5do6LbBTrB6/kS4ElTAjp4/y/e46MsHfzdtHU=;
        b=mBUUT4Mm6x/x8igZ/QGmWB7/UWJYcyBLNp5g39Nh8zLCR+mbAsYwI0lg/RNpl6USUM
         6CpgGN1b0Ho3QvvAYE2X0JHug2x6Q72f9UHumJv0KKNKdlanhgR4pNBkY2E49rihnyNx
         uqY7OYVJ8mybpGdg9A2EzeOUVkXoFQahGpUCgFPdT2dryssqikM1/l53iafP+I30U729
         WbX0hl78Yp+ryvooRfkr7+2Ga493o6YCRsbcbZ7RS5DiczbVZGuufX3fV+JXk4sDUW1S
         E8F+YsTMHUhwINDkEDKXZOGXgKQUyZjDbVyYDchMaHKBL8rN3y5eYikuIct8Sg+j6/vx
         25lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888466; x=1768493266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5f5dl5do6LbBTrB6/kS4ElTAjp4/y/e46MsHfzdtHU=;
        b=tXUehw9BYoy24RZ7NP49eCGaCYP7boYwmdAOXF57XbQbk3NG4gjUk3hITemNIRSLTK
         EiyH9KLLZW6fRmD4iGoJh7TrfenEGvxVxrI9Ousw+mV9cU0R7MCmH4ye7EUh47Ij0n0q
         VoMAKISpTY6PJ/yF/d//oWRR93SrWjQC2YIkbrjbBoB1OuuEW4uwYSBaTF0D6voJQbo7
         u2V7LxvzXR5vQUMr2wtp8YW0lIx9e4Zww9rHNs/O6coOZo68nsaxB35hve/Pwm/4fPq0
         C25E8mdHPp5pQ/kGanpZIy8nNB8AFpBZlQwdFhzg4rJrn28MJkbqUP4335rq9TUmnji0
         5SqA==
X-Forwarded-Encrypted: i=1; AJvYcCVZYlV2380D2RjR24S1+B9MsbuTjBbzmoj7RzsrVuShaSL8C2TzyKpFlpR6bSD/V3WascZVJCbSyPpDX3TC@vger.kernel.org
X-Gm-Message-State: AOJu0YyDHMVYUAfe74hynr4o+QdaJfzslUrY4+A0OvJWPQOrM+5U868Z
	bF68LFCpB0Ea0dY0Kwq/dC8Wrd9MNJW0gDnuX62JijuKgqAf676blmr6G+czDkgkvMdCBIyGECz
	k3qWpohaZ8cz8G2MnvQ==
X-Google-Smtp-Source: AGHT+IGrRvlMAYGpdYKPwIt18IZ/QB5z+1D75flywOH0oYNCOMGvV6DAXfU/soiruiJho4QBBeaWGd5VhlYhyx8=
X-Received: from wmot13.prod.google.com ([2002:a05:600c:450d:b0:477:aa1e:920c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b33:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47d84b19f5emr73879175e9.9.1767888465737;
 Thu, 08 Jan 2026 08:07:45 -0800 (PST)
Date: Thu, 08 Jan 2026 16:07:32 +0000
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6841; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=kOPMqTsyPdJtTu+kHbIrT/g3rtE4MKWOeM6qXQOCcWs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX9ZNgKuHvWAexmI6VcN4uOdOglWHTyyqLkRBu
 rK7gV4sCTmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV/WTQAKCRAEWL7uWMY5
 RljpD/0Q7viWv+HOdpsS1rQCOpVXCNgk+CErBBoM4a20FdyQX/tj6ShFWLubq5GUkRStohlkSHO
 6sYtsHJWiYFn/yyNmKnpcwlFa+ehPABimqJGV02QX+LUWK926CqNj1e0SCq8EkYsXKjXlL+nsGk
 QstHmYU9FfBD6O3ZG53Uzd2wtdIQaynYKu6wEGdPE0sUa2jtmy532PvikZNzbkxkIwzY/aXtXfG
 XMIiFTpY7TvxZRO5gJ3QKus13gd/lX2Tl8/A3eSQXhcR0OAb8RKFuvXzGRqsVSCtYqgoab/XOka
 fogQimTvWEj36FSRl1JeulnFFI+wsvJYqLD2S/MMdBZbLni2Kop9PnJp4BslFysu2QlKvJmwofd
 qU2e6Gp7qCNQ8iQiFZYN97ngOCT7isHM5gjtv1ghR3LRChdaiA/UgVhsxTQcslkqwPhZ1CNHRVZ
 7R8OzVBlmjFlgVmop6f6FyWnuTEsMZALnEin55e7afAInuEMafRR/q7m7HuX648l+o6gzr57BWX
 htQHjXURPQSiaVkELHvYS6nrAWA+jVJBDK2Pt8lBf3gK39QvV0wsQLZBVJw30T4dnQo5OKxmOuV
 iiLa+yQTk/78FK+6D+lSLjAHT+43FkYq02RxgWdfhuPToxso2/Od/hdcyDn0PfedzhN3n2my27b l7ELT57ErOP9Ovw==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gpuvm-rust-v2-2-dbd014005a0b@google.com>
Subject: [PATCH v2 2/3] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and
 staged mode
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

In the previous commit we updated drm_gpuvm_bo_obtain_prealloc() to take
locks internally, which means that it's only usable in immediate mode.
In this commit, we notice that drm_gpuvm_bo_obtain() requires you to use
staged mode. This means that we now have one variant of obtain for each
mode you might use gpuvm in.

To reflect this information, we add a warning about using it in
immediate mode, and to make the distinction clearer we rename the method
with a _locked() suffix so that it's clear that it requires the caller
to take the locks.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 16 +++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
 drivers/gpu/drm/msm/msm_gem.h          |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c             |  4 ++--
 include/drm/drm_gpuvm.h                |  4 ++--
 7 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0de47e83d84df11a53e40fe82d069882e46149b6..37f0d97f653466285f036a5bf0246a5fea0234cd 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1844,16 +1844,26 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
  * count of the &drm_gpuvm_bo accordingly. If not found, allocates a new
  * &drm_gpuvm_bo.
  *
+ * Requires the lock for the GEMs gpuva list.
+ *
  * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
  *
  * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on failure
  */
 struct drm_gpuvm_bo *
-drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
-		    struct drm_gem_object *obj)
+drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
+			   struct drm_gem_object *obj)
 {
 	struct drm_gpuvm_bo *vm_bo;
 
+	/*
+	 * In immediate mode this would require the caller to hold the GEMs
+	 * gpuva mutex, but it's not okay to allocate while holding that lock,
+	 * and this method allocates. Immediate mode drivers should use
+	 * drm_gpuvm_bo_obtain_prealloc() instead.
+	 */
+	drm_WARN_ON(gpuvm->drm, drm_gpuvm_immediate_mode(gpuvm));
+
 	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
 	if (vm_bo)
 		return vm_bo;
@@ -1867,7 +1877,7 @@ drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
 
 	return vm_bo;
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_locked);
 
 /**
  * drm_gpuvm_bo_obtain_prealloc() - obtains an instance of the &drm_gpuvm_bo
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 48e52c5561beb4ca3070ef3f2f4337225fafc124..9a9ad4e82305d23ce4741b59f09951265365c1de 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -256,7 +256,7 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
 
 	dma_resv_lock(obj->resv, NULL);
-	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain(&vm_ctx->gpuvm_mgr, obj);
+	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_mgr, obj);
 	dma_resv_unlock(obj->resv);
 	if (IS_ERR(bind_op->gpuvm_bo))
 		return PTR_ERR(bind_op->gpuvm_bo);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a4cf31853c5008e171c3ad72cde1004c60fe5212..26dfe3d22e3e847f7e63174481d03f72878a8ced 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -60,7 +60,7 @@ struct msm_gem_vm_log_entry {
  * embedded in any larger driver structure.  The GEM object holds a list of
  * drm_gpuvm_bo, which in turn holds a list of msm_gem_vma.  A linked vma
  * holds a reference to the vm_bo, and drops it when the vma is unlinked.
- * So we just need to call drm_gpuvm_bo_obtain() to return a ref to an
+ * So we just need to call drm_gpuvm_bo_obtain_locked() to return a ref to an
  * existing vm_bo, or create a new one.  Once the vma is linked, the ref
  * to the vm_bo can be dropped (since the vma is holding one).
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 71d5238437eb89b23c067cca3c01cb86c94b934b..71943104ce9fd01d89e781d41bf067a98a574c5f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -413,7 +413,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (!obj)
 		return &vma->base;
 
-	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
+	vm_bo = drm_gpuvm_bo_obtain_locked(&vm->base, obj);
 	if (IS_ERR(vm_bo)) {
 		ret = PTR_ERR(vm_bo);
 		goto err_va_remove;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f10809115c563a12c6f6e798bf9fe77a0a3a993c..0d693760d2223be9a141ee4b8d820269ae4868b6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1275,7 +1275,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 				return -ENOENT;
 
 			dma_resv_lock(obj->resv, NULL);
-			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
+			op->vm_bo = drm_gpuvm_bo_obtain_locked(&uvmm->base, obj);
 			dma_resv_unlock(obj->resv);
 			if (IS_ERR(op->vm_bo))
 				return PTR_ERR(op->vm_bo);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7cac646bdf1c03689bca9511f5e1f40270811622..0e7f82eb38fc90e1b42ffc1cdf49a6b202fbb3e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1022,7 +1022,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
 		xe_bo_assert_held(bo);
 
-		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
+		vm_bo = drm_gpuvm_bo_obtain_locked(vma->gpuva.vm, &bo->ttm.base);
 		if (IS_ERR(vm_bo)) {
 			xe_vma_free(vma);
 			return ERR_CAST(vm_bo);
@@ -2269,7 +2269,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 		if (err)
 			return ERR_PTR(err);
 
-		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
+		vm_bo = drm_gpuvm_bo_obtain_locked(&vm->gpuvm, obj);
 		if (IS_ERR(vm_bo)) {
 			xe_bo_unlock(bo);
 			return ERR_CAST(vm_bo);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index fdfc575b260360611ff8ce16c327acede787929f..0d3fc1f6cac9966a42f3bc82b0b491bfefaf5b96 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -736,8 +736,8 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 		    struct drm_gem_object *obj);
 
 struct drm_gpuvm_bo *
-drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
-		    struct drm_gem_object *obj);
+drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
+			   struct drm_gem_object *obj);
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *vm_bo);
 

-- 
2.52.0.351.gbe84eed79e-goog


