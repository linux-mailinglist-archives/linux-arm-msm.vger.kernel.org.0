Return-Path: <linux-arm-msm+bounces-24736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E18191CFB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 01:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FA9B1F21C8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 23:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB813B1AC;
	Sat, 29 Jun 2024 23:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7+ZT4xj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1027224CE;
	Sat, 29 Jun 2024 23:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719704210; cv=none; b=DZ2OsopeTL8mD2jfp3eP1/z6yu60au49lGsxEN71N05SwRyjmgcdSkfuE93S30v/5aVzYe82E3jzCn1dN9+GfauEjaXWOMrSAiLJP1id7wmKebyXSBBqY2i6w00RTLtJTQxgIk3GVBfQQztWJsvwntoHtx05a1d3rS1aEHmYOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719704210; c=relaxed/simple;
	bh=qdubja2a/eO+GwSBXrRZh7WYf1LsoKAYcNwuqfk3DPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TOUIGLTrZC+88E8mE0e5cVaFpzlYKEdKkusCJtif7r5SRH3KVD2tyYfdwv6rpQMSfE443+iroNuWfMz7taUa70qYdG+aUMdoh7rgCvbsk2mMt35daNK63XZ6zgsLASsWRnRGdQYFGuB0mPo4tKAemh0/AeSQ8NiLnYGlEGhv3rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7+ZT4xj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36733f09305so980254f8f.3;
        Sat, 29 Jun 2024 16:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719704207; x=1720309007; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYfyAe8uv69x0OGW51XJGsYOuqxBkM/QrcL6+VazXM0=;
        b=i7+ZT4xjiBaTQbj0rajeijaMmxRvWRmFyXPnKolpa8F3I1bfHCOr1ZO6YKr/EUg3TS
         XBhfUSWnqdvMmjjzhwJX85bssIWhiQwn8YADGeBGLLOMspCG2Xx+OLIVLqDaWAg4J5WR
         CmJr7X/NHhFhJVo5Ir2yhFmm9kHJQIDCoemWUobLGg7+PVXzTl2+xP+1ojZO1fQxdY07
         tenY1PgcM7wIFiCYVdilcA9aWkRA/5cUl3jtgWgIF+LgRVjWKBcgZMG/N5rEOkYlrwxF
         RDVy/c0+suwvx98mK0J6lQ9vJspaUX7s5rh2D1USAYVEhFdoCYzP4HrLmt0eZdB6/H+q
         JHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719704207; x=1720309007;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYfyAe8uv69x0OGW51XJGsYOuqxBkM/QrcL6+VazXM0=;
        b=g7kc/CidzUsaVO9CXUmpQ9Yw0832FfeRvmFmjhEJkc9UuaUWT5OfbQKLcolL0hw8Vw
         wiqcpVq37tqyvSuYaPoXi6ZtW/gVTaottIt9hlrLCw5gtP4h8nEr7KyOX+pRZ7PsQFsp
         0rdIL1QrLn6q0jpd7I0bu8qx1IIghDrHY7XzGYB4oKpQE2vIdCbNExr1TmNJO8BHaMvA
         v8WaX+1oNG/MnyNToW0miCtulNnWQRZSai2vTVeoYMcwwhddKI7KgTjwDaX6sbp2JaIL
         w1L7V9k98lj1tnAevhQ/tPaMpdMhULZhl1aeonUiob3qN1+3j5geFaO0CjRPHUfnKCy+
         OzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr4Q651f7xrIwYPdba8RNHuSxzRudabSJ9ECxwfGgmz1Kgvc29kGUTiBqOkCxcaad6KGrfuvxi3pi/EsMaPmczBFIuIjN6avP2irp3
X-Gm-Message-State: AOJu0YxFagmXANFmrbxv+uqQTA6CW8axPRlKPSPJkhbQKtRX2po7oqNO
	d68coUwlUnAVtI92QNg1Uty+e3OCLLCBhbkY3SsxBYMvGyEp3lrb
