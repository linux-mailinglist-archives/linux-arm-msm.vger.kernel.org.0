Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED8A231DE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgG2MBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgG2MB0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:26 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480DFC061794;
        Wed, 29 Jul 2020 05:01:26 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so2678133wma.2;
        Wed, 29 Jul 2020 05:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sNDzOj06dVBJ6v8kCDFLm4glmz05bF3t/mKwoorOGHM=;
        b=UejDevBvPWb5c7jgYHnIMZNKjxn22NfUB7CWVNMRw3d+GMrV45IMXmoaRnjHXc6qqF
         HpfoenGftcGBwY67IeCMY5UOBbMDYTn4jr1fU47gd2zmJGQgxl9uuzA52Nu1GfVTjEFA
         RJ+G5AcC8XSG8mK1GTvDIEh9FLdciuCnJQ1bajd2WUxGYLlHUjiQHn7p0Biiqz0v6feZ
         Z1m1wEN3lVWobf9zzIAc83Bsw++HQTQ6CYVg6boTGWBT4tKd2Xq+rtZEsLAgtK/zGO1C
         g9hCicZkIWJ6muFBTKNTSJh2i1dOxNw+xJhs2cz8xR+kiQzu8VtCAJQG/IZWVwtZKO5r
         gcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sNDzOj06dVBJ6v8kCDFLm4glmz05bF3t/mKwoorOGHM=;
        b=B9yulQuLIonWf/a8Rh2QOYyjsPKKLuijHfF3MsOZhjaoTAGkhZQ/q19CKim8NmbuOY
         zSDuH6UdpePOMygJRL/y+BzBSKRGFeAjQiJ56eAwUyWmgVT0CrqQJEPTw90wC/4rwFsT
         XJtxEMcDgPJl/2wqPWFn/wkNGutmORHC5MhAuLFvDu9JOzyzY9J+xj68pzC82bl3V7lT
         eJEaqzcAn4wvYdfx6uFg78n1L88/RjRNLU20ccdA9d6/L/xuxM1aryFUFymkEKPY5cZw
         bcQU9VCkfIAmHNE25bPwEvMaKIyGofrJtZHRlxIcfsQ5ZJHKI9trsWs6fRI8dStYW0U5
         EQsQ==
X-Gm-Message-State: AOAM532HkTROUmYpqDFhpNzClV1vRTBKIRDnRbQU9jUTbgyWVZ/LplwM
        5QuatjMO9TEv1rz1Z2Lgw4U=
X-Google-Smtp-Source: ABdhPJyACfuWn3+5w8AsqyBC4Oey2uf5P/+ateBpMgWbqHOg2NpY5P1qMrqvpGAQXtZXyNaWevbfTg==
X-Received: by 2002:a1c:7511:: with SMTP id o17mr8928310wmc.49.1596024084708;
        Wed, 29 Jul 2020 05:01:24 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:24 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 09/10] clk: qcom: gcc-msm8994: Fix up the driver and modernize it
Date:   Wed, 29 Jul 2020 14:00:55 +0200
Message-Id: <20200729120057.35079-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds GDSCs, resets and most of the missing
clocks to the msm8994 GCC driver. The remaining ones
are of local_vote_clk and gate_clk type, which are not
yet supported upstream. Also reorder them to match the
original downstream driver.

Clocks have been switched from using parent_names to
parent_data, predefined "xo" has been removed in favour
of specifying it in the DT and the probe function has
been updated to use qcom_cc_really_probe.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/clk/qcom/gcc-msm8994.c               | 800 ++++++++++++++-----
 include/dt-bindings/clock/qcom,gcc-msm8994.h |  37 +
 2 files changed, 622 insertions(+), 215 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index b7fc8c7ba195..ee6b2d7ac2a2 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -20,6 +20,7 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "reset.h"
