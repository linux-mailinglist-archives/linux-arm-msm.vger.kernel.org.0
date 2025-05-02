Return-Path: <linux-arm-msm+bounces-56556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B719EAA784D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22F767B91CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361CC26D4E7;
	Fri,  2 May 2025 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFsTazeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750ED26D4D8;
	Fri,  2 May 2025 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205718; cv=none; b=XnxxFXEBhlTICNw5BcVN+Hk+D3VZtGIqDMp7pjrdbZ4X3UxuJG1JnTh6ST99Sx3xWC0rNt3UAtO1Q1GpQckY9KH9OIhGfk/xqWFNrb+FhZ0QHz7jnciry6BchH47iIrQq/Qwz9d6jkXg32w2L7FufrQdg2CvYYOqYmYG/uWrWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205718; c=relaxed/simple;
	bh=rH1Y0P/mYt4SZmCD1nX4b0DhSA9485S88+aHY0M2W2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPqxxZxrfTpsSwb2um6ckWi2tJzQAvreIU9NWA5p7BT5B3+xz0kDjP/xegVkrv+pbslhHx8l6/s1kgM2LN77gyIesWe+BbvnBe8Xwcm2lcPdxbgk+rgCNEgI+Z+Y8tD61T72tHJ+cdT8WAFmsRzAf63MVHSSFtECL+F0b/HqR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFsTazeU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b45cso32465535ad.0;
        Fri, 02 May 2025 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205715; x=1746810515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWkauZa0yTaU6HfxOZ8XJDlmt6hXzhE6mALpbUTIEAY=;
        b=TFsTazeUkWbLv/Ne0brB6F+50luCUfWkUuRHO8XRP4wuxhBrV41j+eUD33IRMZZqVl
         jXE7ApFeG8YeZggP08u1J4i52M2k31rKpfuZkY7vIEkStNvZFgJJi016iHJQr8p5KG2R
         SH85yeCRcz3RtU69ff6AQZJhILJvy1i0LBIYYy9XOwHICIno+wytzq3lvMcZ174wKUpO
         8VP32s1TKsnya6bHVxhxAJz0hiQxDyyV42jwVJbTJ2axpaxHm9jLVgHxyuy/dXxVmgUJ
         /fQ15aFBjbq9pbWG6wf8/L/Rjl6OyyvyztaouiatLEjDztRbpg7rJsiyIgob6VusmKgL
         Ds+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205715; x=1746810515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWkauZa0yTaU6HfxOZ8XJDlmt6hXzhE6mALpbUTIEAY=;
        b=Bif/LPXT5FhgsqVcYeu2yGFrY5gUSF9PWgGDvUG2NMhobWTlfi6cCYxjj84Mba3vbx
         nVF1jedQ7Km9wR5+Rzz+Wari4M6yWjyNi+zV85fViIsCwyPrj5qcnZDlDbfSdm4rw1nj
         wAXp8dsSB429gAUyvnPpbgbeYaWm2BXADedpbvDkEgYFjajp3BssUDiJSGjd5qD+XjCR
         aZYYcSE5univK20MNZwv1NgfaFAoXNr939pxjTWjmZASb8eza/FO7nSTAFFlC3hbac2Z
         gsrUDIP+yvHem80zaQGoe7yDxGw1m/L8bTVNGk6+6J5n/f9eq3Cj55Kqq/EXM7S3c2nD
         rO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8UF8u9zGHXsqDhXu0R8Op6/954/3jl8jqJGkh3BzV7GoETp/WVxMzEwQy4WAxMc3UmsDZ9a98MnOGT4j@vger.kernel.org, AJvYcCWa6QDUpTUUu8nEGYqDKtxFBOhf+Myq/BTIz99qTDq1zfO4g/+CRumEqqeF4Ucin2REo2Uck/rPTjHvCMBf@vger.kernel.org
X-Gm-Message-State: AOJu0YyUByisvXDvX8Ajn/eeYpe0U6CM8iNUtZGUNncl8l4K+R3Fbhb2
	JMylOtqFGhjY2ez0W/LJzPnJ/DpZFRMAYahLcxmgn8rjK8gucZH0p7h3Jg==
X-Gm-Gg: ASbGncshREgyOfYBayF7hdACQhhmXLLIn9gvWL5/+Ev4IFl0mYxFeguD3wfDNpsrt7j
	2yalLptoZZzDioWBhi22Bz5E8Yqf7TSyJZATTEJd9SuPdq9VEUjTaMNh5MEB6F5gStA67U3FmSa
	ZPny+h46aExynYw+2jtLSrmdEEedM7tFVWoE1ThlZeR98Oc6Hh0JveeG0gl4CXPw4pBhwIZHU51
	6DVNt9q8cyr/Igp3Uv2F+UWjXLaRE8W0Tdv6cuIjh6fPzDfissVZ4eg48ng+cZNRqXQ6ZiyfHEN
	K6Ay50zyTMcTFLGy+OgNEnAqsj9b4/odHHFbTClhYJjLvqVBXk5MamjOfRrQ5xmTZy+lJZYHDwM
	2Dfq8xQd4zOBwfQo=
X-Google-Smtp-Source: AGHT+IGWLcHU/4i+H2F5XRgqNKVswqgX7yAdxjxdXFOnfjtdihv1woqeao2G+8bte8JrmBai5RFezA==
X-Received: by 2002:a17:902:f543:b0:223:5379:5e4e with SMTP id d9443c01a7336-22e102aec48mr65288915ad.10.1746205714650;
        Fri, 02 May 2025 10:08:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ffdsm10010925ad.179.2025.05.02.10.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:34 -0700 (PDT)
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
Subject: [PATCH v4 16/33] drm/msm: Add PRR support
Date: Fri,  2 May 2025 09:56:43 -0700
Message-ID: <20250502165831.44850-17-robdclark@gmail.com>
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


