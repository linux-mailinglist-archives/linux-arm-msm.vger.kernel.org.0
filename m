Return-Path: <linux-arm-msm+bounces-58135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11834AB9069
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA0C57ADFD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032D829B229;
	Thu, 15 May 2025 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9IfwLGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72302298CAC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339182; cv=none; b=gp2mk9SItRS+xc5mlNkCv+ACD8pDTlhvxqjHS3AYtHk1Lehu12Wx7k4Vrkuv3dublpjjoaYzVKfjhTRalco5oPoJnUaVYFDxOAtjnE/omHjKzJ71MqMdib0uJNPdTbXBOnca5v5ExedJYYdUP3IYs1wkQsHfviokO3NklggzCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339182; c=relaxed/simple;
	bh=yKFBdsoANpail9eN0dLOxr2jAWKJ9zute64DqhO2lxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icGwwKe3HwDUuAVG/xGja6mlIs7oUHminQ3rX0rVyWR7Ce5OJ5Y3v1AYrLK1cRROSvvrP6F1duiXgAhKRSwyvwejEA9/LH0uIq+7099UUx0I9nLgH/DWD6fYGACQIlogIRyrvPZwPw6akx6uAnvbp8HAuhWQlN4Faa/in5+i824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9IfwLGO; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47680c117fdso2308681cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339179; x=1747943979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20DcKlS2hTvAgodxaUTpKC1CD/IfYxghOMwo8wKmU7s=;
        b=K9IfwLGOy9B5oEmefKotp5vMLT+oG6rohJLlJL/duQ84pB0BBrqp1N6oB4HW9/PIbJ
         EfKtOeOj1XYBwe08CAErwD3Lir6KwlcwIDgWCgYU6e1cnCfTiugjJGsh2HZzg+HTRsR1
         3fqjkId3oW0vC29tpHa6leDFPJ8GkXP08DkOAtxf1Mk9xN91c57HD6TrZGgAHiJqOwup
         QRRmR/CbkfhOXtnnkY7U0c/gcBCksLzzYuHJuX6VS9t1k7CwhJIx07wdFyDdQ5miIArU
         L6ctrqb+XGp61p3zr7ou5k9C6eA8pU6pqfSSQAF++q+1mwI/cP+irD9w9BQypfF0cj7L
         giew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339179; x=1747943979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20DcKlS2hTvAgodxaUTpKC1CD/IfYxghOMwo8wKmU7s=;
        b=CIxGZUV+9vtRwp5FxZFKg2YA8uKBo7/rFZakV6eW1sVTRDGZsLDA/XJb9655D5EYLI
         QxTUGPC6GtYEWSkLVg3u77ZRqTqWDCUF0XCcz3XzuJgZ6vdDKf+KS9d75UvKSPgd5wHo
         TaHDQupbevQPYYvpqQ+OhSQdsJxHkhk1z4aQmcb/7vrf/JOgn5l890TOv99sfpugJhT8
         fd2chEg5DEGExfVEpZJ2vgUtvllpOpVSvcglkpmvLk2YpR3ZhGW8TleUwM3gVg0Z9mFC
         sFvLkiK9dBoMISTtj2MvqvM0OAdwrkmfblYUi3aeiPNtJNdD9lDaLCuvrysoskmHpXzN
         j5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg5rrXlZq+q8Jbpm+gQIOQ4qHKka+CpRJytRP18Bz6njYnBoJRcZxbzA5z8RYBlgCKftnDPfXQndQtNs+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGRwwyfv3/ql1XIN09RdYhJ+uDs5m8gZmp050+OyhmGyaEkQn
	aJPhyV8zgcmCkIia2LxMx0otpMbSgOwadT3axXBf88zvlEO+465ElgV+
