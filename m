Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012FA1AF9EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2020 14:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgDSMR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Apr 2020 08:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726055AbgDSMRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Apr 2020 08:17:46 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02203C03C1A6
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 05:17:45 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b11so8528091wrs.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 05:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=duFjY6orTON38YdA1wRefbQvwgBfYwhpSH60FmZtA9o=;
        b=yitPPNJgRJo5rjAzY1YtBmZ9n2Dq2MZyL8QqNtlPumNNTk/SvKrGAYEfrmdGXg34c7
         8mYh4f0C5Lamh/Fe/zJBW31JMZZMCu3r1Yd/R3tJpMnVgt2aMV9GJO2IW+aBqLnGflxs
         h0oKxvrZnUjLVlxX3bkFIB6n1QwWXhkT5ItqYRg7omFYOAOr74wTbrLSrqb28IZrTc/p
         YtkOSRVEbcuPFJCue/6ABeuu+SW63DFQUHO5MtZzjwOVvcdt4kDquA9uLT6GCcovhNR5
         gDKCBjhVQJdTHY3GRf06qvO+AorlGhac04sNxZnXK0ncTkBDFeYjhABfll0TqEM58rmu
         Ku8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=duFjY6orTON38YdA1wRefbQvwgBfYwhpSH60FmZtA9o=;
        b=Nzg7plP237IaStB2m4ykNWd56Kkhv0pOoA6u2UJmOaB5Ewe0OYIFWCIIYSgN0ozbgN
         J7lWsrtsfMwJRthSefkPvAYH7diOEKwN51D7QMcbIKDV4RBQFdfkzw3tI8ZUuTsvO/m2
         gqjqKkQ7TLa8cpdbGx1DlF9YAFH/GNVU1lEf1fwoUU55s3OvLOUZAkLdLIdl13yxF2p3
         YEIjr0hig1ZWLkhMthyHcCtWZA5a5WDE4UfjllbP2ZDDcKqehkYQOwsLOg6OJmMxMEZj
         HERr7NHsXfyL6ErARRQuz+yc6vJAK2s3EZfrTw+C/4FgDj/xuOwb3D/TMp4o66yT3I/r
         /CWQ==
X-Gm-Message-State: AGi0Pubv2voZI7jKjy9Xh+3hKYmnzt9Fd4+I78mlBxPTx6O5CQWrBG9t
        fvvfFy0YTuWhnVD1ZdPh6D7Ivg==
X-Google-Smtp-Source: APiQypJiJQ5mK3z+C8QPQYg/K+LMG4pljAdgYbdaJlX1E66BlOxt2OlJwKpcYkpvs/+53uHJs5lqKg==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr12797810wrv.87.1587298663494;
        Sun, 19 Apr 2020 05:17:43 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm22048193wro.9.2020.04.19.05.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 05:17:42 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 3/3] clk: qcom: gcc-msm8939: Make silicon specific updates for msm8939
Date:   Sun, 19 Apr 2020 13:18:08 +0100
Message-Id: <20200419121808.440780-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419121808.440780-1-bryan.odonoghue@linaro.org>
References: <20200419121808.440780-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm8939 is based on the msm8916. It is compatible in several ways but,
has additional functional blocks added which require additional PLL
sources. In some cases functional blocks from the msm8916 have different
clock sources or different supported frequencies.

