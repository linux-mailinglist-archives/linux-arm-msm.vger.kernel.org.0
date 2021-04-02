Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01895352573
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234272AbhDBCVY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234276AbhDBCVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:24 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAEFC061788
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s17so4274813ljc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9JY7IrTHCDLMbAo3dIfcTpZXH88SFqfgnI8RYiC/oc=;
        b=M6Vy67O2g3tIs/IqCvSpBnGSZg5nP3PxjJcb+VmAgcGoo/ZgYYFtEIP2c571O7ta6Y
         L03nbvdXG+GCiMEOWOaJweogF+7a3hG6hsyRtnm2h7mrmgQYo5+J7IfdjHKvT18p2ppc
         pLysSUyWLNE07G0pAxng/iQ6meeYOg2wN54odwrYmKi6+ttEWglQ/347c2KXPfBWZ4Ga
         innooNAOYukJpYYxiSXjlHxdeuroRjyEloZ5MFuRScXrmyntkxzkbQKaiv8E6coM5Djn
         /LjH29A0CwSMTRtReY1/LLa67Ybh697QPFMR0L2zOL1aQfOuyG0aPW5z+N861HOD6zwv
         KNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9JY7IrTHCDLMbAo3dIfcTpZXH88SFqfgnI8RYiC/oc=;
        b=FjOUJ5lRllzKi/IL/JhqCnEfoYSjePw77thB0cmrCZnZrCYSCVsWJtboql/dupaibS
         r8w8h46DjVLxEEk5XJip7quh/4ARlpVxQGIbYUffWkPAJqLMyqCZNLQVY6aFeZJmrVk2
         VakQpvyhhOoX9S7VfDkdryFSouJBhaOd6ZxqMJdOqdWCULcBJGZcSM6HK0qSnkjV6/xp
         I44K49S9zMXRYVMGIdaSIig9YeYJExDovpIiNaFGviP+jQpI0v6CW6OaQz0wyh9XeC3P
         oSwIiE0MmmSlXx9bgQQLrLUzfYul2qSvWDwifUGgBHP8DOdP1n0YLA8uOTe8GZfsmvjW
         Fovg==
X-Gm-Message-State: AOAM533lJGZv//VYqzjPNNCJPHnht7aJ3NYjqkD/Hzo/T4TqMS2dnNWO
        wgDO3xQSoMkXjGG7FAGPo19PQw==
X-Google-Smtp-Source: ABdhPJzxC700YCv5cMTsr4Q2Aao+Hj8m+W4s1qKg/SOkFNrjbnZ201yYrApk0kWmu3D/kRZP/uM0IQ==
X-Received: by 2002:a05:651c:2129:: with SMTP id a41mr7324710ljq.193.1617330081349;
        Thu, 01 Apr 2021 19:21:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 14/16] clk: qcom: gpucc-sdm845: get rid of the test clock
Date:   Fri,  2 Apr 2021 05:21:06 +0300
Message-Id: <20210402022108.4183114-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 44039fd2abf2..621ad03fe154 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -27,7 +27,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL1_OUT_MAIN,
@@ -58,7 +57,6 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
 	{ P_GPLL0_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_MAIN_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
@@ -66,7 +64,6 @@ static const struct clk_parent_data gpu_cc_parent_data_0[] = {
 	{ .hw = &gpu_cc_pll1.clkr.hw },
 	{ .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
 	{ .fw_name = "gcc_gpu_gpll0_div_clk_src", .name = "gcc_gpu_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
@@ -85,7 +82,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.30.2

