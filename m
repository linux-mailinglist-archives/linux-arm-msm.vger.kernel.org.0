Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB957732CC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 12:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241187AbjFPKDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 06:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbjFPKDr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 06:03:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E8430D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:03:43 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso607996e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909822; x=1689501822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lxtwBJnxRAFyS0LGfKTvAlfNTwUclDeSYpwnEeCtUQ=;
        b=eA3TdMKoX+UTMWBC7og0+MReIVNbGdwvagpHwu+qmZ8xIlaMMYrok8Cet1kC2dxXW0
         QBfjzyPtrI2K5KPkaT7teW8b2yQxOTweMXZnuXOo6E3feYLAuZY3mTKm+ZzGbCgpef77
         //QmqKIyiFFuA/r75uC+rk9YaK8lN9saGe3rrTgR5H4kkIyNFABttouHa6qq/VgW2VT9
         x53vdGGjpnYxQgFrWDP9wp/VNBvy//t04+UsB6mgsdP6EqegVH27WBOPelKcexIzrr3d
         RZqqAMhCB2m7YhsOBeeBZyQ39p7Y+F2MDgNHGvTLDkk6VeDeEe95WC9x+o9FukVh+ETn
         1ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909822; x=1689501822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lxtwBJnxRAFyS0LGfKTvAlfNTwUclDeSYpwnEeCtUQ=;
        b=UADeT1JQS3q1XjWu0GvFmXZn3Hdec+kXrwc1TKa0/F8bTp/gLiwzvWkBY8ARNH9JVW
         YJTuxqcMsQvH5F3tPqleTL4HrOLLR2HlV2utN8CRV5srvYm0n+RBEmhXyo+zECmG3C/R
         MU/vawyZASdqCu5vQmIJnS6OON+Ergu8hEeqzKz3G6ykgBFj8+gpAGBcDEhmeZ2/vKri
         6nMqeDCuygTvU1mgdQZfcgJiGuTh9dgzA1F9g/sPs0SPvC6SwD2u5SM4u8IDAQa1bXTq
         YUfkNydnydZYfYncxITh2UjVcALm9v8CDpmTPzQcMG0lJUBo5Mjm23k7GEHteyTL4+nf
         i/ug==
X-Gm-Message-State: AC+VfDzwlt9lFaOW59b8MBMIOV0fO4OuERGaCSn1zMO4XEmAa1laKFtI
        mxoW7dhSk2ZU5N0RKyMA6tYb2gLRd3t5zRgeB48=
X-Google-Smtp-Source: ACHHUZ6fBG7yRNncyuf4QIA5FcVy/PjlMeVy39B12zQsvf2yDcNdFdayT1DAsI0W1/JDXdTBRbKZGw==
X-Received: by 2002:a05:6512:b0e:b0:4e0:a426:6ddc with SMTP id w14-20020a0565120b0e00b004e0a4266ddcmr913991lfu.0.1686909821779;
        Fri, 16 Jun 2023 03:03:41 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:03:41 -0700 (PDT)
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
Subject: [PATCH v3 05/19] drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
Date:   Fri, 16 Jun 2023 13:03:03 +0300
Message-Id: <20230616100317.500687-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since there is always just a single MDP_TOP instance, drop the enum
dpu_mdp and corresponding index value.

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h               | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 19 files changed, 20 insertions(+), 30 deletions(-)

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
index 8e2f02731143..1d01f53cd6d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -268,9 +268,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 
-struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_mdp *dpu_hw_mdptop_init(void __iomem *addr,
+				      const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_mdp *mdp;
 	const struct dpu_mdp_cfg *cfg;
@@ -288,7 +287,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 	/*
 	 * Assign ops
 	 */
-	mdp->idx = idx;
 	mdp->caps = cfg;
 	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index a1a9e44bed36..6414111991b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -137,7 +137,6 @@ struct dpu_hw_mdp {
 	struct dpu_hw_blk_reg_map hw;
 
 	/* top */
-	enum dpu_mdp idx;
 	const struct dpu_mdp_cfg *caps;
 
 	/* ops */
@@ -146,13 +145,11 @@ struct dpu_hw_mdp {
 
 /**
  * dpu_hw_mdptop_init - initializes the top driver for the passed idx
- * @idx:  Interface index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
  */
-struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_mdp *dpu_hw_mdptop_init(void __iomem *addr,
+				      const struct dpu_mdss_cfg *m);
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..f5c7ec923104 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
-	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
+	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
-- 
2.39.2

