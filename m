Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5EBC665446
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 07:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235925AbjAKGEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 01:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235720AbjAKGES (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 01:04:18 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5AABC13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bq39so21979198lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNIcJ0s7OH6yfKioXBFUTpRiEKGu6+zB9UarR8Eai3I=;
        b=T4CyDNcFPp1+0QVkdbmiMXbhd2FXce606b0q2+Z8hA1/1c04U8qmfwfkqRXXjYE4oD
         n+f+elDVyORh+k0XSo7r+1O6UpHYaXKfWkpkAgUXrqcD6+j3BsWKFRp9LCQAKtG171yr
         5qrNUvWkOYL22r8ZW5QIAsu1G34ZcY876Uy248vRdFjEyrbNHo/kEELpxcpXxb3YoJI4
         pnCQN4kwstv+Ugx11/9yy6Ax0xpTbECPzA8QAPfm/qVkYmNVcBkyEuX8O+XyIHLuI9rE
         aOCiNCobM8suBTieqJiVyeVLcs1r1oPb3kODcDzP9g/IKDu6juk2u2nTg2cz8h8lBZrg
         6IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNIcJ0s7OH6yfKioXBFUTpRiEKGu6+zB9UarR8Eai3I=;
        b=8Mvvwfy/5w28AEIEfiuqw+eTT1IQ/3FT4D1JN4pKAG3OQNNCpzw7SsURVIWcND8J8j
         GnSs654ioG2pycQCa9dNOR9+w8BbKCmE8zyJBuDS126knbUY8z5QyqXImOxeODhz5HGA
         +PU82cb8LmUevE9HDL4tz1WJZHY8r2MCInCyGUDygUfJYmfUXaFj7pvJFfz4VpEmZkRr
         bmiF1BUtrzzIWJtHiTt4MA5XP6A4F4/jp3Rcsg5K1c2j6AZnlA2DX0KcUiUGvM2uOuI8
         C1W1Avlw2jt4LxcgQExLHJzevMn+M/kgU1sPjyNFsYmWQu7ghwBMmEckZfaeiZGrwBUw
         wPww==
X-Gm-Message-State: AFqh2kpQYcmwdodlO22gbuo6xJ4hrmQoaALH+u4Epk+zlzMY4LyPHl62
        HiVXiCQHgKK/OOgfzwSm9N5mLA==
X-Google-Smtp-Source: AMrXdXtzSoc9gN2Mn13omvbz5hyaimpKCqQA2MHjXqdE7AM04a2wFTQMB3q+2T7PanxEox/BzI+JLA==
X-Received: by 2002:a05:6512:3a8f:b0:4c8:5f19:ccb8 with SMTP id q15-20020a0565123a8f00b004c85f19ccb8mr21344857lfu.48.1673417048056;
        Tue, 10 Jan 2023 22:04:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:07 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v3 06/12] clk: qcom: gcc-apq8084: use parent_hws/_data instead of parent_names
Date:   Wed, 11 Jan 2023 08:03:56 +0200
Message-Id: <20230111060402.1168726-7-dmitry.baryshkov@linaro.org>
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

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Note, the system names for xo clocks were changed from "xo" to
"xo_board" to follow the example of other platforms. This switches the
clocks to use DT-provided "xo_board" clock instead of manually
registered "xo" clock and allows us to drop qcom_cc_register_board_clk()
call from the driver at some point.

In the same way change the looked up system "sleep_clk_src" clock to
"sleep_clk", which is registered from DT.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-apq8084.c | 730 +++++++++++++++++----------------
 1 file changed, 371 insertions(+), 359 deletions(-)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index 05a68f645115..c26e222c78d4 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -46,7 +46,9 @@ static struct clk_pll gpll0 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -57,7 +59,9 @@ static struct clk_regmap gpll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll0_vote",
