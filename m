Return-Path: <linux-arm-msm+bounces-51968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD81A6919A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2C3D7AB706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AFB1E25E3;
	Wed, 19 Mar 2025 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEHQ1U/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C91E22FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395452; cv=none; b=BjCXvY2h2TKF1/moeV7DI54WUbNM0wuBXNawazGr2MsUC2HXjGoN0zi+VEUOnfUvey0M9jM1/wd8ikhIFop5SzNZnvqC94tQNTGlF7Hag5yTtYrSOfcWISW4oeAsyDFvd5XrtzW/pq849kn7u1Op4eSb/bX0ggd+9fKZtDnWqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395452; c=relaxed/simple;
	bh=tTTpB0Ao5UrDtWkZT9tEFwgF3Yy2+aFm7zr2QcY9Sdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2VOcAuM31WcD+M864wAmlruGClsfKSN5907YljR1YieBiRuquqnpulTD92RKDqW28Db9LOoFH5nxlReX+v6fFnq2hPwM/lU3jNF1wx2gHY7Hj9aVsmzZHkqMCCMDaf9cpOiw2xOxcGna6HdjJqYOPA1dH4KfUUpXLWwJ+qrXEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEHQ1U/3; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c548db0aa0so109647085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395450; x=1743000250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVIOe6YO1QFlgbOaSVSB9MxST2MN7teDfhAEgXLqPn8=;
        b=PEHQ1U/3J2R9+zwFjTk4xEeak9tZK1L66uWjWNevlmsullAFvGXudU+Ku/NvCRpGYo
         v0/EQvSUO4p7MhamqXIT+5v0+0k3xl8H8W6FIlqSrO85Uda7p2skxZ18FUuTnz7Ispqy
         9IvAFRQpkZWDbHIfAiEU7/khcoYH4TO46QwqR0RCI86saZbd704uhLSkeUEmgCSlWvoe
         YnqCtfICEBT5mpXhO+SWdluRywXAg7C1+jgUBmqPwHa11mHArKb3iZBIwTZlbO9VME7R
         /Lty4rZB4nxiO80KKVSFeea/CmHkSGENiGjkSHHBwnyakK07XYzCNQcR9PPPO1QE8T8A
         euTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395450; x=1743000250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVIOe6YO1QFlgbOaSVSB9MxST2MN7teDfhAEgXLqPn8=;
        b=lvVcw9MqRFLyLp8FIFg/yQsyJ7SqX5bBLVhud2tzpAK2A2sSSx0TUjJAhqOFLajZIR
         0YoI3Y2IXswzUhPHjwLi7RwOr8z4uxzHumKFNycMJS8szHgLeGbyB/h2GgX06Bv2orGf
         AUr72cYp0QQE2UQyADlPBJeWEoamUZ7hkuFUBYQe+WKUPuoezS10PpisvPibhmGOAIy7
         R1dxoi8dAB4MOdSmP0o5s52K5A35IwLQdMHKFNKLilbAYsUXg+SegIl9ywgqJQbS0zkr
         jRLdiLEc6ygZj9nIxraCBEYPr0hKtrYV77akJOEV+sie/Qzw4a2NQFCFqdtS0ev9VrBU
         R7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVcA+gLDjfyThe4bHHHvsnNqzOm6qmGIuHjcBWLtM0g/lBI3Om9qP+PDYvmT7qU0YZ1czTD8lGvQiy2ZCeC@vger.kernel.org
X-Gm-Message-State: AOJu0YwebDLbRnLMsPUwMhdzg8SJXJyp1ATvi3thCMh7g84OeLoUC979
	EdsWd0YShoB9Lc+Pl1IURklEYoOCslJ4gd/Uf+OkFt9Ii/fdIReE
X-Gm-Gg: ASbGncuezDM7HRYjmpOUWukRpKjiTYgzCM60AdN2UanM8nKupX3MzkV9kqsqgM7VGLm
	Tn1hIgY84R5CSkRDRoeHWMqG9drS/a/lwhXNcc80XjuV4g5kBhLKWCdnB9kvCfdxs5iJuX28ccl
	KxLvJkXCp6rNyFK2aj70N/DdFHzm29s99xJIgT3pGJyxUjWvuypLHNST0TxQRo7oCYaTs/1FOUl
	DPaflM5p0h8qEgJVw5sXbxppHcz37Mix6o7xk6fE4BYV5Riyp7gWdBF704F1JgDkbCqBD4Atg5X
	1tlZRk9Yoq575cbV1Qwr6K4Dl/y7BVjfgGTSvkqMoiB0OSXMt2JiH8TuFwiXpGFNkaBp8Cj3qk0
	C+bs=
