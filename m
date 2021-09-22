Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989D4415363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238288AbhIVW1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238305AbhIVW1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:27:45 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBB7C061756;
        Wed, 22 Sep 2021 15:26:15 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id n23so1119968pfv.4;
        Wed, 22 Sep 2021 15:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QdsNozFfegJc7Gw4XXISRW8X5y2CYMI+i3aZCCS/gQY=;
        b=ZoKYLvyQC33eO/6kLkZGMKiALQ7GGH66UD73dQamCUqJsHNxiOF3ykc/lW97FbW86w
         7uIzwyhqluSjrW1gNBSZ2IDhtnGUYOAAsLklJHNt0nJm33XnzvDM9gEurk3Y7tRdupdK
         tJPDQ6EEyxy/v7eiM6OB3gXS5MgYqMnCwaFytRNvGNk3VJdZncaobmSbqNtQZJINjZMz
         f5gKPsQpQIw0gmhENXs2hmbnTTyK0IxOR2I8I5eQnwcolpCaFNARde6c3dUzMpgGymaK
         MHvno+iMwGZ6UqWbolqtGeVSo5a3AXBKXJXQ8s0tc38axIWKlXcBS7yxgBJX/F2DtfrW
         knlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdsNozFfegJc7Gw4XXISRW8X5y2CYMI+i3aZCCS/gQY=;
        b=jVpxIlkX0H6ejSC0xuBJanQmN8O9i5PFtCXGO4VOgUV3TFBqqWHtoVMR337ugmU6bc
         5qsfnlMi9XMHeTMMmzdCgpPvqmdHPrPrUepFCskmQ+ohKaYFZf0Nwf2vMYDWRVX76DrT
         krgNjpU82YrrJc7z3WrGh3ciopvtvXWFV1CRyOu5MubvTHQK68xLoJuxMJDtRFYu1+GO
         cRpkOlpnjfMS7KGEakbDCITCP0SuQp3a5cPpoRTP3QNnI4VWhykAxZ5l8k4WeAdAIDdS
         cfm9y5IFjipmnmNTOxsqFrcchshtDCMcBuWh5di2F9pSlgME4d3z8GMYt1T0O2MfnWVn
         kEjw==
X-Gm-Message-State: AOAM5321MsFzIsxHCvwVS5V8c8lMfLE3etGCe5Z7yswoK3wsiadhDXwY
        A1/lrIrL18sGiYa6UywFjDU=
X-Google-Smtp-Source: ABdhPJxhEHAewZtpf9dSvferK3LRHBXQTw9MVPqJtfp5LzKXGatDUflPZ5mdhDMSL/y0y91JjxxUrQ==
X-Received: by 2002:aa7:96b5:0:b0:447:96bd:e467 with SMTP id g21-20020aa796b5000000b0044796bde467mr983184pfk.41.1632349574864;
        Wed, 22 Sep 2021 15:26:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p4sm3679254pgc.15.2021.09.22.15.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:26:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] drm/msm: Extend gpu devcore dumps with pgtbl info
Date:   Wed, 22 Sep 2021 15:30:23 -0700
Message-Id: <20210922223029.495772-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922223029.495772-1-robdclark@gmail.com>
References: <20210922223029.495772-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In the case of iova fault triggered devcore dumps, include additional
debug information based on what we think is the current page tables,
including the TTBR0 value (which should match what we have in
adreno_smmu_fault_info unless things have gone horribly wrong), and
the pagetable entries traversed in the process of resolving the
faulting iova.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c           | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  2 ++
 5 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 42e522a60623..d3718982be77 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -707,6 +707,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		drm_printf(p, "  - dir: %s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
 		drm_printf(p, "  - type: %s\n", info->type);
 		drm_printf(p, "  - source: %s\n", info->block);
+
+		/* Information extracted from what we think are the current
+		 * pgtables.  Hopefully the TTBR0 matches what we've extracted
+		 * from the SMMU registers in smmu_info!
+		 */
+		drm_puts(p, "pgtable-fault-info:\n");
+		drm_printf(p, "  - ttbr0: %.16llx\n", info->pgtbl_ttbr0);
+		drm_printf(p, "  - asid: %d\n", info->asid);
+		drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\n",
+			   info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);
 	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8a3a592da3a4..d1a16642ecd5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -284,6 +284,16 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (submit) {
 		int i, nr = 0;
 
+		if (state->fault_info.smmu_info.ttbr0) {
+			struct msm_gpu_fault_info *info = &state->fault_info;
+			struct msm_mmu *mmu = submit->aspace->mmu;
+
+			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+						   &info->asid);
+			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes,
+						 ARRAY_SIZE(info->ptes));
+		}
+
 		/* count # of buffers to dump: */
 		for (i = 0; i < submit->nr_bos; i++)
 			if (should_dump(submit, i))
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a7a5a53536a8..32a859307e81 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -78,6 +78,14 @@ struct msm_gpu_fault_info {
 	int flags;
 	const char *type;
 	const char *block;
+
+	/* Information about what we think/expect is the current SMMU state,
+	 * for example expected_ttbr0 should match smmu_info.ttbr0 which
+	 * was read back from SMMU registers.
+	 */
+	u64 pgtbl_ttbr0;
+	u64 ptes[4];
+	int asid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index eed2a762e9dd..1bd985b56e35 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -116,6 +116,23 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
 	return 0;
 }
 
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova,
+			     u64 *ptes, int num_ptes)
+{
+	struct msm_iommu_pagetable *pagetable;
+
+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
+		return -EINVAL;
+
+	pagetable = to_pagetable(mmu);
+
+	if (!pagetable->pgtbl_ops->pgtable_walk)
+		return -EINVAL;
+
+	return pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova,
+						  ptes, &num_ptes);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index de158e1bf765..519b749c61af 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -58,5 +58,7 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova,
+			     u64 *ptes, int num_ptes);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.31.1

