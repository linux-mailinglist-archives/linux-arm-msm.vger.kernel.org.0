Return-Path: <linux-arm-msm+bounces-24537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62C91B215
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 00:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46CDF1F21044
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 22:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757A96A33F;
	Thu, 27 Jun 2024 22:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kreUrFEn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D51EB40;
	Thu, 27 Jun 2024 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526585; cv=none; b=oMu2WZB0ibNKK6pw/6fkdJItXXJnVfwMf4/cHBemSYRQN2phiG5pG3jDaI5BA0x1D3RKlDy/2VBUjWFPIQ1ejQ8PHAGmRUAcT9oJbj/OHH4o1220BMI/qKUK0hHpvGjWkFHqHkdSnXd17z8EMP6iIS3awOW9wWibY7kozb9dKbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526585; c=relaxed/simple;
	bh=m8bVllx/nLVMVsBGj69yMYzJkceFkXa+iQDUWGuoX5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePW9mBH0YmCwffxWXeAmzfcz5/F2AqgbylY+YkGANY8ij12GLdbeytoCZmCz3bpgEkoLx1+7kn81EOmuAm9xLlW7WKQHnfJA9SEcmgElXI90ktsZTmORnglSRh4n3kkVubQzy2Lq6/5KarIUuRqw6+iOu4PVuPtL4ikfAk111QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kreUrFEn; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-72b070c377aso5864a12.1;
        Thu, 27 Jun 2024 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719526583; x=1720131383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irwpOc2Hf1wvjl7oHm37Us7J1GWyzttF2I5IYFfC3Ys=;
        b=kreUrFEnxMVPblo70eSQ2VBvfYKJvDiXF6Rg+mD/A5BrKZ/8oCMNNi0JTtl+W48vf+
         r2lobhGfPmx2lkPZ1lWspD6QWSxqHy2SLAW2V+FeQlO0IV6H8G2+cv6UnV7WtF5jP6qs
         eoyqfwt/OKo9aGcEPiCntkSmD1Q37T4xWZwJpZ7cJ62OOrOGOBPKyblaz7QgUMM+BF8m
         1MywljUsVueKpqfmu2I06O83/dSeB+mVP/r8n2hyJMWnfRSrG072hHRWTHcE/o9Wz207
         cBCxCgcJkMPb7r4tEs8hYyyVub/PSGIN3nL4ZADeEaeZwrwd7Ig5bEPTsgLvlzO59na3
         k0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719526583; x=1720131383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irwpOc2Hf1wvjl7oHm37Us7J1GWyzttF2I5IYFfC3Ys=;
        b=wjqK41+fkJr6qLOG1PsV5md4YzztEIBvqpLh+RNlFIDsQY+O/cWGB70SenZYgBoc6U
         fpkUGpb8f7qMlAqeNYy1nh90CIR1841jNPI5Du0ICn+zhJm6vClFHcygpe88cdU/lWLO
         iLe/4tVe9Cy4DXfVHSXyOw9t8hPn+ZTFVAUe45xo68FcgxJ4mh0dxHRtAVlIbSbK3ouP
         5Eo2S/Rt5GF4xjGz1BXkXE62GAwoqJy6TO0wcNuCX1cUVk+X0zpHpvEDV4prekltp6XO
         DBeATsyxAFMENTBv7leBa6aIL9f2z7TLgSgUuIV0qStoxNuYEMTTYOy7dk1uyzRK7epu
         7vRg==
X-Forwarded-Encrypted: i=1; AJvYcCUcdG/PY2F2YKrXucTTlJkBk1GYvzghnEOjo6JRGUgLxA4pRwDlK8R+GCTt/UAR5sJjJ2XQKS/vTPiqwhO3PNWfvYLeZ5WtdvGXTr3P
X-Gm-Message-State: AOJu0YxV3hN+JihyjS2gf60rQg74j7S56yY1VHVflrMRWaOWlntxD45G
	m8Qivpy+iWHnl3VHmkeu1IfkZomrmjLKXlDrSzEBBl+SQVIf7hrm
