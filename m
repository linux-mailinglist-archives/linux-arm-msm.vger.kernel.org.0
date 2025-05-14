Return-Path: <linux-arm-msm+bounces-57934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB2AB73F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDA837A7687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B205A296FC9;
	Wed, 14 May 2025 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/Qxcx31"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EFE296D14;
	Wed, 14 May 2025 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245444; cv=none; b=ITqNxtWmTUzkQd/uQml/FjMAuA4QmGedbAahuijtZYkuNrG88mkNRjPwJmlon9jS7EzUIu9JadJEdfMeBqBdhlhGUrzw4MVQKbcC8sMzeI3v9O4oTpO5lqWK7gidQVOpwt+XO7fpeq439VvWP8QOh4JV2lFnUU/TnU10nW+T648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245444; c=relaxed/simple;
	bh=pnQLoKZ1vywrckNj3NloDzeebCX7xk3jDKnHs/ziE+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vx8X7kbASnHbbwHe7mBZn2uljGedY5qr/9fyJOytz1Vcth+17WdXZY61W9YYRiqp3odZVbi06Gpo42B5mWkCp43idqEsAt2GYar/Zove/en9ymximTZyFq8xtvbGH9Z6lc0RkZZWXD2aO6EE3PZP9SIVqZ7tvcecmCpdrlzBPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/Qxcx31; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22fb6eda241so1454305ad.1;
        Wed, 14 May 2025 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245442; x=1747850242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
        b=m/Qxcx315r78fYRmdW1f4Qz7JbgDJfj7JDEoICm4qldhmsP8AsdkM7uRfVi+QQST/5
         FokCa5hVyhc79AgT3KJ9Iba3CvCL9jtgTDsJpkgwlgxQZjykTKdZrguADAP08LGV+dKI
         va/H4UjwxyVCwKvidIcnmuf+OVecmjZzFgd+eHBZNnpEqNM1svPpqrEacxXSBJj6adIh
         3xE7QhCRO3XGksO5iWzkNBkNKQpWHmEwBdcLIzpG8PI5RF6373t6jFstBQybRD+3wyXz
         nqZL3cpHVdSoO5YCM/1qSnqrQLlUQMbHKS8xlqQ3L4ESnfzQFRdeWuJQPUjJMArfQkcz
         wVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245442; x=1747850242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
        b=LoQdqR+Trd+hSt5ZhnQowltg08krjFAgmGUvEDbVx5VryTNfcJ/u1h2ewrNfFShd/1
         jjeJHUn18aoLe02ACEBvNEkNOnk8ZIrzj9BQHRCh/9P2++rdLKia+mAOjbSRMBcC6vyJ
         aTJJXrOEtejJ+Cy4k/L+tDEVJt1OHm8ORkQ81iI5J3S8iyeImp7tH8AvNPEIFoies986
         elVH9mxRcagxYQjeY5j7XRNSkTlDPuoT+ecg0skwKdLFyuKIKeT2zS8jWUzyI+dXtveV
         Cn0BDMDiugI1Da2VVObKKOhyuKREv7Q4XBzVnFo9B/m8Rfi8BJv7CRrUBAx5SbQBeSsG
         2GIg==
X-Forwarded-Encrypted: i=1; AJvYcCWTuB9+tpNPBR4Cs8fJLOC2hBF4yj9AG0pvMsHNsrR0+YYpHX8G+3CzHUCBxOu0ejKL1fURPwUzQuZYaaLO@vger.kernel.org, AJvYcCXUNWWYaQetzcpDYFQoog3BbExW731OHfrIDdikiXif1Lj2Xa970gbJ6887xiemzBCuJbweysVRQviN2EKL@vger.kernel.org
X-Gm-Message-State: AOJu0YzbDPWxkzU7v/VAwnjsppmRuAJNnrMonNDKzlx5CvhiCBtYS6jO
	BpvUiq6YE+1w7bAREHemJ+AtSGrH5Dv3hKFs6/KdxUO8KZpFB+m7
X-Gm-Gg: ASbGncvZvo8vstfle8ytshdsL5wEwGBf3Hk1rBeDWoeIJa/A38E+DHmfoUNxbmOg30U
	grNTMMgFJdFhPNhgg34y5XMiRXofBDw5v7DryR4janLnvuBt+5hUCECmNkWmQpHKAiiMKX/Ci6p
	KgWMXHOnFRnIfH+JqwaXxyuHW0SNcWfH6AKk4obAgohn06sgU9Ub7p7vx9c2Z/AynxGy2XMtBqm
	pn7x+3XYDsy3GHK4Wp1NLxA9At4mXYpDw7inCiNEOkhGWkgsAB+l0GWPnVcTywtP4GiLeM/DEzs
	GPRQoeZ2/jaiKDN+3JcBtCf92mjzwQQp0ARYHY4AIsor6ET+ULRvVwldw9q9nZ7exxXGk1nik8I
	1323RCNOV7l5Hdjf9UYZ0/O/KKA==
X-Google-Smtp-Source: AGHT+IFnI4cNQJPT/KKT9TNgAjcTqSZ6JmSfX8QI6yRIz+tmXH9K+A+O7t019u80yYB/SGJ891d6AQ==
X-Received: by 2002:a17:903:2287:b0:22e:4cab:f786 with SMTP id d9443c01a7336-23198138157mr51787425ad.18.1747245442310;
        Wed, 14 May 2025 10:57:22 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b3a0sm102931915ad.179.2025.05.14.10.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:21 -0700 (PDT)
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
Subject: [PATCH v4 34/40] drm/msm: Split out map/unmap ops
Date: Wed, 14 May 2025 10:53:48 -0700
Message-ID: <20250514175527.42488-35-robdclark@gmail.com>
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

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 73baa9451ada..a105aed82cae 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
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
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.49.0