X-Google-Smtp-Source: AGHT+IFNRUs3nv+7+hsvhyD1099wEYjZlC8bdXc8Jfmcl+lTK2hcYAEosbvXtZXZvJ/hQAwsmaiwrg==
X-Received: by 2002:a05:620a:2485:b0:7c0:b018:5930 with SMTP id af79cd13be357-7c5a849ceb4mr150552885a.15.1742395449476;
        Wed, 19 Mar 2025 07:44:09 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:09 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:01 -0400
Subject: [PATCH v5 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-2-97561209dd8c@gmail.com>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=5867;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=tTTpB0Ao5UrDtWkZT9tEFwgF3Yy2+aFm7zr2QcY9Sdk=;
 b=SbxyVBfCazjMcZnOBvSnP6XYVUpV1d+ECUu5MQSlhmDcQ2Sqe2AtsfGxR81gtgborBDdYHY9U
 6zMkNpecHzPArS1lpqtpzbf/QtWVL0UWm99pJ9QFFbo6w9vGuBQfa1U
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

In some cases drm/msm has to resume a stalled transaction directly in
its fault handler. Experimentally this doesn't work on SMMU500 if the
fault hasn't already been acknowledged by clearing FSR. Rather than
trying to clear FSR in msm's fault handler and implementing a
tricky handshake to avoid accidentally clearing FSR twice, we want to
clear FSR before calling the fault handlers, but this means that the
contents of registers can change underneath us in the fault handler and
msm currently uses a private function to read the register contents for
its own purposes in its fault handler, such as using the
implementation-defined FSYNR1 to determine which block caused the fault.
Fix this by making msm use the register values already read by arm-smmu
itself before clearing FSR rather than messing around with reading
registers directly.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
 drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4bc24cb52f9233095170e8aa510a53..186d6ad4fd1c990398df4dec53f4d58ada9e658c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -62,16 +62,15 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 		struct adreno_smmu_fault_info *info)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-
-	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
-	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
-	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
-	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
-	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
-	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
-	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	struct arm_smmu_context_fault_info *cfi = &smmu_domain->cfi;
+
+	info->fsr = cfi->fsr;
+	info->fsynr0 = cfi->fsynr0;
+	info->fsynr1 = cfi->fsynr1;
+	info->far = cfi->iova;
+	info->cbfrsynra = cfi->cbfrsynra;
+	info->ttbr0 = cfi->ttbr0;
+	info->contextidr = cfi->contextidr;
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index a02078eb968b81a35c1c086ed7007ea2a453ef94..c7b5d7c093e71050d29a834c8d33125e96b04d81 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -457,26 +457,26 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 {
-	struct arm_smmu_context_fault_info cfi;
 	struct arm_smmu_domain *smmu_domain = dev;
+	struct arm_smmu_context_fault_info *cfi = &smmu_domain->cfi;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
-	arm_smmu_read_context_fault_info(smmu_domain, &cfi);
+	arm_smmu_read_context_fault_info(smmu_domain, cfi);
 
-	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
+	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
-	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-		cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
+		cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
-		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
+		arm_smmu_print_context_fault_info(smmu, idx, cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index ef6915a0d9f62b0a1734a3ee57ea422615036094..ff84ce3b8d8567d3402e945e8277ca2a87df9a4e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_NESTED,
 };
 
+struct arm_smmu_context_fault_info {
+	unsigned long iova;
+	u64 ttbr0;
+	u32 fsr;
+	u32 fsynr0;
+	u32 fsynr1;
+	u32 cbfrsynra;
+	u32 contextidr;
+};
+
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct io_pgtable_ops		*pgtbl_ops;
@@ -380,6 +390,7 @@ struct arm_smmu_domain {
 	const struct iommu_flush_ops	*flush_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
+	struct arm_smmu_context_fault_info cfi;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
@@ -541,16 +552,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
-struct arm_smmu_context_fault_info {
-	unsigned long iova;
-	u64 ttbr0;
-	u32 fsr;
-	u32 fsynr0;
-	u32 fsynr1;
-	u32 cbfrsynra;
-	u32 contextidr;
-};
-
 void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_context_fault_info *cfi);
 

-- 
2.47.1


