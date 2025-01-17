Return-Path: <linux-arm-msm+bounces-45464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5BDA157A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 19:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8EA77A58AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70021A9B39;
	Fri, 17 Jan 2025 18:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcn8JkyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0DC1A9B48
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 18:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737139664; cv=none; b=PjsoJSJ5a4SYm316DNn5hv6vi1SvTAAcD4VOll3zoJH5BXbQ1hiMi2+n3SYYdrT/dyvsAeEiqyEg2F8yxj0UGFmzv21MbQQIOF3WmW6gSSAsK5poOB1NA4MZGIpwfetVxOmSW6VnrK746vT1uAabjH7Q9bZ9B0SkCkkgIYa15nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737139664; c=relaxed/simple;
	bh=JyOLVh0gEkcPnnA/qjt0Kfj3pqe9UFDopPZk8F1e/x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVF4M6XkAbcHBc0fo5Hwyk5oKrEZQFrZjs2TPhJLEimDvS/rBfw4BphrcHPBo61bQLAgtqsQGZbb9E6POjwMvLJ5o1tdQ8rOeFWDjhc4Imun7jT2t/JQCcJcoP/d4qNNosqJeiOCLstnjoHbcjbN6zI5k7aerCdWRQ5IIMCbezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcn8JkyH; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dada7c89d9so2098816d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 10:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139661; x=1737744461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cXS8jZh32k3xn1O/NOhZ8hhmDw8Y92QQ/WTT5FTNxU=;
        b=dcn8JkyHoT0J7xQuP+JP4tmgHKOhDkDlX9d98Wslo6/smLbce6tDfb/GmHqi4pAyMo
         GU5cdcfIccMitKx51z+MciATESjr1oP8KI+MV/MR5+iCo7MVjCkgUhOZHrjgFknECWHB
         GRwC9jdJHCfTtNi+nwsQn/0EhsVDI/P6FGqb5CL9IJLsjgS5EkzCNygPzTj6Ij7gVbVa
         Q6ZxMG1jSpSgdqY1buFst/cnAxTzJF3/oANIDCx5vflo2wYz1/V8q10UfXTSJNxpbagJ
         5hY4+DbibcyGDAUA2J9k3tfguJovXZEcI3afcg/u6sajPntuUPFCOPty+7a1thSjrcNA
         /PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139661; x=1737744461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cXS8jZh32k3xn1O/NOhZ8hhmDw8Y92QQ/WTT5FTNxU=;
        b=aBHBU5V6hKpG3KgfQWEmAm5fRMgy9NcDmEGUyLTzDsN/uWgCL63Du03k+CHpBpyt2v
         XLhkR4xdAlzMzmXOY1i12VWjgJKYK9a9J7ja2BV+Dpx/dpVIwgd2KJXEM/RoxlvdCqbz
         mwKqHjn6eEcqoS4cUU1wZw2GM7+0AkQV6x/DM2EGM6VTCSdPE9Zp+sNPyQd0WiTgZQl9
         kT/Xn6gt/4ujnW1mAMO+LcpybCVgW/smIpaCb/smLZEXVsgETLl6SGPu97g/Bbx5pS4g
         0bpT0qRImS68r2j9gHwIrEhjPJen9SRfqWwd0SxmTHFukxt8we124pqZkI6yhKwM7jbM
         oBPw==
X-Forwarded-Encrypted: i=1; AJvYcCWSzBxaP+terY8/qhOa4ogGk3LGRfFhcFfRIHzVE7ZbHJTMOAonIrUikqe2v2bvcgQhoxcDd9kG10e7UlFP@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcgmN8ifQ3OR6AiG6sXWBIvhhpQOJjshTBlUVJ34bgEmB5CN/
	YIxXScvtu8MlkOBytGxzwOnnYIqfFLDQJYMPEqwxKVTztmVlPCXW
X-Gm-Gg: ASbGncuEQNbX6+Xa+u/GvZjylDsk4ss1KXv7jCbJUBHIfKta+T+CbdJUGnafduKea2F
	8xKOYw4xSvApz87jx1Uptbnpys4BXlXMskA0lXNGJlcQp8FDSHX2aPjdMrXVxm42bx87LyycWvE
	1DSp5iw0Qzq++BoXG6GGBSPlIfqUU4mpR1gTFd3HvF7XM2OsCG8hHFrB/G8TK8fHWPbx6LEY7Do
	qgWb7zmM0XZWcrh9PhPUqN9KE64roBmD0OW5DzM6S4qt7kQ36Ofg/0VYGIC+olRsGRHYrZHYrTR
	/bz/eaU/tTX7Udw=
X-Google-Smtp-Source: AGHT+IFkED0JQTC0Xpd5G1Q8mAnhBtwFYNMO1jthK556QYFx0lYcOPWbJ2YYI/wogCp8QUtnRASS4Q==
X-Received: by 2002:a05:6214:528b:b0:6d8:7d84:a514 with SMTP id 6a1803df08f44-6e1b2175b9dmr23314216d6.5.1737139659256;
        Fri, 17 Jan 2025 10:47:39 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:38 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 17 Jan 2025 13:47:08 -0500
Subject: [PATCH 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-2-bc9b332b5d0b@gmail.com>
References: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
In-Reply-To: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=2114;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=JyOLVh0gEkcPnnA/qjt0Kfj3pqe9UFDopPZk8F1e/x0=;
 b=Z8mukskVxG/5911ObuOE8aZjxBMyoMMxQL49HUEn1UzKTTkKUCl1YqM1Kdm1q24jL47h7A9xL
 sQTHHPy79i0CWIRIUNZjb06P1taEZ4QbjZs13mX8cjDTJoodH+OmmrC
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Up until now we have only called the set_stall callback during
initialization when the device is off. But we will soon start calling it
to temporarily disable stall-on-fault when the device is on, so handle
that by checking if the device is on and writing SCTLR.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 +++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ee2fdf7e79a6d04bc2700e454253c96b573c5569..54be27f7b49d78b7542fd714d6aade2b23c65fc0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,37 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 mask = BIT(cfg->cbndx);
+	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
 
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
+		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+
+		if (enabled)
+			reg |= ARM_SMMU_SCTLR_CFCFG;
+		else
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
+
+		/*
+		 * If doing this in the context fault handler, make sure the
+		 * update lands before we acknowledge the fault.
+		 */
+		wmb();
+
+		pm_runtime_put_autosuspend(smmu->dev);
+	}
 }
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1


