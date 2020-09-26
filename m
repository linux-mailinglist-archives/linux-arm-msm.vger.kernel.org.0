Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D876727991A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbgIZMwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgIZMv7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:51:59 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F60EC0613D3;
        Sat, 26 Sep 2020 05:51:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z4so6880593wrr.4;
        Sat, 26 Sep 2020 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WE5XGVBIi9oNeBynif1y0/HFQ4/jZmofzj0xKWnVuuY=;
        b=jg+IYhvvRblYaZKOehxNYSGyoCDRU9F7hlpq6IpBuq4C8XFbplSjHmXhQAhEE0IRLn
         0K2KfVsby9mm5gX+KmuMTHAu/OmL+d+CgzYyDMzEpb51gaSC8zUUj7BO9kb6fBw+ysgw
         bSRASfzbW4S+HpW8ebHZ5TIBikipMbytXabXTbmsqat6nxpoJo7Li496e4pVyUFwyXGS
         ez5vsmGz6Qfxz0DRkSTaEdPJVcepCsKoXnKY2KAV2YjiUukoxpC49o0yQDMFj5n7gb9N
         xQK8J9KYbAjNG3Fi7y3S8X7Z2blVKwbZkdzbB3rT5Hiz8GHBUxVtbY9KbZTYP7ssrCVy
         hW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WE5XGVBIi9oNeBynif1y0/HFQ4/jZmofzj0xKWnVuuY=;
        b=nk2ZEE2rAYyLsrX89kTG8kp3Gn3EEZg8H5pjVJrIbNkRulXUxGEMVluRcgr1zO81Kz
         iKodqHIoxuCB9xYft/m8F95yQ3yUDD4du4k08Oz5CknC2cTxvOv00icwdxZIBAGqe8nC
         NEw7Asy2w22qP4/tlHSxB8jsVlDUN0kN1fpGzCnVpT/W+GQFo/fWbjvNubgyZ2gvBavG
         gusKBRuGNYOJ0T3Z4Z1r4FTl8UtfFp/G3v7dAWrm3bP6LHWt2SHUvz51pxLpJApNXhFF
         qFEoi2NgGDpzot0RM2+hgrxMsDHjNRWbvR2kL2mL9KmOBv+yLTEI5E6nE0Fncfjs/dUq
         W+NQ==
X-Gm-Message-State: AOAM533A2f8X/L7OI8YibulOW8pJxeoYCarJACqh42WaMCpDHoXo1otb
        iUKFlAclykZPVSUhhM4MKGk=
X-Google-Smtp-Source: ABdhPJz+d7b1BRGA4vpMRrcePcE7ErbVO9NL2hbvja3QBMyt5efmUpfqjQ0hJwZyV//lRrpQtMOuAw==
X-Received: by 2002:adf:f707:: with SMTP id r7mr9639304wrp.413.1601124717130;
        Sat, 26 Sep 2020 05:51:57 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:51:56 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
Date:   Sat, 26 Sep 2020 14:51:42 +0200
Message-Id: <20200926125146.12859-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The Adreno 508/509/512 GPUs are stripped versions of the Adreno
5xx found in the mid-end SoCs such as SDM630, SDM636, SDM660 and
SDA variants; these SoCs are usually provided with ZAP firmwares,
but they have no available GPMU.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 172 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  60 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  15 ++
 4 files changed, 231 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index f98f0844838c..9bcbf6cd5a28 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -212,7 +212,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	a5xx_preempt_trigger(gpu);
 }
 
