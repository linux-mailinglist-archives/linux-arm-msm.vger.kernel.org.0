Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4851BF072
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 12:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfIZKx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 06:53:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50518 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfIZKx2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 06:53:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so2213885wmg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YX2q2l0IB9GS+/BKJU46b4Bovrv9gcTs5FXGmQGtRPc=;
        b=keiNF0rml3xsx0arv5W/KSyQHbNQKT7tWYoqsRluNg5J9hCDOgbBdlASZZSsdjtwJG
         s8gambwY9uejDWxIuUZkyPnL7AnTHXEMpjhP+7FKHxXMY3alXXI5lRX4EYlhNsKD69qD
         gyI4Ma7f85+klCPXn2Bzt1AA8C2FavJccfiD85EI2ktw6YJfrMKwsv5Otrn8v+jddq5k
         7X99UKsSnDIBLPgY2jXndSdWwzo9EN/Uahx5i1gnCIINA/U3Puh+/UZcasV/vyZb8aX+
         ZYZGLshCc1h85atr/tXZ9a3lJGEtWo6CEsAyAVitIn2lASqfQxOZ7KY5p5nRmRYyfgAN
         S3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YX2q2l0IB9GS+/BKJU46b4Bovrv9gcTs5FXGmQGtRPc=;
        b=OFuzA1oreYLVFZwak15r60GhhfzDDF4nzvvwIYXW0RJHvSe/beFSshzRq2+Fec4s3f
         LE4IuHqxRLJB6p6qIbW3LzwE7yEph+78gyzxRYHGRhYDcrCcerg1EzsbVGDdOYTkhBkJ
         uwBqA30HWvjJm0nQbJbKC5SbDQwOgNps88vTeKb8ipnDXDDCG5U9rK+JmuQJ5YWZmJte
         za9uXI2geCeK29fjNRIXlJRwimM8HVljSQz62NPcCqMv4aU2z5Yf0uNXk2OhIOYBw1OW
         OvxBCSMwgeDn9fXYiAGT5JBfO/bWCDmuGfiuhiKcswTu1VncqiU4LtWKynWPiH5px6DP
         mIog==
X-Gm-Message-State: APjAAAUOjN6L4vZho73zn2ucQMw2aQ+HvemXVyLHGPHm2hdGj83gjZvZ
        PDqv4NiH7ocyGNaq4Q8JWe5sBilSLTA=
X-Google-Smtp-Source: APXvYqygBVHxolMaQX4WABLgHD4ZJgEc3yTU3QyzNNqaz2sztZBoMKKYa/fzTuLZmPKHBD2tG9Snug==
X-Received: by 2002:a05:600c:34e:: with SMTP id u14mr2301720wmd.110.1569495205426;
        Thu, 26 Sep 2019 03:53:25 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 03:53:24 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/msm/adreno: Add support for Adreno 510 GPU
Date:   Thu, 26 Sep 2019 12:52:56 +0200
Message-Id: <20190926105256.61412-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

The Adreno 510 GPU is a stripped version of the Adreno 5xx,
found in low-end SoCs like 8x56 and 8x76, which has 256K of
GMEM, with no GPMU nor ZAP.
Also, since the Adreno 5xx part of this driver seems to be
developed with high-end Adreno GPUs in mind, and since this
is a lower end one, add a comment making clear which GPUs
which support is not implemented yet is not using the GPMU
related hw init code, so that future developers will not go
crazy with that.

By the way, the lower end Adreno GPUs with no GPMU are:
A505/A506/A510 (usually no ZAP firmware)
A508/A509/A512 (usually with ZAP firmware)

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 73 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |  7 +++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 15 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++
 4 files changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e9c55d1d6c04..e497e08b08f7 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -353,6 +353,9 @@ static int a5xx_me_init(struct msm_gpu *gpu)
 		 * 2D mode 3 draw
 		 */
 		OUT_RING(ring, 0x0000000B);
