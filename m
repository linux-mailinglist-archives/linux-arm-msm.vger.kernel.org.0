Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2CB735F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjFSVZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFSVZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:25:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96921E5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:36 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f76b6db73fso6027413e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687209935; x=1689801935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSixG5V7wyw8l4qWN62Go6OdE//p8oagRWGmxuKT3WI=;
        b=tBWf98uWLMRe/A8tLx0yupK7HYWFvtNl8tQRNxOyhZE+hIHpIbx2puHXvLpZSEsIud
         ft3hSYqsuIqEb1VgR8iLsgYAIxw0T42P9rtUIytiJKdmcaVR0Qw7ybdrBL+M/QnIhRpA
         N4QFx/SCJy5Pww2IDHc/fUMA0e8Ds+WEAHEewBLaUAZDEangu7JB8KqQ4nx34mx+pJ9S
         Ps4ablnyBIwxirKiI0EonlIeBG1geDP/8SumrO41pvjFLsfbZ7ubIbS/6nRAjPLROiMe
         FI0+ECqcNT5U+/QR9uVzxhtMiy3dpWl4kn2MiTFHaRqnN8DCi6SOOynGuMi73rZIKEQL
         N7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687209935; x=1689801935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSixG5V7wyw8l4qWN62Go6OdE//p8oagRWGmxuKT3WI=;
        b=fD/nEkwEACBeSd4A4SZYW/gvPgRQTI0nAMINFHw0xQgFjbISZAvVUBle8rj5MdHTKF
         hIvLVyrcuPpa8f3JQDIM5BE1iERMFyI38y5e/L9zVgn3O0LaWsqL0rrDRskqiuh+GfBD
         xsR8y7NCEgUHq2/oS+c6HAfn0cSBguH3+MUc7RSwujAK9Upzvu8o4nCJ1DbLK5u8XoXc
         yervdYBJg5BnzDIC8Jk0xmHu4RttkY7JyHEbdhbn8aYNKs0f+nJutXcwDB8HsX2a76Vf
         qzvV9BJBer9Q+H4/Rm7clS3xShj1kZPzEcHxyjL/c8KyLyFbXGBQvSWT2ak9YDwdSVPV
         dpWg==
X-Gm-Message-State: AC+VfDy1pCwMyMp5VWSgV2rdNIuWeQKTTZD0cee+AiHl5cg+K/cASsQI
        4xzT4lpLhByMJiNuoX6G8MbKGw==
X-Google-Smtp-Source: ACHHUZ5XmQRvNOwoGMouwE+/d4Z7AFs0Yq7X7ZlXxNLn/eCfNf7UGwGe21Kmmb6eIkzLy0+SA/2oxA==
X-Received: by 2002:a19:675b:0:b0:4f8:5ede:d453 with SMTP id e27-20020a19675b000000b004f85eded453mr2231359lfj.23.1687209934989;
        Mon, 19 Jun 2023 14:25:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 14:25:34 -0700 (PDT)
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
Subject: [PATCH v4 16/19] drm/msm/dpu: inline WB_BLK macros
Date:   Tue, 20 Jun 2023 00:25:16 +0300
Message-Id: <20230619212519.875673-17-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
 4 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index c8f4c6326a1a..9148d7da62e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -323,8 +323,18 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
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
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sm8250_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d7d117e3af36..904c758a60df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,8 +148,18 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
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
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b67010f336b..7b5c9a77b102 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -176,8 +176,18 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
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
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ea63ca358a4..d2bca1ec0e63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -493,24 +493,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
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

