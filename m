Return-Path: <linux-arm-msm+bounces-58134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379AAB906E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23FD69E69ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB14298CBA;
	Thu, 15 May 2025 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7XwqUKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B2296FCB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339181; cv=none; b=q8XQ2BmCI09AIluRBENzkJ5xOpYAqriKX/gHpkLiCjHEPcxC1hgHzf6NPZg66V+hWxaR8WPUvepxLkZAYqIVuMkmwr8E+SQI0ogGLVDdRXZ2PfLTzYtE4rkg8irD+h4iEq3ubBStYajpbBXJjNlPWpFoqo13VUOkPGtnxKkEhfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339181; c=relaxed/simple;
	bh=DPKRVjaqGjt+UvV8ZZCM0hAEA0xW5F7yYBkPh+fJ4X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fz60bjrSle6twrVe+XyIqyM7G80Ty2nvyY4Fx3c4XNTtD4SR1N3fS71zRiYvGvRn+s1K72FiPCOEMwR22EHD5988+EhsbUKqVAhe8pIAlzB9h34cMr/CGUU/94qlLPlxc1wwAuf+YYompLtEhgF2Vp1RSBHKnYUnjCxTuLUdczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7XwqUKX; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c57f2f5a1bso15891185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339178; x=1747943978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWJZCHLwo4+rNxVq1K/n30vdDm3CIQkELPwI2pLPS/o=;
        b=k7XwqUKX7GHUjczxYsXnJJBqTeWZ4Me+jNtQD1aszORXYMRHoAiZFW1fRyf36MHSTF
         mxCnlhNEm8v78t/CjpLNwfBx1LOrdyqfyh7k+bqH/VKuZGSGY5/wJZJ81P2z2eobvn4t
         X6VlJvjvqpXf6tOI3pTW9iEMHPjMGHlw6WdoW9EUhzmF392F+qzTdAs/8VLuLn6jNpxa
         RHRsh37MFlWb5U5t4I6j+2wToKS+XlWd1ddOgU12x3OpGakuOqViVxrWPvODHtRZJPhO
         huaS8UE8579mw5UbtS6P5ymFrP0rksR/hwQXIg44LH5luhFDs+87J2h30dGFeomyp8Ye
         UXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339178; x=1747943978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWJZCHLwo4+rNxVq1K/n30vdDm3CIQkELPwI2pLPS/o=;
        b=boSiEPuvQYoljhPlYRD/6NjymOdh+E/WRM0j2KgmhKmUfmM1EadpfJUtGihKzB+3OF
         NaiXW4mc23N64WqgAe0oP7KO2n2PcJRJFROrfmXlvKObJq2x7X8ERAGtR8OxD8OmaoZY
         2hw0rmc+Hhu7ERVVXwFij+Zdp0zGw+l+iPD2wN4mL43zs512IK6qNUcvt0C8rU1/qEva
         nIqMP5yA5dJuhE7uNC3e9hEKfz4VFGD/j58HGOMC9E0Eanzjlu2o8sbdv0ZMUM+Ke7h+
         IsacdGfy8HlpJUFf6m3yTojMYPL5oquLIHL7du1sOSSMqeHa1W3HwiP8NBUx6LnlOHxO
         tmJA==
X-Forwarded-Encrypted: i=1; AJvYcCWlTH+Sj44DZc29IjNKWgyAvg1U1g8Z5W9iVgsJYqVntOtmJ/G/3YlgijYoMV/j8OIw4zgFfk1yRR+C/ir4@vger.kernel.org
X-Gm-Message-State: AOJu0YxvmrsDasEYYvqrG0zQj1H9Z94l7WM7MJTDGEgpxpBrM5bhR301
	oDbhgQdGYtfDsQpQCH5mjQQ7ItXfyfMzCmCFI7pvhYYTjZrrcfe64aV6
X-Gm-Gg: ASbGncuXWQgeaYxlXXd6ewDg8KQzdI1ZvukztUhfrpsQXNa+rTBh/vmYCwFkwj8gf6l
	gT3d9sm8E6rTix3M+as6aj96O3xRPbuE2qGFe9I7ixPNmMxfTi6X1hHjtXRfJDuIWR7mZlEcRyv
	d79uJOuClJL7LBdRw4FDsJi8fZ3pb9waz2ozq6ruxIS0dGZEC5SHzLYRDgxoCabwyq6OI2cqUi2
	7hk3TaWmZRkYMUPm031m6Uf/Po5L+LLA8a9yFUeULM7AaY7SN+pK9HtZTxAOGCi5F9CFfG7W3kv
	pUMSQ0toBXdXSlezwskXqQf08LjQYwB87VwUcBxtVFN8Xec+Y7J8h2epGlteIQUOL9FucuHwCGi
	lT5KuTE05L2X6m1qUlSw=
X-Google-Smtp-Source: AGHT+IH82TQ9c8cVYqaXjsAhzpScTuQetKQyv8EkyvQLwXx7nU7GdytaDPOdEesc7oYyyCkeN49+/Q==
X-Received: by 2002:ac8:5951:0:b0:475:876:ac3d with SMTP id d75a77b69052e-494ae41e3a4mr3460681cf.13.1747339178066;
        Thu, 15 May 2025 12:59:38 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:37 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:43 -0400
Subject: [PATCH v6 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-1-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=DPKRVjaqGjt+UvV8ZZCM0hAEA0xW5F7yYBkPh+fJ4X4=;
 b=62Z0w3hpPUoa4KOiyVuNO04DfGNn3v70J7ZnmSCozzrwREkvpBQansvHOQaEZoUFL+zftDl/L
 uXXn7xCS28bAYrzU5iTGeMySBdN12STsv+/vLopzuc9rlGmgu1VXpvp
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

The recommended flow for stall-on-fault in SMMUv2 is the following:

1. Resolve the fault.
2. Write to FSR to clear the fault bits.
3. Write RESUME to retry or fail the transaction.

MMU500 is designed with this sequence in mind. For example,
experimentally we have seen on MMU500 that writing RESUME does not clear
FSR.SS unless the original fault is cleared in FSR, so 2 must come
before 3. FSR.SS is allowed to signal a fault (and does on MMU500) so
that if we try to do 2 -> 1 -> 3 (while exiting from the fault handler
after 2) we can get duplicate faults without hacks to disable
interrupts.

However, resolving the fault typically requires lengthy operations that
can stall, like bringing in pages from disk. The only current user,
drm/msm, dumps GPU state before failing the transaction which indeed can
stall. Therefore, from now on we will require implementations that want
to use stall-on-fault to also enable threaded IRQs. Do that with the
Adreno MMU implementations.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4bc24cb52f9233095170e8aa510a53..2b21b7208bc7b439d69e36ca678acd2eacbd5b85 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -468,6 +468,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
@@ -477,6 +478,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,

-- 
2.47.1


