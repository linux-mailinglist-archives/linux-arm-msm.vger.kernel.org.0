Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930C3999CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 19:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389975AbfHVRDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 13:03:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729506AbfHVRDU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 13:03:20 -0400
Received: from localhost.localdomain (unknown [171.61.89.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A852220870;
        Thu, 22 Aug 2019 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566493399;
        bh=eWhlNJrVn2WWDv1wyTndsKzporKdSdo/ivD6WTF+MaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KxSIc4xtCbm+/h88YjlhfuP6n7x8r3kMHQvlNXvbXobqZH+tXOgFfIUsX5GUdDIYD
         d2hoZbCetSRoK4Rvz/kJphaE6p4ulaoDsVUoFuwhSVOBpgrH/BOwSRglACj3g5NvJ9
         XYlopgGEfzGZgJVkXVZfCfTsP2owKhYn6xRKMbbw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] clk: qcom: clk-rpmh: Add support for SM8150
Date:   Thu, 22 Aug 2019 22:31:40 +0530
Message-Id: <20190822170140.7615-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822170140.7615-1-vkoul@kernel.org>
References: <20190822170140.7615-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for rpmh clocks found in SM8150

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 0bced7326a20..5da1ef58dcc4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -374,6 +374,32 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 	.num_clks = ARRAY_SIZE(sdm845_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_ARC(sm8150, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_VRM(sm8150, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(sm8150, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(sm8150, rf_clk1, rf_clk1_ao, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(sm8150, rf_clk2, rf_clk2_ao, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
+
+static struct clk_hw *sm8150_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sm8150_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sm8150_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sm8150_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sm8150_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sm8150_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sm8150_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &sm8150_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sm8150_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sm8150_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sm8150_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]		= &sm8150_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &sm8150_rf_clk3_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
+	.clks = sm8150_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm8150_rpmh_clocks),
+};
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -453,6 +479,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
+	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
-- 
2.20.1

