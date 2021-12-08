Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DD746DA81
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238369AbhLHR6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238329AbhLHR6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:13 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12820C0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:54:41 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id b19so3290234ljr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ydFkIDQp0/61G7WV+sq+7X4IUw+KFz2lvt23JeAU/r4=;
        b=aN+AmfSfDf4I72mGFFAnkBLxmZKT0x8PXuCIqeDwTjJvykU2qGoLGQegV5Ax4hV2V6
         nfBZ64D01c7U+AZnfiUzaCHfFir94WgzxA79jNDYNlJTEWNDAmxrz9zx0pyEQp+spvWR
         1hqq1bqiaSC3l2XjqAxqBtU0lkKSYJ6YZACXXGq8pUnzX8Jj9+B5sFzqrzY3PkjismxL
         5m0lH0Z5qT5ASn70umGZZzBhfTE720WjU1ob1Bc86uuE3fCDmDkCQOt5eKglLjLGNTgG
         Z8MJFP5Yn9IvCQD1QVPClADQHsZPrJmBUnQp8WT2Gkrio0TnoRHnQorsluBpar348Epq
         32SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ydFkIDQp0/61G7WV+sq+7X4IUw+KFz2lvt23JeAU/r4=;
        b=kxi28Pmwz5fHTf4nSbBoZpNKN2TNZS6ACT/RYlu3BaStlEbhejTKS8jCH/iPXDBAMb
         nu77fcOjGk9nTOwxNTzYrIErto8L5U+AKOfY18lJ1RKXdWVzlRkpaYLzK0lbcUiUXEKV
         Atw3tyHa8SCT075fsUVF/2vlA1oCt/r6mwBadIXNpPxtkVOejCU9vy5QBKRko94RqG3g
         X+tuHPDQ0YoHkvdIn8EzHh35Muc220BAFHaUGZv9iTmrPz1PF/B2OQKhI5+a5KQU6300
         kcMd555Yf01NBddzxr6zZ4ZGVcIcc0TuQuhmPnnicJHdl+YHtsYzpysyKPqnDtuHxUwL
         KW5g==
X-Gm-Message-State: AOAM530+y9+W2yAkp9LqcVQrT2c2dnaBcKQ8B1X5shUbjCG4jAeTn3oJ
        /xbWFLR7hBwAtuFGC7FVfZisUA==
X-Google-Smtp-Source: ABdhPJwVkhvUaIEpIkg3A12cCT1e//8vWELSLjITbTSXL/ZkgrAnQqEFu/Oa5M/oQpmzy+zLi3Z3cg==
X-Received: by 2002:a2e:a78c:: with SMTP id c12mr947847ljf.418.1638986079327;
        Wed, 08 Dec 2021 09:54:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 08/11] clk: qcom: gcc-msm8996: drop unsupported clock sources
Date:   Wed,  8 Dec 2021 20:54:27 +0300
Message-Id: <20211208175430.1333594-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
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
index 9b1674b28d45..3acefe16355c 100644
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
-		.num_parents = 7,
+		.parent_names = gcc_xo_gpll0_gpll0_early_div,
+		.num_parents = 3,
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
-		.num_parents = 6,
+		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
+		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

