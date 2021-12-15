Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5604E474F9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238679AbhLOAyy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbhLOAyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:54:54 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52F1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:53 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id d10so40061718lfg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ngTF2vp61XrkTtQlRhh3XODAbI7e/hbHDlq6gA8Nt0A=;
        b=YRp25RDP6IAyh0O2c8ncOBghD8mXin+FzndirZCan8nbFjgDDV/5vYSQKABrGNO5j+
         L20ZLel9/VJ2SPYSjpxHHc3lk/mLJ7n34XVD/glIxOuRNsGbCFHYA/YAbhnkkBXhzZDx
         q9xx95RcNHdkF3aqKD5b/l6B1A4MQTcth1PMHEXAyMzN8ukTMMlm5oBiXHyzms7pLTDL
         +L4XjIO+MFkIN/5KXIeeTVxhg37Kv0qh1inhbRHhLHZNzCLUYPx7vGQzb7PheSl0D8AV
         CiWdRGgqWX6xQmX0/a2956nfPzFOIBwOePTF+O4wVV+JHG4i8tV1ULOi675oHl54IqLy
         CAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ngTF2vp61XrkTtQlRhh3XODAbI7e/hbHDlq6gA8Nt0A=;
        b=3LdiMH8s1mzt0of/9dAIX7TmqefzxT50wb6YwhvUTWf9L7iE/5NjrdSTpf+p599H0Z
         qZPNRU5lZdq+VO8hsX7L5ByBJ+Z7jSq1dDRc54tU1fwk7/+F74q+r0vqz/CgiELKhm08
         4TYt3keibTXspwfpdcgPGHA/CTjQ/K5hjsaZr3wzFowPRfdk+iCeoBfOnQWKFCHJEBs6
         MCfc+u15hkgs35WHaBgrxW9Q8HRjG6zPC1ApegOdON+72RBezxLiY157TVG/wUPO2R/s
         9bvaxi4xLZDyP+51jVt3/GEIYkuW72PAcUj575PoY6LaEDzgP1ETY6HNztCA1Abrz/Mc
         20og==
X-Gm-Message-State: AOAM532z/dTgfQMseCRfAeKlHbX4/r3DGaZrEf8wgWq2PoUKZL8ZImL1
        LEegHgSWgrTQvjgJTOq2z3H2iQ==
X-Google-Smtp-Source: ABdhPJxouFFuNLTMmnmvX51HBp3ycF52ab3uauDk5uL5t8yDGJVc6yn8nej5DYQ+s63LIGrano+e0w==
X-Received: by 2002:a19:48d8:: with SMTP id v207mr7442160lfa.217.1639529691997;
        Tue, 14 Dec 2021 16:54:51 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 05/15] clk: qcom: camcc-sc7180: get rid of the test clock
Date:   Wed, 15 Dec 2021 03:54:13 +0300
Message-Id: <20211215005423.2114261-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
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

