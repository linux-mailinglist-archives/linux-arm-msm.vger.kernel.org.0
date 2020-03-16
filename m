Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36595186997
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 11:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730769AbgCPKzi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 06:55:38 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37108 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730714AbgCPKzi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 06:55:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584356137; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5xrQ7T4fhSt6GBPAdXESoichf/t20jtCxTSqGyamBWA=; b=QbuME4kAq7Y488LrL6qJXCKPl1PL4q6/74R+TH5VC2oLdG2K6E68atajrlgQX3Y3lnXsd3dX
 YEBDmI0mPuEIpH8YoIc+M+VLnI0ZCkkXpVtNUztdwZtCGCtD8Wv90pxbeaymm9QXXUUEfBXx
 MKbph8GKj1SeKZBz4mtEMIMWC1I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6f5b18.7fedd0517378-smtp-out-n02;
 Mon, 16 Mar 2020 10:55:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E41CCC4478C; Mon, 16 Mar 2020 10:55:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E237C433CB;
        Mon, 16 Mar 2020 10:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E237C433CB
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
Subject: [PATCH v1 3/3] clk: qcom: gcc: Add support for Secure control source clock
Date:   Mon, 16 Mar 2020 16:24:42 +0530
Message-Id: <1584356082-26769-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
References: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The secure controller driver requires to request for various frequencies
on the source clock, thus add support for the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index ad75847..3302f19 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -817,6 +817,26 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	},
 };

+static const struct freq_tbl ftbl_gcc_sec_ctrl_clk_src[] = {
+	F(4800000, P_BI_TCXO, 4, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sec_ctrl_clk_src = {
+	.cmd_rcgr = 0x3d030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_sec_ctrl_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sec_ctrl_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
 	.halt_reg = 0x82024,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -2337,6 +2357,7 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GPLL7] = &gpll7.clkr,
 	[GPLL4] = &gpll4.clkr,
 	[GPLL1] = &gpll1.clkr,
+	[GCC_SEC_CTRL_CLK_SRC] = &gcc_sec_ctrl_clk_src.clkr,
 };

 static const struct qcom_reset_map gcc_sc7180_resets[] = {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