This patch encapsulates the conversion from msm8916 to msm8939.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 832 ++++++++++++++++++++++++++++-----
 1 file changed, 709 insertions(+), 123 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 38f492a26766..c1fdc43f87d3 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -43,6 +43,14 @@ enum {
 	P_GPLL1_AUX,
 	P_GPLL2,
 	P_GPLL2_AUX,
+	P_GPLL3,
+	P_GPLL3_AUX,
+	P_GPLL4,
+	P_GPLL5,
+	P_GPLL5_AUX,
+	P_GPLL5_EARLY,
+	P_GPLL6,
+	P_GPLL6_AUX,
 	P_SLEEP_CLK,
 	P_DSI0_PHYPLL_BYTE,
 	P_DSI0_PHYPLL_DSI,
@@ -73,18 +81,32 @@ static const char * const gcc_xo_gpll0_bimc[] = {
 	"bimc_pll_vote",
 };
 
-static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2a_map[] = {
+static const struct parent_map gcc_xo_gpll0_gpll6a_map[] = {
 	{ P_XO, 0 },
-	{ P_GPLL0_AUX, 3 },
-	{ P_GPLL1, 1 },
-	{ P_GPLL2_AUX, 2 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL6_AUX, 2 },
 };
 
-static const char * const gcc_xo_gpll0a_gpll1_gpll2a[] = {
+static const char * const gcc_xo_gpll0_gpll6a[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll6_vote",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll2a_gpll3_gpll6a_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2_AUX, 4 },
+	{ P_GPLL3, 2 },
+	{ P_GPLL6_AUX, 3 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2a_gpll3_gpll6a[] = {
 	"xo",
 	"gpll0_vote",
-	"gpll1_vote",
 	"gpll2_vote",
+	"gpll3_vote",
+	"gpll6_vote",
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll2_map[] = {
@@ -99,6 +121,20 @@ static const char * const gcc_xo_gpll0_gpll2[] = {
 	"gpll2_vote",
 };
 
+static const struct parent_map gcc_xo_gpll0_gpll2_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 3 },
+	{ P_GPLL4, 2 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2_gpll4[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll2_vote",
+	"gpll4_vote",
+};
+
 static const struct parent_map gcc_xo_gpll0a_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_AUX, 2 },
@@ -123,6 +159,22 @@ static const char * const gcc_xo_gpll0_gpll1a_sleep[] = {
 	"sleep_clk",
 };
 
+static const struct parent_map gcc_xo_gpll0_gpll1a_gpll6_sleep_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL1_AUX, 2 },
+	{ P_GPLL6, 2 },
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const char * const gcc_xo_gpll0_gpll1a_gpll6_sleep[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll1_vote",
+	"gpll6_vote",
+	"sleep_clk",
+};
+
 static const struct parent_map gcc_xo_gpll0_gpll1a_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
@@ -157,16 +209,22 @@ static const char * const gcc_xo_gpll0a_dsibyte[] = {
 	"dsi0pllbyte",
 };
 
-static const struct parent_map gcc_xo_gpll0_dsiphy_map[] = {
+static const struct parent_map gcc_xo_gpll1_dsiphy_gpll6_gpll3a_gpll0a_map[] = {
 	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
+	{ P_GPLL1, 1 },
 	{ P_DSI0_PHYPLL_DSI, 2 },
+	{ P_GPLL6, 3 },
+	{ P_GPLL3_AUX, 4 },
+	{ P_GPLL0_AUX, 5 },
 };
 
-static const char * const gcc_xo_gpll0_dsiphy[] = {
+static const char * const gcc_xo_gpll1_dsiphy_gpll6_gpll3a_gpll0a[] = {
 	"xo",
-	"gpll0_vote",
+	"gpll1_vote",
 	"dsi0pll",
+	"gpll6_vote",
+	"gpll3_vote",
+	"gpll0_vote",
 };
 
 static const struct parent_map gcc_xo_gpll0a_dsiphy_map[] = {
@@ -181,18 +239,20 @@ static const char * const gcc_xo_gpll0a_dsiphy[] = {
 	"dsi0pll",
 };
 
-static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2_map[] = {
+static const struct parent_map gcc_xo_gpll0_gpll5a_gpll6_bimc_map[] = {
 	{ P_XO, 0 },
-	{ P_GPLL0_AUX, 1 },
-	{ P_GPLL1, 3 },
-	{ P_GPLL2, 2 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL5_AUX, 3 },
+	{ P_GPLL6, 2 },
+	{ P_BIMC, 4 },
 };
 
-static const char * const gcc_xo_gpll0a_gpll1_gpll2[] = {
+static const char * const gcc_xo_gpll0_gpll5a_gpll6_bimc[] = {
 	"xo",
 	"gpll0_vote",
-	"gpll1_vote",
-	"gpll2_vote",
+	"gpll5_vote",
+	"gpll6_vote",
+	"bimc_pll_vote",
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll1_sleep_map[] = {
@@ -265,11 +325,36 @@ static const char * const gcc_xo_gpll1_emclk_sleep[] = {
 	"sleep_clk",
 };
 
+static const struct parent_map gcc_xo_gpll6_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL6, 1 },
+	{ P_GPLL0, 2 },
+};
+
+static const char * const gcc_xo_gpll6_gpll0[] = {
+	"xo",
+	"gpll6_vote",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_xo_gpll6_gpll0a_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL6, 1 },
+	{ P_GPLL0_AUX, 2 },
+};
+
+static const char * const gcc_xo_gpll6_gpll0a[] = {
+	"xo",
+	"gpll6_vote",
+	"gpll0_vote",
+};
+
+/* GPLL0 @ 800 MHz */
 static struct clk_pll gpll0 = {
 	.l_reg = 0x21004,
 	.m_reg = 0x21008,
 	.n_reg = 0x2100c,
-	.config_reg = 0x21014,
+	.config_reg = 0x21010,
 	.mode_reg = 0x21000,
 	.status_reg = 0x2101c,
 	.status_bit = 17,
@@ -292,11 +377,12 @@ static struct clk_regmap gpll0_vote = {
 	},
 };
 
+/* GPLL1 @ 614.4 MHz */
 static struct clk_pll gpll1 = {
 	.l_reg = 0x20004,
 	.m_reg = 0x20008,
 	.n_reg = 0x2000c,
-	.config_reg = 0x20014,
+	.config_reg = 0x20010,
 	.mode_reg = 0x20000,
 	.status_reg = 0x2001c,
 	.status_bit = 17,
@@ -319,11 +405,12 @@ static struct clk_regmap gpll1_vote = {
 	},
 };
 
+/* GPLL2 @ 930 MHz */
 static struct clk_pll gpll2 = {
 	.l_reg = 0x4a004,
 	.m_reg = 0x4a008,
 	.n_reg = 0x4a00c,
-	.config_reg = 0x4a014,
+	.config_reg = 0x4a010,
 	.mode_reg = 0x4a000,
 	.status_reg = 0x4a01c,
 	.status_bit = 17,
@@ -346,11 +433,12 @@ static struct clk_regmap gpll2_vote = {
 	},
 };
 
+/* BIMC @ Variable frequency */
 static struct clk_pll bimc_pll = {
 	.l_reg = 0x23004,
 	.m_reg = 0x23008,
 	.n_reg = 0x2300c,
-	.config_reg = 0x23014,
+	.config_reg = 0x23010,
 	.mode_reg = 0x23000,
 	.status_reg = 0x2301c,
 	.status_bit = 17,
@@ -373,14 +461,155 @@ static struct clk_regmap bimc_pll_vote = {
 	},
 };
 
+/* GPLL3 @ 1100 MHz, main output enabled. */
+static struct clk_pll gpll3 = {
+	.l_reg = 0x22004,
+	.m_reg = 0x22008,
+	.n_reg = 0x2200c,
+	.config_reg = 0x22010,
+	.mode_reg = 0x22000,
+	.status_reg = 0x2201c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll3",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll3_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(4),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll3_vote",
+		.parent_names = (const char *[]){ "gpll3" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static const struct pll_config gpll3_config = {
+	.l = 57,
+	.m = 7,
+	.n = 24,
+	.vco_val = 0x0,
+	.vco_mask = BIT(20),
+	.pre_div_val = 0x0,
+	.pre_div_mask = BIT(12),
+	.post_div_val = 0x0,
+	.post_div_mask = BIT(9) | BIT(8),
+	.mn_ena_mask = BIT(24),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+};
+
+/* GPLL4 @ 1200 MHz, main output enabled. */
+static struct clk_pll gpll4 = {
+	.l_reg = 0x24004,
+	.m_reg = 0x24008,
+	.n_reg = 0x2400c,
+	.config_reg = 0x24010,
+	.mode_reg = 0x24000,
+	.status_reg = 0x2401c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll4_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(5),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll4_vote",
+		.parent_names = (const char *[]){ "gpll4" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct pll_config gpll4_config = {
+	.l = 62,
+	.m = 1,
+	.n = 2,
+	.vco_val = 0x0,
+	.vco_mask = BIT(20),
+	.pre_div_val = 0x0,
+	.pre_div_mask = BIT(12),
+	.post_div_val = 0x0,
+	.post_div_mask = BIT(9) | BIT(8),
+	.mn_ena_mask = BIT(24),
+	.main_output_mask = BIT(0),
+};
+
+/* GPLL5 @ Variable frequency */
+static struct clk_pll gpll5 = {
+	.l_reg = 0x25004,
+	.m_reg = 0x25008,
+	.n_reg = 0x2500c,
+	.config_reg = 0x25010,
+	.mode_reg = 0x25000,
+	.status_reg = 0x2501c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll5",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll5_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(6),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll5_vote",
+		.parent_names = (const char *[]){ "gpll5" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+/* GPLL6 @ 1080 MHz */
+static struct clk_pll gpll6 = {
+	.l_reg = 0x37004,
+	.m_reg = 0x37008,
+	.n_reg = 0x3700c,
+	.config_reg = 0x37010,
+	.mode_reg = 0x37000,
+	.status_reg = 0x3701c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll6_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(7),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll6_vote",
+		.parent_names = (const char *[]){ "gpll6" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
 static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	.cmd_rcgr = 0x27000,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
+	.parent_map = gcc_xo_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcnoc_bfdcd_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -388,10 +617,10 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 	.cmd_rcgr = 0x26004,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
+	.parent_map = gcc_xo_gpll0_gpll6a_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_bfdcd_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
+		.parent_names = gcc_xo_gpll0_gpll6a,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -472,28 +701,29 @@ static struct clk_rcg2 csi1_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_oxili_gfx3d_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
-	F(50000000, P_GPLL0_AUX, 16, 0, 0),
-	F(80000000, P_GPLL0_AUX, 10, 0, 0),
-	F(100000000, P_GPLL0_AUX, 8, 0, 0),
-	F(160000000, P_GPLL0_AUX, 5, 0, 0),
-	F(177780000, P_GPLL0_AUX, 4.5, 0, 0),
-	F(200000000, P_GPLL0_AUX, 4, 0, 0),
-	F(266670000, P_GPLL0_AUX, 3, 0, 0),
-	F(294912000, P_GPLL1, 3, 0, 0),
-	F(310000000, P_GPLL2, 3, 0, 0),
-	F(400000000, P_GPLL0_AUX, 2, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(220000000, P_GPLL3, 5, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
+	F(310000000, P_GPLL2_AUX, 3, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	F(465000000, P_GPLL2_AUX, 2, 0, 0),
+	F(550000000, P_GPLL3, 2, 0, 0),
 	{ }
 };
 
 static struct clk_rcg2 gfx3d_clk_src = {
 	.cmd_rcgr = 0x59000,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0a_gpll1_gpll2a_map,
+	.parent_map = gcc_xo_gpll0_gpll2a_gpll3_gpll6a_map,
 	.freq_tbl = ftbl_gcc_oxili_gfx3d_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
-		.parent_names = gcc_xo_gpll0a_gpll1_gpll2a,
-		.num_parents = 4,
+		.parent_names = gcc_xo_gpll0_gpll2a_gpll3_gpll6a,
+		.num_parents = 5,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -509,18 +739,20 @@ static const struct freq_tbl ftbl_gcc_camss_vfe0_clk[] = {
 	F(320000000, P_GPLL0, 2.5, 0, 0),
 	F(400000000, P_GPLL0, 2, 0, 0),
 	F(465000000, P_GPLL2, 2, 0, 0),
+	F(480000000, P_GPLL4, 2.5, 0, 0),
+	F(600000000, P_GPLL4, 2, 0, 0),
 	{ }
 };
 
 static struct clk_rcg2 vfe0_clk_src = {
 	.cmd_rcgr = 0x58000,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll2_map,
+	.parent_map = gcc_xo_gpll0_gpll2_gpll4_map,
 	.freq_tbl = ftbl_gcc_camss_vfe0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll2,
-		.num_parents = 3,
+		.parent_names = gcc_xo_gpll0_gpll2_gpll4,
+		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -663,6 +895,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	},
 };
 
+/* This is not in the documentation but is in the downstream driver */
 static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.cmd_rcgr = 0x06024,
 	.mnd_width = 8,
@@ -690,6 +923,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	},
 };
 
+/* This is not in the documentation but is in the downstream driver */
 static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.cmd_rcgr = 0x07024,
 	.mnd_width = 8,
@@ -825,8 +1059,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_camss_mclk0_1_clk[] = {
-	F(9600000, P_XO, 2, 0, 0),
-	F(23880000, P_GPLL0, 1, 2, 67),
+	F(24000000, P_GPLL0, 1, 1, 45),
 	F(66670000, P_GPLL0, 12, 0, 0),
 	{ }
 };
@@ -835,12 +1068,12 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.cmd_rcgr = 0x52000,
 	.mnd_width = 8,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1a_sleep_map,
+	.parent_map = gcc_xo_gpll0_gpll1a_gpll6_sleep_map,
 	.freq_tbl = ftbl_gcc_camss_mclk0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.parent_names = gcc_xo_gpll0_gpll1a_gpll6_sleep,
+		.num_parents = 5,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -849,12 +1082,12 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.cmd_rcgr = 0x53000,
 	.mnd_width = 8,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1a_sleep_map,
+	.parent_map = gcc_xo_gpll0_gpll1a_gpll6_sleep_map,
 	.freq_tbl = ftbl_gcc_camss_mclk0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.parent_names = gcc_xo_gpll0_gpll1a_gpll6_sleep,
+		.num_parents = 5,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -919,6 +1152,7 @@ static const struct freq_tbl ftbl_gcc_crypto_clk[] = {
 	{ }
 };
 
+/* This is not in the documentation but is in the downstream driver */
 static struct clk_rcg2 crypto_clk_src = {
 	.cmd_rcgr = 0x16004,
 	.hid_width = 5,
@@ -992,16 +1226,29 @@ static struct clk_rcg2 byte0_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_mdss_esc0_clk[] = {
+static struct clk_rcg2 byte1_clk_src = {
+	.cmd_rcgr = 0x4d0b0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0a_dsibyte_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "byte1_clk_src",
+		.parent_names = gcc_xo_gpll0a_dsibyte,
+		.num_parents = 3,
+		.ops = &clk_byte2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_mdss_esc_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
 
 static struct clk_rcg2 esc0_clk_src = {
-	.cmd_rcgr = 0x4d05c,
+	.cmd_rcgr = 0x4d060,
 	.hid_width = 5,
 	.parent_map = gcc_xo_dsibyte_map,
-	.freq_tbl = ftbl_gcc_mdss_esc0_clk,
+	.freq_tbl = ftbl_gcc_mdss_esc_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_names = gcc_xo_dsibyte,
@@ -1010,27 +1257,41 @@ static struct clk_rcg2 esc0_clk_src = {
 	},
 };
 
+static struct clk_rcg2 esc1_clk_src = {
+	.cmd_rcgr = 0x4d0a8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_dsibyte_map,
+	.freq_tbl = ftbl_gcc_mdss_esc_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "esc1_clk_src",
+		.parent_names = gcc_xo_dsibyte,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
-	F(50000000, P_GPLL0, 16, 0, 0),
-	F(80000000, P_GPLL0, 10, 0, 0),
-	F(100000000, P_GPLL0, 8, 0, 0),
-	F(160000000, P_GPLL0, 5, 0, 0),
-	F(177780000, P_GPLL0, 4.5, 0, 0),
-	F(200000000, P_GPLL0, 4, 0, 0),
-	F(266670000, P_GPLL0, 3, 0, 0),
-	F(320000000, P_GPLL0, 2.5, 0, 0),
+	F(50000000, P_GPLL0_AUX, 16, 0, 0),
+	F(80000000, P_GPLL0_AUX, 10, 0, 0),
+	F(100000000, P_GPLL0_AUX, 8, 0, 0),
+	F(160000000, P_GPLL0_AUX, 5, 0, 0),
+	F(177780000, P_GPLL0_AUX, 4.5, 0, 0),
+	F(200000000, P_GPLL0_AUX, 4, 0, 0),
+	F(266670000, P_GPLL0_AUX, 3, 0, 0),
+	F(307200000, P_GPLL1, 2, 0, 0),
+	F(366670000, P_GPLL3_AUX, 3, 0, 0),
 	{ }
 };
 
 static struct clk_rcg2 mdp_clk_src = {
 	.cmd_rcgr = 0x4d014,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_dsiphy_map,
+	.parent_map = gcc_xo_gpll1_dsiphy_gpll6_gpll3a_gpll0a_map,
 	.freq_tbl = ftbl_gcc_mdss_mdp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
-		.parent_names = gcc_xo_gpll0_dsiphy,
-		.num_parents = 3,
+		.parent_names = gcc_xo_gpll1_dsiphy_gpll6_gpll3a_gpll0a,
+		.num_parents = 6,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1049,6 +1310,20 @@ static struct clk_rcg2 pclk0_clk_src = {
 	},
 };
 
+static struct clk_rcg2 pclk1_clk_src = {
+	.cmd_rcgr = 0x4d0b8,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0a_dsiphy_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pclk1_clk_src",
+		.parent_names = gcc_xo_gpll0a_dsiphy,
+		.num_parents = 3,
+		.ops = &clk_pixel_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_mdss_vsync_clk[] = {
 	F(19200000, P_XO, 1, 0,	0),
 	{ }
@@ -1072,6 +1347,7 @@ static const struct freq_tbl ftbl_gcc_pdm2_clk[] = {
 	{ }
 };
 
+/* This is not in the documentation but is in the downstream driver */
 static struct clk_rcg2 pdm2_clk_src = {
 	.cmd_rcgr = 0x44010,
 	.hid_width = 5,
@@ -1085,7 +1361,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
+static const struct freq_tbl ftbl_gcc_sdcc_apps_clk[] = {
 	F(144000, P_XO, 16, 3, 25),
 	F(400000, P_XO, 12, 1, 4),
 	F(20000000, P_GPLL0, 10, 1, 4),
@@ -1093,6 +1369,7 @@ static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
 	F(50000000, P_GPLL0, 16, 0, 0),
 	F(100000000, P_GPLL0, 8, 0, 0),
 	F(177770000, P_GPLL0, 4.5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
 	{ }
 };
 
@@ -1101,7 +1378,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_gcc_sdcc1_apps_clk,
+	.freq_tbl = ftbl_gcc_sdcc_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
@@ -1110,23 +1387,12 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk[] = {
-	F(144000, P_XO, 16, 3, 25),
-	F(400000, P_XO, 12, 1, 4),
-	F(20000000, P_GPLL0, 10, 1, 4),
-	F(25000000, P_GPLL0, 16, 1, 2),
-	F(50000000, P_GPLL0, 16, 0, 0),
-	F(100000000, P_GPLL0, 8, 0, 0),
-	F(200000000, P_GPLL0, 4, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.cmd_rcgr = 0x43004,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_gcc_sdcc2_apps_clk,
+	.freq_tbl = ftbl_gcc_sdcc_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
@@ -1136,8 +1402,8 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] = {
-	F(155000000, P_GPLL2, 6, 0, 0),
-	F(310000000, P_GPLL2, 3, 0, 0),
+	F(154285000, P_GPLL6, 7, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
 	F(400000000, P_GPLL0, 2, 0, 0),
 	{ }
 };
@@ -1145,12 +1411,12 @@ static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] = {
 static struct clk_rcg2 apss_tcu_clk_src = {
 	.cmd_rcgr = 0x1207c,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0a_gpll1_gpll2_map,
+	.parent_map = gcc_xo_gpll0_gpll5a_gpll6_bimc_map,
 	.freq_tbl = ftbl_gcc_apss_tcu_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_tcu_clk_src",
-		.parent_names = gcc_xo_gpll0a_gpll1_gpll2,
-		.num_parents = 4,
+		.parent_names = gcc_xo_gpll0_gpll5a_gpll6_bimc,
+		.num_parents = 5,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1168,12 +1434,12 @@ static const struct freq_tbl ftbl_gcc_bimc_gpu_clk[] = {
 static struct clk_rcg2 bimc_gpu_clk_src = {
 	.cmd_rcgr = 0x31028,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
+	.parent_map = gcc_xo_gpll0_gpll5a_gpll6_bimc_map,
 	.freq_tbl = ftbl_gcc_bimc_gpu_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_gpu_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
+		.parent_names = gcc_xo_gpll0_gpll5a_gpll6_bimc,
+		.num_parents = 5,
 		.flags = CLK_GET_RATE_NOCACHE,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1197,6 +1463,42 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_usb_fs_system_clk[] = {
+	F(64000000, P_GPLL0, 12.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb_fs_system_clk_src = {
+	.cmd_rcgr = 0x3f010,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_gcc_usb_fs_system_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb_fs_system_clk_src",
+		.parent_names = gcc_xo_gpll6_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb_fs_ic_clk[] = {
+	F(60000000, P_GPLL6, 1, 1, 18),
+	{ }
+};
+
+static struct clk_rcg2 usb_fs_ic_clk_src = {
+	.cmd_rcgr = 0x3f034,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_gcc_usb_fs_ic_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb_fs_ic_clk_src",
+		.parent_names = gcc_xo_gpll6_gpll0a,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_ultaudio_ahb_clk[] = {
 	F(3200000, P_XO, 6, 0, 0),
 	F(6400000, P_XO, 3, 0, 0),
@@ -1695,6 +1997,7 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 	.halt_reg = 0x06020,
 	.clkr = {
@@ -1712,6 +2015,7 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 	.halt_reg = 0x0601c,
 	.clkr = {
@@ -1729,6 +2033,7 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 	.halt_reg = 0x07020,
 	.clkr = {
@@ -1746,6 +2051,7 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 	.halt_reg = 0x0701c,
 	.clkr = {
@@ -1797,6 +2103,7 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_boot_rom_ahb_clk = {
 	.halt_reg = 0x1300c,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2341,6 +2648,7 @@ static struct clk_branch gcc_camss_vfe_axi_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_crypto_ahb_clk = {
 	.halt_reg = 0x16024,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2359,6 +2667,7 @@ static struct clk_branch gcc_crypto_ahb_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_crypto_axi_clk = {
 	.halt_reg = 0x16020,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2377,6 +2686,7 @@ static struct clk_branch gcc_crypto_axi_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_crypto_clk = {
 	.halt_reg = 0x1601c,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2514,6 +2824,23 @@ static struct clk_branch gcc_mdss_byte0_clk = {
 	},
 };
 
+static struct clk_branch gcc_mdss_byte1_clk = {
+	.halt_reg = 0x4d0a0,
+	.clkr = {
+		.enable_reg = 0x4d0a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdss_byte1_clk",
+			.parent_names = (const char *[]){
+				"byte1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_mdss_esc0_clk = {
 	.halt_reg = 0x4d098,
 	.clkr = {
@@ -2531,6 +2858,23 @@ static struct clk_branch gcc_mdss_esc0_clk = {
 	},
 };
 
+static struct clk_branch gcc_mdss_esc1_clk = {
+	.halt_reg = 0x4d09c,
+	.clkr = {
+		.enable_reg = 0x4d09c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdss_esc1_clk",
+			.parent_names = (const char *[]){
+				"esc1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_mdss_mdp_clk = {
 	.halt_reg = 0x4D088,
 	.clkr = {
@@ -2565,6 +2909,23 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
 	},
 };
 
+static struct clk_branch gcc_mdss_pclk1_clk = {
+	.halt_reg = 0x4d0a4,
+	.clkr = {
+		.enable_reg = 0x4d0a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdss_pclk1_clk",
+			.parent_names = (const char *[]){
+				"pclk1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_mdss_vsync_clk = {
 	.halt_reg = 0x4d090,
 	.clkr = {
@@ -2650,6 +3011,7 @@ static struct clk_branch gcc_oxili_gfx3d_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_pdm2_clk = {
 	.halt_reg = 0x4400c,
 	.clkr = {
@@ -2667,6 +3029,7 @@ static struct clk_branch gcc_pdm2_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_pdm_ahb_clk = {
 	.halt_reg = 0x44004,
 	.clkr = {
@@ -2684,6 +3047,7 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+/* CBCR/halt_reg value derived from code only */
 static struct clk_branch gcc_prng_ahb_clk = {
 	.halt_reg = 0x13004,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2784,6 +3148,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 
 static struct clk_branch gcc_apss_tcu_clk = {
 	.halt_reg = 0x12018,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
 		.enable_mask = BIT(1),
@@ -2800,6 +3165,7 @@ static struct clk_branch gcc_apss_tcu_clk = {
 
 static struct clk_branch gcc_gfx_tcu_clk = {
 	.halt_reg = 0x12020,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
 		.enable_mask = BIT(2),
@@ -2814,32 +3180,33 @@ static struct clk_branch gcc_gfx_tcu_clk = {
 	},
 };
 
-static struct clk_branch gcc_gtcu_ahb_clk = {
-	.halt_reg = 0x12044,
+static struct clk_branch gcc_gfx_tbu_clk = {
+	.halt_reg = 0x12010,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
-		.enable_mask = BIT(13),
+		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
-			.name = "gcc_gtcu_ahb_clk",
+			.name = "gcc_gfx_tbu_clk",
 			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+				"bimc_ddr_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
 };
 
-static struct clk_branch gcc_bimc_gfx_clk = {
-	.halt_reg = 0x31024,
+static struct clk_branch gcc_mdp_tbu_clk = {
+	.halt_reg = 0x1201c,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x31024,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
-			.name = "gcc_bimc_gfx_clk",
+			.name = "gcc_mdp_tbu_clk",
 			.parent_names = (const char *[]){
-				"bimc_gpu_clk_src",
+				"system_noc_bfdcd_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2848,15 +3215,16 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 	},
 };
 
-static struct clk_branch gcc_bimc_gpu_clk = {
-	.halt_reg = 0x31040,
+static struct clk_branch gcc_venus_tbu_clk = {
+	.halt_reg = 0x12014,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x31040,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
-			.name = "gcc_bimc_gpu_clk",
+			.name = "gcc_venus_tbu_clk",
 			.parent_names = (const char *[]){
-				"bimc_gpu_clk_src",
+				"system_noc_bfdcd_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2865,13 +3233,14 @@ static struct clk_branch gcc_bimc_gpu_clk = {
 	},
 };
 
-static struct clk_branch gcc_jpeg_tbu_clk = {
-	.halt_reg = 0x12034,
+static struct clk_branch gcc_vfe_tbu_clk = {
+	.halt_reg = 0x1203c,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
-		.enable_mask = BIT(10),
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
-			.name = "gcc_jpeg_tbu_clk",
+			.name = "gcc_vfe_tbu_clk",
 			.parent_names = (const char *[]){
 				"system_noc_bfdcd_clk_src",
 			},
@@ -2882,13 +3251,14 @@ static struct clk_branch gcc_jpeg_tbu_clk = {
 	},
 };
 
-static struct clk_branch gcc_mdp_tbu_clk = {
-	.halt_reg = 0x1201c,
+static struct clk_branch gcc_jpeg_tbu_clk = {
+	.halt_reg = 0x12034,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
-		.enable_mask = BIT(4),
+		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
-			.name = "gcc_mdp_tbu_clk",
+			.name = "gcc_jpeg_tbu_clk",
 			.parent_names = (const char *[]){
 				"system_noc_bfdcd_clk_src",
 			},
@@ -2901,6 +3271,7 @@ static struct clk_branch gcc_mdp_tbu_clk = {
 
 static struct clk_branch gcc_smmu_cfg_clk = {
 	.halt_reg = 0x12038,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
 		.enable_mask = BIT(12),
@@ -2916,15 +3287,16 @@ static struct clk_branch gcc_smmu_cfg_clk = {
 	},
 };
 
-static struct clk_branch gcc_venus_tbu_clk = {
-	.halt_reg = 0x12014,
+static struct clk_branch gcc_gtcu_ahb_clk = {
+	.halt_reg = 0x12044,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
-		.enable_mask = BIT(5),
+		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
-			.name = "gcc_venus_tbu_clk",
+			.name = "gcc_gtcu_ahb_clk",
 			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+				"pcnoc_bfdcd_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2933,15 +3305,68 @@ static struct clk_branch gcc_venus_tbu_clk = {
 	},
 };
 
-static struct clk_branch gcc_vfe_tbu_clk = {
-	.halt_reg = 0x1203c,
+static struct clk_branch gcc_cpp_tbu_clk = {
+	.halt_reg = 0x12040,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x4500c,
-		.enable_mask = BIT(9),
+		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
-			.name = "gcc_vfe_tbu_clk",
+			.name = "gcc_cpp_tbu_clk",
 			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+				"pcnoc_bfdcd_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdp_rt_tbu_clk = {
+	.halt_reg = 0x1201c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdp_rt_tbu_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_bfdcd_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_bimc_gfx_clk = {
+	.halt_reg = 0x31024,
+	.clkr = {
+		.enable_reg = 0x31024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_bimc_gfx_clk",
+			.parent_names = (const char *[]){
+				"bimc_gpu_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_bimc_gpu_clk = {
+	.halt_reg = 0x31040,
+	.clkr = {
+		.enable_reg = 0x31040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_bimc_gpu_clk",
+			.parent_names = (const char *[]){
+				"bimc_gpu_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2967,6 +3392,57 @@ static struct clk_branch gcc_usb2a_phy_sleep_clk = {
 	},
 };
 
+static struct clk_branch gcc_usb_fs_ahb_clk = {
+	.halt_reg = 0x3f008,
+	.clkr = {
+		.enable_reg = 0x3f008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb_fs_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_bfdcd_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_fs_ic_clk = {
+	.halt_reg = 0x3f030,
+	.clkr = {
+		.enable_reg = 0x3f030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb_fs_ic_clk",
+			.parent_names = (const char *[]){
+				"usb_fs_ic_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_fs_system_clk = {
+	.halt_reg = 0x3f004,
+	.clkr = {
+		.enable_reg = 0x3f004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb_fs_system_clk",
+			.parent_names = (const char *[]){
+				"usb_fs_system_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb_hs_ahb_clk = {
 	.halt_reg = 0x41008,
 	.clkr = {
@@ -3052,6 +3528,54 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 	},
 };
 
+static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
+	.halt_reg = 0x4c02c,
+	.clkr = {
+		.enable_reg = 0x4c02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_venus0_core0_vcodec0_clk",
+			.parent_names = (const char *[]){
+				"vcodec0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
+	.halt_reg = 0x4c034,
+	.clkr = {
+		.enable_reg = 0x4c034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_venus0_core1_vcodec0_clk",
+			.parent_names = (const char *[]){
+				"vcodec0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_oxili_timer_clk = {
+	.halt_reg = 0x59040,
+	.clkr = {
+		.enable_reg = 0x59040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_oxili_timer_clk",
+			.parent_names = (const char *[]){ "xo", },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc venus_gdsc = {
 	.gdscr = 0x4c018,
 	.pd = {
@@ -3092,6 +3616,22 @@ static struct gdsc oxili_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
+static struct gdsc venus_core0_gdsc = {
+	.gdscr = 0x4c028,
+	.pd = {
+		.name = "venus_core0",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc venus_core1_gdsc = {
+	.gdscr = 0x4c030,
+	.pd = {
+		.name = "venus_core1",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_msm8939_clocks[] = {
 	[GPLL0] = &gpll0.clkr,
 	[GPLL0_VOTE] = &gpll0_vote,
@@ -3256,6 +3796,31 @@ static struct clk_regmap *gcc_msm8939_clocks[] = {
 	[GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK] = &gcc_ultaudio_lpaif_aux_i2s_clk.clkr,
 	[GCC_CODEC_DIGCODEC_CLK] = &gcc_codec_digcodec_clk.clkr,
 	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GPLL3] = &gpll3.clkr,
+	[GPLL3_VOTE] = &gpll3_vote,
+	[GPLL4] = &gpll4.clkr,
+	[GPLL4_VOTE] = &gpll4_vote,
+	[GPLL5] = &gpll5.clkr,
+	[GPLL5_VOTE] = &gpll5_vote,
+	[GPLL6] = &gpll6.clkr,
+	[GPLL6_VOTE] = &gpll6_vote,
+	[BYTE1_CLK_SRC] = &byte1_clk_src.clkr,
+	[GCC_MDSS_BYTE1_CLK] = &gcc_mdss_byte1_clk.clkr,
+	[ESC1_CLK_SRC] = &esc1_clk_src.clkr,
+	[GCC_MDSS_ESC1_CLK] = &gcc_mdss_esc1_clk.clkr,
+	[PCLK1_CLK_SRC] = &pclk1_clk_src.clkr,
+	[GCC_MDSS_PCLK1_CLK] = &gcc_mdss_pclk1_clk.clkr,
+	[GCC_GFX_TBU_CLK] = &gcc_gfx_tbu_clk.clkr,
+	[GCC_CPP_TBU_CLK] = &gcc_cpp_tbu_clk.clkr,
+	[GCC_MDP_RT_TBU_CLK] = &gcc_mdp_rt_tbu_clk.clkr,
+	[USB_FS_SYSTEM_CLK_SRC] = &usb_fs_system_clk_src.clkr,
+	[USB_FS_IC_CLK_SRC] = &usb_fs_ic_clk_src.clkr,
+	[GCC_USB_FS_AHB_CLK] = &gcc_usb_fs_ahb_clk.clkr,
+	[GCC_USB_FS_IC_CLK] = &gcc_usb_fs_ic_clk.clkr,
+	[GCC_USB_FS_SYSTEM_CLK] = &gcc_usb_fs_system_clk.clkr,
+	[GCC_VENUS0_CORE0_VCODEC0_CLK] = &gcc_venus0_core0_vcodec0_clk.clkr,
+	[GCC_VENUS0_CORE1_VCODEC0_CLK] = &gcc_venus0_core1_vcodec0_clk.clkr,
+	[GCC_OXILI_TIMER_CLK] = &gcc_oxili_timer_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8939_gdscs[] = {
@@ -3264,6 +3829,8 @@ static struct gdsc *gcc_msm8939_gdscs[] = {
 	[JPEG_GDSC] = &jpeg_gdsc,
 	[VFE_GDSC] = &vfe_gdsc,
 	[OXILI_GDSC] = &oxili_gdsc,
+	[VENUS_CORE0_GDSC] = &venus_core0_gdsc,
+	[VENUS_CORE1_GDSC] = &venus_core1_gdsc,
 };
 
 static const struct qcom_reset_map gcc_msm8939_resets[] = {
@@ -3273,6 +3840,7 @@ static const struct qcom_reset_map gcc_msm8939_resets[] = {
 	[GCC_BLSP1_QUP2_BCR] = { 0x03008 },
 	[GCC_BLSP1_UART2_BCR] = { 0x03028 },
 	[GCC_BLSP1_QUP3_BCR] = { 0x04018 },
+	[GCC_BLSP1_UART3_BCR] = { 0x04038 },
 	[GCC_BLSP1_QUP4_BCR] = { 0x05018 },
 	[GCC_BLSP1_QUP5_BCR] = { 0x06018 },
 	[GCC_BLSP1_QUP6_BCR] = { 0x07018 },
@@ -3301,6 +3869,11 @@ static const struct qcom_reset_map gcc_msm8939_resets[] = {
 	[GCC_BIMC_BCR] = { 0x31000 },
 	[GCC_RBCPR_BCR] = { 0x33000 },
 	[GCC_TLMM_BCR] = { 0x34000 },
+	[GCC_CAMSS_CSI2_BCR] = { 0x3c038 },
+	[GCC_CAMSS_CSI2PHY_BCR] = { 0x3c044 },
+	[GCC_CAMSS_CSI2RDI_BCR] = { 0x3c04c },
+	[GCC_CAMSS_CSI2PIX_BCR] = { 0x3c054 },
+	[GCC_USB_FS_BCR] = { 0x3f000 },
 	[GCC_USB_HS_BCR] = { 0x41000 },
 	[GCC_USB2A_PHY_BCR] = { 0x41028 },
 	[GCC_SDCC1_BCR] = { 0x42000 },
@@ -3331,6 +3904,7 @@ static const struct qcom_reset_map gcc_msm8939_resets[] = {
 	[GCC_CAMSS_CSI1RDI_BCR] = { 0x4f04c },
 	[GCC_CAMSS_CSI1PIX_BCR] = { 0x4f054 },
 	[GCC_CAMSS_ISPIF_BCR] = { 0x50000 },
+	[GCC_BLSP1_QUP4_SPI_APPS_CBCR] = { 0x0501c },
 	[GCC_CAMSS_CCI_BCR] = { 0x51014 },
 	[GCC_CAMSS_MCLK0_BCR] = { 0x52014 },
 	[GCC_CAMSS_MCLK1_BCR] = { 0x53014 },
@@ -3344,6 +3918,7 @@ static const struct qcom_reset_map gcc_msm8939_resets[] = {
 	[GCC_OXILI_BCR] = { 0x59018 },
 	[GCC_GMEM_BCR] = { 0x5902c },
 	[GCC_CAMSS_AHB_BCR] = { 0x5a018 },
+	[GCC_CAMSS_MCLK2_BCR] = { 0x5c014 },
 	[GCC_MDP_TBU_BCR] = { 0x62000 },
 	[GCC_GFX_TBU_BCR] = { 0x63000 },
 	[GCC_GFX_TCU_BCR] = { 0x64000 },
@@ -3356,6 +3931,8 @@ static const struct qcom_reset_map gcc_msm8939_resets[] = {
 	[GCC_VENUS_TBU_BCR] = { 0x6b000 },
 	[GCC_JPEG_TBU_BCR] = { 0x6c000 },
 	[GCC_PRONTO_TBU_BCR] = { 0x6d000 },
+	[GCC_CPP_TBU_BCR] = { 0x6e000 },
+	[GCC_MDP_RT_TBU_BCR] = { 0x6f000 },
 	[GCC_SMMU_CATS_BCR] = { 0x7c000 },
 };
 
@@ -3387,6 +3964,7 @@ static int gcc_msm8939_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
 
 	ret = qcom_cc_register_board_clk(dev, "xo_board", "xo", 19200000);
 	if (ret)
@@ -3396,7 +3974,15 @@ static int gcc_msm8939_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_probe(pdev, &gcc_msm8939_desc);
+	ret = qcom_cc_probe(pdev, &gcc_msm8939_desc);
+	if (ret)
+		return ret;
+
+	regmap = dev_get_regmap(&pdev->dev, NULL);
+	clk_pll_configure_sr_hpm_lp(&gpll3, regmap, &gpll3_config, true);
+	clk_pll_configure_sr_hpm_lp(&gpll4, regmap, &gpll4_config, true);
+
+	return 0;
 }
 
 static struct platform_driver gcc_msm8939_driver = {
-- 
2.25.1