X-Google-Smtp-Source: AGHT+IE6iKcxcL2UWgUzJoVoh9tDerL+8j5mIX3PUPZmbly2QI5PJjQqRuYbZCWcgScmSQuiQ/eYRw==
X-Received: by 2002:a17:90a:5792:b0:2c8:4f4e:d438 with SMTP id 98e67ed59e1d1-2c8fcf71313mr4248137a91.4.1719526582823;
        Thu, 27 Jun 2024 15:16:22 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce76935sm297528a91.34.2024.06.27.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:16:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Pranjal Shrivastava <praan@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] iommu/arm-smmu: Pretty-print context fault related regs
Date: Thu, 27 Jun 2024 15:16:08 -0700
Message-ID: <20240627221613.393060-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Parse out the bitfields for easier-to-read fault messages.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 62 ++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 +++++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.h         | 67 ++++++++++++------
 3 files changed, 119 insertions(+), 80 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 552199cbd9e2..da2e605014a5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -141,7 +141,7 @@ static int qcom_tbu_halt(struct qcom_tbu *tbu, struct arm_smmu_domain *smmu_doma
 	writel_relaxed(val, tbu->base + DEBUG_SID_HALT_REG);
 
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	if ((fsr & ARM_SMMU_FSR_FAULT) && (fsr & ARM_SMMU_FSR_SS)) {
+	if ((fsr & ARM_SMMU_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS)) {
 		u32 sctlr_orig, sctlr;
 
 		/*
@@ -306,7 +306,7 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_domain *smmu_domain,
 		 * TBU halt takes care of resuming any stalled transcation.
 		 * Kept it here for completeness sake.
 		 */
-		if (fsr & ARM_SMMU_FSR_SS)
+		if (fsr & ARM_SMMU_CB_FSR_SS)
 			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
 					  ARM_SMMU_RESUME_TERMINATE);
 	}
@@ -324,7 +324,7 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_domain *smmu_domain,
 				/* Clear pending interrupts */
 				arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
 
-				if (fsr & ARM_SMMU_FSR_SS)
+				if (fsr & ARM_SMMU_CB_FSR_SS)
 					arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
 							  ARM_SMMU_RESUME_TERMINATE);
 			}
@@ -383,68 +383,46 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	struct arm_smmu_domain *smmu_domain = dev;
 	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 fsr, fsynr, cbfrsynra, resume = 0;
+	struct arm_smmu_context_fault_info cfi;
+	u32 resume = 0;
 	int idx = smmu_domain->cfg.cbndx;
 	phys_addr_t phys_soft;
-	unsigned long iova;
 	int ret, tmp;
 
 	static DEFINE_RATELIMIT_STATE(_rs,
 				      DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
-	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	if (!(fsr & ARM_SMMU_FSR_FAULT))
-		return IRQ_NONE;
+	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
-	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
-	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
-	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	if (!(cfi.fsr & ARM_SMMU_FSR_FAULT))
+		return IRQ_NONE;
 
 	if (list_empty(&tbu_list)) {
-		ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-					 fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
+					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 		if (ret == -ENOSYS)
-			dev_err_ratelimited(smmu->dev,
-					    "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-					    fsr, iova, fsynr, cbfrsynra, idx);
+			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
-		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
 		return IRQ_HANDLED;
 	}
 
-	phys_soft = ops->iova_to_phys(ops, iova);
+	phys_soft = ops->iova_to_phys(ops, cfi.iova);
 
-	tmp = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-				 fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
+				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
-		dev_dbg(smmu->dev,
-			"Context fault handled by client: iova=0x%08lx, fsr=0x%x, fsynr=0x%x, cb=%d\n",
-			iova, fsr, fsynr, idx);
+		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 		dev_dbg(smmu->dev, "soft iova-to-phys=%pa\n", &phys_soft);
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
 	} else {
-		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, iova, fsr);
+		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, cfi.iova, cfi.fsr);
 
 		if (__ratelimit(&_rs)) {
-			dev_err(smmu->dev,
-				"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-				fsr, iova, fsynr, cbfrsynra, idx);
-			dev_err(smmu->dev,
-				"FSR    = %08x [%s%s%s%s%s%s%s%s%s], SID=0x%x\n",
-				fsr,
-				(fsr & 0x02) ? "TF " : "",
-				(fsr & 0x04) ? "AFF " : "",
-				(fsr & 0x08) ? "PF " : "",
-				(fsr & 0x10) ? "EF " : "",
-				(fsr & 0x20) ? "TLBMCF " : "",
-				(fsr & 0x40) ? "TLBLKF " : "",
-				(fsr & 0x80) ? "MHF " : "",
-				(fsr & 0x40000000) ? "SS " : "",
-				(fsr & 0x80000000) ? "MULTI " : "",
-				cbfrsynra);
+			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 			dev_err(smmu->dev,
 				"soft iova-to-phys=%pa\n", &phys_soft);
@@ -478,10 +456,10 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	 */
 	if (tmp != -EBUSY) {
 		/* Clear the faulting FSR */
-		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
 
 		/* Retry or terminate any stalled transactions */
-		if (fsr & ARM_SMMU_FSR_SS)
+		if (cfi.fsr & ARM_SMMU_CB_FSR_SS)
 			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME, resume);
 	}
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 87c81f75cf84..246a39081879 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -405,32 +405,72 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
 	.tlb_add_page	= arm_smmu_tlb_add_page_s2_v1,
 };
 
