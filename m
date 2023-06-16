Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22219732CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 12:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242043AbjFPKEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 06:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241336AbjFPKEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 06:04:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DE3194
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:35 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f640e48bc3so625920e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909873; x=1689501873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVnrBacbgYOCVyVrdR7kINyLrT4A5vOIthpoa7GXmKY=;
        b=K601sUu3uZkAHltlP4ftjKS5UCsByQqmG4GiLwFlK2yAT66126iMzSf56GTY7wosM3
         CoWlwM6y8LBigOzFcmmmwpTf/SoC6nG7onyRxgQQj1nCPT7vaxv9xUxpsHS7TYeJNcXf
         rtsUED3+vWeN1qmmhNyzXWmqaY+Magyai/ZVrFad0kri01hy1nNJFtoLgl7eWHuMCPfx
         aQhS8EY5lxj3lFdLA1HaUr6MmUrv+8OEM/EQyee3/PvvSX5cOGXg6H54pGCUMM1gGrDd
         Orr+n+lknQjR/fTMA4Si7YfiZ4EUnSoAEb7S+eZMuvxaQy4edoDJLdMtj5fw1TxV043Q
         TJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909873; x=1689501873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVnrBacbgYOCVyVrdR7kINyLrT4A5vOIthpoa7GXmKY=;
        b=SwEjW7s3iJBE1hXhOCyEfnJ+tjbElkX+sgm5Am/pl0CiZUSpibgeKbatyK5qmH5pNb
         AKI0KjuK8LEPZmMTBQj4k6btj/Xgb9R4VPEu45zKEFs9OtEkKuE0ZuAohUGXV6ibU4fl
         2shpC1M8D0MpHhsrHq1IeOkfuVfAkeRlGHuFDp1q7emSKNC//k0sMgBov/sHwoC5+sq5
         RwvhuFXSFGF907Kc90BG+aXrb5J/UsBQyatF1xNlSDPkDCyZ18ED6eVD8rzF1VM54iY8
         /0yswfC6VDLO4nFQlDRha7UbpxVd9zqatJgS9kg4GFC56JZ75751yWHsLJDwpftphCzs
         LISg==
X-Gm-Message-State: AC+VfDzWXb29toD7b6uX4tTZu0KFVK6UmFB7w42oK8nvEXlls6CNWLwW
        aAYDFQprR62Kous/r9HXZ+unGA==
X-Google-Smtp-Source: ACHHUZ5IuNpuV23iZGUWkl4by3I4uLJQWZ4t2uUKt9ogFp12kfX7qro7mHtVcdA48e+2cHr4AhvNqQ==
X-Received: by 2002:a19:6748:0:b0:4f3:a5da:119d with SMTP id e8-20020a196748000000b004f3a5da119dmr974522lfj.20.1686909872970;
        Fri, 16 Jun 2023 03:04:32 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:04:32 -0700 (PDT)
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
Subject: [PATCH v3 17/19] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
Date:   Fri, 16 Jun 2023 13:03:15 +0300
Message-Id: <20230616100317.500687-18-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  52 ++++++--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  53 ++++++--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  82 +++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  28 +++-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  15 ++-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  28 +++-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  15 ++-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  15 ++-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  41 ++++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 120 +++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  55 ++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  30 -----
 16 files changed, 545 insertions(+), 209 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a71a6cd532c0..d78cedd35c01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -243,18 +243,46 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 };
 
 static const struct dpu_intf_cfg msm8998_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_HDMI,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg msm8998_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index e1bdc0cc45cd..de26f469ebb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -257,18 +257,47 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sdm845_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5f20272cd5aa..c8c702e4f045 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -306,20 +306,47 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8150_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 7439f0279a3c..11bf4cec0f95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -313,27 +313,69 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sc8180x_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	},
 	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
-	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
-	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
+	{
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = 999,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_4", .id = INTF_4,
+		.base = 0x6c000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_5", .id = INTF_5,
+		.base = 0x6c800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_2,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sc8180x_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 60e71cbc5e27..bf35b5bf0cd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -306,20 +306,47 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_wb_cfg sm8250_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 904c758a60df..0f59e372cf3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -138,13 +138,27 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_wb_cfg sc7180_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 4236cd7317a1..f01eac27f405 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -94,10 +94,17 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg sm6115_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 82c04d2ce010..df4bf6510123 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -155,13 +155,27 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6350_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 35, INTF_SC7180_MASK,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 35, INTF_SC7180_MASK,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 35,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 35,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg sm6350_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index c6bf487e131b..cb486bea6628 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -91,10 +91,17 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg qcm2290_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 97de7a1f52b4..74dc032af7a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -104,10 +104,17 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6375_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg sm6375_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 108e35cbcd90..d5191a663ae1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -313,20 +313,47 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8350_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x2c4,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x2c4,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8350_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 7b5c9a77b102..d3a18048972f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -191,16 +191,37 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x2c4,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_5", .id = INTF_5,
+		.base = 0x39000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sc7280_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 062b17dedec7..9f94cc6369dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -328,35 +328,97 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
-	INTF_BLK("intf_4", INTF_4, 0x38000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
-	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17)),
-	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19)),
-	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_4", .id = INTF_4,
+		.base = 0x38000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_5", .id = INTF_5,
+		.base = 0x39000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_3,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_6", .id = INTF_6,
+		.base = 0x3a000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_2,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_7", .id = INTF_7,
+		.base = 0x3b000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_2,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_8", .id = INTF_8,
+		.base = 0x3c000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sc8280xp_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d92af1410c3e..517629c4a168 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -337,20 +337,47 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8450_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8450_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 32ffb9a9cfc7..ed1d1d4092e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -351,20 +351,47 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8550_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8550_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d2bca1ec0e63..6acd34e61aca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -463,36 +463,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.ctl = {.base = 0xF80, .len = 0x10},
 };
 
-/*************************************************************
- * INTF sub blocks config
- *************************************************************/
-#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = _len, \
-	.features = _features, \
-	.type = _type, \
-	.controller_id = _ctrl_id, \
-	.prog_fetch_lines_worst_case = _progfetch, \
-	.intr_underrun = _underrun, \
-	.intr_vsync = _vsync, \
-	.intr_tear_rd_ptr = -1, \
-	}
-
-/* DSI Interface sub-block with TEAR registers (since DPU 5.0.0) */
-#define INTF_BLK_DSI_TE(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync, _tear_rd_ptr) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = _len, \
-	.features = _features, \
-	.type = _type, \
-	.controller_id = _ctrl_id, \
-	.prog_fetch_lines_worst_case = _progfetch, \
-	.intr_underrun = _underrun, \
-	.intr_vsync = _vsync, \
-	.intr_tear_rd_ptr = _tear_rd_ptr, \
-	}
-
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
-- 
2.39.2

