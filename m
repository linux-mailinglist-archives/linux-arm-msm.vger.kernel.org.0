Return-Path: <linux-arm-msm+bounces-26383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD06933374
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 600A01C22790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE802145A16;
	Tue, 16 Jul 2024 21:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3XYZPvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531C143C46
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164423; cv=none; b=HmCmG6GVJQvoCZISVr1NV4VRaAQyOyfaoAh6il0MYl9zBoaYbACNh2n8Jn2zH9AZ+xUNvOUdNucI8/RveJyN7mMPteRJKI8TeTwDmoMvOaB6asRD/Rge//LSJb8DD6CDzYUclLtnO9JyCJVKYuyCmRtedvBU5TQuhxW4qzrmyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164423; c=relaxed/simple;
	bh=Ay5x2c8uaGMd7OciE614FI/0AAqMG8ckUvyq6AVaolU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnMWkEV9r9X0cOaD+ERHTpMb+5qKIJ7cGKFAWG8+UhPmnxb4fqzd60fwIQsHBjbqYaUQLlXFQ9KakJ0xmrDKGhqbt881xcUrjyH4oIZLkqYDzbdcKcDpuhF7MJeZFt8tZ/9oxPECEmZV/ZGFvqxI/fLjtXEvYLA4H7SvlEpRiAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3XYZPvM; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eedec7fbc4so42905701fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 14:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721164417; x=1721769217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/TZJ+v10OvfVMJHrf9Arnsb6WeNpMid/C7Do+JJJSg=;
        b=X3XYZPvMYhdedaBAorb9zGbmBGYEjJOxrM0Whx0y65AUTQReGmH9M4UfRvARWbRaoo
         BIq5vmN+s9TIAqqu2c/pMJs8d+To3E+2zi/a/TExPlsFyiZleGIAeIRpSWe0kaju4L+j
         OFt8D6Ep5480hNVU1lDRXdAuEWF7bWtlcAYBWZkY1kT7KEGLPAtZEOw8voD/uLOEd2xx
         Ed+s45m/9D+xB4XAAzWgzq5cfc/wnemBYnaJNHaYi6HRTMK/LGaEKUD/KzerPJUzKhYw
         9nYSy7OBV6IhEQ7iOb11EmL5Qcg854f+go3TGzSahM8uFOeTt6Ic9BJEXBJdcIYUIaw0
         6PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164417; x=1721769217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/TZJ+v10OvfVMJHrf9Arnsb6WeNpMid/C7Do+JJJSg=;
        b=kUYaZVYtERDERs7pTsgVDEqTyhia18nlYUKOx/g+E+C3tbI2qrFXWnbrVFPmQH9IRC
         H3cftpfg/4Ozf79nTt5kzxxugG/q+3GyRzrsXiTqJUl+irXr0PUhJShWtDQtKtMKDUp1
         E11Ewxj32z8pfNpqGU9Cz4bzO2RZ7Jxx6fSdE7qEQbjfkYb8NtBDzLdeji8QLy1UtxX3
         CfxiTwpaJVCVOglrQyfeeqZvUfLmZJMbj36miN4eQCbI2TyY3E1WCN9cJ16OCcJqTGWj
         Ik3J1G6Ti7zPzovveHnc2c6DhOaGjBMPrsyFeuD5m0CofG0qCsqtUezCF3+527/qrxv6
         AITA==
X-Gm-Message-State: AOJu0YyGFVwh0DHo2ZgeRmcRdLW5eoeL20rpajKFeuspWtPjv46VzwIq
	in6eAIzUO1/vm2fvo/jppSBWVN34jRtAycK6ICK+C2dvgIc3OzaO0cc+nrVVcMA=
X-Google-Smtp-Source: AGHT+IFzda7d5219K7Ew6Z3V+R9sM5T9C9CFPMOStz0JFjN47VfFHzWODb2s4pOyTYekk5fuwLlggg==
X-Received: by 2002:a2e:92c3:0:b0:2ed:58c4:9579 with SMTP id 38308e7fff4ca-2eef415fefamr23915051fa.2.1721164416936;
        Tue, 16 Jul 2024 14:13:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e723sm12433871fa.24.2024.07.16.14.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:13:33 +0300
