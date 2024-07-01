Return-Path: <linux-arm-msm+bounces-24810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0585D91E532
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C030B22462
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 16:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6149A16D9D8;
	Mon,  1 Jul 2024 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6F8rl47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA2F16E882;
	Mon,  1 Jul 2024 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850853; cv=none; b=eH9k/7QdmdyfEhjD8XvZGpARM4yD4xx4YOgf00D0bQafTmwfjUsx4wgvg0xURRgqUIJG5SwpstwhHOkSnzmiwi248ZBgg0wImk4Sy2hf4uqQciMQ00kee7esG3m6MoFhJqN83Ce1gQdxhB50MP+/xCGm+D45oo+Z/BQU/nLkk3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850853; c=relaxed/simple;
	bh=MvH/8Rt8wJ7iRnssgZiatXc095VzIPFVW1OPYcyI68A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i02PE1ON4HeCDxvq3mjEt77125N5tASZuPIeZow8YAiL8+U8m6vqs/OZZqcfdM9h9Z5PlHQ8rYJGH2ItAKKgesSpNfns7rHT1tMVg30RRdt3uDPXbsJrqssoGGuGcaWEpYKEI+GXZ0V72VJZGw+reZWbp11Fz/AT40Zz8ujsn8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6F8rl47; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6eab07ae82bso1773690a12.3;
        Mon, 01 Jul 2024 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850851; x=1720455651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcCQm16abjlGuhHVctKC5KbjGKSk1x2+sDYR2CB9B98=;
        b=A6F8rl47/8/QI2/jV9rFnKrkyye40sGnZbn73hHdN0aiDRsJ7geCUd3d//TghGGL5I
         1cZpT/QHWoDkzPnnB/pJ3macB51npkyiyOCP0Pi2LzYn7dHuwKCNzqWL3wZnDaUGdQCN
         Na8R1Jfa3ZiOTTqEoYs8IF67ygGCiz/oHOaY922LAW/XH1BPj7x5J0aNPpcA9f7ohxUX
         OR5HK/6LOv7mQvG72tFr8pn9ZidmzRxwykXATUPOzYIz9GPVcoKZC3bFuyQi3SbqIKuL
         i/mkQCKsG450gPBzybjZml+myE/5+hXlQq+0ndkCmZL6gQOeTnRG++rSqTjxiVdWyL6T
         X1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850851; x=1720455651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcCQm16abjlGuhHVctKC5KbjGKSk1x2+sDYR2CB9B98=;
        b=AD3K88pouBzhWFVFINmW2pZhFBy0nWwjZAp89wJypDAW7ZnaIcwbQnfs+ihrd3Govp
         MQUpKT8T+bGMlcEK8dRN1AlI1RAMOF775PeVu0Dd1OwD0lLdQZhQEowa6a51KMCDRgPo
         R2G0jB8MTRE9qd6iiyUacwWT3+6faYsqKfsLqPWiN8w0Jy5Ou/8SnIzOOUpwv9y+f1+k
         AK8JR8yElCCgeG7oGacfqilgGrKn2OLAJHijxLagRSfX575TA6OmsNZJ8Ibmzt4QukmR
         6+9ds9tZ0o40/Vg5CqMsgq6wqt8WioEKVUeZPuTqoUqCh4dUt+qFB4Be/snREiuDQDXh
         huWw==
X-Forwarded-Encrypted: i=1; AJvYcCUv/SQuFyKI2lcwVrZnFehwnqJYpU/uDg9V/M84NF1j49+lH+uzUNwhllNQOTln4zso6xf67u7OkP8KmVrI5S7DobzwxWol6qG9MnWX
X-Gm-Message-State: AOJu0YxMNVqRAUIidnXsOBwOhqFhi3TqDxBK0xgABcm34W32Jpu6L6u+
	MoG3fazubq7Qlu35qSG9GASHsyo4VNCEN3ojFHgE3ATUurgIvmld
X-Google-Smtp-Source: AGHT+IHrTptgHpbkf7m9fppXPFqapatA5w6Him+ZXaPS92rxGNkmx3F6YOre0k/mP2bMzO0C7aFkvQ==
X-Received: by 2002:a05:6a20:3d81:b0:1be:f783:3d4f with SMTP id adf61e73a8af0-1bef783400bmr5430692637.43.1719850850678;
        Mon, 01 Jul 2024 09:20:50 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538979sm66611085ad.159.2024.07.01.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:20:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Pranjal Shrivastava <praan@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/3] iommu/arm-smmu: Pretty-print context fault related regs
Date: Mon,  1 Jul 2024 09:20:12 -0700
Message-ID: <20240701162025.375134-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701162025.375134-1-robdclark@gmail.com>
References: <20240701162025.375134-1-robdclark@gmail.com>
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
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 52 +++++---------
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 +++++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.h         | 21 ++++++
 3 files changed, 92 insertions(+), 51 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 681fbdfc325d..ef93f825f11f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -383,64 +383,44 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
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
-	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
-		return IRQ_NONE;
+	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
-	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
-	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
-	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
+		return IRQ_NONE;
 
 	if (list_empty(&tbu_list)) {
-		ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-					 fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
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
-				 fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
+				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
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
@@ -474,10 +454,10 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	 */
 	if (tmp != -EBUSY) {
 		/* Clear the faulting FSR */
-		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
 
 		/* Retry or terminate any stalled transactions */
-		if (fsr & ARM_SMMU_CB_FSR_SS)
+		if (cfi.fsr & ARM_SMMU_CB_FSR_SS)
 			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME, resume);
 	}
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 23cf91ac409b..79ec911ae151 100644
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
+		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
+		cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
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
-	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
-		return IRQ_NONE;
+	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
-	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
-	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
-	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
+		return IRQ_NONE;
 
-	ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-		fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
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
index b04a00126a12..e2aeb511ae90 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -198,6 +198,7 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_FSR			0x58
 #define ARM_SMMU_CB_FSR_MULTI		BIT(31)
 #define ARM_SMMU_CB_FSR_SS		BIT(30)
+#define ARM_SMMU_CB_FSR_FORMAT		GENMASK(10, 9)
 #define ARM_SMMU_CB_FSR_UUT		BIT(8)
 #define ARM_SMMU_CB_FSR_ASF		BIT(7)
 #define ARM_SMMU_CB_FSR_TLBLKF		BIT(6)
@@ -223,7 +224,14 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_FAR			0x60
 
 #define ARM_SMMU_CB_FSYNR0		0x68
+#define ARM_SMMU_CB_FSYNR0_PLVL		GENMASK(1, 0)
 #define ARM_SMMU_CB_FSYNR0_WNR		BIT(4)
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


