Return-Path: <linux-arm-msm+bounces-45462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50211A15795
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 19:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9FBE3A7BF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0481D1A9B3C;
	Fri, 17 Jan 2025 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnU4C7H/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E451A9B24
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737139662; cv=none; b=MSPW0n6WIFEVvvMR8VKtokrBlIDpkIlG/V/I/XQfsETQ0eL3f+p/UfzH+mNDBn5WMj7NBNX+zKS1wXsnm130WBt8E3eL+hd7KQ2V1i6UQqF62cxwM0d8pwZhmVC7bglzaqrYV1yC+CoUjnhLkJVwRjtYG6FsCE796TpJgis7sao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737139662; c=relaxed/simple;
	bh=7AFM9ok1w81f2C++Gf69M3gwTiOfZOHfwkbHtBmlR6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h01jPKZbgwNHRQYQsQsyphFrBji9yUtHQ3mUVSWsJ/RCfWIerDPA/CjIaj+ctA3d+FZQgV3SZLUqHM+UEVnDJkPAhkYcL1F9Y/p1N70dNPIME/3CU24r7OFpJ7L3hnuspZxsu+IzkTU9pBm2meqvIj/Cr/Y65r1XebVkHlNLiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnU4C7H/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dafe70ccd6so4251156d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 10:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139660; x=1737744460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thdukG+G+Hf8HToZ/Gcz+gc/k0VJqX4Uv/6IUD32wZs=;
        b=DnU4C7H/I/4+Wo02u32dUDI15HCFEkkjy949lrxypeyExQ+XE4JQ4tPSZFbppS+7KH
         Aam09kiy+dlEYN5IJ4iMafpfbZKZQINlG6cnICP0a32z/5f0QEWnG1jPMtjQ8/RXCptf
         mhmo8ZLZBsZXT/TTmLT+XPly+m5KpHa6YrPTKXsRDMiC7SM1K6ShDdcJhe81lleFo9Oz
         5K9VGrdVSvJR/e5pMD0sBGx/TlTfGo2zvBqmsi9f2brx9uML2a0T6oraCpJbEc27kts2
         yHtjSTsbrCamJIKLnxeNQK35mgjHLPFg/pQvtJ9NkwzAYsEaC/kGaNvtZv13NArv45SM
         DrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139660; x=1737744460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thdukG+G+Hf8HToZ/Gcz+gc/k0VJqX4Uv/6IUD32wZs=;
        b=iwbbdWT7o2xhTtymx0i7KSwFGwULfsofepw4xmkpSW9dulRSW+ipSg9s05zfbnsppA
         prt3PqF0T44lvTTfv/HYQoTWG9bLojIbTv6n8dNxB4il26daRB91JrlCLC5pD8p0kmp1
         4opvKCxY/9Vd+5e3n31cLuGvVDaG9p5tR5yBcgf2dp49Msy0/IhLddLxgNWJFEPcS+3M
         km2qQ7aodSz1P1jVV3waUfZcgL7c1d+mJqIVAwck+X0WlH4Vx0Af5vAyab0BnaiCA3ne
         foFdrNI1p1AoPviFxTUvdAgBGk8z+xIiSvCWzea3Wn3pULjmuqzIsQyJA7AotX/mAu7L
         A4rA==
X-Forwarded-Encrypted: i=1; AJvYcCUPoq9OyYcEi/WAcsnEvgn3LntNXhBp+DwFqEyRQ56Xau97G3KdyijSSGCfbiWLMaBNud82KOhA30XgEUlY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/pWNSahuiWG5hIPMdyd8py5DbjIK2A9MiamIdCWn147LnBeY/
	RjA0rcUb+kfphrsHm3gFyqc+gneWn1VZMujxop6ZMZmVi3kRkkbB
X-Gm-Gg: ASbGncujR0FLyeeKeXEq4KXcY0ofdZnE5u2Ag1JknN3Tnv59F19MQjR6bkiYBIhkZjG
	mot1/xA1NnI9MPlnKMtyjCYfNc+acxhWmrCvCbmRF27j8YyYXjQp6C5/srYi7qp0lVrpx/3dEHs
	lTdBJRQA2DyYEAqGlTVOLKC5lZ5yfFHp0/7dfPTQjMZi9xNFJyVyrZj9CLlwDuWV/RmllKuDxZ3
	vVvdS9HmDEIXxKLhFKDu9l212upaJwDrOwYtnwXsRlxoTZG5ZGREVpu46iVKs3M/OoPSLuQpfhL
	qEFJo2+LPpdIQOg=
