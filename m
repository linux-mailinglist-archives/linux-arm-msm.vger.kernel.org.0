Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F048244373
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgHNCmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgHNCl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:41:59 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0122C061757;
        Thu, 13 Aug 2020 19:41:59 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t11so3527205plr.5;
        Thu, 13 Aug 2020 19:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cNcI7HrS0AvVaVc1646ajuPmDSYJLUf29QkaS+BoOVY=;
        b=pzZUIGcw49UDhnzFSNiJLflzdLOYeaztPxIO8Z2rq7KbTpKDbOu6Q/NfnaJ0pBfO1Z
         POQ7qfbCMMNpd17V3W2gtt6CGkwN+5o3Z4KIj2ays4lmq1xVKH+zBbMnACz5FKN4BSYc
         3rMhRbcgOcjsv+Nlwuype4ly1JI8DzU9U3+EpFJXS86R6pcGluuupPd8fSiz1JlLNaal
         Yq2hZjPQSab6JDrdnvNJxmb5Eu0oSBD2r8MmILivxuatn+mV5+EKhPfiDZ0tHAPPMec8
         ms+34lpasfaU9vBIhPXcOvFz5xkW5+4mY4erNzSlet1/bRMUcEjfsP3Cn1qQ1y64auPs
         28kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cNcI7HrS0AvVaVc1646ajuPmDSYJLUf29QkaS+BoOVY=;
        b=OmJGuEBHzjXrH3PBo1Wf0OTn3mW1cqlmbVNeXob2TdU7TmuikIo6CHP13ghMr99WEz
         BQ6FQGC183N3zG0+1Ezob1xGb8JL+y+UpMKEmBjtOXGLYcjUp2KKjaQiwZu8izQicAwd
         Kh/FA6m3bWVR2uctDFq5c7zZK6ObgDWuHLafrGKP1h+u3iWno9ET7BPOd+zz0tSDvhH+
         WDVkxyfnz3637wTnC14ytwx6ZEgru1DlFlIIWFHhqzkm1E4Iq9dxwczYvUhg1ZCxq+Ih
         0XujK9yQpJwG/jM2Rst+mtRmFtYQYC+Wj0ttPOvjd2UmqezLe6XHphwbkb327eZmhSGt
         K3Mw==
X-Gm-Message-State: AOAM530CohXDcYnXVMVu2hVt0iX9xujqz1geUAfc0Clkv/vsq3yqTieW
        yUXzUViVyRQzn885BgPzCwg=
X-Google-Smtp-Source: ABdhPJycLuwK0gbIMMbYhrOWKhbzBvp6l116+BY14zk2g2riKk8oOqQ2oO4VNgrA+LtOYcNRiL4Ndg==
X-Received: by 2002:a17:90a:fd82:: with SMTP id cx2mr536746pjb.67.1597372919243;
        Thu, 13 Aug 2020 19:41:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id g2sm6352994pju.23.2020.08.13.19.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:41:58 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 14/19] drm/msm: Add support to create a local pagetable
Date:   Thu, 13 Aug 2020 19:41:09 -0700
Message-Id: <20200814024114.1177553-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Add support to create a io-pgtable for use by targets that support
per-instance pagetables. In order to support per-instance pagetables the
GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
split pagetables enabled.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
 drivers/gpu/drm/msm/msm_iommu.c  | 199 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
 3 files changed, 214 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 310a31b05faa..aab121f4beb7 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 	}
 
 	gpummu->gpu = gpu;
-	msm_mmu_init(&gpummu->base, dev, &funcs);
+	msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
 
 	return &gpummu->base;
 }
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 1b6635504069..697cc0a059d6 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -4,15 +4,210 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/adreno-smmu-priv.h>
+#include <linux/io-pgtable.h>
 #include "msm_drv.h"
 #include "msm_mmu.h"
 
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
+	atomic_t pagetables;
 };
+
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
 
