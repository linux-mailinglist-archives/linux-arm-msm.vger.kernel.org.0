Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB5266544D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 07:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjAKGFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 01:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235758AbjAKGEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 01:04:22 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A469B1FD
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:11 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f34so21901814lfv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Shv6iQMdLrrAbEJWIxHL0Io3q/l+mzhtm4z/bTH6Dz8=;
        b=hrd1E1gZtT51BYzk5aArldIJug6cowbvDceQ4Iamapw2tzqNpBiqT6z4SYHWRTotSS
         zBTnu3Pjfx6IA2m6d4NEgO1h3IytivGCpm8qtI4dgfZQGtcQwLpjxaS5A2jzg520nKJ1
         otUU+PjTkKH8B5k5sX5T3F+XNAJIJop9FMCRWgXv4dfeaYFUCU88wGuE8IRi12kYHA3d
         pP4QxKp4rnUni2Yc1T9fJsyWUEVLbJnbuSTm98j3q5+5804NoWCsh959h/XmXYBIXq5a
         TMoH3A+eZ1HnmxNiYsZyY/MyIDMhiiuZh8T8hMsaCgJI187+n3XDs0TP5pnSjotd8nut
         R1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Shv6iQMdLrrAbEJWIxHL0Io3q/l+mzhtm4z/bTH6Dz8=;
        b=mySKEolbRm1K23lXH0aJm/sZHljsCjmGX59xxAnRqLESwxOjWGcLWVJAePBO6Hc28W
         /oe0IdcQlRpkd1EpH6ly/9HxB9O1ez9557mj2g/99tjYX106/HhPtm4AaApdWnkxc+gg
         fa52sAOpGlPgxQi+S/L8kVUkDKKMxDM/2VhWXYooxqpRLqAeDecAZlGFsn7uvnXML+fX
         ZKZbnGGg6r3Id4cWAytrSj7oQ7bqXY/JM86iCofwQMUIHcldKzoL6EYQ/XLP97RxjMdB
         W5kTmC+8RCYPFlZsKe/inrTLjRSY1wLvCWqZvC7enuerieRSKGkp48xJX4gWrUYtGBYY
         xWAw==
X-Gm-Message-State: AFqh2kqghdq5wFcYdKDXujI1JUNWs0YftxxCMjVcvXWkR2t5WrBS4k6N
        Vg4ycNRP+NYT7wH2nEJObEmYGw==
X-Google-Smtp-Source: AMrXdXve1v1tUrjjhrHM0IQX1KqlvynNm8cnak/B/A7M9JHWqOwKXF9Td67nu//gw2uIyEYZ/kx/fw==
X-Received: by 2002:a05:6512:32cc:b0:4ca:d81c:f172 with SMTP id f12-20020a05651232cc00b004cad81cf172mr20127327lfg.43.1673417051101;
        Tue, 10 Jan 2023 22:04:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Georgi Djakov <djakov@kernel.org>
Subject: [PATCH v3 10/12] clk: qcom: mmcc-apq8084: remove spdm clocks
Date:   Wed, 11 Jan 2023 08:04:00 +0200
Message-Id: <20230111060402.1168726-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
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

SPDM is used for debug/profiling and does not have any other
functionality. These clocks can safely be removed.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Suggested-by: Georgi Djakov <djakov@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-apq8084.c | 271 --------------------------------
 1 file changed, 271 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index fee7c767132d..631b1ff8cf01 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -2364,262 +2364,6 @@ static struct clk_branch mmss_rbcpr_clk = {
 	},
 };
 
