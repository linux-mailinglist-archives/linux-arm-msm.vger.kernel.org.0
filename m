Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3022424C58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 06:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhJGEIY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 00:08:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46511 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229379AbhJGEIY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 00:08:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633579591; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ThqZU5/Hiu9nTm4UkSZaL9sdjsmA90dM5r9HEPemVpw=; b=vEabUOHhaF8PKOBdboW6ayAan9Flt7BCVRXIUN+DbtHCx5CM/xyvWzhMBw3gsrDBHOkoHAdH
 2m2ITXdV1F+BOn71JI3x4LwCVvjdsmM4AVTmCUoflfIjM+muQAXE9AiI76kISQnwkHTZGM2j
 20ISKOybMvAbGuhqpIlhUAJwgRM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615e724003355859c8af9c50 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 04:06:24
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22462C43460; Thu,  7 Oct 2021 04:06:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A79AFC4338F;
        Thu,  7 Oct 2021 04:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A79AFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1] clk: qcom: gcc: Remove CPUSS clocks control for SC7280
Date:   Thu,  7 Oct 2021 09:36:11 +0530
Message-Id: <1633579571-25475-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CPUSS clocks are kept always ON and at a fixed frequency of 100MHZ
from the bootloader and no longer required to be controlled from HLOS.

Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7280.c | 79 -------------------------------------------
 1 file changed, 79 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 6cefcdc..667f584 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -479,24 +479,6 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
 		},
 	},
 };
-static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
-	.cmd_rcgr = 0x4800c,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = gcc_parent_map_0,
-	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_cpuss_ahb_clk_src",
-		.parent_data = gcc_parent_data_0_ao,
-		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
-		.ops = &clk_rcg2_ops,
-	},
-};

 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
 	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
@@ -1239,21 +1221,6 @@ static struct clk_rcg2 gcc_sec_ctrl_clk_src = {
 	},
 };

-static struct clk_regmap_div gcc_cpuss_ahb_postdiv_clk_src = {
-	.reg = 0x48024,
-	.shift = 0,
-	.width = 4,
-	.clkr.hw.init = &(struct clk_init_data) {
-		.name = "gcc_cpuss_ahb_postdiv_clk_src",
-		.parent_hws = (const struct clk_hw*[]){
-			&gcc_cpuss_ahb_clk_src.clkr.hw,
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_regmap_div_ro_ops,
-	},
-};
-
 static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	.reg = 0xf050,
 	.shift = 0,
@@ -1500,27 +1467,6 @@ static struct clk_branch gcc_cfg_noc_usb3_sec_axi_clk = {
 	},
 };

-/* For CPUSS functionality the AHB clock needs to be left enabled */
-static struct clk_branch gcc_cpuss_ahb_clk = {
-	.halt_reg = 0x48000,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x48000,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x52000,
-		.enable_mask = BIT(21),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_cpuss_ahb_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_ddrss_gpu_axi_clk = {
 	.halt_reg = 0x71154,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -2608,27 +2554,6 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 	},
 };

-/* For CPUSS functionality the AHB clock needs to be left enabled */
-static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
-	.halt_reg = 0x48178,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x48178,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x52000,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_sys_noc_cpuss_ahb_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_throttle_pcie_ahb_clk = {
 	.halt_reg = 0x9001c,
 	.halt_check = BRANCH_HALT,
@@ -3294,9 +3219,6 @@ static struct clk_regmap *gcc_sc7280_clocks[] = {
 	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
 	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
 	[GCC_CFG_NOC_USB3_SEC_AXI_CLK] = &gcc_cfg_noc_usb3_sec_axi_clk.clkr,
-	[GCC_CPUSS_AHB_CLK] = &gcc_cpuss_ahb_clk.clkr,
-	[GCC_CPUSS_AHB_CLK_SRC] = &gcc_cpuss_ahb_clk_src.clkr,
-	[GCC_CPUSS_AHB_POSTDIV_CLK_SRC] = &gcc_cpuss_ahb_postdiv_clk_src.clkr,
 	[GCC_DDRSS_GPU_AXI_CLK] = &gcc_ddrss_gpu_axi_clk.clkr,
 	[GCC_DDRSS_PCIE_SF_CLK] = &gcc_ddrss_pcie_sf_clk.clkr,
 	[GCC_DISP_GPLL0_CLK_SRC] = &gcc_disp_gpll0_clk_src.clkr,
@@ -3403,7 +3325,6 @@ static struct clk_regmap *gcc_sc7280_clocks[] = {
 	[GCC_SDCC4_AHB_CLK] = &gcc_sdcc4_ahb_clk.clkr,
 	[GCC_SDCC4_APPS_CLK] = &gcc_sdcc4_apps_clk.clkr,
 	[GCC_SDCC4_APPS_CLK_SRC] = &gcc_sdcc4_apps_clk_src.clkr,
-	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
 	[GCC_THROTTLE_PCIE_AHB_CLK] = &gcc_throttle_pcie_ahb_clk.clkr,
 	[GCC_TITAN_NRT_THROTTLE_CORE_CLK] =
 		&gcc_titan_nrt_throttle_core_clk.clkr,
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

