Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A80337FC5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 19:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhEMRTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 13:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhEMRTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 13:19:21 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2741C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:18:09 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id v8so8253484qkv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NX+3K+nDZfJV2EuD7CkoMwpkTTqFDDwUKaIW0GhTpho=;
        b=TTb0cint3NPx33vn/NZ46EWC11vTzo312u0r8YAz/OmrCdlQ9aX25LFxkEAIqy4zHM
         Shv03wlQeA9OmJZJpMxSucex3UZbrEazadCwVDx8CVNic4Xw8cDMuPZdCLHjJiApDxK4
         cpd1xxk8vp8iVUKU6B7tXv2Jc2dtwDz5YXejDhmIN3GwtLe1KE9W9TTEaaN2Uojzz4DF
         QxP+AgY+8a3+htzXLZJfu6hIeffsVe+aVUMAi6cc/+kn0z1GbiH85eTP2/USGEm3OAt9
         YwX3wdCUj9z7Kw9ip5iHSZY0md1tlbRAH4RY6jiPgSk4LDQaVuJ87BzSBLQNkSpgVM1P
         4INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NX+3K+nDZfJV2EuD7CkoMwpkTTqFDDwUKaIW0GhTpho=;
        b=o+1CEUda5r5PplvyK1cjhvUP4/cJSZUeQjZeF7fYOmZ1JjHo/xVAiWy1uNJovT/TRb
         hwtwWn1pTV18skuY6sglYbANMBS5Y1A881HcxAZz8QBtVfA3E1XEp/GdMaZCfJMt22wW
         P5lO9u2DQPAurSpI/hrq3aY7HN8ruNJESyQ7OOlKc1efw5uYvAaDciRZDMnR+V0YsCPS
         uWuKxRGLmWr1K/A/zMYgj2AjBsyrqCt+W/Xhtaf8DEGjHa1xMSP44YQcfsomUSgoTI65
         IzPDJsG3QHOjVwaUtlpMlZqJ1JRdUVhcvgzV67fYR76eXBLKj954gzbmcy65xDNMDADn
         P3jQ==
X-Gm-Message-State: AOAM533dDBodJgGq15Y8Dnw8fT6AmSH1VPVvLrM8/YNANfc+xDAkSMXU
        rLE555C0aCIgf6kQD2m7sVVHaQ==
X-Google-Smtp-Source: ABdhPJyBINN0E76DwCsbr+OiT0OrklRNb0uZcvUCvLFqVk6GMlaQngCGx/9Xn57Otw0KWYPpnUOmAQ==
X-Received: by 2002:a37:e12:: with SMTP id 18mr38903795qko.419.1620926288384;
        Thu, 13 May 2021 10:18:08 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 10:18:08 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 8/8] drm/msm/a6xx: add a660 hwcg table
Date:   Thu, 13 May 2021 13:14:03 -0400
Message-Id: <20210513171431.18632-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a660 hwcg table, ported over from downstream.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 53 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  2 +-
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ec66a24fc37e..2713f69e916d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -427,6 +427,59 @@ const struct adreno_reglist a650_hwcg[] = {
 	{},
 };
 
+const struct adreno_reglist a660_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
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
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index e4db0683d381..6dad8015c9a1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -299,6 +299,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
+		.hwcg = a660_hwcg,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 63c050919d85..e6b11e6ec82d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -55,7 +55,7 @@ struct adreno_reglist {
 	u32 value;
 };
 
-extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[];
+extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
 
 struct adreno_info {
 	struct adreno_rev rev;
-- 
2.26.1

