Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B548837FE6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 21:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhEMT57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 15:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhEMT57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 15:57:59 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232D5C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 12:56:49 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id j19so20662806qtp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 12:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bEQcUz043gHSOI81cTAg7K/WzddoUEXUtqRGFxEF/s=;
        b=pCDMF4WeEQcTGNVyQhSUARuPUJYzOHZudSVaLbJLoP5LXYu85R7jkvr1hg/YYPVWw9
         s0JuAUnU276nLCks1Vr3OwKJrtEt1HOHjm2NhMYgEaTH9gfXNxHYcxNgf6aa1isXG44I
         QtHu0y1uKdyrQoJ7Hhq0MrPkTCOlfmLgIHNqAl5rWPRNCqT+ECvSMZ/41mMTvypL5nzY
         1wlTII6Sl2uh945DXPYLKsIKXFlVDdygPECbOnE9pe3OJniteK4UEH9PHi41bL8dDA88
         sc1fjuGLL/l6+QAy3m5y5o2ZMz8iULeJvJxwOeUgtwKKmPsF7LLRESXEVct8Y9+cp5em
         I2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bEQcUz043gHSOI81cTAg7K/WzddoUEXUtqRGFxEF/s=;
        b=GVIi3gzcAQ4ojM8FnPUwlxlRdcTF8Hnj7NT0vlAmoftMH6/ps4HBdf1Wike92Wem2D
         ePSmSYVfVs4Ku1x7r05Tqb0g4bkPxyr9C760MpFVCV2YuHVQSWkxghZ+Gve0c9RHcx86
         +tZZaJoAugF0CHnS8mwXqCe2q9RbD4dUMe6QLNB+UKxhU6gF3gJXmTy7gdPacFYonGbv
         ETbzjdefvESorRvezN5MhTprBj7iZZ0bBgDV66ir/bDc/ciCgViKLnBHM628GIwKmVau
         jO2+FhlNinS2JrBcRE7GJfaecwBWeuxv5lV/NJYa20Fa79RtNHKG/VoEviZipohmuuDc
         jBNw==
X-Gm-Message-State: AOAM530ESt/hhp6JeVkpjJxkW+JUEYZKv4YaH/7R3cIM85iwvROe+zY1
        52I+qy0PvepFXvVGNZIsHTVY8m2qLCAUG94WGqI=
X-Google-Smtp-Source: ABdhPJzfP1vVPSACv3rr93bWKLIazkFuLnzLzgLmMmukBJyBc4/PDb9tm2xeBihh/9BW81JOG8x1bw==
X-Received: by 2002:a05:622a:183:: with SMTP id s3mr18828276qtw.115.1620935808023;
        Thu, 13 May 2021 12:56:48 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h12sm3211228qkj.52.2021.05.13.12.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 12:56:47 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] clk: qcom: add support for SM8350 DISPCC
Date:   Thu, 13 May 2021 15:56:16 -0400
Message-Id: <20210513195617.15068-1-jonathan@marek.ca>
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
 drivers/clk/qcom/Kconfig         |  4 +-
 drivers/clk/qcom/dispcc-sm8250.c | 84 +++++++++++++++++++++++++++-----
 2 files changed, 75 insertions(+), 13 deletions(-)

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
index de09cd5c209f..1fcf8085a109 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -36,6 +36,10 @@ static struct pll_vco vco_table[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
+static struct pll_vco lucid_5lpe_vco[] = {
+	{ 249600000, 1750000000, 0 },
+};
+
 static struct alpha_pll_config disp_cc_pll0_config = {
 	.l = 0x47,
 	.alpha = 0xE000,
@@ -1039,6 +1043,7 @@ static const struct qcom_cc_desc disp_cc_sm8250_desc = {
 static const struct of_device_id disp_cc_sm8250_match_table[] = {
 	{ .compatible = "qcom,sm8150-dispcc" },
 	{ .compatible = "qcom,sm8250-dispcc" },
+	{ .compatible = "qcom,sm8350-dispcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
@@ -1051,19 +1056,76 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* note: trion == lucid, except for the prepare() op */
-	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
-	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
-		disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
-		disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
-		disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
-		disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
-		disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
-		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
-		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
-		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+	/* SM8350 has _SRC clocks offset by 4, and some other differences */
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
+		static struct clk_rcg2* const rcgs[] = {
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
+		static struct clk_regmap_div* const divs[] = {
+			&disp_cc_mdss_byte0_div_clk_src,
+			&disp_cc_mdss_byte1_div_clk_src,
+			&disp_cc_mdss_dp_link1_div_clk_src,
+			&disp_cc_mdss_dp_link_div_clk_src,
+		};
+		unsigned i;
+		static bool offset_applied = false;
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
+	} else {
+		/* note: trion == lucid, except for the prepare() op */
+		BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
+		if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
+			disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
+			disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
+			disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
+			disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
+			disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
+			disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
+			disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
+			disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+		}
 	}
 
+	/* note for SM8350: downstream lucid_5lpe configure differs slightly */
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 
-- 
2.26.1