X-Google-Smtp-Source: AGHT+IFCtwKid4R9G/cATIXezUnzqNQSbD7LKvgass5fNNZc7tPfiHB8Zo6yUqQCv+onFrLudNkh8Q==
X-Received: by 2002:a05:6214:27e5:b0:6d8:967a:1a60 with SMTP id 6a1803df08f44-6e1b2155c60mr25286736d6.2.1737139658289;
        Fri, 17 Jan 2025 10:47:38 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:37 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 17 Jan 2025 13:47:07 -0500
Subject: [PATCH 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-1-bc9b332b5d0b@gmail.com>
References: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
In-Reply-To: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=5695;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=7AFM9ok1w81f2C++Gf69M3gwTiOfZOHfwkbHtBmlR6U=;
 b=X+UwyS84Mnzz7AGUA5nnVxAYS//fGOH+DQuYOJ9NlINCnfa/ZQ7Lo1kEPeJsOuB3QXodNs8nF
 iU2wOQc8uUUBczya9xYLQs0rwFL2blr/6XtA1wGsbUnBXZjEb0pUDBH
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
asserts an interrupt. The only way to clear that bit is to resume the
transaction by writing SMMU_CBn_RESUME, but typically resuming the
transaction requires complex operations (copying in pages, etc.) that
can't be done in IRQ context. drm/msm already has a problem, because
its fault handler sometimes schedules a job to dump the GPU state and
doesn't resume translation until this is complete.

Work around this by disabling context fault interrupts until after the
transaction is resumed. Because other context banks can share an IRQ
line, we may still get an interrupt intended for another context bank,
but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
it assuming that interrupts are disabled which is accomplished by
removing the bit from ARM_SMMU_CB_FSR_FAULT.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 +++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 32 ++++++++++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +-
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ee2fdf7e79a6d04bc2700e454253c96b573c5569 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
+	u32 reg = 0, sctlr;
+	unsigned long flags;
 
 	if (terminate)
 		reg |= ARM_SMMU_RESUME_TERMINATE;
 
+	spin_lock_irqsave(&smmu_domain->stall_lock, flags);
+
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
+
+	/*
+	 * Re-enable interrupts after they were disabled by
+	 * arm_smmu_context_fault().
+	 */
+	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+	sctlr |= ARM_SMMU_SCTLR_CFIE;
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
+
+	spin_unlock_irqrestore(&smmu_domain->stall_lock, flags);
 }
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..c92de760940ee2872f22dbe1b2519e02766aa143 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -457,12 +457,43 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 				      DEFAULT_RATELIMIT_BURST);
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
+	unsigned long flags;
 
 	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
 	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
+	/*
+	 * On some implementations FSR.SS asserts a context fault
+	 * interrupt. We do not want this behavior, because resolving the
+	 * original context fault typically requires operations that cannot be
+	 * performed in IRQ context but leaving the stall unacknowledged will
+	 * immediately lead to another spurious interrupt as FSR.SS is still
+	 * set. Work around this by disabling interrupts for this context bank.
+	 * It's expected that interrupts are re-enabled after resuming the
+	 * translation.
+	 *
+	 * We have to do this before report_iommu_fault() so that we don't
+	 * leave interrupts disabled in case the downstream user decides the
+	 * fault can be resolved inside its fault handler.
+	 *
+	 * There is a possible race if there are multiple context banks sharing
+	 * the same interrupt and both signal an interrupt in between writing
+	 * RESUME and SCTLR. We could disable interrupts here before we
+	 * re-enable them in the resume handler, leaving interrupts enabled.
+	 * Lock the write to serialize it with the resume handler.
+	 */
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		u32 val;
+
+		spin_lock_irqsave(&smmu_domain->stall_lock, flags);
+		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
+		val &= ~ARM_SMMU_SCTLR_CFIE;
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
+		spin_unlock_irqrestore(&smmu_domain->stall_lock, flags);
+	}
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
@@ -921,6 +952,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&smmu_domain->init_mutex);
 	spin_lock_init(&smmu_domain->cb_lock);
+	spin_lock_init(&smmu_domain->stall_lock);
 
 	return &smmu_domain->domain;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2dbf3243b5ad2db01e17fb26c26c838942a491be..153fac131b2484d468fd482ffbf130efc8cfb8f6 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\
@@ -384,6 +383,7 @@ struct arm_smmu_domain {
 	enum arm_smmu_domain_stage	stage;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
+	spinlock_t                      stall_lock;
 	struct iommu_domain		domain;
 };
 

-- 
2.47.1


