Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0143A668A7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 05:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbjAMEAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 23:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbjAMEAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 23:00:20 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8522263183
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 20:00:16 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id e22so5746827qts.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 20:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FDXhyDi7l1SPbqbcQCobScMfTSLVIuMdTxY+sas3Ig8=;
        b=S3tydDPU1O5M4gysKJENG4PKSqeeym1VIgiOr03ZRUI6T5xwPgCqGfqSykfd5pBeDp
         qc9+vrHjoGtte9NQyUkYdCpcKKG07GuPWYIIj6Nyg5lSA5ZNJQZTo3i8y70NYQNQdth2
         zOfL4KbzMWr3UyTfuajcNh09/zQ1f/1ul4rU0VEqsUF6Nk6l7Ls+GLjXqfj3YOC0Y68H
         W2Xxv+3jTajhKhEc0l2tLmcSOHgGWRTTWNHh1a1f3yuz9rPdw+l0B3xzo0ZcJmiWrQyf
         PJObPvZIipQOJ93lA8aB3EKsfqAyA4gvqhO9ZFHQQa3UklsCvJKcMd5okwtsA4raMk+z
         6iVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDXhyDi7l1SPbqbcQCobScMfTSLVIuMdTxY+sas3Ig8=;
        b=l6OBKy0G4VrNAv/hugHv7UNJEDzd4jgJf/Nd187vLMJaIg2dX3cl/6qH35pzDYhvsQ
         3mAao1MvW5eV9/qp/neprHolQq3H66GyNlxbnDK7ef8fr4uPvG22+3QbpBeCRtr2Rp5c
         NmKYwq8BE2Iw9aYm4rkbg+d7GbSH/MUabv9lNC1cBSsQX0951mslvNvshpCxrFE0oVsv
         t7FyPEHyurDoXxIDwSNzGJupTFhsnTy0ptKjSCfylWEdsHPoyhUht1V1TsfMIfF+SaYD
         uQtoZA75bkEBlOR7E24gqmMQXTRksvStd5dxtbImOJMC51kK2F71acHKqU3VQPfWKPEy
         sqMg==
X-Gm-Message-State: AFqh2kpEWXCGiT8aVuL4joc5Mzf8NaCkMKSm4AMPlqwXHt54I9/xsMsc
        PfH5z9hz+Q2TV4mEwqM7FJE=
X-Google-Smtp-Source: AMrXdXuNqq4RLKjEZJofrE4rEW+qAB1fta+8sE1ZnMo3QjWpazb91nfa2dD1v8go3/6bA1LYem33Sg==
X-Received: by 2002:ac8:4d07:0:b0:3ab:5f5f:a0de with SMTP id w7-20020ac84d07000000b003ab5f5fa0demr109774930qtv.28.1673582415608;
        Thu, 12 Jan 2023 20:00:15 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::e680])
        by smtp.gmail.com with ESMTPSA id j19-20020a05620a411300b00704c1f4e756sm11861052qko.14.2023.01.12.20.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 20:00:15 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Robert Foss <rfoss@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2] drm/msm/dpu: add hw revision 410
Date:   Thu, 12 Jan 2023 22:59:40 -0500
Message-Id: <20230113035939.185064-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 uses similar clocks (with one frequency added) to the
Snapdragon 845 but reports DPU revision 4.1.0. Add support for this DPU
with configuration from the Pixel 3a downstream kernel.

Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
Changes since v1:
 - proper use of DSC_BLK()

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0f3da480b066..56709d508a6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -504,6 +504,25 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sdm670_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x45C,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.highest_bank_bit = 0x1,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+			.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
+			.reg_off = 0x2B4, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+			.reg_off = 0x2AC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+			.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+			.reg_off = 0x2BC, .bit_off = 8},
+	},
+};
+
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -1154,6 +1173,11 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
 
+static const struct dpu_sspp_sub_blks sdm670_vig_sblk_0 =
+				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED3);
+static const struct dpu_sspp_sub_blks sdm670_vig_sblk_1 =
+				_VIG_SBLK("1", 5, DPU_SSPP_SCALER_QSEED3);
+
 #define SSPP_BLK(_name, _id, _base, _features, \
 		_sblk, _xinid, _type, _clkctrl) \
 	{ \
@@ -1185,6 +1209,19 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_cfg sdm670_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
+		sdm670_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
+		sdm670_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+};
+
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
 		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -1832,6 +1869,11 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
 	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
 };
 
+static struct dpu_dsc_cfg sdm670_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
+};
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -2533,6 +2575,30 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8250_MASK,
 };
 
+static const struct dpu_mdss_cfg sdm670_dpu_cfg = {
+	.caps = &sdm845_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sdm670_mdp),
+	.mdp = sdm670_mdp,
+	.ctl_count = ARRAY_SIZE(sdm845_ctl),
+	.ctl = sdm845_ctl,
+	.sspp_count = ARRAY_SIZE(sdm670_sspp),
+	.sspp = sdm670_sspp,
+	.mixer_count = ARRAY_SIZE(sdm845_lm),
+	.mixer = sdm845_lm,
+	.pingpong_count = ARRAY_SIZE(sdm845_pp),
+	.pingpong = sdm845_pp,
+	.dsc_count = ARRAY_SIZE(sdm670_dsc),
+	.dsc = sdm670_dsc,
+	.intf_count = ARRAY_SIZE(sdm845_intf),
+	.intf = sdm845_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sdm845_regdma,
+	.perf = &sdm845_perf_data,
+	.mdss_irqs = IRQ_SDM845_MASK,
+};
+
 static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.caps = &sdm845_dpu_caps,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
@@ -2840,6 +2906,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_301, .dpu_cfg = &msm8998_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_400, .dpu_cfg = &sdm845_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_401, .dpu_cfg = &sdm845_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_410, .dpu_cfg = &sdm670_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_500, .dpu_cfg = &sm8150_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_501, .dpu_cfg = &sm8150_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_510, .dpu_cfg = &sc8180x_dpu_cfg},
-- 
2.39.0

