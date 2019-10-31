Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61335EADC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfJaKoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:20 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46249 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbfJaKoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:19 -0400
Received: by mail-wr1-f67.google.com with SMTP id n15so5627908wrw.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M60UiEhUmmNWU8RgBGE4zx++F2XO1/RbSWEAXRbbk3s=;
        b=JwSm0nQYOhWEqmv0HXC2IrlBHHkn9Cu6PpGseYmcyKW6gSi7AinI9Wgz02hxkSbx73
         YVJD9yEH0f8/5WXMoUytmMA3CM2NKQkApbVCeW9b7ofsismcBzPZ17pG0+MB/4nSHtzy
         IJ+xFsZpABlj79nQCwRfWKIpZSvt1u7aRcrwBf3pEXb61ORL/sKkTJa8IatSiVY7JW7L
         +0cu2PCGC1IyNzOYnSxILsfGl26QK9sqlIHia8qAmG/6a+Ogxu33zaqsk4l3UAtH3LVN
         b8EHnjlqimMYxNoCQmlX2f8vOzqslJJQsNqhOGDionnMUvUeyoF09t6pyv9J6vqrZ00z
         t+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M60UiEhUmmNWU8RgBGE4zx++F2XO1/RbSWEAXRbbk3s=;
        b=IuCrBVzXdYwsK4v+OgLyCIniAEIcsppcGvNGHxi36JiAEFDz0cUEe4l8NRJckJonet
         AziwnBDR0VoKWrQ+K7HD4H7On/RRjXnqJeVuRwzg/Lx3d0n4IcOHbXJ4XeWMhTH6H7by
         JAbleHZMzf940ORErbduzVOkxPZ9FHO5dJEmmSdH7HyRNKZ3TwzwJmjLNKwcuFE3Zvii
         kIGvIaH/8xAnTB60dLESXG1cFlcbSc+xnh30vyJ7S5ASeeIwaemwfgbHUX1FC9hCv9G6
         NBhMV36qBJVipG1jlunsEfVB239BoWGgPx/iWt5qPt954VxRDxqAeurwIjXqqMYBm6mT
         kTtw==
X-Gm-Message-State: APjAAAUPnzW4bFvQut8zNncm8nXmGOEHX62vql9bayKIjL6QPrCxgPc1
        GRj0+9U+KqIipAaZGG/L4GQTBx8R7ns=
X-Google-Smtp-Source: APXvYqwDteIDzKxvuXwHeKYZ+t5RDvepRUcPppCo19Lxh5ISq8LLiUmTvMXp6JXaUJofjvqgCUKe/Q==
X-Received: by 2002:adf:e903:: with SMTP id f3mr5124513wrm.121.1572518655958;
        Thu, 31 Oct 2019 03:44:15 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:15 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/msm/adreno: Add support for Adreno 510 GPU
Date:   Thu, 31 Oct 2019 11:44:02 +0100
Message-Id: <20191031104402.31813-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

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

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 73 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |  7 +++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 15 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++
 4 files changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 7fdc9e2bcaac..b02e2042547f 100644
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
index 0888e0df660d..fbbdf86504f5 100644
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
index d225a8a92e58..e71a7570ef72 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -212,6 +212,11 @@ static inline int adreno_is_a430(struct adreno_gpu *gpu)
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

