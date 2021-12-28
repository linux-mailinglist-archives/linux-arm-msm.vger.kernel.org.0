Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08081480612
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234786AbhL1EyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbhL1EyY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:24 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9150EC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:23 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p13so2644481lfh.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e6insGDkGy9p02PkajZJi5ANDNTZOtawxzGoBxTWSe8=;
        b=JkIGzh95BV9/PiDbqPW4WnuvSScZ993tfRn/xjE5A3+ACAJ8/N1EHOZLBCqCUmUorB
         3T/hmF+ZlTsH749p0Bdnk4QBySwMx0AD8yQ5GP6hSQ8mN2XWBkDTIWLdI4m62Sh5vkGc
         omD5htRLWyKF0unBSesFa71z3b9dnGrZ/iMOlayd3+MwPo4jg2OKskNLUPgREs6FlSd3
         Tng/TCMZiBzv6nFU9I97Nd1DhVVBzx8dWukBEHZesDCHWcoWaatydm6eKNCHlJ5pc4Fn
         YG+p5CXU5qbCfkJxTwUqbxPeXZStVzBsxA0GAX3msG02knbHjerazvjW9DXwaf6RHDZU
         kTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e6insGDkGy9p02PkajZJi5ANDNTZOtawxzGoBxTWSe8=;
        b=s7la6UEzP3oKMvDEMAFjYXP0/ZFb+usyRZV5oPW09tJ4ek1jqnzOGoAtDovyb9YXI4
         Bw0SejAaAzCxoOUMGlq4KKiIodhMvrbiQZqKw862yIY0m8XoKzVou0mrTxzdkBlLOFPO
         RdZdsGHuGotgLC9UlUxSsMP5uxvkvhN0+3zlALwM812Jbt0JHUcVyIXLorbO3Qxerand
         GHUaQntepd49wofisVKcNwRaURFvL+UTbwVsrdrX2RmhMzDJ3sOMeDnhfMDlXOZRznFS
         R2AdV46rK1YksyOb18P6OEZQnSTE+q+AVjJCfh35K8wgh1JaaeSGhq/5HuXTBdj2Vblm
         4lJA==
X-Gm-Message-State: AOAM533pplgLUoax6S9e6t1ytzNF8FkhhuF538SRiXZI5hVIhZv+EEUX
        OOE9tpYBccWWZ3FXM4mRBtSaNw==
X-Google-Smtp-Source: ABdhPJzaD7Tvu0431Z4xaKkm/ZLR+H02sjOAANOx1UgKJaXkW/Hm8w/41VOuWcb355VyaelVB9zmQA==
X-Received: by 2002:a05:6512:31cb:: with SMTP id j11mr15211152lfe.636.1640667261809;
        Mon, 27 Dec 2021 20:54:21 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 05/16] clk: qcom: camcc-sc7180: get rid of the test clock
Date:   Tue, 28 Dec 2021 07:54:04 +0300
Message-Id: <20211228045415.20543-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
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
2.34.1

