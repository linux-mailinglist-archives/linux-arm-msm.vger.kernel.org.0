Return-Path: <linux-arm-msm+bounces-45862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4715A1996A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 21:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA4AE3A530D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 20:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794071C07ED;
	Wed, 22 Jan 2025 20:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7hHyodG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78A918E764
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 20:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737576072; cv=none; b=uKMCfGB/N72L0SPdLI/wDhEpGO48pCynDJ1ghHR294faXIjm5VgOSqbwPK0rjYzO6wIV6oOi/BeuyN2XPiJgkEDEPRWjS0zX88IkAJpGmf7D+x17NUBxzqn9MAPAaQY9ZYEmKUUuQ+YzmDkya4yrpjZpvJvZ59GWBd5drMFbesI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737576072; c=relaxed/simple;
	bh=LZOQxUUGdQqLBW3ZuPFFeTY2r3+nASK7HMPqbv/N5EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8CXKNtF65yoKmfJbaLTUTnh3Hszh5UkKlaagK/EptBPsi4u/n+d2Cx2bAoWIqbbwu4AR2961sadKHEt6iwH0C7Yq/6vxtzY8q45naFc+2X4wEWsUq8D7cX4eMirOA2K87PMNPRnm+/+FJDzURIDSOmu47izzjOI0HLYtejsQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7hHyodG; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6ffda45f3so1395785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 12:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737576069; x=1738180869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0W+ZEfLiMkXEH7rt2/GiovuzxyzO0s3Xlcxt3/DbVg=;
        b=O7hHyodGh5jg7iBjvA464nROIWjayN0IQifsyVX9bi1Ro6DEGU8szQXsNpJYs81Pj5
         mTZnl46KIrz6I9mrbBtBiyeiRUGSvT0BgR3NV+YWKy++wbKy6fK+TtiRHi1+NNaUfT/Q
         a1i8usBn144GBRFs4Mqz9G1Zuzglf9Wg0/bzm4miDq+HxzLaz2+q7vBkNb9xHavP/aRv
         ig+vdgv7hvwshxcEIvAJbelzqUsUmdOOD6RLpfjDSTo/krfhxvnsWvg6cy2Pci9vxxpq
         bGYAeUrQxmnIbRf5U/Y8KkB3x9L/HUc5dUg/VqGdYkrqjJK0wPgZr8c+0siH6aCbYHVu
         ujMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737576069; x=1738180869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0W+ZEfLiMkXEH7rt2/GiovuzxyzO0s3Xlcxt3/DbVg=;
        b=a+OzVFA6czHB10YQ9QeTClAB76nFmc+g47wPkKjJhzWGH/WFlSiGjc4ehJX9+qiLos
         bJniUPOvVVqWKyxSLWFXsd7OXeSfquOGgh8kCH97cY/S274VEVQnZBnSqCssxfFdIzPB
         i+TwXdBOmAsEgFIjMXJlqHfptsXjiYgKJ4NgqkH/F5G2lB1Ikkw2Dj+epjxtVOmiOdGl
         Xfib2PgRSNWd4llULPLaWJz2JZJdTrsuRFTx18v5prksmLeU6tCzY42d+eVLMCO7wDGK
         Z0HVzxVc87Bv0dBqMfMGFiX0hLRkVfNS8HOgc7qiYWmxG7uV6AbkNEu5bwFV7TBBLm9i
         vNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTX4MQv+IST7nsJX3dyZ45wIZPPW4zmR2W2/nMGe7giviHF0wGcJlYnR8LJhrXNb6J0dEt8mgvrzvBt9Aj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz74vm4eZ33nDfltLMRbI7Ct7eKumTeo9ZZ2RbntZZ3jmfY5tvF
	YLWXKE1V2oXFN1swt4ITW+cjRbytx3ulPV8SOcvkyaiH/UBV+5iKBK7Vhw==
X-Gm-Gg: ASbGncusDmBq6JprCgUjsa1PO/ScWcSL6NaHsfHJMIZUN4jG09giPM8O+BHsWjv6CIK
	FNCZ8KR45n3GKsysSaQmJmlFwUZqDGi3gDoFeqgO+ick3Act1DjCBOCKCTy1mUoh8oyVw585lG6
	F7KN0vw6tiT2EHeQvq5SJskKDPZMec80bXQ6fcOV6CzqU4NxmFbQqBMeRzoT8yWK4xAr15e/R1P
	7SY8JUwWNzRAAgIFTQQYXTRrLx2RBbZ5UnGmUOVXOTwG2vTJ78PfG0qG1xB5vdPyyl32ayOIxgr
	YgviiB210tA/aAzTxQ7BjSyEw6f8
X-Google-Smtp-Source: AGHT+IH7Bb216J6U5VF2T1X3drcXM9V1TK2n9v5TtKhVnuUToiXKlxArzXqCFTvaC3c4LRNMangaew==
X-Received: by 2002:a05:620a:2893:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7be63158aa9mr1312874885a.0.1737576069547;
        Wed, 22 Jan 2025 12:01:09 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:01:09 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 22 Jan 2025 15:00:58 -0500
Subject: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
In-Reply-To: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=5809;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=LZOQxUUGdQqLBW3ZuPFFeTY2r3+nASK7HMPqbv/N5EE=;
 b=+NXIUeaospHwBoU1GxlEI04bEiPY7s3tZ+XXIo6zrznDjds++HImSxpVTUy3AAj3qlRlGR+0D
 8GDZdqn+QNSDR9v9/8qj5NGy4z/lrwbX5MhDaoec++7JU7xDAILX6pc
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
removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
asserted unless an external user enabled stall-on-fault, and they are
expected to resume the translation and re-enable interrupts.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 +++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..7d86e9972094eb4d304b24259f4ed9a4820cabc7 100644
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
 
+	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
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
+	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
 }
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..ca1ff59015a63912f0f9c5256452b2b2efa928f1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -463,13 +463,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
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
+		spin_lock(&smmu_domain->cb_lock);
+		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
+		val &= ~ARM_SMMU_SCTLR_CFIE;
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
+		spin_unlock(&smmu_domain->cb_lock);
+	}
+
+	/*
+	 * The SMMUv2 architecture specification says that if stall-on-fault is
+	 * enabled the correct sequence is to write to SMMU_CBn_FSR to clear
+	 * the fault and then write to SMMU_CBn_RESUME. Clear the interrupt
+	 * first before running the user's fault handler to make sure we follow
+	 * this sequence. It should be ok if there is another fault in the
+	 * meantime because we have already read the fault info.
+	 */
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af37426e005241a8288da20 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\

-- 
2.47.1


