Return-Path: <linux-arm-msm+bounces-52000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88AA6928D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8159C4800F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659C321D3CD;
	Wed, 19 Mar 2025 14:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjHdRAs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6321CC6D;
	Wed, 19 Mar 2025 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396161; cv=none; b=eyLtzqTWItgfrgVvD3JDAj/11RabE5e63gK1NkYKqt9mvNHL4oBn3iPus6Mp/uKCe16qYYGDkPlqV6WLNn7o2Kox0/jzjn5/H1xxb8Qa69gfRhGTSAD/Z+3q8uvA4yVIuJBTwD5rWSgm7IM7zQJofexVJHLUfG9NV0DaMpe22pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396161; c=relaxed/simple;
	bh=ekdgcBAS0ggm2+xP926PED2wwIrwSL8aP+1AtstrJ9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omDFrTp5ZGCvnDRHBHLU7lIOLNlOrEgkNoOkewy9VQn0G9MhOUDztoOo/OuqQ871uwl8YrR39fDnyXvTAKcOSIVd9AnA0yxv46hPkgLnSdv3fkPwYDnxt/8+fpzo9dsT1nFtR9Odb/edbckRRXfUwQ61yeBDd0ZcFXBGM9QUsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjHdRAs2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240b4de12bso46467095ad.2;
        Wed, 19 Mar 2025 07:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396159; x=1743000959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyO6kdDDIQqJK9TGT4jcPv5A3omBF22Bq6SHdz7luwA=;
        b=ZjHdRAs2Rs3S/k3lxM4QlrkgkpYya9TeZPyPbJX7Za063Zv52uV9Ycz3o0NMFERFWm
         2WoT2L8g4RoAyl8DOjNoIudMKr1TkeqF0Bq+SGxbG6wz3BeOSzfgZq1otMaMl3AA9klG
         MUC4tGo49CmbwSFJerl5U+4ctrpdc4cxj1DBTABCrNFgd8IEmHFgku6Tub0zcq15icrf
         JdrqTpqtSiSnsxwo7NJw3GznIWlciVDMIwrdEk22NycvbxyAUI6UPneN7qyeAhwX/RmT
         1e28CyawTrbitWWuyoo+rPZZ3f5tZO5+vNlM0BIDQjFhl6APMYtfYTJ+SiUFMYgFh4PC
         4Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396159; x=1743000959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyO6kdDDIQqJK9TGT4jcPv5A3omBF22Bq6SHdz7luwA=;
        b=jnItHFFt+pmgZOAm+zEr9VRQENJhOFiUSeAspa+9YJnWG5UrDPedrmesyznv+T9mx1
         JvsjqzxIqDag9XJM2G0AAlzziOaOWXhViQHbNEzQ7Iyx43sd2DgAA1qV5Hm/0cR+2Xlu
         ng71X4rAg5G1DTI7Ar1Ais3j4dTKXOXnQxDMIdmGhUZXMDSQOTfsCM/MtEddAXgw9V4+
         AuoZOvwqasDqRgkuDUQExTrkCbnXQWudhhbIxDb7shd+5lo2S4lBHmRSP9gkCgRXSm1n
         gSTsHD81Z8Cigen7KJOcvevB4Yfj+/CqT0FbnSQZlODkMeCIyDUGzZY8Cmm1JdpoCaLK
         n/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0p6/yMQ2/Jvl9gDJufFcIZmqKcMvid4DAoLZOBoy9VbucdDngAk61/4kHCAsZweUFU1Op98h4ALW8mpMa@vger.kernel.org, AJvYcCUkg3sr/NzpwvdLi2Vn/cOF0XZrGf3nrAi7VfoPSB93w7e+5hDbbnaLdLfBn79FZNRYb7F2S9LKmS3+QbqN@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdSeyOhIaMtfgDuNxb8Hht/h0UChj7XEmt4DFmlx4xz+MsFCd
	cq6/AO1J5KUQ/nPE/IrEsugm4O5hlzIfSIdKjHqmGAMdAPHrQIF/
