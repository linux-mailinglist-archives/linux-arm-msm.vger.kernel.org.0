Return-Path: <linux-arm-msm+bounces-40876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475E9E80F2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0E2F166938
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090971A9B5C;
	Sat,  7 Dec 2024 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNzspDID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026061A0BD8;
	Sat,  7 Dec 2024 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588295; cv=none; b=cUdrRofXMcYhKsEchuNHrT2dewqkaLBHKhkZfEcoMCoYCWTeSpkXriZH21HiKYHRGW8A5aaXzt0p2d0ZhCD7uj+ZCTnpPV0pvDpga3X1yLNlIA25dhZ1Pbd6XnHWp2FGS+POMAjVhf1eQ40fOCI+dDx4VgS8Kee9VAZPAnszO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588295; c=relaxed/simple;
	bh=Q9taLKeFDvj7Hdy7jZc1vEdPZ67XTk57haTdxXsr2Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sF/3Rdmy5fPGDgE50ix+cdBKej5TEod/u+Ym8McctVyZbgLPXQRMb3uuyOOIfyMmw+RZsH1rEv5x7YlwvjpwOjARJJPdCC7/qbq7v40+IelpUHqJmWo/3lyEpNMGZDJfczY0PVQBaJioYAEL5o7YHhx5Wy7Jo3DT1n7j0Rm19jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNzspDID; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so2036911a12.0;
        Sat, 07 Dec 2024 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588293; x=1734193093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyAWAFKr3/hyjo80WY0bJWE8UZA7qC9B69l9mmpyXAY=;
        b=RNzspDIDHLem6h6APvdjvAYsL3C/+5gGEUUPahJfUWeEVHBIoCjWi3rNT+nekln4v+
         MJQczA/GcyCCWlEs/0Dk+FqoqqlL6rfdGvQW3P/AI00gCZSEOkrJbypx/4XhqkzZJqKf
         LgBPAUeyxXAbVJclDfog8uTtDH4zRo9c+Q1nTmqbmUrdlTgM/TtYpYiXEDKvdKnDVFz5
         BsUgHjYd/62tdcBKi1zwMGXg6SI3T940ek4vYdWYZ+hE48Jms5ifvovq38vXDGt5rADU
         Ijvzi9aB2NjfkuzBWY99D1m4TRrNlxkh2IU6ytVrFO57EOZmCLgjcPv1HT765ovhCLRs
         gPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588293; x=1734193093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyAWAFKr3/hyjo80WY0bJWE8UZA7qC9B69l9mmpyXAY=;
        b=iMNFUvgRpJdSprAtCDhzVUoz+RF0ag61oxKY29dh7idbxjmUdkU8PLAC1hzzrxb0mh
         IQZ52yJx9sTAb31nUXKExkWmkaHLn1GzO9kQFwhWM6iPsT2WyDXKblIZCWAJ60puyzyT
         VOHZ/lMdu4T4EwzpWon7Ah0YgkcigT+Ru2DoWEJpkRPNb0WqSMqNam1AuSLmvW+J+AsR
         Vv15QuCk3KViC0KxDmovgjv+pA0ot/dHfsuB9SbEyo4y0hplXT/IAx+Vgo62RwKgjfiW
         q4+Da4G67uqHWDry9P/KB17sBXUS364nL5gW8Q5w2JiKJTKaIhl1pP4rjCI+IAImpQG+
         I2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVTfZOUrQ28QuuwJkoXtnANNe9Uonx+gKBMM9hcNSrcs/KdFzuXtOhcoFgBXrFGbzFFKm8qp6mSprlxKElR@vger.kernel.org, AJvYcCWQkfcLudHMILbTQSUZb5f8hj4gGEviTj1u+KL4UUQSMWBsmOfzdOd0qlOwfRvcusYEqWTLjSv0NhhdtKUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/K0ICfYnBdK6GGxr3/Gq3Cez38bfgI4N3iHgFUyijOJCknVP
	qpvh3ebwsvMHaEPRYV9Eu1oviScDzawNZT6nHeXsEET6W/9L90Je
X-Gm-Gg: ASbGncsw5hG8/6dV6tMTtD7PIL7zkZW6FlN3dzJhYDmvWnr+035K5DNW71ru9JUzT+v
	Z1W9yppe2cd1PdR3TodEuKhxbqyqmhjdQ09PrvB7TMd7hFAEcn9mdCqEh9du24wUrzu5bZkFn4V
	j0hUi3poxsSRWJBUKa6oG1WzNAoRyTZcPkZjYvkYYynShfyCwn00T6W35sid0XK9CGewQssp8wf
	uyUDrweMjj3puhOQlKtYY3jaYlwnCr3gLjpTTIS1TIbsWpIwasx4qdX3gcQ9rxYuHhWX3iTtkpu
	FPnavyjI