+struct msm_iommu_pagetable {
+	struct msm_mmu base;
+	struct msm_mmu *parent;
+	struct io_pgtable_ops *pgtbl_ops;
+	phys_addr_t ttbr;
+	u32 asid;
+};
+static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
+{
+	return container_of(mmu, struct msm_iommu_pagetable, base);
+}
+
+static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
+		size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	size_t unmapped = 0;
+
+	/* Unmap the block one page at a time */
+	while (size) {
+		unmapped += ops->unmap(ops, iova, 4096, NULL);
+		iova += 4096;
+		size -= 4096;
+	}
+
+	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
+
+	return (unmapped == size) ? 0 : -EINVAL;
+}
+
+static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
+		struct sg_table *sgt, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct scatterlist *sg;
+	size_t mapped = 0;
+	u64 addr = iova;
+	unsigned int i;
+
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		size_t size = sg->length;
+		phys_addr_t phys = sg_phys(sg);
+
+		/* Map the block one page at a time */
+		while (size) {
+			if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
+				msm_iommu_pagetable_unmap(mmu, iova, mapped);
+				return -EINVAL;
+			}
+
+			phys += 4096;
+			addr += 4096;
+			size -= 4096;
+			mapped += 4096;
+		}
+	}
+
+	return 0;
+}
+
+static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	struct adreno_smmu_priv *adreno_smmu =
+		dev_get_drvdata(pagetable->parent->dev);
+
+	/*
+	 * If this is the last attached pagetable for the parent,
+	 * disable TTBR0 in the arm-smmu driver
+	 */
+	if (atomic_dec_return(&iommu->pagetables) == 0)
+		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
+
+	free_io_pgtable_ops(pagetable->pgtbl_ops);
+	kfree(pagetable);
+}
+
+int msm_iommu_pagetable_params(struct msm_mmu *mmu,
+		phys_addr_t *ttbr, int *asid)
+{
+	struct msm_iommu_pagetable *pagetable;
+
+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
+		return -EINVAL;
+
+	pagetable = to_pagetable(mmu);
+
+	if (ttbr)
+		*ttbr = pagetable->ttbr;
+
+	if (asid)
+		*asid = pagetable->asid;
+
+	return 0;
+}
+
+static const struct msm_mmu_funcs pagetable_funcs = {
+		.map = msm_iommu_pagetable_map,
+		.unmap = msm_iommu_pagetable_unmap,
+		.destroy = msm_iommu_pagetable_destroy,
+};
+
+static void msm_iommu_tlb_flush_all(void *cookie)
+{
+}
+
+static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
+		size_t granule, void *cookie)
+{
+}
+
+static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
+		unsigned long iova, size_t granule, void *cookie)
+{
+}
+
+static const struct iommu_flush_ops null_tlb_ops = {
+	.tlb_flush_all = msm_iommu_tlb_flush_all,
+	.tlb_flush_walk = msm_iommu_tlb_flush_walk,
+	.tlb_flush_leaf = msm_iommu_tlb_flush_walk,
+	.tlb_add_page = msm_iommu_tlb_add_page,
+};
+
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
+	struct msm_iommu *iommu = to_msm_iommu(parent);
+	struct msm_iommu_pagetable *pagetable;
+	const struct io_pgtable_cfg *ttbr1_cfg = NULL;
+	struct io_pgtable_cfg ttbr0_cfg;
+	int ret;
+
+	/* Get the pagetable configuration from the domain */
+	if (adreno_smmu->cookie)
+		ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
+	if (!ttbr1_cfg)
+		return ERR_PTR(-ENODEV);
+
+	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
+	if (!pagetable)
+		return ERR_PTR(-ENOMEM);
+
+	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
+		MSM_MMU_IOMMU_PAGETABLE);
+
+	/* Clone the TTBR1 cfg as starting point for TTBR0 cfg: */
+	ttbr0_cfg = *ttbr1_cfg;
+
+	/* The incoming cfg will have the TTBR1 quirk enabled */
+	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
+	ttbr0_cfg.tlb = &null_tlb_ops;
+
+	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
+		&ttbr0_cfg, iommu->domain);
+
+	if (!pagetable->pgtbl_ops) {
+		kfree(pagetable);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/*
+	 * If this is the first pagetable that we've allocated, send it back to
+	 * the arm-smmu driver as a trigger to set up TTBR0
+	 */
+	if (atomic_inc_return(&iommu->pagetables) == 1) {
+		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
+		if (ret) {
+			free_io_pgtable_ops(pagetable->pgtbl_ops);
+			kfree(pagetable);
+			return ERR_PTR(ret);
+		}
+	}
+
+	/* Needed later for TLB flush */
+	pagetable->parent = parent;
+	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
+
+	/*
+	 * TODO we would like each set of page tables to have a unique ASID
+	 * to optimize TLB invalidation.  But iommu_flush_tlb_all() will
+	 * end up flushing the ASID used for TTBR1 pagetables, which is not
+	 * what we want.  So for now just use the same ASID as TTBR1.
+	 */
+	pagetable->asid = 0;
+
+	return &pagetable->base;
+}
+
 static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
@@ -85,9 +280,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 		return ERR_PTR(-ENOMEM);
 
 	iommu->domain = domain;
-	msm_mmu_init(&iommu->base, dev, &funcs);
+	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
 	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
 
+	atomic_set(&iommu->pagetables, 0);
+
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
 		kfree(iommu);
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 3a534ee59bf6..61ade89d9e48 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -17,18 +17,26 @@ struct msm_mmu_funcs {
 	void (*destroy)(struct msm_mmu *mmu);
 };
 
+enum msm_mmu_type {
+	MSM_MMU_GPUMMU,
+	MSM_MMU_IOMMU,
+	MSM_MMU_IOMMU_PAGETABLE,
+};
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags);
 	void *arg;
+	enum msm_mmu_type type;
 };
 
 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
-		const struct msm_mmu_funcs *funcs)
+		const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
 {
 	mmu->dev = dev;
 	mmu->funcs = funcs;
+	mmu->type = type;
 }
 
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
@@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+
 void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 		dma_addr_t *tran_error);
 
+
+int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
+		int *asid);
+
 #endif /* __MSM_MMU_H__ */
-- 
2.26.2

