Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF3039F92C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 16:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbhFHOcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 10:32:36 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:33506 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbhFHOcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 10:32:13 -0400
Received: by mail-qt1-f171.google.com with SMTP id e3so3783381qte.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VeOWztuA+5uPjBv9EIEuhwDk4mv2PCrGI4GDUDewKOo=;
        b=NaOmGIfFCIlb5WxE5scnJXWRp2zx3YDAbBkCr9ZbZHABdpF6f4/YuNxqvTmk4shOIM
         MIYZ+7zqbtwM8x+m7zrRcPutGVH88keyVg+q4DZLhz7YH7DVGEygnJzGgXSju0HZ3AaQ
         Jrs5dBYmfH1EEEZr+vxmfNA8hisbFq/wowITeTBzQh2QqlvkCgRDlPjBiLujR3IdlPT6
         3dAeKWtvfo178YFUzklYGa9Rp+fQzgLGp61FSb9r2kPudprzQFM4JNI1vBk5BaSlSNex
         eu1qTn8aXAW+Dg9DC5q2a35jEhEQ5WksxahzIKw6cAHSMQLanOU38awpMhiCp4TFiZLI
         omAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VeOWztuA+5uPjBv9EIEuhwDk4mv2PCrGI4GDUDewKOo=;
        b=tTw1vldGlOrWIGZoSURH4myHFS5FQmzjnXW6wiA4FzmFOLk0vb/sFoWCx04YuAhb5/
         Z75iVOPsJTelgTXA3RtRhC3NEkOzevk6VjNpmUIRDaAf5PWVLbuWTb6ZXIMrrybOpLQk
         Lg8gMA2JdOoBM9FhKUzTE2hvhlrGr7Gwm7DWk1bjC2Ubi/AN6snhrWwn0PdW/+HUX/FX
         YRaaFVzz5rgns1P8F0BIDxFUSBVJp5aUB5YSMOE8vyn2XbmHVSBxUKv13xMdK9o4tMHB
         M9GVXrvXJ5De0d9dEOhQjt7pbzok2twqOjOitvxsHaloJj6bw6Jlqk1zuFuMqtoHa5iS
         12fw==
X-Gm-Message-State: AOAM532pwyp+9EzNYvNaZs8l4DWzePnTm/+xYk6TmS8pvJK3hf4VExF5
        qaaMNBlfjvZ/MZ1kjz1mxLn1oYewHITn2xky7b0=
X-Google-Smtp-Source: ABdhPJwMwmq5sy+4mxEpbaOyJ0rNAp8o+/xUAeMnwbSVMnQPjjsoeYUcp70PsHRNrzb+pFRojO3vgg==
X-Received: by 2002:a05:622a:4a:: with SMTP id y10mr4442251qtw.294.1623162544363;
        Tue, 08 Jun 2021 07:29:04 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id v6sm11838748qkv.54.2021.06.08.07.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:29:03 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] clk: qcom: add support for SM8350 DISPCC
Date:   Tue,  8 Jun 2021 10:27:06 -0400
Message-Id: <20210608142707.19637-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to the SM8350 display clock controller by extending the SM8250
display clock controller, which is almost identical but has some minor
differences.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
v3:
 - added const to vco tables
 - moved clk rcgs/div list to global scope
 - patching clks on module init instead of probe
 - lowercase hex
 - update configure comment
 - rebased on added edp clocks

 drivers/clk/qcom/Kconfig         |   4 +-
 drivers/clk/qcom/dispcc-sm8250.c | 103 ++++++++++++++++++++++++++-----
 2 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 45646b867cdb..cc60e6ee1654 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -484,11 +484,11 @@ config SDX_GCC_55
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
 config SM_DISPCC_8250
-	tristate "SM8150 and SM8250 Display Clock Controller"
+	tristate "SM8150/SM8250/SM8350 Display Clock Controller"
 	depends on SM_GCC_8150 || SM_GCC_8250
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
-	  SM8150 and SM8250 devices.
+	  SM8150/SM8250/SM8350 devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 601c7c0ba483..86c474a51cd2 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -34,10 +34,14 @@ enum {
 	P_DSI1_PHY_PLL_OUT_DSICLK,
 };
 
