Return-Path: <linux-arm-msm+bounces-51970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5B0A691A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D59B07AE3F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63523214222;
	Wed, 19 Mar 2025 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgiWNMXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021B213E9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395454; cv=none; b=DU5ObrTzMTSjkfttCa8QqEd6ewNvVAKijV5dKSJLjDdemEeUZuPGeF3P3xuUKTLTfmKUlyWV1Z+hUqP56PH/vc8iO3eGpicXdMd1AXVwlOSFQs2who/hsrkgW00RWDx/WZXXZqggAbj0H2gYlAYATBMwWwXi8GLPdJD5GKivvJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395454; c=relaxed/simple;
	bh=dyr7GkrtgLsig+n5TUngdYzO6eV3oK7bTiLJtUDHAnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdJkZk3+I0nq097Zb8OqpB1OoZ6hNlYYMxSslpPYvF3Ih9p5j8vAfDTt85BDZcdtgXFexJGNXMRlHcUv4Z1Op8DLz5OWxEnVO5y0P3bfrDkz6LDxy5ijSgGiLtbb+TNk3U0v5PxWYm5V9J62VabTQmRkfaM/MZePfRMoc0DYB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgiWNMXw; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c553948a30so20391385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395451; x=1743000251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPN0fQB0H/8KK70kj8NlZTzNxC/Qn5H/Tut0vpbeXbg=;
        b=RgiWNMXw/ptuIO+QeKs9qgjrYhScPA7ZLeThS3OX9HZa9v0QGFsUZcEqrYuLwistIU
         1fwxTChx0mZzWEOXz2TC2BmhX5vHcPVXisGYZV6N63TJd+E5/bbKNJsoVZaZ9z+uyGnB
         pIXHPLKCGrhDywdYE51TMAVpng+5ALZrpdHBkU63mp/93L+Pn9PywuijkmmE3vD4ekLr
         JKHPUO87Pjbc5csYVbH49mvrqOrthp2GX1JcOAZsnsBbgf2WV6CyLgCqAWM76OVD1gjI
         FVZ/5jF9XSQAwVueuMUjXzkGAIvDcrlhCoa2thYieutcCrL3FN4kqEQltppBaoL/tG8N
         Nw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395451; x=1743000251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPN0fQB0H/8KK70kj8NlZTzNxC/Qn5H/Tut0vpbeXbg=;
        b=cmhq2NTCc5buTJek9mMvspajQjwVGR9m0DjyNkv2/JEY7jxJEyzw433C75GccPBBNN
         IlOUxi4ZkiVfpfyXWz3jAynFuTC0+ajfkvHxseA9d5F12M7Ez2SfIXP+y4BNUK7uiwDa
         JG4/ISjSuGU3Gq0O8eke7FYg+0fanJzFMz3efz3qpBZx6SKf2INM0Oh5Wzw2ToKJVXg6
         cZlxu1svAo3loE6PhSsHdqH+awMm1ZklEqJbAcP5qLrmdCpVfRk/oz2LozG4ZXwcaOsq
         4VhlU/BD3xwTHj6SjN5vVtC/1fvFggeQN2ffs4MS9byrw/WezzKKkdN1gkyqbq+5iAdR
         xq8A==
X-Forwarded-Encrypted: i=1; AJvYcCVEOLXoG2g/X8gsbPN6XWreWucuiNUvKsVIEgj8d5mZpm+ItIMtUSuheSrYucRjrmCohrW0hvOSXi8wfZIT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/pxl/xer57gCPakaooVxt7eUjHTu0L2bPNN2n8K9N5jbVAWA
	jw7PP/JCmVhla99Y/I30K1W6JxavlpZIwEB+3KkClqH7VnEIOSUwEi/G4zwZ
X-Gm-Gg: ASbGnct/YDbjVPbjNFv7goCafKT8FRWpR9j6opPrOnUhfJy56Hrn072Zm9vizaagFM1
	Iow9UmwXd18p6FoOSCl15+vz/20XM0ypAid66HFJHrolAB/VfGKjqz92cob8tBrqPz1FKCutUBq
	j8wFn1U4Op24w9ls1ZD41Nxau+kzp3GiAkqC+g7qovsP1u+VBjG4oQx2W9UT3+zfJ48wiOT0fQb
	eYa4OneB5Dr1+/FxDmxUj+YdCj9YsTMvq9B4Su6rDSBdBa/7Av42DqJzxkgfoqwPmDC7OG4v6RT
	bNeT2n7lWTbOTZjbDeNBt2dMCiCGJ59Pd3x5wi+P0kL9LS12GtLQNhSSX3ID0j30SslIt0QszUV
	leYs=
X-Google-Smtp-Source: AGHT+IEpDQ6Iq7EL34BOyUpZMWjHvcPvh/lkrIFcpZHlUwWtyFmoiBx6pZ8T713YT9KI50QLqxMdOA==
X-Received: by 2002:a05:620a:25cb:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c5a83d609amr122312985a.4.1742395451490;
        Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:03 -0400
Subject: [PATCH v5 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-4-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=2356;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=dyr7GkrtgLsig+n5TUngdYzO6eV3oK7bTiLJtUDHAnM=;
 b=RKN5nvvDGIxbm5UBumrBYsNQjDxpkr0KCnP1Iaw92xOCRP/yvUGsivMyDJOaRMEhdhlM/3hlS
 Gw3WyY2nTiICpPLJZ1sNNIRZU6cstKEpnuXrASFBZYibV9DoVEO/0gX
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
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a428e53add08d451fb2152e3ab80e0fba936e214..f6bb405573be0ed480a2587a5a780dd711b8d2aa 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -77,12 +77,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1


