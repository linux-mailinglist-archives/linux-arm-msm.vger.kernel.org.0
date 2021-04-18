Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB86036352B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 14:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbhDRMa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Apr 2021 08:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhDRMaZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Apr 2021 08:30:25 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18973C061760
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id w3so48783466ejc.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4A6FPGrlO6kpSswS7bbG6MaMQMQDFra9fHiDSeFEH7g=;
        b=MF9fvBxFoKrpNEHUx/WiR5Y3pqFHBlfVGh+uqOr1jVY+A47/wdiOJQ1vRilwxSEO7e
         AhNaeDVk+nYNkQrxoQRv+ACJup2ObioyBFppka7bQ5RJUhOSbQHYf6MtylzcX+/Ks0fw
         aVSpBhiTODanmieZKFERvQi8WlpML5Owsh0pNXSKPQGKS6FIdSv0mDVMDRnhJ5uzMJO2
         nmXrIi37ZWCqMe63pvT5QgGpXmNg2LJK51Ex0sT0+Zuobo31PmsZZ2CLWq1iTBDrzj8Y
         l8HaZNTmxdsg0PLFzrOf0FmyE1FaoFD7CU5rhD1dxBLNbfxKrH4PJDZ7PiLGnQjwlc3U
         xeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4A6FPGrlO6kpSswS7bbG6MaMQMQDFra9fHiDSeFEH7g=;
        b=HKPM4igH43ZlaW5v9qnHOrHpFdckZRPctynitQdgPzjrh3WntKBvoMNDqR+lgxz14X
         RIH9E8J9lx9Nb+PnoAenG6GrdGe13CeG28HouIaLBaWfXJTgmAFTK067a+yIkh7m5QTq
         s/E45UCXOvl4Id0g17EKXhdHUbDIvbc1/GKrT1Y0b0aoIFr5hrbXfUmRGBs7Q1Xt/4FG
         y4dop7/sZ+VYY776qZcbD1306uyvxzSWz85M/P8TFECt84y/w8bfM7hRFJMU8haihc58
         KJcpZtv82RgAqYTGDl+bOjNfbJPX/rj4nMdfvPPVfE6Kg+UWsQETEMIamRbjuvGq15K8
         hnRQ==
X-Gm-Message-State: AOAM530wf7GCDcv0gOtCbjHNb4kMiT28XN9uMckE9j1vZRRKn7MMRo07
        Hvy6XhAdpX4b1rXWSZmaCAzB3g==
X-Google-Smtp-Source: ABdhPJyyQ/XLKWfuDUdzycN9/1FsuwYBpF53NsU26kE2zcvN+SM6aCaHDLNAcWbPcZ6D/NImYtECXg==
X-Received: by 2002:a17:906:3385:: with SMTP id v5mr17293970eja.539.1618748994684;
        Sun, 18 Apr 2021 05:29:54 -0700 (PDT)
Received: from PackardBell (87-49-44-144-mobile.dk.customer.tdc.net. [87.49.44.144])
        by smtp.googlemail.com with ESMTPSA id a27sm8213677ejk.80.2021.04.18.05.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 05:29:54 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 7c6259bf;
        Sun, 18 Apr 2021 12:29:50 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 2/5] clk: qcom: gcc: Add support for Global Clock controller found on MSM8226
Date:   Sun, 18 Apr 2021 14:29:06 +0200
Message-Id: <20210418122909.71434-3-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
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
 drivers/clk/qcom/gcc-msm8974.c | 169 +++++++++++++++++++++++++++++++--
 1 file changed, 162 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 740d3c44c0..bf305fa9e5 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -719,6 +719,12 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
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
@@ -761,6 +767,11 @@ static struct clk_rcg2 ce2_clk_src = {
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
@@ -1955,6 +1966,10 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
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
@@ -1993,6 +2008,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
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
@@ -2430,6 +2459,121 @@ static struct gdsc usb_hs_hsic_gdsc = {
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
@@ -2682,13 +2826,22 @@ static const struct qcom_cc_desc gcc_msm8974_desc = {
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
@@ -2708,16 +2861,18 @@ static int gcc_msm8974_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct device *dev = &pdev->dev;
-	bool pro;
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
-- 
2.25.1

