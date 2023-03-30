Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 028B26D1155
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjC3VyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjC3VyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A716210431
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j11so26356771lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMEBLiPdJ3haB1+2LHlsrVKPzEDnDJyc5Et6Aw/Yink=;
        b=ZN4bW8NFkwnLBFLIl+xbRmyCh+YFImVAJrqIsVVg5C4gfWSKuXO3XFr6ceg8y/1lus
         jsZdRHpXvTPth+fpHuU4nQ/eUSem1GZACkhgpJiz3rwJUEhlf/NuNN3xdErxieoKb9Rh
         ufyOYGUMn5pUcu9gPU52TlowUHDDSW+bQ9JFqzIOXZP0DJL3+x0XYm4nhgxGcFozEEBX
         xW4Oxx2jiAzMYSqcABIdHQrq01T2f+mUL5NsepnfJ9jAiU+odkzLyo5PdShUX9Yuf7o+
         /KSF/ekXqEFPPHG5y5V0Khdife2aKZ2MR+IxGWjdKIdRPNX2tOdC0B48h1CVkB6oOl+o
         kHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMEBLiPdJ3haB1+2LHlsrVKPzEDnDJyc5Et6Aw/Yink=;
        b=dS3kBXY4376TqAy1bm5moQFTDDigHtJnoY2mL/wvWmocXmcNWlZ/ENJ86Q10iiXsEn
         EYMvRT0nwAzNXmLcgf14TUgll3BXdneCHOEAyCL8Xf1ISemcgQQ6YHyNOl2PfsVytLs0
         ktrQasPiQitI1rxu9ozv8cqz9WFuVgNAxX9Jg2OXvyMVqBX658OFkrmP8Dbz0tSdJnzL
         i7hhl3VEyD4XsJXTdxOtUWPNnWOx5xpkDC1tnllfpJ67TFLtomdoXH/nqwcMIe6gW+MQ
         7Zdkwyhqt7jzkTVmbv1R1QsatEYoKhfFtDsPbq7TL+VVLz2WoeWSeHcoqRd7yAjgPU8/
         ftEA==
X-Gm-Message-State: AAQBX9ce+ZtiH86pHmxEgJuVdNuGSuw0eHoq69GiLoyUd0n50DBlEUH0
        jvCQn0JDaSFmju+O5ZX5sUwFOQ==
X-Google-Smtp-Source: AKy350bJaYSfGqbDHc6FBVmqipyO5HFiyMf0qr37cB83iBCNUoUjHzJYbvevHYwKceY2ZFIKtDqHIQ==
X-Received: by 2002:a19:ee18:0:b0:4e1:5d87:330c with SMTP id g24-20020a19ee18000000b004e15d87330cmr6675465lfb.50.1680213258194;
        Thu, 30 Mar 2023 14:54:18 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 31/38] drm/msm/dpu: deduplicate sc8280xp with sm8450
Date:   Fri, 31 Mar 2023 00:53:17 +0300
Message-Id: <20230330215324.1853304-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove duplicate between sc8280xp and sm8450, which belong to the same
DPU major revision.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 107 ++---------------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 112 ++----------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |  99 ++++++++++++++++
 3 files changed, 119 insertions(+), 199 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index a3c9de34307c..4ce3f0fe2170 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -7,17 +7,7 @@
 #ifndef _DPU_8_0_SC8280XP_H
 #define _DPU_8_0_SC8280XP_H
 
-static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 11,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = 5120,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
+#include "dpu_8_lm6.h"
 
 static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_40,
@@ -25,63 +15,6 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 	.ubwc_swizzle = 6,
 };
 
-static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
-};
-
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
-static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
-	},
-	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
-	},
-};
-
 static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x2ac, VIG_SC7180_MASK,
 		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -101,26 +34,6 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
-static const struct dpu_lm_cfg sc8280xp_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
-};
-
-static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-};
-
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
@@ -183,18 +96,18 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
 };
 
 static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
-	.caps = &sc8280xp_dpu_caps,
+	.caps = &dpu_8_lm6_dpu_caps,
 	.ubwc = &sc8280xp_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
-	.mdp = sc8280xp_mdp,
-	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
-	.ctl = sc8280xp_ctl,
+	.mdp_count = ARRAY_SIZE(dpu_8_lm6_mdp),
+	.mdp = dpu_8_lm6_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_8_lm6_ctl),
+	.ctl = dpu_8_lm6_ctl,
 	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),
 	.sspp = sc8280xp_sspp,
-	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
-	.mixer = sc8280xp_lm,
-	.dspp_count = ARRAY_SIZE(sc8280xp_dspp),
-	.dspp = sc8280xp_dspp,
+	.mixer_count = ARRAY_SIZE(dpu_8_lm6_lm),
+	.mixer = dpu_8_lm6_lm,
+	.dspp_count = ARRAY_SIZE(dpu_8_lm6_dspp),
+	.dspp = dpu_8_lm6_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a1061881f039..de4989c8d307 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -7,17 +7,7 @@
 #ifndef _DPU_8_1_SM8450_H
 #define _DPU_8_1_SM8450_H
 
-static const struct dpu_caps sm8450_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = 5120,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
+#include "dpu_8_lm6.h"
 
 static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_40,
@@ -25,63 +15,6 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 	.ubwc_swizzle = 0x6,
 };
 
-static const struct dpu_mdp_cfg sm8450_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
-};
-
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
-static const struct dpu_ctl_cfg sm8450_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
-	},
-	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
-	},
-};
-
 static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -101,31 +34,6 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
-static const struct dpu_lm_cfg sm8450_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
-};
-
-static const struct dpu_dspp_cfg sm8450_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-};
 /* FIXME: interrupts */
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -199,18 +107,18 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
 };
 
 static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
-	.caps = &sm8450_dpu_caps,
+	.caps = &dpu_8_lm6_dpu_caps,
 	.ubwc = &sm8450_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8450_mdp),
-	.mdp = sm8450_mdp,
-	.ctl_count = ARRAY_SIZE(sm8450_ctl),
-	.ctl = sm8450_ctl,
+	.mdp_count = ARRAY_SIZE(dpu_8_lm6_mdp),
+	.mdp = dpu_8_lm6_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_8_lm6_ctl),
+	.ctl = dpu_8_lm6_ctl,
 	.sspp_count = ARRAY_SIZE(sm8450_sspp),
 	.sspp = sm8450_sspp,
-	.mixer_count = ARRAY_SIZE(sm8450_lm),
-	.mixer = sm8450_lm,
-	.dspp_count = ARRAY_SIZE(sm8450_dspp),
-	.dspp = sm8450_dspp,
+	.mixer_count = ARRAY_SIZE(dpu_8_lm6_lm),
+	.mixer = dpu_8_lm6_lm,
+	.dspp_count = ARRAY_SIZE(dpu_8_lm6_dspp),
+	.dspp = dpu_8_lm6_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8450_pp),
 	.pingpong = sm8450_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
new file mode 100644
index 000000000000..3cd3b274534f
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_8_LM6_H
+#define _DPU_8_LM6_H
+
+static const struct dpu_caps dpu_8_lm6_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 11,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 5120,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg dpu_8_lm6_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x204,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x204,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x19000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_lm_cfg dpu_8_lm6_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg dpu_8_lm6_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+#endif
-- 
2.39.2

