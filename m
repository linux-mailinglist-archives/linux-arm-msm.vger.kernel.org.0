Return-Path: <linux-arm-msm+bounces-51994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBEA6927F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E84E8A4B85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B8D219EA5;
	Wed, 19 Mar 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnlB2JSV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8445C211715;
	Wed, 19 Mar 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396150; cv=none; b=i3APBjE6r9xVNg0mlMFeaAI/9DfA0jkYXLlaWByReRNh9dl6xZO/8X5egcc0iaTBH6hZqZW6hh5aKcbDNzOV/85F3SwpWUQmWWzceUNE8rO34FVxMUcLm7awDU9BYZgLYWiwVXFBChqCafdLUqxE/cTmlMWYt80wLP1EvFYe5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396150; c=relaxed/simple;
	bh=VywkRH36PUkOix/NxRNrDuKvZQG7BxYGapOk1mZMPJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJazie43+ch5d0meMnsmRSYna5FYmOfSliHfGSPRLGqcDw5qjo56N1MylQA6ppakpcQetJYYjuF8oBekvDaACBo1DBCrPV7VYseh5MGSTH1yDIk4tdkUK0qNyQygL7lv6LlsCMdLNaLSXswYb1SDaiZinvhwgYC0oL6XO20s8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnlB2JSV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22398e09e39so153797295ad.3;
        Wed, 19 Mar 2025 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396148; x=1743000948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8+zPwPf6DFamv9kvd5m//5hO8beo2yPdyaSE+SMRQ4=;
        b=nnlB2JSVDOxOohaTPC4EXe9u5tdlr/qM5ILck74W5YM+thNzQNuTgazrJ9GJoHfFqC
         0Fws3T0LVYtYDmYQaiVgALCcHl1T7hZEWhd6rkzJzi+oofzvxbBxHkzwsd+b8p/MV6fV
         rbkQ3A0u0elvRze3H6xyM4d+1XOFSj7iA7laHI+E4HTYiS+hOGKRYLq0/HgQVD4zNjQr
         OJMfZW6q2kkS9+1oYbXjNQYtAYohq4S3FutZHzVGtL4wUL31el9YvM3RbffraPcGmSYU
         yZVYmNZ3EF2nH2LwviCARo2bqQ47rrwz/Ui8cQ0R/N25WZ9OB6X3Av6ifEn3jy2Em3gu
         j1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396148; x=1743000948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8+zPwPf6DFamv9kvd5m//5hO8beo2yPdyaSE+SMRQ4=;
        b=EVxRCsIg08XZi+XVJjX25ocW/z5HPyMffNi9WZe0l0087SkgoigCi4hc2VmErJgWtK
         pcBmN0DYBU20b2+Cqixw8CkxI/Q9p29/8bVl5AqslucB6MCe4XvndF2NW8/iYBfgzn5f
         OkvBE+i7QH9DD8G5Wv3mEBMBTg21XtK9phUXP6+ueOcsxOHhc3EQF8U4+/MdsCIxFivX
         0YV5HVLp/4OU6V9p4JTSiqB9iWW698kCRk/SWGY0u8j67y49jNDkXJ/davkJZLcYV9eZ
         jgyI0Vf5/wsfG6tC2EGzbh5c2s0Lba7fM9q501yiekMY3khpv9F5zE+TSLtighG0d9Ze
         temA==
X-Forwarded-Encrypted: i=1; AJvYcCW0M4INGY1XAyMWKib4C01PBerXYMDYc3hE2Gpa0lHoFfaJ6sGpGKXGWUAWeZn+Z7TDO/WsdayP7yQCQ8Ll@vger.kernel.org, AJvYcCX4f3oVGoMVE9s2HecLgcitdG64+VJz9BDe9oJCTVNWrnl3b+YWRWXuKHJshJ5ErVTr22szFtFLyO1cAc+k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5eijmAyRcYWi+Ipm4NqWuIHaemhCene2v9PVoosGrqO3UNwa6
	8L2jWGPM88oz/6LrxvDz993ydoIJDj+XT3UJpaQzstLc9LWugxVEgldS/g==
X-Gm-Gg: ASbGncu93vU+etXTNrkHbUHDDjFC4liE8LtqiJ/ZpCD7OkngWRXrHr3+SsZ0QQ37YU8
	PUJujZjS6QauPl39A6mD8JQuwqEfNTJcA56bdU2x2uWlHMgoc3wgtZbFp7+WF0268FMrJdaR7wx
	TNYg2dMDpzB/u0H6R/R1fjkfocrOJeapLr78f91mqSSRaUTSCpg8JSv7N0f6njMta6GLIj7mdvN
	aJ7yX8+ZCwG3yaGQiCd2F2lsvbSyp49RE3CCWTVKqrjKeDu7EsB8W6E5n8SIzmylmauoXZ2qe6Z
	n7bQo2ASRrwv+twXL6j9Z3AWJ+WjJOAgt1raQsLIsSZXi2ld+UANnUgJ8TKQbEM4tud4g+6FKBG
	2tSgrBseaATTYwmYvcOs=
X-Google-Smtp-Source: AGHT+IHiqo+qawMmux5rf8+b3xJRoCuA1P23oR0ah0wr7xAD/8HYKD0QG4mticK1SAzdlYmjYI1XvA==
X-Received: by 2002:a05:6a21:3987:b0:1f5:9330:2a18 with SMTP id adf61e73a8af0-1fbebc85602mr4728730637.23.1742396147805;
        Wed, 19 Mar 2025 07:55:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73730ca057csm8445640b3a.48.2025.03.19.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v2 21/34] drm/msm: Add mmu support for non-zero offset
Date: Wed, 19 Mar 2025 07:52:33 -0700
Message-ID: <20250319145425.51935-22-robdclark@gmail.com>
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
index 632f560c81ec..577da3c54c8c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -441,7 +441,7 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
+		vma = msm_gem_vma_new(vm, obj, 0, range_start, range_end);
 	} else {
 		GEM_WARN_ON(vma->va.addr < range_start);
 		GEM_WARN_ON((vma->va.addr + obj->size) > range_end);
@@ -483,7 +483,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	return msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
+	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7ccdf15476b9..3919b384d599 100644
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
index 8c780dd6a936..d51d54c0da33 100644
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
index e70088a91283..2fd48e66bc98 100644
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
@@ -400,11 +415,14 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
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
index c33247e459d6..c874852b7331 100644
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
2.48.1


