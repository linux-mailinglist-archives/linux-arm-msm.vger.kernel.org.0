Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49F40735EFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjFSVZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjFSVZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:25:28 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AF0E5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:26 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f766777605so5075433e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687209925; x=1689801925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zUpQ3NJcHzyMsqulByMDKB9YV4WkvPZEPg6/JrAOvI=;
        b=f/v82xdgACJqOCqDtNdssseEKqeMUMf9ImVtBdo0mOrMkd6FZkEmfG14RyfnjXk73+
         /afNDqRzHiMVTRmqlNtNbiuUpsqmQappUjAwEP/A1UVa1m91YoFqTFM4ixux5MXSiA4f
         0dWftmzY/N8V8FxAH/GIf0mBqOm/tNW1/eWWrp5mCefGFc3IGQkThrJ0uiQ+CZG4Ci5G
         xARaIWx4e1Z9VQHyoVX7sJXkttzlupc5iKPJxL3vrUsnV4xbW/bu3AXAeuJQzmiQ9fiX
         xyqxvVCSwatZCoyQexcL4xWYYqK4Mxml4oDjgHL6N9IizLhnnEDw1/6Z1yM5xyAGMwiC
         ShKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687209925; x=1689801925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zUpQ3NJcHzyMsqulByMDKB9YV4WkvPZEPg6/JrAOvI=;
        b=W/OU/XD83k3OU2raDsqWbQAZuEMnc67jmZ8Xzd/6ZRrrA7ylNxSKRd+u0Qg5b8uxS9
         pZ0szUMmkcjC/nFoaJt76FJcJNO6wS1ggO2Axov3Cslgt8qDPKQ2rhasUrWImBDdr/+x
         48wwWGi2dP2cUbAxYskFOR0JenjZPeqcqq0Nu1svvgRKVMProxPUOsJh020utHVIvpsy
         r1ejqGVDgVtqTB2t+Whv3eNBJEKarGqM5YS6I7pLPO6Tfzvlgj2/0+uzJTgjB7o4P7Gg
         oHmUJR54BNfg8dG5Wr5K0K/IVW0suOAaNp/A2frVsmlfcdJ9rN1tQK+p7OuL0wDyiryh
         GKHg==
X-Gm-Message-State: AC+VfDwmofJ8ELNJbyZSrsYQLkRPw2214Qwriw5sOCHLssul+l/91i1c
        REtdTX9GaKQSTs+FyxdLFm3/Jg==
X-Google-Smtp-Source: ACHHUZ4izZmUmBwZE3T/Vcy4WlOV8book6l2e4F6uRyanxALkh/80xqkXD1KEe/V8420aLGdAvJjkw==
X-Received: by 2002:a19:da0a:0:b0:4f8:72b6:eae with SMTP id r10-20020a19da0a000000b004f872b60eaemr2033356lfg.40.1687209925119;
        Mon, 19 Jun 2023 14:25:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 14:25:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 05/19] drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
Date:   Tue, 20 Jun 2023 00:25:05 +0300
Message-Id: <20230619212519.875673-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since there is always just a single MDP_TOP instance, drop the enum
dpu_mdp and corresponding index value.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h               | 1 -
 18 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index e0d2ee48d733..30565b245b29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg msm8998_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x458,
 	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72295d5a10dc..35c495bdcbe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sdm845_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 418312b164b8..cb2716715e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8150_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index ffacf29926b3..a655e84cf147 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc8180x_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 86dfc5745630..90e561d086e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8250_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index f42f27707453..3aafe4dfb663 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -23,7 +23,7 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc7180_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 1d21c33542a7..3ff4817de0cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -24,7 +24,7 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm6115_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 6ad68764e13f..198865fe5cba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm6350_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 80670e7cfc57..ba0e419e17cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -21,7 +21,7 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg qcm2290_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 8e7dcb2e8762..8b659a60d2c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm6375_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 83dafd3f2a41..c741595e2b62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8350_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index a7695f05beab..6174f7433203 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -24,7 +24,7 @@ static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc7280_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x2014,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 54543dc3985a..6574875c4f13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 0f8bf4465372..60a914f19b0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8450_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 851aa078a4bd..6db1b57e6132 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8550_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x4330, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 02a0f48aac94..d85157acfbf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -101,11 +101,6 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_MAX,
 };
 
-enum dpu_mdp {
-	MDP_TOP = 0x1,
-	MDP_MAX,
-};
-
 enum dpu_sspp {
 	SSPP_NONE,
 	SSPP_VIG0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index f8c42497b37d..448e59b859d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -286,7 +286,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
 	/*
 	 * Assign ops
 	 */
-	mdp->idx = cfg->id;
 	mdp->caps = cfg;
 	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index c89746c6f500..96c9ea89f08c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -137,7 +137,6 @@ struct dpu_hw_mdp {
 	struct dpu_hw_blk_reg_map hw;
 
 	/* top */
-	enum dpu_mdp idx;
 	const struct dpu_mdp_cfg *caps;
 
 	/* ops */
-- 
2.39.2

