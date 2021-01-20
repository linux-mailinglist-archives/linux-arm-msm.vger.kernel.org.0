Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218162FCC0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 08:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbhATHvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 02:51:46 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:46355 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729440AbhATHtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 02:49:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611128919; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SSqwGyOJY1wQHK6A4lq08RkhhCOMF4yvBGA20FNk3m4=; b=XNMS5XUY9PlxW4Y4qfZVJjtOZJGHjy6g+0WTCTt8d6AnNzu+nPTR7ctRXcOY5LogXeWGyLJn
 Epy4BUvYj0Rblx7oplKfPtRbFbWGFpa1BEZuTlEE7PUCvp/loBFl2oZrM4lurcww1Rcfi1Q6
 cE04nSGoTZ8ptFEmrh0AX6i+DvE=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6007e0398a0374a501b18d3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Jan 2021 07:48:09
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F3BFC433ED; Wed, 20 Jan 2021 07:48:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6D37C43461;
        Wed, 20 Jan 2021 07:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6D37C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH V1] clk: qcom: gcc-sc7180: Mark the MM XO clocks to be always ON
Date:   Wed, 20 Jan 2021 13:17:51 +0530
Message-Id: <1611128871-5898-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are intermittent GDSC power-up failures observed for titan top
gdsc, which requires the XO clock. Thus mark all the MM XO clocks always
enabled from probe.

Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk ones")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 47 ++++---------------------------------------
 1 file changed, 4 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index b05901b..88e896a 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
  */

 #include <linux/clk-provider.h>
@@ -919,19 +919,6 @@ static struct clk_branch gcc_camera_throttle_hf_axi_clk = {
 	},
 };

-static struct clk_branch gcc_camera_xo_clk = {
-	.halt_reg = 0xb02c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xb02c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_camera_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_ce1_ahb_clk = {
 	.halt_reg = 0x4100c,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -1096,19 +1083,6 @@ static struct clk_branch gcc_disp_throttle_hf_axi_clk = {
 	},
 };

-static struct clk_branch gcc_disp_xo_clk = {
-	.halt_reg = 0xb030,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xb030,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_disp_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x64000,
 	.halt_check = BRANCH_HALT,
@@ -2159,19 +2133,6 @@ static struct clk_branch gcc_video_throttle_axi_clk = {
 	},
 };

-static struct clk_branch gcc_video_xo_clk = {
-	.halt_reg = 0xb028,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xb028,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_video_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_mss_cfg_ahb_clk = {
 	.halt_reg = 0x8a000,
 	.halt_check = BRANCH_HALT,
@@ -2304,7 +2265,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_THROTTLE_HF_AXI_CLK] = &gcc_camera_throttle_hf_axi_clk.clkr,
-	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
 	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
 	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
 	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
@@ -2317,7 +2277,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GCC_DISP_GPLL0_DIV_CLK_SRC] = &gcc_disp_gpll0_div_clk_src.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
 	[GCC_DISP_THROTTLE_HF_AXI_CLK] = &gcc_disp_throttle_hf_axi_clk.clkr,
-	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
@@ -2413,7 +2372,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GCC_VIDEO_AXI_CLK] = &gcc_video_axi_clk.clkr,
 	[GCC_VIDEO_GPLL0_DIV_CLK_SRC] = &gcc_video_gpll0_div_clk_src.clkr,
 	[GCC_VIDEO_THROTTLE_AXI_CLK] = &gcc_video_throttle_axi_clk.clkr,
-	[GCC_VIDEO_XO_CLK] = &gcc_video_xo_clk.clkr,
 	[GPLL0] = &gpll0.clkr,
 	[GPLL0_OUT_EVEN] = &gpll0_out_even.clkr,
 	[GPLL6] = &gpll6.clkr,
@@ -2510,6 +2468,9 @@ static int gcc_sc7180_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x0b02c, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x0b028, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x0b030, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));

 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

