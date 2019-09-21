Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6DB6B9D47
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407447AbfIUKEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:04:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51274 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407333AbfIUKEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:04:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id 7so4925744wme.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8/BDI92jpkaa4ryYznN/YwsABWh0qF2Ab9kswszJkU=;
        b=fupBjAIDtQgDh7PPfdJuBT74xwoQSvYYJL9NgVYGAIDEr/musHLogUMxq65e78tfm4
         85IPgmMxrzkk0KKUx/t+tSI98DwtAiIUF6giCLndol158jrGygMHhUThXmiD3Ijoe2Fu
         G198s+4RJc5tANhzV+w9DkVCGAdDoIRyjQRB5wz6+oV20d26Q0aJuLhj/+CTj016dybx
         R5QtP8Lqe2Ap9dQLBM0dt7FbZhBaFOXdumAzk3+I/81vpZ5ggWZvDm0Wqmt6KL28XQ7v
         WSYEYSpdaO8BXCLQYMc83Qic93oODOZ5D7+uXjjObz0oX5F3HwHTs5dZSe2uHYcITzs4
         oejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8/BDI92jpkaa4ryYznN/YwsABWh0qF2Ab9kswszJkU=;
        b=acrkhcllsRwcyRdZSwbsanov4EAE73QVs9iViRxBNnHyPCgO77pRA7LaZTuIyMQQwp
         X+82Wz2RuGnMupX67r1VnlM3X2VSJHnw/o5s5w8nMths2wCUMjBWYlt5hCyafnbDEZ4m
         GgHRt8nzQgvfQSc1sTJHpvGWcJsIJ/PrYSystVPTSLZX6mDbxIWGnqucEOJ5SdcU8+Da
         f82I3NAsNfdIBIPF6VuySPCBlrsSw4aq5Tq970uqc0oWjXzNz8xxK2cxKioYXTvbuiOc
         IYH4rPScqWnz53qg5ZTeaJ+mkEX+LaACbOmCSMLJ/a78hHPBHa2raRJq/rC2M46jDmZ1
         r86g==
X-Gm-Message-State: APjAAAWDmy62ijVGCjTao66G6boNFiU1mTzR4FXakkltxEGaDLB61KnX
        swyfOjoz+5x2fkL+GRhgAOZG8Qg1Bs0=
X-Google-Smtp-Source: APXvYqwzhtQsP1hcb6xTXYlxqTtXUx/3mcR3KQwu5f44LlI7nw/SJ4s1F5MJRfQUMliVZqPaF3Y1+w==
X-Received: by 2002:a1c:cf05:: with SMTP id f5mr6606907wmg.131.1569060288233;
        Sat, 21 Sep 2019 03:04:48 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:04:47 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm/adreno: Add support for Adreno 510 GPU
Date:   Sat, 21 Sep 2019 12:04:39 +0200
Message-Id: <20190921100439.64402-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921100439.64402-1-kholk11@gmail.com>
References: <20190921100439.64402-1-kholk11@gmail.com>
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
A505/A506/A510 (no ZAP firmware)
A508/A509/A512 (with ZAP firmware)

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 87 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |  7 ++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 15 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++
 4 files changed, 102 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e9c55d1d6c04..c3814a65ba2d 100644
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
@@ -502,6 +505,8 @@ static int a5xx_zap_shader_init(struct msm_gpu *gpu)
 static int a5xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 meq_thresh, merciu_sz, roq_thresh_1, roq_thresh_2, eco_cntl;
+	u32 cur_eco_cnt;
 	int ret;
 
 	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
