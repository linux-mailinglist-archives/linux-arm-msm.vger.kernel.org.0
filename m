Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A9E658602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiL1Sw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbiL1Sww (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:52 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80A615FEE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:50 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id p2so1700794ljn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS0HAllZkywtIcQlpgil4HSfHeZh7tqa53Trpw9kMZQ=;
        b=xZV8br6JulqIMs8AbUTb8eggtgwoM9tTF7m0VSmAW/FKemhPabJPbG/ZblklnNSvoV
         cDjPMX9DgqFMlrt83Aj23GxmNvAI/xkCrL66DbzUM9inguINj+OGAagrI/KJr/cK1brv
         1HPFBnuHHLJwnyB3o2FSrHP4k0XMtP9ZY/n02o/vfvl9cajJodk+RuHDipzRX5ZTxlUw
         nagvGYoMKSvvNq2n+3FXtUPLOc/BtKUO6zghzF6wdWFgLmO6Pedpo7dc8zRd7wIQhK13
         6+swjbLoJJQcgiX0WCLyIjo8tWqXXX5GcpSTMwahxGCmauokYhFMD38kOXJp3bwNdKLn
         cGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RS0HAllZkywtIcQlpgil4HSfHeZh7tqa53Trpw9kMZQ=;
        b=HboT6Oq55iBJKl+JK+meddtKOHJggHxLZ/tdqpdJS7akeLxOVpibmtNKl3W4f7EvMy
         wtSoPu3DAICpsZ0U3FXirNREN35UB0Z88e4PAJSEx/XYmFczcuWiuHlKB06RVYbCLGMW
         QscJ8Jz4CqrlCeFgYanBFbOOX+hV8SYBx1SQZNR8Yn0vvhbz3OPJQGAc7AfmQ2+iMZip
         ohEmrYt5yZSK6KxAEpGfbPQHYWYB33fwKNeYCLvlMtjlxOrlTH47GcF/gUwYC4NVKsRB
         /cIkxD6Kp9FqIkCN3OeaCXzRC3BY5BzrhjrOlR8q36CBxkXITrqQRKhEzwuTSuLX7iHk
         I3HQ==
X-Gm-Message-State: AFqh2kqmBxUkbIWBFG2YXdfPmRWcNj0cw1DA4XxrQgoRPsfaOiz7cuOn
        TwfYdNz93LZO+9xuh8C7fYxzfQ==
X-Google-Smtp-Source: AMrXdXuJl68Z2hpqVLltlpCbE9qtkq0YONMl0F7IrO+5I/67s7vWYP7Tugh4Jf3eQZdWn0gClmP5Og==
X-Received: by 2002:a2e:9385:0:b0:27f:2535:8b83 with SMTP id g5-20020a2e9385000000b0027f25358b83mr8032584ljh.22.1672253569028;
        Wed, 28 Dec 2022 10:52:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:48 -0800 (PST)
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
Subject: [PATCH v2 10/16] clk: qcom: gcc-sc7180: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:31 +0200
Message-Id: <20221228185237.3111988-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.39.0

