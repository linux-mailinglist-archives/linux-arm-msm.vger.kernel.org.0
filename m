Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93E86F46A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 17:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbjEBPFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 11:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233593AbjEBPFs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 11:05:48 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6CF2114
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 08:05:37 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso37797031fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039935; x=1685631935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMoajvygLpHN0tJCNypWoRhLDvyZjkn9k0Ux5UMBZj0=;
        b=aq6PQEnpvIt055Z4lFjJVggKjt3Zbi+Pil63EwkB4Z7+lw6dPK4eP6uavg9xjIxG69
         QmjGRMxQrLg5CQxidIHM/j+vfOLx08sBPd6VYe49go97JSUuCIf+rmYJ21X5yKChLSDB
         z65cQrHdJJ/Zitk5cVZs2bQf1vQzIzrytujhrv7J2SxxS+jxzV2UhPXIaYpwkgm7H5dz
         2lYzoOo1IicNe3fwgtJBK8pcXgd3cP06YNJXyiTkae+Q7/pHxvg7yShP42iIffk2ZwA6
         YPT8EfIT2vUFJtlkvw+2zqdMwmKAqsH4dg1LoKGwVQKuX/Pu9D7yqBtS6C4UNVkcZQSs
         HKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039935; x=1685631935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMoajvygLpHN0tJCNypWoRhLDvyZjkn9k0Ux5UMBZj0=;
        b=CIMSFQBTO+l/R/dULlEUFNYzF9+OIyCUGiK+VMsbf1tllAJx58dq6lx0UmPq8HZCVC
         JP32G6vkuklcB4icZd7efYGof6wxMW1bBoWFOvIxMCO2+KUyuD0GgTdrbPodjY9Gavur
         NtV/TwdczGXS7H4atSJHaBiU5yWN/TYp9w1KL5jpTcFp23CFROIe0E2bhoSrK2mekbJI
         6ZZMAQgdNyTsv6M7oWg2V2O/rfae4MZZaHGwqar73NxeXWx1llA1mErPPVaRNKj8Fp1f
         Tmk/otUs+U/tYK09Th5+Jo2kuMuOzaQIVbwsWtTL7Ykq5/1cXJvRARXJDySAb5imhf/v
         QwRw==
X-Gm-Message-State: AC+VfDxdjjiGqE3IqCUqqJRdl4adsueC2tuJZCQJw8aPui6HACOa2HAF
        2JUgmIOb22BAeMA7rjcSQbbiFw==
X-Google-Smtp-Source: ACHHUZ7sMGsEr9SbneUQPTQORdszf+GEZU/0ukBHco511nAb/TPu/Ofjc3gz+02n/peFhjVKBboI6Q==
X-Received: by 2002:a2e:9812:0:b0:2a8:c333:ebee with SMTP id a18-20020a2e9812000000b002a8c333ebeemr4608389ljj.49.1683039935425;
        Tue, 02 May 2023 08:05:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:05:34 -0700 (PDT)
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
Subject: [PATCH v2 1/9] drm/msm/dpu: fix SSPP register definitions
Date:   Tue,  2 May 2023 18:05:25 +0300
Message-Id: <20230502150533.3672840-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reorder SSPP register definitions to sort them in the ascending order.
Move register bitfields after the register definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 66 +++++++++++----------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6b68ec5c7a5a..1bf717290dab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -26,45 +26,18 @@
 #define SSPP_SRC_FORMAT                    0x30
 #define SSPP_SRC_UNPACK_PATTERN            0x34
 #define SSPP_SRC_OP_MODE                   0x38
