Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81073548CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242860AbhDEWsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242861AbhDEWsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91219C06178C
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:55 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w28so19610720lfn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DaWp0NHwWVhMQXj54MQyVZ232ey0ZCPqOyojKd3YT+Q=;
        b=Fcgk07fcvO/NpcGoNov8WrGXnkVEHs/jmaKG+quI6CtkPai49Z6E0vkznpZ4tb6xns
         LPt0wHvyfmQk9J9r7sCJOFm3maP/28knZbigyfnzkKubYsvIc93blFgm7gZIY8OI+epn
         m8lQpgerY1agIa8Bau5kz/B1Q+dDCt1Inmr1j07f+s2VlItrXrF4+yk/L7y8UTecwZ/a
         wuntz6B5o9BEIg32/qSJxHHkYT1f6R6fz1XZbRV7gBBZ5gQCwotyp4uOMwy5NgNzSwid
         tShG8CWfmdTlbaqTWwjN2Xp2tYLkCz443s+F70lh+21b5Ooc1fZ1bjKEsfA1AbGHQbOj
         o6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DaWp0NHwWVhMQXj54MQyVZ232ey0ZCPqOyojKd3YT+Q=;
        b=NIoJ8RLV3nmLNgI2KbZ6/aYfMWxNPtVMXcC4eGOkaP25JOab+OsmASqZ3bmo0I9C4I
         OMJOLa/wtZb1IWK6KQsEE8h85lX9noYYkK+Qqjxw2uXKXQS75EmY78fLoPjMEhfl5KcQ
         8Q6gSkp5N04DxTwkXSshg80KXY+3So8o9TJpcp0rEvouTTqAfuFblpNRVJniPO/FCprT
         eMeWhYN6ziTpUBUSLT4vil9J/l/fVTT49EuJMeyBm0tvAI4gEee/zUH/lSJD/hHseaca
         FNdFkhIJa/ew2LlrxIXc0t8kHDvwP6MojI8ezOWkYQWzDaNf++yTaV0lzVpIZvmnAURv
         pSeg==
X-Gm-Message-State: AOAM530TG8t/cDpQTEd7z5KIsecfQUXssKjlW9GgOKRBMzangNrvBWWw
        5rD5iziy4gkrtI0zEZokUyKXtw==
X-Google-Smtp-Source: ABdhPJw56v3HGWUtIRhJqQON/qFGsmYOABwBk3ICt5x8SUYbum1R+RcRbATZC0OaSAVbGeW4MXNTgg==
X-Received: by 2002:a05:6512:3d20:: with SMTP id d32mr20007009lfv.9.1617662874162;
        Mon, 05 Apr 2021 15:47:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 13/33] clk: qcom: videocc-sdm845: convert to parent data
Date:   Tue,  6 Apr 2021 01:47:23 +0300
Message-Id: <20210405224743.590029-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sdm845.c | 56 ++++++++++++++++---------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 5d6a7724a194..f1dd97032a4b 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -21,25 +21,9 @@
 enum {
 	P_BI_TCXO,
 	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
-};
-
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
+	/* P_VIDEO_PLL0_OUT_EVEN,
+	P_VIDEO_PLL0_OUT_ODD, */
 };
 
 static const struct alpha_pll_config video_pll0_config = {
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
+	/* { P_VIDEO_PLL0_OUT_EVEN, 2 },
+	{ P_VIDEO_PLL0_OUT_ODD, 3 }, */
+	{ P_CORE_BI_PLL_TEST_SE, 4 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+	/* { .name = "video_pll0_out_even" },
+	{ .name = "video_pll0_out_odd" }, */
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
 	F(100000000, P_VIDEO_PLL0_OUT_MAIN, 4, 0, 0),
 	F(200000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
@@ -78,8 +80,8 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.freq_tbl = ftbl_video_cc_venus_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
-		.parent_names = video_cc_parent_names_0,
-		.num_parents = 5,
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -158,8 +160,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec0_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -189,8 +191,8 @@ static struct clk_branch video_cc_vcodec1_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec1_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -233,8 +235,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_venus_ctl_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

