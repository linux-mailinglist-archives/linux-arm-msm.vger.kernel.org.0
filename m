Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF20514EEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378165AbiD2PQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378190AbiD2PQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:16:43 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28729D4C55
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id a21so9446182edb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w/pXKsIVtTt17T7eqOsQpzzU4pjcYkRpODXJuKrygBs=;
        b=qhoH2FDzI2r9J7YmoLEBPdrwoQpwroyKf0bFdZXPLT1yXXwZQG7W8jtA5HutLf1Tt+
         1rhR4jwZ5e344uRkVQo+e1ujhvHlOQIm6sLTSsSHBz42CWUwBn765BewzMqE3Kk5xHHk
         n6E3edzZN+jVL2xfNOtkH8vsJB4EVPiUDnZr6sMpg38AYDi842dM4S4Vyvb4r/8U9Bwk
         8WsTU669x0kmyeU+/AmufDwrdnxk7kLuEoO8IIyTZ5xbaNlI1/Et1CMrCahdvGBOY3XS
         xBfCxPNnux+wnD7WXE7UIMNPjSGq8F7x7RjpY32laQBcbpsOtJxkZpjvH7ODhB2bNMsZ
         FAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w/pXKsIVtTt17T7eqOsQpzzU4pjcYkRpODXJuKrygBs=;
        b=SnFPBsaVlZkFPY9qJKvEz/kxwLYZJNYR4YQZfthlnX5jDY2zVS87B92MOHPpnSPge4
         0AspPmDovfmwHcJRtnCp9rmnTwOU/xdxZYsy5di2IURdT3407gIGuSJD590EtpRsARgc
         Fdlkyt1c3Sog9ntWDXaDoCS1C8Zdb9/lzhhTSQYCQAeQ4+SH9YbnIEuobWAIuwE0CB9O
         THQBd+xeUVhPDwDRjAZoM0LcFfqYvARubwemSDk6z0itK+BtfV5Em7ImyesA7ja+24BX
         ifTjwaCo9S2CKAfCvDjXhBs157aceUjZBn3Jv9cfA+S+hkzJBdskzBB+uIdwMpm2CdnW
         EH9A==
X-Gm-Message-State: AOAM5301vKhoWfTdC/iGY729iFNeg9mksBYcv9oe4KwjQ/31niO656MV
        eTrwn1AM+2wzdjO5DiEgyBGLRQ==
X-Google-Smtp-Source: ABdhPJwuEP74LZIyjKBM8JgUaiSPybNLz2UTsmlnFTikNMAUZ25Eu4D/0ImLyuyQT5C3NqoHauTKIQ==
X-Received: by 2002:a05:6402:3484:b0:426:156:94e6 with SMTP id v4-20020a056402348400b00426015694e6mr17846939edc.401.1651245199458;
        Fri, 29 Apr 2022 08:13:19 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:19 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/9] clk: qcom: add support for SM8350 DISPCC
Date:   Fri, 29 Apr 2022 17:12:44 +0200
Message-Id: <20220429151247.388837-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
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

From: Jonathan Marek <jonathan@marek.ca>

Add support to the SM8350 display clock controller by extending the SM8250
display clock controller, which is almost identical but has some minor
differences.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/Kconfig         |  4 +--
 drivers/clk/qcom/dispcc-sm8250.c | 61 +++++++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9b1f54e634b9..1752ca0ee405 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -609,11 +609,11 @@ config SM_DISPCC_6125
 	  splash screen
 
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
index 22d9cbabecab..95f86ffcc3b3 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -43,6 +43,10 @@ static struct pll_vco vco_table[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
+static struct pll_vco lucid_5lpe_vco[] = {
+	{ 249600000, 1750000000, 0 },
+};
+
 static struct alpha_pll_config disp_cc_pll0_config = {
 	.l = 0x47,
 	.alpha = 0xE000,
@@ -1228,6 +1232,7 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
 	{ .compatible = "qcom,sc8180x-dispcc" },
 	{ .compatible = "qcom,sm8150-dispcc" },
 	{ .compatible = "qcom,sm8250-dispcc" },
+	{ .compatible = "qcom,sm8350-dispcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
@@ -1258,7 +1263,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	/* note: trion == lucid, except for the prepare() op */
+	/* Apply differences for SM8150 and SM8350 */
 	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8180x-dispcc") ||
 	    of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
@@ -1270,8 +1275,62 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
 		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
 		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+	} else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
+		static struct clk_rcg2 * const rcgs[] = {
+			&disp_cc_mdss_byte0_clk_src,
+			&disp_cc_mdss_byte1_clk_src,
+			&disp_cc_mdss_dp_aux1_clk_src,
+			&disp_cc_mdss_dp_aux_clk_src,
+			&disp_cc_mdss_dp_link1_clk_src,
+			&disp_cc_mdss_dp_link_clk_src,
+			&disp_cc_mdss_dp_pixel1_clk_src,
+			&disp_cc_mdss_dp_pixel2_clk_src,
+			&disp_cc_mdss_dp_pixel_clk_src,
+			&disp_cc_mdss_esc0_clk_src,
+			&disp_cc_mdss_mdp_clk_src,
+			&disp_cc_mdss_pclk0_clk_src,
+			&disp_cc_mdss_pclk1_clk_src,
+			&disp_cc_mdss_rot_clk_src,
+			&disp_cc_mdss_vsync_clk_src,
+		};
+		static struct clk_regmap_div * const divs[] = {
+			&disp_cc_mdss_byte0_div_clk_src,
+			&disp_cc_mdss_byte1_div_clk_src,
+			&disp_cc_mdss_dp_link1_div_clk_src,
+			&disp_cc_mdss_dp_link_div_clk_src,
+		};
+		unsigned int i;
+		static bool offset_applied;
+
+		/* only apply the offsets once (in case of deferred probe) */
+		if (!offset_applied) {
+			for (i = 0; i < ARRAY_SIZE(rcgs); i++)
+				rcgs[i]->cmd_rcgr -= 4;
+
+			for (i = 0; i < ARRAY_SIZE(divs); i++) {
+				divs[i]->reg -= 4;
+				divs[i]->width = 4;
+			}
+
+			disp_cc_mdss_ahb_clk.halt_reg -= 4;
+			disp_cc_mdss_ahb_clk.clkr.enable_reg -= 4;
+
+			offset_applied = true;
+		}
+
+		disp_cc_mdss_ahb_clk_src.cmd_rcgr = 0x22a0;
+
+		disp_cc_pll0_config.config_ctl_hi1_val = 0x2A9A699C;
+		disp_cc_pll0_config.test_ctl_hi1_val = 0x01800000;
+		disp_cc_pll0_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
+		disp_cc_pll0.vco_table = lucid_5lpe_vco;
+		disp_cc_pll1_config.config_ctl_hi1_val = 0x2A9A699C;
+		disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
+		disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
+		disp_cc_pll1.vco_table = lucid_5lpe_vco;
 	}
 
+	/* note for SM8350: downstream lucid_5lpe configure differs slightly */
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 
-- 
2.32.0

