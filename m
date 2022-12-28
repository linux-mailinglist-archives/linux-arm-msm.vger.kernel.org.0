Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4470C657722
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbiL1Nda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbiL1Nc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:58 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21022FCD2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:57 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y25so23637456lfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkjH2PlgM5gQOztLNEPMLMxUUrw0b7pGyT95imA4CSM=;
        b=Zze5A5vepTrf16UiIWp7G/gSJUXJNb/haB9KoN/Z4z3w41Y5DplvXXvgqn6Jmq2fDh
         IzigrkWbvZE7P9bh4cWXNsO4hlyOlUluCdF3yKPTIHxeQs9zyekf+t/KkfrdVOXzXOSW
         gVTxDP2nD3dsyqtBDgK7P3/4C5Wh9P1v24MVAFgC4+cu0VSFsJO2B/iKIYwJQrDY7cWm
         RY7jKmg3w4elFf6COx3EwIo0w3w7vLqPDJJvz5giNCrbV65yw6SVRrZFp6c819fc7nqT
         zPh6c929lcw4EUgxArzGS4v4krRvRe/JepP3saNjRJDLND6Z6eA7uQWrxBzY/dDAQRAC
         aJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkjH2PlgM5gQOztLNEPMLMxUUrw0b7pGyT95imA4CSM=;
        b=eKCt6S1cCSiTG9VBTgHZKNj8Gbw+vRJkHY5fuCassIAZ58amL8BTL1Oh4dgB08dHzv
         VJseFiO1MhFFkaNB92ChOaB/knd91bjr7y2jdDZZRg8vkmUUtGVdBgjIWr+Mw58oNDG4
         0kDd6/dqeU/uwyBNJfeBtQ2wscDSeSjHcgjMyr8QhGg6/rBO13v+rJRDNfMzJy3Bw4KV
         acFmWR3a2c5uDD7SHlziQHVECJ8nmD8Ls2PkB/tdTPpAwuK5Mltx5e4XAyZc57U19hxf
         E25IOWhBFvxHD9LlBfBrArj98pTJUuI5NSbMvsQLRRGKJf/bvZ8FLyhy33MkkaTv2FZX
         GGWQ==
X-Gm-Message-State: AFqh2kq9nSJgPpBEef0W93GS/BVKPS/60oIlrXry7cptGWEQydcRilUV
        tZEye3mLDLexiW6OHSYdrBKCaQ==
X-Google-Smtp-Source: AMrXdXuJBAW5I2GqOaeXw0S08ts758qfkupmMm6Fz/KTGQpgDDuCyhnUVuVW9+URX3/P1HIYA5MYKw==
X-Received: by 2002:a05:6512:25a2:b0:4bc:a66e:9aa7 with SMTP id bf34-20020a05651225a200b004bca66e9aa7mr6821658lfb.6.1672234376691;
        Wed, 28 Dec 2022 05:32:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:56 -0800 (PST)
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
Subject: [PATCH 14/16] clk: qcom: gcc-sm8350: get rid of test clock
Date:   Wed, 28 Dec 2022 15:32:41 +0200
Message-Id: <20221228133243.3052132-15-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sm8350.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index c3731f96c8e6..af4a1ea28421 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -22,7 +22,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GCC_GPLL0_OUT_EVEN,
 	P_GCC_GPLL0_OUT_MAIN,
 	P_GCC_GPLL4_OUT_MAIN,
@@ -119,14 +118,12 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
 	{ P_GCC_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &gcc_gpll0.clkr.hw },
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
@@ -134,7 +131,6 @@ static const struct parent_map gcc_parent_map_1[] = {
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GCC_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_1[] = {
@@ -142,29 +138,24 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
 	{ .hw = &gcc_gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk" },
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
@@ -193,7 +184,6 @@ static const struct parent_map gcc_parent_map_6[] = {
 	{ P_GCC_GPLL9_OUT_MAIN, 2 },
 	{ P_GCC_GPLL4_OUT_MAIN, 5 },
 	{ P_GCC_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_6[] = {
@@ -202,7 +192,6 @@ static const struct clk_parent_data gcc_parent_data_6[] = {
 	{ .hw = &gcc_gpll9.clkr.hw },
 	{ .hw = &gcc_gpll4.clkr.hw },
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_7[] = {
@@ -267,25 +256,21 @@ static const struct clk_parent_data gcc_parent_data_12[] = {
 
 static const struct parent_map gcc_parent_map_13[] = {
 	{ P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 1 },
 	{ P_BI_TCXO, 2 },
 };
 
 static const struct clk_parent_data gcc_parent_data_13[] = {
 	{ .fw_name = "usb3_phy_wrapper_gcc_usb30_pipe_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 	{ .fw_name = "bi_tcxo" },
 };
 
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 1 },
 	{ P_BI_TCXO, 2 },
 };
 
 static const struct clk_parent_data gcc_parent_data_14[] = {
 	{ .fw_name = "usb3_uni_phy_sec_gcc_usb30_pipe_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 	{ .fw_name = "bi_tcxo" },
 };
 
-- 
2.35.1