Subject: [PATCH 6/7] clk: qcom: fold dispcc-sm8650 info dispcc-sm8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v1-6-efb4d927dc9a@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=58030;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ay5x2c8uaGMd7OciE614FI/0AAqMG8ckUvyq6AVaolU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmluJ6XxmR1pwC0Cdrx6eZsZa/kaFC2ip34aSml
 r1qX3RREqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpbiegAKCRCLPIo+Aiko
 1XCLB/9MqDSbqkTzQV7zMpZxwUJqD45meHc+qkXZ+3WKR3K5+sgzJ0R8XxDmWB8hdYkfqovOgg4
 Z22BTWb4f7jXeu8Iozp8hM//gHuvNR37UNWd/iAntrZJssdb0Lv3qWF3pnW5ZJDrkDuoMesvoeG
 5gn3hFG2eV9Sm0aVMvy/m+csI/oDnbwE/IV9anPEJG5E8HYGdettFVZz+nerfpFhHAPI9QELXII
 jexU2nP0p5lbdFZX7OTAX8NKUaQ4qDdmPuY7c/DmEaD0ewW3+g9cGQLB9JQu4cj+qtLc3TMPhCN
 AsGsy0UL4X/b/Ovwcg8oHQIhUPENDLMJas2YsuJY9i0VstNi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is a very minor difference between display clock controller
drivers for SM8550 and SM8650 platforms. Fold the second one into the
first one to reduce kernel footprint. The bindings for these two
hardware blocks are fully compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Kconfig         |   14 +-
 drivers/clk/qcom/Makefile        |    1 -
 drivers/clk/qcom/dispcc-sm8550.c |   22 +-
 drivers/clk/qcom/dispcc-sm8650.c | 1796 --------------------------------------
 4 files changed, 22 insertions(+), 1811 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 11ae28430dad..497eed16a7d7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -931,20 +931,10 @@ config SM_DISPCC_8450
 config SM_DISPCC_8550
 	tristate "SM8550 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	depends on SM_GCC_8550
+	depends on SM_GCC_8550 || SM_GCC_8650
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
-	  SM8550 devices.
-	  Say Y if you want to support display devices and functionality such as
-	  splash screen.
-
-config SM_DISPCC_8650
-	tristate "SM8650 Display Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	select SM_GCC_8650
-	help
-	  Support for the display clock controller on Qualcomm Technologies, Inc
-	  SM8650 devices.
+	  SM8550 or SM8650 devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 0de5fce6113a..c8149ef37fe0 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -121,7 +121,6 @@ obj-$(CONFIG_SM_DISPCC_7150) += dispcc-sm7150.o
 obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
 obj-$(CONFIG_SM_DISPCC_8450) += dispcc-sm8450.o
 obj-$(CONFIG_SM_DISPCC_8550) += dispcc-sm8550.o
