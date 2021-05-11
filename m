Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08D0379E1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhEKESh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhEKESd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:18:33 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36F7C061763
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:17:24 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so12450815oto.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8N3tN2fckCgjP85js9W7HPAr/3Fhk5WJY/qonrijbQ=;
        b=cKtG37BqcBJIyNgJMx/THp4kC845McIBrWUuVCfzJyo4oLCiUHolIY2CYpi/u474l7
         7RfZPjNk6TrA9xe5uFknrL+c9tCnb6iVxlRyIip7pbCF7gin/8KVObmxarbc/8NpSUP7
         U92Ic/S29sTJ47z1sIpPJ7AsXox4KrxFgJulPdExGWxEba23uc5IZj38oIXSHdPDNwji
         53PDdpL7opTGcfkADm+DKsmVMQbqWQWGBC/7vQff45ns9yORFuzF+a37b6pFweswbYvM
         7UH0HEe4vTMl3WTCuQMyLPM08HF1EFKA/8zjoyA+poS5l7IXXnCNm2lld4VeS0d2gcCa
         mzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8N3tN2fckCgjP85js9W7HPAr/3Fhk5WJY/qonrijbQ=;
        b=FbTYY3zEJmi/AoF3hYN/X4Mt0BUscHew2cc+a2tI8SEf9m3QkPPKqbrZ7UyKjO9jh6
         liqexq/zKr+aVIF0DrpaJ85aLdrbj44WXf0HjUyRijsKJd+g4dT9aHM0zcWkK1U4mlqt
         9U2fpS9XEpjK0j/+T2NvN/vlkB6fxnmF8pS63ajHJGo0F71bzrkxG60qjt4os/XcEN9g
         9qj9+zQjxIjEe75TYU0RLQsS3r/Q5xt0JaS9yRY7yQJu0bsv/a7Z088X9Rd64yhEXyVw
         ee5X7XU/I1LQCTeh225Gl2x3Xh7bzZf/0Mezmt4FQRVyeaULHfOSPtFQwFGmc7PN8WgF
         JIdQ==
X-Gm-Message-State: AOAM53185o27nDhBDdSJ5pRJ9M01F0IZ1GsWfPUtqJfoNVZ5fyfefNkn
        O6HxFOxnrPpd+ZKtelp4ao231g==
X-Google-Smtp-Source: ABdhPJy5EcLOTYKNDrAiqtauzeqdVYo0WveImjVSRLfGtBXQI0N4RvhRQMviDPQIf6SmaO1xhO6gtQ==
X-Received: by 2002:a9d:37e2:: with SMTP id x89mr25447731otb.352.1620706644317;
        Mon, 10 May 2021 21:17:24 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id v79sm1367168oia.14.2021.05.10.21.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:17:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: dispcc-sm8250: Add EDP clocks
Date:   Mon, 10 May 2021 23:17:19 -0500
Message-Id: <20210511041719.591969-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511041719.591969-1-bjorn.andersson@linaro.org>
References: <20210511041719.591969-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c              | 186 +++++++++++++++++-
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   9 +
 2 files changed, 193 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 12ef6f1d5c62..601c7c0ba483 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -26,6 +26,8 @@ enum {
 	P_DISP_CC_PLL1_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
 	P_DP_PHY_PLL_VCO_DIV_CLK,
+	P_EDP_PHY_PLL_LINK_CLK,
+	P_EDP_PHY_PLL_VCO_DIV_CLK,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
 	P_DSI1_PHY_PLL_OUT_BYTECLK,
@@ -134,6 +136,18 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .hw = &disp_cc_pll1.clkr.hw },
 };
 
+static const struct parent_map disp_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_EDP_PHY_PLL_LINK_CLK, 1 },
+	{ P_EDP_PHY_PLL_VCO_DIV_CLK, 2},
+};
+
+static const struct clk_parent_data disp_cc_parent_data_4[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "edp_phy_pll_link_clk" },
+	{ .fw_name = "edp_phy_pll_vco_div_clk" },
+};
+
 static const struct parent_map disp_cc_parent_map_5[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
@@ -158,6 +172,18 @@ static const struct clk_parent_data disp_cc_parent_data_6[] = {
 	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
 };
 
+static const struct parent_map disp_cc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+	/* { P_DISP_CC_PLL1_OUT_EVEN, 5 }, */
+};
+
+static const struct clk_parent_data disp_cc_parent_data_7[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+	/* { .hw = &disp_cc_pll1_out_even.clkr.hw }, */
+};
+
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
@@ -261,7 +287,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link1_clk_src = {
 		.name = "disp_cc_mdss_dp_link1_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -275,7 +301,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -318,6 +344,153 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	},
 };
 