-		.parent_names = (const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -73,7 +77,9 @@ static struct clk_pll gpll1 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -84,7 +90,9 @@ static struct clk_regmap gpll1_vote = {
 	.enable_mask = BIT(1),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll1_vote",
-		.parent_names = (const char *[]){ "gpll1" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -100,7 +108,9 @@ static struct clk_pll gpll4 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -111,7 +121,9 @@ static struct clk_regmap gpll4_vote = {
 	.enable_mask = BIT(4),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll4_vote",
-		.parent_names = (const char *[]){ "gpll4" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll4.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -122,9 +134,9 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_GPLL0, 1 }
 };
 
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0_vote",
+static const struct clk_parent_data gcc_xo_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
@@ -133,10 +145,10 @@ static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
 	{ P_GPLL4, 5 }
 };
 
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll4_vote",
+static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &gpll4_vote.hw },
 };
 
 static const struct parent_map gcc_xo_sata_asic0_map[] = {
@@ -144,9 +156,9 @@ static const struct parent_map gcc_xo_sata_asic0_map[] = {
 	{ P_SATA_ASIC0_CLK, 2 }
 };
 
-static const char * const gcc_xo_sata_asic0[] = {
-	"xo",
-	"sata_asic0_clk",
+static const struct clk_parent_data gcc_xo_sata_asic0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "sata_asic0_clk", .name = "sata_asic0_clk" },
 };
 
 static const struct parent_map gcc_xo_sata_rx_map[] = {
@@ -154,9 +166,9 @@ static const struct parent_map gcc_xo_sata_rx_map[] = {
 	{ P_SATA_RX_CLK, 2}
 };
 
-static const char * const gcc_xo_sata_rx[] = {
-	"xo",
-	"sata_rx_clk",
+static const struct clk_parent_data gcc_xo_sata_rx[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "sata_rx_clk", .name = "sata_rx_clk" },
 };
 
 static const struct parent_map gcc_xo_pcie_map[] = {
@@ -164,9 +176,9 @@ static const struct parent_map gcc_xo_pcie_map[] = {
 	{ P_PCIE_0_1_PIPE_CLK, 2 }
 };
 
-static const char * const gcc_xo_pcie[] = {
-	"xo",
-	"pcie_pipe",
+static const struct clk_parent_data gcc_xo_pcie[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "pcie_pipe", .name = "pcie_pipe" },
 };
 
 static const struct parent_map gcc_xo_pcie_sleep_map[] = {
@@ -174,9 +186,9 @@ static const struct parent_map gcc_xo_pcie_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 }
 };
 
-static const char * const gcc_xo_pcie_sleep[] = {
-	"xo",
-	"sleep_clk_src",
+static const struct clk_parent_data gcc_xo_pcie_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static struct clk_rcg2 config_noc_clk_src = {
@@ -185,7 +197,7 @@ static struct clk_rcg2 config_noc_clk_src = {
 	.parent_map = gcc_xo_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "config_noc_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -197,7 +209,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
 	.parent_map = gcc_xo_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "periph_noc_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -209,7 +221,7 @@ static struct clk_rcg2 system_noc_clk_src = {
 	.parent_map = gcc_xo_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -230,7 +242,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.freq_tbl = ftbl_gcc_ufs_axi_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -249,7 +261,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.freq_tbl = ftbl_gcc_usb30_master_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -268,7 +280,25 @@ static struct clk_rcg2 usb30_sec_master_clk_src = {
 	.freq_tbl = ftbl_gcc_usb30_sec_master_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_sec_master_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_sec_mock_utmi_clk[] = {
+	F(125000000, P_GPLL0, 1, 5, 24),
+	{ }
+};
+
+static struct clk_rcg2 usb30_sec_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x1be8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_gcc_usb30_sec_mock_utmi_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb30_sec_mock_utmi_clk_src",
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -281,8 +311,8 @@ static struct clk_branch gcc_usb30_sec_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb30_sec_mock_utmi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb30_sec_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -298,8 +328,8 @@ static struct clk_branch gcc_usb30_sec_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -321,7 +351,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -346,7 +376,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -359,7 +389,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -373,7 +403,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -386,7 +416,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -400,7 +430,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -413,7 +443,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -427,7 +457,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -440,7 +470,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -454,7 +484,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -467,7 +497,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -481,7 +511,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -514,7 +544,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -528,7 +558,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -542,7 +572,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -556,7 +586,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -570,7 +600,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -584,7 +614,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -597,7 +627,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -611,7 +641,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -624,7 +654,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -638,7 +668,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -651,7 +681,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -665,7 +695,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -678,7 +708,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -692,7 +722,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -705,7 +735,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -719,7 +749,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -732,7 +762,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -746,7 +776,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -760,7 +790,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -774,7 +804,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -788,7 +818,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -802,7 +832,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -816,7 +846,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -830,7 +860,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_2_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -851,7 +881,7 @@ static struct clk_rcg2 ce1_clk_src = {
 	.freq_tbl = ftbl_gcc_ce1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ce1_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -872,7 +902,7 @@ static struct clk_rcg2 ce2_clk_src = {
 	.freq_tbl = ftbl_gcc_ce2_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ce2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -893,7 +923,7 @@ static struct clk_rcg2 ce3_clk_src = {
 	.freq_tbl = ftbl_gcc_ce3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ce3_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -914,7 +944,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.freq_tbl = ftbl_gcc_gp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -928,7 +958,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.freq_tbl = ftbl_gcc_gp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -942,7 +972,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.freq_tbl = ftbl_gcc_gp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -961,7 +991,7 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	.freq_tbl = ftbl_gcc_pcie_0_1_aux_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_aux_clk_src",
-		.parent_names = gcc_xo_pcie_sleep,
+		.parent_data = gcc_xo_pcie_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_pcie_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -975,7 +1005,7 @@ static struct clk_rcg2 pcie_1_aux_clk_src = {
 	.freq_tbl = ftbl_gcc_pcie_0_1_aux_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_aux_clk_src",
-		.parent_names = gcc_xo_pcie_sleep,
+		.parent_data = gcc_xo_pcie_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_pcie_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -994,7 +1024,7 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	.freq_tbl = ftbl_gcc_pcie_0_1_pipe_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_pipe_clk_src",
-		.parent_names = gcc_xo_pcie,
+		.parent_data = gcc_xo_pcie,
 		.num_parents = ARRAY_SIZE(gcc_xo_pcie),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1007,7 +1037,7 @@ static struct clk_rcg2 pcie_1_pipe_clk_src = {
 	.freq_tbl = ftbl_gcc_pcie_0_1_pipe_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_pipe_clk_src",
-		.parent_names = gcc_xo_pcie,
+		.parent_data = gcc_xo_pcie,
 		.num_parents = ARRAY_SIZE(gcc_xo_pcie),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1025,7 +1055,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.freq_tbl = ftbl_gcc_pdm2_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1045,7 +1075,7 @@ static struct clk_rcg2 sata_asic0_clk_src = {
 	.freq_tbl = ftbl_gcc_sata_asic0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_asic0_clk_src",
-		.parent_names = gcc_xo_sata_asic0,
+		.parent_data = gcc_xo_sata_asic0,
 		.num_parents = ARRAY_SIZE(gcc_xo_sata_asic0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1065,7 +1095,7 @@ static struct clk_rcg2 sata_pmalive_clk_src = {
 	.freq_tbl = ftbl_gcc_sata_pmalive_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_pmalive_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1085,7 +1115,7 @@ static struct clk_rcg2 sata_rx_clk_src = {
 	.freq_tbl = ftbl_gcc_sata_rx_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_rx_clk_src",
-		.parent_names = gcc_xo_sata_rx,
+		.parent_data = gcc_xo_sata_rx,
 		.num_parents = ARRAY_SIZE(gcc_xo_sata_rx),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1103,7 +1133,7 @@ static struct clk_rcg2 sata_rx_oob_clk_src = {
 	.freq_tbl = ftbl_gcc_sata_rx_oob_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_rx_oob_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1130,7 +1160,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc1_4_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll4,
+		.parent_data = gcc_xo_gpll0_gpll4,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1144,7 +1174,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc1_4_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1158,7 +1188,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc1_4_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1172,7 +1202,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc1_4_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1191,7 +1221,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	.freq_tbl = ftbl_gcc_tsif_ref_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "tsif_ref_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1209,25 +1239,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_gcc_usb30_mock_utmi_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_xo_gpll0,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static const struct freq_tbl ftbl_gcc_usb30_sec_mock_utmi_clk[] = {
-	F(125000000, P_GPLL0, 1, 5, 24),
-	{ }
-};
-
-static struct clk_rcg2 usb30_sec_mock_utmi_clk_src = {
-	.cmd_rcgr = 0x1be8,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_gcc_usb30_sec_mock_utmi_clk,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "usb30_sec_mock_utmi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1245,7 +1257,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hs_system_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1268,9 +1280,9 @@ static struct clk_rcg2 usb_hsic_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hsic_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_clk_src",
-		.parent_names = (const char *[]){
-			"xo",
-			"gpll1_vote",
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+			{ .hw = &gpll1_vote.hw },
 		},
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
@@ -1290,9 +1302,9 @@ static struct clk_rcg2 usb_hsic_ahb_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hsic_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_ahb_clk_src",
-		.parent_names = (const char *[]){
-			"xo",
-			"gpll1_vote",
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+			{ .hw = &gpll1_vote.hw },
 		},
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
@@ -1311,29 +1323,12 @@ static struct clk_rcg2 usb_hsic_io_cal_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hsic_io_cal_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_io_cal_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
 
-static struct clk_branch gcc_usb_hsic_mock_utmi_clk = {
-	.halt_reg = 0x1f14,
-	.clkr = {
-		.enable_reg = 0x1f14,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_usb_hsic_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb_hsic_mock_utmi_clk_src",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb_hsic_mock_utmi_clk[] = {
 	F(60000000, P_GPLL0, 10, 0, 0),
 	{ }
@@ -1346,12 +1341,29 @@ static struct clk_rcg2 usb_hsic_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hsic_mock_utmi_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_mock_utmi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
 
+static struct clk_branch gcc_usb_hsic_mock_utmi_clk = {
+	.halt_reg = 0x1f14,
+	.clkr = {
+		.enable_reg = 0x1f14,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb_hsic_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hsic_mock_utmi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_usb_hsic_system_clk[] = {
 	F(75000000, P_GPLL0, 8, 0, 0),
 	{ }
@@ -1364,7 +1376,7 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hsic_system_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_system_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1378,8 +1390,8 @@ static struct clk_branch gcc_bam_dma_ahb_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bam_dma_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1395,8 +1407,8 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1411,8 +1423,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1428,8 +1440,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1445,8 +1457,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1462,8 +1474,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1479,8 +1491,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1496,8 +1508,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1513,8 +1525,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1530,8 +1542,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1547,8 +1559,8 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup5_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1564,8 +1576,8 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup5_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1581,8 +1593,8 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup6_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1598,8 +1610,8 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup6_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1615,8 +1627,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1632,8 +1644,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1649,8 +1661,8 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart3_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart3_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1666,8 +1678,8 @@ static struct clk_branch gcc_blsp1_uart4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart4_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart4_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1683,8 +1695,8 @@ static struct clk_branch gcc_blsp1_uart5_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart5_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart5_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart5_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1700,8 +1712,8 @@ static struct clk_branch gcc_blsp1_uart6_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart6_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart6_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart6_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1718,8 +1730,8 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1734,8 +1746,8 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1751,8 +1763,8 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1768,8 +1780,8 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1785,8 +1797,8 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1802,8 +1814,8 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1819,8 +1831,8 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1836,8 +1848,8 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1853,8 +1865,8 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1870,8 +1882,8 @@ static struct clk_branch gcc_blsp2_qup5_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup5_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1887,8 +1899,8 @@ static struct clk_branch gcc_blsp2_qup5_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup5_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1904,8 +1916,8 @@ static struct clk_branch gcc_blsp2_qup6_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup6_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1921,8 +1933,8 @@ static struct clk_branch gcc_blsp2_qup6_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup6_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1938,8 +1950,8 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1955,8 +1967,8 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1972,8 +1984,8 @@ static struct clk_branch gcc_blsp2_uart3_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart3_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart3_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1989,8 +2001,8 @@ static struct clk_branch gcc_blsp2_uart4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart4_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart4_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_uart4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2006,8 +2018,8 @@ static struct clk_branch gcc_blsp2_uart5_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart5_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart5_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_uart5_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2023,8 +2035,8 @@ static struct clk_branch gcc_blsp2_uart6_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart6_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart6_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_uart6_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2041,8 +2053,8 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_boot_rom_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2058,8 +2070,8 @@ static struct clk_branch gcc_ce1_ahb_clk = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce1_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2075,8 +2087,8 @@ static struct clk_branch gcc_ce1_axi_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce1_axi_clk",
-			.parent_names = (const char *[]){
-				"system_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2092,8 +2104,8 @@ static struct clk_branch gcc_ce1_clk = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce1_clk",
-			.parent_names = (const char *[]){
-				"ce1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ce1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2110,8 +2122,8 @@ static struct clk_branch gcc_ce2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce2_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2127,8 +2139,8 @@ static struct clk_branch gcc_ce2_axi_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce2_axi_clk",
-			.parent_names = (const char *[]){
-				"system_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2144,8 +2156,8 @@ static struct clk_branch gcc_ce2_clk = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce2_clk",
-			.parent_names = (const char *[]){
-				"ce2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ce2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2162,8 +2174,8 @@ static struct clk_branch gcc_ce3_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce3_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2179,8 +2191,8 @@ static struct clk_branch gcc_ce3_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce3_axi_clk",
-			.parent_names = (const char *[]){
-				"system_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2196,8 +2208,8 @@ static struct clk_branch gcc_ce3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ce3_clk",
-			.parent_names = (const char *[]){
-				"ce3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ce3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2213,8 +2225,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]){
-				"gp1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2230,8 +2242,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]){
-				"gp2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2247,8 +2259,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]){
-				"gp3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2264,8 +2276,8 @@ static struct clk_branch gcc_ocmem_noc_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ocmem_noc_cfg_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2280,8 +2292,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_names = (const char *[]){
-				"pcie_0_aux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcie_0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2297,8 +2309,8 @@ static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_cfg_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2314,8 +2326,8 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_mstr_axi_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2331,8 +2343,8 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk",
-			.parent_names = (const char *[]){
-				"pcie_0_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &pcie_0_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2348,8 +2360,8 @@ static struct clk_branch gcc_pcie_0_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_slv_axi_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2365,8 +2377,8 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_aux_clk",
-			.parent_names = (const char *[]){
-				"pcie_1_aux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcie_1_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2382,8 +2394,8 @@ static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_cfg_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2399,8 +2411,8 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_mstr_axi_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2416,8 +2428,8 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk",
-			.parent_names = (const char *[]){
-				"pcie_1_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &pcie_1_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2433,8 +2445,8 @@ static struct clk_branch gcc_pcie_1_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_slv_axi_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2450,8 +2462,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]){
-				"pdm2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2467,8 +2479,8 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2483,8 +2495,8 @@ static struct clk_branch gcc_periph_noc_usb_hsic_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_periph_noc_usb_hsic_ahb_clk",
-			.parent_names = (const char *[]){
-				"usb_hsic_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hsic_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2501,8 +2513,8 @@ static struct clk_branch gcc_prng_ahb_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2517,8 +2529,8 @@ static struct clk_branch gcc_sata_asic0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sata_asic0_clk",
-			.parent_names = (const char *[]){
-				"sata_asic0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sata_asic0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2534,8 +2546,8 @@ static struct clk_branch gcc_sata_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sata_axi_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2551,8 +2563,8 @@ static struct clk_branch gcc_sata_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sata_cfg_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2568,8 +2580,8 @@ static struct clk_branch gcc_sata_pmalive_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sata_pmalive_clk",
-			.parent_names = (const char *[]){
-				"sata_pmalive_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sata_pmalive_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2585,8 +2597,8 @@ static struct clk_branch gcc_sata_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sata_rx_clk",
-			.parent_names = (const char *[]){
-				"sata_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sata_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2602,8 +2614,8 @@ static struct clk_branch gcc_sata_rx_oob_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sata_rx_oob_clk",
-			.parent_names = (const char *[]){
-				"sata_rx_oob_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sata_rx_oob_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2619,8 +2631,8 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2635,8 +2647,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2652,8 +2664,8 @@ static struct clk_branch gcc_sdcc1_cdccal_ff_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_cdccal_ff_clk",
-			.parent_names = (const char *[]){
-				"xo"
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "xo", .name = "xo_board" }
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2668,8 +2680,8 @@ static struct clk_branch gcc_sdcc1_cdccal_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_cdccal_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src"
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "sleep_clk", .name = "sleep_clk" }
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2684,8 +2696,8 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2700,8 +2712,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2717,8 +2729,8 @@ static struct clk_branch gcc_sdcc3_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2733,8 +2745,8 @@ static struct clk_branch gcc_sdcc3_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc3_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2750,8 +2762,8 @@ static struct clk_branch gcc_sdcc4_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2766,8 +2778,8 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc4_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2783,8 +2795,8 @@ static struct clk_branch gcc_sys_noc_ufs_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_ufs_axi_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2800,8 +2812,8 @@ static struct clk_branch gcc_sys_noc_usb3_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_usb3_axi_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2817,8 +2829,8 @@ static struct clk_branch gcc_sys_noc_usb3_sec_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_usb3_sec_axi_clk",
-			.parent_names = (const char *[]){
-				"usb30_sec_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2834,8 +2846,8 @@ static struct clk_branch gcc_tsif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2850,8 +2862,8 @@ static struct clk_branch gcc_tsif_inactivity_timers_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_inactivity_timers_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2867,8 +2879,8 @@ static struct clk_branch gcc_tsif_ref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ref_clk",
-			.parent_names = (const char *[]){
-				"tsif_ref_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&tsif_ref_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2884,8 +2896,8 @@ static struct clk_branch gcc_ufs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ahb_clk",
-			.parent_names = (const char *[]){
-				"config_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&config_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2901,8 +2913,8 @@ static struct clk_branch gcc_ufs_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_axi_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2918,8 +2930,8 @@ static struct clk_branch gcc_ufs_rx_cfg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_cfg_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2935,8 +2947,8 @@ static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_0_clk",
-			.parent_names = (const char *[]){
-				"ufs_rx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "ufs_rx_symbol_0_clk_src", .name = "ufs_rx_symbol_0_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2952,8 +2964,8 @@ static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_1_clk",
-			.parent_names = (const char *[]){
-				"ufs_rx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "ufs_rx_symbol_1_clk_src", .name = "ufs_rx_symbol_1_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2969,8 +2981,8 @@ static struct clk_branch gcc_ufs_tx_cfg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_cfg_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2986,8 +2998,8 @@ static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_0_clk",
-			.parent_names = (const char *[]){
-				"ufs_tx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "ufs_tx_symbol_0_clk_src", .name = "ufs_tx_symbol_0_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3003,8 +3015,8 @@ static struct clk_branch gcc_ufs_tx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_1_clk",
-			.parent_names = (const char *[]){
-				"ufs_tx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "ufs_tx_symbol_1_clk_src", .name = "ufs_tx_symbol_1_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3020,8 +3032,8 @@ static struct clk_branch gcc_usb2a_phy_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2a_phy_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3036,8 +3048,8 @@ static struct clk_branch gcc_usb2b_phy_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2b_phy_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3052,8 +3064,8 @@ static struct clk_branch gcc_usb30_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_master_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3069,8 +3081,8 @@ static struct clk_branch gcc_usb30_sec_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_master_clk",
-			.parent_names = (const char *[]){
-				"usb30_sec_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3086,8 +3098,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb30_mock_utmi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb30_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3103,8 +3115,8 @@ static struct clk_branch gcc_usb30_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3119,8 +3131,8 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3135,8 +3147,8 @@ static struct clk_branch gcc_usb_hs_inactivity_timers_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_inactivity_timers_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3152,8 +3164,8 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_system_clk",
-			.parent_names = (const char *[]){
-				"usb_hs_system_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hs_system_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3169,8 +3181,8 @@ static struct clk_branch gcc_usb_hsic_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hsic_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&periph_noc_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3185,8 +3197,8 @@ static struct clk_branch gcc_usb_hsic_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hsic_clk",
-			.parent_names = (const char *[]){
-				"usb_hsic_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hsic_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3202,8 +3214,8 @@ static struct clk_branch gcc_usb_hsic_io_cal_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hsic_io_cal_clk",
-			.parent_names = (const char *[]){
-				"usb_hsic_io_cal_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hsic_io_cal_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3219,8 +3231,8 @@ static struct clk_branch gcc_usb_hsic_io_cal_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hsic_io_cal_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3235,8 +3247,8 @@ static struct clk_branch gcc_usb_hsic_system_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hsic_system_clk",
-			.parent_names = (const char *[]){
-				"usb_hsic_system_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hsic_system_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

