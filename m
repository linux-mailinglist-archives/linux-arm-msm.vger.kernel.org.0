Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AF821C085
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgGJXFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbgGJXFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:05:41 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4221C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:05:40 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e12so5767718qtr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X3Q9PjvIkiub9SDi5ST21u3dYQ6wpXEFkUrvNbu49NQ=;
        b=sZqxVZ16XMXWSCGcpa2Y6WchTWrh88KveDtmdgvHWNo/ZDhj6dNnCgmkOdTMkgUjWk
         2rc5Q4ADeYDNF+TaULXttJpzWZBkZes80QaGLhiiwclpH9TAb9IfZqNPPgQgIj/O/BIM
         z7dqwys7OK/G3DLUOXgPNmt4/WedT6v6RcI0HvEA/pHhmBq/lmIJYZ0hsmlWK9LjOj0p
         U07y+VLxkFK4EqNQKEv9fgGVdf1AY0Pb6Y6fCo6HAGr3zAjMQe09qXiBJ6AJrAA6nYDA
         a0C/K27+GUD5jiPvgnDJfr/bzUXS5x8jtJVcITNmg9ciBIysqDRBrRrgB+gVythXvPLo
         5/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X3Q9PjvIkiub9SDi5ST21u3dYQ6wpXEFkUrvNbu49NQ=;
        b=qOPYVOmBPBAnVgiSSoo7NF4SNpSFlwdRnlZqv3fR1HTdpH5HAUjfycXDFWZdHRMEPV
         zqMWsiUs5ERz2Fz6WGV7JGhE3vCIfqVMx5/g71R9sI+i/a2SQ/TC2l5Ke9AzQpZczSgY
         FcNxHSgCGQd/zb/2Bd/SWyg3QPTB98P+RU9gF+7Hcz0q0Yw5AIgmCiH/MxLOsgyK1IWt
         95VEwhFC76q6O1Fvn2s9pkLhZJTN5b2pYBORNFNRtcPD2v94p116s0OzyQi5m+nZATuo
         Bm/c34ZxLqkPjsvoaD8lPR+tTu9N4kmZFeIVflCI8xcwLZxo+jYhLEh4RDJqcvWht8NM
         M8bA==
X-Gm-Message-State: AOAM5310QE3weZrVaLiRXm3/0BP1lLa1WvB1A/Rfk53SMxezfw21nOhE
        DUFONwQR9Dhik0s1VwOLzIkRwg==
X-Google-Smtp-Source: ABdhPJwvl2XF+qzMnXqNtckjWjGvpOzQ6OywoNC8NIABSElWhTNO0oTNYwMnDbP5CyzvxMziz4WXPA==
X-Received: by 2002:ac8:33d7:: with SMTP id d23mr73606921qtb.204.1594422340007;
        Fri, 10 Jul 2020 16:05:40 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id l1sm9513541qtk.18.2020.07.10.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:05:39 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm/a6xx: add A640/A650 hwcg
Date:   Fri, 10 Jul 2020 19:04:10 -0400
Message-Id: <20200710230413.2944-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200710230413.2944-1-jonathan@marek.ca>
References: <20200710230413.2944-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize hardware clock-gating registers on A640 and A650 GPUs.

At least for A650, this solves some performance issues.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   8 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 117 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   2 +-
 4 files changed, 125 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 47840b73cdda..f0498faf7d0b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1996,6 +1996,14 @@ static inline uint32_t A6XX_CP_PROTECT_REG_MASK_LEN(uint32_t val)
 
 #define REG_A6XX_RBBM_CLOCK_DELAY_HLSQ				0x0000011c
 
+#define REG_A6XX_RBBM_CLOCK_HYST_HLSQ				0x0000011d
+
+#define REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE			0x00000120
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE			0x00000121
+
+#define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
+
 #define REG_A6XX_DBGC_CFG_DBGBUS_SEL_A				0x00000600
 
 #define REG_A6XX_DBGC_CFG_DBGBUS_SEL_B				0x00000601
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ddcbc57ac25d..726fc3d3c7ba 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -260,6 +260,112 @@ const struct adreno_reglist a630_hwcg[] = {
 	{},
 };
 
+const struct adreno_reglist a640_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05222022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
+};
+
+const struct adreno_reglist a650_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
+};
+
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -267,15 +373,20 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
-	u32 val;
+	u32 val, clock_cntl_on;
 
 	if (!adreno_gpu->info->hwcg)
 		return;
 
+	if (adreno_is_a630(adreno_gpu))
+		clock_cntl_on = 0x8aa8aa02;
+	else
+		clock_cntl_on = 0x8aa8aa82;
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
-	if ((!state && !val) || (state && (val == 0x8aa8aa02)))
+	if ((!state && !val) || (state && (val == clock_cntl_on)))
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
@@ -287,7 +398,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	/* Enable SP clock */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
-	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? 0x8aa8aa02 : 0);
+	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 97996e7fc668..4e84f3c76f4f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -213,6 +213,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
+		.hwcg = a640_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
 		.revn = 650,
@@ -225,6 +226,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
+		.hwcg = a650_hwcg,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 426cabd374bb..99bb468f5f24 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -73,7 +73,7 @@ struct adreno_reglist {
 	u32 value;
 };
 
-extern const struct adreno_reglist a630_hwcg[];
+extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[];
 
 struct adreno_info {
 	struct adreno_rev rev;
-- 
2.26.1

