Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC16D14E49F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgA3VNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:13:39 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35204 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727869AbgA3VNA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:13:00 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so1829476plt.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u0d18Tiuc91wq0r+MI9js+qIt5jAuoFT35gTcYK6AC4=;
        b=klIlRQrEupGrGJaAibFlNRXGEU7pN3PEjN1xY78etxsnqd1dBV7gc6YiaviQykxEdF
         ysJqNmaWiu1wXQhyiujlYkHDnH51ZWAE6MF1vFwS3I0V+VUEzXFv7rtUBjewDYfHKU1h
         1TeVPKXD8wMWBFYZSy2SlgTdHFsDDjZzzmp3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u0d18Tiuc91wq0r+MI9js+qIt5jAuoFT35gTcYK6AC4=;
        b=KFYq9dNwaNU5v4h2kxACkEfZSx4yzUAjXBGpM5bUn/2imVaqay/YU69z7JB/xxKqcB
         KKAaVe1Jezf/ZsvLpMWzsc3x+RYvZYy8nJm09Phht5xvlx3xwsmGFc435fV7FVY1EH9m
         XzoZ9o/a455okbDmHUEykcAr+3XrXKdFs1Kn2ZH7Tv1Zb83Cpw6sCVJZRNy+t2cWL4OD
         fnkQN2d4fUYZ4Y+36wt6GoCa0VeBjR9eibdwcKqTzZ9mBy8Fu+knLGsMcEZTcD957MB7
         gnA7GJIMtORZno6adX3qwZuk8IBoVDoyCQ8rZotNwfbC73TQQZ+6uxmKaPUkqb5Mig5C
         dL1Q==
X-Gm-Message-State: APjAAAV/vvPyoLbBRB0ja+VNHYrxWWAUX9uIcAtXNSmjOFkx4uwqOyov
        N9TD7BV7ndJqV0d7HnTLrT2N9Q==
X-Google-Smtp-Source: APXvYqygb69oTlZosR/4ds61je0W4fNhc+VglR47ec88QD802ZBNusUvY9xwHsgh2q0Dk9KdFc80dA==
X-Received: by 2002:a17:90a:3a86:: with SMTP id b6mr8102846pjc.96.1580418779627;
        Thu, 30 Jan 2020 13:12:59 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:12:59 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/15] clk: qcom: Get rid of the test clock for gpucc-sc7180
Date:   Thu, 30 Jan 2020 13:12:25 -0800
Message-Id: <20200130131220.v3.9.I6d5276b768f6593053be036a3e70cce298d39f0c@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("clk: qcom: Get rid of the test...gpucc-sc7180") split out for v3.

Changes in v2: None

 drivers/clk/qcom/gpucc-sc7180.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index ec61194cceaf..c88f00125775 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -60,7 +60,6 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
 	{ P_GPLL0_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_MAIN_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
@@ -68,7 +67,6 @@ static const struct clk_parent_data gpu_cc_parent_data_0[] = {
 	{ .hw = &gpu_cc_pll1.clkr.hw },
 	{ .fw_name = "gcc_gpu_gpll0_clk_src" },
 	{ .fw_name = "gcc_gpu_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
@@ -86,7 +84,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
-		.num_parents = 5,
+		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

