Return-Path: <linux-arm-msm+bounces-50227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E74A4E88B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2AAF420898
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9949128136A;
	Tue,  4 Mar 2025 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEUNX10m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2F281365
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107444; cv=none; b=IuNg6Zn07G0HjagI6Ig763rTfG849dLvbsB4+DQe8r4uH8xO7F6EU/IB3CIVTiv+zWfTm4PPedWgTInEoJ8NzYyrRyF7zwrfZSe2nnb/QjP0XWrcf+2kjzPMMx9YujicRSiAXmq+ZDf0KzeoVOrilVhLkdHMrD6Hju4pgSnk/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107444; c=relaxed/simple;
	bh=0pLxdo5dIx3/jB5VJnMD05UBhNDf/ce6uNeBNzQSNFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUhqpXXr9K0xTnYpyELOkQ96njE1qS4UF6noSpbwVBv0KVkV2zWemwViNn2lcNJn0ioFy4ms6gV6FSy3t+GanMjoiE0w1O3tF1uwrTgEcUUuQi4b/jKdCl6MKaCsEjRRqM187I4pAmB0+DJCDjlBeCeHUjoIzvgHxxoANFQw7hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEUNX10m; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8a1a92bb3so5543616d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741107442; x=1741712242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5EzgLyFDTmhCErvGVVvwbq+cKJHcTR+SvQ3tvjXAPU=;
        b=AEUNX10mKZgp30Tb6t+O0JVdnp4ciC9RxxYzawsXdZL+ROcGP9YouTdLewSOyD2j/N
         g1aN27Rr3TmFNpVHWhPmHNob/nYVQPcbQ2wVlSn9gVrZMUJo4y2IYttHfLbe9cJb/PyU
         JbMniSrmRoKDtMYlfks2y2+YGEyGw6d8CBO4zVn2SqKyBZdfbXX2ezkVjoAN0YUVQ7Ew
         FrJN6riXR2bCPMIgD483Mh1tmSBJvZF1S/LuQU4Xz1MNglK5MKfkap5fwIJOn5BflA3W
         5LkXp4bgaz1N/dHtqLMb6J1Styskpy+vE9ct75jxYgKOYZ4VvDKklrSYi4SHBUo5+z2X
         msbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107442; x=1741712242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5EzgLyFDTmhCErvGVVvwbq+cKJHcTR+SvQ3tvjXAPU=;
        b=LnTjOEZ3nOgawGJCgAKNwS/aaaw3N5HzQVgMVWfeLLfwjr+gr4KHi+/ou/sXnCGMj/
         vKhLtirpp7O8FzwPAQQV+obBBoNdF54x0dJF+6OP9Xizer+IPLwTaBrUlHMRsU0r9rTM
         JlipHBNu63SOtbE63VLae6CNITC1uyRm0Wl7NW6mMK/4YYxgp9HCmij2wJk9DNJpD0zH
         /80VaSOHxN5iqYEPwo895xAaOhfFf1dsLKph+t2yw2L/lRGTnW6Bo8JfWkvvpzjjd+Bu
         LerU+Q/X7jGLV0vzhMAVKvKuTvGkX6EPpea2J7gP8oo8x4HljDoROuazN103VmmJz9s4
         4xqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv6xonu5CdrRU4i7RYNSqAceIOPe/ilFdf1Ubwwrw0omC25uSIO/Sj/oX3lGRFgRgBtVSteLI2hMpPbmPY@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUulPL4bvyeueAVF++lsMBWvf5FCWPgd47zsee1e+LMyPrJ3/
	GVkjJoMjvJB4VPVhLdqaBSXJX9LtV6PsbuXaH6KmoC4qJxeLeFsR
X-Gm-Gg: ASbGncsX+o+C5hlZYE7ky2SzpRTDOWGv0eeGmcb/8iWdo5IlFai9quEHiKLfkzwIrK4
	PDmmtfuDyD8xhgFSKJIKbiMq/3gjgGcPA37ntdxRteKaVEqZaottJ0/s3ihK6qfClCrEwL1WESH
	lUryGC1XQwtOm9bLX+Bh1L0a9WJU7QAiGQUV+u8g2/wX0AQu+JY/FCC/CVIgeYTWO1L4TYKk9Zg
	h0AoummR/X16u1bvDqLHjBIv3jIRV/fnattDMDwc/OwIxuLfm7tVE41nj5+TYb9aqONGPJxDUPj
	wFTWq386iGbayeqv8bsfrXReWLSX+N13vjqVz0yJEpqlt30AsDyDnv80Iqta46UNEEF9S4PEILf
	Tcyc=
X-Google-Smtp-Source: AGHT+IGoupxASii7X7ZBE/b1vhvmyQma/ZYdh+Tbyfe+Zw9nzGDokCIyHSV+XP73s08QmxQbPXLd+Q==
X-Received: by 2002:ad4:596c:0:b0:6d4:2db5:e585 with SMTP id 6a1803df08f44-6e8a0c8667amr101294476d6.1.1741107441643;
        Tue, 04 Mar 2025 08:57:21 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:57:21 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:47 -0500
Subject: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=5429;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=0pLxdo5dIx3/jB5VJnMD05UBhNDf/ce6uNeBNzQSNFg=;
 b=Y1CairOsJ41mvDRtKq26OuucDooNFTjLoWPwbiBFIfoSNVkipQappptYF6gmvKXrHP1SoogsK
 PYXTL5Ae4q5CwQehnNi46RBvc1kI63x6VHaiJHQLf1iWq/3bMcW/0aU
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This will be used by drm/msm for GPU page faults, replacing the manual
register reading it does.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a39866a932360d4e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 
 	if (list_empty(&tbu_list)) {
 		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+					 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 		if (ret == -ENOSYS)
 			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
@@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	phys_soft = ops->iova_to_phys(ops, cfi.iova);
 
 	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+				 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
 				      struct arm_smmu_context_fault_info *cfi)
 {
 	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
+	cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
 	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
 	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
 }
 
 void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
@@ -419,7 +422,7 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 {
 	dev_err(smmu->dev,
 		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-		cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
+		cfi->fsr, cfi->iova, cfi->fsynr0, cfi->cbfrsynra, idx);
 
 	dev_err(smmu->dev, "FSR    = %08x [%s%sFormat=%u%s%s%s%s%s%s%s%s], SID=0x%x\n",
 		cfi->fsr,
@@ -437,15 +440,15 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 		cfi->cbfrsynra);
 
 	dev_err(smmu->dev, "FSYNR0 = %08x [S1CBNDX=%u%s%s%s%s%s%s PLVL=%u]\n",
-		cfi->fsynr,
-		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
-		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
+		cfi->fsynr0,
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr0),
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr0));
 }
 
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
@@ -464,7 +467,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 		return IRQ_NONE;
 
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+		cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index e2aeb511ae903302e3c15d2cf5f22e2a26ac2346..d3bc77dcd4d40f25bc70f3289616fb866649b022 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -543,9 +543,12 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
 struct arm_smmu_context_fault_info {
 	unsigned long iova;
+	u64 ttbr0;
 	u32 fsr;
-	u32 fsynr;
+	u32 fsynr0;
+	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextidr;
 };
 
 void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,

-- 
2.47.1