-
-/* SSPP_MULTIRECT*/
-#define SSPP_SRC_SIZE_REC1                 0x16C
-#define SSPP_SRC_XY_REC1                   0x168
-#define SSPP_OUT_SIZE_REC1                 0x160
-#define SSPP_OUT_XY_REC1                   0x164
-#define SSPP_SRC_FORMAT_REC1               0x174
-#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
-#define SSPP_SRC_OP_MODE_REC1              0x17C
-#define SSPP_MULTIRECT_OPMODE              0x170
-#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
-#define SSPP_EXCL_REC_SIZE_REC1            0x184
-#define SSPP_EXCL_REC_XY_REC1              0x188
-
-#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
-#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
-#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
-#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
-#define MDSS_MDP_OP_IGC_EN                 BIT(16)
-#define MDSS_MDP_OP_FLIP_UD                BIT(14)
-#define MDSS_MDP_OP_FLIP_LR                BIT(13)
-#define MDSS_MDP_OP_BWC_EN                 BIT(0)
-#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
-#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
-#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
-#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
-
 #define SSPP_SRC_CONSTANT_COLOR            0x3c
 #define SSPP_EXCL_REC_CTL                  0x40
 #define SSPP_UBWC_STATIC_CTRL              0x44
-#define SSPP_FETCH_CONFIG                  0x048
+#define SSPP_FETCH_CONFIG                  0x48
 #define SSPP_DANGER_LUT                    0x60
 #define SSPP_SAFE_LUT                      0x64
 #define SSPP_CREQ_LUT                      0x68
 #define SSPP_QOS_CTRL                      0x6C
-#define SSPP_DECIMATION_CONFIG             0xB4
 #define SSPP_SRC_ADDR_SW_STATUS            0x70
 #define SSPP_CREQ_LUT_0                    0x74
 #define SSPP_CREQ_LUT_1                    0x78
+#define SSPP_DECIMATION_CONFIG             0xB4
 #define SSPP_SW_PIX_EXT_C0_LR              0x100
 #define SSPP_SW_PIX_EXT_C0_TB              0x104
 #define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
@@ -81,11 +54,33 @@
 #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
 #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
 #define SSPP_TRAFFIC_SHAPER_REC1           0x158
+#define SSPP_OUT_SIZE_REC1                 0x160
+#define SSPP_OUT_XY_REC1                   0x164
+#define SSPP_SRC_XY_REC1                   0x168
+#define SSPP_SRC_SIZE_REC1                 0x16C
+#define SSPP_MULTIRECT_OPMODE              0x170
+#define SSPP_SRC_FORMAT_REC1               0x174
+#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
+#define SSPP_SRC_OP_MODE_REC1              0x17C
+#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
+#define SSPP_EXCL_REC_SIZE_REC1            0x184
+#define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
-#define SSPP_VIG_OP_MODE                   0x0
-#define SSPP_VIG_CSC_10_OP_MODE            0x0
-#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
+
+/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
+#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
+#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
+#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
+#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
+#define MDSS_MDP_OP_IGC_EN                 BIT(16)
+#define MDSS_MDP_OP_FLIP_UD                BIT(14)
+#define MDSS_MDP_OP_FLIP_LR                BIT(13)
+#define MDSS_MDP_OP_BWC_EN                 BIT(0)
+#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
+#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
+#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
+#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
 
 /* SSPP_QOS_CTRL */
 #define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
@@ -96,6 +91,7 @@
 #define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
 
 /* DPU_SSPP_SCALER_QSEED2 */
+#define SSPP_VIG_OP_MODE                   0x0
 #define SCALE_CONFIG                       0x04
 #define COMP0_3_PHASE_STEP_X               0x10
 #define COMP0_3_PHASE_STEP_Y               0x14
@@ -107,6 +103,12 @@
 #define COMP1_2_INIT_PHASE_Y               0x2C
 #define VIG_0_QSEED2_SHARP                 0x30
 
+/* DPU_SSPP_CSC_10BIT space */
+#define SSPP_VIG_CSC_10_OP_MODE            0x0
+
+/* SSPP_TRAFFIC_SHAPER and _REC1 */
+#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
+
 /*
  * Definitions for ViG op modes
  */
-- 
2.39.2

