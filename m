Return-Path: <linux-arm-msm+bounces-29665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0F9616BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36A221F263DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCD31D4613;
	Tue, 27 Aug 2024 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyD6V9Yu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB691D4608;
	Tue, 27 Aug 2024 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782656; cv=none; b=lc4WMjKF7x8DAzlljMVTjS8C7SBFmuNYtO4/LnyUWUUBj6QvYQJYIPKFk1dVCuVDnsHWZTFDbmTuTyzX8ZPsxEF5k91LaFqXXeSnFg75ooggn5d/2FeD4PStG5uBB4u5uFMLvCYR3iYHEtg0KrlwQS6L8yNfb0qYPgcMoN5H69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782656; c=relaxed/simple;
	bh=Z9rdbPQfURPCIg572NnKyoFcQ2uLzoi++cMrYqDlAP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acYygBVZSm/yvlce6OZEISGrx9kqBlmseOoxeLL6yu0Wy4Umx1Si+SvhW2ijY3Qy9orGRenUVmn/3zu6gtdVZw9+DJk1vALdXzqk9JPcFcvwNUtSbrTW0UjtmC2JscsXcQwaT+Ztfzt37lu6hs2R3cDZHNdYTVdo0X5ENdxRbaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyD6V9Yu; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-39e6b1ab200so1050255ab.0;
        Tue, 27 Aug 2024 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724782654; x=1725387454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cgk9ZwZd91vOVt90fIiETgBR9DeXKbUMnWSmPau0W5M=;
        b=ZyD6V9YuWzZ2+6YJGYwEoTHggJ6+FFNoviksh9+aaaVAkbj7LGkSO1AMoVtXim8jmj
         FFb88a7JGN//+NGgA7FYbqPx5vmMfWtZm5Jt8iS7vDRr6o1u/In8zSBk2Yhl7FIMcAcM
         jO4ojQ3Cz29h/Auh0ORVFlJqLoxaJgod+0K5mboY5DPPiJojk7PD8cPnB4vqRrrqau8Z
         2ylqL8YQbZU+0OnLTu3fvWtFbbITcR+ToDRMQ7qk7phYVBKY8I1BAgz1Xdd6SkZR04Vj
         h3vo/kADVyNCBciDl535kSH8Qu8fw9kq9CKtHEGnvuIRzPYysy98hZS8tFKubmAWYomz
         plug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724782654; x=1725387454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgk9ZwZd91vOVt90fIiETgBR9DeXKbUMnWSmPau0W5M=;
        b=CI+iMtHIwzQSTJqiN2pF72xHvOa84XhkRs53Cvkr+YntZbA4ixhwsG/4wvmhYygX8/
         xduHmkw+J6nSspXkCPNvsC/YKSqzn9XLMopdHv65dh44kGioadez16IHTQbX7hKDqXW3
         2Z759W82eLR//6e8oKw3fxSIsS+rbkFMVOXN7zm356jh7s5E6MIJWN+IcCNn8nShUWHm
         d8o/DvhiLdO/1YNaW4ZD/W0DpiOD5Q3pLkfYjhQWL6sKB3N+XfHg2HSq4qudzn5EyrjE
         cI1bpJFmI1tY8SgM2qBwLCxK5mwnUDcdIohxMG5CB1cDf1tM7Qnw8Rtgr4zJnOPpEgHK
         fABg==
X-Forwarded-Encrypted: i=1; AJvYcCUpkHcp5Mt9ANXggrxXNUGRhU/GhurTmSTxCP166YX5TqO7SPVMJc4UeX57jqPmEkEjCmZTsxIbIjF645zd@vger.kernel.org, AJvYcCV3wuFHaznqEpg+R7yRLCVNlVpdDaWw1Zfh2hEETepTrxgCr0un0ziDqvMx2Op3yGpuBzE4X7o4X+81n+3N@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1bqDM7qOT+slmI+3+FHhSg3pEc4XntrQhyxChVqeqscNA5ii
	lijMczSshgdvQNhvyJML/5FAOPDUSwySzHbSFzm4WH6DtiUBUVPg
X-Google-Smtp-Source: AGHT+IGAgUs1zObwyhF7fTbdtha65n0BhLE2VwyP+bd4hlIhZyKR5Y1ftLH0i1qZ8R2IN6fgpq/FGA==
X-Received: by 2002:a05:6e02:1d9b:b0:397:351b:2c0c with SMTP id e9e14a558f8ab-39e3c9c06dfmr170767125ab.17.1724782653624;
        Tue, 27 Aug 2024 11:17:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad6e8e9sm8321211a12.86.2024.08.27.11.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:17:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
	freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 4/4] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Tue, 27 Aug 2024 11:17:12 -0700
Message-ID: <20240827181717.187245-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827181717.187245-1-robdclark@gmail.com>
References: <20240827181717.187245-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
 5 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..3848b5a64351 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -864,6 +864,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
 		drm_printf(p, "  - type=%s\n", info->type);
 		drm_printf(p, "  - source=%s\n", info->block);
+
+		/* Information extracted from what we think are the current
+		 * pgtables.  Hopefully the TTBR0 matches what we've extracted
+		 * from the SMMU registers in smmu_info!
+		 */
+		drm_puts(p, "pgtable-fault-info:\n");
+		drm_printf(p, "  - ttbr0: %.16llx\n", (u64)info->pgtbl_ttbr0);
+		drm_printf(p, "  - asid: %d\n", info->asid);
+		drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\n",
+			   info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);
 	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3666b42b4ecd..bf2f8b2a7ccc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -281,6 +281,15 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (submit) {
 		int i;
 
+		if (state->fault_info.ttbr0) {
+			struct msm_gpu_fault_info *info = &state->fault_info;
+			struct msm_mmu *mmu = submit->aspace->mmu;
+
+			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+						   &info->asid);
+			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
+		}
+
 		state->bos = kcalloc(submit->nr_bos,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1f02bb9956be..82e838ba8c80 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -101,6 +101,14 @@ struct msm_gpu_fault_info {
 	int flags;
 	const char *type;
 	const char *block;
+
+	/* Information about what we think/expect is the current SMMU state,
+	 * for example expected_ttbr0 should match smmu_info.ttbr0 which
+	 * was read back from SMMU registers.
+	 */
+	phys_addr_t pgtbl_ttbr0;
+	u64 ptes[4];
+	int asid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f9..3e692818ba1f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -195,6 +195,28 @@ struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
 	return &iommu->domain->geometry;
 }
 
+int
+msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4])
+{
+	struct msm_iommu_pagetable *pagetable;
+	struct arm_lpae_io_pgtable_walk_data wd = {};
+
+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
+		return -EINVAL;
+
+	pagetable = to_pagetable(mmu);
+
+	if (!pagetable->pgtbl_ops->pgtable_walk)
+		return -EINVAL;
+
+	pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &wd);
+
+	for (int i = 0; i < ARRAY_SIZE(wd.ptes); i++)
+		ptes[i] = wd.ptes[i];
+
+	return 0;
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881..96e509bd96a6 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -53,7 +53,8 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
-		int *asid);
+			       int *asid);
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4]);
 struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.46.0


