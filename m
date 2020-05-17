Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142461D66D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 11:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgEQJXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 05:23:42 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:55808 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727829AbgEQJXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 05:23:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589707419; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=882+yZT0YykGOV7uLr1o6RvdKnz+5INgLfgvg8X1Jr8=; b=cTgbEKVcMHQXez/XH/3i0ooaEl6q/4G37/K8sBA+swLFuBrVaVuxfAxu/QGiBlcM8DdP8rfh
 lQlk4aoxjdV9fjPXJaGgrE4Zn0E+AOEYoC4+TxXDK1Qm3HErxV5qGI7qL2WVhpP2C5MDW9nM
 yrTRChX1aWCrf0zLYz2LUtyCw/A=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ec102840404ab4a8dc77bbb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 17 May 2020 09:23:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2459C44788; Sun, 17 May 2020 09:23:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E12B0C43636;
        Sun, 17 May 2020 09:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E12B0C43636
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
Subject: [PATCH v2 3/4] clk: qcom: gcc: Add support for GCC LPASS clock for SC7180
Date:   Sun, 17 May 2020 14:52:23 +0530
Message-Id: <1589707344-8871-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589707344-8871-1-git-send-email-tdas@codeaurora.org>
References: <1589707344-8871-1-git-send-email-tdas@codeaurora.org>
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
index 6a51b5b..d970647 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2230,6 +2230,19 @@ static struct clk_branch gcc_mss_q6_memnoc_axi_clk = {
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
@@ -2406,6 +2419,7 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GCC_MSS_NAV_AXI_CLK] = &gcc_mss_nav_axi_clk.clkr,
 	[GCC_MSS_Q6_MEMNOC_AXI_CLK] = &gcc_mss_q6_memnoc_axi_clk.clkr,
 	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
+	[GCC_LPASS_CFG_NOC_SWAY_CLK] = &gcc_lpass_cfg_noc_sway_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_sc7180_resets[] = {
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

