Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C888761D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 11:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfGZJXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 05:23:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57876 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGZJXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 05:23:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B3A3060ACE; Fri, 26 Jul 2019 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133022;
        bh=CPLo4k7BVDTZCLqCHQDumYVt+goBimRnTgShREOI+Rs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AXHqYnToZ9DkMRGTAK7yz+TdnycFQapjn4ZelsKepkxIOgb6UkT/3C9TIc8He3GAf
         3YiSs9HQVDxjIG7UOECgjf07dFm7zR/WDJbqrZb+gq0VBBT7MzhQYRKnyVUVqCXjYa
         znC/kedz3g8owxF9XoetYHOCKcu63Xfb2kT3GxqA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B89D602FC;
        Fri, 26 Jul 2019 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133022;
        bh=CPLo4k7BVDTZCLqCHQDumYVt+goBimRnTgShREOI+Rs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AXHqYnToZ9DkMRGTAK7yz+TdnycFQapjn4ZelsKepkxIOgb6UkT/3C9TIc8He3GAf
         3YiSs9HQVDxjIG7UOECgjf07dFm7zR/WDJbqrZb+gq0VBBT7MzhQYRKnyVUVqCXjYa
         znC/kedz3g8owxF9XoetYHOCKcu63Xfb2kT3GxqA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B89D602FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 1/7] clk: qcom: Add WCSS gcc clock control for QCS404
Date:   Fri, 26 Jul 2019 14:53:26 +0530
Message-Id: <20190726092332.25202-2-govinds@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the WCSS QDSP gcc clock control used on qcs404
based devices. This would allow wcss remoteproc driver to control
the required gcc clocks to bring the subsystem out of reset.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/gcc-qcs404.c               | 30 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcs404.h |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 29cf464dd2c8..e12c04c09a6a 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2604,6 +2604,32 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 	},
 };
 
+static struct clk_branch gcc_wdsp_q6ss_ahbs_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wdsp_q6ss_ahbs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wdsp_q6ss_axim_clk = {
+	.halt_reg = 0x1e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wdsp_q6ss_axim_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_hw *gcc_qcs404_hws[] = {
 	&cxo.hw,
 };
@@ -2749,6 +2775,9 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
 	[GCC_DCC_XO_CLK] = &gcc_dcc_xo_clk.clkr,
+	[GCC_WCSS_Q6_AHB_CLK] = &gcc_wdsp_q6ss_ahbs_clk.clkr,
+	[GCC_WCSS_Q6_AXIM_CLK] =  &gcc_wdsp_q6ss_axim_clk.clkr,
+
 };
 
 static const struct qcom_reset_map gcc_qcs404_resets[] = {
@@ -2774,6 +2803,7 @@ static const struct qcom_reset_map gcc_qcs404_resets[] = {
 	[GCC_PCIE_0_SLEEP_ARES] = { 0x3e040, 1 },
 	[GCC_PCIE_0_PIPE_ARES] = { 0x3e040, 0 },
 	[GCC_EMAC_BCR] = { 0x4e000 },
+	[GCC_WDSP_RESTART] = {0x19000},
 };
 
 static const struct regmap_config gcc_qcs404_regmap_config = {
diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index 2cd62c98561f..bc3051543347 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -146,6 +146,8 @@
 #define GCC_MDP_TBU_CLK					138
 #define GCC_QDSS_DAP_CLK				139
 #define GCC_DCC_XO_CLK					140
+#define GCC_WCSS_Q6_AHB_CLK				141
+#define GCC_WCSS_Q6_AXIM_CLK				142
 #define GCC_CDSP_CFG_AHB_CLK				143
 #define GCC_BIMC_CDSP_CLK				144
 #define GCC_CDSP_TBU_CLK				145
@@ -173,5 +175,6 @@
 #define GCC_PCIE_0_CORE_STICKY_ARES			19
 #define GCC_PCIE_0_SLEEP_ARES				20
 #define GCC_PCIE_0_PIPE_ARES				21
+#define GCC_WDSP_RESTART				22
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