X-Gm-Gg: ASbGncsiL/Az6Iowez+vOy1tTgPieK+F7YC/rPkA8jUHXsAeuWnpaVZ5jNf9wTqBt2B
	J8eEX63eoI/0yzm7PnWC14gcnn3aFIrz9dIFUWrVnLqEWQPs1xdKFjHTBmxjaM00yIHuk2W75D+
	xXLqeGoubSkuP4Ht9cuI50YAIO8Hd8EdY7RrQePqcaNYeZm7g3rDSUVpag6G17HAY/a6heIaUyJ
	xXdg0FMRkKMXZbje2LqRAxCq1QXqhklCvlQsdTdpQDR8Z2YC95A/2bDnuCCKHjeE8HvOHyThP3k
	5oyR2i2P1OBLJV2UmQQgLqxsvZIBkBPYoK6nOED2xn27+wq3h/lmAC23XZ7hgfw5wI+yXv3bL1o
	DGf6TSqYVB3BqcO3S+SE=
X-Google-Smtp-Source: AGHT+IH6q5hAIc9t3N2nh4KbWjpJ3bsjbKbZog07bzbek/wCl7nglfjUn21b9XL9FzZ3ul4wkgb/gw==
X-Received: by 2002:a17:902:c40a:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-2264981d956mr47600395ad.4.1742396158377;
        Wed, 19 Mar 2025 07:55:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4e8dsm114677535ad.228.2025.03.19.07.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:57 -0700 (PDT)
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
Subject: [PATCH v2 27/34] drm/msm: Pre-allocate pages for pgtable entries
Date: Wed, 19 Mar 2025 07:52:39 -0700
Message-ID: <20250319145425.51935-28-robdclark@gmail.com>
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

Introduce a mechanism to count the worst case # of pages required in a
VM_BIND op.

Note that previously we would have had to somehow account for
allocations in unmap, when splitting a block.  This behavior was removed
in commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
behavior)"

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   2 +-
 drivers/gpu/drm/msm/msm_gem.h         |   7 +-
 drivers/gpu/drm/msm/msm_gem_submit.c  |   5 +-
 drivers/gpu/drm/msm/msm_gem_vma.c     |  18 ++-
 drivers/gpu/drm/msm/msm_iommu.c       | 201 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h         |  36 ++++-
 6 files changed, 260 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ca3247f845b5..9f66ad5bf0dc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d2ffaa11ec1a..117f0e35e628 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_GEM_H__
 #define __MSM_GEM_H__
 
+#include "msm_mmu.h"
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 #include "drm/drm_exec.h"
@@ -115,7 +116,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
 
-void msm_vma_job_prepare(struct msm_gem_submit *submit);
+int msm_vma_job_prepare(struct msm_gem_submit *submit);
 void msm_vma_job_cleanup(struct msm_gem_submit *submit);
 
 struct msm_fence_context;
