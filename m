Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B8E34AAA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 15:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhCZO7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 10:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhCZO6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 10:58:53 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4128C0613AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 184so7686626ljf.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=npgVJQYGqq8MrhD2GhepRmqoa6UpE4qIZ21saywyRzU=;
        b=Yzs39DgjgTZDjRkOa+0KljchTKe9UD4+jerh9jA+9fmOmvsXQczZ0IXPErgkMgl5Wb
         c6fWPl3a9R4KBqq4USEokBRRClYoZdleUMeHlIaQjr6admk77WjrrVxJjbGqjJrfxgbt
         lHXxMbo85o1hPh8J8UrqLQwr3N8XYu2NtvCC11+tIM0V0KoZ/J2/P+5Ne6D5gAbrGiT9
         +H2nVIyElwNcaPYL6tcB8IfUudZZYlkRwYeFJz/ETQor24ZExUdVgAHuZud/DNcJ89ni
         ESiky+GhkeJvrhqxl/F4nVDEdK6M9JpftTgKatEb4qfMdaNx8Ig1ZLIqWKwzsxM2L6zL
         f8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=npgVJQYGqq8MrhD2GhepRmqoa6UpE4qIZ21saywyRzU=;
        b=YdHE4XCP52HCuykllaOusUrxgkaEsQ3Ilb8ur1igkkl3uRrYYMCqiTiL8rcP54oaWw
         OrTvURoT8nfbJz8MogFQzvvyvszZ8e1b42BsCxmx5jeSOluTGd6izaqqQYcNUstvdjB4
         DZAhmJ7p/wC+ZAhjtdtpCVkMpEInjv3HcY0wxqH1kIkZ4EyBBm+VG6X7xOjNvJnc/dMU
         k5dVLKZ3OuBungXD1kyo66fFRLNFQdy1VjlZmAslXkJlN9Q2s2Ep+WA4HILQg0dbSl3w
         j18V465X6/3dNH+5lrItw9XdLfnSjD5bz2RnAyIhql443KiJf2ntfV3N7OLfKmYEzvL8
         Bjdw==
X-Gm-Message-State: AOAM531y0ZkBVcYZXc90Ey7aOnJhoX+g4YTBxF3H66ta9NvQ7ldg7fxB
        Bh9u5wG2IArHtvQ75KdxMP4CicKrwPz0oqC39nE=
X-Google-Smtp-Source: ABdhPJzYrDX59TwrGoOCg/ROWP7z+FxqdLCWfsIuJJkgWfUfynvQD4cO9OjAUMs2JRc3nKUxkpsZ5w==
X-Received: by 2002:a2e:b6d4:: with SMTP id m20mr9419697ljo.448.1616770731475;
        Fri, 26 Mar 2021 07:58:51 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id k2sm893382lfm.174.2021.03.26.07.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:58:51 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 66d913d2;
        Fri, 26 Mar 2021 14:58:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 2/5] clk: qcom: gcc: Add support for Global Clock controller found on MSM8226
Date:   Fri, 26 Mar 2021 15:58:13 +0100
Message-Id: <20210326145816.9758-3-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Modify existing MSM8974 driver to support MSM8226 SoC. Override frequencies
which are different in this older chip. Register all the clocks to the
framework for the clients to be able to request for them.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/clk/qcom/gcc-msm8974.c | 185 ++++++++++++++++++++++++++++++---
 1 file changed, 171 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 740d3c44c0..06cd669e10 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -3,16 +3,13 @@
  * Copyright (c) 2013, The Linux Foundation. All rights reserved.
  */
 
-#include <linux/kernel.h>
-#include <linux/bitops.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <linux/platform_device.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/clk-provider.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
 #include <dt-bindings/reset/qcom,gcc-msm8974.h>
