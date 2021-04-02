Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829C635308A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235515AbhDBU6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235534AbhDBU6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:20 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D5FC0613AB
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:18 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id f16so6737390ljm.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4rfoVHAT7dOrwGC4eft9E0a4rQB1P3qx5SzpVkr4yy8=;
        b=ZgWYNeOei8dR6f2gYFy20WGechPXfBjKkoGbcG7SY7P8SDBmEZByXdUntVBQDlfxbe
         7kNDA1XpVY68u9ABX6npo2O7rEmeS5onbGsulnlNU/YGjdU+b4ctkT8BldfXKBzay0Gt
         9biv6C8OqPEBlqWUhzKOlNNjE8IDE/+px8LYYJr5s4ilJsgOBUt409AlP41w0QiALjyU
         uG0wjjHAaWiyKecdGLjAq5dSEE0bzWY44uDcdsCIEzHOp+ZV6/I/SwnFgVEWUGzkAkbP
         RG1m3V4F4oNaMzozEFD/+tbPbVIxiP3hP9v6bkKJJsgIOPSUMZkqYHCmTCiEZjjtxrsi
         lgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4rfoVHAT7dOrwGC4eft9E0a4rQB1P3qx5SzpVkr4yy8=;
        b=pyutwg7npCBgnNBoFy9/YsGHLNMOPOA/wv8SUJaNL+RlchG3WIAAiX6YfU7l6WnFOI
         GXw8OwDwxJAA6RWhFCNYxbly0VMTQygpRLakB7xplC+3hhzy2LDDs060KiTOpAdgGnWc
         2BeQiWh32apf2i+sAKM4aWdlXGLS5dP9MsUsant5OLgelYAf7qBy34qDHBeGpwz7/x/E
         ATkvqIq5Oks+8gZRfREwW7RtH+teqiw0j0jOz9Tbfdm5WB11H/BnbS5JH2QtzSunDcUx
         9ccDcanrQ7S/HVnrmDxGcRX0OxKqV78JOWIiZkWUa0u8BFjb5tV4oq/AOubZ5F1QEhT0
         k0rQ==
X-Gm-Message-State: AOAM531Tu6DC/we11yoKni2v6A2h/ccCHzgQdWQHbAVH7YmJ3GuD00Kb
        f+PWCmt7V5S0r30G8XlgDdZVqsSIidF6vA==
X-Google-Smtp-Source: ABdhPJxc9iuezwkpqtS/5Bqyjohb9O/rNetA3zN2XzGTzIiPUODWZCf/O/Xd8DiXZSa7wPYZCHClWw==
X-Received: by 2002:a2e:9715:: with SMTP id r21mr9314254lji.224.1617397096654;
        Fri, 02 Apr 2021 13:58:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 13/16] clk: qcom: videocc-sdm845: convert to parent data
Date:   Fri,  2 Apr 2021 23:58:01 +0300
Message-Id: <20210402205804.96507-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
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
index 5d6a7724a194..ac808ed859f9 100644
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
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
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

