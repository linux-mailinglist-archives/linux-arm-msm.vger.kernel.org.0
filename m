Return-Path: <linux-arm-msm+bounces-51969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A640A69207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDCE3AFBF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B963214213;
	Wed, 19 Mar 2025 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWbHgqVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C0C1E1DF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395453; cv=none; b=bmhXSUoxtcCifK5l+QgnKy3CAF0GOjN+9K58hn6CTu3uW5qbyMqlP9DMjitGRUyoVqjonD1Hni4RiMM8c4yakJl/YSAWl1BNHVECj3NGzP0pfN8bd+euPvMLzTFGz1Xv2BqnqCKsD2+WHo5yoLu1cww4IUx0HvsYiKuP7kl+7eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395453; c=relaxed/simple;
	bh=cvbBfcrcrYk3UnmMx/KO0uUo0M7TL3yWEuY4tEPNpHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKZ1e7wfPo8VpgD3tys5hRsbvdSpRgXC1fvglBlIcGM9QXsZbrgR+p4ADt0hK9YFPCt8y9eJOnM2HWDXWXEJfmZbkQnlz2HDlCLbhaIg59lxL+S2CIMnbArY0EseOQf1QqRrqSUb6ZT72AiK7+I3d+IvXXgKdi+jyZ3uDCnF328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWbHgqVL; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0ca5e6d45so118662285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395450; x=1743000250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LLdaHjk6LfckJUTjGZM3sRGKIR5OKfK0XW8wTVhaxM=;
        b=ZWbHgqVLH/x0OzDPhYps2XgsTVRH6q/VDGHP75xi5KDeUwkqoD3X514isb+GstGiuY
         uwahnAHyuS94iUKaKIpQtsbF3ix0+3RgRHZr40XBQjMHucJKCKg4lDJA4xyJEEZp2trM
         OZit8B4qng37M4TZgn3oYvcOK6QIb2Ee4Vc7IhMdGrNPhMLC5+bzrC8QIicbJPti0s5o
         QwKMRadgt7hslGrl47zGdk4uh6WT3lo6apKIitfBs+spS3kImkkkhUgeMvRI3qvaGnkT
         +daxdHAP37h20lWjKGdPK1nwhtFW5GaCDkB23sDsjDK/9vAQRB4E5POSLCbfIqOq/lIO
         lxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395450; x=1743000250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LLdaHjk6LfckJUTjGZM3sRGKIR5OKfK0XW8wTVhaxM=;
        b=nx4hJJPVkoysQUG5E4y4+T4bHeklw8GOCJq04bBwCK+mH96++GhqO8UHrCemoRE9NF
         LO52mHwNiVq7OLUQHNNKfaVsp8B+f3Nixx1sn42Pfz5C6OpABvzSDCxfydzlYv/z6/+W
         N/IoXiLU9vTu65mMr6GzLUXS7pHFGBZqEwnYL7f5EybOAb00/eFsvKVS02EpZ/J9PuLx
         QyR45M8J33pXuoiD845KUOODRYtGTz9LPceRS5hreG1lVE8ghTSXX2bc5B3lnHxpaxVk
         ieloAqxwN5JSHtJCpHWtG+klnaKfYH8lRKclyUS7X4oLl1XxEFTfq65DnO1a6tuAu8wh
         1uFA==
X-Forwarded-Encrypted: i=1; AJvYcCXdLsDk6tpCMps4gu0btcw5sQVTJjZKOzbX9b9aBLyxl4Gch6fzn/pnLcxe8HeJjjYq1relYQft1RizXXJ2@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUVhn83TFYsoYWCwGS9jplad6/vJiXbOTDws0z3JBGafo4+vM
	wAHbJKYKAF3zYBRFvI2ZWYPBxo4ScXqXxChOpL4S8x09KszQH7dI
X-Gm-Gg: ASbGncu/L/DejcsiLu+JrOBJwpkZaFNIoMN8TPSxonbOWaIgBuzHEQpVf8VGgddXeL2
	CZjIqHZUjfpPraXsrM4Chwqn3xF+5t8PBRooq7gDDuWG5J5RGhzhXqM+/aq44l4tYBRKJp51uKc
	t0BITYqr6yg2+kGxmJZ1Ed9tcO75c2eqgDZ8Grt497OQKJDZdm8z3VXHMZ20oKtnKbpbkiQxJck
	Ad4NlgbD3cn+366M3Dpo5/O6dCtKfrwNkTBMlkHgCCJk/Hcyf0aCscn275yvZx0IvkoSBpedTIg
	TUfWYJ4L9urJz8CUqeLrXOd19ocR7J/Wvs5VOo2FUl1KT1f76KkH7yd+VI9nf8SrDnFtnLbJb15
	5eQenqldUqDFXHQ==
X-Google-Smtp-Source: AGHT+IGJzwPA7xFugV/gHd8kGB+HC3gNYxm8R5XDRyDYRFdFlfsw4mDQ1M7uG0fiXgibnbX/DsVqqQ==
X-Received: by 2002:a05:620a:2950:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c5a849d18cmr170321485a.14.1742395450533;
        Wed, 19 Mar 2025 07:44:10 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:10 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:02 -0400
Subject: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=5823;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=cvbBfcrcrYk3UnmMx/KO0uUo0M7TL3yWEuY4tEPNpHg=;
 b=UZQkmNfH0RGJd1lvBOxnDXADDr5RhY1byqdtyjRjpdnp5UCv9mXjLsS9upst5mGaXUMBilPnv
 v4blVUGBABuDPjzrloGXgW0NMFK7fU5241VJJj2bb9qgGouKFPpoJZT
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
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 +++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3ab80e0fba936e214 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
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
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
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
+	if (cfi->fsr & ARM_SMMU_CB_FSR_SS) {
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
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
 		cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index ff84ce3b8d8567d3402e945e8277ca2a87df9a4e..5fe8e482457f905529a08aea14ea5656d3e31328 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\

-- 
2.47.1


