Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52F502CD18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 19:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfE1RGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 13:06:18 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34638 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfE1RGS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 13:06:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id w7so8597729plz.1;
        Tue, 28 May 2019 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Ydxy9Vm+UUHZwMpZmWqub2N/J5c96RxBnZTvV04Gl14=;
        b=VBFGbTRYbpvpsQaJMola+p9hgodWQnO9dpwCJV2aLSnit30517prjMQENqHtIGwKec
         zRGgYvrntvKFYeGj/tUTzOZkfL1d7Uo88EXsbqAj079cTcH8b93anIpfvXTZQ5HA25l2
         01vONSaBrJxnZK+4T1fdg7Uq9UQl6NhvfZP3CtQqyCKI+MelYu6dPka3tnZDbjeopYde
         RsWreMdTPI6FzwBVPBhtdzGMDSp84kAW0FFmB0KXtqRZ+QA7FVYPnNavB6Itmc/rV8Ci
         H5E45HlUri3gHBe/J1/QDffv01jUUBNlFFzmlnecr0NHnARtwmmBYMP5W7EGUUMGFrij
         yOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ydxy9Vm+UUHZwMpZmWqub2N/J5c96RxBnZTvV04Gl14=;
        b=l8gXv8RmBX+REWXuO5rt0DmWeD/NEqBXW2EJZ4QIEZ1sin0BcLV8YlfKoIivvVXRYS
         pYYJtLOisFoNLHXwVG5xE99ORTAhzSzEArDfWYvtZgs3wlGd21fR4mQ+muEPn/2xm0G4
         mgDsvNqhx0LiEh/sbTNDh7ivk4kHMirSkFliq638N6YYvzzEwjfUZVpZ1WxkVdbEYlqJ
         YaRkjpyVU/WsHnyFQcsMjQE07q4sc/mjgtqcjo+6V5jZATqBgk/HAIfOatq+N59mLLyw
         vw98dG+Y0u7hCMjZMa/yhpnb7F6Q3zlt8HCaA6G4Gvx4xKdiTqEYEsRmKUrZmczOrbAe
         mHJw==
X-Gm-Message-State: APjAAAUwprTwnhwDrCjcz1ajAQBpRepsMQ/h6Z3lbfnA4WzkdmOsATpe
        WRdO4E+7MusOQ1HfOamGP20=
X-Google-Smtp-Source: APXvYqxls+cn2sXjlHyn6D8iVjW+UOFHhjpxNdLtDQqvOhi5/kU+v320BL5PCh326Dl2suuvmejkKA==
X-Received: by 2002:a17:902:e65:: with SMTP id 92mr19595305plw.13.1559063177629;
        Tue, 28 May 2019 10:06:17 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id q6sm11237483pfg.7.2019.05.28.10.06.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 10:06:17 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jcrouse@codeaurora.org
Cc:     marc.w.gonzalez@free.fr, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm/adreno: Add A540 support
Date:   Tue, 28 May 2019 10:06:12 -0700
Message-Id: <20190528170612.39003-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The A540 is a derivative of the A530, and is found in the MSM8998 SoC.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 22 +++++++
 drivers/gpu/drm/msm/adreno/a5xx_power.c    | 76 +++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++
 4 files changed, 119 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e5fcefa49f19..7ca8fde22fd8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -318,12 +318,19 @@ static const struct {
 
 void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(a5xx_hwcg); i++)
 		gpu_write(gpu, a5xx_hwcg[i].offset,
 			state ? a5xx_hwcg[i].value : 0);
 
+	if (adreno_is_a540(adreno_gpu)) {
+		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_HYST_GPMU, 0x00000222);
+		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_DELAY_GPMU, 0x00000770);
+		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_HYST_GPMU, 0x00000004);
+	}
+
 	gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, state ? 0xAAA8AA00 : 0);
 	gpu_write(gpu, REG_A5XX_RBBM_ISDB_CNT, state ? 0x182 : 0x180);
 }
@@ -507,6 +514,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
 