@@ -348,6 +349,10 @@ struct msm_gem_submit {
 	 */
 	struct list_head preallocated_vmas;
 
+	/* Tracking for pre-allocated pgtable pages.
+	 */
+	struct msm_mmu_prealloc prealloc;
+
 	struct pid *pid;    /* submitting process */
 	bool bos_pinned : 1;
 	bool fault_dumped:1;/* Limit devcoredump dumping to one per submit */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a9b3e6692db3..ed0265ac4e1d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -916,8 +916,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (submit_is_vmbind(submit)) {
-		msm_vma_job_prepare(submit);
-		ret = submit_get_pages(submit);
+		ret = msm_vma_job_prepare(submit);
+		if (!ret)
+			ret = submit_get_pages(submit);
 	} else {
 		ret = submit_pin_vmas(submit);
 	}
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index b1808d95002f..554ec93456a0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -270,9 +270,10 @@ static const struct drm_sched_backend_ops msm_vm_bind_ops = {
  *
  * Called after BOs are locked.
  */
-void
+int
 msm_vma_job_prepare(struct msm_gem_submit *submit)
 {
+	struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 	unsigned num_prealloc_vmas = 0;
 
 	for (int i = 0; i < submit->nr_bos; i++) {
@@ -299,13 +300,23 @@ msm_vma_job_prepare(struct msm_gem_submit *submit)
 		 * OP_UNMAP could trigger a remap with either a prev or
 		 * next VMA, but not both.
 		 */
-		num_prealloc_vmas += (op == MSM_SUBMIT_BO_OP_UNMAP) ? 1 : 3;
+		if (op != MSM_SUBMIT_BO_OP_UNMAP) {
+			num_prealloc_vmas += 3;
+
+			mmu->funcs->prealloc_count(mmu, &submit->prealloc,
+				submit->bos[i].iova,
+				submit->bos[i].range);
+		} else {
+			num_prealloc_vmas += 1;
+		}
 	}
 
 	while (num_prealloc_vmas-- > 0) {
 		struct msm_gem_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 		list_add_tail(&vma->base.rb.entry, &submit->preallocated_vmas);
 	}
+
+	return mmu->funcs->prealloc_allocate(mmu, &submit->prealloc);
 }
 
 /**
@@ -317,6 +328,7 @@ msm_vma_job_prepare(struct msm_gem_submit *submit)
 void
 msm_vma_job_cleanup(struct msm_gem_submit *submit)
 {
+	struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 	struct drm_gpuva *vma;
 
 	for (int i = 0; i < submit->nr_bos; i++) {
@@ -331,6 +343,8 @@ msm_vma_job_cleanup(struct msm_gem_submit *submit)
 		list_del(&vma->rb.entry);
 		kfree(to_msm_vma(vma));
 	}
+
+	mmu->funcs->prealloc_cleanup(mmu, &submit->prealloc);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..ff04f2451d1d 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -6,6 +6,7 @@
 
 #include <linux/adreno-smmu-priv.h>
 #include <linux/io-pgtable.h>
+#include <linux/kmemleak.h>
 #include "msm_drv.h"
 #include "msm_mmu.h"
 
@@ -14,6 +15,8 @@ struct msm_iommu {
 	struct iommu_domain *domain;
 	atomic_t pagetables;
 	struct page *prr_page;
+
+	struct kmem_cache *pt_cache;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -27,6 +30,12 @@ struct msm_iommu_pagetable {
 	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
 	phys_addr_t ttbr;
 	u32 asid;
+
+	/** @root_page_table: Stores the root page table pointer. */
+	void *root_page_table;
+
+	/** @tblsz: pt table entry size */
+	size_t tblsz;
 };
 static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
 {
@@ -273,7 +282,145 @@ msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[
 	return 0;
 }
 
+static void
+msm_iommu_pagetable_prealloc_count(struct msm_mmu *mmu, struct msm_mmu_prealloc *p,
+				   uint64_t iova, size_t len)
+{
+	u64 pt_count;
+
+	/*
+	 * L1, L2 and L3 page tables.
+	 *
+	 * We could optimize L3 allocation by iterating over the sgt and merging
+	 * 2M contiguous blocks, but it's simpler to over-provision and return
+	 * the pages if they're not used.
+	 *
+	 * The first level descriptor (v8 / v7-lpae page table format) encodes
+	 * 30 bits of address.  The second level encodes 29.  For the 3rd it is
+	 * 39.
+	 *
+	 * https://developer.arm.com/documentation/ddi0406/c/System-Level-Architecture/Virtual-Memory-System-Architecture--VMSA-/Long-descriptor-translation-table-format/Long-descriptor-translation-table-format-descriptors?lang=en#BEIHEFFB
+	 */
+	pt_count = ((ALIGN(iova + len, 1ull << 39) - ALIGN_DOWN(iova, 1ull << 39)) >> 39) +
+		   ((ALIGN(iova + len, 1ull << 30) - ALIGN_DOWN(iova, 1ull << 30)) >> 30) +
+		   ((ALIGN(iova + len, 1ull << 21) - ALIGN_DOWN(iova, 1ull << 21)) >> 21);
+
+	p->count += pt_count;
+}
+
+static struct kmem_cache *
+get_pt_cache(struct msm_mmu *mmu)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	return to_msm_iommu(pagetable->parent)->pt_cache;
+}
+
+static int
+msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_prealloc *p)
+{
+	struct kmem_cache *pt_cache = get_pt_cache(mmu);
+	int ret;
+
+	p->pages = kcalloc(p->count, sizeof(p->pages), GFP_KERNEL);
+	if (!p->pages)
+		return -ENOMEM;
+
+	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, p->count, p->pages);
+	if (ret != p->count) {
+		p->count = ret;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void
+msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_prealloc *p)
+{
+	struct kmem_cache *pt_cache = get_pt_cache(mmu);
+	uint32_t remaining_pt_count = p->count - p->ptr;
+
+	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
+	kfree(p->pages);
+}
+
+/**
+ * alloc_pt() - Custom page table allocator
+ * @cookie: Cookie passed at page table allocation time.
+ * @size: Size of the page table. This size should be fixed,
+ * and determined at creation time based on the granule size.
+ * @gfp: GFP flags.
+ *
+ * We want a custom allocator so we can use a cache for page table
+ * allocations and amortize the cost of the over-reservation that's
+ * done to allow asynchronous VM operations.
+ *
+ * Return: non-NULL on success, NULL if the allocation failed for any
+ * reason.
+ */
+static void *
+msm_iommu_pagetable_alloc_pt(void *cookie, size_t size, gfp_t gfp)
+{
+	struct msm_iommu_pagetable *pagetable = cookie;
+	struct msm_mmu_prealloc *p = pagetable->base.prealloc;
+	void *page;
+
+	/* Allocation of the root page table happening during init. */
+	if (unlikely(!pagetable->root_page_table)) {
+		struct page *p;
+
+		p = alloc_pages_node(dev_to_node(pagetable->iommu_dev),
+				     gfp | __GFP_ZERO, get_order(size));
+		page = p ? page_address(p) : NULL;
+		pagetable->root_page_table = page;
+		return page;
+	}
+
+	if (WARN_ON(!p) || WARN_ON(p->ptr >= p->count))
+		return NULL;
+
+	page = p->pages[p->ptr++];
+	memset(page, 0, size);
+
+	/*
+	 * Page table entries don't use virtual addresses, which trips out
+	 * kmemleak. kmemleak_alloc_phys() might work, but physical addresses
+	 * are mixed with other fields, and I fear kmemleak won't detect that
+	 * either.
+	 *
+	 * Let's just ignore memory passed to the page-table driver for now.
+	 */
+	kmemleak_ignore(page);
+
+	return page;
+}
+
+
+/**
+ * free_pt() - Custom page table free function
+ * @cookie: Cookie passed at page table allocation time.
+ * @data: Page table to free.
+ * @size: Size of the page table. This size should be fixed,
+ * and determined at creation time based on the granule size.
+ */
+static void
+msm_iommu_pagetable_free_pt(void *cookie, void *data, size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = cookie;
+
+	if (unlikely(pagetable->root_page_table == data)) {
+		free_pages((unsigned long)data, get_order(size));
+		pagetable->root_page_table = NULL;
+		return;
+	}
+
+	kmem_cache_free(get_pt_cache(&pagetable->base), data);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
+		.prealloc_count = msm_iommu_pagetable_prealloc_count,
+		.prealloc_allocate = msm_iommu_pagetable_prealloc_allocate,
+		.prealloc_cleanup = msm_iommu_pagetable_prealloc_cleanup,
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
 		.destroy = msm_iommu_pagetable_destroy,
@@ -324,7 +471,19 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+
+static size_t get_tblsz(const struct io_pgtable_cfg *cfg)
+{
+	int pg_shift, bits_per_level;
+
+	pg_shift = __ffs(cfg->pgsize_bitmap);
+	/* arm_lpae_iopte is u64: */
+	bits_per_level = pg_shift - ilog2(sizeof(u64));
+
+	return sizeof(u64) << bits_per_level;
+}
+
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +517,36 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		/*
+		 * With userspace managed VM (aka VM_BIND), we need to pre-
+		 * allocate pages ahead of time for map/unmap operations,
+		 * handing them to io-pgtable via custom alloc/free ops as
+		 * needed:
+		 */
+		ttbr0_cfg.alloc = msm_iommu_pagetable_alloc_pt;
+		ttbr0_cfg.free  = msm_iommu_pagetable_free_pt;
+
+		pagetable->tblsz = get_tblsz(&ttbr0_cfg);
+
+		/*
+		 * Restrict to single page granules.  Otherwise we may run
+		 * into a situation where userspace wants to unmap/remap
+		 * only a part of a larger block mapping, which is not
+		 * possible without unmapping the entire block.  Which in
+		 * turn could cause faults if the GPU is accessing other
+		 * parts of the block mapping.
+		 *
+		 * Note that prior to commit 33729a5fc0ca ("iommu/io-pgtable-arm:
+		 * Remove split on unmap behavior)" this was handled in
+		 * io-pgtable-arm.  But this apparently does not work
+		 * correctly on SMMUv3.
+		 */
+		WARN_ON(!(ttbr0_cfg.pgsize_bitmap & PAGE_SIZE));
+		ttbr0_cfg.pgsize_bitmap = PAGE_SIZE;
+	}
+
+	pagetable->iommu_dev = ttbr1_cfg->iommu_dev;
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
@@ -401,7 +590,6 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
 	pagetable->tlb = ttbr1_cfg->tlb;
