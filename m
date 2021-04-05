Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8383548D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242864AbhDEWsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242863AbhDEWsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:05 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFF7C061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:56 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y1so14245678ljm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5aRSxh/VdnEwSs8b6MAVPKQ/yL6+Ku8Oug3kLMBXIQ=;
        b=frHr7W956HYA+vTUc8s2KeIlKsWmIzuRE0JBPhUenkyVc8QUuZTs1ddwqk5tXGczqO
         M+N2t1BLUspI8SL6TmHakgYZbMaRwWSlNqZoQMWXrDq95uEHKWAIUsXUYflEpPx+xEHS
         ogf7OI/BndaSqNWxlosdMvKyoS2TM6shtq8WPMnKcsPnledjbbeTxrR2z6nWWWwxJ1kD
         JmoDiomDiOtWIa2v3ahEAwjwbuWHSBgXXdI+nBhUtqDoU5RTQ/GsZl1jJ+Os+wnWIN/a
         SkuhzjtxGMTmKjNQrnJQqSv0UkgqD7tg/0RFqpwTzOqaHj2Z2wUXWeWdELy2/A2TIN+d
         2zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5aRSxh/VdnEwSs8b6MAVPKQ/yL6+Ku8Oug3kLMBXIQ=;
        b=GCpX6Jf5ioI0r+ybXmTkt+dElgRH5+yH+LYbhGaVA60Ycv3RVfC7PFUByznc/Quk9D
         rxfs0V1wayLb23wlhs6xDR/B7Md77WklRRqPBXm4spGSKl2YdeSpZnVqOdMXdp/n2yK7
         lj+5xHIO1uJmXbfgC0b582W1o5iQ2AhI2yJ7f/MBih0ScDHAHa/rnaiSsmD7SPioNKn/
         7Ao12YRIwxY4eomnay2uUOUY7SeFQ6xHhwXpzaf5JtPqfA1m5o6gbmEITS9Lf3rr2nB8
         uf1IQspFSRv/UuI8AnZSATbp+eJhg3jIGv58TsTJEMo3XTFmOp7cl10e9j3zCEuYej0J
         PUsg==
X-Gm-Message-State: AOAM533/JWIi6/NDZ3uhgVTYBZ55fcA/uMUf8jNBn90uI1fe8nffyh4d
        aV9R3DscU8SXRPt95ILB5zTQEA==
X-Google-Smtp-Source: ABdhPJwzaTt736/sXF+OrtT1UIGu+P67Aiua2+CKe31hlCYWn00QdiZ4t4v8h9y9r+ix7m80gQweBA==
X-Received: by 2002:a2e:5804:: with SMTP id m4mr17169417ljb.419.1617662875042;
        Mon, 05 Apr 2021 15:47:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 14/33] clk: qcom: gpucc-sdm845: get rid of the test clock
Date:   Tue,  6 Apr 2021 01:47:24 +0300
Message-Id: <20210405224743.590029-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index b38a4bccdc96..110b54401bc6 100644
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
-- 
2.30.2

