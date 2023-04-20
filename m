Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2446E9CD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 22:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjDTUHs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 16:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbjDTUHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 16:07:47 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D5649F7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 13:07:44 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2a8bbea12d7so8166201fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682021263; x=1684613263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1uTE4+i8r9VPgRfBJUaK3oV/eLYdWsWpSI3+m7py0II=;
        b=mSUQcVHBuOHNL1LVhsUBKGXDwkPeVKnvyMvY0SxHhmZDosS46yGE67zawM4IxFv7QS
         8Es+lFOTsQ9TGSNV64s5DyB3/oRyZfPOYiBl4ZeK3j8gvdG8ctWmBCGJa3LJPxKNdxWj
         T4hVPwO7KQoOqtN1rWLHyYHWAzsGm13J99GNpSfTvS4q447Jo53Q5YmK6M2xeXWgxZ7M
         QIdy+Wax0Csqd+L+YlqsUMtxTFtdHjSIYske3sFny4IoyriTqE9bg3VACnsOPATrMOiK
         Ed4vijoNpxf/TviqFl41aQP/r9XER63mDzLi9lHOHk5ZZGAWpz0gm5s3WHKgP4Q/N0Vo
         El/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682021263; x=1684613263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uTE4+i8r9VPgRfBJUaK3oV/eLYdWsWpSI3+m7py0II=;
        b=K8T1WZAtFrqy77/LomhsGOxx/ssuiW2f7FQ9VKxbOYcUsNB7/5caJJnV7lZ14Lo9yl
         eNn/mKv3DRZCOhEgIBbzjwfCbuVwc5BTVwQkQCk7GXtyA5+MM31DeC+np1WfYSAA2/UX
         kfRJD8CmJxfWd25wfREfDngh1bAqBweaUT2oRQX3d4Is3xqUKTJMMJPVFfTYmtJj34sX
         TdHVUlrcXUIVYVqHihQJO85zniB/l0ppCC8y4GxVcoROR8b1AAXSJfEh7RcVvFj5SXCv
         rEHezE6TExlmRF7gkdMkDmY/PkbXulWQdKT97xBpYNuRw9r1s2dalB3DF9lcsFcKVuxx
         9vPA==
X-Gm-Message-State: AAQBX9dANDJLU71t8UcoHsTXFiJyrxh81Id0c3RgeMP/kkqgdDZV+I7X
        4XU5Nqgyxtg4cS+x3WTiyzfmCw==
X-Google-Smtp-Source: AKy350Z3B1sqRoFAm0yh5zYH5FXChdn3OYPHE2BNv3IfGVJEui4aWHgAHqFoFCfR3GDNSMDaM0zE8g==
X-Received: by 2002:a2e:998f:0:b0:2a7:6f82:4a87 with SMTP id w15-20020a2e998f000000b002a76f824a87mr24974lji.35.1682021263160;
        Thu, 20 Apr 2023 13:07:43 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q13-20020ac25a0d000000b004ec4f3810dcsm314551lfn.109.2023.04.20.13.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 13:07:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: drop the regdma configuration
Date:   Thu, 20 Apr 2023 23:07:42 +0300
Message-Id: <20230420200742.1200531-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The regdma is currently not used by the current driver. We have no way
to practically verify that the regdma is described correctly. Drop it
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  2 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  2 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  2 -
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  2 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 40 -------------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 18 ---------
 12 files changed, 78 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 2b3ae84057df..aa923fb2ebcb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -195,8 +195,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.intf = msm8998_intf,
 	.vbif_count = ARRAY_SIZE(msm8998_vbif),
 	.vbif = msm8998_vbif,
-	.reg_dma_count = 0,
-	.perf = &msm8998_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ceca741e93c9..63009435e258 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -193,8 +193,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.intf = sdm845_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &sdm845_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 282d410269ff..e17398f98734 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -220,8 +220,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.intf = sm8150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
 	.perf = &sm8150_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c57400265f28..d32f939e9c00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -198,8 +198,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.intf = sc8180x_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
 	.perf = &sc8180x_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 2c40229ea515..f49fc1690b71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -228,8 +228,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.vbif = sdm845_vbif,
 	.wb_count = ARRAY_SIZE(sm8250_wb),
 	.wb = sm8250_wb,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
 	.perf = &sm8250_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 8799ed757119..0a273ba8cf4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -143,8 +143,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.wb = sc7180_wb,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &sc7180_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index ca107ca8de46..865dc51d0fe5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -211,8 +211,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.intf = sm8350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9aab110b8c44..1ac7ad2ba0da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -202,8 +202,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 02a259b6b426..41c326fc3792 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -219,8 +219,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8450_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 9e403034093f..e60ebb6242e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -224,8 +224,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.intf = sm8550_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8550_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 03f162af1a50..57b3c495aeb5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -650,46 +650,6 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	},
 };
 
-static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
-	.base = 0x0,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sdm845_regdma = {
-	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
-};
-
-static const struct dpu_reg_dma_cfg sm8150_regdma = {
-	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
-};
-
-static const struct dpu_reg_dma_cfg sm8250_regdma = {
-	.base = 0x0,
-	.version = 0x00010002,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sm8350_regdma = {
-	.base = 0x400,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sm8450_regdma = {
-	.base = 0x0,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
 /*************************************************************
  * PERF data config
  *************************************************************/
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd56fd7..8d62c21b051a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -720,21 +720,6 @@ struct dpu_vbif_cfg {
 	u32 memtype_count;
 	u32 memtype[MAX_XIN_COUNT];
 };
-/**
- * struct dpu_reg_dma_cfg - information of lut dma blocks
- * @id                 enum identifying this block
- * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
- * @version            version of lutdma hw block
- * @trigger_sel_off    offset to trigger select registers of lutdma
- */
-struct dpu_reg_dma_cfg {
-	DPU_HW_BLK_INFO;
-	u32 version;
-	u32 trigger_sel_off;
-	u32 xin_id;
-	enum dpu_clk_ctrl_type clk_ctrl;
-};
 
 /**
  * Define CDP use cases
@@ -850,9 +835,6 @@ struct dpu_mdss_cfg {
 	u32 wb_count;
 	const struct dpu_wb_cfg *wb;
 
-	u32 reg_dma_count;
-	const struct dpu_reg_dma_cfg *dma_cfg;
-
 	u32 ad_count;
 
 	u32 dspp_count;
-- 
2.39.2

