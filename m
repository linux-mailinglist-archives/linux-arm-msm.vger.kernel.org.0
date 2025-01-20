Return-Path: <linux-arm-msm+bounces-45617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FBA16F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4E213A451D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C380B1E9B24;
	Mon, 20 Jan 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoKruvYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2086E1E9B1C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388012; cv=none; b=IJnYcNAcEBDrjQzoSRV8SwzmP1N/0mk3wEQwm9J6OaEczdKV42s97RrMMvpx6yksP8ZRTIlBaEHG5XDbAGCmT5pHqYWAyppENkaw9kkxWgLy5szU7YUb6tYyGPfP04NLzBGzNa32zfXXsXopx3kjypUBkrMoBCGkaYipwD9cifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388012; c=relaxed/simple;
	bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bHnR29Q5gBPB0gm2Nang6sznkPMcblEmLJqmVoN+DFbrhYShAxh/bsIhyRLoq6gwlV7G12ep2aEVWR2283a3gqdpnXNUDrEgNRn5WRGPo7wMJ3ZnVYMUjrfYDxhQRsqiYf0ffkZ4uL6GEagm9zowBqcanQca+nsbtAMfW3sHfZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoKruvYo; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467ab37b46dso3506831cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737388010; x=1737992810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=QoKruvYo7PsSTPqACFRuQUjAEPPzTh7p+9xrlAluu/fiQ0uJwHsBWsPbU2Pp2K8U/0
         YPlgZWHh/vcAfykr/YEYJoW8+r3Y+GLwnAEJqC0fZhqmr0aAtI+GZ/sC6c47NynHD6qI
         mq6oJPswkeCDRYG/b5vhqejkWaarm/NiVLCMvlGUVrtGMlGlXolQt19fg/QS9PsYOm7o
         htGVTdIVRhQicFs4H4yve+zRYFNt9uuPhlAMDBVP6E/dLEWoi+zHQDtS7ukQ/H4Lytpf
         qFA82lW1/r0OA5fas2FZuEUcq7rc9+KhKbo0eJOcJTrit0C7/ReUEACgDKCvHrRtFqCe
         JETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388010; x=1737992810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=MRALOuPNifmdLqPYaLzNdotAl46tCZuW/fAfO0apWx7DjgNmGrfPlDb7dxby7+on5E
         TsEJK/ggV9xsi51ZDMZgvP8+OBPC5QjtgmemuekA6WslvQnXYRhui4HkGL3x98boB4ZE
         rFFex9c/CIFQjNDLK6WIY6rpi9fpiuMwdSxU61E+5ElzVn4ET2vd+EsucwoRytKP0JPF
         mNc5d4jG6prCxfCUajQrW8pPyBhRKY1ldij80Ew+wYpJtonLtlkLqP/9hyPGJ1R0/Z7x
         xi/Bt8wYYJAM7e8rVUSjM1F923woWlRf0FOKwSYGZeTv//cBR6TFbiGa5H6gu6WyxCPZ
         PHTw==
X-Forwarded-Encrypted: i=1; AJvYcCUdtb+UBhojaaDcozwjShICkTF61zJciB5z4YWQdGKrIVQukjHNGrcKbB9Kpmn4iLxGO981I07KjDUTRatv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VyrcfZb0E+njs2/PSXMPC6zxl/XyBfDyCkJvobusj59zjPFs
	W5S/d6kKg8DFZ3o6lJ6JXL9pudYAr5w03UfO0VDKYpv/U3BS2Khp
X-Gm-Gg: ASbGncsoVC69Xl3m7jWMo6bdbxFKyQ+mcrNLmE8++c15wRdm3QvGxbO0w1grbu6lUoh
	XXkWeKr8YfSz0c2my1pjS3VdK8EzklLNA8BjHyO4QI9NUaz6Mr9LhbPYjseVcqhA6rZbA1dQa5j
	bk/cQmEmQi0G38M2G//pR/F/O4lI0IUeXiuvNMQmjojagMzWs7DVILicipzJ/LeTm7Ye3UXdz5l
	tg2cyRzh9KX+gkxE8hCaZjeGd37Ms2pkJekwX1d5uuEmKoOCtUuXYqRSYVk0HgF4LAYS2GkGMrx
	eW4IvPjsroyp63b3G15ju+wUkywV
X-Google-Smtp-Source: AGHT+IGO83HWcFHvsj2Z+GtJHgpwBYQ5v8L6QYl9DTIkrCF/MppDtKtDUAn/rsAhdmobjhxCpwFbMA==
X-Received: by 2002:a05:622a:608a:b0:46e:12fc:6c83 with SMTP id d75a77b69052e-46e12fc733cmr80827391cf.0.1737388009957;
        Mon, 20 Jan 2025 07:46:49 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e258c82a6sm24230501cf.59.2025.01.20.07.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:49 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 20 Jan 2025 10:46:46 -0500
Subject: [PATCH v2 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-msm-gpu-fault-fixes-next-v2-2-d636c4027042@gmail.com>
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
In-Reply-To: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737388006; l=2108;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
 b=1hM2Wj1hNgl2mwr4iWI4WCaP5p+MmlgGs0igxClq5lMDY3J0i7z9MPcdLw38a+qq6t3MdsGRN
 stHBB5mOzQLDWO2MTNS3tPbd/ElnrF/+O0xip/h7iEzq0A8p8RLFyl4
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


