Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 424FF91E33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 09:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfHSHmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 03:42:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727086AbfHSHmX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 03:42:23 -0400
Received: from localhost.localdomain (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 021B8204EC;
        Mon, 19 Aug 2019 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566200542;
        bh=BnpTDjTXkIRhKur+oqKtSpkGbgUriCQN7WXMH8kAEXQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pt2kNxkanpdLze9W5t6oOepISNEZcYnv+P+kevZRF3Hwjck/nPG630K0sVTtK8kZL
         +r7lGZoCNYxeOVIk56DeRBw1qFtE8EVDKLivCeN2gNUDhiUdSJXOf3eyPyrl9KvhA1
         1WSgUYbqwjNCT+yhWTQPKpggDVy5YzdMKKy+Ad8Y=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] clk: qcom: clk-rpmh: Add support for SM8150
Date:   Mon, 19 Aug 2019 13:09:47 +0530
Message-Id: <20190819073947.17258-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819073947.17258-1-vkoul@kernel.org>
References: <20190819073947.17258-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for rpmh clocks found in SM8150

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-rpmh.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 16d689e5bb3c..3b304a3fb5c9 100644
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

