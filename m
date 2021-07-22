Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAF63D2ECE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 23:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhGVU3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 16:29:43 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:63516 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231695AbhGVU3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 16:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626988217; x=1658524217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b0Z+eVab3qO+Tk6bZtY8IWGUccYUwVmN3X69qXq4cfk=;
  b=PZMqFA4Pw7p7cRVFj2b+6QTGNhVbaf2PnScecDxx2DoG6pGF+zs2XIhF
   pxuTcIOGjnzwAxe3d7i0yhrNrVOpvR9Xo9HDPRQ03Iy2SFlujnUSIIdQ3
   WshNdL+/KtEWdsCaRBPD445lfPZJnLYFF7iZQ+TkSTuBxOEP0I09CGxJY
   k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jul 2021 14:10:17 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:10:16 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:10:16 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 5/6] clk: qcom: Add support for SDX65 RPMh clocks
Date:   Thu, 22 Jul 2021 14:09:42 -0700
Message-ID: <fed310806d011c704955306a9768512b0bcc7cd4.1626986805.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626986805.git.quic_vamslank@quicinc.com>
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add support for clocks maintained by RPMh in SDX65 SoCs.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 91dc390a583b..f3769b86e5d0 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -477,6 +477,32 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_ARC(sdx65, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
+DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sdx65, rf_clk4, rf_clk4_ao, "rfclka4", 1);
+
+static struct clk_hw *sdx65_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &sdx65_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]        = &sdx65_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
+	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]          = &sdx65_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]        = &sdx65_rf_clk4_ao.hw,
+	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
+	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
+	.clks = sdx65_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
+};
+
 DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
 DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
 DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
@@ -618,6 +644,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
+	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.32.0

