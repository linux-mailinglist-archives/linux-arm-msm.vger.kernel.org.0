Return-Path: <linux-arm-msm+bounces-51995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B31A6922A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 035907A6703
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC58921ABA0;
	Wed, 19 Mar 2025 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ/qJ446"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDCE219E8C;
	Wed, 19 Mar 2025 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396151; cv=none; b=fqEwBGwo0Tc4lzwyjx+9qgvKdjZnwR5EckJtFIIbdkpn4ZtQnX86OUTA4d8GKQcrSrSXzEtDd1Rceh1ygGFUFTeB74MkIlxI9U9o5lgD3h6Qw+T5sVWUtRVmijKFIlxOuelH7ChQ27aSl5DhH0odRP+0hc1YsOlghMEnJpDZpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396151; c=relaxed/simple;
	bh=2jldU7p0sEc3/rDueFhZhuvGaxYdW8GFjUP65QuVYGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pmoo3ODwtL+YD2Di/PcYH+OMoZnXtiBtx/0FomBiyb0WMh52BLsMbK7gVqg4a24xtG+9lt6gzEXAFK81W/bgXIKNX/GRj/Fy23Pi7N41OX0Q/l0M74u3IgE6A6uynCBLqHBdsIIPqqJpatnxbAzLRuhoSd4sSyzDtDBQ5dSZh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ/qJ446; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223594b3c6dso153301105ad.2;
        Wed, 19 Mar 2025 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396149; x=1743000949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M81I/o3InSDYy6U6TKbMU3g38x1txBgAg5RvAUkv+pg=;
        b=PQ/qJ446ttWpqqsdvS8uGFc2BwdQs0bk0keZ+ZbeVGotMljJkH5CzonIvK8AaIA53a
         JVGhW93jGpBn9YQTEsQa5XkxepHfowoD7mdQx/RFQ/RJmaDz3xa68dfGXN5NE1lfdWQx
         A8bPetH0A/0g8+Z60LN4bbAzGJjU2hzdid03Z/x1omj3NAiLUjR6Wef8rJ8O8v2amG8Z
         3Q5p233iCEs6Q0il7rqmhTciEMzog2q0dFeWtG6Omp/g018ijsGEHe2uzIvXGcoxZBDf
         YfOAvzNFRHJqUY9VsNk+OcTij7UfpMH0pYkHCjAPP/jjRa0nrS15TGDdG39WRWDzj9vR
         7Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396149; x=1743000949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M81I/o3InSDYy6U6TKbMU3g38x1txBgAg5RvAUkv+pg=;
        b=s49MF6OloZdSipd5qbJe57yZXHn78hIysI+sGe1YBeqIVn8JCrDsWWErIr0wCjP4za
         OYBLK8r09Ukx2xUs2qw9CI+7sW6an7ttzoX/uQ/v9JlgJba3jZNSjnUFszDvRNBBW+0Y
         rGbLRvuEYz0m5qdIPt0taSLI/cUbfYV9QSWRAICQaU5Wdgamo9TrM6quuW9P0HsWWlJv
         aw93EUWjmEGAEDmnkYltrbZ4LxC70bgmEC8MbrSe/TAHJktcqHPnC6mwtAIKZ1h6UIoo
         404xGsG2H4HiXkU7qHm4s4nbrgvP5WQtJ7T6LtLLgJJgen6Q4ZgEknBdLGh9mriUriq7
         DbUg==
X-Forwarded-Encrypted: i=1; AJvYcCURLyMcPwue0xygUdpz4TiPJ8DQDqgC4yukpbzxvazwZiudBcomWs1c3+4j1J8Rup502DDJZEbecudi6iPp@vger.kernel.org, AJvYcCUXrODaI9YwV0vTV8P+mPwsw2Fz0Y8yv9EL77XgbqHXUm9W4IPda8jYXuZG3sIsblwK+FtLldIw//ZzI9o5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rF8esHQ/gwKG3YG5I4etLR1tBoZaeDtcY8672mjK5U95ESqk
	l0IuuVJH8Qv7b0wJfApUPNaQrJ1Omoa/XGa5/l48auw7n1i6/dbg
