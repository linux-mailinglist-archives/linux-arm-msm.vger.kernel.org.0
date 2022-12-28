Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83EC657714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbiL1Nd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiL1Ncz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:55 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BB1FD0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:53 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bq39so15841476lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdrSP/q0OgBKvgM/UC7meyzdpow2K93QbfzvK24ZKa0=;
        b=PomBJ/kXP2fF8ehcevFRPUwhS20auX9Q1udBngtr3SRDktuOwmILda/u1+BFnIHMuE
         mUeCkEAd5Nv4m4bqI2wRZgx/MwAsUan6oC+XorqpYPyTMOesEhZO4UkEO+uE5JZqfBTN
         ChUq+unq8n9+C+PD5Hr3MbxcETYGS5Gi+ecplCUWOjleIDMTy5sYxGG4YeMtaGiX0Qik
         X3PTEJM3X2GAbm77LoULvwMMFyS8Ffgub+0aaw0UzRhF8gKi+koPz0/p7ISXRXoyiare
         3Q+AGv/0dwBk2sgr+nYw3tsZDF17cSsjSmxoWX7ijaaoWSgOIJ3Ib1iOl2gg4nyHWcH0
         SpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdrSP/q0OgBKvgM/UC7meyzdpow2K93QbfzvK24ZKa0=;
        b=sg5UN0txfjc6VWYN4Kuq14s3f76BanlXPtiLSAbGbgwA6R5LUeMoS9eMSNY+u3RZkh
         0Xf9CvfRcboED4PnUX7gFY41wKh/0Kep7qa0Xrw4IvqOsPPOWHwbo19q9DYvH9g7NaxC
         T+M7PWHU1897DynM4D3mBUbadsWMk7T3HwFl1rkeywcsfQR82xEskz6BeyDEtobuoX9d
         LzkWSGUtOTt+n+IJjRCLs6ua9HTouA8Ly8NUKKoVKdGs4xaiWuZEQ0Trda3b2OpvSHl4
         afoGGWJSseQtcpv8R6T83ccYaAgulSVwWP3S++p4Ob+3Wta5Y/QoxwjNzqmAHXD3O+nX
         8q/w==
X-Gm-Message-State: AFqh2krCT1fInVQlq3YY/ShJCY8cUT0ZKeMLYfbyQJijUjnOc//3hOwp
        ywmsJqIUn7DV5RMYw9hfo/88SQ==
X-Google-Smtp-Source: AMrXdXuGa68Gf6qxl03g28xXpWaaMOjMPv3LIg5Wx9wNMYuN5KiTYz0NoZ11HxczgGhuFLqVALBFJA==
X-Received: by 2002:ac2:4f0c:0:b0:4b5:5f2e:3cc6 with SMTP id k12-20020ac24f0c000000b004b55f2e3cc6mr6867337lfr.47.1672234373548;
        Wed, 28 Dec 2022 05:32:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 10/16] clk: qcom: gcc-sc7180: get rid of test clock
Date:   Wed, 28 Dec 2022 15:32:37 +0200
Message-Id: <20221228133243.3052132-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 2d3980251e78..105c4762ca84 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -23,7 +23,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL1_OUT_MAIN,
@@ -162,21 +161,18 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct clk_parent_data gcc_parent_data_0_ao[] = {
 	{ .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
@@ -184,7 +180,6 @@ static const struct parent_map gcc_parent_map_1[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL6_OUT_MAIN, 2 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_1[] = {
@@ -192,7 +187,6 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll6.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -201,7 +195,6 @@ static const struct parent_map gcc_parent_map_2[] = {
 	{ P_GPLL1_OUT_MAIN, 4 },
 	{ P_GPLL4_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
@@ -210,19 +203,16 @@ static const struct clk_parent_data gcc_parent_data_2[] = {
 	{ .hw = &gpll1.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
@@ -230,7 +220,6 @@ static const struct parent_map gcc_parent_map_4[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_4[] = {
@@ -238,7 +227,6 @@ static const struct clk_parent_data gcc_parent_data_4[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
@@ -246,7 +234,6 @@ static const struct parent_map gcc_parent_map_5[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL7_OUT_MAIN, 3 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_5[] = {
@@ -254,21 +241,18 @@ static const struct clk_parent_data gcc_parent_data_5[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll7.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_6[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
-- 
2.35.1

