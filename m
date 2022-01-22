Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B75496D3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jan 2022 19:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234675AbiAVSJk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jan 2022 13:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234673AbiAVSJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jan 2022 13:09:40 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187C6C06173B;
        Sat, 22 Jan 2022 10:09:38 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc6b.ng.seznam.cz (email-smtpc6b.ng.seznam.cz [10.23.13.165])
        id 680edc4a3300882369a71014;
        Sat, 22 Jan 2022 19:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1642874977; bh=ux5ZV1i+WHhRUqbcZ4NmQg9+qtiHDmeW6KXTqWN9RT4=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=dyhb+p3Hbpn5SwBZ2I/Z2IYJTUwIB+oRP6wVtXTzSR17ZVCjpdcIIpLM7nrzuMr1f
         zJlzz1jL3EbRbGLpPo4FJ16E2eh0xtcVnkLDwiatwaU63I/7tt5Iey4kQ7ioT2Hk1l
         NPKqypbHRCj4KF1zB3pmtq4hdHzdV5wY16sakX30=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay24.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Sat, 22 Jan 2022 19:06:49 +0100 (CET)  
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
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH 2/4] clk: qcom: gcc-msm8998: add SSC-related clocks
Date:   Sat, 22 Jan 2022 19:04:11 +0100
Message-Id: <20220122180413.1480-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220122180413.1480-1-michael.srba@seznam.cz>
References: <20220122180413.1480-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <44157211-f037-4688-b843-3eb5c1abe1b8>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

 This patch adds four clocks which need to be manipulated in order to
 initialize the AHB bus which exposes the SCC block in the global address
 space.

 Care should be taken not to write to these registers unless the device is
 known to be configured such that writing to these registers from Linux
 is permitted.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
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

