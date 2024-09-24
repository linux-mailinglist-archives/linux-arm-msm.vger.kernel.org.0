Return-Path: <linux-arm-msm+bounces-32279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D19844B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44991C23CB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388891A76A0;
	Tue, 24 Sep 2024 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIE+LlX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B81A7256;
	Tue, 24 Sep 2024 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177448; cv=none; b=dYYN5VFZ1cKRlJ2kxODfJcuGn11iGSLN069vj/RYQVldYreUXa6vlqxVtlROcgGEc4oOXAiAzCdbHRAGlIvTIPF8UsSqJZv9U6YSTMPY0NISZEDEE2C46iN6n5EmFznG3+K2M4+ywMxWBl+TruC26PzOZ8eI14xI34VDGFfhAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177448; c=relaxed/simple;
	bh=jU1AlYtknaCE51ZnM/HBAvqUX6+tTJwfzHBOTp368BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAfQ6HdeuvV7BCMOZr4IB6L8vjmCUWlHThEqgscdi4ByyWLqXyQX/46oGUJK9kX2+DbfHR2sb8u+Sy+8bOz01IfPZT5McOZWcwc3eI2TMAp2hzt81gfKCI/7JJIK3vAlyJftsquAQ5vR/h8joeRBfn2u4o0kfH/jDlBs2J9iYVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIE+LlX9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so239909066b.1;
        Tue, 24 Sep 2024 04:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177444; x=1727782244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
        b=PIE+LlX9WIglC3ZPSGya5mpf7DviSRbLZfRHhEeQDhEyGjrKXv3GEwsyFYrvJTUDd1
         gk1vQ/tTRCCLFe4yZFxSZSFoZFHqoVt1AxWMI2oevw8U82J2/hYLRQEYLN30/Umr/tce
         sQ1UqBArEHLHfbLjcVPhR7jRDqDnM3WMjDiGPAECqCK1R0fTfLt3NL4GJrvrPksbTxzj
         IiLnUTmaWUjJLoYGzJk3Q3j0Fzisgd4Pw/CtLRd5286i7+MEp8K5i3hK+FSbu/JkQOHg
         BWWMCs77RQLWM+jWi+DsMKayaxgT+fgvhbwshAmJma0UluwSqpq3+h/x34pOaDT0rggI
         Kk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177444; x=1727782244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
        b=G5+16xJdvPMI67sJsEYi9GHIPGTbKXObF/Hivcc2G9pa5IxxJeoHz1ekf4blXjPjRq
         y/U4FW5+ime3RvnBED2hOpRSZ9a30ut+7WHbmPEIMeNvo5OhQhXchWfb9Yivy4y/21cc
         UHwfSIGuyS+M8jbzYkY/wnKZ2D4LGJ/EyTGWjQqj4CkvmcxfAm4QEg4cMwdiJbYaKgPu
         eQ/uBHDV8jO2LH12qsaHkgJ1keHtzvZwmhJL+FLpl0UI+RMxLTOx0JKTl+LIdtoFQ8yb
         z6zWEMpnGk87n8xZfUcn02meINJ+V4WcjpUAo6J1+Wd5J5sWmU01LutbuYazlp/j4JIF
         PZlg==
X-Forwarded-Encrypted: i=1; AJvYcCVdHhRT2F9QGTpDdqgGyOCSBX96q4ORB6MBLUqk//i9cW1f+dX6DpMLflinYK18RTTlPh/gH9aAliLT80Hn@vger.kernel.org, AJvYcCXRQ/O3SC//lIqCTi1QE7+a/4W3BFdjecu2zThNu8Jb/jQj/iQdH07qJMJ9Lhk0utwXd0LeY+Z6n5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9WMW4+vCEX4temXOG+JAxCWJF4OyGqRZca9+gTag52s3xumI
	R8Xb5Ffkc53zHVU/5oikQY/DH60Ao1Edss6hYYBULljLwnT+hYuRrg5RvC+w
X-Google-Smtp-Source: AGHT+IGqRXoyIYAzXzwS+0rRoDSY26E+w04seke3Hd4luX3c4gyYDZU47N2cZwYzSfmtShZy70yqnw==
X-Received: by 2002:a17:907:3e98:b0:a7a:8284:c8d6 with SMTP id a640c23a62f3a-a92d55a9ff0mr295162766b.24.1727177444379;
        Tue, 24 Sep 2024 04:30:44 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:44 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:38 +0200
Subject: [PATCH v5 03/11] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-3-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=2436;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=jU1AlYtknaCE51ZnM/HBAvqUX6+tTJwfzHBOTp368BQ=;
 b=WB9NJcsEG+aJ5FO2zki7u9MZuqw2lELiKDiAM1IPKxx+CQqjJtzKcux5/K/di0l9hjtsHHVNz
 6HCYWYZh8k8CyxlzrUzG+IxUyXVt7WgmXkldthAtQ6ynqJLp7Ai7WZc
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506ea2f367ff0282a73fdd1122f2526..316f23ca91671d973797f2a5b69344f376707325 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1190,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1209,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1227,6 +1229,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7050001,
 		},
 		.address_space_size = SZ_256G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,
@@ -1245,6 +1248,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a00b333a85b099e9eb9209e6a2e646..6b1888280a83e6288c4b071733d5d6097afe3a99 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -111,6 +111,7 @@ struct adreno_info {
 	 * {SHRT_MAX, 0} sentinal.
 	 */
 	struct adreno_speedbin *speedbins;
+	u64 preempt_record_size;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }

-- 
2.46.1


