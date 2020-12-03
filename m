Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09842CD003
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 08:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387624AbgLCHEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 02:04:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:50828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387420AbgLCHEV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 02:04:21 -0500
From:   Vinod Koul <vkoul@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] clk: qcom: rpmh: add support for SM8350 rpmh clocks
Date:   Thu,  3 Dec 2020 12:32:38 +0530
Message-Id: <20201203070241.2648874-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201203070241.2648874-1-vkoul@kernel.org>
References: <20201203070241.2648874-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the RPMH clocks present in SM8350 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-rpmh.c           | 34 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmh.h |  8 +++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index e2c669b08aff..64cab4403a17 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -432,6 +432,39 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
+DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
+DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
+
+static struct clk_hw *sm8350_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_DIV_CLK1]		= &sm8350_div_clk1.hw,
+	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
+	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
+	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
+	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
+	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_PKA_CLK]		= &sm8350_pka.hw,
+	[RPMH_HWKM_CLK]		= &sm8350_hwkm.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
+	.clks = sm8350_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm8350_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -519,6 +552,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
+	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 2e6c54e65455..6dbe5d398bf0 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -21,5 +21,13 @@
 #define RPMH_IPA_CLK				12
 #define RPMH_LN_BB_CLK1				13
 #define RPMH_LN_BB_CLK1_A			14
+#define RPMH_DIV_CLK1				15
+#define RPMH_DIV_CLK1_A				16
+#define RPMH_RF_CLK4				17
+#define RPMH_RF_CLK4_A				18
+#define RPMH_RF_CLK5				19
+#define RPMH_RF_CLK5_A				20
+#define RPMH_PKA_CLK				21
+#define RPMH_HWKM_CLK				22
 
 #endif
-- 
2.26.2