+
+void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
+				      struct arm_smmu_context_fault_info *cfi)
+{
+	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
+	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
+	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+}
+
+void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
+				       const struct arm_smmu_context_fault_info *cfi)
+{
+	dev_dbg(smmu->dev,
+		"Context fault handled by client: iova=0x%08lx, fsr=0x%x, fsynr=0x%x, cb=%d\n",
+		cfi->iova, cfi->fsr, cfi->fsynr, idx);
+
+	dev_err(smmu->dev, "FSR    = %08x [%s%sFormat=%u%s%s%s%s%s%s%s%s], SID=0x%x\n",
+		cfi->fsr,
+		(cfi->fsr & ARM_SMMU_CB_FSR_MULTI)  ? "MULTI " : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_SS)     ? "SS " : "",
+		(u32)FIELD_GET(ARM_SMMU_CB_FSR_FORMAT, cfi->fsr),
+		(cfi->fsr & ARM_SMMU_CB_FSR_UUT)    ? " UUT" : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_ASF)    ? " ASF" : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_TLBLKF) ? " TLBLKF" : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_TLBMCF) ? " TLBMCF" : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_EF)     ? " EF" : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_PF)     ? " PF" : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_AFF)    ? " AFF" : "",
+		(cfi->fsr & ARM_SMMU_CB_FSR_TF)     ? " TF" : "",
+		cfi->cbfrsynra);
+
+	dev_err(smmu->dev, "FSYNR0 = %08x [S1CBNDX=%u%s%s%s%s%s%s PLVL=%u]\n",
+		cfi->fsynr,
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
+		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
+		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
+		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
+		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
+		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
+		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
+}
+
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 {
-	u32 fsr, fsynr, cbfrsynra;
-	unsigned long iova;
+	struct arm_smmu_context_fault_info cfi;
 	struct arm_smmu_domain *smmu_domain = dev;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
-	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	if (!(fsr & ARM_SMMU_FSR_FAULT))
-		return IRQ_NONE;
+	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
-	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
-	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
-	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	if (!(cfi.fsr & ARM_SMMU_FSR_FAULT))
+		return IRQ_NONE;
 
-	ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
+		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
-	if (ret == -ENOSYS)
-		dev_err_ratelimited(smmu->dev,
-		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-			    fsr, iova, fsynr, cbfrsynra, idx);
+	if (ret == -ENOSYS && __ratelimit(&rs))
+		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 4765c6945c34..faf475366d4d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -196,34 +196,42 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_PAR_F		BIT(0)
 
 #define ARM_SMMU_CB_FSR			0x58
-#define ARM_SMMU_FSR_MULTI		BIT(31)
-#define ARM_SMMU_FSR_SS			BIT(30)
-#define ARM_SMMU_FSR_UUT		BIT(8)
-#define ARM_SMMU_FSR_ASF		BIT(7)
-#define ARM_SMMU_FSR_TLBLKF		BIT(6)
-#define ARM_SMMU_FSR_TLBMCF		BIT(5)
-#define ARM_SMMU_FSR_EF			BIT(4)
-#define ARM_SMMU_FSR_PF			BIT(3)
-#define ARM_SMMU_FSR_AFF		BIT(2)
-#define ARM_SMMU_FSR_TF			BIT(1)
-
-#define ARM_SMMU_FSR_IGN		(ARM_SMMU_FSR_AFF |		\
-					 ARM_SMMU_FSR_ASF |		\
-					 ARM_SMMU_FSR_TLBMCF |		\
-					 ARM_SMMU_FSR_TLBLKF)
-
-#define ARM_SMMU_FSR_FAULT		(ARM_SMMU_FSR_MULTI |		\
-					 ARM_SMMU_FSR_SS |		\
-					 ARM_SMMU_FSR_UUT |		\
-					 ARM_SMMU_FSR_EF |		\
-					 ARM_SMMU_FSR_PF |		\
-					 ARM_SMMU_FSR_TF |		\
+#define ARM_SMMU_CB_FSR_MULTI		BIT(31)
+#define ARM_SMMU_CB_FSR_SS		BIT(30)
+#define ARM_SMMU_CB_FSR_FORMAT		GENMASK(10, 9)
+#define ARM_SMMU_CB_FSR_UUT		BIT(8)
+#define ARM_SMMU_CB_FSR_ASF		BIT(7)
+#define ARM_SMMU_CB_FSR_TLBLKF		BIT(6)
+#define ARM_SMMU_CB_FSR_TLBMCF		BIT(5)
+#define ARM_SMMU_CB_FSR_EF		BIT(4)
+#define ARM_SMMU_CB_FSR_PF		BIT(3)
+#define ARM_SMMU_CB_FSR_AFF		BIT(2)
+#define ARM_SMMU_CB_FSR_TF		BIT(1)
+
+#define ARM_SMMU_FSR_IGN		(ARM_SMMU_CB_FSR_AFF |		\
+					 ARM_SMMU_CB_FSR_ASF |		\
+					 ARM_SMMU_CB_FSR_TLBMCF |	\
+					 ARM_SMMU_CB_FSR_TLBLKF)
+
+#define ARM_SMMU_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
+					 ARM_SMMU_CB_FSR_SS |		\
+					 ARM_SMMU_CB_FSR_UUT |		\
+					 ARM_SMMU_CB_FSR_EF |		\
+					 ARM_SMMU_CB_FSR_PF |		\
+					 ARM_SMMU_CB_FSR_TF |		\
 					 ARM_SMMU_FSR_IGN)
 
 #define ARM_SMMU_CB_FAR			0x60
 
 #define ARM_SMMU_CB_FSYNR0		0x68