-static const struct {
+static const struct adreno_five_hwcg_regs {
 	u32 offset;
 	u32 value;
 } a5xx_hwcg[] = {
@@ -308,16 +308,124 @@ static const struct {
 	{REG_A5XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
 	{REG_A5XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
 	{REG_A5XX_RBBM_CLOCK_DELAY_VFD, 0x00002222}
+}, a50x_hwcg[] = {
+	{REG_A5XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A5XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_TP0, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST3_TP0, 0x00007777},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY3_TP0, 0x00001111},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_HYST_UCHE, 0x00FFFFF4},
+	{REG_A5XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RB0, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_CCU0, 0x00022220},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RAC, 0x05522222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RAC, 0x00505555},
+	{REG_A5XX_RBBM_CLOCK_HYST_RB_CCU0, 0x04040404},
+	{REG_A5XX_RBBM_CLOCK_HYST_RAC, 0x07444044},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RB_CCU_L1_0, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RAC, 0x00010011},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_GPC, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A5XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A5XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+}, a512_hwcg[] = {
+	{REG_A5XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_SP1, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_SP1, 0x02222220},
+	{REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A5XX_RBBM_CLOCK_HYST_SP1, 0x0000F3CF},
+	{REG_A5XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A5XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TP1, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_TP0, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_TP1, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST_TP1, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST3_TP0, 0x00007777},
+	{REG_A5XX_RBBM_CLOCK_HYST3_TP1, 0x00007777},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY3_TP0, 0x00001111},
+	{REG_A5XX_RBBM_CLOCK_DELAY3_TP1, 0x00001111},
+	{REG_A5XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_HYST_UCHE, 0x00444444},
+	{REG_A5XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RB1, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RB0, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RB1, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_CCU0, 0x00022220},
+	{REG_A5XX_RBBM_CLOCK_CNTL_CCU1, 0x00022220},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RAC, 0x05522222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RAC, 0x00505555},
+	{REG_A5XX_RBBM_CLOCK_HYST_RB_CCU0, 0x04040404},
+	{REG_A5XX_RBBM_CLOCK_HYST_RB_CCU1, 0x04040404},
+	{REG_A5XX_RBBM_CLOCK_HYST_RAC, 0x07444044},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RB_CCU_L1_0, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RB_CCU_L1_1, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RAC, 0x00010011},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_GPC, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A5XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A5XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
 };
 
 void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	unsigned int i;
+	const struct adreno_five_hwcg_regs *regs;
+	unsigned int i, sz;
+
+	if (adreno_is_a508(adreno_gpu)) {
+		regs = a50x_hwcg;
+		sz = ARRAY_SIZE(a50x_hwcg);
+	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
+		regs = a512_hwcg;
+		sz = ARRAY_SIZE(a512_hwcg);
+	} else {
+		regs = a5xx_hwcg;
+		sz = ARRAY_SIZE(a5xx_hwcg);
+	}
 
-	for (i = 0; i < ARRAY_SIZE(a5xx_hwcg); i++)
-		gpu_write(gpu, a5xx_hwcg[i].offset,
-			state ? a5xx_hwcg[i].value : 0);
+	for (i = 0; i < sz; i++)
+		gpu_write(gpu, regs[i].offset,
+			  state ? regs[i].value : 0);
 
 	if (adreno_is_a540(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_DELAY_GPMU, state ? 0x00000770 : 0);
@@ -506,11 +614,13 @@ static int a5xx_zap_shader_init(struct msm_gpu *gpu)
 static int a5xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 bit;
 	int ret;
 
 	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
 
-	if (adreno_is_a540(adreno_gpu))
+	if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
+	    adreno_is_a540(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
 
 	/* Make all blocks contribute to the GPU BUSY perf counter */
@@ -572,22 +682,29 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	if (adreno_is_a510(adreno_gpu)) {
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
-		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
+		if (adreno_is_a508(adreno_gpu))
+			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
+		else
+			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
 	} else {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
 		if (adreno_is_a530(adreno_gpu))
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
-		if (adreno_is_a540(adreno_gpu))
+		else
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
 	}
 
-	if (adreno_is_a510(adreno_gpu))
+	if (adreno_is_a508(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
+			  (0x100 << 11 | 0x100 << 22));
+	else if (adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
+		 adreno_is_a512(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x200 << 11 | 0x200 << 22));
 	else
@@ -597,6 +714,14 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
 
+	/*
+	 * Disable the RB sampler datapath DP2 clock gating optimization
+	 * for 1-SP GPUs, as it is enabled by default.
+	 */
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	    adreno_is_a512(adreno_gpu))
+		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
+
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
@@ -622,10 +747,17 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
 	/* Set the highest bank bit */
-	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, 2 << 7);
-	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, 2 << 1);
 	if (adreno_is_a540(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, 2);
+		bit = 2;
+	else
+		bit = 1;
+
+	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, bit << 7);
+	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, bit << 1);
+
+	if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
+	    adreno_is_a540(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, bit);
 
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
@@ -662,7 +794,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a530(adreno_gpu) || adreno_is_a510(adreno_gpu))
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	    adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
+	    adreno_is_a530(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
 			ADRENO_PROTECT_RW(0x10000, 0x8000));
 
