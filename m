Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198E57BB8BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjJFNPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbjJFNPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:15:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BEB93
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:14:59 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5043a01ee20so2629482e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696598097; x=1697202897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbLZbLrOnmLh/4NymFlq193MxI5ZWz7inpVDOjP4Yo4=;
        b=IJpfHDLWqiI8X1PrE9auIy1LCDQGLp+Hs41wWXuZ01o6EfbK/UNJihaWMJYvw8quYa
         sA38kK+9gIiA8LSdnW8hh9CPgjjT/eXTWJctBAI+ZrwDz6cYMw1I9dU/GDG27omlkB2k
         6sQZBW1cvKAGvDVyS+AOzidlyy59u/wHQnNFj/YFbeg0YhItRUmaMatcE3RIww8d6xrB
         Gn9J34OFc/cMCqqOFb9fSLB5cTLVmle/VrMKpXtexl+UzlNrU6IF8Phl2BnToL7iSO3c
         OQaO3BXdnXKGeVFVgZWio8Tf/2sTdPHnLY57LNDFUsR1ahpRMWuC2fOvb7TWLEz+LFVU
         6+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598097; x=1697202897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbLZbLrOnmLh/4NymFlq193MxI5ZWz7inpVDOjP4Yo4=;
        b=OVxQpxypo9Qhr/DDSFdT9jZQYNK/mqDrvlilxWhzUTmcTKwOuM87Tir2H2H5Yq+n/5
         X/RlLXVohxp6sJtV4U3UHw5Mx7NFOoZsiQM0eL75tjLR/KIAnoMYQpUozI5nos+t4yCj
         vwNOyf7MEIFfrHCx9A+O7stPX/RtFhH8H6OhIHxznjUC7ykl4LZcNWyYFiBqBvzaSVRs
         kJ1K/+oJjgBj62obI4Ia5mGjnA+i8kr4Go4aC5YoJJIMNSSfU+Gm65HeU7sK8AW4mGuN
         VeEt4ldHAY9rE74OZQuksznXbG/uUK0oHnkImNc0UF3Pn6039x1r+gp0tvD5iseJ1BaG
         1G0g==
X-Gm-Message-State: AOJu0Yywu1hvMRQlx2WKzZezjGvH5skVsU2cH/iHpvF4DqEcEcMKvFjc
        q/RxMl3f7AlwWTx5arDzdxeeHXl7dUA/p2elM/o=
X-Google-Smtp-Source: AGHT+IEq95TjU58oK8K9ebk/mAWsmrBeUAJiygqjdhgEeffgyIRnIMhvah2JvKUB73gY3ldSjOJmtQ==
X-Received: by 2002:a05:6512:716:b0:505:6e21:32e1 with SMTP id b22-20020a056512071600b005056e2132e1mr6239633lfs.10.1696598097151;
        Fri, 06 Oct 2023 06:14:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:14:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 06/10] drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
Date:   Fri,  6 Oct 2023 16:14:46 +0300
Message-Id: <20231006131450.2436688-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we have dropped the variadic parts of SSPP sub-blocks declarations,
deduplicate them now, reducing memory cruft.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +--
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 97 +++++--------------
 17 files changed, 120 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index ff83bf694fee..93302f7000fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -93,7 +93,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -101,7 +101,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -109,7 +109,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -117,7 +117,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -125,7 +125,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 05f71f04b8ac..80eaffa16b94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index cbe4d0ce230b..12a28d121813 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 71207d7222de..9a3a592dcd23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2491eed10039..047dd6d4f5c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SM6125_MASK,
-		.sblk = &sm6125_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 8982ec228f3d..2aa4c792b306 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 18e2e48e2b7c..c5687571ea6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -52,7 +52,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -60,7 +60,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -68,7 +68,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index cde131a922fe..f9e4ce9d9f2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 3aba274faeec..46d6eca81eed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 87a03aa16554..e0b493f75fc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_QCM2290_MASK,
-		.sblk = &qcm2290_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_noscale,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &qcm2290_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 8afb8a8072b0..a8a4fab22c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -40,7 +40,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -48,7 +48,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 5435e5fdab52..be05b7ed2013 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index da8b7e46237c..351db9610ac7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -57,7 +57,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7280_MASK_SDMA,
-		.sblk = &sc7280_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0_rot_v2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -65,7 +65,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -73,7 +73,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 29cb4dd90980..ff6cfd612f7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index dbb77144364a..04d69182ec64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index e60427f54b27..860feb9c54e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -93,7 +93,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -101,7 +101,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -109,7 +109,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -117,7 +117,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -125,7 +125,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -133,7 +133,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
@@ -141,7 +141,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_4,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA4,
@@ -149,7 +149,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_5,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e9773274bdd6..32c396abf877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -285,6 +285,16 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = rot_cfg, \
 	}
 
+#define _VIG_SBLK_NOSCALE() \
+	{ \
+	.maxdwnscale = SSPP_UNITY_SCALE, \
+	.maxupscale = SSPP_UNITY_SCALE, \
+	.format_list = plane_formats_yuv, \
+	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.virt_format_list = plane_formats, \
+	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	}
+
 #define _DMA_SBLK() \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
@@ -295,98 +305,41 @@ static const uint32_t wb2_formats[] = {
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
 	.rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
 	.rot_format_list = rotation_v2_formats,
 };
 
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_noscale =
+				_VIG_SBLK_NOSCALE();
+
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_1_2 =
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
+
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_1_3 =
 				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_1_4 =
 				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_2_4 =
+				_VIG_SBLK(SSPP_SCALER_VER(2, 4));
 
-static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_0 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
-static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_0_rot_v2 =
 			_VIG_SBLK_ROT(SSPP_SCALER_VER(3, 0),
 				      &dpu_rot_sc7280_cfg_v2);
 
-static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-
-static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(2, 4));
-
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_1 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK();
-
-#define _VIG_SBLK_NOSCALE() \
-	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
-	}
 
-static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE();
-static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 
 /*************************************************************
  * MIXER sub blocks config
-- 
2.39.2

