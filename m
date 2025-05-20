Return-Path: <linux-arm-msm+bounces-58774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0C3ABE361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB4D83A7021
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E53E27D771;
	Tue, 20 May 2025 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwColbzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2950B27815B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768144; cv=none; b=FoCzSZm+Qs1yEQOTGkKk0/tgxPN2VbpKCEEAwkqByykGfd8Ri2xk8qQ2yFoyQRfJjWMljQNPJ9g2v4hVApStUgz8vFS17e52NNl4l3CIyAKNTjlY6cczaypOiEH7d0Uf0E18K19SkOl6NCQzUvcWPRQWpq7Lplii0vBPdxUr7eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768144; c=relaxed/simple;
	bh=xmVtxKp7l1nH9HRMvlhp+AXA8iIyclW4FjVkhjfpiJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dF8I0YCy8AC11HYJ9UaSoY4STEo0uGO8X2FfNBIxeFKGyB8U0Bvz3JlNUzOFPB19pllnb4xyEXrPyLNHnkrnzV0jVpgyu5HJOIHyH2RHa+2TeuTwOa5fkjG2cOvuRAplqixpbI4fRlRW/MRXXdth+VJkgTfHbae4+OeEGqyEZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwColbzL; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f2b58f0d09so8847356d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768142; x=1748372942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
        b=FwColbzLglaYHzf6Qz9wu/K3SdGiE2vaCd0k3UcvvBzZ80d7tUudwvSs8AbBxT1RUA
         2ApZ+DbrJCJc1RQcdUjUc+KrSIQXOOKtMEY+mqLmLILhPk7EAu56RY1t7nV0eyZbqLRo
         5zCLajqPLyDrZsi86//SB1K5247F2yWSn0fVLguSK6EWQPbqAGJkccg6933oo27oW8IK
         O0iHVr3+Z/jnqQHEEzm2dvybHlNMejCAUvJPRmeQOGMDAx4vk+XUkF5MCxBJhXHKh20J
         OS749VXvBGWDFlNvdzXTeZgoXxCsa54Aif2ma2GhvG3Zaf2SDyc5WEzV1s/V2GeV5XqK
         i6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768142; x=1748372942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
        b=mAYIYgBRjmdriMKbO/f1VStWJTTuSEPuXUWdNc7ZM+0eedK1h41aGv+d+LRHgY80Gp
         x9gH/Cyh1LXF70BmsPrkzhwUOHWlQ7A1hWedNHigWUSvEfPjXvY+L8nHkaZ5q2nrL43H
         sPtaToI+Y+HHLIvw+9eC+0zTz8q37Vl/acPbCYIZYamaC1hzRshzWjJlk0q6yFQAfdue
         VwGtsA8vBMuudQ5azPz/8mop/DAoyr7WfKkNe3czpq/G4pc9BrR1AZxZ4Hkjbd13P2BI
         2ytII1KHvx3QB0TwjrzqELnL248RNQh6UfkgvmSGKF3rRjQWLcMbyTuCTVqG+4ClKQeZ
         xU6g==
X-Forwarded-Encrypted: i=1; AJvYcCUJP3nQq89zJw3Y4usbNRq+t2htksFE5p3tPVkCyrCMvlv+voTREYT5t9j3LRDRSpauUL4YpkEihTZMYKLV@vger.kernel.org
X-Gm-Message-State: AOJu0YxyaIrHb/5xTpszCWH4HLtXE8J//I1yIdTSiS9ZY9Tm3N+zz6gf
	R8fculRS9ONGuh+hn2ZvI//rHi7bNTtZd+LmP2089stzBDci9m+JpeUx
X-Gm-Gg: ASbGncuYqMOIQ2S+lDdu4+P5MMJ1w8v5MuJa1tw7IpR3Ul5EXFRDWa95coW74UyEHB1
	JmXqjTLfJVOrf8N1ADTyvrlcmcATtd5AYSRo4cYYkzdX46t9pvKCT4oUHkVgPppJBhxQV9XJiSS
	u/d6ctWt8Ce79pc4o2KOxwA8hDveaAtIbKCb2Mixf+6q+GvWrNMGDl4eSR5eDE8hJZb4zATJGwD
	4RhMdXE3MarlZVAmrh4hDwLVHfuXwWa0LS0FVRCt3qPfJ4eWUcrxenDBDnxNVLoxG0DRZICtuV+
	qMSaLImdJeH7L2bl2iQUzr59q7DbmPNPvKSX2tj2j0rTiBnIzl9Wwe4CI9mYEc1LcL17vhFVySD
	abxHNDqo/bj4QbS42mwc=
