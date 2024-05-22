Return-Path: <linux-arm-msm+bounces-20271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED88CC845
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 23:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E886E1C20D7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 21:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC5D1474B2;
	Wed, 22 May 2024 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kP3CxdsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDD7146013;
	Wed, 22 May 2024 21:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716414634; cv=none; b=FAmk/0d2844ihGfjC64gGcObE25NuP4h2hDPIeTokMlTUEU25RgrurSqOExNCnEE0rSssDzmN6YIsT+4lVwtLxes2HWM1CzmPC64HWd8LaQFBx2/B8RHhhkVim8PsV0HcBypTByQojKxU3ofZW9E8x/Vlc+jmcwpXNIQ5RakSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716414634; c=relaxed/simple;
	bh=OY84vnQmaOpm/ilqJFzeIS3mAQRqPDAKOALOTSxAdhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ev4Ua6re19A6Ial+/e4t+DUiw8nRwd6ZJizaBhbANeF31FpKKKesuoVbAwT3qRPJoIFv8qzUfocKa58L/JYn3TW6jWkj0YOSmiOcrfQinVlqEZ8nWSanxaWO3JDGIp/1Qcw5gJjkudD6Rp3qH93/Uj+7szdTKPF58cD5P+ysXcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kP3CxdsV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso1360065a12.3;
        Wed, 22 May 2024 14:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716414631; x=1717019431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sOHXqCncBU6birEuX4uwSPwzlGfl/T4qQvFWke/kK8=;
        b=kP3CxdsV86KIPho/BskeN17UkX8H5pauXxGwIOxhJCrELRO+uzvMaBIKfnHqt7l5+4
         pwE6DwSEK26c+lB12w55pUOvpp8a9gBhbDrjEoXajnuvBkGpOOJL7bPGO/asCp1UeigN
         5m67N9hUqFwMT5BZhcrCIRJgWQuv9eyyaK9eW55WGxiuaa60gHRjyMk4ENV5y6KHzcbt
         VVTvTjMQogCBsiRIyLu+b51mHe9IxxmbtIN183v2rM0xAVPGTZxZB405h/N+N7l1MUsj
         OJtNg1aYBm/qMZtRgWrAiE8x1zvC+pkgq2pFuK7Sc7BnTj7NXFkId4kjAr2USktDa+Te
         Q9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716414631; x=1717019431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sOHXqCncBU6birEuX4uwSPwzlGfl/T4qQvFWke/kK8=;
        b=tbPoXOFZm4lVWLhh5n31tu10xIrzKbB/D5tayPmYfKjSomd0EVVjbtL4LTKKlol6NN
         hepXAhIymB3IL/IsASXeH0e/fSx1VTEaPYuQXlV1lgIOENn3Lp0Lt7r1+QIhAGVR/0e3
         FSOJ4u65CW95I4ECbI05xXAYLXqe3gWQVxWgJkK2lKJDKJtwyNSkXhvR9Kf7ETUcj94p
         NP68auzaduW/0H6QbRtYQnhgBl9fh7aC068Rka7R7FzNiqIMGG5fWCRMFk8EoNI3M08C
         8zZBLDOtOTYQLKyT2OUCTPw8vBeyKp6+kaz/FFrdtIVqp3wJEABknduOMA/in7COkxBS
         Rb8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+ljTKF9d4zHAw4wCO9xXW0iQ3rb405srZ8yyIxs3fE6DWB0cixRxbvo1nNhA/MPTXdc9WPEXvGJEP+Noe6+M4cqYIiBnckMjJ6LSAcfuUBB9rFROIG94b3RkueUtEUZQEDuftqf2YdQvSpw==
X-Gm-Message-State: AOJu0Yx+TbUB5hNlWMLeaX8ftXHypJXZF0h3e1T5SqTn9J7DSrdBN9ny
	nov9z7rJ1JcHktMrRisT6Xk4r56ETvDfUNzIvrVRSX/qcjb1Haxn
X-Google-Smtp-Source: AGHT+IGhcdngXeOZ1/FBm5uE53ZfqMOTB5KQa3ihColXh2Hmq51yPoqYvbtOiaX7FpcBfqnJz7jmYg==
X-Received: by 2002:a17:90a:69c6:b0:2b4:329e:e363 with SMTP id 98e67ed59e1d1-2bd9f45675fmr3112466a91.1.1716414631285;
        Wed, 22 May 2024 14:50:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9f4c604sm252342a91.41.2024.05.22.14.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 14:50:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v3 2/2] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Wed, 22 May 2024 14:50:05 -0700
Message-ID: <20240522215014.26007-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522215014.26007-1-robdclark@gmail.com>
References: <20240522215014.26007-1-robdclark@gmail.com>
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


