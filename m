Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6C14761E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhLOThU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOThU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:20 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F67C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:19 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id l22so45123011lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ngTF2vp61XrkTtQlRhh3XODAbI7e/hbHDlq6gA8Nt0A=;
        b=BWbFc5cJUpBPGIrSp52RGX7IsTig30+CcqgjURz2mBP1MVB747QL3sPcLhiGy6nDJb
         25xQi8veQNSsQovXj69QHE9mnaF/d81RIfx3zVKxwGxSX19Lw09oKMZmNHhVKJZU1svq
         vZz+EgVl82E71g2Hx/DSPvhYWGuhwXBK5kHu4laH6HY+BZwq1ljDGvgdjmXg9427DWA7
         D39nZxSwH/UloqABDBtuR7vFOAzgq1/CJTTvk/EgwV564NlhTr0xKWNNshoB2DmTSoHL
         Fm+UaRAEEAaSvK8kq3+CYYoyrgSDHRi+0ocOIv9F5cQ5DiZEHAGZt9cBx1z8O0NWjShA
         ThiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ngTF2vp61XrkTtQlRhh3XODAbI7e/hbHDlq6gA8Nt0A=;
        b=id/FHbHjDt2kN5BZPMQkBzrWcUu1dKXEym8fWuABlDjPT0HvxpQgcEqpVXpJtzjH3y
         ESc6Diyo5ciN0XouvNcrMRcSDLm7gWXL3Cqi98tCM7z+X4gDDuxlbVuizKZ5R/Grlg6m
         9bQKqqWABfWL3i5QQgTbXLdvw6WOMRQztS/AvLK/29WKLHSQRE5sT5FUPsCojeSl+nl4
         Am30pfvU5AGBNyGTyPybVj4q28fb61L4d+pBIhH+WiaRM3TFNC50Bhgkr9xWzeG5yftP
         DRnoNNNLZ3ug8FkZNWx+8SIy7zYqHtcSgnR5IrJiZvGen6gWgQ8OLL6125BbDFO3pr10
         UI9w==
X-Gm-Message-State: AOAM532pVc/l8D4U/suCFnqEqDaOmjG0yURGReQMlzJguCZfESnEIc9H
        4zYfEGNtcRNUIHV1ZT1HLysTRA==
X-Google-Smtp-Source: ABdhPJxWLuCwYDH/HCAY0aa3HmIO982rJNIK3iOIAg+fgLANNBKJPUKgIiV9Hzf8n/4XqBK6hVFUvg==
X-Received: by 2002:a05:6512:2212:: with SMTP id h18mr11522377lfu.55.1639597038065;
        Wed, 15 Dec 2021 11:37:18 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 05/16] clk: qcom: camcc-sc7180: get rid of the test clock
Date:   Wed, 15 Dec 2021 22:36:53 +0300
Message-Id: <20211215193704.2821775-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sc7180.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index f6e303976a0d..3c15e551419f 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -29,7 +29,6 @@ enum {
 	P_CAM_CC_PLL2_OUT_AUX,
 	P_CAM_CC_PLL2_OUT_EARLY,
 	P_CAM_CC_PLL3_OUT_MAIN,
-	P_CORE_BI_PLL_TEST_SE,
 };
 
 static const struct pll_vco agera_vco[] = {
@@ -187,26 +186,22 @@ static const struct parent_map cam_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll1.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL2_OUT_AUX, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll2_out_aux.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_2[] = {
@@ -214,7 +209,6 @@ static const struct parent_map cam_cc_parent_map_2[] = {
 	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_2[] = {
@@ -222,7 +216,6 @@ static const struct clk_parent_data cam_cc_parent_data_2[] = {
 	{ .hw = &cam_cc_pll2_out_early.hw },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_3[] = {
@@ -231,7 +224,6 @@ static const struct parent_map cam_cc_parent_map_3[] = {
 	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_3[] = {
@@ -240,33 +232,28 @@ static const struct clk_parent_data cam_cc_parent_data_3[] = {
 	{ .hw = &cam_cc_pll2_out_early.hw },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_5[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_5[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_6[] = {
@@ -274,7 +261,6 @@ static const struct parent_map cam_cc_parent_map_6[] = {
 	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_6[] = {
@@ -282,7 +268,6 @@ static const struct clk_parent_data cam_cc_parent_data_6[] = {
 	{ .hw = &cam_cc_pll1.clkr.hw },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
-- 
2.33.0

