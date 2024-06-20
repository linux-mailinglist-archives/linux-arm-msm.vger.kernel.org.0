Return-Path: <linux-arm-msm+bounces-23463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B791152A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 23:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D6971C227FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 21:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24CC7FBBD;
	Thu, 20 Jun 2024 21:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuD2yNi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4EC81723;
	Thu, 20 Jun 2024 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920336; cv=none; b=GHCOPkhCyyxU5pZzbYr2BqUYRwuIPBBywdnzgSmYxaYau/+busCKv8P3vMjlMc6eYZUA1x4I8K/N5sjDFcfWwuLde1XzlOQxexKKjI2k23uvNE9q3QQKi/LzngE0ovPpq6A98UbVCcrSZxSukH5q8UmVC3fXRvixUwxy0WxAfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920336; c=relaxed/simple;
	bh=qbJ5cuBXNm6raaDmGjLTRPvi8S+nF+VkBUm0YaHsu9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nGWUaG78bE2Z8050LCGxS32BLKCqmgDlb1gyhPXv+US+QtOBbBtCS2cajq1IweyP3c9NhJAdDLF9erj000KcH2dggoU8aMlX7E/9dMK0SMDWQ6MqiiOgZe9iJ2hTz5kIyKWOjAF8tfUqbUBzwTFiuTMMDyMLsWDOcYQAFEElMBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuD2yNi+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00b97so1251996a12.0;
        Thu, 20 Jun 2024 14:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718920333; x=1719525133; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PfbEs1C8SkvZmo4+nwHcxpTvuiwrdBVKtL6B4M3SqY=;
        b=WuD2yNi+oC5tuXsIgWOZl225qQAuSDlGlLIXrx7VWtaKEuz+S7fSMnBBlWj52rgRoT
         0rAzW++DNmCX+KLP5ldnWgHmadfTOhfF66g6u766J7bxV4bpxnIKdkr5XMspF+eTvK+J
         MNlUV2A0QnerjuVENNLK9o/GxjfxqnnmXDle8pfZ9OFwiGpie4fQ+yXvPFz09bYYThm/
         LxPIRRNmwsw+ucJgHzhleKwieNo/HmYGL1wn1Wsv5eCqBy1girSVD977EBoPwQmQPyV2
         fSpGnlv/Bre7oTg27tJXjNMi+b8p9eKx5SJzGuKJRsIGyrmKjp4tQjVH0ChMI5FX/P71
         lLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920333; x=1719525133;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PfbEs1C8SkvZmo4+nwHcxpTvuiwrdBVKtL6B4M3SqY=;
        b=bj8oAjmk1V4pF2/EVQWbJ61a6yzUIcTS+GpVd5JIUPN7UpJhCJM84cSXMxElk4/4a6
         JVSFgUUbZgVPrU1YHsEx090dFP0HDpU4QbiLCHdow94ZZ68hVOV5r6gZJAaN1/8d7K2B
         WIpzu2fHXYSJpnUnlLmlvdlps01z/eeVsDCKHcbDsW09cGh1YsG4KYK5pNFZz0PfHXBr
         vTIIpqQqE+bDRxTlNANX1eZD7EqvqXJVtCAZFFahZ8Glg0GIpmXMLWtSGaIDicdgfNmB
         cMnHdEXz3kc+7j1vPLQRrEbINONB+4nIv2SyeiLApE3ZL7B/wablI3ToqoyQzwKPKqX5
         BH7g==
X-Forwarded-Encrypted: i=1; AJvYcCWUIdBGu2pk84V2kP5x4KHioUdOgGalgjuCKHZhT+/StPeD97QwRA4fmFzE2HVABzD70PtH03RAZ7CbEfnSzMmAdY5lvZVjUzzqh7hV
X-Gm-Message-State: AOJu0YwDnotZiNqx+tU+/RbCxX91r4T0jYJy18OdSOKvuT/OCGTA3NGm
	15AkP13vwA/NlKxmzJiomqwLtALRHKg9VtiNHsyTn/eLkErzPQyb
X-Google-Smtp-Source: AGHT+IGnc2o/KQaEM68uGi8PrWr3sDLJsmNHZL8AdbVkEJ5WsQzrQZoRNCK9RAXEoutmUgSecDByug==
X-Received: by 2002:a50:d4da:0:b0:57c:68fd:2bc6 with SMTP id 4fb4d7f45d1cf-57d07eaab61mr3355795a12.26.1718920332879;
        Thu, 20 Jun 2024 14:52:12 -0700 (PDT)
Received: from [192.168.1.90] (20014C4E1812920074CAF9406985B739.dsl.pool.telekom.hu. [2001:4c4e:1812:9200:74ca:f940:6985:b739])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30535005sm60919a12.69.2024.06.20.14.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:52:12 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 20 Jun 2024 23:52:09 +0200
Subject: [PATCH v2] drm/msm/adreno: Add A306A support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-a306a-v2-1-0d388e1deebf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIikdGYC/13OTWrDMBCG4asYraugH3s8MiX0HiWLkTROROO4k
 VzTEnL3Ks6i0OU3DA/vTRTOiYsYmpvIvKaS5ksd5qUR4USXI8sU6xZGmVZ1BiVZBSRbZN3b3rQ
 Rgqi/n5nH9L0574e6T6ksc/7Z2FU/rv+FVUstlSWASCFi6N+OE6XzLsyTONyfZObrVy1anq6Yu
 BTaiobmdeNAo4bWKrsDAN1VMc8+hjPljz9u/wj0VFjWMaVlaLxzxvcuEPpgLYyEbAIq55TvaET
 FEcd6jjXk/gvuY3GTIgEAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 20240618164303.66615-1-robdclark@gmail.com
X-Mailer: b4 0.14.0

From: Otto Pflüger <otto.pflueger@abscue.de>

Add support for Adreno 306A GPU what is found in MSM8917 SoC.
This GPU marketing name is Adreno 308.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
[use internal name of the GPU, reword the commit message]
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v2:
- Rebase on https://patchwork.freedesktop.org/series/127393/
- Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
---
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 0de8465b6cf0..61aeac5054a2 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b8ee9320a315..3b361a077688 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -292,6 +292,12 @@ static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
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
base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
change-id: 20240528-a306a-48e173724d6c
prerequisite-message-id: <20240618164303.66615-1-robdclark@gmail.com>
prerequisite-patch-id: b26cd6e5aa23ea623fec94f938a06d1e3359de55
prerequisite-patch-id: 301e8fe4c2687a4606ee7debce95a5ada732e27f
prerequisite-patch-id: 24a5654d9b52079c010b0594d8599d84af1659c7
prerequisite-patch-id: b09a3d28d04b7ebe968e05835ebf8397c27f8d7d
prerequisite-patch-id: a74556e25862c22f0ec543b8a7c7d92cb2e55099

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


