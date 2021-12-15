Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C97E474FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238698AbhLOAzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238680AbhLOAzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:55:06 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3ED9C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:05 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id k2so30871965lji.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrdzZyWE4Zdq5K5t6qtNKYKS+VZ74sSTiXcnXi01NUg=;
        b=m02QDjlR5gaHdijmLSficaWxGLmU06zTXTPWniEYMWf4lCQWWjtKg0wmk8clHKlofo
         FRBhCUXy01bCWWKTWm/m9CCkDwDG+WUw6mu+nBSZ56hAkninR8OzvyV9qsggm7ooieCJ
         AQ1OYAajEcqCvHnhBKtzbfnXG+zsFGiTvGPpSgbHT+pHoOKKveNbdusaZZ2PxeF6mbN3
         zu2JNVgK4SeHH5h28pLpf6CvDQHV683Lbq07u1mTXGJpAUw3vFUMcQPjmETyLQICarZA
         xlBqn7haOvWGCICgTyjqmKaDcaffU0tsg0JqmI3hWk+XvsXdR/Y+q9aCCExq1O7OdF07
         1T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrdzZyWE4Zdq5K5t6qtNKYKS+VZ74sSTiXcnXi01NUg=;
        b=SnX7JEhk/rdgbLME1zFz7y8JOjeh42OOoUI25brQcSFbhaYPxTav8e4ZVwfib3K/2/
         yUXSqzPAmPxpxY69ilQreLYQU9pq3hgBhAvF8LnB79dXv+YM7C8q6G3bkGNS/DuCxtOT
         /lX4jW91zuKnLVs76OXGVZNqh3AK6vLbQGR8c4+wv/19EMKsK/4By7cGVVfn91xP6Ofd
         Swn+jQzDLoUWcub8Itm7/GZtxwWwIDmu40FXXesghGdtusMa15TC3O35eSTNWMY8cUpP
         kYCW+wizFNYWjRVvzvf+mROEmvbxL9QZg6HdacL4SJdUUXsSA6Yzxsi14WflipxhZ2JD
         PkOw==
X-Gm-Message-State: AOAM533pG9ZBtLL+WzQY8u0mJoi1aXU43Q0cwHEscJ8Zb2R6FB1HJmk7
        pvtFA+mNcryJnrp505pVMu1qSg==
X-Google-Smtp-Source: ABdhPJyIakl/SlFyZHztysoAe1E23yhSBciGQttYPpDseCSVOsOgZAA0R/k3CBKC5ZHgTyXp7EE4nQ==
X-Received: by 2002:a2e:7319:: with SMTP id o25mr7903583ljc.320.1639529704010;
        Tue, 14 Dec 2021 16:55:04 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:55:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 13/15] clk: qcom: gcc-msm8996: drop unsupported clock sources
Date:   Wed, 15 Dec 2021 03:54:21 +0300
Message-Id: <20211215005423.2114261-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation of updating the msm8996 gcc driver, drop all unsupported
GPLL sources (gpll1/gpll1_early_div, gpll2/gpll2_early and gpll3).
Downstream kernel also does not provide support for these GPLL sources,
so it is safe to drop them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 55 ++++------------------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index d95814025c65..4c85b3935a81 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -27,15 +27,10 @@
 enum {
 	P_XO,
 	P_GPLL0,
-	P_GPLL2,
-	P_GPLL3,
-	P_GPLL1,
-	P_GPLL2_EARLY,
 	P_GPLL0_EARLY_DIV,
 	P_SLEEP_CLK,
 	P_GPLL4,
 	P_AUD_REF_CLK,
-	P_GPLL1_EARLY_DIV
 };
 
 static const struct parent_map gcc_sleep_clk_map[] = {
@@ -130,44 +125,6 @@ static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
 	"gpll0_early_div"
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL1_EARLY_DIV, 3 },
-	{ P_GPLL1, 4 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll1_early_div",
-	"gpll1",
-	"gpll4",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL2, 2 },
-	{ P_GPLL3, 3 },
-	{ P_GPLL1, 4 },
-	{ P_GPLL2_EARLY, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll2",
-	"gpll3",
-	"gpll1",
-	"gpll2_early",
-	"gpll0_early_div"
-};
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
@@ -285,12 +242,12 @@ static const struct freq_tbl ftbl_system_noc_clk_src[] = {
 static struct clk_rcg2 system_noc_clk_src = {
 	.cmd_rcgr = 0x0401c,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div_map,
+	.parent_map = gcc_xo_gpll0_gpll0_early_div_map,
 	.freq_tbl = ftbl_system_noc_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div),
+		.parent_names = gcc_xo_gpll0_gpll0_early_div,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1257,12 +1214,12 @@ static const struct freq_tbl ftbl_qspi_ser_clk_src[] = {
 static struct clk_rcg2 qspi_ser_clk_src = {
 	.cmd_rcgr = 0x8b00c,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map,
+	.parent_map = gcc_xo_gpll0_gpll4_gpll0_early_div_map,
 	.freq_tbl = ftbl_qspi_ser_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "qspi_ser_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div),
+		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

