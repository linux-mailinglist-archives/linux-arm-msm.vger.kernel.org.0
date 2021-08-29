Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31023FAE0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 21:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbhH2ThV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 15:37:21 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:41439 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbhH2ThU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 15:37:20 -0400
Received: from localhost.localdomain (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 2E7E93E83D;
        Sun, 29 Aug 2021 21:36:26 +0200 (CEST)
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
Subject: [PATCH RESEND v2 3/9] clk: qcom: gcc-msm8994: Fix up SPI QUP clocks
Date:   Sun, 29 Aug 2021 21:36:10 +0200
Message-Id: <20210829193617.4105-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829193617.4105-1-konrad.dybcio@somainline.org>
References: <20210829193617.4105-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix up SPI QUP freq tables to account for the fact
that not every QUP can run at the same set of frequencies.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 118 +++++++++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 8e9a8ebadf73..78c06104854e 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -169,7 +169,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blspqup_spi_apps_clk_src[] = {
+static struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -187,7 +187,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -209,12 +209,25 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup2_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(46150000, P_GPLL0, 13, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.cmd_rcgr = 0x06cc,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup2_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -236,12 +249,25 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup3_4_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(44440000, P_GPLL0, 13.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.cmd_rcgr = 0x074c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -268,7 +294,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -290,12 +316,25 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup5_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(40000000, P_GPLL0, 15, 0, 0),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.cmd_rcgr = 0x084c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup5_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -317,12 +356,25 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup6_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(27906976, P_GPLL0, 1, 2, 43),
+	F(41380000, P_GPLL0, 15, 0, 0),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.cmd_rcgr = 0x08cc,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup6_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -447,12 +499,25 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp2_qup1_2_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(44440000, P_GPLL0, 13.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.cmd_rcgr = 0x098c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup1_2_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -479,7 +544,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup1_2_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -488,6 +553,19 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp2_qup3_4_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(48000000, P_GPLL0, 12.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.cmd_rcgr = 0x0aa0,
 	.hid_width = 5,
@@ -506,7 +584,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -533,7 +611,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -560,7 +638,8 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	/* BLSP1 QUP1 and BLSP2 QUP5 use the same freqs */
+	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -582,12 +661,25 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp2_qup6_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(44440000, P_GPLL0, 13.5, 0, 0),
+	F(48000000, P_GPLL0, 12.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.cmd_rcgr = 0x0c0c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup6_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
-- 
2.33.0

