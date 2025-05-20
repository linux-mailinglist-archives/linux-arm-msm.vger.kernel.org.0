Return-Path: <linux-arm-msm+bounces-58760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B92EABE20B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF64C7B3FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E441FFC54;
	Tue, 20 May 2025 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu7wwOkk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9C26D4E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763106; cv=none; b=AwfKORoKLtfTIArAmoiOcSpRPNOZVe9+YsfOAXgbnsFsTwQSmw686CcjQNK5aO5i8kBvZWgwFP/4ZWgAu3798IUX4ItE3nPUZv7d/IlZjRaeAmXhyhDPc8FgNKyMfp9nos3miwP4hKFGpXLpkiUsFFERYyE7CSEHuc/JVONDI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763106; c=relaxed/simple;
	bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVDSIIB9SRs4I0dRKLJaLYwHl6KvpmS2nWdjma132TC1EXM9jjkwYE0gWTHoOIGGL31buftwXUmo/opJ/jY9I54oqsctdiZKT65upZpRvUzkZVN2nwyRnzHfaLI3Cug4F79QxOvUSSMxbMQy7O4RIB2OEiF5OdzXt2aO7imjqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu7wwOkk; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8adf56370so9292996d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763103; x=1748367903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=mu7wwOkkvX2+egIO7E/rmlO98qtoWd+hC32nF1EGWtrqFsE1O46P9uGLM2dPIrRdZF
         xoX57ZICHhmZbjKjU9PCW8PlwHRhaIaB2RcRxA3zcVB4kF9CBbJ2zCopZ7BorwP8tsue
         x0S8AKYyoxiDRiKRhkTxeNa7E7SAXGTGHfsckTuJVH0UYh9pGVP4Vjx75dbG2Aw7Ivfm
         dLd1Wm8/M/1/J2uGlm/O18kut9k2OyUrISS+BIkx8cBzU2T7VSmsLvS2l6RVp+m2oliL
         +yNsGmzJh/aNLWYeTcADA9lrEAYpJCytvMHoWPxn40htw/qeLd6FfWaUwuBWDCDqHCzK
         exqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763103; x=1748367903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=lwxkx1fyNaKjDHGDYRlH5GaJsotiRbYOp63+V2vJUkO75cWicGWc9Zx97D1n5G72jq
         Ac4bO0RewWfAW0CfNhmi9Vy32QCnfRQPZl6ZsMt0gPYNxqrSIZMyXCUM1k57GclWt1um
         YzQ0UFJgD/yJhPp0wJ4CRtjMql66tsuEwSHJZMk2D0KebdAHn6+Y3XDxOPFUzqYipCof
         sDbiMm/cZ8o+qegCfTz6QAtj4+BiHLiWnHNrCqyfQ2nXfvmWf/Hd39m9CdIkoBX/wM8X
         CgAhRdW0WKjo+ewbZBiNx+/sEThf1nLOaxr6fgpO//MpKORkINh0eanmzbZZLkE6snBK
         7Y2A==
X-Forwarded-Encrypted: i=1; AJvYcCUwbds2MAB5agz6vBqAGxtgeb2JkqBuz7cfmoWmAHaRtakT89YTsPo+MbyfGW+Q7tEwHfo0kV9pHhVykUr4@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKbZxbUAKrfKi5C1e1+yIC0Hdy7LCkZ5tKeOFFqybneHZasAf
	jFP1RFR7jLj3le/+0trWa0ygP+L3wbuVV8YCfqwAXv+s+7FB/mzpfZ3I6TCMw9+n
X-Gm-Gg: ASbGncvHhdXEuTZKsjYh00HpbAx5oIpP82Ig+e0Vb1kbJtq7dxwRMNGrfMN8JNmZyys
	jFeLeyx/u6Ts/S6acfcEHqNw4WRcwoL2Cl7WC5ZrzkDeCBIQ08hp5pW4uPIn+F7lHc4pA++V2eI
	YusUJxAjapmlM2CXoFnNmU2RL1qqVI0bGuVep7tcDTQAt/VCPTJiRWrZUaHW3c+5CVRaIi8UCkR
	z16G5ORYuK8iaULVzzjG2Ao9VGi/7P4xodm4KyOE6Bgy2E+zJqLYMLo8ITtb4STfV8qJ8QCBEHU
	gPuKsQNNZflFxRI1fbPGzHMdlxL1yD36hLD2X6K7fdYtGUvcrRgKApAl+TPT4ztBhXJ8hJnOsmC
	hOE4NSyR1Q+VbM3tr9hTtpNqeDOMw7A==
X-Google-Smtp-Source: AGHT+IE97Zxos5az8cXO2o92+oaDSt/gpfACDdIypt80WhX1ZCXMDiAGP2cn+7N7wTHFzmRR7CT4jg==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b095:a79b with SMTP id 6a1803df08f44-6f8b0847d1cmr100255236d6.3.1747763103301;
        Tue, 20 May 2025 10:45:03 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:52 -0400
Subject: [PATCH v7 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-3-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=3453;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
 b=tD3WtT4vxh3vXzx33GeuNyl5hmvn+QJsiqPwD8bbM2tFraZ2f8cV83+Pw3p37JhvR3WUGpJVu
 Jc3NWPlszKkCay4kWpB4ilL1RekYJZqNSrPXTsclNz4Cevm67LPekiu
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
index c84730d33a30c013a37e603d10319fb83203eaa5..f7430c131c21f40308df36fe25fe75d31558c817 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index abec23c7744f49bea70f3352da9385304ed3702e..d83c9175828f792f1f43bcc8056102a43d822c96 100644
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
  * @set_prr_bit:   [optional] Configure the GPU's Partially Resident

-- 
2.47.1