X-Gm-Gg: ASbGnctHBwGdpldlNdPpjCvwplNWxAX7q/fPhinCI7LJTG7JzEKrpeGkq4aBWG6zvAp
	nLkuf/Or8hSCL6eoNXkc4Yq1WTk3yF5uEyl/3Z6dXSrogwny6WkkgXEz/eGFo4ZJoo4c/y5EQFz
	p5E/GcVSnNxWufQg2x/5IL53U9SDdLmsgZqsoJyq9vwWBV4SHf/kvZ1LIHjLQwZWSKONZAvjcsR
	GQOPNvYsXIsiR92S9xfu10tzMkKYXpYPPBczXRMYwXFMiTnMgcqV02OpuTBYvhqyYcGVWTNwfBp
	oP+mmS46czEQutgaUozoLWu8ZegRPywdVsGId1MBJRLA5OE+LI6i8rs0V/H+7GB8Zu4Lbvljoul
	Y0iNnYXGoUZxvqY8lg94=
X-Google-Smtp-Source: AGHT+IEiZCk//3KnZJ9QFraR8/9r40L9GjGgn7adTJxnnP/o4rKsmZ4SlZHA8YvdjcwS+Khc00ipDg==
X-Received: by 2002:a05:622a:43:b0:476:add4:d2b6 with SMTP id d75a77b69052e-494ae339167mr4150621cf.1.1747339179131;
        Thu, 15 May 2025 12:59:39 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:38 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:44 -0400
Subject: [PATCH v6 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-2-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=5231;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=yKFBdsoANpail9eN0dLOxr2jAWKJ9zute64DqhO2lxc=;
 b=tuXpSyUWL02D4yi11LDbI98odEa/K1GIb7KgJHtYoH2rfOsfAexwNEoBtysuOMrgQmJQBgNIq
 7yU62f0j+OqDJs/HwcLdtj+Mw72LGRQBJhNrGx5ApqAFYflwvH73z4v
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

The upper layer fault handler is now expected to handle everything
required to retry the transaction or dump state related to it, since we
enable threaded IRQs. This means that we can take charge of writing
RESUME, making sure that we always write it after writing FSR as
recommended by the specification.

The iommu handler should write -EAGAIN if a transaction needs to be
retried. This avoids tricky cross-tree changes in drm/msm, since it
never wants to retry the transaction and it already returns 0 from its
fault handler. Therefore it will continue to correctly terminate the
transaction without any changes required.

devcoredumps from drm/msm will temporarily be broken until it is fixed
to collect devcoredumps inside its fault handler, but fixing that first
would actually be worse because MMU-500 ignores writes to RESUME unless
all fields of FSR (except SS of course) are clear and raises an
interrupt when only SS is asserted. Right now, things happen to work
most of the time if we collect a devcoredump, because RESUME is written
asynchronously in the fault worker after the fault handler clears FSR
and finishes, although there will be some spurious faults, but if this
is changed before this commit fixes the FSR/RESUME write order then SS
will never be cleared, the interrupt will never be cleared, and the
whole system will hang every time a fault happens. It will therefore
help bisectability if this commit goes first.

I've changed the TBU path to also accept -EAGAIN and do the same thing,
while keeping the old -EBUSY behavior. Although the old path was broken
because you'd get a storm of interrupts due to returning IRQ_NONE that
would eventually result in the interrupt being disabled, and I think it
was dead code anyway, so it should eventually be deleted. Note that
drm/msm never uses TBU so this is untested.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 14 --------------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 ++++++
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 548783f3f8e89fd978367afa65c473002f66e2e7..3e0c2c7c639b0c09243578ebb95129398c630ef2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -406,6 +406,12 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+		if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+					  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+		}
+
 		return IRQ_HANDLED;
 	}
 
@@ -416,6 +422,9 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
+	} else if (tmp == -EAGAIN) {
+		ret = IRQ_HANDLED;
+		resume = 0;
 	} else {
 		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, cfi.iova, cfi.fsr);
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 2b21b7208bc7b439d69e36ca678acd2eacbd5b85..d71404ad90376b2c258d67e07ec380674961a429 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -86,19 +86,6 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
 }
 
-static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)
-{
-	struct arm_smmu_domain *smmu_domain = (void *)cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
-
-	if (terminate)
-		reg |= ARM_SMMU_RESUME_TERMINATE;
-
-	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
-}
-
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -238,7 +225,6 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
 
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index ade4684c14c9b2724a71e2457288dbfaf7562c83..90a1b23223b4c25cfa033c28a2823e60e8b0c5a4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -470,6 +470,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+	}
+
 	return IRQ_HANDLED;
 }
 

-- 
2.47.1


