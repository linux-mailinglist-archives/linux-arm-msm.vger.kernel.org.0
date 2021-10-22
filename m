Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EEA4376AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 14:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhJVMVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 08:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhJVMVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 08:21:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29A0C061764;
        Fri, 22 Oct 2021 05:19:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i24so234443lfj.13;
        Fri, 22 Oct 2021 05:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ldhfqs7usyb7J67Y95IPDo3g6pojRg5rLepZ/ekX6dk=;
        b=gphkwaZOtzm+WBTI/48ox/bXILuJqeCofxvrACG2qznKaSF/eh5LRi2UZQUvzSKBeu
         3TBa49X7BeMg3/UgBk9U3qxhU3OaYb+gVw0AmawaRkvV8/bmgffRznOEItq2iflVuPEK
         JIv1ljCZd0RQ/dgjgYQoIWxr45VvxjgHNiyLpvKp9jNcylYngX4CUwt4Ex4TQ1Lwi08d
         ESiFG2rG6O3fKqy27AUvnaw4CS2BEs2s2Y0DD7s2wcdXsTPT8sT1dVeXewVMYevGP6K+
         5vOQJeSZbJsdWsZEj3C+goMOAYYV4hyRVeicwbmCeHVDM3SlcfdRbCN0y0FupDke8YYk
         rKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ldhfqs7usyb7J67Y95IPDo3g6pojRg5rLepZ/ekX6dk=;
        b=fH9M8hzlY9o1gbRE7ujUpbp665ZxeMxEOsVTnIRGKgQr2KUlgakSFt7pt8KS7JssUc
         bm6GWyEigdY1nYZ24afysIQLnbhdbJsXylBHYUp0kciPyc1qp4nUV0TwPb6eTUVcfaqB
         j+mfGJ2sxbD95wA5Q45r6mMmhpwFWcWqRwXHMbhNCuZtmSlYsQo2D8/6R0e9Fv1UxPt4
         F5l2On1e0pkHMhCAylJ9FxJ/CiOuwwrBJkAFoBl7n/s3eez/Wz3txHVjeS+kJYN8QkER
         /HtSsKBGqUazttmdECcqw61NnM9b9HpdVckF8W0UbuhTrSU8iX88IY1eZfoKPraM/e9O
         kYeA==
X-Gm-Message-State: AOAM530V+glirJk+oUHREuP2F2mAy7UETyr5LjhwPMys3pmXHbL507ej
        MV2bvultiem2F/PUhZHl34s=
X-Google-Smtp-Source: ABdhPJzP6rqJv5pQ/dK+sAi61A0hD+RPNRwdz/uoRF6ePQUpuAl6ZznBCc/pWW/vL1eGhGIpmsLpdA==
X-Received: by 2002:a05:6512:68b:: with SMTP id t11mr10581273lfe.586.1634905143344;
        Fri, 22 Oct 2021 05:19:03 -0700 (PDT)
Received: from trashcan.lan (public-nat-10.vpngate.v4.open.ad.jp. [219.100.37.242])
        by smtp.gmail.com with ESMTPSA id k18sm715124lfg.301.2021.10.22.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 05:19:02 -0700 (PDT)
From:   Vladimir Lypak <vladimir.lypak@gmail.com>
To:     Vladimir Lypak <vladimir.lypak@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a5xx: Add support for Adreno 506 GPU
Date:   Fri, 22 Oct 2021 11:43:34 +0000
Message-Id: <20211022114349.102552-1-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This GPU is found on SoCs such as MSM8953(650MHz), SDM450(600MHz),
SDM632(725MHz).

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 ++++++++++++++--------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++++
 3 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5e2750eb3810..249a0d8bc673 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -441,7 +441,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	const struct adreno_five_hwcg_regs *regs;
 	unsigned int i, sz;
 
-	if (adreno_is_a508(adreno_gpu)) {
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu)) {
 		regs = a50x_hwcg;
 		sz = ARRAY_SIZE(a50x_hwcg);
 	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
@@ -485,7 +485,7 @@ static int a5xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 
 	/* Specify workarounds for various microcode issues */
-	if (adreno_is_a530(adreno_gpu)) {
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
 		/* Workaround for token end syncs
 		 * Force a WFI after every direct-render 3D mode draw and every
 		 * 2D mode 3 draw
@@ -620,8 +620,17 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
 
 static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
+	/*
+	 * Adreno 506,508,512 have CPZ Retention feature and
+	 * don't need to resume zap shader
+	 */
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a512(adreno_gpu))
+		return 0;
+
 	ret = qcom_scm_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
 	if (ret)
 		DRM_ERROR("%s: zap-shader resume failed: %d\n",
@@ -733,9 +742,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a510(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
-		if (adreno_is_a508(adreno_gpu))
+		if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		else
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
@@ -751,7 +761,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
 	}
 
-	if (adreno_is_a508(adreno_gpu))
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x100 << 11 | 0x100 << 22));
 	else if (adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
@@ -769,8 +779,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 * Disable the RB sampler datapath DP2 clock gating optimization
 	 * for 1-SP GPUs, as it is enabled by default.
 	 */
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
-	    adreno_is_a512(adreno_gpu))
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
 	/* Disable UCHE global filter as SP can invalidate/flush independently */
@@ -895,8 +905,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (!(adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
-	      adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu)))
+	if (adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))
 		a5xx_gpmu_ucode_init(gpu);
 
 	ret = a5xx_ucode_init(gpu);
@@ -1338,7 +1347,7 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	/* Adreno 508, 509, 510, 512 needs manual RBBM sus/res control */
+	/* Adreno 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
 	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
@@ -1381,8 +1390,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	u32 mask = 0xf;
 	int i, ret;
 
-	/* A508, A510 have 3 XIN ports in VBIF */
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
+	/* A506, A508, A510 have 3 XIN ports in VBIF */
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
 	/* Clear the VBIF pipe before shutting down */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2a6ce76656aa..eb4b8527153b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -131,6 +131,24 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(5, 0, 6, ANY_ID),
+		.revn = 506,
+		.name = "A506",
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
+		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
+			ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a506_zap.mdt",
 	}, {
 		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
 		.revn = 508,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 225c277a6223..427a96d81280 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -201,6 +201,11 @@ static inline int adreno_is_a430(struct adreno_gpu *gpu)
        return gpu->revn == 430;
 }
 
+static inline int adreno_is_a506(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 506;
+}
+
 static inline int adreno_is_a508(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 508;
-- 
2.33.0

