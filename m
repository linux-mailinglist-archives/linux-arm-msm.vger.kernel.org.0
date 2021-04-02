Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB1B352578
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbhDBCV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234311AbhDBCV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:26 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23100C061793
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:22 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id q29so5641774lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7JxBwpurnZTOmamu5Y1J1N7aXWjvfD4iS8l8pnFRSMI=;
        b=gxFZxpH5h8kYVoBr7YSBLLAlLZMIkX24X/+jmLMtJas5nqiGsUlgvhybZcDUCQWgUb
         q9qsbDw6ir/PSfajS80TpvV3ZuwpIF13mvFDItjelXr1n0j/SxXXophyMMiRSOFiCnAp
         /HxRTXSZ8rtE54Dip9V+9Be1gJTY1AlVUMdbqH3Rb3wJB51JrdA9BGCW3COK31QpfMuo
         4zCo+NMdVBnQaz6nbIiZjfR72XLbvaMuMlneUOvwew56t5Rx6mXSnCVF2Mkx/giBWbc5
         2kzmcf652if57cHEhCkoJD9DmmELSJMpsHwaT5/OLmh21ziICepRQRx+txBzzE+DJ6HS
         RcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7JxBwpurnZTOmamu5Y1J1N7aXWjvfD4iS8l8pnFRSMI=;
        b=Jo++YKPnwfaJycF9b60PDDoLDHiHpwseMffSMAK46/JwGU2T/Kl74vCTky7UaeuYyS
         LM1w6QUpjese8lAEM6lzWPNoOaD2ncf+mC2xIUb4UQur+vE3BNH6RJxOHKuC2SAgGvzn
         WcpYh0zpyM1fIUFTnmZxLZ+T6WRtCgu3JebZxDoKSjSRIYZ6KglcaGpv2ploLvufITw2
         oCNUysUWSEq1QTLGlqj4SiKH01ZCLmhjhrvAB5U3zFG6I/o9/AHa962+exchfhq5En/W
         hGRlLXpatKXgLBwiGC2h9AOB7ah8UrhU55x/ux6ZJro6xTqrsYkxMOJH5y4jpAfK75C5
         0unw==
X-Gm-Message-State: AOAM530sgp/LyLhgxxa8/b/t4nwIP1ETRo15uXCKPnE17bpIEmzB8/1f
        FtuMayqTNaEfxPuimuh9h4Xedg==
X-Google-Smtp-Source: ABdhPJz4kfQhb/4nPYHp8sLXEwoVe0qXbWfleT2EVUKQq07Vfwb4UjMqJlaYKJgmV8V8sBuNwlXPxQ==
X-Received: by 2002:a05:6512:31cf:: with SMTP id j15mr7428704lfe.14.1617330080645;
        Thu, 01 Apr 2021 19:21:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 13/16] clk: qcom: videocc-sdm845: convert to parent data
Date:   Fri,  2 Apr 2021 05:21:05 +0300
Message-Id: <20210402022108.4183114-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sdm845.c | 50 ++++++++++++++++---------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 5d6a7724a194..7f3a93efa928 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -26,22 +26,6 @@ enum {
 	P_VIDEO_PLL0_OUT_ODD,
 };
 
-static const struct parent_map video_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
-	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
-	{ P_VIDEO_PLL0_OUT_ODD, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
-};
-
-static const char * const video_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"video_pll0",
-	"video_pll0_out_even",
-	"video_pll0_out_odd",
-	"core_bi_pll_test_se",
-};
-
 static const struct alpha_pll_config video_pll0_config = {
 	.l = 0x10,
 	.alpha = 0xaaab,
@@ -53,13 +37,31 @@ static struct clk_alpha_pll video_pll0 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "video_pll0",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
 	},
 };
 
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
+	{ P_VIDEO_PLL0_OUT_ODD, 3 },
+	{ P_CORE_BI_PLL_TEST_SE, 4 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+	{ .name = "video_pll0_out_even" },
+	{ .name = "video_pll0_out_odd" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
 	F(100000000, P_VIDEO_PLL0_OUT_MAIN, 4, 0, 0),
 	F(200000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
@@ -78,7 +80,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.freq_tbl = ftbl_video_cc_venus_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
-		.parent_names = video_cc_parent_names_0,
+		.parent_data = video_cc_parent_data_0,
 		.num_parents = 5,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -158,8 +160,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec0_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -189,8 +191,8 @@ static struct clk_branch video_cc_vcodec1_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec1_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -233,8 +235,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_venus_ctl_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

