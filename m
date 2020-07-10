Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7D721C083
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgGJXFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgGJXFf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:05:35 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B92EC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:05:35 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id x62so5799812qtd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v6ivPqrjMDDr3TRNG96DmIieKD3MH/IuhTJHVemdvZo=;
        b=mD4rNTBvdE5KXuYC4b6PGIVTtIxAYQyogmsrVl9FyzpE/jLzFTlKgPK60wOz/OqYyy
         v2mTDwGgr9R9AHjgkMGkYmylnK9XZQwPUjJL7taIeoqjtLXWIdOPZOjroLYHpdmJVjib
         Dlb684ctSVhWjtAJ2ZXA/fso/BAjBuK2xUiQEg0dT5uvpAl7f8h6iRDhZ8OKZMLhVCIF
         hPWbN/85q+cxHa8dcGFcLZduJbrtIAPipHA7VkMVJsOE29/nsU0wUFUthA/sXZ67Xf1K
         XfynEAeHeix30IZF3doAyKYVOg9D3dVHquKmzdvpDjJtsCL6CQu83cRn8v4Rl9n/HL8V
         pPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v6ivPqrjMDDr3TRNG96DmIieKD3MH/IuhTJHVemdvZo=;
        b=dl53H6cA3bQSPocaJ1ERCJ8OKKsKBfg5mrcYCUZpVKT26zW07bxBnQUsTWFEFQl7kQ
         i+gCkz/Ke37e050K5azR+pqQYxcBYN27d6eJxXnSewJ99PsAt27Bi4THbreryNm3WfwW
         Tfhfp4AE8C/d28D0NeueH+thVvKboOfhRwJvr4aHu4ixBr43/iECrZ0fsxhTdB6LIaxU
         C2aT3NeVNX32P9q9n66pT2GC224RyXeDoVTpXgd9UaYzpchnYD1bHsGk1FxpvD/+mO1v
         nzf3asv6Xv9NbwKRvJQKBg+5GkIkKaMGxB9f4o7E/WanHHCenxB7J+fnhBVKpXkupqrK
         SxXg==
X-Gm-Message-State: AOAM530rl3zA280T/IetSVI/TYFMoQJR5t/YdRp9sg5iamNkL2MYp66t
        5JOp21/v6eYgbQjvfe/e/FZb3Q==
X-Google-Smtp-Source: ABdhPJyUvIKbE5/BA3PRSmr94uSUG08duLAoCKW3CvonbUAJmLs93BI2H3hmv2nKUdMg7RgpyuPIYg==
X-Received: by 2002:ac8:44d6:: with SMTP id b22mr73349830qto.391.1594422334354;
        Fri, 10 Jul 2020 16:05:34 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id l1sm9513541qtk.18.2020.07.10.16.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:05:33 -0700 (PDT)
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
Subject: [PATCH v2 1/2] drm/msm/a6xx: hwcg tables in gpulist
Date:   Fri, 10 Jul 2020 19:04:09 -0400
Message-Id: <20200710230413.2944-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will allow supporting different hwcg tables for a6xx.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 25 ++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  8 +++++++
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3397e5e00d1c..ddcbc57ac25d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -151,10 +151,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	a6xx_flush(gpu, ring);
 }
 
-static const struct {
-	u32 offset;
-	u32 value;
-} a6xx_hwcg[] = {
+const struct adreno_reglist a630_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP2, 0x22222222},
@@ -259,7 +256,8 @@ static const struct {
 	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
-	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555}
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
 };
 
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
@@ -267,9 +265,13 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	const struct adreno_reglist *reg;
 	unsigned int i;
 	u32 val;
 
+	if (!adreno_gpu->info->hwcg)
+		return;
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
@@ -279,9 +281,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	/* Disable SP clock before programming HWCG registers */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
-	for (i = 0; i < ARRAY_SIZE(a6xx_hwcg); i++)
-		gpu_write(gpu, a6xx_hwcg[i].offset,
-			state ? a6xx_hwcg[i].value : 0);
+	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
+		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
@@ -437,12 +438,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
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
index 7732f03d9e3a..97996e7fc668 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -200,6 +200,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
+		.hwcg = a630_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
 		.revn = 640,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2f5d2c3acc3a..426cabd374bb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -68,6 +68,13 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 };
 
+struct adreno_reglist {
+	u32 offset;
+	u32 value;
+};
+
+extern const struct adreno_reglist a630_hwcg[];
+
 struct adreno_info {
 	struct adreno_rev rev;
 	uint32_t revn;
@@ -78,6 +85,7 @@ struct adreno_info {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
+	const struct adreno_reglist *hwcg;
 };
 
 const struct adreno_info *adreno_info(struct adreno_rev rev);
-- 
2.26.1

