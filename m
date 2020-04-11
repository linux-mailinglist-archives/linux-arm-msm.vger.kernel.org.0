Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524C81A4D05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 02:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDKAwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 20:52:54 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:35095 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726652AbgDKAwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 20:52:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586566373; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sYEP7fr+H1lt1NOfyJumJYSAn2sz22a8EDdkt4TaDHE=; b=ez1r5b7QjRN/yNBzw9ae6ROVX1MARmOCSBjs1LMvQPqFvZ4oGvnIXvlZVua8W5C34mDMlD1V
 1RGMlzTG/m8pw7gEndMKxZa8wwRWheMku7ADacgpvhl2fpCg+Kj4lPkdsf8dkMXiMmjKQWtD
 My6zXgnUYjx0OoLBCQBDLAPVQcY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9114e5.7f06cc059ab0-smtp-out-n01;
 Sat, 11 Apr 2020 00:52:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84988C4478C; Sat, 11 Apr 2020 00:52:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7DE3FC433F2;
        Sat, 11 Apr 2020 00:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7DE3FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v4 1/2] clk: qcom: gcc: Add USB3 PIPE clock and GDSC for SM8150
Date:   Fri, 10 Apr 2020 17:52:41 -0700
Message-Id: <1586566362-21450-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586566362-21450-1-git-send-email-wcheng@codeaurora.org>
References: <1586566362-21450-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the USB3 PIPE clock and GDSC structures, so
that the USB driver can vote for these resources to be
enabled/disabled when required.  Both are needed for SS
and HS USB paths to operate properly.  The GDSC will
allow the USB system to be brought out of reset, while
the PIPE clock is needed for data transactions between
the PHY and controller.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gcc-sm8150.c               | 52 +++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 2087721..ef98fdc 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -21,6 +21,7 @@
 #include "clk-rcg.h"
 #include "clk-regmap.h"
 #include "reset.h"
+#include "gdsc.h"
 
 enum {
 	P_BI_TCXO,
@@ -3171,6 +3172,18 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0xf058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_phy_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb3_sec_clkref_clk = {
 	.halt_reg = 0x8c028,
 	.halt_check = BRANCH_HALT,
@@ -3218,6 +3231,18 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x10058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_sec_phy_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 /*
  * Clock ON depends on external parent 'config noc', so cant poll
  * delay and also mark as crtitical for video boot
@@ -3292,6 +3317,24 @@ enum {
 	},
 };
 
+static struct gdsc usb30_prim_gdsc = {
+		.gdscr = 0xf004,
+		.pd = {
+			.name = "usb30_prim_gdsc",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+		.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc usb30_sec_gdsc = {
+		.gdscr = 0x10004,
+		.pd = {
+			.name = "usb30_sec_gdsc",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+		.flags = POLL_CFG_GDSCR,
+};
+
 static struct clk_regmap *gcc_sm8150_clocks[] = {
 	[GCC_AGGRE_NOC_PCIE_TBU_CLK] = &gcc_aggre_noc_pcie_tbu_clk.clkr,
 	[GCC_AGGRE_UFS_CARD_AXI_CLK] = &gcc_aggre_ufs_card_axi_clk.clkr,
@@ -3480,10 +3523,12 @@ enum {
 	[GCC_USB3_PRIM_PHY_AUX_CLK] = &gcc_usb3_prim_phy_aux_clk.clkr,
 	[GCC_USB3_PRIM_PHY_AUX_CLK_SRC] = &gcc_usb3_prim_phy_aux_clk_src.clkr,
 	[GCC_USB3_PRIM_PHY_COM_AUX_CLK] = &gcc_usb3_prim_phy_com_aux_clk.clkr,
+	[GCC_USB3_PRIM_PHY_PIPE_CLK] = &gcc_usb3_prim_phy_pipe_clk.clkr,
 	[GCC_USB3_SEC_CLKREF_CLK] = &gcc_usb3_sec_clkref_clk.clkr,
 	[GCC_USB3_SEC_PHY_AUX_CLK] = &gcc_usb3_sec_phy_aux_clk.clkr,
 	[GCC_USB3_SEC_PHY_AUX_CLK_SRC] = &gcc_usb3_sec_phy_aux_clk_src.clkr,
 	[GCC_USB3_SEC_PHY_COM_AUX_CLK] = &gcc_usb3_sec_phy_com_aux_clk.clkr,
+	[GCC_USB3_SEC_PHY_PIPE_CLK] = &gcc_usb3_sec_phy_pipe_clk.clkr,
 	[GCC_VIDEO_AHB_CLK] = &gcc_video_ahb_clk.clkr,
 	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
 	[GCC_VIDEO_AXI1_CLK] = &gcc_video_axi1_clk.clkr,
@@ -3527,6 +3572,11 @@ enum {
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
 };
 
+static struct gdsc *gcc_sm8150_gdscs[] = {
+	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
+	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
+};
+
 static const struct regmap_config gcc_sm8150_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -3541,6 +3591,8 @@ enum {
 	.num_clks = ARRAY_SIZE(gcc_sm8150_clocks),
 	.resets = gcc_sm8150_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8150_resets),
+	.gdscs = gcc_sm8150_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_sm8150_gdscs),
 };
 
 static const struct of_device_id gcc_sm8150_match_table[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
index 90d60ef..3e1a918 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
@@ -240,4 +240,8 @@
 #define GCC_USB30_SEC_BCR					27
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR				28
 
+/* GCC GDSCRs */
+#define USB30_PRIM_GDSC                     4
+#define USB30_SEC_GDSC						5
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
