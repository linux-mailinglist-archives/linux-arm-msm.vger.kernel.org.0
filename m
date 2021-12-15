Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D84474FB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238701AbhLOAzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238681AbhLOAzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:55:12 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C390C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:12 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m27so39964846lfj.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qa27NrPkC4XYPRJlOgAmiVjkcn5Tn7vogR8Rx7d0464=;
        b=fiZkltQUlBYpiBaqeDFvE9Uv1fzUk5hUdecguv0GyCHxGQ1NRBcVNLsfqnZvlDUL7g
         bgfpMm2jdoVf85YtwbVvR2y2jtF/0AqA5LzvUzDOSIonYNMB/F2fTRMVhWQyfEwSkWsE
         /0hN8JTs9vtlgfYFCYRLVQGcdBfAsTCqBJkKQkaqDHXEvBp/t8tRz7iIuqGM+oBFrOwf
         rok+Ksu5JacUMCtBfD6cVWuiGyK7wxPS545KOYNrbL39TjPCCuv+n2bHMe3ICqVXVh5h
         LcwF6tNLc85pPCHee0PWxN9LPl+I4HPMME85TcKGVtxJrfu4eZeREM5+8pSg91foS0mt
         L/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qa27NrPkC4XYPRJlOgAmiVjkcn5Tn7vogR8Rx7d0464=;
        b=Olm5A6gXURmijagj5f9+OyWQVUXFiz7X21aamENBs9egHIXlCA/PTZ2B2ovHeJpxTi
         tzNg5BAC0fqkA+FAkcIltzWf1Qy56mrF/pKVJytWDipD2aHdWgipkZfrHKMedWyZUaQJ
         PFKBvlRolI7/RFEMeZP5+rNJq9uQZJbdKk7QqZ7ExFhO54Ga2v4v5XxIlztyC6XY2LRu
         myEGfwJpj+cS+GLyC2FGZPa5ySCy1vcamPhkq9d7ll5btQOFf96jFw0FWh+pbXhX4wmq
         zT/664w458wVwOz2bogo/ckrjmNKGCWucobI7CO3dVb0ewH+eHNcw3hjR1jwADKmxLja
         mUbQ==
X-Gm-Message-State: AOAM530r2bwPo9q4cut/++L8zCEPkwnvLYD1PGl1zkmCI6v/oWuJPOVD
        bHlhCYtH1cfh6tpGcm3Y2+ZXPg==
X-Google-Smtp-Source: ABdhPJxZnbYSpOJURksJDOk3HBdYpJexhZRvxpZWiVowyrrrhEN2l6mP8QJ3f4TBGBSI0Jx+PRUSSA==
X-Received: by 2002:a19:8c48:: with SMTP id i8mr7467490lfj.179.1639529710225;
        Tue, 14 Dec 2021 16:55:10 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:55:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 14/15] clk: qcom: gcc-msm8996: move clock parent tables down
Date:   Wed, 15 Dec 2021 03:54:22 +0300
Message-Id: <20211215005423.2114261-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move clock parent tables down, after the GPLL declrataions, so that we
can use gpll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 184 ++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 4c85b3935a81..8531f2f3665f 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -33,98 +33,6 @@ enum {
 	P_AUD_REF_CLK,
 };
 
-static const struct parent_map gcc_sleep_clk_map[] = {
-	{ P_SLEEP_CLK, 5 }
-};
-
-static const char * const gcc_sleep_clk[] = {
-	"sleep_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 }
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0"
-};
-
-static const struct parent_map gcc_xo_sleep_clk_map[] = {
-	{ P_XO, 0 },
-	{ P_SLEEP_CLK, 5 }
-};
-
-static const char * const gcc_xo_sleep_clk[] = {
-	"xo",
-	"sleep_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0",
-	"gpll4"
-};
-
-static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_AUD_REF_CLK, 2 }
-};
-
-static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
-	"xo",
-	"gpll0",
-	"aud_ref_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_SLEEP_CLK, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"sleep_clk",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll4",
-	"gpll0_early_div"
-};
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
@@ -229,6 +137,98 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	},
 };
 
+static const struct parent_map gcc_sleep_clk_map[] = {
+	{ P_SLEEP_CLK, 5 }
+};
+
+static const char * const gcc_sleep_clk[] = {
+	"sleep_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 }
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0"
+};
+
+static const struct parent_map gcc_xo_sleep_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_SLEEP_CLK, 5 }
+};
+
+static const char * const gcc_xo_sleep_clk[] = {
+	"xo",
+	"sleep_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"gpll0_early_div"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0",
+	"gpll4"
+};
+
+static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_AUD_REF_CLK, 2 }
+};
+
+static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
+	"xo",
+	"gpll0",
+	"aud_ref_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"sleep_clk",
+	"gpll0_early_div"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"gpll4",
+	"gpll0_early_div"
+};
+
 static const struct freq_tbl ftbl_system_noc_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
-- 
2.33.0

