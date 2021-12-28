Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E105F48061F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbhL1Eyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbhL1Eya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:30 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F83CC061401
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:30 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id j11so37167332lfg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNVz3Zpl1X7wa/kdpskxTlVHJ/R/fTli7DFVie1xnyA=;
        b=jicw49f/KdcP0DnjvpyvnFadYL4C+hexHUHjvP4GG/njhPo7GJOKUioImIcmVQnTRX
         hhCf1MTKvzy+jaXMvyBo2eilR85KTRh+Ve2uBrRXRM6rudlN+689vEcEfBXYEpvJ3H31
         86/cMxHit+TKwO7aQLax6BG504BxRlrEQXdBzxcrlYmthgEM4tSzL/JGPZWauVoAxncC
         2ZQ4pmfHY8LWVVloX6PHDheGPAaLIWvW9vypB33tz/H2Uk0eXczIOUQrPxZjLB69t10V
         wSALWbZS8gt90UNKuvrdoFqNf2aZ/sJ8YTOiPlq/aKJRM/CLYBsrxlqd+/U9BFF96BsK
         y4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNVz3Zpl1X7wa/kdpskxTlVHJ/R/fTli7DFVie1xnyA=;
        b=F0xd9coQe17JUT9/BWZfT0kEI+Wkly4iA/w51ANxRLugmGu423PQKJTx9rnEXUdW36
         JLVcZzLrEb7MmqxbWUInyRZzP6WueiM7xY98y7HWmQAXFRemjbwtmHCAsUaW7tk9D3X9
         ZKd4o79ezQhdTWarYY0/NwhdwxjjCZ6M6PxFyA0NCLqZg31T95Dwi4P9WsRZ5RmYsIbG
         JvoNl/ujA9Kdew+x3c9r1gWDoK9wLEV62e0wCbOB8TmivbeT+FxzfiuoLTtEmnu7IBZH
         0OqArbCgrsvHWQvvJXtNqSWPwSv/Iv43FCrRDVYdGonkz3XUNex2pwzaN+FqbNeIXyj2
         BhEg==
X-Gm-Message-State: AOAM530IcelOUrZhrabnCwm7US7eqIKLlF8nm3J2UIykRoRE4THU/TcN
        SqjmYQklOwq9Yrk7POa86aJmoE/xKG6nPIh2
X-Google-Smtp-Source: ABdhPJwd0hkVFWms+zhSyndJOIMCvZstSd0EObSimf72KIfMny9WaO7vuR+aIAhCrJMZAlyAa49MWw==
X-Received: by 2002:a05:6512:104d:: with SMTP id c13mr16722088lfb.375.1640667268558;
        Mon, 27 Dec 2021 20:54:28 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 13/16] clk: qcom: gcc-msm8996: drop unsupported clock sources
Date:   Tue, 28 Dec 2021 07:54:12 +0300
Message-Id: <20211228045415.20543-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
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
2.34.1