X-Google-Smtp-Source: AGHT+IFjLmYqaKLHPS+01zHa2///cFu/CXjL/ulMSueMZ2cjR11HyScFFNVGZ0K50+a/0b0pvW5/Nw==
X-Received: by 2002:a05:622a:1444:b0:471:ea1a:d9e with SMTP id d75a77b69052e-494ae3f24abmr103477651cf.12.1747768141896;
        Tue, 20 May 2025 12:09:01 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:01 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:55 -0400
Subject: [PATCH v8 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-2-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=5304;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=xmVtxKp7l1nH9HRMvlhp+AXA8iIyclW4FjVkhjfpiJg=;
 b=R9Qrdk+aCSBCIG9HTDvSktf7A7GtrulqV4E10X0kJ7Yd5pExhrEumGzEbGK+ajvv2fm2NcdnU
 zCVQ7U/1Bn6Coy3wGGCl4TjDEVPJPXR5CoRuRTG6lRNa2ucwCE6WGoU
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

The upper layer fault handler is now expected to handle everything
required to retry the transaction or dump state related to it, since we
enable threaded IRQs. This means that we can take charge of writing
RESUME, making sure that we always write it after writing FSR as
recommended by the specification.

The iommu handler should write -EAGAIN if a transaction needs to be
retried. This avoids tricky cross-tree changes in drm/msm, since it
never wants to retry the transaction and it already returns 0 from its
fault handler. Therefore it will continue to correctly terminate the
transaction without any changes required.

devcoredumps from drm/msm will temporarily be broken until it is fixed
to collect devcoredumps inside its fault handler, but fixing that first
would actually be worse because MMU-500 ignores writes to RESUME unless
all fields of FSR (except SS of course) are clear and raises an
interrupt when only SS is asserted. Right now, things happen to work
most of the time if we collect a devcoredump, because RESUME is written
asynchronously in the fault worker after the fault handler clears FSR
and finishes, although there will be some spurious faults, but if this
is changed before this commit fixes the FSR/RESUME write order then SS
will never be cleared, the interrupt will never be cleared, and the
whole system will hang every time a fault happens. It will therefore
help bisectability if this commit goes first.

I've changed the TBU path to also accept -EAGAIN and do the same thing,
while keeping the old -EBUSY behavior. Although the old path was broken
because you'd get a storm of interrupts due to returning IRQ_NONE that
would eventually result in the interrupt being disabled, and I think it
was dead code anyway, so it should eventually be deleted. Note that
drm/msm never uses TBU so this is untested.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 14 --------------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 ++++++
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index d03b2239baad48680eb6c3201c85f924ec4a0e07..65e0ef6539fe70aabffa0c8fbe444c34c620d367 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -406,6 +406,12 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+		if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+					  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+		}
+
 		return IRQ_HANDLED;
 	}
 
@@ -416,6 +422,9 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
+	} else if (tmp == -EAGAIN) {
+		ret = IRQ_HANDLED;
+		resume = 0;
 	} else {
 		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, cfi.iova, cfi.fsr);
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 4d3b99babd3584ec971bef30cd533c35904fe7f5..c84730d33a30c013a37e603d10319fb83203eaa5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -120,19 +120,6 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
 }
 
-static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)
-{
-	struct arm_smmu_domain *smmu_domain = (void *)cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
-
-	if (terminate)
-		reg |= ARM_SMMU_RESUME_TERMINATE;
-
-	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
-}
-
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
@@ -337,7 +324,6 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8f439c265a23f16bd11801a93dae12fd476ddfb2..8d95b14c7d5a4040bb8add56475e297beb16b162 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -474,6 +474,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+	}
+
 	return IRQ_HANDLED;
 }
 

-- 
2.47.1


