Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF60B452BBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 08:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhKPHmc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 02:42:32 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:32394 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230525AbhKPHm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 02:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637048372; x=1668584372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V+1DONEgVk/sF+APY8JhPtut/HUQqenaNQtgqMafquk=;
  b=kuRws4pfysiGmOOKS9X0xaxdMjWSu13qj36GR8SGUlkuV/SmFNF4iUZl
   vghwcB1UGI+NPb6o8fT9qMXEN7LCuKdq7h1PSJ10/Abe9i5OvD+Hg3/Co
   NY0vpzomOAVEDUUPu3JCBoxtaA6JyDyt9mr3ZIj9s8H2K3b9aomeKzKOL
   4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Nov 2021 23:39:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 23:39:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:38:34 -0800
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:38:33 -0800
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: [PATCH v4 5/6] clk: qcom: Add support for SDX65 RPMh clocks
Date:   Mon, 15 Nov 2021 23:38:11 -0800
Message-ID: <1a5ef6e6c9b2e232ff328bb4d68faf1242678f43.1637047731.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637047731.git.quic_vamslank@quicinc.com>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add support for clocks maintained by RPMh in SDX65 SoCs.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 441d7a20e6f3..30b26fb96514 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -556,6 +556,30 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 	.num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
+
+static struct clk_hw *sdx65_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
+	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
+	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
+	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
+	.clks = sdx65_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -643,6 +667,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
+	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
-- 
2.33.1