@@ -704,7 +838,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (!adreno_is_a510(adreno_gpu))
+	if (!(adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	      adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu)))
 		a5xx_gpmu_ucode_init(gpu);
 
 	ret = a5xx_ucode_init(gpu);
@@ -1117,7 +1252,8 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (adreno_is_a510(adreno_gpu)) {
+	/* Adreno 508, 509, 510, 512 needs manual RBBM sus/res control */
+	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
 		a5xx_set_hwcg(gpu, true);
@@ -1157,8 +1293,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	u32 mask = 0xf;
 
-	/* A510 has 3 XIN ports in VBIF */
-	if (adreno_is_a510(adreno_gpu))
+	/* A508, A510 have 3 XIN ports in VBIF */
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
 	/* Clear the VBIF pipe before shutting down */
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index 321a8061fd32..31c45ae6875e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -298,7 +298,7 @@ int a5xx_power_init(struct msm_gpu *gpu)
 	int ret;
 
 	/* Not all A5xx chips have a GPMU */
-	if (adreno_is_a510(adreno_gpu))
+	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu)))
 		return 0;
 
 	/* Set up the limits management */
@@ -330,7 +330,7 @@ void a5xx_gpmu_ucode_init(struct msm_gpu *gpu)
 	unsigned int *data, *ptr, *cmds;
 	unsigned int cmds_size;
 
-	if (adreno_is_a510(adreno_gpu))
+	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu)))
 		return;
 
 	if (a5xx_gpu->gpmu_bo)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9eeb46bf2a5d..40465b4e9da8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -129,6 +129,41 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
+		.revn = 508,
+		.name = "A508",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a508_zap.mdt",
+	}, {
+		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
+		.revn = 509,
+		.name = "A509",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_256K + SZ_16K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		/* Adreno 509 uses the same ZAP as 512 */
+		.zapfw = "a512_zap.mdt",
 	}, {
 		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
 		.revn = 510,
@@ -144,6 +179,23 @@ static const struct adreno_info gpulist[] = {
 		 */
 		.inactive_period = 250,
 		.init = a5xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(5, 1, 2, ANY_ID),
+		.revn = 512,
+		.name = "A512",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_256K + SZ_16K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a512_zap.mdt",
 	}, {
 		.rev = ADRENO_REV(5, 3, 0, 2),
 		.revn = 530,
@@ -240,6 +292,14 @@ MODULE_FIRMWARE("qcom/a330_pm4.fw");
 MODULE_FIRMWARE("qcom/a330_pfp.fw");
 MODULE_FIRMWARE("qcom/a420_pm4.fw");
 MODULE_FIRMWARE("qcom/a420_pfp.fw");
+MODULE_FIRMWARE("qcom/a508_zap.mdt");
+MODULE_FIRMWARE("qcom/a508_zap.b00");
+MODULE_FIRMWARE("qcom/a508_zap.b01");
+MODULE_FIRMWARE("qcom/a508_zap.b02");
+MODULE_FIRMWARE("qcom/a512_zap.mdt");
+MODULE_FIRMWARE("qcom/a512_zap.b00");
+MODULE_FIRMWARE("qcom/a512_zap.b01");
+MODULE_FIRMWARE("qcom/a512_zap.b02");
 MODULE_FIRMWARE("qcom/a530_pm4.fw");
 MODULE_FIRMWARE("qcom/a530_pfp.fw");
 MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e55abae365b5..61d86a52e6ea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -227,11 +227,26 @@ static inline int adreno_is_a430(struct adreno_gpu *gpu)
        return gpu->revn == 430;
 }
 
+static inline int adreno_is_a508(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 508;
+}
+
+static inline int adreno_is_a509(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 509;
+}
+
 static inline int adreno_is_a510(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 510;
 }
 
+static inline int adreno_is_a512(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 512;
+}
+
 static inline int adreno_is_a530(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 530;
-- 
2.28.0

