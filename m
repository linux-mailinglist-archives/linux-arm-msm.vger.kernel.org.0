Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD631232EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 17:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbfLQQtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 11:49:18 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33549 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbfLQQtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 11:49:18 -0500
Received: by mail-pf1-f193.google.com with SMTP id z16so999222pfk.0;
        Tue, 17 Dec 2019 08:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=c+0J8KwQQeRuaM0/21WPpczUIiJr6lCFaHz9z1AF2s8=;
        b=pddLphAJBcIIBLslZ9h+JTPt+SkfjTZow7WNG6X0ADMQlld/RUiJRaX/dFqIFJzcBZ
         PAt5dkaRQU7a6U4DXtwGaQj1+ZQe/iGOqIAPnMPARVhBHj+indcmx/nogWjqZ7AOcTur
         f1KfICXa4euYmnyYQejDMPn5TMVYdNEloJr4Gn/QAK9TYjo6D0wr42S4/Dxkr7P+T4RE
         fQjdBKNPXo75EwtssWlAFucTRmVhKnsTTq8W1PHzO7BbfVUNM+BTbC1DMNhHuMAgF35K
         3UcbY5MEFET98lX4CU5O4OznYXIyadF+TU/EVFHVXM0Jyh4AQ7Q8H7YRlbH71B5Yc/jf
         RtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=c+0J8KwQQeRuaM0/21WPpczUIiJr6lCFaHz9z1AF2s8=;
        b=sGx18dytXjfzuuXowWagOLcPXBdbR+QQ0bfixmWZvaJohxPGTawvOfiEIC72UIxHNM
         48SiFpfEecwspRffYYFFJbcUM2NuC+9+95LZEOHCzC1uWqiDnX3YcXyavYjjFPQixmoP
         7TRb5oER35BJzrabs808uKiPI1vrwlZnSpQURBMVzA8cEx4jGV1oNUoZAwvUoW8vdYMY
         4R4CxOpIhHadp1sgeuPHXC950eyh5f2dWa9uyFTh1HL3nYNo5PnivQGCPCnwoXdWD1Ej
         KdHN8qlRgg4m9vWf63djsqHXj1qvW58tfDDWsLD5600duPAOVoOXJ9a1NO3/B5DW03gL
         fVGA==
X-Gm-Message-State: APjAAAVbzpXgoTSX9yhTxJsXJJbEkueHJrRy69hzsMfxyRA/ukQdlfS4
        LbPPSb+DDd2oBrn0zMnV3SE=
X-Google-Smtp-Source: APXvYqwPNblKB6jCfvdk0xiso7sa19pFtP/TOqPYUHZ3/chICtapazOZN0Xb+HEvHL9ZrXBwXTJoXg==
X-Received: by 2002:a62:7541:: with SMTP id q62mr23158444pfc.256.1576601357697;
        Tue, 17 Dec 2019 08:49:17 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id z19sm26356872pfn.49.2019.12.17.08.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 08:49:17 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     andy.gross@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] clk: qcom: Add missing msm8998 gcc_bimc_gfx_clk
Date:   Tue, 17 Dec 2019 08:49:13 -0800
Message-Id: <20191217164913.4783-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gcc_bimc_gfx_clk is a required clock for booting the GPU and GPU SMMU.

Fixes: 4807c71cc688 (arm64: dts: Add msm8998 SoC and MTP board support)
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/gcc-msm8998.c               | 14 ++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8998.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index cf31b5d03270..df1d7056436c 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -1996,6 +1996,19 @@ static struct clk_branch gcc_gp3_clk = {
 	},
 };
 
+static struct clk_branch gcc_bimc_gfx_clk = {
+	.halt_reg = 0x46040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x46040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_bimc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_gpu_bimc_gfx_clk = {
 	.halt_reg = 0x71010,
 	.halt_check = BRANCH_HALT,
@@ -2810,6 +2823,7 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
 	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_BIMC_GFX_CLK] = &gcc_bimc_gfx_clk.clkr,
 	[GCC_GPU_BIMC_GFX_CLK] = &gcc_gpu_bimc_gfx_clk.clkr,
 	[GCC_GPU_BIMC_GFX_SRC_CLK] = &gcc_gpu_bimc_gfx_src_clk.clkr,
 	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index de1d8a1f5966..63e02dc32a0b 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -182,6 +182,7 @@
 #define GCC_MSS_GPLL0_DIV_CLK_SRC				173
 #define GCC_MSS_SNOC_AXI_CLK					174
 #define GCC_MSS_MNOC_BIMC_AXI_CLK				175
+#define GCC_BIMC_GFX_CLK					176
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
-- 
2.17.1

