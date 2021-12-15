Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9FE4761F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhLOThe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOThb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:31 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B48C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:31 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id v15so35009113ljc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qa27NrPkC4XYPRJlOgAmiVjkcn5Tn7vogR8Rx7d0464=;
        b=EAHkCa/+tYW9bLjNsxJKXgUMteeVN0GO0ZqgvbcMe142YH9+DaFEugTlszhCn7WZ1q
         t+TT13ewl7lszLqGMXBQqrqvq1YGUC/JWfyv6Wx4LP14o0Ztek7okZSWarG7mRpSD517
         nRA6LlbufsH623Jp15kmSouaWQFUYRZPK22uqir5woyi9v7Es/NnLK4u0FSjFHW/zUaM
         fDTzyM40/scN6T6tNWmbTOYCv2IVRdNVZsn/hl34uViLwowP1GncV7vczXcBBz/OXaP3
         HA9HFrqm2B8dZEs8watvKZA/UNZTHO5OKLRaOKjBabFw4A+FLKskf+sVjH+3SRNAAbfu
         klig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qa27NrPkC4XYPRJlOgAmiVjkcn5Tn7vogR8Rx7d0464=;
        b=NPB9U1Pv+mHy5v4TDmL5rcp4tFzeQ9JP5hINGlftMqn1HwUoKJw8/K1baihyqxoTOy
         w192/vZE5OSm6n0iFs2VxTdrrIQj8k6pdf1UMvRrMbynCB29xxhXiHv7aVfAFIrREt2+
         DRec0JXcbOsVAqplL9q+UVa5+CeFO9aBfLepxOhdYLS8tGBogKw+8pIfEHCBST/SeWSR
         dfm3kW4YKCipS0zk/RCqRvnBP2BJuOeqS3O6WSJBYI80pnnzwp2sfN1cQRCw955GxgTQ
         3785ImH6wi5e+lB3UfT3Iz5a4eizfcqmGzmKrEe7SAY0psoP59z+uUfYG1vgccEa+fos
         u4dg==
X-Gm-Message-State: AOAM530LvEITkSrKQgQb7rt2Htw3SJzfs9Og1z4U5yVniNulbvynrk0i
        3moUJLP9+ToMPkspgd00WfC/7OvaWifqnTlQ
X-Google-Smtp-Source: ABdhPJzpbW2NIPCBt/REUPgndBL9V57V2gXUCq6PJy5TIo5L3jNm88enSl5Dikh1PVER9PF35koYNw==
X-Received: by 2002:a2e:864a:: with SMTP id i10mr11878514ljj.395.1639597049649;
        Wed, 15 Dec 2021 11:37:29 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 14/16] clk: qcom: gcc-msm8996: move clock parent tables down
Date:   Wed, 15 Dec 2021 22:37:02 +0300
Message-Id: <20211215193704.2821775-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
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

