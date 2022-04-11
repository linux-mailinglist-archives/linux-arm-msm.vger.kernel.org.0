Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4444FB4AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 09:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240949AbiDKH1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 03:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245364AbiDKH1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 03:27:15 -0400
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A93039BBA;
        Mon, 11 Apr 2022 00:24:52 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc25b.ng.seznam.cz (email-smtpc25b.ng.seznam.cz [10.23.18.35])
        id 79fa64b922f430d07853a8e7;
        Mon, 11 Apr 2022 09:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1649661870; bh=mJh+Ot+1TzBwDIFJvE7bofaFCaW4p2mWZsjsaIlmMio=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=dsgoEe+mpy3Xte1sxIvvBmmGVF57mmNhjmBiTndvz/hjbuoPs82HYEKqm1vH9s6Kd
         SmNUhiKGTdk9hQofpb9oZFnHIiWfW4neTagTAaexvNIAkVkrgAZOxSxUX7F23i8mN4
         qMeXFCBTdcxoDYvc5O/dUGVy7rE1JJd6WfUriczk=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay18.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 11 Apr 2022 09:24:23 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: [RESEND v9 2/5] clk: qcom: gcc-msm8998: add SSC-related clocks
Date:   Mon, 11 Apr 2022 09:21:53 +0200
Message-Id: <20220411072156.24451-3-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411072156.24451-1-michael.srba@seznam.cz>
References: <20220411072156.24451-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <8fc0eb3d-302b-45de-8380-ee26dd90e09b>
X-szn-frgc: <0>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

Add four clocks which need to be manipulated in order to initialize the AHB
bus which exposes the SCC block in the global address space.

If a device is known to be configured such that writing to these
registers from Linux is not permitted, the 'protected-clocks'
device tree property must be used to denote that fact.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 CHANGES:
 - v2: none
 - v3: none
 - v4: reword the commit message
 - v5: none
 - v6: none
 - v7: change 'struct clk_init_data' to 'const struct clk_init_data', use imperative in commit message
 - v8: change hex constants to lowercase in accordance with the code style
 - v9: none
---
 drivers/clk/qcom/gcc-msm8998.c | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 407e2c5caea4..33473c52eb90 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2833,6 +2833,58 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
 	},
 };
 
+static struct clk_branch gcc_im_sleep_clk = {
+	.halt_reg = 0x4300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
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
+		.hw.init = &(const struct clk_init_data){
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
+		.hw.init = &(const struct clk_init_data){
+			.name = "ssc_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ssc_cnoc_ahbs_clk = {
+	.halt_reg = 0x6300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
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
2.35.1