@@ -568,15 +573,31 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
-	if (adreno_is_a530(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
+	/* Values for the majority of the models */
+	meq_thresh = 0x40;
+	merciu_sz = 0x40;
+	roq_thresh_2 = 0x80000060;
+	roq_thresh_1 = 0x40201B16;
+	eco_cntl = (0x400 << 11 | 0x300 << 22);
+
+	/* model specific overrides */
+	if (adreno_is_a510(adreno_gpu)) {
+		meq_thresh = 0x20;
+		merciu_sz = 0x20;
+		roq_thresh_2 = 0x40000030;
+		roq_thresh_1 = 0x20100D0A;
+		eco_cntl = (0x200 << 11 | 0x200 << 22);
+	}
+
 	if (adreno_is_a540(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
-	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
-	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
+		merciu_sz = 0x400;
+
+	gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, meq_thresh);
+	gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, merciu_sz);
+	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, roq_thresh_2);
+	gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, roq_thresh_1);
 
-	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, (0x400 << 11 | 0x300 << 22));
+	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, eco_cntl);
 
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
@@ -589,6 +610,22 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
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
+	if (adreno_is_a510(adreno_gpu)) {
+		cur_eco_cnt = gpu_read(gpu, REG_A5XX_RB_DBG_ECO_CNTL);
+		cur_eco_cnt &= ~(1 << 11);
+		gpu_write(gpu, REG_A5XX_RB_DBG_ECO_CNTL, cur_eco_cnt);
+	}
+
 	/* Enable HWCG */
 	a5xx_set_hwcg(gpu, true);
 
@@ -635,7 +672,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a530(adreno_gpu))
+	if (adreno_is_a530(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
 			ADRENO_PROTECT_RW(0x10000, 0x8000));
 
@@ -679,7 +716,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	a5xx_preempt_hw_init(gpu);
 
-	a5xx_gpmu_ucode_init(gpu);
+	if (!adreno_is_a510(adreno_gpu))
+		a5xx_gpmu_ucode_init(gpu);
 
 	ret = a5xx_ucode_init(gpu);
 	if (ret)
@@ -712,12 +750,18 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	}
 
 	/*
-	 * Try to load a zap shader into the secure world. If successful
+	 * If the chip that we are using does support loading one, then
+	 * try to load a zap shader into the secure world. If successful
 	 * we can use the CP to switch out of secure mode. If not then we
 	 * have no resource but to try to switch ourselves out manually. If we
 	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
 	 * be blocked and a permissions violation will soon follow.
 	 */
+	if (adreno_is_a510(adreno_gpu)) {
+		gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
+		goto skip_zap;
+	}
+
 	ret = a5xx_zap_shader_init(gpu);
 	if (!ret) {
 		OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
@@ -733,6 +777,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
 	}
 
+skip_zap:
 	/* Last step - yield the ringbuffer */
 	a5xx_preempt_start(gpu);
 
@@ -1066,6 +1111,7 @@ static void a5xx_dump(struct msm_gpu *gpu)
 
 static int a5xx_pm_resume(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
 	/* Turn on the core power */
@@ -1073,6 +1119,15 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	if (adreno_is_a510(adreno_gpu)) {
+		/* Halt the sp_input_clk at HM level */
+		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
+		a5xx_set_hwcg(gpu, true);
+		/* Turn on sp_input_clk at HM level */
+		gpu_rmw(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0xFF, 0);
+		return 0;
+	}
+
 	/* Turn the RBCCU domain first to limit the chances of voltage droop */
 	gpu_write(gpu, REG_A5XX_GPMU_RBCCU_POWER_CNTL, 0x778000);
 
@@ -1101,9 +1156,17 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 
 static int a5xx_pm_suspend(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 xin_halt_ctrl0_mask = 0xF;
+
+	/* A510 has 3 XIN ports in VBIF */
+	if (adreno_is_a510(adreno_gpu))
+		xin_halt_ctrl0_mask = 0x7;
+
 	/* Clear the VBIF pipe before shutting down */
-	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, 0xF);
-	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) & 0xF) == 0xF);
+	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, xin_halt_ctrl0_mask);
+	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) &
+				xin_halt_ctrl0_mask) == xin_halt_ctrl0_mask);
 
 	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, 0);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index a3a06db675ba..58c374664c7f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -297,6 +297,10 @@ int a5xx_power_init(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
+	/* A505/A506/A510 (no ZAP) and A508/A509/A512 (w/ZAP) have no GPMU */
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

