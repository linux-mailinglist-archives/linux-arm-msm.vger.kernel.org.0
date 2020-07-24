Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97ADF22CA68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 18:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgGXQJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 12:09:36 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:62326 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727774AbgGXQJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 12:09:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595606973; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=IQxPem+5VW7r05RFRPLuHDIBclW0bJ77HNTxrUxaSFI=; b=ca0nSZ6gFoN0pAaoJAXQ5A2SQ/3ZwyYmKN+OhEy5u4uncw8LHzEfOXBWGXTegSCOTYcaDSmA
 dPdfjaWcV3kpm3W5GL/05NP9zKW3nLRMANqXHzvflXL7zDDWprPBBgp2DURk2mCZIj6IQtid
 rNjmM7b7h1IpfU1HHSQz3ixTHBo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f1b079b634c4259e3c0e783 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 16:08:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B86B2C433B1; Fri, 24 Jul 2020 16:08:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 076CAC433AF;
        Fri, 24 Jul 2020 16:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 076CAC433AF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v5 3/4] clk: qcom: gcc: Add support for GCC LPASS clock for SC7180
Date:   Fri, 24 Jul 2020 21:37:57 +0530
Message-Id: <1595606878-2664-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595606878-2664-1-git-send-email-tdas@codeaurora.org>
References: <1595606878-2664-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GCC lpass clock which is required to access the LPASS core
clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index ca4383e..8d3b161 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2251,6 +2251,19 @@ static struct clk_branch gcc_mss_q6_memnoc_axi_clk = {
 	},
 };

+static struct clk_branch gcc_lpass_cfg_noc_sway_clk = {
+	.halt_reg = 0x47018,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x47018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_cfg_noc_sway_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc ufs_phy_gdsc = {
 	.gdscr = 0x77004,
 	.pd = {
@@ -2428,6 +2441,7 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GCC_MSS_Q6_MEMNOC_AXI_CLK] = &gcc_mss_q6_memnoc_axi_clk.clkr,
 	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
 	[GCC_SEC_CTRL_CLK_SRC] = &gcc_sec_ctrl_clk_src.clkr,
+	[GCC_LPASS_CFG_NOC_SWAY_CLK] = &gcc_lpass_cfg_noc_sway_clk.clkr,
 };

 static const struct qcom_reset_map gcc_sc7180_resets[] = {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

