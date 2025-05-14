Return-Path: <linux-arm-msm+bounces-57918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C407AB73D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 881347A40F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFC628D83B;
	Wed, 14 May 2025 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leHjV6d7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5860028CF5C;
	Wed, 14 May 2025 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245413; cv=none; b=BvIRuq+5ZHbbcD3QzZ0XbRGioCP7BIpsE0e1nHDLucncNujyPRUGYfrZU0/1a+2IR0PZd/jBLSYI/1AKDwkL997TIKg1IZsC4Gjt8EZ1Lz5Ia1K07/X2HTydhqdf/h90seWUhYWKbRr1pZz5Peoe8uIn2nAQjLwhIynqxRx7uPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245413; c=relaxed/simple;
	bh=rH1Y0P/mYt4SZmCD1nX4b0DhSA9485S88+aHY0M2W2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDocUqB1ExaMDKswpKxKe5nPjX0FJEmG9sv9kUf6f6t3QsUm7co1YF6JXtupq96aKXy2tGJ/JhbI+/Q+yJgVaM9bEg7zirCsPd+G8LiHNR4JOQUMh63WE4ENnzZ/iYZna+hHPtb/zAFHagNKKd/dXGNEICFfIjLDN91RKQyWxEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leHjV6d7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7426159273fso160254b3a.3;
        Wed, 14 May 2025 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245410; x=1747850210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWkauZa0yTaU6HfxOZ8XJDlmt6hXzhE6mALpbUTIEAY=;
        b=leHjV6d7GuozFO/Mb9PdWVPTuvwfq9lYp1pgvdH64q0IoCL5ebI+0eqxX6VNjnc59i
         ybaOpz8mNwKYA6iWKEmDnD6iUn2bo/M5Bk1/U6bMfFL1dl9rU3xgLmd4sjUB8qYiu1RN
         P+RavvAfqx496a3JTMFVNS8RFascqTQEAoK01OSV+7Wqd5UZzYUzv7Ej5DrYp7lXNFcv
         lY5arHd6VlzkeUSYhAYKgRX9OD4IfrLzyu55hBW/Lz+HvNknmjt/s9jxcQ13GdqUuroP
         2/KzGTXDsgVEwv4pGbU5jFbZanE5ee08WcWLHezxqAamNcMwb8SAhKrAxk0STltZnR1v
         Bacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245410; x=1747850210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWkauZa0yTaU6HfxOZ8XJDlmt6hXzhE6mALpbUTIEAY=;
        b=r7lgv+VmhFA0pg1IjeTtVmdG2qdri0+C1hmRnnPlYoh0IVbI6F/UCjq+PP5xY4sZd7
         h+BiTNa1EG4okA7FzUL813Oh6RXRmcSkmgJRRwTsodVh+7JarC1SmeS6VlS0TsgCupNF
         zMposR0T4pwv/yGb21hZOWz3WKo5VgvDarLDNTaIStAsyuKU3VzI1UZa3pHyWYrykIvS
         cF1LURszTDXxQSqt5Z/igJ+YvZRRhWg2HlxpcMUEL755vkopqwFgihIorgTy0Z027nul
         XTkFXCv3eACKq4Upj8UEMypxEyJZjg6KKm/YtBvaUNZUqQpFNK1kI9RLLmeE6uypzRpc
         i3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWT6Vp1bwDrqjdhyBcdsr2U/xRtXLcqJIRNSkPFEZn8LsgNmcYx1jD3js8YmBvjvePVwiKaXveR4iZea2vl@vger.kernel.org, AJvYcCXnzTvQc4BdIyZaQ62inNWSRpQBIqWDntYmk83sI8mdGSpi+UyF7xw1kQbWp0GpxMXrYNkACUhibYI/ip4W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz9aZWoyXIzaBbzFgLETP7rbwfVZ/1PB9Ey2WDAjfjEmRJsQ75
	YUOthCwXVLijA46h19CyPf6H5iEshJTjeJ9B2ZmInNyD8mbL5yp4
X-Gm-Gg: ASbGncuaWQKtil8aJUosH+HssqdaOSVlDYAO9f/2fqRBmrmW1qb45GtB9w4bFI3Nv3J
	zbbLW09y131/vqvZ60lKirlTnbZfaMuPukhHsoJ7CrWsxHCTCIPiA3YeGZoMcaWs8MbepBiHSEb
	1xWIcyCVYr3EZURPqdKnkwq3uvcU5VXcl9rmk97aF8+cpKs/T2+rOtPcIRIFxYCPJ7zWq2A/f40
	1Kl2x05EyQ/ovotygSGQ0ydavKX1FHqG1dg52/YtNxIWJr6PKQymmCwDzS2IR97P3Q7LNWZFRaG
	Eo8fqBpC2e1+n4ezboYLr0J7Ml49tdrU3I/AdOCosWAnGxE7L8IU+HWN9HxJVTt9Io8sN3uFu0T
	6hAl8Kt7NPZI5S1zt++QHzfGVAw==
X-Google-Smtp-Source: AGHT+IGw58UcStoMDWOLIc01lei+Ym3UYyZG0gMho76u6foKAmas5KwkCAyeoNqXGpYYUrzssVWekw==
X-Received: by 2002:a05:6a00:2d88:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-74289290317mr5425329b3a.10.1747245410495;
        Wed, 14 May 2025 10:56:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a10867sm9855080b3a.110.2025.05.14.10.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:49 -0700 (PDT)
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 18/40] drm/msm: Add PRR support
Date: Wed, 14 May 2025 10:53:32 -0700
Message-ID: <20250514175527.42488-19-robdclark@gmail.com>
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
index b3888a6ac001..cb4ee277721d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -361,6 +361,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
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
@@ -444,6 +451,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index 2342cb90857e..5bc5e4526ccf 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -91,6 +91,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x15  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.49.0