-#define ARM_SMMU_FSYNR0_WNR		BIT(4)
+#define ARM_SMMU_CB_FSYNR0_PLVL		GENMASK(1, 0)
+#define ARM_SMMU_CB_FSYNR0_WNR		BIT(4)
+#define ARM_SMMU_CB_FSYNR0_PNU		BIT(5)
+#define ARM_SMMU_CB_FSYNR0_IND		BIT(6)
+#define ARM_SMMU_CB_FSYNR0_NSATTR	BIT(8)
+#define ARM_SMMU_CB_FSYNR0_PTWF		BIT(10)
+#define ARM_SMMU_CB_FSYNR0_AFR		BIT(11)
+#define ARM_SMMU_CB_FSYNR0_S1CBNDX	GENMASK(23, 16)
 
 #define ARM_SMMU_CB_FSYNR1		0x6c
 
@@ -533,4 +541,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
+struct arm_smmu_context_fault_info {
+	unsigned long iova;
+	u32 fsr;
+	u32 fsynr;
+	u32 cbfrsynra;
+};
+
+void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
+				      struct arm_smmu_context_fault_info *cfi);
+
+void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
+				       const struct arm_smmu_context_fault_info *cfi);
+
 #endif /* _ARM_SMMU_H */
-- 
2.45.2


