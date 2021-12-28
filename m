Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBB1480622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbhL1Eyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbhL1Eyb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:31 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DF1C06173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:30 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bu9so38952533lfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZlCo7jdDZ5mFY57HXGUE2eeHXilVOriVsg//qaGNV4w=;
        b=T330XaJoyqjREFkayp1WmvbzinqsWl3ds5eyodr9nho++sWuH1kynEqRXosOPEuIb+
         9bVqny+XzdkzwY10L0pASB0HtylwEYvdLaELzQH0gzjPv0MCYb6wbvfA2lqnTTrjYzH9
         8jfO7AN07UNaG6Bep2AR83F8IBR2yHMFLYeI48K6xdr5N8DhxiIFj8jF4KhsGKtGi5fh
         uneTgX8SXfGP33xmdHZn6aWSpjT/TXP3SWANWYZGG3iOXt2VNElLXCuxLEL8BWDcakPA
         PoSMBuhb4HHItw5KzspGJjNnAfYpyZbz64IC8ce+2mNmJS/oSYSu7I+VxRyUSLYaqfpi
         Rrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZlCo7jdDZ5mFY57HXGUE2eeHXilVOriVsg//qaGNV4w=;
        b=lyzp9+izQpEs2QD9SVi8XoeJLkir8TWx8cpfPdWMG1dEGyOQG2w6LQaOOIiARrkeyH
         FM/9EnVDPNbroWNAf3rnj/q6X60OB3agMdpCBze+y6UBY/p4ZK55SYlY7ENsxoThyQZE
         VEYpjiO0Na6iBvGKaHpHCkNpByzufzgp7FeM9JdD1dqFQ2p4mzs35m72qd6g+hIiDhWz
         9pvah8K2jCC0+GBZ6mJFjnX6SgHGp1Vuu5gfity+UVcQ9GlFKZvYPDHdFBERzf0mcPEc
         7euQ9eQ4mfM8NsT4Gi2vPyJPd0YlIYGGkEeW6WP28LFchgMn954HOmVzlDBYV4zQy9yI
         w52w==
X-Gm-Message-State: AOAM530Ke4hLYuZ7OBF3ksWmSzM1o5TtfzTBIBKYlAVvToiuUnK0mnpA
        SIp2wTMXP5JNHNF8JDoRqO589w==
X-Google-Smtp-Source: ABdhPJwRV7C17vy7K3V2IfQqW4DWzw9wouKmOy7IFBlsEO2BpfEAzcJ1RWuwlQoC479TqC4YkJAiDQ==
X-Received: by 2002:a05:6512:108f:: with SMTP id j15mr17871361lfg.340.1640667269297;
        Mon, 27 Dec 2021 20:54:29 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 14/16] clk: qcom: gcc-msm8996: move clock parent tables down
Date:   Tue, 28 Dec 2021 07:54:13 +0300
Message-Id: <20211228045415.20543-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
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
2.34.1

