Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4171792727
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjIEQEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244695AbjIEBZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 21:25:39 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9C1CC5
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 18:25:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-501bd7711e8so377249e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 18:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693877131; x=1694481931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtJfFRJhor5QKr/LtRM3Tm/DKJDynDxtu7eKooiuEWw=;
        b=AyclKf/NGlmMxXagWiC0C8rBNJPN4H+7yCu9W+tt3HTlAdqhS9xUkE08Fda+UEOdVU
         CibkH9BV4n3ahBWiQGaFsi98kk5rKRNTag5ptkADKGMN/YLUHrP07AqkNXy+SMRGBDl+
         zpDL+NVuDKtsAON2IqBDyFAazeYfL9slj45hgcZVDnwqtmiuzE/sweyUufJeVbP0STVE
         18059TCP5pm/tnpc4x3TB/TSCMk6xb6RqbUuC0FtPMdr3FRdlqWPnN6Mk/IjdQfEHqT3
         /dF5/3Ftt+8peOm2rUC/uEi2pDsSqitUGgXO6QpOzK8yhHDAYv7ZGMp6RxhwcbG2L+lN
         p9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693877131; x=1694481931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtJfFRJhor5QKr/LtRM3Tm/DKJDynDxtu7eKooiuEWw=;
        b=YwdgYF3l9xcGDQzPEWe4qZLjaUFXmnh3xHwK7WAvUb+pHpUNFkY1pxvPK0uHiJzISN
         hSHSmNnlDomZo859mVtLvNgt8jGLwzliYj1yCLFIuUBDnwiui1NfWQMlXaF9H5tlKhxc
         uihVUi3D1UhnH9qNgHq7zFEdIkdLJqK+15X0FSeyw4hipQPHBT9RXQSh62iQDSLrQLZQ
         p5aFFj+Bb3nhfu610nkA4RdA0JZE9/fqXl85ePFPD2iw5OvXt4g04VUIELMHn7ng1NNu
         tYkLOVPvhDP4BNlsOOyT9IAJ7XI4U1TVA3Uh2y11hOsk2URMQhnHATrpP8aGnQaJExN3
         zYAg==
X-Gm-Message-State: AOJu0YwNL5Jqw2B2moE23G7Cs20GqRBqDOlK05M9AeDaMCXoBZ7VjamV
        6P0Zi09mtCOm6+CQ9nKA/l6rhQ==
X-Google-Smtp-Source: AGHT+IFjXc9YpuTvrvnUADrD6ZNX6rQ9UsSMKXlhIktadWpLkVvcsZWzIygEDT1N8O7+u+2QqBmbxA==
X-Received: by 2002:a05:6512:6d1:b0:500:dc8d:c340 with SMTP id u17-20020a05651206d100b00500dc8dc340mr8524452lff.35.1693877130958;
        Mon, 04 Sep 2023 18:25:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 18:25:30 -0700 (PDT)
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
Subject: [PATCH v3 4/8] drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
Date:   Tue,  5 Sep 2023 04:25:22 +0300
Message-Id: <20230905012526.3010798-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
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
index 43c47a19cd94..5ea938b57eda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -70,7 +70,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_1_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -78,7 +78,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_1_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -86,7 +86,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_1_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -94,7 +94,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_1_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -102,7 +102,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -110,7 +110,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -118,7 +118,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -126,7 +126,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 88a5177dfdb7..440d49842f31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -68,7 +68,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_1_3,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_1_3,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_1_3,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_1_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index f0c3804f4258..619afa54c714 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -93,7 +93,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -101,7 +101,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -109,7 +109,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -117,7 +117,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -125,7 +125,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -133,7 +133,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 3ec954722a8e..668b48e3c922 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2491eed10039..c5c44e15a8ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SM6125_MASK,
-		.sblk = &sm6125_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_2_4,
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
index 5f9b437b82a6..52f3884e587b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d030c08636b4..e76a6d329896 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -53,7 +53,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -61,7 +61,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 7e6000167ef0..8fc938398aa6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -40,7 +40,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -48,7 +48,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index cf5db6f296bd..12d9825a2b30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -60,7 +60,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -68,7 +68,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
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
index a327e21c90fb..6c43099b252e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -41,7 +41,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -49,7 +49,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index f8d16f9bf528..8989dc17b491 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b5061c4402a..58fa7d238106 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -58,7 +58,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7280_MASK_SDMA,
-		.sblk = &sc7280_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0_rot_v2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -66,7 +66,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 58f5e25679b1..70a9ef59b43e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3aed290a4111..5c7a8ce7bc4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 7bed819dfc39..c5d173b5ee36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -78,7 +78,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -86,7 +86,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -94,7 +94,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -102,7 +102,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -110,7 +110,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -118,7 +118,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -126,7 +126,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -134,7 +134,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
@@ -142,7 +142,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_4,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA4,
@@ -150,7 +150,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_5,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e9773274bdd6..b37b4076e53a 100644
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
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_1_2 =
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
+
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_1_3 =
 				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_1_4 =
 				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_2_4 =
+				_VIG_SBLK(SSPP_SCALER_VER(2, 4));
 
-static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_3_0 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
-static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_3_0_rot_v2 =
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
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_3_1 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_3_2 =
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