X-Google-Smtp-Source: AGHT+IFThPOK8y8A/Io5Ody69yRW+unRpRrZ5ZSTS3jZEaXRHJX4mGppm/j/1/5GEJ2GHr2ByJrlfQ==
X-Received: by 2002:a5d:61cc:0:b0:367:4d9d:568b with SMTP id ffacd0b85a97d-367757283cemr1157140f8f.68.1719704206899;
        Sat, 29 Jun 2024 16:36:46 -0700 (PDT)
Received: from [192.168.1.130] (BC24902A.dsl.pool.telekom.hu. [188.36.144.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9f9dsm5939238f8f.41.2024.06.29.16.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 16:36:46 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 30 Jun 2024 01:36:42 +0200
Subject: [PATCH v3] drm/msm/adreno: Add support for Adreno 505 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240630-a505-v3-1-ed1e8eae3d84@gmail.com>
X-B4-Tracking: v=1; b=H4sIAImagGYC/22MwQ7CIBAFf6XhLAYWqK0n/8N4QNi2m9hiwBBN0
 3+X1ph48Dgvb2ZmCSNhYsdqZhEzJQpTAbWrmBvs1CMnX5iBAC1qobg1wnA0B9W011p6sKxc7xE
 7em6Z86XwQOkR4murZrmu34D+BLLkkjeAKJ3QHoQ49aOl296Fka2BDP8kKJLvrGlbq71y8ldal
 uUNhRyHIM0AAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Daniil Titov <daniilt971@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.0

From: Daniil Titov <daniilt971@gmail.com>

This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
SDM439 (650 MHz).

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v3:
- Rebase on the latest linux-next.
- Link to v2: https://lore.kernel.org/r/20240604-a505-v2-1-dfa599a4d3c1@gmail.com

Changes in v2:
- use DRM_MSM_INACTIVE_PERIOD instead of 250 ms.
- Link to v1: https://lore.kernel.org/r/20240604-a505-v1-1-82ee1c04d200@gmail.com
---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 13 +++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 29 +++++++++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
 3 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 455a953dee67..633f31539162 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -10,6 +10,19 @@
 
 static const struct adreno_info a5xx_gpus[] = {
 	{
+		.chip_ids = ADRENO_CHIP_IDS(0x05000500),
+		.family = ADRENO_5XX,
+		.revn = 505,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
+			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
 		.revn = 506,
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c003f970189b..c0b5373e90d7 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -439,7 +439,8 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	const struct adreno_five_hwcg_regs *regs;
 	unsigned int i, sz;
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu)) {
 		regs = a50x_hwcg;
 		sz = ARRAY_SIZE(a50x_hwcg);
 	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
@@ -483,7 +484,8 @@ static int a5xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 
 	/* Specify workarounds for various microcode issues */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a530(adreno_gpu)) {
 		/* Workaround for token end syncs
 		 * Force a WFI after every direct-render 3D mode draw and every
 		 * 2D mode 3 draw
@@ -752,10 +754,11 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->info->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
-		if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
+		if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+			adreno_is_a508(adreno_gpu))
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		else
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
@@ -771,7 +774,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
 	}
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x100 << 11 | 0x100 << 22));
 	else if (adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
@@ -789,8 +793,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 * Disable the RB sampler datapath DP2 clock gating optimization
 	 * for 1-SP GPUs, as it is enabled by default.
 	 */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu))
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
 	/* Disable UCHE global filter as SP can invalidate/flush independently */
@@ -1345,7 +1350,7 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	/* Adreno 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
+	/* Adreno 505, 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
 	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
@@ -1388,9 +1393,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	u32 mask = 0xf;
 	int i, ret;
 
-	/* A506, A508, A510 have 3 XIN ports in VBIF */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu))
+	/* A505, A506, A508, A510 have 3 XIN ports in VBIF */
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
 	/* Clear the VBIF pipe before shutting down */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cff8ce541d2c..2497bbc07ed4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -324,6 +324,11 @@ static inline int adreno_is_a430(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 430);
 }
 
+static inline int adreno_is_a505(const struct adreno_gpu *gpu)
+{
+	return adreno_is_revn(gpu, 505);
+}
+
 static inline int adreno_is_a506(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 506);

---
base-commit: 1eb586a9782cde8e5091b9de74603e0a8386b09e
change-id: 20240603-a505-e57389b61d2a

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


