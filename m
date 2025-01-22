Return-Path: <linux-arm-msm+bounces-45863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5BA1996B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 21:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5ECD3A56A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 20:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F49221578C;
	Wed, 22 Jan 2025 20:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMycX969"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41D1BFE03
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737576073; cv=none; b=S9QhuM+z5GK8foFApROoxzrpN40lq/RgHJfv0aeMcOqy2yg86RioH1iGLGFShPB5Zx8pbezinObcHXMHhO1sgaCeDhDjuEOibqRZ+UomcfMwBdhqvpEOTQ/TsnS0os1Z9WN2jGpjWmC/27HDtU/ST/uzK2PVrdfhXNcuV9vBcDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737576073; c=relaxed/simple;
	bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sseTBk2cF8cuSZC/NEVxzMlaSooO2juvf784pUqL0XyHVsbu9SiWrvXd6/2EjKQ+HTr8BGcwad0bXXBA+vBWWfcQy7b8Iq71cNiAdHtpxZn8dnNchjLQi/OcTzJN8D3V8qIFnz+8g7nSA75nWx1GQfBdeF3FUrgwn3UeQ4T1WPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMycX969; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6fd251d7cso1542385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 12:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737576070; x=1738180870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=kMycX9699ceXNN85uq9FwmW9jyEbqvrWiqO6PRaaN+53dIRbkNHgK2lfJPyk21yxb+
         KWkJ1QVmpbU86EGNO4FlGoW+fV7VnFOJIkcWUKxLL8qyU9goS+rg2jlXKchTp2ML6jCg
         Ht0+KKN4ZO8L3BEaTAcc8o6eg3Mu+rru1Bzt8Edk7QvPrBInXH6RWdGGtF4wJ3fOa1fp
         Pw43hG8Ug/IJD81J6agjbZ9z8cfPtlKRXSRI9Dqc38aLkTYoUY6PGVI1Aa/B1xvXm/KN
         vBIYwWMiFt6RpoF+iBh2F3FVcS6AiLnpOLbbnz9YR96JfvBMXiAF8SyC86iwUBOEnHGr
         t+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737576070; x=1738180870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=JkzU4seF4L9zsdTb4B2uXKZYlRzBxALkD21Zf0Xw/i1QZyt4a2FJuWOWXnPfzsfpAl
         plYW3K+fsEH1S8psrFW7U8FsguXD5NvD50s/kuyHpJ+d/kP/3SfJfHo8wv4j/gY49TTH
         qVUa00izi5k+uPcZvp4uHEUY2bnBLKjVrQetU018xl/1YXvHah3o2NtZ2C0/NHWOxHm5
         2OAjDWeApYFDp41MzCNhK79Gqg1BfY0YRl0ZvaKB4OZAi60t5p2aN3amnvD93XuNzQ3Q
         3UxZJ+D8c4dt4m5jUTv4aDS/ISpngzRrfVsX0KUdv74fSg1TS30mWbvvqJOg34hfhE85
         gl4g==
X-Forwarded-Encrypted: i=1; AJvYcCXhtLhnAuN+iMyUVmUoR+t5Xd8sPopwB4zMPa8jZbGnz6dZnuoNMv7xD+xEqX1iLaBQTs39Y0KiZcEghl1b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0frufbc/IcctQ6XVmmtr0pmTKu38rKIvjMmjutA8YyMfJF6Oc
	FEQ7lsFeDHZHGkzYpp9fOszpADtfiR2bUERxLJ35aHwY49T0tcgl
X-Gm-Gg: ASbGncs9xmjtNOr5N7gFLpNzc5yl4lHe8wX8ApXhNeOTcH7re1p0jknAb6oIECEVWr+
	KIPgONuZmx1I+bTZoyyG+VoRShBSo/Eo8dhRd1/zczbm+QUV3vFCpBnvA4rEBduZw9EaVUUSmky
	p6bsziijwQjE3U0s6kWkeNN5pmB/ehyithL6Bsm1G+Oc9Icv0124g7TN0HDcQHG/MrzEpbS/YIh
	9LN73RFcLLwuuDPjKMKYZCfgcSbjuw2N96dUb0e2LRc66G/BtqgYWHdXWiESNxvlwaw1T0bR9sJ
	JU78N+KDDUpzJ/MhVp09qja7ooTs
X-Google-Smtp-Source: AGHT+IFbsQgN+OYWoJ8tGUrhqTk3b6gEBJi7yaE4oLpHOAjzYS5P1remXjUXmLoR8liW70biIpVbJQ==
X-Received: by 2002:a05:620a:1911:b0:7be:3cf2:5b46 with SMTP id af79cd13be357-7be6320bc70mr1391147185a.8.1737576070653;
        Wed, 22 Jan 2025 12:01:10 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:01:10 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 22 Jan 2025 15:00:59 -0500
Subject: [PATCH v3 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-2-0afa00158521@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=2108;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
 b=UtLt9Gxw8iQpbRsxeRyHyMb7Pm7ArBDOREehdF+WX9yPMugQJ3Icy/92gYrtsug8VrkLc1is8
 CiXL67DhVUCAGFOPZCD8bglUB3zCsRgXLnoLC4DgfCG1QTviaTVY5MT
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Up until now we have only called the set_stall callback during
initialization when the device is off. But we will soon start calling it
to temporarily disable stall-on-fault when the device is on, so handle
that by checking if the device is on and writing SCTLR.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 7d86e9972094eb4d304b24259f4ed9a4820cabc7..6693d8f8e3ae4e970ca9d7f549321ab4f59e8b32 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 mask = BIT(cfg->cbndx);
+	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
+	unsigned long flags;
 
 	if (enabled)
-		qsmmu->stall_enabled |= BIT(cfg->cbndx);
+		qsmmu->stall_enabled |= mask;
 	else
-		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
+		qsmmu->stall_enabled &= ~mask;
+
+	/*
+	 * If the device is on and we changed the setting, update the register.
+	 */
+	if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
+		spin_lock_irqsave(&smmu_domain->cb_lock, flags);
+
+		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+
+		if (enabled)
+			reg |= ARM_SMMU_SCTLR_CFCFG;
+		else
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
+
+		spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
+
+		pm_runtime_put_autosuspend(smmu->dev);
+	}
 }
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1


