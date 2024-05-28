Return-Path: <linux-arm-msm+bounces-20822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB478D2512
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4C61C26550
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 19:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84413176FAE;
	Tue, 28 May 2024 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUH3YT0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3C2E639;
	Tue, 28 May 2024 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925420; cv=none; b=hZvDsGo1QDK9WpI0Q1e0C6rPu34KYxoNaXCY5pHFRx21TOa2u4Kl+esD/HhKT6F++O1id7jMrh3kqtBuxQHTtl1Eaffc0ZDrzGyTxnelYD9ySPd0miuvW2qCMM9VjhYnXLEIEBBcFqvI4jw03gm22nvu2GTqQbp944QNFv8pRDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925420; c=relaxed/simple;
	bh=vMgVK30cNI3c6myI3dh/lKotl174su6ZxGyEzgBQDMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p1JFWh4kMeXCMVd6ffvudI7ZzuI+0n2muvd1krkhCxj2TPzLJqdmQfTQjq+gcSEb+IzkC4YauiwIam5WGhUT5RY1TM2j4masoD1gEdMk2gZWzYPdUyAqNOgUJP45OxoOVc23uE4ogujdPqq1ttQ3/13Pyq7jLGzBQGAab3SU+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUH3YT0r; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4211245e889so9812885e9.2;
        Tue, 28 May 2024 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716925417; x=1717530217; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOgU5Pv9vLAMtMzfb5HowXi9zg9SbrF3W9s32WW+p8M=;
        b=lUH3YT0ra3bgsk3/+kcZYnutDziZInGnWMzBT0z3Sz5DKf1fF/kETEmOnCvFJqlmDZ
         ak53rZJ1AWhkTYC1e1RTejCifgkw7a4Dmvf+2enYbx6kh8gyqcdilwhuwZe/iKqkLeyh
         VhFL68Qw1YEv8Xrvs4ywnZ6e+zVtCSDo7fEbC18NgrPtsD8y97wrhT++sXZ8PtrJkawG
         R5ccJ9vdWxHudg0cncvMtl0gABh9l1NPwEbC94QEoxnUUNtNSFebyg35RUjhbeerkRVA
         xZA3Ab6F5Cfe/uiUaEVRzzIF2PjGePQ6xLMZHsgWkXYwxbF+n9ml1bgGOj7pD7zH366Z
         Tzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716925417; x=1717530217;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOgU5Pv9vLAMtMzfb5HowXi9zg9SbrF3W9s32WW+p8M=;
        b=JBVuEH6PDOehtX5KeTpHC3/GpaJp8MLSO4Fi4VxVE8Uz1cyfxiQQcY29QGSWGTrPUb
         gCpV/WYMI6mhV4Gd66Dr2QzpSso7w09HGZHa7wbVjIWacon8rknRlL2ventzWWMMu8wY
         ICKbdcRNrpAoAg8adhURMMZXl9QBJGygxU+e5qOkGNFo+uOlAXyhnblAWFixQQZ6nuGY
         VMUg9l2lnUMZwVdY59vYELZQ8kAiOI4UOVQV3DN3V8vPS7UYn93wmsVFTLgb9jh9PVDr
         Rmyt8bpyo6KJmZqmh1LXOGVuysJa3O7lt01qg37Z2LHohBuG/1i2M6jqpNw03h8f83Tf
         SOHg==
X-Forwarded-Encrypted: i=1; AJvYcCWrlU2oKRvsfzDnhsBNsS/8E/zUQLbxQCzCe0Pbik6uKJ7otfnzf4kL5Hf/Nf+LAjAUHZ4f7gWzvY+SqC5L8JkDYFf6IO6ArMSx9Tar
X-Gm-Message-State: AOJu0YzrPAoyoWj63Nwu5uYXYOIABZMyjrBGqmWpNVZxZe4y9AatMJt/
	XkcqtYtZuta/ZdJYVnD0zLc0d1MdEV4JQ2yjHXE+4F+YXXTjLHnr
X-Google-Smtp-Source: AGHT+IGKbSgiilhOSBJxmKHEzGKuWzqlCk3N/VsqD/9S1jtOwU/1lBz6xW1FQ1871m5BxQiTTa4Fng==
X-Received: by 2002:a7b:ce18:0:b0:420:18e9:86d5 with SMTP id 5b1f17b1804b1-421089f8242mr107646795e9.10.1716925416880;
        Tue, 28 May 2024 12:43:36 -0700 (PDT)
Received: from [192.168.1.130] (BC249212.unconfigured.pool.telekom.hu. [188.36.146.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f134cesm183709915e9.18.2024.05.28.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:43:36 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Tue, 28 May 2024 21:43:30 +0200
Subject: [PATCH] drm/msm/adreno: Add A306A support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240528-a306a-v1-1-03a66dacd8c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOEzVmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyML3URjA7NEXROLVENzY3MjkxSzZCWg2oKi1LTMCrA50bG1tQDHRkq
 pVwAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0

From: Otto Pflüger <otto.pflueger@abscue.de>

Add support for Adreno 306A GPU what is found in MSM8917 SoC.
This GPU marketing name is Adreno 308.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
[use internal name of the GPU, reword the commit message]
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5273dc849838..b46ff49f47cf 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a);
+	} else if (adreno_is_a306a(adreno_gpu)) {
+		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010);
 	} else if (adreno_is_a320(adreno_gpu)) {
 		/* Set up 16 deep read/write request queues: */
 		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010);
@@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
 
 	/* Enable Clock gating: */
-	if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
+	if (adreno_is_a305b(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
 	else if (adreno_is_a320(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
@@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
 
 	/* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
-	if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
-			adreno_is_a320(adreno_gpu)) {
+	if (adreno_is_a305(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu) ||
+	    adreno_is_a320(adreno_gpu)) {
 		gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2) |
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6) |
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..198b2b5b67fb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -86,6 +86,17 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
+		.family = ADRENO_3XX,
+		.revn  = 308,
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem  = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03020000,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..2645f6f4ad83 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -268,6 +268,12 @@ static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 307);
 }
 
+static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
+{
+	/* a306a marketing name is a308 */
+	return adreno_is_revn(gpu, 308);
+}
+
 static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 320);

---
base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
change-id: 20240528-a306a-48e173724d6c

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


