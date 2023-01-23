Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E060D67756A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 08:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjAWHLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 02:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjAWHLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 02:11:50 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D47915CB0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 23:11:48 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id y25so16755102lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 23:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdDcVMGBf+GaYAMBWQXE0P0rt8VchreBUViGzmJaf6Q=;
        b=hG412Ck8TI+idA6lTByW9mV8N7DwyaHwVIrrMjlDJe7MOBMLFitEEzqnAoEduq8wsC
         gZyE45V42IftcCI3GqxsK7l5AFwxcBH6XXo3BVm80yHPfHK1aX13xccVIZY26cSxQHVM
         G7uiu6jLeHsfMaACqmE1O9bvdOeKU8vjPOWH5G/FbgaHteBc3DuGm9aM4YuNavZo3BQO
         l9cA4ISDkMvJbaP/GH29KxsSuE8xThE4pwvd/SuiQpqXGVXaJGwwfbg7o3ldDoOtPPxV
         46Yl7Lae6O2rKOvRf22pV/spFKrd9skAz2Jjg7Rcb4XsbV4M9NrH2QYUiV8IR8VbSWA1
         xsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdDcVMGBf+GaYAMBWQXE0P0rt8VchreBUViGzmJaf6Q=;
        b=tMfhQNA3+l2Xp4ffartHDaFtKqQCcloHN3WKO/N2i58vuW2XXId25teBDeaEG5jp5R
         bMBODe7pagv6I3Yo2PH4+8e4/CFh0PxbvyG0u3Zi2NicNeZqYdvpLMWUK9dj3TTaGlM0
         4WoWl3Rrq5sLqwItb7BPWtKkab/CwbXVRjm5KOFcxFzqCpzVA9IjZHnpF+i/JY3Fwiyx
         Zux4lPrzJtrAfoBrfjus4nKytqVBJ/nL+TyEccX6FhIByvhMVRZ0yfW5Gt3VyCyERLw7
         6MQaUeUO/Zx6cTVx/mt/sTZ1xRE59uQqGX+dVS8gjoKtkpJvo08LaM3ICFL3BScfkleI
         zAKg==
X-Gm-Message-State: AFqh2kqmGy9jSwn1XOYvziUpviMTmSDhiChDZ0b8CVwQKaC9u58++hKX
        kGPozE3l+oupsD/4ER4J7SutSA==
X-Google-Smtp-Source: AMrXdXvMchY+FEk1+BTw8FxKmxmmkq6e16qQj9j6qFs1BdP2Wnl9tLw1hL2PCxJqcx5Stk9Bv5ZHmw==
X-Received: by 2002:ac2:5087:0:b0:4b5:8d45:7f32 with SMTP id f7-20020ac25087000000b004b58d457f32mr6214430lfm.56.1674457906979;
        Sun, 22 Jan 2023 23:11:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v16-20020a056512049000b004b564e1a4e0sm1814236lfq.76.2023.01.22.23.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:11:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] drm/msm/dpu: disable features unsupported by QCM2290
Date:   Mon, 23 Jan 2023 09:11:45 +0200
Message-Id: <20230123071145.3056242-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 doesn't seem to support reg-dma, smart-dma, UBWC, CDP, exclusion
rectangles and CSC. Drop corresponding features being incorrectly
enabled for qcm2290.

Cc: Loic Poulain <loic.poulain@linaro.org>
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 289fb11f99d1..1c3ffa922794 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -12,10 +12,14 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_kms.h"
 
-#define VIG_MASK \
+#define VIG_BASE_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
+	BIT(DPU_SSPP_TS_PREFILL))
+
+#define VIG_MASK \
+	(VIG_BASE_MASK | \
 	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
-	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
+	BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
@@ -29,7 +33,7 @@
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
-#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
@@ -50,6 +54,10 @@
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
+#define DMA_QCM2290_MASK \
+	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1))
+
 #define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
@@ -316,8 +324,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -1384,7 +1390,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_QCM2290_MASK,
 		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
@@ -2836,8 +2842,6 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.intf = qcm2290_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &qcm2290_perf_data,
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
-- 
2.39.0

