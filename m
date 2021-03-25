Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C58348EB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhCYLMk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhCYLMB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:12:01 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAE6C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:59 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b14so1902778lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DSVfYQ9ZPjA/bgLQSetVxDKJ9vsWeSggzjNMlh72HGQ=;
        b=XITEs6fZGgRcoc2ho2PtVJU87fCTVXlsxK09nkC+3uD5qSntkpJPAbFfw0efcsi9R3
         QKtJA06M6dHH75egwfYYPYGL6LewPQh+R92EGoKeZhPhAtIKW1GCr9xyWcptCygBgklC
         N9B5JAgZry0rQzJW8PaGKk3w9Oy6RO1SYogGU458gj7q1iQwTtQ0RZRcsTRrQ8NeJR0u
         ceSJL9gBtBzvldALwAgIRLgB3d2U22XGB/WpWNtzUgSvm238Za+IhBC4Qzjcb6t8WQwe
         fmIRHXNvfCSP7kCDePdeiC60cP8Q0lCzSbeO4v5nEMtxyhg3MZHjGEa9BSbPS3S0IVGj
         JRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSVfYQ9ZPjA/bgLQSetVxDKJ9vsWeSggzjNMlh72HGQ=;
        b=ZcqPzhv3AAj23MrmgLegwBBiVEC30UTSoxiAEPhbmWXarKC0Oi/CbUlZ8sSU47vQrZ
         jS2xs4Vem0pvyiQW/w/OxchSB4az1Wgcsih+D8CCfYDSNju01btHaT4Fu1WV54bpTlaw
         sAfEjgPX2vKyDDwoFBZWEFZ/4eimgVe5QH39BEqG4QJKmb6/xSSFO4L/5DK5W9ztoziu
         h/FleFrwpkvJD8BpP0mmOsIQot4DavZNrcGy0OGR6vNfT9K82gwXu/EuCYCKxCXifZeH
         ow+ZrrJCanEiLn/34DpdQ+axUxSZCyuVUqHNuK2MggNpjZf0gOBSyT6Qx9DpmiHFb14x
         2GJA==
X-Gm-Message-State: AOAM531+kuiRgtBnSgDg0CE1tIOOdqszO/4tviRGtQgDAIlFNMIHnjee
        jGjpPptlQn/kIb/5teEoZv34Wg==
X-Google-Smtp-Source: ABdhPJz6jHHW7JQwYKQ0fSJow2OZTXyubDAg8YZl3od06UhxgkK7kOYKY+WbA0t44E5mkXLCw6y5+A==
X-Received: by 2002:a19:380a:: with SMTP id f10mr4601010lfa.294.1616670718266;
        Thu, 25 Mar 2021 04:11:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v1 15/15] clk: qcom: videocc-sdm845: get rid of the test clock
Date:   Thu, 25 Mar 2021 14:11:44 +0300
Message-Id: <20210325111144.2852594-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sdm845.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index c8e9a4153b74..312097ca785d 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -20,7 +20,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 };
 
@@ -47,13 +46,11 @@ static struct clk_alpha_pll video_pll0 = {
 static const struct parent_map video_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
 };
 
 static const struct clk_parent_data video_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &video_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
@@ -75,7 +72,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_data = video_cc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.30.2

