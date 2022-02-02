Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0994A7022
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 12:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343951AbiBBLkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 06:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiBBLkY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 06:40:24 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9F3C06173B;
        Wed,  2 Feb 2022 03:40:22 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc5b.ng.seznam.cz (email-smtpc5b.ng.seznam.cz [10.23.13.135])
        id 4dfc141b16f240724c55d845;
        Wed, 02 Feb 2022 12:39:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1643801993; bh=HojZfXHDUNxPdoYKF5srSBfKV8QINtVCB1E21X/FbPw=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=h4LPLJuj22DQEOqFwoi95kAxw/PdFgr0JjJ4QcghQWDKBOJP9lHhA9JAcGUWFcjWB
         ROVLqK6qvOiqQBAkBHoNU4iK9OWaBL7LLXH42pzm7dSnJeUBe6q1YyI6lGjZ7P9jtx
         8YPQIHBv9bsTnJYvnVXVLRpiXRU2v7/nTSg5m/cw=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay25.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Wed, 02 Feb 2022 12:39:51 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v5 2/5] clk: qcom: gcc-msm8998: add SSC-related clocks
Date:   Wed,  2 Feb 2022 12:37:19 +0100
Message-Id: <20220202113722.7550-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202113722.7550-1-michael.srba@seznam.cz>
References: <20220202113722.7550-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <f00105a9-f1a3-46c5-88d8-fac2d33226a6>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds four clocks which need to be manipulated in order to
initialize the AHB bus which exposes the SCC block in the global address
space.

If a device is known to be configured such that writing to these
registers from Linux is not permitted, the 'protected-clocks'
device tree property must be used to denote that fact.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 CHANGES:
 - v2: none
 - v3: none
 - v4: reword the commit message
 - v5: none
---
 drivers/clk/qcom/gcc-msm8998.c | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 407e2c5caea4..2d14c3d672fc 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2833,6 +2833,58 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
 	},
 };
 
+static struct clk_branch gcc_im_sleep_clk = {
+	.halt_reg = 0x4300C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4300C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_im_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch aggre2_snoc_north_axi_clk = {
+	.halt_reg = 0x83010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x83010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "aggre2_snoc_north_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ssc_xo_clk = {
+	.halt_reg = 0x63018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x63018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "ssc_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ssc_cnoc_ahbs_clk = {
+	.halt_reg = 0x6300C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6300C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "ssc_cnoc_ahbs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc pcie_0_gdsc = {
 	.gdscr = 0x6b004,
 	.gds_hw_ctrl = 0x0,
@@ -3036,6 +3088,10 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
 	[GCC_MMSS_GPLL0_CLK] = &gcc_mmss_gpll0_clk.clkr,
 	[HMSS_GPLL0_CLK_SRC] = &hmss_gpll0_clk_src.clkr,
+	[GCC_IM_SLEEP] = &gcc_im_sleep_clk.clkr,
+	[AGGRE2_SNOC_NORTH_AXI] = &aggre2_snoc_north_axi_clk.clkr,
+	[SSC_XO] = &ssc_xo_clk.clkr,
+	[SSC_CNOC_AHBS_CLK] = &ssc_cnoc_ahbs_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8998_gdscs[] = {
-- 
2.34.1

