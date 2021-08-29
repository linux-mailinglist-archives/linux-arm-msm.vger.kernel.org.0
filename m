Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE413FAE8C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 22:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhH2UtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 16:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbhH2UtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 16:49:22 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC8DC061760;
        Sun, 29 Aug 2021 13:48:27 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2FBE11FAEC;
        Sun, 29 Aug 2021 22:48:25 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] clk: qcom: gcc-sdm660: Use ARRAY_SIZE for num_parents
Date:   Sun, 29 Aug 2021 22:48:19 +0200
Message-Id: <20210829204822.289829-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829204822.289829-1-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Where possible, use ARRAY_SIZE to determine the number of parents in
clk_parent_data instead of hardcoding a number that relies on an array
defined hundreds of lines above.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 80 +++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 4d36f96e9ae2..9b97425008ce 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -284,7 +284,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -309,7 +309,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -323,7 +323,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -337,7 +337,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -351,7 +351,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -365,7 +365,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -379,7 +379,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -393,7 +393,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -426,7 +426,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -440,7 +440,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -454,7 +454,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -468,7 +468,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -482,7 +482,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -496,7 +496,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -510,7 +510,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -524,7 +524,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -538,7 +538,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -552,7 +552,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -566,7 +566,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -580,7 +580,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -601,7 +601,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -615,7 +615,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -629,7 +629,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -649,7 +649,7 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll0_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -670,7 +670,7 @@ static struct clk_rcg2 hmss_gpll4_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll4_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll4,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -689,7 +689,7 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_rbcpr_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -708,7 +708,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -730,7 +730,7 @@ static struct clk_rcg2 qspi_ser_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "qspi_ser_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -756,7 +756,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll4_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll4_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -778,7 +778,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -804,7 +804,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div_gpll4,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div_gpll4),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -827,7 +827,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -848,7 +848,7 @@ static struct clk_rcg2 ufs_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_ice_core_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -862,7 +862,7 @@ static struct clk_rcg2 ufs_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_xo_sleep_clk,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_sleep_clk),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -883,7 +883,7 @@ static struct clk_rcg2 ufs_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -904,7 +904,7 @@ static struct clk_rcg2 usb20_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_master_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -924,7 +924,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -949,7 +949,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -970,7 +970,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -990,7 +990,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_xo_sleep_clk,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_xo_sleep_clk),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

