Return-Path: <linux-arm-msm+bounces-55963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42318A9FB51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B8B9173FC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD2321517D;
	Mon, 28 Apr 2025 20:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6W+PuRF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72580215058;
	Mon, 28 Apr 2025 20:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873847; cv=none; b=knEYhyPTGbfOoU1I/7TRHQ1H24YIhdZl/MJ5M0sdnkfSL6dbVGKRdoZAAiPSmDxK+rk+EExvJFYi3UzOpirXl6RRLP5skXBW/fdFd/Li6typIzT81oAUJnZiizLq3vR1Y0AMjFuGvoUsVTp5TrRDmWWunKNVcAec2EvYUyTgFTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873847; c=relaxed/simple;
	bh=rH1Y0P/mYt4SZmCD1nX4b0DhSA9485S88+aHY0M2W2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkvHc1vQzWnrZXEc5YlCNAvD3NrsBe18zZ4JlP8bdBLd6QrrkNRKHhgb9bNA7gpxpMTQuKFcxlC5STd7TPPHnM6H3t8v5m4ayn7lnUoEof+/Ul0fex70h2vr4IEpr4Gqz3l/l3mZLfi+QzKfg1nD6wm24iGFEK+exXm+njJ+Zhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6W+PuRF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c1138ae5so5303572b3a.3;
        Mon, 28 Apr 2025 13:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873845; x=1746478645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWkauZa0yTaU6HfxOZ8XJDlmt6hXzhE6mALpbUTIEAY=;
        b=V6W+PuRFl7AJCaWHbjuXJ/XFPmbLPul5dZgu5PZCZlRCkqzeQt80AH8Ux8Cqv7C0h3
         u1fF6AnLdKyrY8g+gc7610+tAc116KLmKH7UQ23e5ZhoOIqkAkHn2PRM3vK6L80YEJam
         u0CeSXn1ZnKGp/SOBcz0A/qeKywyihmnR8mE903KGEpVsggH7df+gbiJ9eqT2eo9xRW9
         DTJ2JtywDbJ52RQ0S3IrgZh+n+3Q27BNvouPzAzIUUXOrZKr9qcB0VzcsfAT4ShgdIQd
         eIWu/qSOVzJAS1xSbDWyAdSLYI3sdsxZJfQq/vj+CHviUQ5dF4ATwsK/6VBFUf4PZioa
         wxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873845; x=1746478645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWkauZa0yTaU6HfxOZ8XJDlmt6hXzhE6mALpbUTIEAY=;
        b=Nle/mkGW64JUQ+uL7Mwn3FbOgjEqE+A8ExiCQYQUCMOUJY3BX4ZSsLynW0M3jl3UdD
         R0USNqP6iisylAVCgyW9fiwRglLAVvWn3Cx9G7CEpa6zyEGjKqvcbPofYUM8rB5b55p+
         VsZCQ+4H1N/4aEZmIx4+45QhnAggMYnw4nLop/fDYXAjJx1CFeNMjurUXApFfaScbSQ1
         JgQZyFgQC2PiFbG3QeDhLfZ/gyjdj/ykTgvkWYvq8o/bYuPGzAQ7hHobUBjQJ9/UCNti
         aUuFofEfXWeKxnlCdaBCEPS9psl8qORhMoapIRDmcOQd89OjWDvNQowJgaS9dn0/HSTe
         vwbA==
X-Forwarded-Encrypted: i=1; AJvYcCVuahWCe2uonCjlsAnLnvLaoCMpBq5PqgYH2GxPpFxl8bRgi6E7HXqTPzeWmug8hppVG9FtppAX60bHR2uk@vger.kernel.org, AJvYcCXbp7Px8FlaS7QFbq371Xm8dUFwICTVg45Rj3CIOE3IqFmVtVkcS2tIhXPoYua7RXM7P3QmuVy4Ru1pZP4C@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDM6YO+Xv1XPUuo+rDxepTWSYZkglZ4p2ztqSsTbbNWrcQeHM
	Yc0MEiF3NMd2oy2jCOZFmC/IM357jjoK4LXXTcp9DIgu/3VSWI7V
X-Gm-Gg: ASbGnctBayFagCxOCw6BxrM2CyCpXdyVnwA8ed8hh9MeKvdtKW9PdhsjAfvc2u+zHpr
	3O4flK6wFxCfUTeYKPznZewnuiOCWxlK58CSeIR9ya2jsnxDGP97cU5ETBU7qwUz6E1QTsRHMDM
	OuTHwftrm/Sj9PCzRgG2uQnAFus6IpIVV8kC3cXJS/Q2gMA5cpiKImjeuXG7cHpSds2s8GiQZUj
	GG47u3gebNcnVmJlPygNFkrYEZMxjxmmKheLjU5E84WjOfuSbLuyQfOvUSP3QLSez9MAk3fybzm
	x81D8NAyhnp/kkkMFFMNzqQnTx6ZOkltHVUvrJZNZxaT+9ikGrk3Jfkwu1zPKKrLNDrxvMW9U0A
	RXHqmQRGvfr87gwo=
X-Google-Smtp-Source: AGHT+IENIK9mpkJtvWi2XaFGLm8/jny2A+4dx1ts3p2KtlOMeF3BysNot9Rcu9ehiNw4DJFVvhQ6rA==
X-Received: by 2002:a05:6a20:3956:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-2046a6f326emr13499696637.38.1745873844724;
        Mon, 28 Apr 2025 13:57:24 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca4e8sm8429721b3a.162.2025.04.28.13.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:24 -0700 (PDT)
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
Subject: [PATCH v3 16/33] drm/msm: Add PRR support
Date: Mon, 28 Apr 2025 13:54:23 -0700
Message-ID: <20250428205619.227835-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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


