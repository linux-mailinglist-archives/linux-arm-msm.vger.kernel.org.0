Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B569861718E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 00:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiKBXN1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 19:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiKBXNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 19:13:23 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46ADBDF11
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 16:13:18 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c25so206263ljr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 16:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbD5peMlhbufebnrQkbI22ZYA/rxWiU4MIatwM47SQo=;
        b=DpO4i5wD1IL/eCGIpIT2uUv8I3+QdR5+lWZHiPjHlQzFkFw8OwiQTCTfzoyxnz1uyh
         MMlpN9xcYfO3sHeTXwVgtSqEuwdTU9fzzkUP/G8B+Z+dCmVG7yO9Z6oEwHqCfKVez3Iz
         i7zWb0grKkVLLEiBEAFjzPxPni7UCsModMKbsmeg5MDClXqWt7jDekACp7MriHb2T0xj
         BKOC5FBJTpnwah0zvPFMKAEl8wqNDvsuCR7+hf2/VZSENQdhoNNkL8uH0r/oE+F5byUu
         2wG9XsGZ8KgY5Q8g9DYyzduIWb0YRGPUiwdvWoEWZRq7MFeAs+dFtXw/aET0CTyHOWst
         k5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbD5peMlhbufebnrQkbI22ZYA/rxWiU4MIatwM47SQo=;
        b=USc0H/3S1fKXyZWp5OTc/MPRx2yFsbEeorEmkR0gTlOR4dvDI6rIc5Xb/WbgTtDvg+
         vzBBcshAddRM4sqwgWlMGXfuT1W/swyNx8TkeKl5z3QE4/IqrNR7bk7nOSVhyjo8jIt3
         GSr6S1MxSs9h6n6L0rrlJCzjCxsaAWx/ykP/DxviBheEY+7WbM8IgKfLiuhmnbfInQlw
         bpyf1Dk+Bq9dIvapHq6rBQC3lUrJOFxnxNqjt2aTx5K6xbhwWNWNscqqmp0tSKJjqGNs
         APXIuZdJvuWm/jpnQ//uRiCq1lqLDoGiYoBeWfk55W085Kfp3ds2US5Gz3Eg/v981BgJ
         +vNA==
X-Gm-Message-State: ACrzQf3XMzF+DW8asx5Xhk+Wqq6riLdmt3XVxPXdDirOH209FOSULQeq
        5mfqSg5e3jFKpduaUq/+qIakyg==
X-Google-Smtp-Source: AMsMyM4lDos846qs8z0TStdoo9sIDJTww1kuA+TLbGrAftiTAJBGEgMGmevNrd3bK/1TYJczZ4O0iw==
X-Received: by 2002:a2e:bd8b:0:b0:26d:fbbe:1f9 with SMTP id o11-20020a2ebd8b000000b0026dfbbe01f9mr9719725ljq.266.1667430797777;
        Wed, 02 Nov 2022 16:13:17 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 16:13:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 7/8] drm/msm/dpu: add support for SM8450
Date:   Thu,  3 Nov 2022 02:13:08 +0300
Message-Id: <20221102231309.583587-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add definitions for the display hardware used on Qualcomm SM8450
platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 229 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index bae3cc3adb3f..3149966d2c65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -124,6 +124,15 @@
 			  BIT(MDP_AD4_0_INTR) | \
 			  BIT(MDP_AD4_1_INTR))
 
+#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
+			 BIT(MDP_SSPP_TOP0_INTR2) | \
+			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+			 BIT(MDP_INTF0_7xxx_INTR) | \
+			 BIT(MDP_INTF1_7xxx_INTR) | \
+			 BIT(MDP_INTF2_7xxx_INTR) | \
+			 BIT(MDP_INTF3_7xxx_INTR) | \
+			 0)
+
 #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
