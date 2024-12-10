Return-Path: <linux-arm-msm+bounces-41347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FE9EB720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA9931883087
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76F7234986;
	Tue, 10 Dec 2024 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8xNTSVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A464233123;
	Tue, 10 Dec 2024 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849524; cv=none; b=rg7Tiiyk6efQxP0CEIEtpFxiy9fGuWnAuFK/sgYie21zB0vQE8Cy5FESLlqhODOKMAnXRr4xKIfyin9DRoaStQisx7T+9lruI/S78T7TKqti+tKV1Uo7xuxXZqLNWD+ABObwPl407eMf0tFpqrnSeiNbrSaZPgmi3ozucipSCDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849524; c=relaxed/simple;
	bh=JBMkrQG/8cFEwbKJFanSCuDvcbSxAx5wFpFltTn+IAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMu6tpnShESYID0zI0hC5UWPzJGlfuXcq7zzPidDPqa1+5QDjp13pl6UjfZWFnVmcSoAuAwikO4h0Pf6XU5m720v7hl+gY+HWyGKug0tGKnmMEJktfgbvGO+QYaUaE3oGt8hOQbO+J8Vgn744mHPtt5rAE4/ofq18ZeiSWmlcTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8xNTSVL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21669fd5c7cso16963015ad.3;
        Tue, 10 Dec 2024 08:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849522; x=1734454322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh7p2d7+E2GMmgZFCCSWmo87bNDM3/nkgcYOWm/PC60=;
        b=I8xNTSVLW4WmlaCFJESUMkzUG6WumCoIHBmQF176LyL9wI/sOjySVTCiPGkU5FVvr5
         hlFntpbrRe7Ndoix+/kIEj+bvyW/iaLp8dsoficYhPA/uF0r7PeX6t1P4iFuEvUxs+oR
         rYsbCEN+HqOChZOcASXb2IZ4XY1vk288NdBgpOtD1jx/PZFZ3BxqiGi6iSJQnqLrAcbw
         nqLd/UkP0PYuinDjEL3sF7/FGjG+s33JJ7Spl0mm2090dl3EHu6NrpoKhZiH66CgaZNT
         bx853AMdfDSpp0JhQBu1zjdv5/dDS6RrCaPJRKyhRtlVuj5qggrSVNtfsl0QeYdYJTFp
         7RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849522; x=1734454322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh7p2d7+E2GMmgZFCCSWmo87bNDM3/nkgcYOWm/PC60=;
        b=YqFEGAcRu7Tt5JHnVhYAfzcv1/a6fGUB3LF49dvXffAxh1RlMA2fRDvdwur3z6+co8
         F8KeuP+kz+dZLp4IMEadhAiJTuO92wnarDTy2Eel3mpV4Rmttrf1ozNTZpvA6tikt3jF
         maFxW4mTotRtHIc10mVwiTPZpSJpZ/ZkUG+hHw5s1m/VfAzW1pVzOIIL4cZC4zZ7nrij
         NMNqxF22cAwZi7uwxpQxh8ABIVV0uTgh9H04Mo4XljL6BneJzn+ofTIbCyrJwYCBT8Pl
         Ijd3L6wgOh8MpG3B5CIOEIqZauymCRO1UUA8pe8I1zhHR0j48qoU3aNOKh2FKJ8IKvHE
         LVJw==
X-Forwarded-Encrypted: i=1; AJvYcCU3/fnZ0aIVVAmaugL2I9Kkl/xj7RQO/J6roYkbJ69oNBNBh+iIxIcL+FZ5E/+z6LKiC8XL7i7ZCR1U8uc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6wxpfDcFers8OsKJk8RaIMK897ctF0Xf6djunM3W/8qxHHUit
	Dhapk93FMHI6WONLh/9zTHoVYfkVOOKvod+vRZM/IcTgDtJcOgVU
X-Gm-Gg: ASbGnct8aGRCjM3aBsywK1ajSScnJD2C/LfwMzvIvpWJs2eqBlg+oI8HQmVy+fwKX5W
	s9f10tX7znYCwM4Gh3305Hv2tW93OMRyeQToVcapbnd2ThporPLZyciH5hf+A2luxEm3f4N2GAu
	1hnoZHFQj8f35CpTkFDdvWFx3336BfBqQFlh7l116443W5KzhKzeMZrvWtObB/Gi0t+sW/3fW8O
	L3ccvHag+ZZNnp+5Y/5W9a/tebh68ww6OZwbqROoomMb/38jAU60NjLR448PzrjHDj01epKN9hF
	e3ctdsy0yJGoez6MF8c1D2b12H9L
X-Google-Smtp-Source: AGHT+IGyppZ/XUmktj28oKiZ+5yOlPQdJYESYN99eWYi54gnG85QRxp2tq+GL1giES6A+moTdOjNmQ==
X-Received: by 2002:a17:902:f684:b0:216:386e:dbc with SMTP id d9443c01a7336-216386e1127mr132673815ad.13.1733849522435;
        Tue, 10 Dec 2024 08:52:02 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21632c4fd4dsm55201575ad.232.2024.12.10.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:52:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 4/4] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Tue, 10 Dec 2024 08:51:22 -0800
Message-ID: <20241210165127.600817-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
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
index 076be0473eb5..f1d6e6665c30 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -868,6 +868,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
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
index 0d4a3744cfcb..82f204f3bb8f 100644
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
index 7cabc8480d7c..e25009150579 100644
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
2.47.1


