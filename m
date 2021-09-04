Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E6B400C8B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 20:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237419AbhIDSbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Sep 2021 14:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237422AbhIDSbq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Sep 2021 14:31:46 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310D1C061575
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Sep 2021 11:30:44 -0700 (PDT)
Received: from localhost.localdomain (83.6.166.194.neoplus.adsl.tpnet.pl [83.6.166.194])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 455EB3EE34;
        Sat,  4 Sep 2021 20:30:40 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] clk: qcom: gcc-msm8994: Modernize the driver
Date:   Sat,  4 Sep 2021 20:30:06 +0200
Message-Id: <20210904183014.43528-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904183014.43528-1-konrad.dybcio@somainline.org>
References: <20210904183014.43528-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to the newer-style parent_data and remove the hardcoded
xo clock.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
[no changes since v2]

 drivers/clk/qcom/gcc-msm8994.c | 860 ++++++++++++---------------------
 1 file changed, 305 insertions(+), 555 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 144d2ba7a9be..8e9a8ebadf73 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -28,50 +28,17 @@ enum {
 	P_GPLL4,
 };
 
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0",
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 },
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0",
-	"gpll4",
-};
-
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data)
-	{
-		.name = "xo",
-		.parent_names = (const char *[]) { "xo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct clk_alpha_pll gpll0_early = {
-	.offset = 0x00000,
+	.offset = 0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_early",
-			.parent_names = (const char *[]) { "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -79,10 +46,9 @@ static struct clk_alpha_pll gpll0_early = {
 };
 
 static struct clk_alpha_pll_postdiv gpll0 = {
-	.offset = 0x00000,
+	.offset = 0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]) { "gpll0_early" },
 		.num_parents = 1,
@@ -96,10 +62,11 @@ static struct clk_alpha_pll gpll4_early = {
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(4),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_early",
-			.parent_names = (const char *[]) { "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -109,8 +76,7 @@ static struct clk_alpha_pll gpll4_early = {
 static struct clk_alpha_pll_postdiv gpll4 = {
 	.offset = 0x1dc0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4",
 		.parent_names = (const char *[]) { "gpll4_early" },
 		.num_parents = 1,
@@ -118,6 +84,28 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	},
 };
 
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+};
+
 static struct freq_tbl ftbl_ufs_axi_clk_src[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
@@ -134,10 +122,9 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_ufs_axi_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -155,10 +142,9 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_usb30_master_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -175,10 +161,9 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -203,10 +188,9 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -217,10 +201,9 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -232,10 +215,9 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -246,10 +228,9 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -261,10 +242,9 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -275,10 +255,9 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -290,10 +269,9 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -304,10 +282,9 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -319,10 +296,9 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -333,10 +309,9 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -348,10 +323,9 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -382,10 +356,9 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -397,10 +370,9 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -412,10 +384,9 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -427,10 +398,9 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -442,10 +412,9 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -457,10 +426,9 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -471,10 +439,9 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -486,10 +453,9 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -500,10 +466,9 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -515,10 +480,9 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -529,10 +493,9 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -544,10 +507,9 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -558,10 +520,9 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -573,10 +534,9 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -587,10 +547,9 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -602,10 +561,9 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -616,10 +574,9 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -631,10 +588,9 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -646,10 +602,9 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -661,10 +616,9 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -676,10 +630,9 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -691,10 +644,9 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -706,10 +658,9 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -721,10 +672,9 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -743,10 +693,9 @@ static struct clk_rcg2 gp1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_gp1_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -765,10 +714,9 @@ static struct clk_rcg2 gp2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_gp2_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -787,10 +735,9 @@ static struct clk_rcg2 gp3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_gp3_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -806,10 +753,11 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_0_aux_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -824,10 +772,11 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	.cmd_rcgr = 0x1adc,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_pipe_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_pipe_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -843,10 +792,11 @@ static struct clk_rcg2 pcie_1_aux_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_1_aux_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -856,10 +806,11 @@ static struct clk_rcg2 pcie_1_pipe_clk_src = {
 	.cmd_rcgr = 0x1b5c,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_pipe_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_pipe_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -875,10 +826,9 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_pdm2_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -902,10 +852,9 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_gpll4_map,
 	.freq_tbl = ftbl_sdcc1_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll4,
+		.parent_data = gcc_xo_gpll0_gpll4,
 		.num_parents = 3,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -928,10 +877,9 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -943,10 +891,9 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -958,10 +905,9 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -977,10 +923,11 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.freq_tbl = ftbl_tsif_ref_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "tsif_ref_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -997,10 +944,9 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1015,10 +961,11 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.cmd_rcgr = 0x1414,
 	.hid_width = 5,
 	.freq_tbl = ftbl_usb3_phy_aux_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1034,10 +981,9 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_usb_hs_system_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1049,8 +995,7 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1484,
 		.enable_mask = BIT(17),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1062,12 +1007,9 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0648,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup1_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup1_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1080,12 +1022,9 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0644,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup1_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup1_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1098,12 +1037,9 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x06c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup2_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup2_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1116,12 +1052,9 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x06c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup2_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup2_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1134,12 +1067,9 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0748,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup3_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup3_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1152,12 +1082,9 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0744,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup3_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup3_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1170,12 +1097,9 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x07c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup4_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup4_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1188,12 +1112,9 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x07c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup4_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup4_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1206,12 +1127,9 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0848,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup5_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup5_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1224,12 +1142,9 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0844,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup5_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup5_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1242,12 +1157,9 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x08c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup6_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup6_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1260,12 +1172,9 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x08c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup6_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup6_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1278,12 +1187,9 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0684,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart1_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart1_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1296,12 +1202,9 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0704,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart2_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart2_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1314,12 +1217,9 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0784,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart3_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart3_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart3_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1332,12 +1232,9 @@ static struct clk_branch gcc_blsp1_uart4_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0804,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart4_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart4_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart4_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1350,12 +1247,9 @@ static struct clk_branch gcc_blsp1_uart5_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0884,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart5_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart5_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart5_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1368,12 +1262,9 @@ static struct clk_branch gcc_blsp1_uart6_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0904,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart6_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart6_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart6_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1387,8 +1278,7 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1484,
 		.enable_mask = BIT(15),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1400,12 +1290,9 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0988,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup1_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup1_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1418,12 +1305,9 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0984,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup1_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup1_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1436,12 +1320,9 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a08,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup2_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup2_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1454,12 +1335,9 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a04,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup2_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup2_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1472,12 +1350,9 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a88,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup3_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup3_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1490,12 +1365,9 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup3_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup3_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1508,12 +1380,9 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b08,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup4_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup4_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1526,12 +1395,9 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b04,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup4_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup4_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1544,12 +1410,9 @@ static struct clk_branch gcc_blsp2_qup5_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b88,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup5_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup5_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1562,12 +1425,9 @@ static struct clk_branch gcc_blsp2_qup5_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup5_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup5_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1580,12 +1440,9 @@ static struct clk_branch gcc_blsp2_qup6_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0c08,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup6_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup6_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1598,12 +1455,9 @@ static struct clk_branch gcc_blsp2_qup6_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0c04,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup6_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup6_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1616,12 +1470,9 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x09c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart1_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart1_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart1_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1634,12 +1485,9 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a44,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart2_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart2_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart2_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1652,12 +1500,9 @@ static struct clk_branch gcc_blsp2_uart3_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0ac4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart3_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart3_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart3_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1670,12 +1515,9 @@ static struct clk_branch gcc_blsp2_uart4_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b44,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart4_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart4_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart4_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1688,12 +1530,9 @@ static struct clk_branch gcc_blsp2_uart5_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0bc4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart5_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart5_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart5_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1706,12 +1545,9 @@ static struct clk_branch gcc_blsp2_uart6_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0c44,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart6_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart6_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart6_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1724,12 +1560,9 @@ static struct clk_branch gcc_gp1_clk = {
 	.clkr = {
 		.enable_reg = 0x1900,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]) {
-				"gp1_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &gp1_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1742,12 +1575,9 @@ static struct clk_branch gcc_gp2_clk = {
 	.clkr = {
 		.enable_reg = 0x1940,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]) {
-				"gp2_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &gp2_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1760,12 +1590,9 @@ static struct clk_branch gcc_gp3_clk = {
 	.clkr = {
 		.enable_reg = 0x1980,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]) {
-				"gp3_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &gp3_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1778,8 +1605,7 @@ static struct clk_branch gcc_lpass_q6_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x0280,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_lpass_q6_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1791,8 +1617,7 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x0284,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1804,12 +1629,9 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x1ad4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_names = (const char *[]) {
-				"pcie_0_aux_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_0_aux_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1822,8 +1644,7 @@ static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1ad0,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1835,8 +1656,7 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1acc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_mstr_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1849,12 +1669,9 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 	.clkr = {
 		.enable_reg = 0x1ad8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk",
-			.parent_names = (const char *[]) {
-				"pcie_0_pipe_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_0_pipe_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1868,8 +1685,7 @@ static struct clk_branch gcc_pcie_0_slv_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1ac8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_slv_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1881,12 +1697,9 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x1b54,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_aux_clk",
-			.parent_names = (const char *[]) {
-				"pcie_1_aux_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_1_aux_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1899,8 +1712,7 @@ static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1b54,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1912,8 +1724,7 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1b50,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_mstr_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1926,12 +1737,9 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 	.clkr = {
 		.enable_reg = 0x1b58,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk",
-			.parent_names = (const char *[]) {
-				"pcie_1_pipe_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_1_pipe_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1944,8 +1752,7 @@ static struct clk_branch gcc_pcie_1_slv_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1b48,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_slv_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1957,12 +1764,9 @@ static struct clk_branch gcc_pdm2_clk = {
 	.clkr = {
 		.enable_reg = 0x0ccc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]) {
-				"pdm2_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pdm2_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1975,8 +1779,7 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0cc4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1988,12 +1791,9 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x04c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc1_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc1_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2006,8 +1806,7 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x04c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2023,8 +1822,7 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0508,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2040,12 +1838,9 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0504,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc2_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc2_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2058,8 +1853,7 @@ static struct clk_branch gcc_sdcc3_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0548,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2075,12 +1869,9 @@ static struct clk_branch gcc_sdcc3_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0544,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc3_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc3_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2093,8 +1884,7 @@ static struct clk_branch gcc_sdcc4_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0588,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2110,12 +1900,9 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0584,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc4_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc4_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2128,12 +1915,9 @@ static struct clk_branch gcc_sys_noc_ufs_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1d7c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_ufs_axi_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2146,12 +1930,9 @@ static struct clk_branch gcc_sys_noc_usb3_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x03fc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_usb3_axi_clk",
-			.parent_names = (const char *[]) {
-				"usb30_master_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb30_master_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2164,8 +1945,7 @@ static struct clk_branch gcc_tsif_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0d84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2177,12 +1957,9 @@ static struct clk_branch gcc_tsif_ref_clk = {
 	.clkr = {
 		.enable_reg = 0x0d88,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ref_clk",
-			.parent_names = (const char *[]) {
-				"tsif_ref_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &tsif_ref_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2195,8 +1972,7 @@ static struct clk_branch gcc_ufs_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1d4c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2208,12 +1984,9 @@ static struct clk_branch gcc_ufs_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1d48,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_axi_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2226,12 +1999,9 @@ static struct clk_branch gcc_ufs_rx_cfg_clk = {
 	.clkr = {
 		.enable_reg = 0x1d54,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_cfg_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2245,8 +2015,7 @@ static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 	.clkr = {
 		.enable_reg = 0x1d60,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_0_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2259,8 +2028,7 @@ static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
 	.clkr = {
 		.enable_reg = 0x1d64,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_1_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2272,12 +2040,9 @@ static struct clk_branch gcc_ufs_tx_cfg_clk = {
 	.clkr = {
 		.enable_reg = 0x1d50,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_cfg_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2291,8 +2056,7 @@ static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
 	.clkr = {
 		.enable_reg = 0x1d58,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_0_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2305,8 +2069,7 @@ static struct clk_branch gcc_ufs_tx_symbol_1_clk = {
 	.clkr = {
 		.enable_reg = 0x1d5c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_1_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2318,9 +2081,13 @@ static struct clk_branch gcc_usb2_hs_phy_sleep_clk = {
 	.clkr = {
 		.enable_reg = 0x04ac,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2_hs_phy_sleep_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep",
+				.name = "sleep"
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2331,12 +2098,9 @@ static struct clk_branch gcc_usb30_master_clk = {
 	.clkr = {
 		.enable_reg = 0x03c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_master_clk",
-			.parent_names = (const char *[]) {
-				"usb30_master_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb30_master_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2349,12 +2113,9 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 	.clkr = {
 		.enable_reg = 0x03d0,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_names = (const char *[]) {
-				"usb30_mock_utmi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb30_mock_utmi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2367,9 +2128,13 @@ static struct clk_branch gcc_usb30_sleep_clk = {
 	.clkr = {
 		.enable_reg = 0x03cc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sleep_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep",
+				.name = "sleep"
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2380,12 +2145,9 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x1408,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_phy_aux_clk",
-			.parent_names = (const char *[]) {
-				"usb3_phy_aux_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb3_phy_aux_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2398,8 +2160,7 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0488,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2411,12 +2172,9 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 	.clkr = {
 		.enable_reg = 0x0484,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_system_clk",
-			.parent_names = (const char *[]) {
-				"usb_hs_system_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb_hs_system_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2429,8 +2187,7 @@ static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
 	.clkr = {
 		.enable_reg = 0x1a84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2663,13 +2420,6 @@ MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
 
 static int gcc_msm8994_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-	struct clk *clk;
-
-	clk = devm_clk_register(dev, &xo.hw);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	return qcom_cc_probe(pdev, &gcc_msm8994_desc);
 }
 
-- 
2.33.0