+	} else if (adreno_is_a510(adreno_gpu)) {
+		/* Workaround for token and syncs */
+		OUT_RING(ring, 0x00000001);
 	} else {
 		/* No workarounds enabled */
 		OUT_RING(ring, 0x00000000);
@@ -568,15 +571,24 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
-	if (adreno_is_a530(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
-	if (adreno_is_a540(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
-	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
-	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
-
-	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, (0x400 << 11 | 0x300 << 22));
+	if (adreno_is_a510(adreno_gpu)) {
+		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
+		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
+		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
+		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
+		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
+			  (0x200 << 11 | 0x200 << 22));
+	} else {
+		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
+		if (adreno_is_a530(adreno_gpu))
+			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
+		if (adreno_is_a540(adreno_gpu))
+			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
+		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
+		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
+		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
+			  (0x400 << 11 | 0x300 << 22));
+	}
 
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
@@ -589,6 +601,19 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* Enable ME/PFP split notification */
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL1, 0xA6FFFFFF);
 
+	/*
+	 *  In A5x, CCU can send context_done event of a particular context to
+	 *  UCHE which ultimately reaches CP even when there is valid
+	 *  transaction of that context inside CCU. This can let CP to program
+	 *  config registers, which will make the "valid transaction" inside
+	 *  CCU to be interpreted differently. This can cause gpu fault. This
+	 *  bug is fixed in latest A510 revision. To enable this bug fix -
+	 *  bit[11] of RB_DBG_ECO_CNTL need to be set to 0, default is 1
+	 *  (disable). For older A510 version this bit is unused.
+	 */
+	if (adreno_is_a510(adreno_gpu))
+		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, (1 << 11), 0);
+
 	/* Enable HWCG */
 	a5xx_set_hwcg(gpu, true);
 
@@ -635,7 +660,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a530(adreno_gpu))
+	if (adreno_is_a530(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
 			ADRENO_PROTECT_RW(0x10000, 0x8000));
 
@@ -679,7 +704,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	a5xx_preempt_hw_init(gpu);
 
-	a5xx_gpmu_ucode_init(gpu);
+	if (!adreno_is_a510(adreno_gpu))
+		a5xx_gpmu_ucode_init(gpu);
 
 	ret = a5xx_ucode_init(gpu);
 	if (ret)
@@ -712,7 +738,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	}
 
 	/*
-	 * Try to load a zap shader into the secure world. If successful
+	 * If the chip that we are using does support loading one, then
+	 * try to load a zap shader into the secure world. If successful
 	 * we can use the CP to switch out of secure mode. If not then we
 	 * have no resource but to try to switch ourselves out manually. If we
 	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
@@ -1066,6 +1093,7 @@ static void a5xx_dump(struct msm_gpu *gpu)
 
 static int a5xx_pm_resume(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
 	/* Turn on the core power */
@@ -1073,6 +1101,15 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	if (adreno_is_a510(adreno_gpu)) {
+		/* Halt the sp_input_clk at HM level */
+		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
+		a5xx_set_hwcg(gpu, true);
+		/* Turn on sp_input_clk at HM level */
+		gpu_rmw(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0xff, 0);
+		return 0;
+	}
+
 	/* Turn the RBCCU domain first to limit the chances of voltage droop */
 	gpu_write(gpu, REG_A5XX_GPMU_RBCCU_POWER_CNTL, 0x778000);
 
@@ -1101,9 +1138,17 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 
 static int a5xx_pm_suspend(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 mask = 0xf;
+
+	/* A510 has 3 XIN ports in VBIF */
+	if (adreno_is_a510(adreno_gpu))
+		mask = 0x7;
+
 	/* Clear the VBIF pipe before shutting down */
-	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, 0xF);
-	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) & 0xF) == 0xF);
+	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, mask);
+	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) &
+				mask) == mask);
 
 	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, 0);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index a3a06db675ba..321a8061fd32 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -297,6 +297,10 @@ int a5xx_power_init(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
+	/* Not all A5xx chips have a GPMU */
+	if (adreno_is_a510(adreno_gpu))
+		return 0;
+
 	/* Set up the limits management */
 	if (adreno_is_a530(adreno_gpu))
 		a530_lm_setup(gpu);
@@ -326,6 +330,9 @@ void a5xx_gpmu_ucode_init(struct msm_gpu *gpu)
 	unsigned int *data, *ptr, *cmds;
 	unsigned int cmds_size;
 
+	if (adreno_is_a510(adreno_gpu))
+		return;
+
 	if (a5xx_gpu->gpmu_bo)
 		return;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 40133a43960c..d0cd6bc0123b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -114,6 +114,21 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
+		.revn = 510,
+		.name = "A510",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = SZ_256K,
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.init = a5xx_gpu_init,
 	}, {
 		.rev = ADRENO_REV(5, 3, 0, 2),
 		.revn = 530,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c7441fb8313e..9f93916c8910 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -206,6 +206,11 @@ static inline int adreno_is_a430(struct adreno_gpu *gpu)
        return gpu->revn == 430;
 }
 
+static inline int adreno_is_a510(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 510;
+}
+
 static inline int adreno_is_a530(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 530;
-- 
2.21.0