+#include "gdsc.h"
 
 enum {
 	P_XO,
@@ -27,40 +28,6 @@ enum {
 	P_GPLL4,
 };
 
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0",
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 },
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0",
-	"gpll4",
-};
-
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data)
-	{
-		.name = "xo",
-		.parent_names = (const char *[]) { "xo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct clk_alpha_pll gpll0_early = {
 	.offset = 0x00000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -117,6 +84,28 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	},
 };
 
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+};
+
 static struct freq_tbl ftbl_ufs_axi_clk_src[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
@@ -136,7 +125,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "ufs_axi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -157,7 +146,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -177,7 +166,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -205,7 +194,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -219,7 +208,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -234,7 +223,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -248,7 +237,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -263,7 +252,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -277,7 +266,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -292,7 +281,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -306,7 +295,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -321,7 +310,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -335,7 +324,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -350,7 +339,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -384,7 +373,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -399,7 +388,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -414,7 +403,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -429,7 +418,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -444,7 +433,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -459,7 +448,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp1_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -473,7 +462,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -488,7 +477,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -502,7 +491,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -517,7 +506,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -531,7 +520,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -546,7 +535,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -560,7 +549,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -575,7 +564,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -589,7 +578,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -604,7 +593,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -618,7 +607,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -633,7 +622,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -648,7 +637,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -663,7 +652,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -678,7 +667,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -693,7 +682,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -708,7 +697,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -723,7 +712,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "blsp2_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -745,7 +734,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gp1_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -767,7 +756,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gp2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -789,7 +778,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gp3_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -808,7 +797,9 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "pcie_0_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -826,7 +817,9 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "pcie_0_pipe_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -845,7 +838,9 @@ static struct clk_rcg2 pcie_1_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "pcie_1_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -858,7 +853,9 @@ static struct clk_rcg2 pcie_1_pipe_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "pcie_1_pipe_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -877,7 +874,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -904,7 +901,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll4,
+		.parent_data = gcc_xo_gpll0_gpll4,
 		.num_parents = 3,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -930,7 +927,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -945,7 +942,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "sdcc3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -960,7 +957,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "sdcc4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -979,7 +976,9 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "tsif_ref_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -999,7 +998,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1017,7 +1016,9 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "usb3_phy_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1036,7 +1037,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "usb_hs_system_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1064,8 +1065,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup1_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1082,8 +1083,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup1_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1100,8 +1101,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup2_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1118,8 +1119,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup2_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1136,8 +1137,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup3_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1154,8 +1155,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup3_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1172,8 +1173,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup4_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1190,8 +1191,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup4_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1208,8 +1209,8 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup5_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1226,8 +1227,8 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup5_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup5_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1244,8 +1245,8 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup6_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1262,8 +1263,8 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_qup6_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup6_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1280,8 +1281,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart1_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1298,8 +1299,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart2_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1316,8 +1317,8 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_uart3_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart3_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1334,8 +1335,8 @@ static struct clk_branch gcc_blsp1_uart4_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_uart4_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart4_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_uart4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1352,8 +1353,8 @@ static struct clk_branch gcc_blsp1_uart5_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_uart5_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart5_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_uart5_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1370,8 +1371,8 @@ static struct clk_branch gcc_blsp1_uart6_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp1_uart6_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart6_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp1_uart6_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1402,8 +1403,8 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup1_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1420,8 +1421,8 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup1_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup1_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1438,8 +1439,8 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup2_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1456,8 +1457,8 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup2_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup2_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1474,8 +1475,8 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup3_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1492,8 +1493,8 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup3_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup3_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1510,8 +1511,8 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup4_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1528,8 +1529,8 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup4_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup4_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1546,8 +1547,8 @@ static struct clk_branch gcc_blsp2_qup5_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup5_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1564,8 +1565,8 @@ static struct clk_branch gcc_blsp2_qup5_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup5_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup5_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1582,8 +1583,8 @@ static struct clk_branch gcc_blsp2_qup6_i2c_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup6_i2c_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1600,8 +1601,8 @@ static struct clk_branch gcc_blsp2_qup6_spi_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_qup6_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup6_spi_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1618,8 +1619,8 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_uart1_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart1_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1636,8 +1637,8 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_uart2_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart2_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1654,8 +1655,8 @@ static struct clk_branch gcc_blsp2_uart3_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_uart3_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart3_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1672,8 +1673,8 @@ static struct clk_branch gcc_blsp2_uart4_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_uart4_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart4_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_uart4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1690,8 +1691,8 @@ static struct clk_branch gcc_blsp2_uart5_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_uart5_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart5_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_uart5_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1708,8 +1709,8 @@ static struct clk_branch gcc_blsp2_uart6_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_blsp2_uart6_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart6_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &blsp2_uart6_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1726,8 +1727,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]) {
-				"gp1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1744,8 +1745,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]) {
-				"gp2_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1762,8 +1763,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]) {
-				"gp3_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1772,6 +1773,32 @@ static struct clk_branch gcc_gp3_clk = {
 	},
 };
 
