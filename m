Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B393F355F56
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 01:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344128AbhDFXT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 19:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244318AbhDFXTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 19:19:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3348CC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 16:19:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id v140so7593597lfa.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 16:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mdh5NvSZNpel1YT/OpgDBwKJu+seO7F56lAGeiiRX4I=;
        b=mbKpVkArC5XXyGMyhAxHZHAG2qnePMajO1cVVhjAQzhYgEKx0/Qsxvut1Nq49adYkS
         EYtpfjd4juHUF/IJQuTQwcgpRM1HB1wrjNciPtTSuerN4GoefkPy1u0YpJK08sRxcGeT
         ShdXpfjwc0APJ07uC6TLUjzV8kgHTDTz7H1ishQHeGB1q6c/dtQNkLDhNnqkw8sUJdOf
         SASa+sXqVT9EqlphIvPgzqA0j0Jis6OaX+NMdzxmsMmoan2VALRxd2enyK9AhEKgEiiC
         B0oxLDJByANV9l73lrF9wl/bcmsAH4jhFvBErvAOn5mKSWvCTJpDC+hX5O9rx25nGP/j
         reoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mdh5NvSZNpel1YT/OpgDBwKJu+seO7F56lAGeiiRX4I=;
        b=QNlmHHGhloJ+EvRN21OnapJQSL6HZudDUqHQWJxtKTj/xZf4uPdC1XTJ1wV+TB4u4d
         MndTnoBsN1CI9Yg0IDtrbqm23VpNicymxQg0EHex0ZNkIITbRTSXNdP1V0vyjV9siUcK
         8lagD/x7b7FkhS/VycGJaYoaA/Rn5xi+d+47nGleCgFv+ST90KinJSAXBB897o+zhFhR
         8ROXukKgu4VfWh3Xo62N7n9mEKihKuwlmpXeVb8jHywIoD81Rk8DImgQQNTHg7QJkkC1
         RnS2LQTRxtoNxzNtw0NFaxpIubgu5OfdQNalV0LysLx7NrjYsvMBSbVIiay8hGh3ufea
         cNmg==
X-Gm-Message-State: AOAM531MtMKGUwx4wLuxldf3CzhaVe7pkmf7kxdbpdGjkViY6d0d11s6
        lNFI3MNcLBOWnuasA/ObkzZ+/g==
X-Google-Smtp-Source: ABdhPJzBDLGUU5uF1rFpCj2HUZdyH8MrH6vNDQ2CsGVVLbv87ggCOr4Bme7yJh1l+5Wtl6NzLPgk0w==
X-Received: by 2002:a19:ac4a:: with SMTP id r10mr397176lfc.468.1617751153688;
        Tue, 06 Apr 2021 16:19:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm2366565lja.48.2021.04.06.16.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:19:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 3/4] clk: qcom: gcc-sdm845: get rid of the test clock
Date:   Wed,  7 Apr 2021 02:19:08 +0300
Message-Id: <20210406231909.3035267-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 46be43a02bf6..58aa3ec9a7fc 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -28,7 +28,6 @@
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
@@ -98,14 +97,12 @@ static const struct parent_map gcc_parent_map_0[] = {
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
 
 static const struct parent_map gcc_parent_map_1[] = {
@@ -113,7 +110,6 @@ static const struct parent_map gcc_parent_map_1[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_1[] = {
@@ -121,41 +117,34 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
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
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
@@ -163,7 +152,6 @@ static const struct parent_map gcc_parent_map_6[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_AUD_REF_CLK, 2 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_6[] = {
@@ -171,7 +159,6 @@ static const struct clk_parent_data gcc_parent_data_6[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct clk_parent_data gcc_parent_data_7_ao[] = {
@@ -198,7 +185,6 @@ static const struct parent_map gcc_parent_map_10[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_10[] = {
@@ -206,7 +192,6 @@ static const struct clk_parent_data gcc_parent_data_10[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 
-- 
2.30.2