+static struct clk_rcg2 disp_cc_mdss_edp_aux_clk_src = {
+	.cmd_rcgr = 0x228c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_edp_aux_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_edp_gtc_clk_src = {
+	.cmd_rcgr = 0x22a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_7,
+	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_edp_gtc_clk_src",
+		.parent_data = disp_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_edp_link_clk_src = {
+	.cmd_rcgr = 0x2270,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_edp_link_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_edp_pixel_clk_src = {
+	.cmd_rcgr = 0x2258,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_edp_pixel_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_branch disp_cc_mdss_edp_aux_clk = {
+	.halt_reg = 0x2078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2078,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_edp_aux_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_edp_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_edp_gtc_clk = {
+	.halt_reg = 0x207c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x207c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_edp_gtc_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_edp_gtc_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_edp_link_clk = {
+	.halt_reg = 0x2070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2070,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_edp_link_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_edp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
+	.halt_reg = 0x2074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2074,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_edp_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_edp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_edp_pixel_clk = {
+	.halt_reg = 0x206c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x206c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_edp_pixel_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_edp_pixel_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.cmd_rcgr = 0x2148,
 	.mnd_width = 0,
@@ -987,6 +1160,15 @@ static struct clk_regmap *disp_cc_sm8250_clocks[] = {
 	[DISP_CC_MDSS_DP_PIXEL2_CLK_SRC] = &disp_cc_mdss_dp_pixel2_clk_src.clkr,
 	[DISP_CC_MDSS_DP_PIXEL_CLK] = &disp_cc_mdss_dp_pixel_clk.clkr,
 	[DISP_CC_MDSS_DP_PIXEL_CLK_SRC] = &disp_cc_mdss_dp_pixel_clk_src.clkr,
+	[DISP_CC_MDSS_EDP_AUX_CLK] = &disp_cc_mdss_edp_aux_clk.clkr,
+	[DISP_CC_MDSS_EDP_AUX_CLK_SRC] = &disp_cc_mdss_edp_aux_clk_src.clkr,
+	[DISP_CC_MDSS_EDP_GTC_CLK] = &disp_cc_mdss_edp_gtc_clk.clkr,
+	[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = &disp_cc_mdss_edp_gtc_clk_src.clkr,
+	[DISP_CC_MDSS_EDP_LINK_CLK] = &disp_cc_mdss_edp_link_clk.clkr,
+	[DISP_CC_MDSS_EDP_LINK_CLK_SRC] = &disp_cc_mdss_edp_link_clk_src.clkr,
+	[DISP_CC_MDSS_EDP_LINK_INTF_CLK] = &disp_cc_mdss_edp_link_intf_clk.clkr,
+	[DISP_CC_MDSS_EDP_PIXEL_CLK] = &disp_cc_mdss_edp_pixel_clk.clkr,
+	[DISP_CC_MDSS_EDP_PIXEL_CLK_SRC] = &disp_cc_mdss_edp_pixel_clk_src.clkr,
 	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
 	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
 	[DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8250.h b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
index fdaca6ad5c85..ce001cbbc27f 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sm8250.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
@@ -55,6 +55,15 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC		45
 #define DISP_CC_PLL0				46
 #define DISP_CC_PLL1				47
+#define DISP_CC_MDSS_EDP_AUX_CLK		48
+#define DISP_CC_MDSS_EDP_AUX_CLK_SRC		49
+#define DISP_CC_MDSS_EDP_GTC_CLK		50
+#define DISP_CC_MDSS_EDP_GTC_CLK_SRC		51
+#define DISP_CC_MDSS_EDP_LINK_CLK		52
+#define DISP_CC_MDSS_EDP_LINK_CLK_SRC		53
+#define DISP_CC_MDSS_EDP_LINK_INTF_CLK		54
+#define DISP_CC_MDSS_EDP_PIXEL_CLK		55
+#define DISP_CC_MDSS_EDP_PIXEL_CLK_SRC		56
 
 /* DISP_CC Reset */
 #define DISP_CC_MDSS_CORE_BCR			0
-- 
2.29.2

