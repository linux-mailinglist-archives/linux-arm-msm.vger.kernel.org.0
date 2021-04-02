Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3717935308E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235279AbhDBU60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbhDBU6W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:22 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45932C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:20 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u9so6681986ljd.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u9guUMYwi/Hs6Fk7xZietB3RPyJNWsBhDz/fvMQWt14=;
        b=gspVYbeWSBhiaLTWjyhi7MAkh6LTJfl/cZdUsfnz0r0rhiXblPdbdx0jTrVp+u4lJb
         O5qoi4FI0mq4j0EfrdG057m18mBfTCy7QfNJjRr1+rAM187xtFSqkvOWQysbwBvUsjH/
         fu0rwypLXetQCADaHzD8ZgwOSZo86YD0JHafziXO9Uz1hNeONQHq4LkJJD0hio94s2h5
         0IJX+Ys9fRv1H/efTbFQfrT1hZTPU0LJEwAKBTpyTPFjona5BaezrnhxdC66fYD+AzuD
         F1k/6a9zb3OOAveZDMZhbd+bJw4FrW7bSSU0YAFJAzp/3H/lafPK7SUK0UWt/VHKUveS
         M0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9guUMYwi/Hs6Fk7xZietB3RPyJNWsBhDz/fvMQWt14=;
        b=AsNWDzwxnoze6FcUOkr5C5B4sduSFdRy7Z/kw+Op/ZLoI0X2I1Gp2IAoD63eMoMHu7
         pen9QFlcGmpLYG/RoRUw1yoU6gim9XZ8prpp3Y/r94InE/CNZftJ8CAxZL5HPLT7/t7T
         EB52PogsetKtPy5faTGxUY0XA894cJ2i0+2WUmcvKNUeKnTn78EA7jOdYPPNp60GeCp9
         EwSgTinyQEPnps9kUHInS3T0PheTob1bPYJbqsfH2ULnE4NJwWBaQULF8f2EV3MRKj9A
         CFUd0/UQQOylI8fDQJF8QfNtf2JzIk9bT3wLscYh8VVmcVcJwEyAyP5nuIsmv5VnvGQ4
         HfWw==
X-Gm-Message-State: AOAM531+huSa/Pr9r5n93cCuCGp73nq3SjRneZdzOZxqAr6XLOJXOx/V
        pHFC0fq3wSmeL6KeBm053h8iwA==
X-Google-Smtp-Source: ABdhPJyZZKsT1pC0cUWhxRuq3LTGgK8FO2ILKn6pWSg5R1Rs6w8mwp579pUn6CrOWhR/bvguiY70hA==
X-Received: by 2002:a05:651c:339:: with SMTP id b25mr9244325ljp.406.1617397098845;
        Fri, 02 Apr 2021 13:58:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v3 16/16] clk: qcom: videocc-sdm845: get rid of the test clock
Date:   Fri,  2 Apr 2021 23:58:04 +0300
Message-Id: <20210402205804.96507-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
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
index ac808ed859f9..1c917cd60c6f 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -20,7 +20,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	/* P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_ODD, */
@@ -51,7 +50,6 @@ static const struct parent_map video_cc_parent_map_0[] = {
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
 	/* { P_VIDEO_PLL0_OUT_EVEN, 2 },
 	{ P_VIDEO_PLL0_OUT_ODD, 3 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
 };
 
 static const struct clk_parent_data video_cc_parent_data_0[] = {
@@ -59,7 +57,6 @@ static const struct clk_parent_data video_cc_parent_data_0[] = {
 	{ .hw = &video_pll0.clkr.hw },
 	/* { .name = "video_pll0_out_even" },
 	{ .name = "video_pll0_out_odd" }, */
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
@@ -81,7 +78,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
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

