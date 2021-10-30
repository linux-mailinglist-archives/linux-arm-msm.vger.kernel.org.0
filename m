Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13B1440609
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 02:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhJ3ADf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 20:03:35 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:29137 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231726AbhJ3AD3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 20:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635552060; x=1667088060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EGzifhUa+JIC78rSBB1UVH79TnxAv+0tkks9jF940Bk=;
  b=alV+Mx3ZD3ZrEOx+FArPEPALo8vV6XxukN+X8GchZw4w4iUST5Um+8J8
   IpSEQRiOJR3h7iPdeRLyyGbg0tg6mLdWDOdFrk4b9uoCPm89CVZhDyISR
   N3AQL3hMgKJkrBazpPVaYUJ73bG9LrH4fEfxRqEt4UayHOkRQQzqpfF+W
   Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 17:01:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 17:01:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:00:59 -0700
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:00:59 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v3 5/6] clk: qcom: Add support for SDX65 RPMh clocks
Date:   Fri, 29 Oct 2021 17:00:41 -0700
Message-ID: <1635552042-16250-6-git-send-email-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635552042-16250-1-git-send-email-quic_vamslank@quicinc.com>
References: <1635552042-16250-1-git-send-email-quic_vamslank@quicinc.com>
MIME-Version: 1.0
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
index 441d7a2..30b26fb 100644
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
2.7.4

