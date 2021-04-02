Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056C1352574
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbhDBCVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234265AbhDBCVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D290C0617A9
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:24 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b14so5630238lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/26/DeuK2iBKRkm1YoFMZThfwYKKG7fSeEl+F4AH58o=;
        b=kXj4O+l95TTVeBSQlmyDtWTnATZMd4f/CsbH6r/KssppSRNn/QNvPCEWWsYnyUrRN+
         G10rxgg+OtBhTvbJ8LbKYw7rZnBcmNZr5lWSiYQrrJ6eFWcC8v6H6HrPCKf1MPrDCBEb
         erODF3Tz/38fZSIKxRla7JDE9KLDCmAva5v7jDilr2ygO76gPNuGnhOnJN7zpSFgkNd+
         lzsKrtm/d22cN2yTpzJGtqnoOEZ1Ylv8N75pFHrZMcfnufQVK6xpxKfEgjgog7m1+7VF
         sDQmQjQDJhQTksl5XucBEemZBEAiG2Gp4VnmlhSO8rGS0c4V5aQ9H3+dpZKtcaI+A+aK
         P36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/26/DeuK2iBKRkm1YoFMZThfwYKKG7fSeEl+F4AH58o=;
        b=SEIS/lWudj1n1eCLMcsXx+vj9HDNLR6r6G0j4UZLMFYTPHJJub8La4WzaAd47cTIj/
         z/v8k1tp7n8sK8YLe0HUUIYL+0Pe8kWiPqXHIviYOKolVZ/CeZdu2VQZtl7gzeNPfo28
         J21HkyiIcaRNcYyQUDP9UHjo3EI52zzIgk5kxtSdAzbLi2DO02olr8NFUoCNL1dF70PT
         Lo0uiBywNp7+sgt9JJ1ab7aabVdktyXuR1nhHGjNEzR4b6Ieh3CA+2DmuSvBvavBuiat
         IGvsCve7XgMQhCxTPrdOKUf8l9FIvA7cS1JXaht4er1amZXEBE2+UcxnRwHI6RmgU+sp
         O/jQ==
X-Gm-Message-State: AOAM530ynpSHPepTbTC2hHe32kfENQIUre+oAUQK1tvqlEqX7hBwFW9S
        e+JfezeHPQ5LvDbEENIEfWgKrQ==
X-Google-Smtp-Source: ABdhPJxT9O7FT04DUmDxExRbiG6B+J5hKhuCTqVnEBbK9otO7C8x5V0DcpsIyTRXr4ETjSP3O+2tcw==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr7450086lfu.186.1617330082750;
        Thu, 01 Apr 2021 19:21:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 16/16] clk: qcom: videocc-sdm845: get rid of the test clock
Date:   Fri,  2 Apr 2021 05:21:08 +0300
Message-Id: <20210402022108.4183114-17-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sdm845.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 7f3a93efa928..1997e1460e18 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -20,7 +20,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL0_OUT_ODD,
@@ -51,7 +50,6 @@ static const struct parent_map video_cc_parent_map_0[] = {
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
 	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
 	{ P_VIDEO_PLL0_OUT_ODD, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
 };
 
 static const struct clk_parent_data video_cc_parent_data_0[] = {
@@ -59,7 +57,6 @@ static const struct clk_parent_data video_cc_parent_data_0[] = {
 	{ .hw = &video_pll0.clkr.hw },
 	{ .name = "video_pll0_out_even" },
 	{ .name = "video_pll0_out_odd" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
@@ -81,7 +78,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_data = video_cc_parent_data_0,
-		.num_parents = 5,
+		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.30.2

