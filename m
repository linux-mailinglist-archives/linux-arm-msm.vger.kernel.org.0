Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C28218587E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 03:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgCOCNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Mar 2020 22:13:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:48113 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726699AbgCOCNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Mar 2020 22:13:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584238389; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lXhkIBcKbtLstxQRyAkgmmBBedPpvtcrGcYCAgn01SQ=; b=uceHru8xxwBd/qIUtLddl31/dlZfIwcsdm5BdkxW1nsfChTov/N7hii5qffmxJAamQLD5414
 T96L6TzevzyOMAZ0xUC+NzUwHiFEshVmrPh63kTiAtlYYpmcmm5iipR5zV4tKm8BU4Ow4yvU
 rYpfZdMF5PcWSm0ZtXP+hXbacAw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6d24e5.7f8eb9e4ded8-smtp-out-n03;
 Sat, 14 Mar 2020 18:39:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3066CC432C2; Sat, 14 Mar 2020 18:39:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B123C433D2;
        Sat, 14 Mar 2020 18:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B123C433D2
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
Subject: [PATCH v6 2/3] clk: qcom: gcc: Add support for modem clocks in GCC
Date:   Sun, 15 Mar 2020 00:09:06 +0530
Message-Id: <1584211147-5570-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584211147-5570-1-git-send-email-tdas@codeaurora.org>
References: <1584211147-5570-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the required modem clocks in global clock controller which are
required to bring the modem out of reset.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 72 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 7f59fb8..6a51b5b 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  */

 #include <linux/clk-provider.h>
@@ -2165,6 +2165,71 @@ static struct clk_branch gcc_video_xo_clk = {
 	},
 };

+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x8a000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_mfab_axis_clk = {
+	.halt_reg = 0x8a004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_mfab_axis_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_nav_axi_clk = {
+	.halt_reg = 0x8a00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_nav_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_snoc_axi_clk = {
+	.halt_reg = 0x8a150,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a150,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_snoc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_memnoc_axi_clk = {
+	.halt_reg = 0x8a154,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a154,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_memnoc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc ufs_phy_gdsc = {
 	.gdscr = 0x77004,
 	.pd = {
@@ -2336,6 +2401,11 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GPLL7] = &gpll7.clkr,
 	[GPLL4] = &gpll4.clkr,
 	[GPLL1] = &gpll1.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_MFAB_AXIS_CLK] = &gcc_mss_mfab_axis_clk.clkr,
+	[GCC_MSS_NAV_AXI_CLK] = &gcc_mss_nav_axi_clk.clkr,
+	[GCC_MSS_Q6_MEMNOC_AXI_CLK] = &gcc_mss_q6_memnoc_axi_clk.clkr,
+	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
 };

 static const struct qcom_reset_map gcc_sc7180_resets[] = {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
