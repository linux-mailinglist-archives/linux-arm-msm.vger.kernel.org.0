Return-Path: <linux-arm-msm+bounces-20313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 587838CD97F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 19:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 172302838D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 17:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0445A36B17;
	Thu, 23 May 2024 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CP1tl0gu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6274B8249B;
	Thu, 23 May 2024 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716486756; cv=none; b=cbSARPIFQJT6vNsy+W5gtNDw5y8AMrgPomzXGZTfZFnmVYv/y+U25/nfU52vQ3NQm0QM+xX786dEdp5oKNXCwzWEBpcocF+w/a+NK0Txpv34gSqXP+/ODZKnAW9PgorDISdWqSJV6FtuSUscCBGJyA+lm7aDuaGPnXg7auxb3zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716486756; c=relaxed/simple;
	bh=OY84vnQmaOpm/ilqJFzeIS3mAQRqPDAKOALOTSxAdhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cchnzGRvws40kGvmSJPIexdJ4jfZb+Xd+xHaICitjhygT2x90dniAykyv7aus8EB7XI0f2ECMGahSTxfM6NH3vuqkvafLkbabG4bi7sw0j89Aq/fu0dc6y3730PeaHtZe8CNrNnOZvw82LgSWmmOaFeCCAi2mf0hBW5Q/nR5UUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CP1tl0gu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f8e819cf60so75914b3a.0;
        Thu, 23 May 2024 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716486755; x=1717091555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sOHXqCncBU6birEuX4uwSPwzlGfl/T4qQvFWke/kK8=;
        b=CP1tl0guO4hD+UxiU16hSJVVO7ci7jyWskY03ez1mraAwWKpItCvth9HLbYTOnf50F
         QsMZIEE/+wnM3DeVBD2Ay8vp/5m+VxijoO8Q30yR4qPLEU9ANUR09bnsnxDte/gielD6
         DejOuHdKQzVBhe4ysMyy0x4R3PSwF92nlE7ktDRFpIlCdj5b1XMx8xg8mCIJtUKF9Rff
         URVDoufB1ypf7UAE3UdnRfZQnTekyuc5GX+FWXnBA2OW4h+y888oRbe+XAhovpzehyve
         f5PyWOGCC6SU0KypcThao91FY/OwHPy2/S8dmRznFqc0aS9oRc76kTL8XJiPiEduWJmr
         AlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716486755; x=1717091555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sOHXqCncBU6birEuX4uwSPwzlGfl/T4qQvFWke/kK8=;
        b=HXtG2r7E+l8SGaQ5xXzpmi/jMQK6tsMbgqiabV6RW4gm8bQ3SI3F+FFgvkclX5mrr4
         t7+QkWx4X9nx0tjd8RVKGz8xAKe2bZeeSG7hKHH/C07/tL2NO6ewHR6xlx0t5my/dOFS
         cJgoFPYJiqtomU7iIdlqlg7ZxK6Nvc3dzqB+Nkmq6RtrDPZ8sZKXsSHNtXreKMlQnolh
         QvoYNMfvWC4ORrhyjWScLrEy6q2UZXIHssvbN135XS/XVNSChSFrXdsSZWCXhlfslmtB
         1kgtx4dso/rVH8tsbL1aZNWrzlgCaJ5kSATLes1tT0RCjiXL+LtjAhmqqNTsdyfQ7bvA
         PchA==
X-Forwarded-Encrypted: i=1; AJvYcCUDx6wJI5RprdQIiGFQfzoWQDpYHdLp9wf/5Umra2WgdY6qAcT6/o96Y46n901HSX732El6TXW25niiEEdLeLL3Pp6aeX/FPlPobjEn
X-Gm-Message-State: AOJu0YxEsmIGuXU3c7ZtASMnfwmmu+J7ols6HR0uf3d6EEyrJ4kKBKhZ
	cWavB8zwedVAwP0nEasGEK12LSzaw5janHt0lJ/fwN+maV1KICUj
X-Google-Smtp-Source: AGHT+IGqasfCKg6OOKa8oMiTtJmnCRILxbk2Jmphwrshne78caVg4jLmnEKamGYQegS93nsN0LMmVQ==
X-Received: by 2002:a05:6a20:9195:b0:1af:d16a:baf1 with SMTP id adf61e73a8af0-1b212df0a34mr168503637.47.1716486754677;
        Thu, 23 May 2024 10:52:34 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f5028d7738sm18830833b3a.71.2024.05.23.10.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 10:52:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/2] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Thu, 23 May 2024 10:52:22 -0700
Message-ID: <20240523175227.117984-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523175227.117984-1-robdclark@gmail.com>
References: <20240523175227.117984-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gpu.c           | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  5 ++++-
 5 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a00241e3373b..3b4c75df0a5f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -861,6 +861,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
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
index 43cde0590250..647bddc897f2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -256,6 +256,18 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	state->nr_bos++;
 }
 
+static int pgtable_walk_cb(void *cb_data, void *pte, int level)
+{
+	struct msm_gpu_fault_info *info = cb_data;
+
+	if (level > ARRAY_SIZE(info->ptes))
+		return -EINVAL;
+
+	info->ptes[level] = *(u64 *)pte;
+
+	return 0;
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -281,6 +293,16 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (submit) {
 		int i;
 
+		if (state->fault_info.ttbr0) {
+			struct msm_gpu_fault_info *info = &state->fault_info;
+			struct msm_mmu *mmu = submit->aspace->mmu;
+
+			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+						   &info->asid);
+			msm_iommu_pagetable_walk(mmu, info->iova,
+						 pgtable_walk_cb, info);
+		}
+
 		state->bos = kcalloc(submit->nr_bos,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 04a696ac4626..82fbb626461a 100644
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
index d5512037c38b..f46ed4667475 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -195,6 +195,24 @@ struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
 	return &iommu->domain->geometry;
 }
 
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova,
+			     int (*cb)(void *cb_data, void *pte, int level),
+			     void *cb_data)
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
+						  cb, cb_data);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881..46b2550b9b7a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -53,7 +53,10 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
-		int *asid);
+			       int *asid);
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova,
+			     int (*cb)(void *cb_data, void *pte, int level),
+			     void *cb_data);
 struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.45.1