X-Gm-Gg: ASbGncv0kBHuKOMuB/EHxa8ouOHq49P5s/5YAeBuEKzQ/9PUj4QFEDlerHRdTjTldWA
	J1tYkUWBMBggAHOPNw0Y2LpPMo89cG50WfbyERyQU1IJj6EXmMk+Hev1PWHRXt8zQAaUX4DMQE+
	mL2YxJMmWOA79y7f4IS3Gw4AHtOeViqVG2JiiyZRww+HW0B0pVpSsi5vNTtZ542HjON7u5O42TW
	hl1EqihpQTgvsgj7fF2ZY5oOXmhkpvIVGwNbHvIsNk8Fs/Bs9uUchT2f+grAtOhZqNlAtKXzhBv
	vhkpX4snNy/SxVycRQbi69vm7GOmVkQp6XLiy4SsjNGGXYLVoINlWc/pnYsNbkU1IQuT2ul5Bga
	0tGpfL+W+coGlCr8UHQM=
X-Google-Smtp-Source: AGHT+IF/rBOn7CqfMuc/KHKbW4bZ3JRjCbiml1XOPHu0OqpiWKiawVfBn9/M7JSM5193+QVVydJyFg==
X-Received: by 2002:a17:902:f64d:b0:224:1157:6d26 with SMTP id d9443c01a7336-2264992842fmr55429405ad.4.1742396149344;
        Wed, 19 Mar 2025 07:55:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d5dsm115202375ad.153.2025.03.19.07.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:48 -0700 (PDT)
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 22/34] drm/msm: Add PRR support
Date: Wed, 19 Mar 2025 07:52:34 -0700
Message-ID: <20250319145425.51935-23-robdclark@gmail.com>
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

Add PRR (Partial Resident Region) is a bypass address which make GPU
writes go to /dev/null and reads return zero.  This is used to implement
vulkan sparse residency.

To support PRR/NULL mappings, we allocate a page to reserve a physical
address which we know will not be used as part of a GEM object, and
configure the SMMU to use this address for PRR/NULL mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 739161df3e3c..bac6cd3afe37 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -346,6 +346,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
+static bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
@@ -431,6 +438,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;
 		return 0;
+	case MSM_PARAM_HAS_PRR:
+		*value = adreno_smmu_has_prr(gpu);
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2fd48e66bc98..756bd55ee94f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -13,6 +13,7 @@ struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
 	atomic_t pagetables;
+	struct page *prr_page;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -112,6 +113,36 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 	return (size == 0) ? 0 : -EINVAL;
 }
 
+static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	phys_addr_t phys = page_to_phys(iommu->prr_page);
+	u64 addr = iova;
+
+	while (len) {
+		size_t mapped = 0;
+		size_t size = PAGE_SIZE;
+		int ret;
+
+		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
+
+		/* map_pages could fail after mapping some of the pages,
+		 * so update the counters before error handling.
+		 */
+		addr += mapped;
+		len  -= mapped;
+
+		if (ret) {
+			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 				   struct sg_table *sgt, size_t off, size_t len,
 				   int prot)
@@ -122,6 +153,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
 	for_each_sgtable_sg(sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
@@ -177,9 +211,16 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0)
+	if (atomic_dec_return(&iommu->pagetables) == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
+		if (adreno_smmu->set_prr_bit) {
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
+			__free_page(iommu->prr_page);
+			iommu->prr_page = NULL;
+		}
+	}
+
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
 }
@@ -336,6 +377,25 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 			kfree(pagetable);
 			return ERR_PTR(ret);
 		}
+
+		BUG_ON(iommu->prr_page);
+		if (adreno_smmu->set_prr_bit) {
+			/*
+			 * We need a zero'd page for two reasons:
+			 *
+			 * 1) Reserve a known physical address to use when
+			 *    mapping NULL / sparsely resident regions
+			 * 2) Read back zero
+			 *
+			 * It appears the hw drops writes to the PRR region
+			 * on the floor, but reads actually return whatever
+			 * is in the PRR page.
+			 */
+			iommu->prr_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			adreno_smmu->set_prr_addr(adreno_smmu->cookie,
+						  page_to_phys(iommu->prr_page));
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
+		}
 	}
 
 	/* Needed later for TLB flush */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a7e48ee1dd95..48bc0374e2ae 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -115,6 +115,8 @@ struct drm_msm_timespec {
  * ioctl will throw -EPIPE.
  */
 #define MSM_PARAM_EN_VM_BIND 0x15  /* WO, once */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x16  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.48.1


