Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4115474FAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbhLOAzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238680AbhLOAzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:55:05 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61507C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:04 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b40so40009492lfv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+amuZGSFWXVVm3r5rOaOAfThglCaL2AfSDBWBPHb7hY=;
        b=WJlZYO6EfephluW3tv81/WAWSdkjw5QjtrM8+BNo0goHhXFoxp5w6hx7yPR75iC07S
         wJFj7OjtuDOCXHXalbIsfa1MKDb9we3Myom2Y4fchybkW+/0VOb46fWH6gGx6/SwjiFN
         U55/UuT3DeO19Nc7/u+f3KuTH634YyHjyGoeCOcONXcrW3JS6C0naNSL+qBdqmhuk7uQ
         q5XICjJRkuusWW/yBBhLHYo29lV/zhiy50McV8KcV2Paf+LODMzsC+EBRE0A/yXI71PJ
         HnGRob3G9IPi/lXCdtSDJiDM/D2USMAnGGUyqjL0PTbM041IHuD9mt5FIllnwagPKD6m
         eiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+amuZGSFWXVVm3r5rOaOAfThglCaL2AfSDBWBPHb7hY=;
        b=vEFR1B8sSwYXgD4VeZS1Jmf7kwHRzVAzuhZmD58qJP6h1yS+13+fSZiLeA5qSQXeRe
         tKUG7rGGPGI7EbdXvt46008uAj/AYi5sGrJSk5LxIa9yqAv41cXogTC5NRYrQv4xMwxt
         NbpMEy9PC7P74o2kjJZ8h5hJWktmofFl+TSsxznmWDjzuKpv9RkCIo4Ma8mH7cJpS1tt
         PfMOJy+cld8mBBJVfriNULnSXl7rkHGzhd2OrrK+e0OGutsskPUp41X0HjgdhnC5fKDl
         00/YZthuOGtiBkFCkqFpG59wH/ZgpPU7GfweHLiNYagI+HNORYxJYtQ1COUpSRQik+8g
         Xydw==
X-Gm-Message-State: AOAM530Ta2akkCm3ddP0HxwFDYhyB8Iresg9CxLe2xqTLReLIUBzmPKI
        Ixt+/N0wl7wEaavL7dJXCuuHLvLPdOWrBXU5
X-Google-Smtp-Source: ABdhPJz8XYNVy1dwECA06h4gtfDWpkcbp0PHy+zhi8F62J+ADpX+sY2+aUjliwC85YEA/aa0HvMCIg==
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr7804415lfk.148.1639529702589;
        Tue, 14 Dec 2021 16:55:02 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:55:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 12/15] clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 15 Dec 2021 03:54:20 +0300
Message-Id: <20211215005423.2114261-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 122 ++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 9b1674b28d45..d95814025c65 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -290,7 +290,7 @@ static struct clk_rcg2 system_noc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -310,7 +310,7 @@ static struct clk_rcg2 config_noc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "config_noc_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -332,7 +332,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "periph_noc_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -353,7 +353,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -371,7 +371,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -389,7 +389,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
 		.parent_names = gcc_xo_sleep_clk,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_sleep_clk),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -408,7 +408,7 @@ static struct clk_rcg2 usb20_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_master_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -421,7 +421,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_mock_utmi_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -447,7 +447,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -467,7 +467,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_ice_core_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -492,7 +492,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -506,7 +506,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc3_apps_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -530,7 +530,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc4_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -555,7 +555,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -574,7 +574,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -607,7 +607,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -621,7 +621,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -634,7 +634,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -648,7 +648,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -662,7 +662,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -675,7 +675,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -689,7 +689,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -703,7 +703,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -716,7 +716,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -730,7 +730,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart4_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -744,7 +744,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -757,7 +757,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -771,7 +771,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart5_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -785,7 +785,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -798,7 +798,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -812,7 +812,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart6_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -826,7 +826,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -839,7 +839,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -853,7 +853,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -867,7 +867,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -880,7 +880,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -894,7 +894,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -908,7 +908,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -921,7 +921,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -935,7 +935,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart3_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -949,7 +949,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -962,7 +962,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -976,7 +976,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart4_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -990,7 +990,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1003,7 +1003,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1017,7 +1017,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart5_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1031,7 +1031,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1044,7 +1044,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1058,7 +1058,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart6_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1076,7 +1076,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1095,7 +1095,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "tsif_ref_clk_src",
 		.parent_names = gcc_xo_gpll0_aud_ref_clk,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_aud_ref_clk),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1107,7 +1107,7 @@ static struct clk_rcg2 gcc_sleep_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sleep_clk_src",
 		.parent_names = gcc_sleep_clk,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_sleep_clk),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1120,7 +1120,7 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_rbcpr_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1132,7 +1132,7 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll0_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1153,7 +1153,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
 		.parent_names = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1167,7 +1167,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
 		.parent_names = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1181,7 +1181,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
 		.parent_names = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1200,7 +1200,7 @@ static struct clk_rcg2 pcie_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_aux_clk_src",
 		.parent_names = gcc_xo_sleep_clk,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_sleep_clk),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1221,7 +1221,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1241,7 +1241,7 @@ static struct clk_rcg2 ufs_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_ice_core_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1262,7 +1262,7 @@ static struct clk_rcg2 qspi_ser_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "qspi_ser_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

