Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1703548CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242862AbhDEWsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242853AbhDEWsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:02 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08549C061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:55 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u20so14219118lja.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M5Z3CmrtJqYjyCysAchxnacG6jL8cKLOXdM48UI1dE4=;
        b=GgmjPziNy25lzsSdfga6B2Z6FjGp8IARiwybppUsCJWZvZPMqGsi0UZrpJUrHuE9qH
         64bH8rqeXDGk6nFXmSj2HebsX6s2H216Wes7mjuc70lTuKkpuSPvxCIsJv0/v3AMOuu3
         PVMqT60q9uzF3o10jufHkiWhV1I2v3CkQjklsXHHAda9CnNKgFzjnQZTDo06dOxlzhb4
         AJJlA53Ah9hPlKP+N8ysnmVlWct+WbC7n7VW3JyuVXyl1s4ynQsQRY5nFIuGSt6PNEEs
         Ei6N9+Gcmay3lE9kwlE/TOC82bTYIXH62ldVPnXdO9XyaY4yTwVSynbBCi+UxP/rU6Ff
         EfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M5Z3CmrtJqYjyCysAchxnacG6jL8cKLOXdM48UI1dE4=;
        b=BhnB0nGuDxReF4L7SZYVPmEmTjFzvilMrn3QJfp7LgddSROIKz8cUKIlQrLo9A9+HG
         gnFeE2CUeMd01ib8/B3HA50Hrrh3byHm2iXklUVXSjDtK4hn132EPJhvq0c3LJRo8VyU
         KU7lTeKgbBmYsvScPV4XLEf4fOVJPTtJ0Xjf5VXs+yXrJG16NnfFHViG+sxyQ60Jkpj/
         5VescT9esJ8Q5wJ1ewsjmgESQOhceYnOp0V20a3Jma/5SAtvaNFTlqWtzV74Q6lsXcbE
         ddUbYKVNZHCiBP/iOwaNGsRi1XWPz0x4yN4NCdPVnRufUM2iJkHTNqqwDL068uAGAuhL
         N37w==
X-Gm-Message-State: AOAM5303PF03YFXyo/3ocUYalPSyaFPEosWCpqmq7vMCUc8U/5kZk078
        9dhgLL57VY8c2VWCP+JQzE+JZQ==
X-Google-Smtp-Source: ABdhPJxjvD4LAqZntM9Yygr2n6JlK/QkNc3COB2UCLmrHLDKVgu+k3krNjKP7DiLdLTO7paoTcxRZw==
X-Received: by 2002:a2e:5716:: with SMTP id l22mr17128357ljb.244.1617662873546;
        Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 12/33] clk: qcom: gpucc-sdm845: convert to parent data
Date:   Tue,  6 Apr 2021 01:47:22 +0300
Message-Id: <20210405224743.590029-13-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 44 +++++++++++++++++----------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 2d7dc89915e8..b38a4bccdc96 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -33,22 +33,6 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
 };
 
-static const struct parent_map gpu_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
-	{ P_GPLL0_OUT_MAIN, 5 },
-	{ P_GPLL0_OUT_MAIN_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gpu_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"gpu_cc_pll1",
-	"gcc_gpu_gpll0_clk_src",
-	"gcc_gpu_gpll0_div_clk_src",
-	"core_bi_pll_test_se",
-};
-
 static const struct alpha_pll_config gpu_cc_pll1_config = {
 	.l = 0x1a,
 	.alpha = 0xaab,
@@ -60,13 +44,31 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
 	},
 };
 
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
+	{ .fw_name = "gcc_gpu_gpll0_div_clk_src", .name = "gcc_gpu_gpll0_div_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
@@ -82,8 +84,8 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
-		.parent_names = gpu_cc_parent_names_0,
-		.num_parents = 5,
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -96,8 +98,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_names = (const char *[]){
-				"gpu_cc_gmu_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

