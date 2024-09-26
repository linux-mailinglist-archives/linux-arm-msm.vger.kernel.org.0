Return-Path: <linux-arm-msm+bounces-32611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED2987A81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E8C1F24391
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB90187862;
	Thu, 26 Sep 2024 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUuf46Tw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07111187345;
	Thu, 26 Sep 2024 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385423; cv=none; b=LsKNGPKHhaZd5gcN6PpY6EOlKD8UMjcMbeALozT4Yy0p28VVIqGMyKQDmAjGuNccn/PVpuilYPiqKO9vXdu0vMoOzizNeLS2Nh8B1k3YYsDrONIxrcq24T4+n1hHpFF0kkGZ885eH+pHjhJp39C8XOBbxskAaqx63/yadi8yOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385423; c=relaxed/simple;
	bh=jU1AlYtknaCE51ZnM/HBAvqUX6+tTJwfzHBOTp368BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdhcEnAOmrNJFzXlCKU2sbHkMQ5H8yI3nyou6y/YE0pUu6rao1mgTxIpc9IirLHJsbtlQw0r4CVC/ATS9pr4Li4GkltU817wiHQMmbUwQ5JdI8qU+coFJbBoRCWQoHBdkf8o+rNcSTt4t5JX68OsE249yhmA7pP2Yg7iVC52IK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUuf46Tw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso209581066b.0;
        Thu, 26 Sep 2024 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385420; x=1727990220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
        b=BUuf46TwS1EMIb9cdK6u9biN8qbwueetJ0tf0vNGRVMerX4FWm+u8Ds79qxfHqxzMZ
         TNwYeRtOhQSecVR/ranvIHzqPFHSBR4b6i248vKRf+aZum4/4JLiZvc03tg8k28lX08X
         7RTIw8e0xYhq62RMh07oOUkl2ZKjUZpIljQYwCOoGJN1l8rhbSeLXNJu8jTJm97cqvr2
         Ppr87iGkRGRV9vRtMZ+/bFBWazbwnC08dfhpwMx36WY5xIh6yPYtCikEckC4D4wIGtbd
         CNYvECcggzhXxjNBDueFpfFzENm22TD6McKrUms6eu6JtwBfAlV5oGfrMOV3YAs7dHSh
         C+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385420; x=1727990220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
        b=CEa63oLxBB0iqr21/p6kBHoc2s855HCC+ocu/8WeF7dmdLGfzUZ7JRa0JLoqrXGwVq
         v3i5lJGLgmzvTeEbbIqckfcHKWkVl6rLIpYZZeHRy21sv+3mHC8pCkymBSAGWCV7s9Sa
         GWTeX8LlYu6YC96PjlVUH1vPJVHGXnjVWogMLvxNkqKCj8kybkYFXbRNY3ti20/1qk9b
         H7+qyKB93oxfRhR05SyqQGY3w3fsP/vo38tfpJCRDFYfr39YFaUC/U1xNxaqzWMkGlyl
         Fw2oyi08d/yv9ES+qLQ8XFwUDvgzfrEO/HJ/Qmk8tGbpg4ymsGS3KzO7tW/IhjT6Aene
         y4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR6B6lR7A0ia8OSVkgbPSPi/pcwj4EYovnMPmXNEHBidsLwjNs5/H9kvSB4ab6jrtPvunS75SiLu/deW5r@vger.kernel.org, AJvYcCX1gFZvmt90uYMT8k0OIvx+WZ6iBHQb+ZewM9DgPnSlE8bSlc72GbqqjavN2qvSwL/L40t1ujTmsIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNxgyXpZQc6RU+4NuVHxvsqKXzuKZ3EWlD8+xcdzXe6rWg+MMR
	y2dI0D85ciU9fHpyPPy3faYaGg1ad9uA+Q2Vr7L6B7NbRwVJIyfI
X-Google-Smtp-Source: AGHT+IFpKhDuZfYNy68feNhUvFGsTiD9A1E0EjHrjHTO56CLgr9u2M7q7/m2r0kwzAX4pNRGTFBuPA==
X-Received: by 2002:a17:907:318d:b0:a8d:7210:e28c with SMTP id a640c23a62f3a-a93c490e44bmr65654266b.20.1727385420244;
        Thu, 26 Sep 2024 14:17:00 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:16:59 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:45 +0200
Subject: [PATCH v6 03/11] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-3-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=2436;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=jU1AlYtknaCE51ZnM/HBAvqUX6+tTJwfzHBOTp368BQ=;
 b=yJILcxKA4G5tYzDD0/u1d3UwGStbNN+/zKQr32KmtRB9+8cDUucVoMKaSentxlvR0akuxpVKH
 fAhHl/J0BOzBbrX1eDNL6GnK8K7ero/qKTz84/h+m0uY5z77PxqAfOd
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


