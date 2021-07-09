Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6AB3C29FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 22:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhGIUHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 16:07:09 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11973 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbhGIUHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 16:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861062; x=1657397062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w2FPwSamsd/rCwAK5Ir4b+je98r7+IqWV881GzgT8vg=;
  b=cLYtUkDwh7oibFTdKCBWXxDOnyjOmW5pDO09EPIaOoRPPLaG/6nHWmS+
   QHMSxkv0EiCqDdbbZpDrzjsG+6V/WfwB2B5JBiADRsToZiLZGenaBmWBL
   QbsQi45GVjedAsiUc52Sgh+u20DM8Wk9XGqeWsp9KNU3TbVVJIgrBVe51
   g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:04:21 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:04:21 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:04:20 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 4/5] clk: qcom: Add support for SDX65 RPMh clocks
Date:   Fri, 9 Jul 2021 13:03:38 -0700
Message-ID: <20210709200339.17638-5-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709200339.17638-1-quic_vamslank@quicinc.com>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add support for clocks maintained by RPMh in SDX65 SoCs.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
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

