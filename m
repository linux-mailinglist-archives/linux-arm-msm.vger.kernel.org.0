Return-Path: <linux-arm-msm+bounces-58758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC634ABE209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD1A8C6069
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48118280315;
	Tue, 20 May 2025 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjf7joMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995B928002C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763104; cv=none; b=lvQr6Ww1ia4YPDHuob8uZnHb3pEANU75rMtZ9fzJC7xDp4EgO3wwfUtghW8g8cOd0MwkOwt6Zyc14kI+fXUXOi/9mOxf4RW8kzDMdhe5NrxdNJI9aUBY7MLob1sM4TsbTJMBUpwbcWGlxmFYg3SCgjH1kmDmINXur1bQz/svdbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763104; c=relaxed/simple;
	bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sc15UBhAh7Bnej5l5MRvb2oSKKcg5jX0gLzmkP4l2t41rYh5I3dMdW2M3nmdGbr3V9ryDvfrO7mKVzJwrF8bxvI1PIHQr2mPFql8XU+JDuFYll/0udv175iyDHZY9j73UqUtSFDkia2r2jpRKqwt3PR3/LaV/WOciervx5ZQoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjf7joMg; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f2b58f0d09so8731746d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763101; x=1748367901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=mjf7joMgtwBq/JBRibAUvli0c8t7qXSMrJYeHnl/ft6kfvLSjK6nWXouuGoRS150Hz
         orBmGsftaEuxUvd6LTDi0XkIS9v8v5/ghJJpP6CgMoZv6y0yJwXZdC8e0mdbkXcfJegb
         Y8X/4TXhP5es4JmXynSTTKuKpUIb0b7+cwScKQS08l2/AvBxbyXor2b97v5QWCJrypTP
         8jUtdyFebQ1kf03+QHWoYW8YXNWFBMWJHYW6I0/a5JZRIUg134xCuvWIMYcNLVCcp120
         LSKRd+ZYiFoXZevGGwYXwl3qdnw9dRehbBZnIOmwPD6NdM0keBOvr9teDjsfSLY/nzLz
         G2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763101; x=1748367901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=YOPZaq5sBKw3jhONB48GbZitg/qPOD8+Ykwo/O2H1XHAJGlxyN+XYNCJwIaWSDNdtF
         gAoakyaqrbRJclLqyZJ7hudkxs+BkIi6vBeB32029t7MUBX0GDy4fo8iz4T506DiPVf2
         ZmzFodFRqUnTi0EmfC4OLQhDmG0/xwAWkwldTwUKvTLcwLEfKo7Nfi5UoChob/NI31Tg
         m6UyTB6WYex8YQNRA3kzdVLK9CHI8E87Ns5cNdrlM7y6cnZfjKTpl38OFoLlXFEASzyf
         LzDnT1Cu50cw3dDzCd9CBrZ6jWtWOqRGZ7IvWTmMgsjVXELmHwG9I3frOf89sgSIcqZd
         DkJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2feF7KDWsXfWcUqQaO6hkZoxsigEmwLGA+rasPfyhnmy3gVWPGyG3oYYVj/M3RcNOc+s/7SaBGetmK7ky@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjUCzv0W8i/FYZZpKcCSKuGFKhDwDyN/780/P2FYhFdb3inuz
	4zXkS0+JCXw38q5AA6HOVvfHGFcN+RlPPaK0nboiqTlWqFAeqH37ruTKn1ViS/n6
X-Gm-Gg: ASbGnct1LG65qaGv3c/dOzAswz8fGq+KwDHi0lIZ60qJtCcOHmu09RRMFJfVK4JtsvD
	0d2ydINsHBvZC4ljqbw4PWU8i55+hna9wDVH5k8NTD2nNQkKuLbebuvXno0XXECxhr/2Vcm3myf
	7dZwojoWpA0C8H6RIqeWicwvE31jZZxkbfqcHH8sotN14O+ltCbPxEpTGxtWL+qNdn/FC4NceU7
	wbFYrAG0kXAMTEEt/tIj5bt12geTW1MLZTMS6nMXm1hjXwzMaqr39Sm4k5bYtP3BQ9z71oO0iuj
	AWB2sa+OvaPZyQC/cEhuwEB74BzN6x4QCuWVVu7L1qnlkdDdPpmNqMzqzrWRoUV6IHr87q202l7
	ubwNaUId2hXbjRPSDxXQ=
X-Google-Smtp-Source: AGHT+IGqCzG1SvNWszzrmmzUY2oSx7dYJcoW7SuKzN1obqGThnOW42g+lUzHl4o0PdCvhz4+UPzvxA==
X-Received: by 2002:a05:6214:29c7:b0:6f8:e361:78aa with SMTP id 6a1803df08f44-6f8e3617c79mr23828486d6.8.1747763101074;
        Tue, 20 May 2025 10:45:01 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:00 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:50 -0400
Subject: [PATCH v7 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-1-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
 b=JmZsTt+6O7fNx0yDUqUsXkrhtOsb8qvW7BpJuQ7B23u1tzp4qHdYnvwbwbDnWJiZvcItArAbQ
 1T514ek8rm7BoPLevyDE8Ux2jAjR0ELikP8fAA06vsIo8AQ7PBSk64A
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
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..4d3b99babd3584ec971bef30cd533c35904fe7f5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -585,6 +585,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
@@ -594,6 +595,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,

-- 
2.47.1


