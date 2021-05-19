Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B953883AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 02:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234530AbhESAUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 20:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbhESAUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 20:20:36 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B5EC061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 17:19:17 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id q10so11174377qkc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 17:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKHZjDXS5Wk7oWjMpFocEspWZD3JWVlcV2qAjmTuWhk=;
        b=HMiopDQucCjfiXNt32/go7m4wssBFM7T1K752VqyhVTW1UeiJP2rBbbbaaYPta2I5V
         M5X62LeR+JgJEKzFH2T8VVpQmU3G5+9Ru3pHwJ6fsncG4tzTPG1JDsYk8/WcLeiRjW9y
         0+g2u3RtNrN+sLRGSUmiVl0DqRw5/0qehKrCePW3iEm4xZusCIoPJneH1nlzGJZ1iHF9
         9bcrrWVliAPBhLUFD8gv1qYwOgA3G6CM8NVMzNECEsx+h9yTk8IZXS5TutCrxvs9j9fA
         6b/ib0ebNNRwVv0gfrfdZvrZbB4eA7qcTYeeILEEVxkZbZKscg8IC3K4fYOstWUeMEJm
         WJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKHZjDXS5Wk7oWjMpFocEspWZD3JWVlcV2qAjmTuWhk=;
        b=ibBd5GqiJ/nraMlKbeXmx7meiHXx+RKRAdBa3RX320lcTCXXQtGeMMklQ6qnZbZIfl
         6ZhHMxvtXFlnyjsIp1WGqrXGHx2s+Fj7dy+G9RauDfIZNAJeHpR4Z3XF6EHWGKqBo80f
         zZ4E4wpiYneug4192ngRkfocap4jCLm1BdolUDLAsyzHriSvsjuBCtNBowY0+xhSHRjR
         FsO1bPRSOjGSThv07Ythh4i2wO3LuKraqrzZKhXL++hrcOP0g976RW/9yifUQxV569ra
         1L1r0eBa8ChmqO85l4WugxupJCL3d0d/bPyyIktaN0/pNMiOxSIX/ii/217X9KmLQc2/
         riKg==
X-Gm-Message-State: AOAM533mHuXlC/igsj0bSdJcsWHVaMnJfEbSx/GB/Xqo14I2TkjvO2hB
        xQThgm/It/njhCY4ih2QMnskzyB7K13DlnLT
X-Google-Smtp-Source: ABdhPJxEI9CTrcH7cLKH8SMK+/MqFoD5eOLr8+HmyVYK7rNQiRfzPxdhs2RmQDuhmV9TbA0vDEp+SA==
X-Received: by 2002:a05:620a:25b:: with SMTP id q27mr8802956qkn.180.1621383556055;
        Tue, 18 May 2021 17:19:16 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id i9sm14998529qtg.18.2021.05.18.17.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 17:19:15 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] clk: qcom: add support for SM8350 DISPCC
Date:   Tue, 18 May 2021 20:18:01 -0400
Message-Id: <20210519001802.1863-1-jonathan@marek.ca>
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
v2: improved diff (don't move sm8150 case around), update comment

 drivers/clk/qcom/Kconfig         |  4 +--
 drivers/clk/qcom/dispcc-sm8250.c | 61 +++++++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 3 deletions(-)

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
index de09cd5c209f..5f22a715e2f0 100644
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
@@ -1051,7 +1056,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* note: trion == lucid, except for the prepare() op */
+	/* Apply differences for SM8150 and SM8350 */
 	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
 		disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
@@ -1062,8 +1067,62 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
 		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
 		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+	} else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
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
 	}
 
+	/* note for SM8350: downstream lucid_5lpe configure differs slightly */
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 
-- 
2.26.1

