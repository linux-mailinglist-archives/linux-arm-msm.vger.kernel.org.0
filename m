Return-Path: <linux-arm-msm+bounces-24808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6C91E52F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091B81F22954
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 16:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EAE16D9B9;
	Mon,  1 Jul 2024 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRaPG4Rr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C613E16DEBD;
	Mon,  1 Jul 2024 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850846; cv=none; b=tfinZaM2n/3D6nQJRJABk9rXm04lIGwN5FpOxfR7hDJn0elM+lbNP8ZRk19s1SMHiijYWcCz1jDXn7Wya1xcFgcl4PYr4hRxY2ijB22QfsOspuPVnvB10GQZBiBOv9Jbz0lBQaIp0KsGcnYtdcW43tEdLSc8EXCSiKhGxVXXRCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850846; c=relaxed/simple;
	bh=Ed24/mqCCvvZCgetl/hcdKlIeTHtnGeaSZ9ctzirepc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CT8sLkHakpkTw5rhaOJRLQHOnlBrcFZyOkaEqJbuhzjCy7VDNi8MlyPl7e5arN6/zwiVmMDUDlKwwtyoL8F8Eaxo3Oos2aBMsuj/jZCcaZ3k/XGtfDx+mW7ea1RqF6Tv/YnqnJSL7vCMuPUpjwPQfExka+X1EUoB+5oUY5ZTbyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRaPG4Rr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f64ecb1766so16563485ad.1;
        Mon, 01 Jul 2024 09:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850844; x=1720455644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foX87Q35xBXng5Wl1QSeaFlNvKSPs7buApce6Aj2ce8=;
        b=aRaPG4RrwFWjPqQZwJ1HtpHIc+BOmhaYyjBqEm+JXLA2xkM43d1zymCgo43JU+500R
         aNvVBc1PnA2srMkWYPWBN6WGYHDIOH6+FuMqiN6nOBsWYOCklo/SFr5Su6tF8lYaPQP0
         C/+NjKOpy81+7mc62MErtJ2PpnaE2DuZf4eI0Utns9YDyeqEjS7Gg4IL9jSZk7QYzKSo
         dQcKMz6yh4ZNFcWd7D1slOzpkzzCivbT+KK5Kz5wP5l6MqiWcM5eReO96Z8JUL4adBkE
         tq0o9SYPm/YZWUUHB3S+q5xzUIPh7I0CxcXM7b1SjjPzNEA29O4Z0rG/4P4adZ5a4me1
         Lk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850844; x=1720455644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foX87Q35xBXng5Wl1QSeaFlNvKSPs7buApce6Aj2ce8=;
        b=dDhrk+Mim2wOYwlbEEGGbOjTt15jVVLxqGJWkprJcVf17zoC2pOJV3fTOoec1aZHLH
         aoJUNBcVZ94whvr6KLTj7Xj0gXmwSYEityfvaz5PP4zGdAVNVCF/kIfTy4a5cGNijagr
         lTi10XIjFZgUfTJC0Cn19Uhs/Gc4AYPShOuoqtlJxEMlUBJOVSguxLzA6kev7tmcP900
         BKK9m21r4UhpA9Jx3J+SKAAlNLer1l/i5PZrQYZiOKb7y3DBEB6t+68KL0vK1DGwTibp
         tvpNKktW16KEstVYMZGwrivcaOaG8n/QVn8BV23V3S+j8sh7PiLR9rTMXZXHwbHLJTCa
         kOjA==
X-Forwarded-Encrypted: i=1; AJvYcCUcANQojKqmOS1bDZhrpGEn7oc6kl7Nl3PJ69Pe3AYks1LhWjo5KflcA26PkWETKzwiC+DF1exueZCf8K7rLiaT854b81nf/0xxVWZNMyaxBa4iDU1fwEhbgCuAAuRC3VSPGAX/4XKbWb0=
X-Gm-Message-State: AOJu0YwgVAYxX05IHR6CfRO51JB4Knl1q3jwnkU15UDpIp/VPnZ/yed8
	m2rx01ECI/lsicC+2a6yOwkl3U+24X8MsCvFtoLfMGol09GD3o6P
