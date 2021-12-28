Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0287480626
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234813AbhL1Eyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbhL1Eyd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:33 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7123AC061401
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:32 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x4so11271293ljc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4/8OeLDFMc54T4NcDZL3TjYqlzhR/54Qt2Rb3JyBUno=;
        b=s0Bn+QxmZf6UM6hKqEnSFIJRJxfjxZFWfkVdHkfuaHnOV3OAvZmz5CfrPcvWX5SkLB
         Ip1fgj0AhJ+KydIwDTpvcEzNwnwmjRmFnn7VnECEw+OC9UeEv3vtgiTCo9QJ0CRFieq+
         vl/msvJZhnSjNbsWQ6Iejzejr0DrWxHkjvt/M4A0E/rGFSCwVCRn89JqQCJ9mKinEUoi
         +G6K1gksffMY8bLtQ5ctOefK6gS2fDoR7vEdO505QWC01aHxJdYPatFpguNzRqBi7Aic
         BqPuIF6Ls+VQb4YjI2cb02BIGXzoxtZCSnpCGlcdstzi9XWCFI8r/93auoKO3L3XhF33
         Ensw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4/8OeLDFMc54T4NcDZL3TjYqlzhR/54Qt2Rb3JyBUno=;
        b=UtpYuYM7SLBANyGKB3Qb66MwJa0hPB8ySq1+0dcNIuRzRkFpAPzS0x4v+zrvy2qr7C
         FHPk63+CwBeIJAZFdAHMydimRN8LceUXWxHVknYk8qjIFB94/Xh40z9jnFSoQzH6IWIP
         edlpkCkvaK0vFDXfNte3KzMwKtGefQqXKIJz+tKo1+hVtaghEju87Fz87mtCyCUAMGK0
         6txnbcek+sPR40gcQoYVc1oAKZpl1V8j+VR9xz7mzWVb6/2DaEMERuYXbhxOMqegs2a6
         8jyS3dbtviFC9ZRaubc2wsN6J0QzMNJsXcHBEp0vYT0JEGx49IGhSxRJhiaBA6gchz+7
         Z7VA==
X-Gm-Message-State: AOAM530EEN+x5H2/pL6q8fEtH/gUlapUNce3Es1HmizUepoqS0gIHc35
        IY1UXe7V9WioDtyO79OnydYRxw==
X-Google-Smtp-Source: ABdhPJwQ9kaeTu777H+eUuplxFLNFOGAMd3f8DfBqjDpgHWnZ6DTPjYYYo0iUELie3nH0b0HDHvR+w==
X-Received: by 2002:a2e:58c:: with SMTP id 134mr16541443ljf.246.1640667270742;
        Mon, 27 Dec 2021 20:54:30 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 16/16] clk: qcom: gcc-msm8996: start getting rid of xo clk
Date:   Tue, 28 Dec 2021 07:54:15 +0300
Message-Id: <20211228045415.20543-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "xo" fixed_factor clock is a leftover/hack from a time when we
couldn't make rpmhcc the root of all clocks. It is going to be removed
once all users of this clock are converted to use clocks specified
through the DTS. Replace internal usage of the xo clock with the cxo
(RPM_SMD_BB_CLK1) parent, specifying xo_board as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 6b36024583b4..e16163706735 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -54,8 +54,8 @@ static struct clk_alpha_pll gpll0_early = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_early",
-			.parent_hws = (const struct clk_hw*[]){
-				&xo.hw,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo", .name = "xo_board",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -131,8 +131,8 @@ static struct clk_alpha_pll gpll4_early = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_early",
-			.parent_hws = (const struct clk_hw*[]){
-				&xo.hw,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo", .name = "xo_board",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -167,7 +167,7 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw }
 };
 
@@ -177,7 +177,7 @@ static const struct parent_map gcc_xo_sleep_clk_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_sleep_clk[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" }
 };
 
@@ -188,7 +188,7 @@ static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_gpll0_early_div[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_early_div.hw }
 };
@@ -200,7 +200,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw }
 };
@@ -212,7 +212,7 @@ static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_aud_ref_clk[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" }
 };
@@ -225,7 +225,7 @@ static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 	{ .hw = &gpll0_early_div.hw }
@@ -239,7 +239,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &gpll0_early_div.hw }
-- 
2.34.1

