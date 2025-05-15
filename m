Return-Path: <linux-arm-msm+bounces-58136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1662AB9070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CA51759A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1DB29B23E;
	Thu, 15 May 2025 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhbYZCPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C9A296FCB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339183; cv=none; b=nCPG6qXxlQHydKqXur1AtqO2ev1ToMhPSmxvW9KuXF6vi+VKwOzOGy9Iw72JTMkzFsfKe2k2icyq/Hv1DwyPtb4u3N7ESHOYi1CCEAoJ7/fKO/iUnaeacWOTiVvfppL67CahEDKCn9l2sr5dKL25eFZXCis6VIqI2Zo2+YKVrGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339183; c=relaxed/simple;
	bh=NuuNOSzcg6T6eP7lLDMW2wQqpv+M7MyGEuNFao145fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSWEJ3JeL6b+vfl+F/c+o7gZ3jkL/CS8r5xZhY09tQn5S1PYpyKuseDoG3nV8S5xHbibD08iX4CuYETAA4DhqqbaOZXEjCS8OoOhl+watgw3uMq5cgQSr/hlQNAIvY/rnv0PsmDu5XcAHJYs8/8/9m0PogeMITXqubhxm7Cs0f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhbYZCPM; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5a3334fddso23443085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339181; x=1747943981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRX2mmgMKg0kWmEalfWfPxyKsLjxoohp0lPvLbYN2U4=;
        b=AhbYZCPMJ8jfK8Wk3gMLcAvsbBGER5OoRpKYvezpFHbSOewoaY2nMEjUHWDMRtvRpU
         5sgp8ikCqey1uXaSQOGsugitxk3H9M6ExH338SbkWFgrw1SSRAhSHKUXRg3MKVOM2YXs
         rWi7dDmnBvExJm6jG5E1jmn1GpCn6DpzmSVmKl6Adi86TOnWa8UZQb3Iv1zPMpB3n6iR
         /jLjH7HOsco8YsladjMSXTDWy40FTemOWCh8wIyMeJR52DSehPiBwzJTCLZVGXDZlyD1
         IvsTTsB46lconTWKbECfchSFt+8SaDM5NJu+Bf9Q2lp4KCqoA30AMhzSD+bWKXlFF5rv
         JoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339181; x=1747943981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRX2mmgMKg0kWmEalfWfPxyKsLjxoohp0lPvLbYN2U4=;
        b=VNm2kGNeB3kbbnDvGmI8DWhoPcSrvfsuKXfQLli+/RKB1bxpKXbJehkKm4F+lv1f8C
         wOErBLybCwFnx6hhPU4Cr6d619vcCY3n+w+caruB+8ULLceBghxWyMqeN3ctw1xjNaBj
         cZpB9dKtzI3JT+Z4I+MnwjHzrnJMlhFjJYpJPEJsh3aZxIcvfaMJv3GoabJKpLVhTXZD
         5rv52caNAv4KgchpSyOwXQvYejVNh2F71r2Nh4iAkwONN73MNvHm4HcX+iL5gDiJ3gg6
         xuu46Ob4RXjw/TJVC97OqzAItj6O92S72+Net6BoO0E2xii09youlXgvI51JC3T2kQPX
         j0SA==
X-Forwarded-Encrypted: i=1; AJvYcCWfk7lOTB4B7ozfo8I9CgYVtDZJRQVIAYEjZ1+EIC6VAngaVpp1IHwqzWJpg06hLXQ2mONmkWtrb88m5Jub@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhOJb9fUiEIulUNN5yDAtQ3pJDoaCB4tMZOw8AmkTFTutwNmj
	LLw/rvZ09Vh9po/NRBHnp/oodij3nCofD0Npg196kGCWyrc/udVU12y3
X-Gm-Gg: ASbGncunSFBCCCPv5RMuByaSVobjN/RKPf4Ato+DHXuw2fG0dhkiiPRGUdGhRRC3oop
	u76m9y1L5qwqoeamYrWV2lXlceUmJ1fXAwof7goOx6bcEQDJhdO8RuNXg7Ak5h5IU3LFn+LXIY7
	9Gx2r15rMJP/JRtPPfcsEHyOnINQnlc+EfOZE4MbOI8SjmM61Rv6IIyKwcHc2ZUBBKDMHCCRhpE
	NCjBR36SV8yOhCsT8q5MEbllbMviVpv4aqu9cSVwr2/vPYZvtrO5ML68kXWC6EWT0/rWfQLlNpe
	KVuKwF59KYEvrFs8RYJaZLA45CcBWAxiriwZJdNsuVso15SPiGuBNrBi6+tItrc4TW9GDluZPY5
	XpyijAvh9hw0bQ0ja5TI=
X-Google-Smtp-Source: AGHT+IFDWp8u+QjgmXSWCzrAKUKVyvuRDbgutIyJGTYJ63yX5WXLYpLuZEG+9WHmxaOHRSYMoJ0INw==
X-Received: by 2002:a05:622a:1306:b0:474:e664:691b with SMTP id d75a77b69052e-494ae37764emr4557401cf.8.1747339180611;
        Thu, 15 May 2025 12:59:40 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:40 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:45 -0400
Subject: [PATCH v6 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-3-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=3349;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NuuNOSzcg6T6eP7lLDMW2wQqpv+M7MyGEuNFao145fo=;
 b=G8f7cSFchFa6Ol5NZmbPn25aQKQkCTssSAZn+8lrwlFIh1x96h6u6Eq2OveCkRVCprigujkFM
 gF8bATUpx0qDSrjfTkYolsLQIxjAjr3aU2RLL0cOv0MsHcy5zrhpUHQ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Up until now we have only called the set_stall callback during
initialization when the device is off. But we will soon start calling it
to temporarily disable stall-on-fault when the device is on, so handle
that by checking if the device is on and writing SCTLR.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 +++++++++++++++++++++++++++---
 include/linux/adreno-smmu-priv.h           |  6 +++---
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d71404ad90376b2c258d67e07ec380674961a429..98927be42bd1af25dcc3f667cb75d250a320c447 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -78,12 +78,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
+	 * The spec pseudocode says that CFCFG is resampled after a fault, and
+	 * we believe that no implementations cache it in the TLB, so it should
+	 * be safe to change it without a TLB invalidation.
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
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index c637e0997f6d8eedcc42a03a9d303700f62f8cf2..8ed94fb39e6ec6a3d8e6fabe61ff142682f1764c 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -45,9 +45,9 @@ struct adreno_smmu_fault_info {
  *                 TTBR0 translation is enabled with the specified cfg
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
- * @set_stall:     Configure whether stall on fault (CFCFG) is enabled.  Call
- *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
- *                 the GPU driver must call resume_translation()
+ * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
+ *                 stalling on fault is enabled, the GPU driver must call
+ *                 resume_translation()
  * @resume_translation: Resume translation after a fault
  *
  *

-- 
2.47.1


