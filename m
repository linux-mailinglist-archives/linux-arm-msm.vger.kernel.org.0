Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF3F17219CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 22:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjFDUf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 16:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbjFDUfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 16:35:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48BECE
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 13:35:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f60bc818d7so4314002e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685910953; x=1688502953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCLXePxERvq86+Zs+yX8n37Qh/q5MYX1XV0rFQ6sNaM=;
        b=thONv6QQxbcoyGnYkCHiYSdkf+OCQZ++EDGoN3vWaZMb6Mo1Anyb+5F3+Ohl1HGJ34
         QhOSwDOdn8l0Y8bBHSNFh1Y+0h1QEzp3TRZNW176wAxmetr18X+ppkUkZ2lHZm1uU2uF
         4o1f4DTgw+m6JS9Mhq1h91r3lfEoROKdAztdllykwxPYmpzGTzX9DxpxfW8++WtjtPEC
         Yk2ZfW5f7AkYMi9YWZA5vCgCXBG0XU7tv9Xrkr6VtmfmxIR/BArayFeTJNXpm56dVEDd
         DLAXJEzzz0yegc6EzNaSPcj8/hLje5eiM3CJAoFr7fycaO58X1qNWtsCCIGaCACDTQjj
         gKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910953; x=1688502953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCLXePxERvq86+Zs+yX8n37Qh/q5MYX1XV0rFQ6sNaM=;
        b=gPMB3b2SLJgCym9SWDZX97kVKJ90/l9XaaAZYsTEle5XrlABXLnDLbuSNO7ZETLYX4
         V+4EaJVSW5iwVZ85iC0SD9Xu/8FIC5toQC8JtRR6BjYqUF0WXRz01DJ2mESDYxiqwkPQ
         3DHUIb/2BZ5O0a/Frv1KrmJLisuxqSvluQunKo93leazwl0LeJDJKTfcyMlmdRDwh2cR
         R1T3tV6N7a1MRd0wM463DN9ZMllH+hIJoLPgdbBeamjbvfpMJS87lGO8tpJyMHzrmKnN
         JLigoFsa9Hvbqumz8rnODYQd2Xv8NMmUOLnyi8qZDC+0QGcaEZ0T8ofY0W8HC2r2ZMcg
         JEZg==
X-Gm-Message-State: AC+VfDxZ7gQmjEXyCYJdpHUan1zGwWMjvjUMQMXR/r0R0KkWabbIheUD
        1Yxz6SCuYmO9J9UQRPUIZiNl9g==
X-Google-Smtp-Source: ACHHUZ5BBkh0/QS4B/mdI0nN5HrtHtNMnbRD4y+NGJZ6D0uT9ovroKAflOnWzP7R2Vvl1fqjYCZwKQ==
X-Received: by 2002:ac2:4ace:0:b0:4f4:cebe:a7a3 with SMTP id m14-20020ac24ace000000b004f4cebea7a3mr5242792lfp.30.1685910953365;
        Sun, 04 Jun 2023 13:35:53 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 13:35:52 -0700 (PDT)
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
Subject: [PATCH 18/22] drm/msm/dpu: inline WB_BLK macros
Date:   Sun,  4 Jun 2023 23:35:28 +0300
Message-Id: <20230604203532.1094249-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
 4 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 21d1163773cd..28ebf4ebad93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -347,8 +347,18 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 };
 
 static const struct dpu_wb_cfg sm8250_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_fix = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sm8250_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 11b2e94fd872..560efe681679 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -151,8 +151,18 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 };
 
 static const struct dpu_wb_cfg sc7180_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_fix = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index d06acf6b77e8..6f4ba8181ec8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -169,8 +169,18 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_fix = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 62ac877b6fa3..0a46b8b2df90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -479,24 +479,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_tear_rd_ptr = _tear_rd_ptr, \
 	}
 
-/*************************************************************
- * Writeback blocks config
- *************************************************************/
-#define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
-		__xin_id, vbif_id, _reg, _max_linewidth, _wb_done_bit) \
-	{ \
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x2c8, \
-	.features = _features, \
-	.format_list = wb2_formats, \
-	.num_formats = ARRAY_SIZE(wb2_formats), \
-	.clk_ctrl = _clk_ctrl, \
-	.xin_id = __xin_id, \
-	.vbif_idx = vbif_id, \
-	.maxlinewidth = _max_linewidth, \
-	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
-	}
-
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
-- 
2.39.2