-static struct pll_vco vco_table[] = {
+static const struct pll_vco vco_table[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
+static const struct pll_vco lucid_5lpe_vco[] = {
+	{ 249600000, 1750000000, 0 },
+};
+
 static struct alpha_pll_config disp_cc_pll0_config = {
 	.l = 0x47,
 	.alpha = 0xE000,
@@ -1222,6 +1226,7 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
 	{ .compatible = "qcom,sc8180x-dispcc" },
 	{ .compatible = "qcom,sm8150-dispcc" },
 	{ .compatible = "qcom,sm8250-dispcc" },
+	{ .compatible = "qcom,sm8350-dispcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
@@ -1234,20 +1239,10 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* note: trion == lucid, except for the prepare() op */
-	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
-	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8180x-dispcc") ||
-	    of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
-		disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
-		disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
-		disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
-		disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
-		disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
-		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
-		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
-		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
-	}
-
+	/* sm8350 note: downstream has a clk_lucid_5lpe_pll_configure, which
+	 * does not write the PLL_UPDATE_BYPASS bit in PLL_MODE.
+	 * It should not hurt sm8350 to have this extra write.
+	 */
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 
@@ -1268,8 +1263,86 @@ static struct platform_driver disp_cc_sm8250_driver = {
 	},
 };
 
+static struct clk_rcg2 * const __initconst disp_cc_sm8250_rcgs[] = {
+	&disp_cc_mdss_byte0_clk_src,
+	&disp_cc_mdss_byte1_clk_src,
+	&disp_cc_mdss_dp_aux1_clk_src,
+	&disp_cc_mdss_dp_aux_clk_src,
+	&disp_cc_mdss_dp_link1_clk_src,
+	&disp_cc_mdss_dp_link_clk_src,
+	&disp_cc_mdss_dp_pixel1_clk_src,
+	&disp_cc_mdss_dp_pixel2_clk_src,
+	&disp_cc_mdss_dp_pixel_clk_src,
+	&disp_cc_mdss_edp_aux_clk_src,
+	&disp_cc_mdss_edp_gtc_clk_src,
+	&disp_cc_mdss_edp_link_clk_src,
+	&disp_cc_mdss_edp_pixel_clk_src,
+	&disp_cc_mdss_esc0_clk_src,
+	&disp_cc_mdss_mdp_clk_src,
+	&disp_cc_mdss_pclk0_clk_src,
+	&disp_cc_mdss_pclk1_clk_src,
+	&disp_cc_mdss_rot_clk_src,
+	&disp_cc_mdss_vsync_clk_src,
+	&disp_cc_mdss_ahb_clk_src,
+};
+
+static struct clk_regmap_div * const __initconst disp_cc_sm8250_divs[] = {
+	&disp_cc_mdss_byte0_div_clk_src,
+	&disp_cc_mdss_byte1_div_clk_src,
+	&disp_cc_mdss_dp_link1_div_clk_src,
+	&disp_cc_mdss_dp_link_div_clk_src,
+};
+
+static bool __init disp_cc_is_compatible(const char *compatible)
+{
+	struct device_node *node = of_find_compatible_node(NULL, NULL, compatible);
+
+	of_node_put(node);
+	return node != NULL;
+}
+
 static int __init disp_cc_sm8250_init(void)
 {
+	if (disp_cc_is_compatible("qcom,sm8150-dispcc") ||
+	    disp_cc_is_compatible("qcom,sc8180x-dispcc")) {
+		BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
+		disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
+		disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
+		disp_cc_pll0_config.user_ctl_hi1_val = 0x000000d0;
+		disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
+		disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
+		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
+		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000d0;
+		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+	} else if (disp_cc_is_compatible("qcom,sm8350-dispcc")) {
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(disp_cc_sm8250_rcgs); i++)
+			disp_cc_sm8250_rcgs[i]->cmd_rcgr -= 4;
+
+		for (i = 0; i < ARRAY_SIZE(disp_cc_sm8250_divs); i++) {
+			disp_cc_sm8250_divs[i]->reg -= 4;
+			disp_cc_sm8250_divs[i]->width = 4;
+		}
+
+		disp_cc_mdss_ahb_clk.halt_reg -= 4;
+		disp_cc_mdss_ahb_clk.clkr.enable_reg -= 4;
+
+		disp_cc_mdss_ahb_clk_src.cmd_rcgr = 0x22a0;
+
+		disp_cc_pll0_config.config_ctl_hi1_val = 0x2a9a699c;
+		disp_cc_pll0_config.test_ctl_hi1_val = 0x01800000;
+		disp_cc_pll0_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
+		disp_cc_pll0.vco_table = lucid_5lpe_vco;
+		disp_cc_pll1_config.config_ctl_hi1_val = 0x2a9a699c;
+		disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
+		disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
+		disp_cc_pll1.vco_table = lucid_5lpe_vco;
+
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = NULL;
+	}
+
 	return platform_driver_register(&disp_cc_sm8250_driver);
 }
 subsys_initcall(disp_cc_sm8250_init);
-- 
2.26.1

