Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D7C348EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhCYLMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhCYLL4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:56 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196FCC061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s17so2585454ljc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdrYj3VEfoKs37S4vt+lSgqRqm7gvPJV0IcgSzyglyQ=;
        b=oEj0Zs4IxYPZwOzPGZ+eGsE4Zonq3bbdebNNsWcZ2BzijNnQNiP4wULqi35ZLrMZZO
         /YrYqQvgrLUSw2EI/hxtCunTsmPLZbRhICiJB6AvFdiqoMrFasqXygk7u7Wou9La/kV0
         7BBCS/rm5iGlcHPb4Vvyns9986uiCNAztE66944+yVzUVxSoNEM8MDG42JOIQRskQvaZ
         Pq/z6TFgyhn3cxGTjr7t5xZ64q8Z4NF1SeJzpfefwmceY6Em9G8B78ip9UfywLaUcBNz
         7drAw/5NjZpURicfEikxdeDw77JRNxE391GHkh+tw1nKpTLdwOA3QGsz8nFeoiQ71QD5
         x9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdrYj3VEfoKs37S4vt+lSgqRqm7gvPJV0IcgSzyglyQ=;
        b=sU51lrharEtKJhoOy4xI/UQNWHtb9shmXlDkO+lFULxMTxqrxwUljk/8erFeibV2rD
         5u/JoQ5nl0355kFAx8SWGaA9DgdSLVQ8PufkuqH6SuAwDLUzjwsmm48vTIWWhzZzCOy1
         GhIAlbdh3e7aySECYhgAC0FkSF1JWHZ3AeWEu+mooawQvd3GlgclsYyCC1Izp/Qb9DBy
         VC0Y1RXcv9dOdzIRIAkfdkm8csPBw2d+YARl7FWeM6g3IMyrRcE4KIRQI1qlMwJzgVNx
         FH5AM2IlIFNFfFZqi/2MHCaeSRvgJpPFYN+KnmuEhjRhMAN2Jg1B/mXZbL2gDubXlGkL
         oVbA==
X-Gm-Message-State: AOAM531CfvwNpmkgG4wtl+dOp0ATgXXnMC3pGDhc2JYO3KhJ8JrUCUA1
        HTkGK1EeQapK23fJkzIG9lYUgQ==
X-Google-Smtp-Source: ABdhPJzU9MYuP0h2wIB0XmeX6qEZMlG73fkwmeiQ3uPHFZ1vfXNlNlJaEpz0hbmmAz3s/FiFXscdbg==
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr5383545ljm.62.1616670714640;
        Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 10/15] clk: qcom: gpucc-sdm845: convert to parent data
Date:   Thu, 25 Mar 2021 14:11:39 +0300
Message-Id: <20210325111144.2852594-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 5663698b306b..2d637b113ac8 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -35,22 +35,6 @@ enum {
 	P_GPU_CC_PLL1_OUT_ODD,
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
@@ -62,13 +46,31 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
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
@@ -84,7 +86,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
-		.parent_names = gpu_cc_parent_names_0,
+		.parent_data = gpu_cc_parent_data_0,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -98,8 +100,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_names = (const char *[]){
-				"gpu_cc_gmu_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