+	if (adreno_is_a540(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
+
 	/* Make all blocks contribute to the GPU BUSY perf counter */
 	gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xFFFFFFFF);
 
@@ -592,6 +602,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* Set the highest bank bit */
 	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, 2 << 7);
 	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, 2 << 1);
+	if (adreno_is_a540(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, 2);
 
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
@@ -642,6 +654,16 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
 	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
+	/*
+	 * VPC corner case with local memory load kill leads to corrupt
+	 * internal state. Normal Disable does not work for all a5x chips.
+	 * So do the following setting to disable it.
+	 */
+	if (adreno_gpu->info->quirks & ADRENO_QUIRK_LMLOADKILL_DISABLE) {
+		gpu_rmw(gpu, REG_A5XX_VPC_DBG_ECO_CNTL, 0, BIT(23));
+		gpu_rmw(gpu, 0xE04, BIT(18), 0); /*REG_A5XX_HLSQ_DBG_ECO_CNTL*/
+	}
+
 	ret = adreno_hw_init(gpu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index 70e65c94e525..5cb325c6eb8f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -32,6 +32,18 @@
 #define AGC_POWER_CONFIG_PRODUCTION_ID 1
 #define AGC_INIT_MSG_VALUE 0xBABEFACE
 
+/* AGC_LM_CONFIG (A540+) */
+#define AGC_LM_CONFIG (136/4)
+#define AGC_LM_CONFIG_GPU_VERSION_SHIFT 17
+#define AGC_LM_CONFIG_ENABLE_GPMU_ADAPTIVE 1
+#define AGC_LM_CONFIG_THROTTLE_DISABLE (2 << 8)
+#define AGC_LM_CONFIG_ISENSE_ENABLE (1 << 4)
+#define AGC_LM_CONFIG_ENABLE_ERROR (3 << 4)
+#define AGC_LM_CONFIG_LLM_ENABLED (1 << 16)
+#define AGC_LM_CONFIG_BCL_DISABLED (1 << 24)
+
+#define AGC_LEVEL_CONFIG (140/4)
+
 static struct {
 	uint32_t reg;
 	uint32_t value;
@@ -116,7 +128,7 @@ static inline uint32_t _get_mvolts(struct msm_gpu *gpu, uint32_t freq)
 }
 
 /* Setup thermal limit management */
-static void a5xx_lm_setup(struct msm_gpu *gpu)
+static void a530_lm_setup(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
@@ -165,6 +177,45 @@ static void a5xx_lm_setup(struct msm_gpu *gpu)
 	gpu_write(gpu, AGC_INIT_MSG_MAGIC, AGC_INIT_MSG_VALUE);
 }
 
+#define PAYLOAD_SIZE(_size) ((_size) * sizeof(u32))
+#define LM_DCVS_LIMIT 1
+#define LEVEL_CONFIG ~(0x303)
+
+static void a540_lm_setup(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 config;
+
+	/* The battery current limiter isn't enabled for A540 */
+	config = AGC_LM_CONFIG_BCL_DISABLED;
+	config |= adreno_gpu->rev.patchid << AGC_LM_CONFIG_GPU_VERSION_SHIFT;
+
+	/* For now disable GPMU side throttling */
+	config |= AGC_LM_CONFIG_THROTTLE_DISABLE;
+
+	/* Until we get clock scaling 0 is always the active power level */
+	gpu_write(gpu, REG_A5XX_GPMU_GPMU_VOLTAGE, 0x80000000 | 0);
+
+	/* Fixed at 6000 for now */
+	gpu_write(gpu, REG_A5XX_GPMU_GPMU_PWR_THRESHOLD, 0x80000000 | 6000);
+
+	gpu_write(gpu, AGC_MSG_STATE, 0x80000001);
+	gpu_write(gpu, AGC_MSG_COMMAND, AGC_POWER_CONFIG_PRODUCTION_ID);
+
+	gpu_write(gpu, AGC_MSG_PAYLOAD(0), 5448); //magic number?
+	gpu_write(gpu, AGC_MSG_PAYLOAD(1), 1);
+
+	gpu_write(gpu, AGC_MSG_PAYLOAD(2), _get_mvolts(gpu, gpu->fast_rate));
+	gpu_write(gpu, AGC_MSG_PAYLOAD(3), gpu->fast_rate / 1000000);
+
+	gpu_write(gpu, AGC_MSG_PAYLOAD(AGC_LM_CONFIG), config);
+	gpu_write(gpu, AGC_MSG_PAYLOAD(AGC_LEVEL_CONFIG), LEVEL_CONFIG);
+	gpu_write(gpu, AGC_MSG_PAYLOAD_SIZE,
+	PAYLOAD_SIZE(AGC_LEVEL_CONFIG + 1));
+
+	gpu_write(gpu, AGC_INIT_MSG_MAGIC, AGC_INIT_MSG_VALUE);
+}
+
 /* Enable SP/TP cpower collapse */
 static void a5xx_pc_init(struct msm_gpu *gpu)
 {
@@ -206,7 +257,8 @@ static int a5xx_gpmu_init(struct msm_gpu *gpu)
 		return -EINVAL;
 	}
 
-	gpu_write(gpu, REG_A5XX_GPMU_WFI_CONFIG, 0x4014);
+	if (adreno_is_a530(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_GPMU_WFI_CONFIG, 0x4014);
 
 	/* Kick off the GPMU */
 	gpu_write(gpu, REG_A5XX_GPMU_CM3_SYSRESET, 0x0);
@@ -220,12 +272,26 @@ static int a5xx_gpmu_init(struct msm_gpu *gpu)
 		DRM_ERROR("%s: GPMU firmware initialization timed out\n",
 			gpu->name);
 
+	if (!adreno_is_a530(adreno_gpu)) {
+		u32 val = gpu_read(gpu, REG_A5XX_GPMU_GENERAL_1);
+
+		if (val)
+			DRM_ERROR("%s: GPMU firmware initialization failed: %d\n",
+				  gpu->name, val);
+	}
+
 	return 0;
 }
 
 /* Enable limits management */
 static void a5xx_lm_enable(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	/* This init sequence only applies to A530 */
+	if (!adreno_is_a530(adreno_gpu))
+		return;
+
 	gpu_write(gpu, REG_A5XX_GDPM_INT_MASK, 0x0);
 	gpu_write(gpu, REG_A5XX_GDPM_INT_EN, 0x0A);
 	gpu_write(gpu, REG_A5XX_GPMU_GPMU_VOLTAGE_INTR_EN_MASK, 0x01);
@@ -237,10 +303,14 @@ static void a5xx_lm_enable(struct msm_gpu *gpu)
 
 int a5xx_power_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
 	/* Set up the limits management */
-	a5xx_lm_setup(gpu);
+	if (adreno_is_a530(adreno_gpu))
+		a530_lm_setup(gpu);
+	else
+		a540_lm_setup(gpu);
 
 	/* Set up SP/TP power collpase */
 	a5xx_pc_init(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index b907245d3d96..cb7dadaf1669 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -144,6 +144,24 @@ static const struct adreno_info gpulist[] = {
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
+	}, {
+		.rev = ADRENO_REV(5, 4, 0, 2),
+		.revn = 540,
+		.name = "A540",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+			[ADRENO_FW_GPMU] = "a540_gpmu.fw2",
+		},
+		.gmem = SZ_1M,
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a540_zap.mdt",
 	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
 		.revn = 630,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 0925606ec9b5..d67c1a69c49a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -61,6 +61,7 @@ enum {
 enum adreno_quirks {
 	ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
 	ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
+	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
 };
 
 struct adreno_rev {
@@ -221,6 +222,11 @@ static inline int adreno_is_a530(struct adreno_gpu *gpu)
 	return gpu->revn == 530;
 }
 
+static inline int adreno_is_a540(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 540;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
-- 
2.17.1

