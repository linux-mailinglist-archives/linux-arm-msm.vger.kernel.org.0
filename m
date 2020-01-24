Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 034EE149134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387532AbgAXWnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:43:40 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43543 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387462AbgAXWnY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:43:24 -0500
Received: by mail-pl1-f194.google.com with SMTP id p23so1361385plq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 14:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azOJGeenO90UDElVZnGvhTa1WOYkaMQED3kOM1E619Q=;
        b=MDjGZDMXlqXZUfV7OZldyntXHGM87aWp1WZpVtZvG3lp15ahEHyRkexF4mzQJ7dlAO
         x6rNvYucK03/VVjtUAEO2qx3vBAUWWaA+UmqKnUXMcCJCaZmqlqcLHf8XYJi6MqwO7RA
         Iu9IohHaGiWj+pwqnMctsCsTFYvH2hg9ofjp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azOJGeenO90UDElVZnGvhTa1WOYkaMQED3kOM1E619Q=;
        b=KC8x1X6h0eM6kKl5Xp/HC9ZI8gDGbivbhoSgwo4aF6Hq5xTSDtCAFpLwq3n4PuWKBy
         zupl8qWBRecLqcdMXzh+2WLA/y5nACm2obumDFJeiBouCLG6fOnBCjOe7Ifn/Jr64NyX
         XlzYqHTx9X4yv6u6EiEEzS4ZjiLeCCkkKWWfimhpKQPiMkbiMQQVD2pCIC+oYKTnrtup
         WGrCCbYHJPe3RPEJ1VxGJO3cZgGN/OEOwqcduf3MmngEt0jlLglkwoGmCJQDvTprcHGO
         Wh1cxc9MWK+y7ApFYQv7/uFxtEr1HRXGB7sP5ae0PBk7jUBwDliUtgiUv3Rp30WnE5EL
         f/XQ==
X-Gm-Message-State: APjAAAXYhNOa2LMFWZGkZwyCkTjvtcvJRdeYe1gXwVQDvG2hwfvm1Ejv
        WnBvNT7kDZXqH7sD8jW7L9vewQ==
X-Google-Smtp-Source: APXvYqxYRZKxhf678NfYnON6C+bRqFB77arOwAg3WMS1KXZ4+qWQqA43m9A0cMWuZMS04lt6xPrTBQ==
X-Received: by 2002:a17:902:7009:: with SMTP id y9mr6022788plk.254.1579905803606;
        Fri, 24 Jan 2020 14:43:23 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:23 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] clk: qcom: Fix sc7180 gpucc parent data
Date:   Fri, 24 Jan 2020 14:42:22 -0800
Message-Id: <20200124144154.v2.7.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bindings file (qcom,gpucc.yaml) does not agree with the names we
use for input clocks.  Fix us.  This takes into account the changes in
the recent patch ("dt-bindings: clock: Fix qcom,gpucc bindings for
sdm845/sc7180/msm8998"), but even without that patch the names in the
driver were still not right.

Since we didn't add the "test" clock to the bindings (apparently it's
never used), kill it from the driver.  If someone has a use for it we
should add it to the bindings and bring it back.

Instead of updating the size of the array now that the test clock is
gone, switch to using the less error-prone ARRAY_SIZE.  Not sure why
it didn't always use that.

Fixes: 745ff069a49c ("clk: qcom: Add graphics clock controller driver for SC7180")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("clk: qcom: Fix sc7180 gpucc parent data") new for v2.

 drivers/clk/qcom/gpucc-sc7180.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index ec61194cceaf..da56506036e2 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -47,7 +47,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
 			.parent_data =  &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
+				.fw_name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
@@ -64,11 +64,10 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "xo" },
 	{ .hw = &gpu_cc_pll1.clkr.hw },
-	{ .fw_name = "gcc_gpu_gpll0_clk_src" },
-	{ .fw_name = "gcc_gpu_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "gpll0" },
+	{ .fw_name = "gpll0_div" },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
@@ -86,7 +85,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