X-Google-Smtp-Source: AGHT+IHhT6HtECecLuYdY7XMLLhSIO6wdgkY+V+ETmTV12mWAOqO/UOJtxOFTCMFaaVYW6pMEl7EIw==
X-Received: by 2002:a17:90b:520b:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-2ef69367705mr11337910a91.7.1733588293123;
        Sat, 07 Dec 2024 08:18:13 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156d41desm4180582a12.27.2024.12.07.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 20/24] drm/msm: Add mmu support for non-zero offset
Date: Sat,  7 Dec 2024 08:15:20 -0800
Message-ID: <20241207161651.410556-21-robdclark@gmail.com>
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

Only needs to be supported for iopgtables mmu, the other cases are
either only used for kernel managed mappings (where offset is always
zero) or devices which do not support sparse bindings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c |  5 ++++-
 drivers/gpu/drm/msm/msm_gem.c            |  4 ++--
 drivers/gpu/drm/msm/msm_gem.h            |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c        | 13 +++++++------
 drivers/gpu/drm/msm/msm_iommu.c          | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_mmu.h            |  2 +-
 6 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 39641551eeb6..6124336af2ec 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -29,13 +29,16 @@ static void a2xx_gpummu_detach(struct msm_mmu *mmu)
 }
 
 static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			   struct sg_table *sgt, size_t off, size_t len,
+			   int prot)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
 
+	WARN_ON(off != 0);
+
 	if (prot & IOMMU_WRITE)
 		prot_bits |= 1;
 	if (prot & IOMMU_READ)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7cc4b8955687..b6bad702e0c8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -434,7 +434,7 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
+		vma = msm_gem_vma_new(vm, obj, 0, range_start, range_end);
 	} else {
 		GEM_WARN_ON(vma->va.addr < range_start);
 		GEM_WARN_ON((vma->va.addr + obj->size) > range_end);
@@ -472,7 +472,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	return msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
+	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a00149d66d37..71499ec60a5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -140,9 +140,9 @@ struct msm_gem_vma {
 
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end);
+		u64 offset, u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct drm_gpuva *vma);
-int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt, int size);
+int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
 struct msm_gem_object {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 2160d492a999..035d29623519 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -38,8 +38,7 @@ void msm_gem_vma_purge(struct drm_gpuva *vma)
 
 /* Map and pin vma: */
 int
-msm_gem_vma_map(struct drm_gpuva *vma, int prot,
-		struct sg_table *sgt, int size)
+msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
@@ -62,8 +61,9 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt, size, prot);
-
+	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
+				  vma->gem.offset, vma->va.range,
+				  prot);
 	if (ret) {
 		msm_vma->mapped = false;
 	}
@@ -97,7 +97,7 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 /* Create a new vma and allocate an iova for it */
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end)
+		u64 offset, u64 range_start, u64 range_end)
 {
 	struct msm_gem_vm *vm = to_msm_vm(_vm);
 	struct drm_gpuvm_bo *vm_bo;
@@ -109,6 +109,7 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 		return ERR_PTR(-ENOMEM);
 
 	if (vm->managed) {
+		BUG_ON(offset != 0);
 		spin_lock(&vm->mm_lock);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
@@ -124,7 +125,7 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 
 	GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
+	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
 
 	mutex_lock(&vm->vm_lock);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f9..41cb629e25f3 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -113,7 +113,8 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 }
 
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
-		struct sg_table *sgt, size_t len, int prot)
+				   struct sg_table *sgt, size_t off, size_t len,
+				   int prot)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
@@ -125,6 +126,19 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
+		if (!len)
+			break;
+
+		if (size <= off) {
+			off -= size;
+			continue;
+		}
+
+		phys += off;
+		size -= off;
+		size = min_t(size_t, size, len);
+		off = 0;
+
 		while (size) {
 			size_t pgsize, count, mapped = 0;
 			int ret;
@@ -140,6 +154,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			phys += mapped;
 			addr += mapped;
 			size -= mapped;
+			len  -= mapped;
 
 			if (ret) {
 				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
@@ -359,11 +374,14 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 }
 
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			 struct sg_table *sgt, size_t off, size_t len,
+			 int prot)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
+	WARN_ON(off != 0);
+
 	/* The arm-smmu driver expects the addresses to be sign extended */
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881..45f928671e3f 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -12,7 +12,7 @@
 struct msm_mmu_funcs {
 	void (*detach)(struct msm_mmu *mmu);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
-			size_t len, int prot);
+			size_t off, size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
 	void (*resume_translation)(struct msm_mmu *mmu);
-- 
2.47.1


