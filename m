Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C4D657715
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbiL1Nd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiL1Ncz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:55 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AF4FAFE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:54 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bt23so6982499lfb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBLrEogvgVC3NeHszUBE4iayxBGQKHu7hspA8+ZkZkc=;
        b=DrPN3VqiNf0DrFccHo8cn/e0RQ2GtXalXvuA/vC16SQ91XO+N6O9loW8Kjhk3UHpEd
         ZsEGePn+wj2pZIrjjE/nDiOd0iBuzO7MpnAE98tHcg636LtQKYggLVxARM14x1sBQjOL
         /nZaC67PjTJlzr118CyX5Z/KLY3ukmZZVmAt/no6ULeBbNSS74ygt8OYsJOGrV4YAOQ/
         5fcjGeiONpydm8IHM5GXyT6ZQGeeVXOERRWQI0wiZMEX6CfB9u+kT9kGe8doaW0IcNal
         FJDOMyMbmMTEhS2tFbwKx5rCkphEo5A2O9kMQJG4BMyY7aiAgOuFyMxvjiA0RWzFL/m6
         Q9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBLrEogvgVC3NeHszUBE4iayxBGQKHu7hspA8+ZkZkc=;
        b=Fa4kxpP2hdvbc2aUZ4I5ATYMMGpMCJAgRlHeJEKfN9OrisWD7IuG+PuJCbf3BVLPQq
         88XcsnM9mSVOVNCLxu87YW7W5O+pDJqhcLvApi1+pTKNIdWvP4LeC/5npJC0TZyM3WXq
         BsEgEdduIThUPGNUTIKlsLd3RWnfO82yUiwm6TohFvPKqqP7d2XnWEEh3HfgPSZEgTNQ
         uNJuP5Ce91m8fN5XUwaj0MdYGAwfrDETcwpsyDdVgN2rAcEKyBW015ZY9pxYxhJKfDGr
         Y7w33Dc5AR602zuV9PLEE07wotgENvnaIb0oYQTZ9tm4bGxBWFoW3tNot+D59V9TKx6t
         KIFw==
X-Gm-Message-State: AFqh2krHzW4hSKTh6T/mfQx/TlmRAv6HnwGxCtkSamp60fCkWCKBFkAa
        vC0+7idLq5nthqtBQw6nFKZAcA==
X-Google-Smtp-Source: AMrXdXuC54MG+sgAlG53q89rPeGAXXTKIrzeD4G/2jKNdyDtNGxdYK+AtddmH2UaFSjPgdLOS+ouqA==
X-Received: by 2002:ac2:5fcf:0:b0:4b5:5ca8:93bc with SMTP id q15-20020ac25fcf000000b004b55ca893bcmr6679558lfg.23.1672234372829;
        Wed, 28 Dec 2022 05:32:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:52 -0800 (PST)
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
Subject: [PATCH 09/16] clk: qcom: gcc-msm8998: get rid of test clock
Date:   Wed, 28 Dec 2022 15:32:36 +0200
Message-Id: <20221228133243.3052132-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 33473c52eb90..908e996841c2 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -387,7 +387,6 @@ static struct clk_alpha_pll_postdiv gpll4_out_test = {
 
 enum {
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
 	P_PLL0_EARLY_DIV_CLK_SRC,
@@ -399,26 +398,22 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll0_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_1[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -426,7 +421,6 @@ static const struct parent_map gcc_parent_map_2[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
@@ -434,47 +428,40 @@ static const struct clk_parent_data gcc_parent_data_2[] = {
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .fw_name = "sleep_clk" },
 	{ .hw = &gpll0_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
 	{ P_XO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "xo" },
 	{ .fw_name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_MAIN, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_4[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll4_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_AUD_REF_CLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_5[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .fw_name = "aud_ref_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_blsp1_qup1_i2c_apps_clk_src[] = {
-- 
2.35.1

