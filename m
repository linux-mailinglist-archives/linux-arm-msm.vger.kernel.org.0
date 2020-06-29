Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2D420E9AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 02:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbgF2Xta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 19:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgF2Xt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 19:49:29 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6635C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 16:49:28 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id z2so14309612qts.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 16:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ftPRC7yvnIWJ9nZewziqLzoSvtp4M17TqP+53+kP3fI=;
        b=kdoYMMMs5JduGdz+ONh1Z5ncgnwFKu/4WNEtc8WRcYZXa05Py1qF3OWGwOPdZLyZu0
         /IRd+r1O7ZvG+raIPMK7PEL6Cpj99XGWfClfZBwL++hck+hOX2ZPaK8U/fv+fl4bvbWk
         C09AypBjzy0mnH/lEvdDYTZWyjN0/PeK941//fEK6oAXcROYHHMhfkTHwliKcyXBtxA7
         TfvZTUzGCX9YP1wSTBYyvhO3+JoNzMX0MekXgCdabPgL+teusAgw6vLXOfPgqYIqCLAf
         2fqzVilEW+4486nPK6I/tYcVcI6E+jmL80Wq9CFZtAdxnkgWrRYO6Ws35XuzvI7ZhlS4
         lNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ftPRC7yvnIWJ9nZewziqLzoSvtp4M17TqP+53+kP3fI=;
        b=WMoP1gr7/KYlxBSVpx6DHMQwU+FqdnfkfRyq0pz5t7j7KYAPY9z16BUi71x5KUgNQ7
         8fpBoURO28FmHNgCT1juZEo3CfhGkMLbePCpksIOLUTgIxgb4RxP1SRlkj60sYyY3Xnr
         WzMGxcPS0HAIUo211+RNgHPq/D5K3uvynLkf+J0v7r8cCiqQnoveCdjDJeXsHJdkdc3F
         SbSxDicdvYzw6jg8ByEvff7StmVqYeHkrhFJLE19Cp9bNF5/SdDsdOJBSzYFw+C/aY/A
         90+kS/SVvLsNYzcZhnBN1m8SIyaabcz2NyzHxkB150KqPV5xuT5P2zgwxgx2T+jE8M7b
         X4pw==
X-Gm-Message-State: AOAM531zgqLQ5VAqgZKXZbwumTjHgtRbnyMpmPnObiPHrVh+VAIbuLYT
        oF05ykg6iYK/ao0SSJTray+rzQ==
X-Google-Smtp-Source: ABdhPJwCLLJOHs7U+bj4f0N5gu6THBj9Fnd8xw1W5r0zvYVGXTZ/stRq3yEKWU2tS65foS5Cp0XEDg==
X-Received: by 2002:ac8:a03:: with SMTP id b3mr17765128qti.240.1593474568048;
        Mon, 29 Jun 2020 16:49:28 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n64sm1541076qke.77.2020.06.29.16.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 16:49:27 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/a6xx: hwcg tables in gpulist
Date:   Mon, 29 Jun 2020 19:49:13 -0400
Message-Id: <20200629234921.3511-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629234921.3511-1-jonathan@marek.ca>
References: <20200629234921.3511-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will allow supporting different hwcg tables for a6xx.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 129 ++-------------------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 111 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 ++
 3 files changed, 127 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3397e5e00d1c..6cd79166a94e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -151,117 +151,6 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	a6xx_flush(gpu, ring);
 }
 
-static const struct {
-	u32 offset;
-	u32 value;
-} a6xx_hwcg[] = {
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP1, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP2, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP3, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP2, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP3, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP1, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP2, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP3, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP1, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP2, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP3, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP1, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP2, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP3, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP1, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP2, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP3, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP2, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP3, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP1, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP2, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP3, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP1, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP2, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP3, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP2, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP3, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP2, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP3, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP1, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP2, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP3, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP1, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP2, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP3, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
-	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
-	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB1, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB2, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB3, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU1, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU2, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU3, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05022022},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
-	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
-	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
-	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
-	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
-	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
-	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
-	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
-	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
-	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
-	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
-	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
-	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555}
-};
-
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -270,6 +159,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	unsigned int i;
 	u32 val;
 
+	if (!adreno_gpu->info->hwcg)
+		return;
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
@@ -279,9 +171,10 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	/* Disable SP clock before programming HWCG registers */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
-	for (i = 0; i < ARRAY_SIZE(a6xx_hwcg); i++)
-		gpu_write(gpu, a6xx_hwcg[i].offset,
-			state ? a6xx_hwcg[i].value : 0);
+	for (i = 0; i < adreno_gpu->info->hwcg_count; i++) {
+		const struct adreno_reglist *reg = &adreno_gpu->info->hwcg[i];
+		gpu_write(gpu, reg->offset, state ? reg->value : 0);
+	}
 
 	/* Enable SP clock */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
@@ -437,12 +330,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_TPL1_ADDR_MODE_CNTL, 0x1);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_ADDR_MODE_CNTL, 0x1);
 
-	/*
-	 * enable hardware clockgating
-	 * For now enable clock gating only for a630
-	 */
-	if (adreno_is_a630(adreno_gpu))
-		a6xx_set_hwcg(gpu, true);
+	/* enable hardware clockgating */
+	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
 	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu)) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7732f03d9e3a..f5f40bc3c113 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -7,6 +7,7 @@
  */
 
 #include "adreno_gpu.h"
+#include "a6xx.xml.h"
 
 #define ANY_ID 0xff
 
@@ -14,6 +15,114 @@ bool hang_debug = false;
 MODULE_PARM_DESC(hang_debug, "Dump registers when hang is detected (can be slow!)");
 module_param_named(hang_debug, hang_debug, bool, 0600);
 
+static const struct adreno_reglist a630_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP1, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP2, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP3, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP2, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP3, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP1, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP2, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP3, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP1, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP2, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP3, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP1, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP2, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP3, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP1, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP2, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP3, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP2, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP3, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP1, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP2, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP3, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP1, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP2, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP3, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP2, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP3, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP2, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP3, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP1, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP2, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP3, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP1, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP2, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP3, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB1, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB2, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB3, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU1, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU2, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU3, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05022022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555}
+};
+
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
@@ -200,6 +309,8 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
+		.hwcg = a630_hwcg,
+		.hwcg_count = ARRAY_SIZE(a630_hwcg),
 	}, {
 		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
 		.revn = 640,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2f5d2c3acc3a..316a4a327c61 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -68,6 +68,11 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 };
 
+struct adreno_reglist {
+	u32 offset;
+	u32 value;
+};
+
 struct adreno_info {
 	struct adreno_rev rev;
 	uint32_t revn;
@@ -78,6 +83,8 @@ struct adreno_info {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
+	const struct adreno_reglist *hwcg;
+	u32 hwcg_count;
 };
 
 const struct adreno_info *adreno_info(struct adreno_rev rev);
-- 
2.26.1

