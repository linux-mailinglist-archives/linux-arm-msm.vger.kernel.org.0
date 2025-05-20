Return-Path: <linux-arm-msm+bounces-58775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5CFABE363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BAB01B6634F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D76527815B;
	Tue, 20 May 2025 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr6M+960"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8E32701A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768146; cv=none; b=T+OAmRqYJoXMC1SHBTaluWUxOQAkT4L9jNLXPv+4dlL87ENVlL5Th5gZP/BMc9WZMuXDtHU26TZ4Jz29Wqxj3CSUgQJYGFXOyI7XpjiE4vGc6EQDrvFX0vc5UQj+H7OeYWQM9sy1sIAWIDFC9nFvZ4Flwdu8I5veR8Z5dAyTxKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768146; c=relaxed/simple;
	bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H46EXwg4d3zqYuNx9m5Xy3TaDWxW7ole9GkQFRQUZ95LR5uMUgIsfieQVShLJurKId/MMKewAB4LEoUkdDMvbe9WDayS2nRmveXoNEkM789IFdNGMZKLLzOglNwUD9QNpbBR7vJ4Or6xDAqE0D9nOYRaQ/XOsCfquhqKyef+S2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr6M+960; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f8a694d622so12034966d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768143; x=1748372943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=Zr6M+960UCNPDsHwNKtH2UO6bGEth31KSeqog5z1kvqBHw4PPy7Rd1nFtV+b/iwpmS
         wDDzoAuL2VUjNahLXhXsxzpwWLJustrfFrLwAxy6B0rg0lu81SIvchy56EV/DW/uLEUE
         tHwYzeQIJPl0GjZUs+wFyZDExdP9mMelwWPpqs7PzhXrZ9f55D5JlZVp9KBsjtt0gf3G
         RJY4j50rUwGpLZQlOsbDa6/b7U47c27RgAZoFsN05z8EStP8ExsYgifZGWQQKfJQdoyI
         StRkkbh2L/VqTwiJekNqMUa5yP6Os0lk1z0mGGHZuDIgCPiC221arhYyDfyZHdoTu3JL
         oh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768143; x=1748372943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=Pp2DObWZPNaMxAY6J2cUXxtxmhpe3+RS8hXJAnVH345ubwjQenue5+fwHQn3DPlYYo
         HVbjYE5XAhzmHHmr9AaYg/IAzS9dBHcM7QUdRlBXDO3653FAunK282dAsTUt7M9ymQB3
         AdCWXIv3Ar0Cf2X0nyM2F1XX5MRLcyjjmzzRC2PJYfWZgPF2+0D7Bo3taxgYvfpGkN4l
         RNdH61osgd1V+UDh0oSoQgk1x8WPErsF9gCj5dcLMjxH7vuCGcS1zBvwE+m9Wg7JJ5aH
         DkJwJ+IqnQiNo6f/fEwaCQ70XWkCXri2MKcMDMvuuqjb0Jubkhz3vw+/bfDf+MJ9odbN
         2N2w==
X-Forwarded-Encrypted: i=1; AJvYcCUXVQDPKwGNWHfzJTRO2um+zLcSJCT9lr+U/LKLb+5EaVNernUO/zwFu9aoq/1VhYNF1pE8A7wU96H43WhT@vger.kernel.org
X-Gm-Message-State: AOJu0YznkqQJ/ZtYusZaWxZfwSKQYU7xOIKffjumB83JPLZpxSVzUH2P
	5vJezYwNSdZ9apJIvjnhSoWuswsJekoBqUKZoVFa8fhHVB6wkpWqVHcI
X-Gm-Gg: ASbGnctEm8gmRnEqYWr69yCN9ppgXdXyW3ta7LOatHZ7OtdIM6bAxNPICYDo2ZLY1Mb
	WOqR9q6Ze6ewfjZRf9OljSmFzq5EwSCfRtDUjWSz9KPdjvW6REjAUNVg+2r/PTf0TDn3ziBFjZx
	1ypyhNY1ykegWAM73lS4sWUZZQ3bI8QtDQdXNbRTZ3H8rPDBTz9DOdcukwPiDMnrcAvX7DegL2G
	0oHYnLpetyXfYWJbWTKpI3t/KdvKNhmN1OyaNnaa+7d8qfwCp1lfi4VOF12nYCBgtQzfePKqqLh
	UTru9+q+RwEehNb3VrFEHbbYaRbxqE5jc+K50Q2I46GDDCBREbaNii+HX8bI/2Zj0KxCpvbvJjk
	WV19gZ4LZQ9tXO047WS0=
X-Google-Smtp-Source: AGHT+IGIrgJ2dmANNY3EjX9kZvxGmi8VdnrE3uOp5o3gsUKwQp+d16sgiHehsoeADCEn10ddqVWxMg==
X-Received: by 2002:a05:622a:587:b0:48b:6eeb:f98e with SMTP id d75a77b69052e-494ae330988mr104811741cf.2.1747768142906;
        Tue, 20 May 2025 12:09:02 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:56 -0400
Subject: [PATCH v8 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-3-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=3453;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
 b=Gva2s5Z7Ds/ygUrvduDeZ/TWE6RzxCRXnJg0Zhx6Z4wRmr7VRKNIHU/2xJaO+oPPC4dZhG1Tb
 GdN7Dm+NI2yANHk93Y3MujPoXjVnGL92q+a8IWtX3FmhfkHr+wCKih3
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