-	pagetable->iommu_dev = ttbr1_cfg->iommu_dev;
 	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
 
@@ -509,6 +697,7 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	iommu_domain_free(iommu->domain);
+	kmem_cache_destroy(iommu->pt_cache);
 	kfree(iommu);
 }
 
@@ -583,6 +772,14 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
+	if (adreno_smmu && adreno_smmu->cookie) {
+		const struct io_pgtable_cfg *cfg =
+			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
+		size_t tblsz = get_tblsz(cfg);
+
+		iommu->pt_cache =
+			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
+	}
 	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
 
 	/* Enable stall on iommu fault: */
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c874852b7331..24ef04d267a6 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -9,8 +9,16 @@
 
 #include <linux/iommu.h>
 
+struct msm_mmu_prealloc;
+struct msm_mmu;
+struct msm_gpu;
+
 struct msm_mmu_funcs {
 	void (*detach)(struct msm_mmu *mmu);
+	void (*prealloc_count)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p,
+			       uint64_t iova, size_t len);
+	int (*prealloc_allocate)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p);
+	void (*prealloc_cleanup)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
 			size_t off, size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
@@ -25,12 +33,38 @@ enum msm_mmu_type {
 	MSM_MMU_IOMMU_PAGETABLE,
 };
 
+/**
+ * struct msm_mmu_prealloc - Tracking for pre-allocated pages for MMU updates.
+ */
+struct msm_mmu_prealloc {
+	/** @count: Number of pages reserved. */
+	uint32_t count;
+	/** @ptr: Index of first unused page in @pages */
+	uint32_t ptr;
+	/**
+	 * @pages: Array of pages preallocated for MMU table updates.
+	 *
+	 * After a VM operation, there might be free pages remaining in this
+	 * array (since the amount allocated is a worst-case).  These are
+	 * returned to the pt_cache at mmu->prealloc_cleanup().
+	 */
+	void **pages;
+};
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
 	void *arg;
 	enum msm_mmu_type type;
+
+	/**
+	 * @prealloc: pre-allocated pages for pgtable
+	 *
+	 * Set while a VM_BIND job is running, serialized under
+	 * msm_gem_vm::op_lock.
+	 */
+	struct msm_mmu_prealloc *prealloc;
 };
 
 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
@@ -52,7 +86,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.48.1