@@ -719,6 +716,12 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_ce1_clk_msm8226[] = {
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	{ }
+};
+
 static const struct freq_tbl ftbl_gcc_ce1_clk[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(75000000, P_GPLL0, 8, 0, 0),
@@ -761,6 +764,11 @@ static struct clk_rcg2 ce2_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_gp_clk_msm8226[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
 static const struct freq_tbl ftbl_gcc_gp_clk[] = {
 	F(4800000, P_XO, 4, 0, 0),
 	F(6000000, P_GPLL0, 10, 1, 10),
@@ -1955,6 +1963,10 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_names = (const char *[]){
+				"system_noc_clk_src",
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1993,6 +2005,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_pdm_xo4_clk = {
+	.halt_reg = 0x0cc8,
+	.clkr = {
+		.enable_reg = 0x0cc8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_xo4_clk",
+			.parent_names = (const char *[]){ "xo" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_prng_ahb_clk = {
 	.halt_reg = 0x0d04,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2430,6 +2456,121 @@ static struct gdsc usb_hs_hsic_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
+static struct clk_regmap *gcc_msm8226_clocks[] = {
+	[GPLL0] = &gpll0.clkr,
+	[GPLL0_VOTE] = &gpll0_vote,
+	[GPLL1] = &gpll1.clkr,
+	[GPLL1_VOTE] = &gpll1_vote,
+	[CONFIG_NOC_CLK_SRC] = &config_noc_clk_src.clkr,
+	[PERIPH_NOC_CLK_SRC] = &periph_noc_clk_src.clkr,
+	[SYSTEM_NOC_CLK_SRC] = &system_noc_clk_src.clkr,
+	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
+	[BLSP1_QUP2_I2C_APPS_CLK_SRC] = &blsp1_qup2_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP2_SPI_APPS_CLK_SRC] = &blsp1_qup2_spi_apps_clk_src.clkr,
+	[BLSP1_QUP3_I2C_APPS_CLK_SRC] = &blsp1_qup3_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP3_SPI_APPS_CLK_SRC] = &blsp1_qup3_spi_apps_clk_src.clkr,
+	[BLSP1_QUP4_I2C_APPS_CLK_SRC] = &blsp1_qup4_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP4_SPI_APPS_CLK_SRC] = &blsp1_qup4_spi_apps_clk_src.clkr,
+	[BLSP1_QUP5_I2C_APPS_CLK_SRC] = &blsp1_qup5_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP5_SPI_APPS_CLK_SRC] = &blsp1_qup5_spi_apps_clk_src.clkr,
+	[BLSP1_QUP6_I2C_APPS_CLK_SRC] = &blsp1_qup6_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP6_SPI_APPS_CLK_SRC] = &blsp1_qup6_spi_apps_clk_src.clkr,
+	[BLSP1_UART1_APPS_CLK_SRC] = &blsp1_uart1_apps_clk_src.clkr,
+	[BLSP1_UART2_APPS_CLK_SRC] = &blsp1_uart2_apps_clk_src.clkr,
+	[BLSP1_UART3_APPS_CLK_SRC] = &blsp1_uart3_apps_clk_src.clkr,
+	[BLSP1_UART4_APPS_CLK_SRC] = &blsp1_uart4_apps_clk_src.clkr,
+	[BLSP1_UART5_APPS_CLK_SRC] = &blsp1_uart5_apps_clk_src.clkr,
+	[BLSP1_UART6_APPS_CLK_SRC] = &blsp1_uart6_apps_clk_src.clkr,
+	[CE1_CLK_SRC] = &ce1_clk_src.clkr,
+	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
+	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
+	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
+	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
+	[SDCC3_APPS_CLK_SRC] = &sdcc3_apps_clk_src.clkr,
+	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
+	[USB_HSIC_CLK_SRC] = &usb_hsic_clk_src.clkr,
+	[USB_HSIC_IO_CAL_CLK_SRC] = &usb_hsic_io_cal_clk_src.clkr,
+	[USB_HSIC_SYSTEM_CLK_SRC] = &usb_hsic_system_clk_src.clkr,
+	[GCC_BAM_DMA_AHB_CLK] = &gcc_bam_dma_ahb_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK] = &gcc_blsp1_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK] = &gcc_blsp1_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP5_I2C_APPS_CLK] = &gcc_blsp1_qup5_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP5_SPI_APPS_CLK] = &gcc_blsp1_qup5_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP6_I2C_APPS_CLK] = &gcc_blsp1_qup6_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP6_SPI_APPS_CLK] = &gcc_blsp1_qup6_spi_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_BLSP1_UART3_APPS_CLK] = &gcc_blsp1_uart3_apps_clk.clkr,
+	[GCC_BLSP1_UART4_APPS_CLK] = &gcc_blsp1_uart4_apps_clk.clkr,
+	[GCC_BLSP1_UART5_APPS_CLK] = &gcc_blsp1_uart5_apps_clk.clkr,
+	[GCC_BLSP1_UART6_APPS_CLK] = &gcc_blsp1_uart6_apps_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
+	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
+	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_LPASS_Q6_AXI_CLK] = &gcc_lpass_q6_axi_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SDCC3_AHB_CLK] = &gcc_sdcc3_ahb_clk.clkr,
+	[GCC_SDCC3_APPS_CLK] = &gcc_sdcc3_apps_clk.clkr,
+	[GCC_USB2A_PHY_SLEEP_CLK] = &gcc_usb2a_phy_sleep_clk.clkr,
+	[GCC_USB_HS_AHB_CLK] = &gcc_usb_hs_ahb_clk.clkr,
+	[GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
+	[GCC_USB_HSIC_AHB_CLK] = &gcc_usb_hsic_ahb_clk.clkr,
+	[GCC_USB_HSIC_CLK] = &gcc_usb_hsic_clk.clkr,
+	[GCC_USB_HSIC_IO_CAL_CLK] = &gcc_usb_hsic_io_cal_clk.clkr,
+	[GCC_USB_HSIC_SYSTEM_CLK] = &gcc_usb_hsic_system_clk.clkr,
+};
+
+static const struct qcom_reset_map gcc_msm8226_resets[] = {
+	[GCC_USB_HS_HSIC_BCR] = { 0x0400 },
+	[GCC_USB_HS_BCR] = { 0x0480 },
+	[GCC_USB2A_PHY_BCR] = { 0x04a8 },
+};
+
+static struct gdsc *gcc_msm8226_gdscs[] = {
+	[USB_HS_HSIC_GDSC] = &usb_hs_hsic_gdsc,
+};
+
+static const struct regmap_config gcc_msm8226_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x1a80,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_msm8226_desc = {
+	.config = &gcc_msm8226_regmap_config,
+	.clks = gcc_msm8226_clocks,
+	.num_clks = ARRAY_SIZE(gcc_msm8226_clocks),
+	.resets = gcc_msm8226_resets,
+	.num_resets = ARRAY_SIZE(gcc_msm8226_resets),
+	.gdscs = gcc_msm8226_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_msm8226_gdscs),
+};
+
 static struct clk_regmap *gcc_msm8974_clocks[] = {
 	[GPLL0] = &gpll0.clkr,
 	[GPLL0_VOTE] = &gpll0_vote,
@@ -2682,13 +2823,22 @@ static const struct qcom_cc_desc gcc_msm8974_desc = {
 };
 
 static const struct of_device_id gcc_msm8974_match_table[] = {
-	{ .compatible = "qcom,gcc-msm8974" },
-	{ .compatible = "qcom,gcc-msm8974pro" , .data = (void *)1UL },
-	{ .compatible = "qcom,gcc-msm8974pro-ac", .data = (void *)1UL },
+	{ .compatible = "qcom,gcc-msm8226", .data = &gcc_msm8226_desc },
+	{ .compatible = "qcom,gcc-msm8974", .data = &gcc_msm8974_desc },
+	{ .compatible = "qcom,gcc-msm8974pro", .data = &gcc_msm8974_desc },
+	{ .compatible = "qcom,gcc-msm8974pro-ac", .data = &gcc_msm8974_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gcc_msm8974_match_table);
 
+static void msm8226_clock_override(void)
+{
+	ce1_clk_src.freq_tbl = ftbl_gcc_ce1_clk_msm8226;
+	gp1_clk_src.freq_tbl = ftbl_gcc_gp_clk_msm8226;
+	gp2_clk_src.freq_tbl = ftbl_gcc_gp_clk_msm8226;
+	gp3_clk_src.freq_tbl = ftbl_gcc_gp_clk_msm8226;
+}
+
 static void msm8974_pro_clock_override(void)
 {
 	sdcc1_apps_clk_src_init.parent_names = gcc_xo_gpll0_gpll4;
@@ -2708,16 +2858,19 @@ static int gcc_msm8974_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct device *dev = &pdev->dev;
-	bool pro;
+	struct regmap *regmap;
 	const struct of_device_id *id;
 
 	id = of_match_device(gcc_msm8974_match_table, dev);
 	if (!id)
 		return -ENODEV;
-	pro = !!(id->data);
 
-	if (pro)
-		msm8974_pro_clock_override();
+	if (!of_device_is_compatible(dev->of_node, "qcom,gcc-msm8974")) {
+		if (id->data == &gcc_msm8226_desc)
+			msm8226_clock_override();
+		else
+			msm8974_pro_clock_override();
+	}
 
 	ret = qcom_cc_register_board_clk(dev, "xo_board", "xo", 19200000);
 	if (ret)
@@ -2727,7 +2880,11 @@ static int gcc_msm8974_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_probe(pdev, &gcc_msm8974_desc);
+	regmap = qcom_cc_map(pdev, id->data);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(pdev, id->data, regmap);
 }
 
 static struct platform_driver gcc_msm8974_driver = {
-- 
2.25.1