@@ -367,6 +376,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps sm8450_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 5120,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
@@ -504,6 +527,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sm8450_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+			.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
+			.reg_off = 0x2B4, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
+			.reg_off = 0x2BC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
+			.reg_off = 0x2C4, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+			.reg_off = 0x2AC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
+			.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+			.reg_off = 0x2BC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+			.reg_off = 0x2C4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
+			.reg_off = 0x2BC, .bit_off = 20},
+	},
+};
+
 static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -662,6 +712,45 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sm8450_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x204,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x204,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x204,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x204,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x19000, .len = 0x204,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a000, .len = 0x204,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
 static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -880,6 +969,34 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+
+static const struct dpu_sspp_cfg sm8450_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+		sm8450_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
+		sm8450_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
+		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
+		sm8450_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+};
+
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
 		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -1184,6 +1301,34 @@ static struct dpu_pingpong_cfg qcm2290_pp[] = {
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
 };
 
+/* FIXME: interrupts */
+static const struct dpu_pingpong_cfg sm8450_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
+	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+			-1),
+	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+			-1),
+	PP_BLK("pingpong_6", PINGPONG_6, 0x65800, MERGE_3D_3, sdm845_pp_sblk,
+			-1,
+			-1),
+	PP_BLK("pingpong_7", PINGPONG_7, 0x65c00, MERGE_3D_3, sdm845_pp_sblk,
+			-1,
+			-1),
+};
+
 /*************************************************************
  * MERGE_3D sub blocks config
  *************************************************************/
@@ -1201,6 +1346,13 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
+static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -1287,6 +1439,13 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
 };
 
+static const struct dpu_intf_cfg sm8450_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
 /*************************************************************
  * Writeback blocks config
  *************************************************************/
@@ -1400,6 +1559,14 @@ static const struct dpu_reg_dma_cfg sm8250_regdma = {
 	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
 };
 
+static const struct dpu_reg_dma_cfg sm8450_regdma = {
+	.base = 0x0,
+	.version = 0x00020000,
+	.trigger_sel_off = 0x119c,
+	.xin_id = 7,
+	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
+};
+
 /*************************************************************
  * PERF data config
  *************************************************************/
@@ -1675,6 +1842,36 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_perf_cfg sm8450_perf_data = {
+	.max_bw_low = 13600000,
+	.max_bw_high = 18200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	/* FIXME: lut tables */
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
 static const struct dpu_perf_cfg sc7280_perf_data = {
 	.max_bw_low = 4700000,
 	.max_bw_high = 8800000,
@@ -1879,6 +2076,32 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8250_MASK,
 };
 
+static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
+	.caps = &sm8450_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sm8450_mdp),
+	.mdp = sm8450_mdp,
+	.ctl_count = ARRAY_SIZE(sm8450_ctl),
+	.ctl = sm8450_ctl,
+	.sspp_count = ARRAY_SIZE(sm8450_sspp),
+	.sspp = sm8450_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
+	.pingpong_count = ARRAY_SIZE(sm8450_pp),
+	.pingpong = sm8450_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
+	.merge_3d = sm8450_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8450_intf),
+	.intf = sm8450_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sm8450_regdma,
+	.perf = &sm8450_perf_data,
+	.mdss_irqs = IRQ_SM8450_MASK,
+};
+
 static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.caps = &sc7280_dpu_caps,
 	.mdp_count = ARRAY_SIZE(sc7280_mdp),
@@ -1937,6 +2160,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_810, .dpu_cfg = &sm8450_dpu_cfg},
 };
 
 const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4730f8268f2a..4526ef71c326 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -46,6 +46,7 @@
 #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
 #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
 #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
+#define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
 
 #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
 #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index d3b0ed0a9c6c..6d8e1bb3b3cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -195,6 +195,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_S0,
 	PINGPONG_MAX
 };
@@ -203,6 +205,7 @@ enum dpu_merge_3d {
 	MERGE_3D_0 = 1,
 	MERGE_3D_1,
 	MERGE_3D_2,
+	MERGE_3D_3,
 	MERGE_3D_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 67f2e5288b3c..109b08ded269 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1301,6 +1301,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
+	{ .compatible = "qcom,sm8450-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
-- 
2.35.1