-static struct clk_branch mmss_spdm_ahb_clk = {
-	.halt_reg = 0x0230,
-	.clkr = {
-		.enable_reg = 0x0230,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_ahb_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_axi_clk = {
-	.halt_reg = 0x0210,
-	.clkr = {
-		.enable_reg = 0x0210,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_axi_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_csi0_clk = {
-	.halt_reg = 0x023c,
-	.clkr = {
-		.enable_reg = 0x023c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_csi0_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_csi0_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_gfx3d_clk = {
-	.halt_reg = 0x022c,
-	.clkr = {
-		.enable_reg = 0x022c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_gfx3d_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_gfx3d_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_jpeg0_clk = {
-	.halt_reg = 0x0204,
-	.clkr = {
-		.enable_reg = 0x0204,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_jpeg0_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_jpeg0_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_jpeg1_clk = {
-	.halt_reg = 0x0208,
-	.clkr = {
-		.enable_reg = 0x0208,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_jpeg1_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_jpeg1_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_jpeg2_clk = {
-	.halt_reg = 0x0224,
-	.clkr = {
-		.enable_reg = 0x0224,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_jpeg2_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_jpeg2_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_mdp_clk = {
-	.halt_reg = 0x020c,
-	.clkr = {
-		.enable_reg = 0x020c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_mdp_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_mdp_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_pclk0_clk = {
-	.halt_reg = 0x0234,
-	.clkr = {
-		.enable_reg = 0x0234,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_pclk0_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_pclk0_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_pclk1_clk = {
-	.halt_reg = 0x0228,
-	.clkr = {
-		.enable_reg = 0x0228,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_pclk1_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_pclk1_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_vcodec0_clk = {
-	.halt_reg = 0x0214,
-	.clkr = {
-		.enable_reg = 0x0214,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_vcodec0_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_vcodec0_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_vfe0_clk = {
-	.halt_reg = 0x0218,
-	.clkr = {
-		.enable_reg = 0x0218,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_vfe0_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_vfe0_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_vfe1_clk = {
-	.halt_reg = 0x021c,
-	.clkr = {
-		.enable_reg = 0x021c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_vfe1_clk",
-			.parent_names = (const char *[]){
-				"mmss_spdm_vfe1_div_clk",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_rm_axi_clk = {
-	.halt_reg = 0x0304,
-	.clkr = {
-		.enable_reg = 0x0304,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_rm_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mmss_spdm_rm_ocmemnoc_clk = {
-	.halt_reg = 0x0308,
-	.clkr = {
-		.enable_reg = 0x0308,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mmss_spdm_rm_ocmemnoc_clk",
-			.parent_names = (const char *[]){
-				"ocmemnoc_clk_src",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-
 static struct clk_branch mmss_misc_ahb_clk = {
 	.halt_reg = 0x502c,
 	.clkr = {
@@ -3252,21 +2996,6 @@ static struct clk_regmap *mmcc_apq8084_clocks[] = {
 	[MDSS_VSYNC_CLK] = &mdss_vsync_clk.clkr,
 	[MMSS_RBCPR_AHB_CLK] = &mmss_rbcpr_ahb_clk.clkr,
 	[MMSS_RBCPR_CLK] = &mmss_rbcpr_clk.clkr,
-	[MMSS_SPDM_AHB_CLK] = &mmss_spdm_ahb_clk.clkr,
-	[MMSS_SPDM_AXI_CLK] = &mmss_spdm_axi_clk.clkr,
-	[MMSS_SPDM_CSI0_CLK] = &mmss_spdm_csi0_clk.clkr,
-	[MMSS_SPDM_GFX3D_CLK] = &mmss_spdm_gfx3d_clk.clkr,
-	[MMSS_SPDM_JPEG0_CLK] = &mmss_spdm_jpeg0_clk.clkr,
-	[MMSS_SPDM_JPEG1_CLK] = &mmss_spdm_jpeg1_clk.clkr,
-	[MMSS_SPDM_JPEG2_CLK] = &mmss_spdm_jpeg2_clk.clkr,
-	[MMSS_SPDM_MDP_CLK] = &mmss_spdm_mdp_clk.clkr,
-	[MMSS_SPDM_PCLK0_CLK] = &mmss_spdm_pclk0_clk.clkr,
-	[MMSS_SPDM_PCLK1_CLK] = &mmss_spdm_pclk1_clk.clkr,
-	[MMSS_SPDM_VCODEC0_CLK] = &mmss_spdm_vcodec0_clk.clkr,
-	[MMSS_SPDM_VFE0_CLK] = &mmss_spdm_vfe0_clk.clkr,
-	[MMSS_SPDM_VFE1_CLK] = &mmss_spdm_vfe1_clk.clkr,
-	[MMSS_SPDM_RM_AXI_CLK] = &mmss_spdm_rm_axi_clk.clkr,
-	[MMSS_SPDM_RM_OCMEMNOC_CLK] = &mmss_spdm_rm_ocmemnoc_clk.clkr,
 	[MMSS_MISC_AHB_CLK] = &mmss_misc_ahb_clk.clkr,
 	[MMSS_MMSSNOC_AHB_CLK] = &mmss_mmssnoc_ahb_clk.clkr,
 	[MMSS_MMSSNOC_BTO_AHB_CLK] = &mmss_mmssnoc_bto_ahb_clk.clkr,
-- 
2.39.0