+static struct clk_branch gcc_lpass_q6_axi_clk = {
+	.halt_reg = 0x0280,
+	.clkr = {
+		.enable_reg = 0x0280,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_lpass_q6_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x0284,
+	.clkr = {
+		.enable_reg = 0x0284,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_pcie_0_aux_clk = {
 	.halt_reg = 0x1ad4,
 	.clkr = {
@@ -1780,8 +1807,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_names = (const char *[]) {
-				"pcie_0_aux_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &pcie_0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1790,6 +1817,32 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 	},
 };
 
+static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
+	.halt_reg = 0x1ad0,
+	.clkr = {
+		.enable_reg = 0x1ad0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
+	.halt_reg = 0x1acc,
+	.clkr = {
+		.enable_reg = 0x1acc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_pcie_0_pipe_clk = {
 	.halt_reg = 0x1ad8,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -1799,8 +1852,8 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_pcie_0_pipe_clk",
-			.parent_names = (const char *[]) {
-				"pcie_0_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &pcie_0_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1809,6 +1862,20 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 	},
 };
 
+static struct clk_branch gcc_pcie_0_slv_axi_clk = {
+	.halt_reg = 0x1ac8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1ac8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_pcie_1_aux_clk = {
 	.halt_reg = 0x1b54,
 	.clkr = {
@@ -1817,8 +1884,8 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_pcie_1_aux_clk",
-			.parent_names = (const char *[]) {
-				"pcie_1_aux_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &pcie_1_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1827,6 +1894,32 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 	},
 };
 
+static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
+	.halt_reg = 0x1b54,
+	.clkr = {
+		.enable_reg = 0x1b54,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_1_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
+	.halt_reg = 0x1b50,
+	.clkr = {
+		.enable_reg = 0x1b50,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_1_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_pcie_1_pipe_clk = {
 	.halt_reg = 0x1b58,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -1836,8 +1929,8 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_pcie_1_pipe_clk",
-			.parent_names = (const char *[]) {
-				"pcie_1_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &pcie_1_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1846,6 +1939,19 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 	},
 };
 
+static struct clk_branch gcc_pcie_1_slv_axi_clk = {
+	.halt_reg = 0x1b48,
+	.clkr = {
+		.enable_reg = 0x1b48,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_1_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_pdm2_clk = {
 	.halt_reg = 0x0ccc,
 	.clkr = {
@@ -1854,8 +1960,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]) {
-				"pdm2_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1864,6 +1970,19 @@ static struct clk_branch gcc_pdm2_clk = {
 	},
 };
 
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x0cc4,
+	.clkr = {
+		.enable_reg = 0x0cc4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_sdcc1_apps_clk = {
 	.halt_reg = 0x04c4,
 	.clkr = {
@@ -1872,8 +1991,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc1_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1890,10 +2009,19 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
-			},
-			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x0508,
+	.clkr = {
+		.enable_reg = 0x0508,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc2_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1907,8 +2035,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc2_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1917,6 +2045,19 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	},
 };
 
+static struct clk_branch gcc_sdcc3_ahb_clk = {
+	.halt_reg = 0x0548,
+	.clkr = {
+		.enable_reg = 0x0548,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc3_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_sdcc3_apps_clk = {
 	.halt_reg = 0x0544,
 	.clkr = {
@@ -1925,8 +2066,8 @@ static struct clk_branch gcc_sdcc3_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_sdcc3_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc3_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &sdcc3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1935,6 +2076,19 @@ static struct clk_branch gcc_sdcc3_apps_clk = {
 	},
 };
 
+static struct clk_branch gcc_sdcc4_ahb_clk = {
+	.halt_reg = 0x0588,
+	.clkr = {
+		.enable_reg = 0x0588,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc4_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_sdcc4_apps_clk = {
 	.halt_reg = 0x0584,
 	.clkr = {
@@ -1943,8 +2097,8 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc4_apps_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &sdcc4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1961,8 +2115,8 @@ static struct clk_branch gcc_sys_noc_ufs_axi_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_sys_noc_ufs_axi_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1979,8 +2133,8 @@ static struct clk_branch gcc_sys_noc_usb3_axi_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_sys_noc_usb3_axi_clk",
-			.parent_names = (const char *[]) {
-				"usb30_master_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1989,6 +2143,19 @@ static struct clk_branch gcc_sys_noc_usb3_axi_clk = {
 	},
 };
 
+static struct clk_branch gcc_tsif_ahb_clk = {
+	.halt_reg = 0x0d84,
+	.clkr = {
+		.enable_reg = 0x0d84,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_tsif_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_tsif_ref_clk = {
 	.halt_reg = 0x0d88,
 	.clkr = {
@@ -1997,8 +2164,8 @@ static struct clk_branch gcc_tsif_ref_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_tsif_ref_clk",
-			.parent_names = (const char *[]) {
-				"tsif_ref_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &tsif_ref_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2007,6 +2174,19 @@ static struct clk_branch gcc_tsif_ref_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_ahb_clk = {
+	.halt_reg = 0x1d4c,
+	.clkr = {
+		.enable_reg = 0x1d4c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_ufs_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_axi_clk = {
 	.halt_reg = 0x1d48,
 	.clkr = {
@@ -2015,8 +2195,8 @@ static struct clk_branch gcc_ufs_axi_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_ufs_axi_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2033,8 +2213,8 @@ static struct clk_branch gcc_ufs_rx_cfg_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_ufs_rx_cfg_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2043,6 +2223,34 @@ static struct clk_branch gcc_ufs_rx_cfg_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
+	.halt_reg = 0x1d60,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1d60,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_ufs_rx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
+	.halt_reg = 0x1d64,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1d64,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_ufs_rx_symbol_1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_tx_cfg_clk = {
 	.halt_reg = 0x1d50,
 	.clkr = {
@@ -2051,8 +2259,8 @@ static struct clk_branch gcc_ufs_tx_cfg_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_ufs_tx_cfg_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2061,6 +2269,47 @@ static struct clk_branch gcc_ufs_tx_cfg_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
+	.halt_reg = 0x1d58,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1d58,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_ufs_tx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_tx_symbol_1_clk = {
+	.halt_reg = 0x1d5c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1d5c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_ufs_tx_symbol_1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb2_hs_phy_sleep_clk = {
+	.halt_reg = 0x04ac,
+	.clkr = {
+		.enable_reg = 0x04ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb2_hs_phy_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb30_master_clk = {
 	.halt_reg = 0x03c8,
 	.clkr = {
@@ -2069,8 +2318,8 @@ static struct clk_branch gcc_usb30_master_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_usb30_master_clk",
-			.parent_names = (const char *[]) {
-				"usb30_master_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2087,8 +2336,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_names = (const char *[]) {
-				"usb30_mock_utmi_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &usb30_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2097,6 +2346,19 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 	},
 };
 
+static struct clk_branch gcc_usb30_sleep_clk = {
+	.halt_reg = 0x03cc,
+	.clkr = {
+		.enable_reg = 0x03cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb30_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb3_phy_aux_clk = {
 	.halt_reg = 0x1408,
 	.clkr = {
@@ -2105,8 +2367,8 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_usb3_phy_aux_clk",
-			.parent_names = (const char *[]) {
-				"usb3_phy_aux_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &usb3_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2115,6 +2377,19 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 	},
 };
 
+static struct clk_branch gcc_usb_hs_ahb_clk = {
+	.halt_reg = 0x0488,
+	.clkr = {
+		.enable_reg = 0x0488,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb_hs_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb_hs_system_clk = {
 	.halt_reg = 0x0484,
 	.clkr = {
@@ -2123,8 +2398,8 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gcc_usb_hs_system_clk",
-			.parent_names = (const char *[]) {
-				"usb_hs_system_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &usb_hs_system_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2133,6 +2408,59 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 	},
 };
 
+static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
+	.halt_reg = 0x1a84,
+	.clkr = {
+		.enable_reg = 0x1a84,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc pcie_gdsc = {
+		.gdscr = 0x1e18,
+		.pd = {
+			.name = "pcie",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie_0_gdsc = {
+		.gdscr = 0x1ac4,
+		.pd = {
+			.name = "pcie_0",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie_1_gdsc = {
+		.gdscr = 0x1b44,
+		.pd = {
+			.name = "pcie_1",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc usb30_gdsc = {
+		.gdscr = 0x3c4,
+		.pd = {
+			.name = "usb30",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc ufs_gdsc = {
+		.gdscr = 0x1d44,
+		.pd = {
+			.name = "ufs",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_msm8994_clocks[] = {
 	[GPLL0_EARLY] = &gpll0_early.clkr,
 	[GPLL0] = &gpll0.clkr,
@@ -2233,26 +2561,65 @@ static struct clk_regmap *gcc_msm8994_clocks[] = {
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
 	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_LPASS_Q6_AXI_CLK] = &gcc_lpass_q6_axi_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
 	[GCC_PCIE_0_AUX_CLK] = &gcc_pcie_0_aux_clk.clkr,
+	[GCC_PCIE_0_CFG_AHB_CLK] = &gcc_pcie_0_cfg_ahb_clk.clkr,
+	[GCC_PCIE_0_MSTR_AXI_CLK] = &gcc_pcie_0_mstr_axi_clk.clkr,
 	[GCC_PCIE_0_PIPE_CLK] = &gcc_pcie_0_pipe_clk.clkr,
+	[GCC_PCIE_0_SLV_AXI_CLK] = &gcc_pcie_0_slv_axi_clk.clkr,
 	[GCC_PCIE_1_AUX_CLK] = &gcc_pcie_1_aux_clk.clkr,
+	[GCC_PCIE_1_CFG_AHB_CLK] = &gcc_pcie_1_cfg_ahb_clk.clkr,
+	[GCC_PCIE_1_MSTR_AXI_CLK] = &gcc_pcie_1_mstr_axi_clk.clkr,
 	[GCC_PCIE_1_PIPE_CLK] = &gcc_pcie_1_pipe_clk.clkr,
+	[GCC_PCIE_1_SLV_AXI_CLK] = &gcc_pcie_1_slv_axi_clk.clkr,
 	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
 	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
 	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SDCC3_AHB_CLK] = &gcc_sdcc3_ahb_clk.clkr,
 	[GCC_SDCC3_APPS_CLK] = &gcc_sdcc3_apps_clk.clkr,
+	[GCC_SDCC4_AHB_CLK] = &gcc_sdcc4_ahb_clk.clkr,
 	[GCC_SDCC4_APPS_CLK] = &gcc_sdcc4_apps_clk.clkr,
-	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
 	[GCC_SYS_NOC_UFS_AXI_CLK] = &gcc_sys_noc_ufs_axi_clk.clkr,
 	[GCC_SYS_NOC_USB3_AXI_CLK] = &gcc_sys_noc_usb3_axi_clk.clkr,
+	[GCC_TSIF_AHB_CLK] = &gcc_tsif_ahb_clk.clkr,
 	[GCC_TSIF_REF_CLK] = &gcc_tsif_ref_clk.clkr,
+	[GCC_UFS_AHB_CLK] = &gcc_ufs_ahb_clk.clkr,
 	[GCC_UFS_AXI_CLK] = &gcc_ufs_axi_clk.clkr,
 	[GCC_UFS_RX_CFG_CLK] = &gcc_ufs_rx_cfg_clk.clkr,
+	[GCC_UFS_RX_SYMBOL_0_CLK] = &gcc_ufs_rx_symbol_0_clk.clkr,
+	[GCC_UFS_RX_SYMBOL_1_CLK] = &gcc_ufs_rx_symbol_1_clk.clkr,
 	[GCC_UFS_TX_CFG_CLK] = &gcc_ufs_tx_cfg_clk.clkr,
+	[GCC_UFS_TX_SYMBOL_0_CLK] = &gcc_ufs_tx_symbol_0_clk.clkr,
+	[GCC_UFS_TX_SYMBOL_1_CLK] = &gcc_ufs_tx_symbol_1_clk.clkr,
+	[GCC_USB2_HS_PHY_SLEEP_CLK] = &gcc_usb2_hs_phy_sleep_clk.clkr,
 	[GCC_USB30_MASTER_CLK] = &gcc_usb30_master_clk.clkr,
 	[GCC_USB30_MOCK_UTMI_CLK] = &gcc_usb30_mock_utmi_clk.clkr,
+	[GCC_USB30_SLEEP_CLK] = &gcc_usb30_sleep_clk.clkr,
 	[GCC_USB3_PHY_AUX_CLK] = &gcc_usb3_phy_aux_clk.clkr,
+	[GCC_USB_HS_AHB_CLK] = &gcc_usb_hs_ahb_clk.clkr,
 	[GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
+	[GCC_USB_PHY_CFG_AHB2PHY_CLK] = &gcc_usb_phy_cfg_ahb2phy_clk.clkr,
+};
+
+static struct gdsc *gcc_msm8994_gdscs[] = {
+	[PCIE_GDSC] = &pcie_gdsc,
+	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[PCIE_1_GDSC] = &pcie_1_gdsc,
+	[USB30_GDSC] = &usb30_gdsc,
+	[UFS_GDSC] = &ufs_gdsc,
+};
+
+static const struct qcom_reset_map gcc_msm8994_resets[] = {
+	[USB3_PHY_RESET] = { 0x1400 },
+	[USB3PHY_PHY_RESET] = { 0x1404 },
+	[MSS_RESTART] = { 0x1680 },
+	[PCIE_PHY_0_RESET] = { 0x1b18 },
+	[PCIE_PHY_1_RESET] = { 0x1b98 },
+	[QUSB2_PHY_RESET] = { 0x04b8 },
 };
 
 static const struct regmap_config gcc_msm8994_regmap_config = {
@@ -2267,6 +2634,10 @@ static const struct qcom_cc_desc gcc_msm8994_desc = {
 	.config = &gcc_msm8994_regmap_config,
 	.clks = gcc_msm8994_clocks,
 	.num_clks = ARRAY_SIZE(gcc_msm8994_clocks),
+	.resets = gcc_msm8994_resets,
+	.num_resets = ARRAY_SIZE(gcc_msm8994_resets),
+	.gdscs = gcc_msm8994_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_msm8994_gdscs),
 };
 
 static const struct of_device_id gcc_msm8994_match_table[] = {
@@ -2277,14 +2648,13 @@ MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
 
 static int gcc_msm8994_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-	struct clk *clk;
+	struct regmap *regmap;
 
-	clk = devm_clk_register(dev, &xo.hw);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	regmap = qcom_cc_map(pdev, &gcc_msm8994_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	return qcom_cc_probe(pdev, &gcc_msm8994_desc);
+	return qcom_cc_really_probe(pdev, &gcc_msm8994_desc, regmap);
 }
 
 static struct platform_driver gcc_msm8994_driver = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8994.h b/include/dt-bindings/clock/qcom,gcc-msm8994.h
index 938969309e00..8175ebb0320f 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8994.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8994.h
@@ -126,5 +126,42 @@
 #define GCC_USB3_PHY_AUX_CLK			116
 #define GCC_USB_HS_SYSTEM_CLK			117
 #define GCC_SDCC1_AHB_CLK			118
+#define GCC_LPASS_Q6_AXI_CLK		119
+#define GCC_MSS_Q6_BIMC_AXI_CLK		120
+#define GCC_PCIE_0_CFG_AHB_CLK		121
+#define GCC_PCIE_0_MSTR_AXI_CLK		122
+#define GCC_PCIE_0_SLV_AXI_CLK		123
+#define GCC_PCIE_1_CFG_AHB_CLK		124
+#define GCC_PCIE_1_MSTR_AXI_CLK		125
+#define GCC_PCIE_1_SLV_AXI_CLK		126
+#define GCC_PDM_AHB_CLK				127
+#define GCC_SDCC2_AHB_CLK			128
+#define GCC_SDCC3_AHB_CLK			129
+#define GCC_SDCC4_AHB_CLK			130
+#define GCC_TSIF_AHB_CLK			131
+#define GCC_UFS_AHB_CLK				132
+#define GCC_UFS_RX_SYMBOL_0_CLK		133
+#define GCC_UFS_RX_SYMBOL_1_CLK		134
+#define GCC_UFS_TX_SYMBOL_0_CLK		135
+#define GCC_UFS_TX_SYMBOL_1_CLK		136
+#define GCC_USB2_HS_PHY_SLEEP_CLK	137
+#define GCC_USB30_SLEEP_CLK			138
+#define GCC_USB_HS_AHB_CLK			139
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK	140
+
+/* GDSCs */
+#define PCIE_GDSC			0
+#define PCIE_0_GDSC			1
+#define PCIE_1_GDSC			2
+#define USB30_GDSC			3
+#define UFS_GDSC			4
+
+/* Resets */
+#define USB3_PHY_RESET			0
+#define USB3PHY_PHY_RESET		1
+#define PCIE_PHY_0_RESET		2
+#define PCIE_PHY_1_RESET		3
+#define QUSB2_PHY_RESET			4
+#define MSS_RESTART			5
 
 #endif
-- 
2.27.0

