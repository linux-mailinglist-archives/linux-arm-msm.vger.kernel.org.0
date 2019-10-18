Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01502DC23F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 12:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633283AbfJRKMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 06:12:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43986 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633218AbfJRKMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 06:12:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B9D6C61136; Fri, 18 Oct 2019 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571393565;
        bh=qQyWt4N0PfQUuGUcmF8g2Od8g0wOfG0DWFA70BBTCvo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CIsGHCGtt4S1ecanP4P6hDIBg+YH8NvjI30y/CUS8vOnTnkcQAZBglme1aes6Xsv3
         Am4W4oMUe61fHqvjDyGrZ1WmRBcQXNVHOUleW78iuzm/ZHhlUHTgTB6M+TmvXLZnao
         2JZKrM1zgn4qn2GDMcbmbOLLSYet61oCltoqzYuM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2521361019;
        Fri, 18 Oct 2019 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571393565;
        bh=qQyWt4N0PfQUuGUcmF8g2Od8g0wOfG0DWFA70BBTCvo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CIsGHCGtt4S1ecanP4P6hDIBg+YH8NvjI30y/CUS8vOnTnkcQAZBglme1aes6Xsv3
         Am4W4oMUe61fHqvjDyGrZ1WmRBcQXNVHOUleW78iuzm/ZHhlUHTgTB6M+TmvXLZnao
         2JZKrM1zgn4qn2GDMcbmbOLLSYet61oCltoqzYuM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2521361019
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 3/3] clk: qcom: clk-rpmh: Add support for RPMHCC for SC7180
Date:   Fri, 18 Oct 2019 15:39:24 +0530
Message-Id: <1571393364-32697-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571393364-32697-1-git-send-email-tdas@codeaurora.org>
References: <1571393364-32697-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for clock RPMh driver to vote for ARC and VRM managed
clock resources.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rpmh.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 96a36f6..7301c77 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -391,6 +391,24 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
 	.num_clks = ARRAY_SIZE(sm8150_rpmh_clocks),
 };

+static struct clk_hw *sc7180_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
+	.clks = sc7180_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sc7180_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -471,6 +489,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
+	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

