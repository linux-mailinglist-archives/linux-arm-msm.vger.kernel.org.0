Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C63B353087
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbhDBU6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235515AbhDBU6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:20 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723D6C061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:17 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u20so6666414lja.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oD24D/NHNTgtv3QYd7/t2oeh57K22Anyb+KS67fLkXQ=;
        b=o2dXMLlOIeYOIgAeBCjPH2+AoSPCaFvJUrtje2NpkKIUqg58qlWmJlROLmbiAFUAMZ
         Il46h9jJVic3w2yqrmaY5zzZLMKDQu+wkErNcjuz78uvgxNID5cEUWDRdxSHSnO0V125
         NE1GuiYQnejGYc9F4Jet7CycdprhWqjsSeFh6HmJW4bt2kphMmtoCeWiASc7tZIQQhko
         nbU7h4H55ADxiIdUI7gVy0PKtMyZTyQa2iqSWk2guP5D0zXK5eH2RXARBz85u4Np4QIo
         +432g5c3clzVLclZ6Cwoke8FSB+mUmIGmykBbZuzdQnK+WyczBQYvt20xS2ihcZzgLTY
         Xkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oD24D/NHNTgtv3QYd7/t2oeh57K22Anyb+KS67fLkXQ=;
        b=njMnDE65+VgdwXXSk1lqsCLNiVVV1vI/In0ZFpanaJVV73yT36yTnCVoFGpwuHB6iL
         cRVpdj2n3CEjNIbv6s0qGuh4IN0jBfE7gxs9UjmWADQ6icDoDntfl/201BlJXxvLsaou
         G0jItwlKoy42Cd9GYXyi448/tG1Ya+PZq1cKN2G2vnf/2kKOLnIa1Zo6LdfTJf3Lo7mo
         bcYSGGkninOxBkAXRQCOppOnPfe9HRW2CsnCh17l+XuLr0TkVhdU/5ozSmTKr6XF41KZ
         Db6DvvVdz3mXAF7dfpB+x8DDr/iApMOXNNxGrijZv2evF56DyB/kHWWr+PG4PqaP3uz3
         wWzg==
X-Gm-Message-State: AOAM5303Xo8ut56FU+HlNNEuUB3RO9tZeALd9x+CaZikUVESFsukosrm
        z9EJQ/kvzmkHTMAvT0LusEhWwjQ2hXErIQ==
X-Google-Smtp-Source: ABdhPJx0zigoJXMtsBtSvTZahKWOuDwTqo+DJo1RzqD1PWmvMsGpxIQZVeDY4iiAWHiREOPPiywARA==
X-Received: by 2002:a2e:b4b1:: with SMTP id q17mr9429644ljm.497.1617397095939;
        Fri, 02 Apr 2021 13:58:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 12/16] clk: qcom: gpucc-sdm845: convert to parent data
Date:   Fri,  2 Apr 2021 23:58:00 +0300
Message-Id: <20210402205804.96507-13-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 2d7dc89915e8..44039fd2abf2 100644
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
@@ -82,7 +84,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
-		.parent_names = gpu_cc_parent_names_0,
+		.parent_data = gpu_cc_parent_data_0,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -96,8 +98,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
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