-obj-$(CONFIG_SM_DISPCC_8650) += dispcc-sm8650.o
 obj-$(CONFIG_SM_GCC_4450) += gcc-sm4450.o
 obj-$(CONFIG_SM_GCC_6115) += gcc-sm6115.o
 obj-$(CONFIG_SM_GCC_6125) += gcc-sm6125.o
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index a476be3403ba..78e11eade2ea 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -71,7 +71,7 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static const struct pll_vco lucid_ole_vco[] = {
+static struct pll_vco lucid_ole_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
@@ -594,6 +594,18 @@ static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src_sm8650[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(85714286, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(100000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(150000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(200000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(325000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(402000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(514000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.cmd_rcgr = 0x80d8,
 	.mnd_width = 0,
@@ -1739,6 +1751,7 @@ static struct qcom_cc_desc disp_cc_sm8550_desc = {
 
 static const struct of_device_id disp_cc_sm8550_match_table[] = {
 	{ .compatible = "qcom,sm8550-dispcc" },
+	{ .compatible = "qcom,sm8650-dispcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8550_match_table);
@@ -1762,6 +1775,11 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-dispcc")) {
+		lucid_ole_vco.max_freq = 2100000000;
+		disp_cc_mdss_mdp_clk_src.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src_sm8650;
+	}
+
 	clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 
@@ -1795,5 +1813,5 @@ static struct platform_driver disp_cc_sm8550_driver = {
 
 module_platform_driver(disp_cc_sm8550_driver);
 
-MODULE_DESCRIPTION("QTI DISPCC SM8550 Driver");
+MODULE_DESCRIPTION("QTI DISPCC SM8550 / SM8650  Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
deleted file mode 100644
index ce563cf93235..000000000000
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ /dev/null
@@ -1,1796 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved
- * Copyright (c) 2023, Linaro Ltd.
- */
-
-#include <linux/clk-provider.h>
-#include <linux/err.h>
-#include <linux/kernel.h>
-#include <linux/mod_devicetable.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
-#include <linux/regmap.h>
-
-#include <dt-bindings/clock/qcom,sm8650-dispcc.h>
-
-#include "common.h"
-#include "clk-alpha-pll.h"
-#include "clk-branch.h"
-#include "clk-pll.h"
-#include "clk-rcg.h"
-#include "clk-regmap.h"
-#include "clk-regmap-divider.h"
-#include "reset.h"
-#include "gdsc.h"
-
-/* Need to match the order of clocks in DT binding */
-enum {
-	DT_BI_TCXO,
-	DT_BI_TCXO_AO,
-	DT_AHB_CLK,
-	DT_SLEEP_CLK,
-
-	DT_DSI0_PHY_PLL_OUT_BYTECLK,
-	DT_DSI0_PHY_PLL_OUT_DSICLK,
-	DT_DSI1_PHY_PLL_OUT_BYTECLK,
-	DT_DSI1_PHY_PLL_OUT_DSICLK,
-
-	DT_DP0_PHY_PLL_LINK_CLK,
-	DT_DP0_PHY_PLL_VCO_DIV_CLK,
-	DT_DP1_PHY_PLL_LINK_CLK,
-	DT_DP1_PHY_PLL_VCO_DIV_CLK,
-	DT_DP2_PHY_PLL_LINK_CLK,
-	DT_DP2_PHY_PLL_VCO_DIV_CLK,
-	DT_DP3_PHY_PLL_LINK_CLK,
-	DT_DP3_PHY_PLL_VCO_DIV_CLK,
-};
-
-#define DISP_CC_MISC_CMD	0xF000
-
-enum {
-	P_BI_TCXO,
-	P_DISP_CC_PLL0_OUT_MAIN,
-	P_DISP_CC_PLL1_OUT_EVEN,
-	P_DISP_CC_PLL1_OUT_MAIN,
-	P_DP0_PHY_PLL_LINK_CLK,
-	P_DP0_PHY_PLL_VCO_DIV_CLK,
-	P_DP1_PHY_PLL_LINK_CLK,
-	P_DP1_PHY_PLL_VCO_DIV_CLK,
-	P_DP2_PHY_PLL_LINK_CLK,
-	P_DP2_PHY_PLL_VCO_DIV_CLK,
-	P_DP3_PHY_PLL_LINK_CLK,
-	P_DP3_PHY_PLL_VCO_DIV_CLK,
-	P_DSI0_PHY_PLL_OUT_BYTECLK,
-	P_DSI0_PHY_PLL_OUT_DSICLK,
-	P_DSI1_PHY_PLL_OUT_BYTECLK,
-	P_DSI1_PHY_PLL_OUT_DSICLK,
-	P_SLEEP_CLK,
-};
-
-static const struct pll_vco lucid_ole_vco[] = {
-	{ 249600000, 2100000000, 0 },
-};
-
-static const struct alpha_pll_config disp_cc_pll0_config = {
-	.l = 0xd,
-	.alpha = 0x6492,
-	.config_ctl_val = 0x20485699,
-	.config_ctl_hi_val = 0x00182261,
-	.config_ctl_hi1_val = 0x82aa299c,
-	.test_ctl_val = 0x00000000,
-	.test_ctl_hi_val = 0x00000003,
-	.test_ctl_hi1_val = 0x00009000,
-	.test_ctl_hi2_val = 0x00000034,
-	.user_ctl_val = 0x00000000,
-	.user_ctl_hi_val = 0x00000005,
-};
-
-static struct clk_alpha_pll disp_cc_pll0 = {
-	.offset = 0x0,
-	.vco_table = lucid_ole_vco,
-	.num_vco = ARRAY_SIZE(lucid_ole_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
-	.clkr = {
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_pll0",
-			.parent_data = &(const struct clk_parent_data) {
-				.index = DT_BI_TCXO,
-			},
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_reset_lucid_ole_ops,
-		},
-	},
-};
-
-static const struct alpha_pll_config disp_cc_pll1_config = {
-	.l = 0x1f,
-	.alpha = 0x4000,
-	.config_ctl_val = 0x20485699,
-	.config_ctl_hi_val = 0x00182261,
-	.config_ctl_hi1_val = 0x82aa299c,
-	.test_ctl_val = 0x00000000,
-	.test_ctl_hi_val = 0x00000003,
-	.test_ctl_hi1_val = 0x00009000,
-	.test_ctl_hi2_val = 0x00000034,
-	.user_ctl_val = 0x00000000,
-	.user_ctl_hi_val = 0x00000005,
-};
-
-static struct clk_alpha_pll disp_cc_pll1 = {
-	.offset = 0x1000,
-	.vco_table = lucid_ole_vco,
-	.num_vco = ARRAY_SIZE(lucid_ole_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
-	.clkr = {
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_pll1",
-			.parent_data = &(const struct clk_parent_data) {
-				.index = DT_BI_TCXO,
-			},
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_reset_lucid_ole_ops,
-		},
-	},
-};
-
-static const struct parent_map disp_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_0_ao[] = {
-	{ .index = DT_BI_TCXO_AO },
-};
-
-static const struct parent_map disp_cc_parent_map_1[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
-	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
-	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .index = DT_BI_TCXO },
-	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
-	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
-	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
-};
-
-static const struct parent_map disp_cc_parent_map_2[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
-	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_2[] = {
-	{ .index = DT_BI_TCXO },
-	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
-	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
-	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
-	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
-};
-
-static const struct parent_map disp_cc_parent_map_3[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
-	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
-	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .index = DT_BI_TCXO },
-	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
-	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
-	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
-};
-
-static const struct parent_map disp_cc_parent_map_4[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
-	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
-	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
-	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
-	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_4[] = {
-	{ .index = DT_BI_TCXO },
-	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
-	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
-	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
-	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
-	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
-};
-
-static const struct parent_map disp_cc_parent_map_5[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .index = DT_BI_TCXO },
-	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
-	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
-};
-
-static const struct parent_map disp_cc_parent_map_6[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
-	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_6[] = {
-	{ .index = DT_BI_TCXO },
-	{ .hw = &disp_cc_pll1.clkr.hw },
-	{ .hw = &disp_cc_pll1.clkr.hw },
-};
-
-static const struct parent_map disp_cc_parent_map_7[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
-	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
-	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
-	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_7[] = {
-	{ .index = DT_BI_TCXO },
-	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
-	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
-	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
-	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
-};
-
-static const struct parent_map disp_cc_parent_map_8[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
-	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
-	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_8[] = {
-	{ .index = DT_BI_TCXO },
-	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .hw = &disp_cc_pll1.clkr.hw },
-	{ .hw = &disp_cc_pll1.clkr.hw },
-};
-
-static const struct parent_map disp_cc_parent_map_9[] = {
-	{ P_SLEEP_CLK, 0 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_9[] = {
-	{ .index = DT_SLEEP_CLK },
-};
-
-static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
-	F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
-	.cmd_rcgr = 0x82e8,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_6,
-	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_ahb_clk_src",
-		.parent_data = disp_cc_parent_data_6,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
-	},
-};
-
-static const struct freq_tbl ftbl_disp_cc_mdss_byte0_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
-	.cmd_rcgr = 0x8108,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_2,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_byte0_clk_src",
-		.parent_data = disp_cc_parent_data_2,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_byte2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
-	.cmd_rcgr = 0x8124,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_2,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_byte1_clk_src",
-		.parent_data = disp_cc_parent_data_2,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_byte2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
-	.cmd_rcgr = 0x81bc,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx0_aux_clk_src",
-		.parent_data = disp_cc_parent_data_0,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
-	.cmd_rcgr = 0x8170,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_7,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx0_link_clk_src",
-		.parent_data = disp_cc_parent_data_7,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_byte2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx0_pixel0_clk_src = {
-	.cmd_rcgr = 0x818c,
-	.mnd_width = 16,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_4,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx0_pixel0_clk_src",
-		.parent_data = disp_cc_parent_data_4,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx0_pixel1_clk_src = {
-	.cmd_rcgr = 0x81a4,
-	.mnd_width = 16,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_4,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx0_pixel1_clk_src",
-		.parent_data = disp_cc_parent_data_4,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
-	.cmd_rcgr = 0x8220,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx1_aux_clk_src",
-		.parent_data = disp_cc_parent_data_0,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
-	.cmd_rcgr = 0x8204,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_3,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx1_link_clk_src",
-		.parent_data = disp_cc_parent_data_3,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_byte2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx1_pixel0_clk_src = {
-	.cmd_rcgr = 0x81d4,
-	.mnd_width = 16,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_1,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx1_pixel0_clk_src",
-		.parent_data = disp_cc_parent_data_1,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx1_pixel1_clk_src = {
-	.cmd_rcgr = 0x81ec,
-	.mnd_width = 16,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_1,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx1_pixel1_clk_src",
-		.parent_data = disp_cc_parent_data_1,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
-	.cmd_rcgr = 0x8284,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx2_aux_clk_src",
-		.parent_data = disp_cc_parent_data_0,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
-	.cmd_rcgr = 0x8238,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_3,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx2_link_clk_src",
-		.parent_data = disp_cc_parent_data_3,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_byte2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx2_pixel0_clk_src = {
-	.cmd_rcgr = 0x8254,
-	.mnd_width = 16,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_1,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx2_pixel0_clk_src",
-		.parent_data = disp_cc_parent_data_1,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx2_pixel1_clk_src = {
-	.cmd_rcgr = 0x826c,
-	.mnd_width = 16,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_1,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx2_pixel1_clk_src",
-		.parent_data = disp_cc_parent_data_1,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
-	.cmd_rcgr = 0x82d0,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx3_aux_clk_src",
-		.parent_data = disp_cc_parent_data_0,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
-	.cmd_rcgr = 0x82b4,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_3,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx3_link_clk_src",
-		.parent_data = disp_cc_parent_data_3,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_byte2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_dptx3_pixel0_clk_src = {
-	.cmd_rcgr = 0x829c,
-	.mnd_width = 16,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_1,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx3_pixel0_clk_src",
-		.parent_data = disp_cc_parent_data_1,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
-	.cmd_rcgr = 0x8140,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_5,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_esc0_clk_src",
-		.parent_data = disp_cc_parent_data_5,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
-	.cmd_rcgr = 0x8158,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_5,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_esc1_clk_src",
-		.parent_data = disp_cc_parent_data_5,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
-	},
-};
-
-static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(85714286, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(100000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(150000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(200000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(325000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(402000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(514000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
-	.cmd_rcgr = 0x80d8,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_8,
-	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_mdp_clk_src",
-		.parent_data = disp_cc_parent_data_8,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_8),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
-	.cmd_rcgr = 0x80a8,
-	.mnd_width = 8,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_2,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_pclk0_clk_src",
-		.parent_data = disp_cc_parent_data_2,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_pixel_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
-	.cmd_rcgr = 0x80c0,
-	.mnd_width = 8,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_2,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_pclk1_clk_src",
-		.parent_data = disp_cc_parent_data_2,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_pixel_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
-	.cmd_rcgr = 0x80f0,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_vsync_clk_src",
-		.parent_data = disp_cc_parent_data_0,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static const struct freq_tbl ftbl_disp_cc_sleep_clk_src[] = {
-	F(32000, P_SLEEP_CLK, 1, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 disp_cc_sleep_clk_src = {
-	.cmd_rcgr = 0xe05c,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_9,
-	.freq_tbl = ftbl_disp_cc_sleep_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_sleep_clk_src",
-		.parent_data = disp_cc_parent_data_9,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_rcg2 disp_cc_xo_clk_src = {
-	.cmd_rcgr = 0xe03c,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_xo_clk_src",
-		.parent_data = disp_cc_parent_data_0_ao,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0_ao),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
-	.reg = 0x8120,
-	.shift = 0,
-	.width = 4,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_byte0_div_clk_src",
-		.parent_hws = (const struct clk_hw*[]) {
-			&disp_cc_mdss_byte0_clk_src.clkr.hw,
-		},
-		.num_parents = 1,
-		.ops = &clk_regmap_div_ops,
-	},
-};
-
-static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
-	.reg = 0x813c,
-	.shift = 0,
-	.width = 4,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_byte1_div_clk_src",
-		.parent_hws = (const struct clk_hw*[]) {
-			&disp_cc_mdss_byte1_clk_src.clkr.hw,
-		},
-		.num_parents = 1,
-		.ops = &clk_regmap_div_ops,
-	},
-};
-
-static struct clk_regmap_div disp_cc_mdss_dptx0_link_div_clk_src = {
-	.reg = 0x8188,
-	.shift = 0,
-	.width = 4,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx0_link_div_clk_src",
-		.parent_hws = (const struct clk_hw*[]) {
-			&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_regmap_div_ro_ops,
-	},
-};
-
-static struct clk_regmap_div disp_cc_mdss_dptx1_link_div_clk_src = {
-	.reg = 0x821c,
-	.shift = 0,
-	.width = 4,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx1_link_div_clk_src",
-		.parent_hws = (const struct clk_hw*[]) {
-			&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_regmap_div_ro_ops,
-	},
-};
-
-static struct clk_regmap_div disp_cc_mdss_dptx2_link_div_clk_src = {
-	.reg = 0x8250,
-	.shift = 0,
-	.width = 4,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx2_link_div_clk_src",
-		.parent_hws = (const struct clk_hw*[]) {
-			&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_regmap_div_ro_ops,
-	},
-};
-
-static struct clk_regmap_div disp_cc_mdss_dptx3_link_div_clk_src = {
-	.reg = 0x82cc,
-	.shift = 0,
-	.width = 4,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_dptx3_link_div_clk_src",
-		.parent_hws = (const struct clk_hw*[]) {
-			&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_regmap_div_ro_ops,
-	},
-};
-
-static struct clk_branch disp_cc_mdss_accu_clk = {
-	.halt_reg = 0xe058,
-	.halt_check = BRANCH_HALT_VOTED,
-	.clkr = {
-		.enable_reg = 0xe058,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_accu_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_xo_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_ahb1_clk = {
-	.halt_reg = 0xa020,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xa020,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_ahb1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_ahb_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_ahb_clk = {
-	.halt_reg = 0x80a4,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x80a4,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_ahb_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_ahb_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_byte0_clk = {
-	.halt_reg = 0x8028,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8028,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_byte0_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_byte0_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
-	.halt_reg = 0x802c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x802c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_byte0_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_byte1_clk = {
-	.halt_reg = 0x8030,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8030,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_byte1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_byte1_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
-	.halt_reg = 0x8034,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8034,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_byte1_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx0_aux_clk = {
-	.halt_reg = 0x8058,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8058,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx0_aux_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx0_crypto_clk = {
-	.halt_reg = 0x804c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x804c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx0_crypto_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx0_link_clk = {
-	.halt_reg = 0x8040,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8040,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx0_link_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx0_link_intf_clk = {
-	.halt_reg = 0x8048,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8048,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx0_link_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx0_pixel0_clk = {
-	.halt_reg = 0x8050,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8050,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx0_pixel0_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx0_pixel1_clk = {
-	.halt_reg = 0x8054,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8054,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx0_pixel1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
-	.halt_reg = 0x8044,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8044,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx0_usb_router_link_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx1_aux_clk = {
-	.halt_reg = 0x8074,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8074,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx1_aux_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx1_crypto_clk = {
-	.halt_reg = 0x8070,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8070,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx1_crypto_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx1_link_clk = {
-	.halt_reg = 0x8064,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8064,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx1_link_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx1_link_intf_clk = {
-	.halt_reg = 0x806c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x806c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx1_link_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx1_pixel0_clk = {
-	.halt_reg = 0x805c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x805c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx1_pixel0_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx1_pixel1_clk = {
-	.halt_reg = 0x8060,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8060,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx1_pixel1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
-	.halt_reg = 0x8068,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8068,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx2_aux_clk = {
-	.halt_reg = 0x808c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x808c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx2_aux_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx2_crypto_clk = {
-	.halt_reg = 0x8088,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8088,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx2_crypto_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx2_link_clk = {
-	.halt_reg = 0x8080,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8080,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx2_link_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx2_link_intf_clk = {
-	.halt_reg = 0x8084,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8084,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx2_link_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx2_pixel0_clk = {
-	.halt_reg = 0x8078,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8078,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx2_pixel0_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx2_pixel1_clk = {
-	.halt_reg = 0x807c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x807c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx2_pixel1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx3_aux_clk = {
-	.halt_reg = 0x809c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x809c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx3_aux_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx3_crypto_clk = {
-	.halt_reg = 0x80a0,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x80a0,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx3_crypto_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx3_link_clk = {
-	.halt_reg = 0x8094,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8094,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx3_link_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx3_link_intf_clk = {
-	.halt_reg = 0x8098,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8098,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx3_link_intf_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_dptx3_pixel0_clk = {
-	.halt_reg = 0x8090,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8090,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_dptx3_pixel0_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_esc0_clk = {
-	.halt_reg = 0x8038,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8038,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_esc0_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_esc0_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_esc1_clk = {
-	.halt_reg = 0x803c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x803c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_esc1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_esc1_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_mdp1_clk = {
-	.halt_reg = 0xa004,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xa004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_mdp1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_mdp_clk = {
-	.halt_reg = 0x800c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x800c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_mdp_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
-	.halt_reg = 0xa010,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xa010,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_mdp_lut1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
-	.halt_reg = 0x8018,
-	.halt_check = BRANCH_HALT_VOTED,
-	.clkr = {
-		.enable_reg = 0x8018,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_mdp_lut_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
-	.halt_reg = 0xc004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.clkr = {
-		.enable_reg = 0xc004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_ahb_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_pclk0_clk = {
-	.halt_reg = 0x8004,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_pclk0_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_pclk1_clk = {
-	.halt_reg = 0x8008,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8008,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_pclk1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
-	.halt_reg = 0xc00c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xc00c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_rscc_ahb_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_ahb_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
-	.halt_reg = 0xc008,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xc008,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_rscc_vsync_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_vsync_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_vsync1_clk = {
-	.halt_reg = 0xa01c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xa01c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_vsync1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_vsync_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_mdss_vsync_clk = {
-	.halt_reg = 0x8024,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8024,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_mdss_vsync_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_vsync_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch disp_cc_sleep_clk = {
-	.halt_reg = 0xe074,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xe074,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_sleep_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_sleep_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct gdsc mdss_gdsc = {
-	.gdscr = 0x9000,
-	.pd = {
-		.name = "mdss_gdsc",
-	},
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
-};
-
-static struct gdsc mdss_int2_gdsc = {
-	.gdscr = 0xb000,
-	.pd = {
-		.name = "mdss_int2_gdsc",
-	},
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
-};
-
-static struct clk_regmap *disp_cc_sm8650_clocks[] = {
-	[DISP_CC_MDSS_ACCU_CLK] = &disp_cc_mdss_accu_clk.clkr,
-	[DISP_CC_MDSS_AHB1_CLK] = &disp_cc_mdss_ahb1_clk.clkr,
-	[DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
-	[DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
-	[DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
-	[DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
-	[DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
-	[DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
-	[DISP_CC_MDSS_BYTE1_CLK] = &disp_cc_mdss_byte1_clk.clkr,
-	[DISP_CC_MDSS_BYTE1_CLK_SRC] = &disp_cc_mdss_byte1_clk_src.clkr,
-	[DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &disp_cc_mdss_byte1_div_clk_src.clkr,
-	[DISP_CC_MDSS_BYTE1_INTF_CLK] = &disp_cc_mdss_byte1_intf_clk.clkr,
-	[DISP_CC_MDSS_DPTX0_AUX_CLK] = &disp_cc_mdss_dptx0_aux_clk.clkr,
-	[DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &disp_cc_mdss_dptx0_aux_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &disp_cc_mdss_dptx0_crypto_clk.clkr,
-	[DISP_CC_MDSS_DPTX0_LINK_CLK] = &disp_cc_mdss_dptx0_link_clk.clkr,
-	[DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &disp_cc_mdss_dptx0_link_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx0_link_div_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &disp_cc_mdss_dptx0_link_intf_clk.clkr,
-	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &disp_cc_mdss_dptx0_pixel0_clk.clkr,
-	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &disp_cc_mdss_dptx0_pixel1_clk.clkr,
-	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
-		&disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
-	[DISP_CC_MDSS_DPTX1_AUX_CLK] = &disp_cc_mdss_dptx1_aux_clk.clkr,
-	[DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &disp_cc_mdss_dptx1_aux_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &disp_cc_mdss_dptx1_crypto_clk.clkr,
-	[DISP_CC_MDSS_DPTX1_LINK_CLK] = &disp_cc_mdss_dptx1_link_clk.clkr,
-	[DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &disp_cc_mdss_dptx1_link_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx1_link_div_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &disp_cc_mdss_dptx1_link_intf_clk.clkr,
-	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &disp_cc_mdss_dptx1_pixel0_clk.clkr,
-	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &disp_cc_mdss_dptx1_pixel1_clk.clkr,
-	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
-		&disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
-	[DISP_CC_MDSS_DPTX2_AUX_CLK] = &disp_cc_mdss_dptx2_aux_clk.clkr,
-	[DISP_CC_MDSS_DPTX2_AUX_CLK_SRC] = &disp_cc_mdss_dptx2_aux_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX2_CRYPTO_CLK] = &disp_cc_mdss_dptx2_crypto_clk.clkr,
-	[DISP_CC_MDSS_DPTX2_LINK_CLK] = &disp_cc_mdss_dptx2_link_clk.clkr,
-	[DISP_CC_MDSS_DPTX2_LINK_CLK_SRC] = &disp_cc_mdss_dptx2_link_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx2_link_div_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX2_LINK_INTF_CLK] = &disp_cc_mdss_dptx2_link_intf_clk.clkr,
-	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK] = &disp_cc_mdss_dptx2_pixel0_clk.clkr,
-	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx2_pixel0_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK] = &disp_cc_mdss_dptx2_pixel1_clk.clkr,
-	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx2_pixel1_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX3_AUX_CLK] = &disp_cc_mdss_dptx3_aux_clk.clkr,
-	[DISP_CC_MDSS_DPTX3_AUX_CLK_SRC] = &disp_cc_mdss_dptx3_aux_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX3_CRYPTO_CLK] = &disp_cc_mdss_dptx3_crypto_clk.clkr,
-	[DISP_CC_MDSS_DPTX3_LINK_CLK] = &disp_cc_mdss_dptx3_link_clk.clkr,
-	[DISP_CC_MDSS_DPTX3_LINK_CLK_SRC] = &disp_cc_mdss_dptx3_link_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx3_link_div_clk_src.clkr,
-	[DISP_CC_MDSS_DPTX3_LINK_INTF_CLK] = &disp_cc_mdss_dptx3_link_intf_clk.clkr,
-	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK] = &disp_cc_mdss_dptx3_pixel0_clk.clkr,
-	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx3_pixel0_clk_src.clkr,
-	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
-	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
-	[DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
-	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
-	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
-	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
-	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
-	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
-	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
-	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
-	[DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
-	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
-	[DISP_CC_MDSS_PCLK1_CLK] = &disp_cc_mdss_pclk1_clk.clkr,
-	[DISP_CC_MDSS_PCLK1_CLK_SRC] = &disp_cc_mdss_pclk1_clk_src.clkr,
-	[DISP_CC_MDSS_RSCC_AHB_CLK] = &disp_cc_mdss_rscc_ahb_clk.clkr,
-	[DISP_CC_MDSS_RSCC_VSYNC_CLK] = &disp_cc_mdss_rscc_vsync_clk.clkr,
-	[DISP_CC_MDSS_VSYNC1_CLK] = &disp_cc_mdss_vsync1_clk.clkr,
-	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
-	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
-	[DISP_CC_PLL0] = &disp_cc_pll0.clkr,
-	[DISP_CC_PLL1] = &disp_cc_pll1.clkr,
-	[DISP_CC_SLEEP_CLK] = &disp_cc_sleep_clk.clkr,
-	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
-	[DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
-};
-
-static const struct qcom_reset_map disp_cc_sm8650_resets[] = {
-	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
-	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
-	[DISP_CC_MDSS_RSCC_BCR] = { 0xc000 },
-};
-
-static struct gdsc *disp_cc_sm8650_gdscs[] = {
-	[MDSS_GDSC] = &mdss_gdsc,
-	[MDSS_INT2_GDSC] = &mdss_int2_gdsc,
-};
-
-static const struct regmap_config disp_cc_sm8650_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x11008,
-	.fast_io = true,
-};
-
-static struct qcom_cc_desc disp_cc_sm8650_desc = {
-	.config = &disp_cc_sm8650_regmap_config,
-	.clks = disp_cc_sm8650_clocks,
-	.num_clks = ARRAY_SIZE(disp_cc_sm8650_clocks),
-	.resets = disp_cc_sm8650_resets,
-	.num_resets = ARRAY_SIZE(disp_cc_sm8650_resets),
-	.gdscs = disp_cc_sm8650_gdscs,
-	.num_gdscs = ARRAY_SIZE(disp_cc_sm8650_gdscs),
-};
-
-static const struct of_device_id disp_cc_sm8650_match_table[] = {
-	{ .compatible = "qcom,sm8650-dispcc" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, disp_cc_sm8650_match_table);
-
-static int disp_cc_sm8650_probe(struct platform_device *pdev)
-{
-	struct regmap *regmap;
-	int ret;
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	regmap = qcom_cc_map(pdev, &disp_cc_sm8650_desc);
-	if (IS_ERR(regmap)) {
-		ret = PTR_ERR(regmap);
-		goto err_put_rpm;
-	}
-
-	clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-	clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
-
-	/* Enable clock gating for MDP clocks */
-	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8650_desc, regmap);
-	if (ret)
-		goto err_put_rpm;
-
-	pm_runtime_put(&pdev->dev);
-
-	return 0;
-
-err_put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
-
-	return ret;
-}
-
-static struct platform_driver disp_cc_sm8650_driver = {
-	.probe = disp_cc_sm8650_probe,
-	.driver = {
-		.name = "disp_cc-sm8650",
-		.of_match_table = disp_cc_sm8650_match_table,
-	},
-};
-
-module_platform_driver(disp_cc_sm8650_driver);
-
-MODULE_DESCRIPTION("QTI DISPCC SM8650 Driver");
-MODULE_LICENSE("GPL");

-- 
2.39.2