X-Google-Smtp-Source: AGHT+IGezuz9KcsCDkHHf6nqDerEGKPZp9rv7QW8gBS87OnSnt1vrKQewvteVEA7LabRrLMcMNIbBg==
X-Received: by 2002:a17:902:ecce:b0:1f9:b16d:f97c with SMTP id d9443c01a7336-1fadbcf4391mr43164895ad.66.1719850843877;
        Mon, 01 Jul 2024 09:20:43 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1535cc8sm66487225ad.122.2024.07.01.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:20:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Pranjal Shrivastava <praan@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robdclark@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA IOMMU DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/3] iommu/arm-smmu: Add CB prefix to register bitfields
Date: Mon,  1 Jul 2024 09:20:10 -0700
Message-ID: <20240701162025.375134-2-robdclark@gmail.com>
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

For consistency, add the "CB" prefix to the bitfield defines for context
registers.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c  |  2 +-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 18 +++----
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  8 +--
 drivers/iommu/arm/arm-smmu/arm-smmu.h         | 50 +++++++++----------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  4 +-
 5 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 957d988b6d83..4b2994b6126d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -200,7 +200,7 @@ static irqreturn_t nvidia_smmu_context_fault_bank(int irq,
 	void __iomem *cb_base = nvidia_smmu_page(smmu, inst, smmu->numpage + idx);
 
 	fsr = readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
-	if (!(fsr & ARM_SMMU_FSR_FAULT))
+	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
 	fsynr = readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 552199cbd9e2..e4ee78fb6a66 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -141,7 +141,7 @@ static int qcom_tbu_halt(struct qcom_tbu *tbu, struct arm_smmu_domain *smmu_doma
 	writel_relaxed(val, tbu->base + DEBUG_SID_HALT_REG);
 
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	if ((fsr & ARM_SMMU_FSR_FAULT) && (fsr & ARM_SMMU_FSR_SS)) {
+	if ((fsr & ARM_SMMU_CB_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS)) {
 		u32 sctlr_orig, sctlr;
 
 		/*
@@ -298,7 +298,7 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_domain *smmu_domain,
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, sctlr);
 
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	if (fsr & ARM_SMMU_FSR_FAULT) {
+	if (fsr & ARM_SMMU_CB_FSR_FAULT) {
 		/* Clear pending interrupts */
 		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
 
@@ -306,7 +306,7 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_domain *smmu_domain,
 		 * TBU halt takes care of resuming any stalled transcation.
 		 * Kept it here for completeness sake.
 		 */
-		if (fsr & ARM_SMMU_FSR_SS)
+		if (fsr & ARM_SMMU_CB_FSR_SS)
 			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
 					  ARM_SMMU_RESUME_TERMINATE);
 	}
@@ -320,11 +320,11 @@ static phys_addr_t qcom_iova_to_phys(struct arm_smmu_domain *smmu_domain,
 			phys = qcom_tbu_trigger_atos(smmu_domain, tbu, iova, sid);
 
 			fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-			if (fsr & ARM_SMMU_FSR_FAULT) {
+			if (fsr & ARM_SMMU_CB_FSR_FAULT) {
 				/* Clear pending interrupts */
 				arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
 
-				if (fsr & ARM_SMMU_FSR_SS)
+				if (fsr & ARM_SMMU_CB_FSR_SS)
 					arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
 							  ARM_SMMU_RESUME_TERMINATE);
 			}
@@ -394,7 +394,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 				      DEFAULT_RATELIMIT_BURST);
 
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	if (!(fsr & ARM_SMMU_FSR_FAULT))
+	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
 	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
@@ -403,7 +403,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 
 	if (list_empty(&tbu_list)) {
 		ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-					 fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+					 fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 		if (ret == -ENOSYS)
 			dev_err_ratelimited(smmu->dev,
@@ -417,7 +417,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	phys_soft = ops->iova_to_phys(ops, iova);
 
 	tmp = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-				 fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+				 fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
 		dev_dbg(smmu->dev,
 			"Context fault handled by client: iova=0x%08lx, fsr=0x%x, fsynr=0x%x, cb=%d\n",
@@ -481,7 +481,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
 
 		/* Retry or terminate any stalled transactions */
-		if (fsr & ARM_SMMU_FSR_SS)
+		if (fsr & ARM_SMMU_CB_FSR_SS)
 			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME, resume);
 	}
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 87c81f75cf84..23cf91ac409b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -415,7 +415,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	int ret;
 
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	if (!(fsr & ARM_SMMU_FSR_FAULT))
+	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
 	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
@@ -423,7 +423,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
 
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
-		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+		fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS)
 		dev_err_ratelimited(smmu->dev,
@@ -1306,7 +1306,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_ATS1PR, va);
 
 	reg = arm_smmu_page(smmu, ARM_SMMU_CB(smmu, idx)) + ARM_SMMU_CB_ATSR;
-	if (readl_poll_timeout_atomic(reg, tmp, !(tmp & ARM_SMMU_ATSR_ACTIVE),
+	if (readl_poll_timeout_atomic(reg, tmp, !(tmp & ARM_SMMU_CB_ATSR_ACTIVE),
 				      5, 50)) {
 		spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
 		dev_err(dev,
@@ -1642,7 +1642,7 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Make sure all context banks are disabled and clear CB_FSR  */
 	for (i = 0; i < smmu->num_context_banks; ++i) {
 		arm_smmu_write_context_bank(smmu, i);
-		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_FSR_FAULT);
+		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
 	}
 
 	/* Invalidate the TLB, just in case */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 4765c6945c34..b04a00126a12 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -196,34 +196,34 @@ enum arm_smmu_cbar_type {
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
-					 ARM_SMMU_FSR_IGN)
+#define ARM_SMMU_CB_FSR_MULTI		BIT(31)
+#define ARM_SMMU_CB_FSR_SS		BIT(30)
+#define ARM_SMMU_CB_FSR_UUT		BIT(8)
+#define ARM_SMMU_CB_FSR_ASF		BIT(7)
+#define ARM_SMMU_CB_FSR_TLBLKF		BIT(6)
+#define ARM_SMMU_CB_FSR_TLBMCF		BIT(5)
+#define ARM_SMMU_CB_FSR_EF		BIT(4)
+#define ARM_SMMU_CB_FSR_PF		BIT(3)
+#define ARM_SMMU_CB_FSR_AFF		BIT(2)
+#define ARM_SMMU_CB_FSR_TF		BIT(1)
+
+#define ARM_SMMU_CB_FSR_IGN		(ARM_SMMU_CB_FSR_AFF |		\
+					 ARM_SMMU_CB_FSR_ASF |		\
+					 ARM_SMMU_CB_FSR_TLBMCF |	\
+					 ARM_SMMU_CB_FSR_TLBLKF)
+
+#define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
+					 ARM_SMMU_CB_FSR_SS |		\
+					 ARM_SMMU_CB_FSR_UUT |		\
+					 ARM_SMMU_CB_FSR_EF |		\
+					 ARM_SMMU_CB_FSR_PF |		\
+					 ARM_SMMU_CB_FSR_TF |		\
+					 ARM_SMMU_CB_FSR_IGN)
 
 #define ARM_SMMU_CB_FAR			0x60
 
 #define ARM_SMMU_CB_FSYNR0		0x68
-#define ARM_SMMU_FSYNR0_WNR		BIT(4)
+#define ARM_SMMU_CB_FSYNR0_WNR		BIT(4)
 
 #define ARM_SMMU_CB_FSYNR1		0x6c
 
@@ -237,7 +237,7 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_ATS1PR		0x800
 
 #define ARM_SMMU_CB_ATSR		0x8f0
-#define ARM_SMMU_ATSR_ACTIVE		BIT(0)
+#define ARM_SMMU_CB_ATSR_ACTIVE		BIT(0)
 
 #define ARM_SMMU_RESUME_TERMINATE	BIT(0)
 
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index e079bb7a993e..b98a7a598b89 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -194,7 +194,7 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 
 	fsr = iommu_readl(ctx, ARM_SMMU_CB_FSR);
 
-	if (!(fsr & ARM_SMMU_FSR_FAULT))
+	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
 	fsynr = iommu_readl(ctx, ARM_SMMU_CB_FSYNR0);
@@ -274,7 +274,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 
 		/* Clear context bank fault address fault status registers */
 		iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
-		iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_FSR_FAULT);
+		iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
 
 		/* TTBRs */
 		iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
-- 
2.45.2


