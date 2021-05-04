Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6967537257B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 07:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhEDF35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 01:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhEDF35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 01:29:57 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1824BC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 22:29:03 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id e15so6276739pfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 22:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gIUTD/xcjRZwD9lqPa/K9njfq+3aHSwHrSeb5ACE0xU=;
        b=QIVCAcQd/JmeV2I5FJybb+PlBKZFa6WoZXs9qKR9SoOX0cOuvd70hAfpHS6zJnaQw+
         mpW9xcgkSFs4bvFVpT7ahwP+JULNBJNcPnsQIzYEjv+wz5Pd5I3lXunFyCrdxECtJ7Qh
         4IzsL/AIUfpW5xwzPyymI8DaRI9m2Fq1j3V+FhsB+WSjt7//BH+EdX5pRvgJVuDd5FEP
         tuGjtf0D62t1jmE6wtzJZiq6FnlZbEqBQGUXwBH2MUWAD1aJe52hFs4q9+ccEo003AV3
         mz5Gc/NfqSeb1ywBlFtHLpAOP//ILN3O0imX/qUtGIrve/RXMjrHpyEyuwbeK9qHB4pY
         tR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gIUTD/xcjRZwD9lqPa/K9njfq+3aHSwHrSeb5ACE0xU=;
        b=jpecp2inWNq7PlQeq6ZVxNgwLAGGlFKt6P/lFLeGMvUJ8CeJA5dLjJ4IZI0R1TLQQe
         rLisfyS0BfjBjnouj6xBWBzFTR6pHe0aJAxI6Bz/ou54uw5f3PFhk1XPjfnOwazmUG0u
         XRUpPuxanjugqw6HzxpVL2M+uIkNCsrcE1ZXS66VAh46wWvbNyIKv/FDpQE36OOLetOF
         bWJcpSWcocy/mLlJgzdS85usWsshX2d/8NNdR31qrIA6V+9PvnMt0Beol/jUXgAxb9xy
         HADc3kjPVux2dNBrfGUKvAszVSIXJLIIsrtnYkohmNcztMdaJShh2M8FNNZzeDOEa15K
         HVHg==
X-Gm-Message-State: AOAM533LHYrqXhwftX14eEvhdp2vegQ+qjH4DezK7y5/eICjmb4e2G0J
        cs/1OMT9WT/kxw67aQ/airuTWHjrQJFDzA==
X-Google-Smtp-Source: ABdhPJzZvHBUBCfAVvV9pWsMlraYAleSxgnTSS6GWTWe14yvWwccpwZ9dW0mGzGVRRFCKg/euHdO3g==
X-Received: by 2002:a65:5083:: with SMTP id r3mr21706072pgp.231.1620106142718;
        Mon, 03 May 2021 22:29:02 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:29:02 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/5] clk: qcom: apcs-msm8916: Retrieve clock name from DT
Date:   Tue,  4 May 2021 13:28:42 +0800
Message-Id: <20210504052844.21096-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unlike MSM8916 which has only one APCS clock, MSM8939 gets three for
Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache Coherent
Interconnect).  Instead of hard coding APCS (and A53PLL) clock name,
retrieve the name from DT, so that multiple APCS clocks can be
registered.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c      | 5 ++++-
 drivers/clk/qcom/apcs-msm8916.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 8614b0b0e82c..964f5ab7d02f 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -42,6 +42,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	struct clk_pll *pll;
 	void __iomem *base;
 	struct clk_init_data init = { };
+	const char *clk_name = NULL;
 	int ret;
 
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
@@ -66,7 +67,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	pll->status_bit = 16;
 	pll->freq_tbl = a53pll_freq;
 
-	init.name = "a53pll";
+	of_property_read_string(pdev->dev.of_node, "clock-output-names",
+				&clk_name);
+	init.name = clk_name ? clk_name : "a53pll";
 	init.parent_names = (const char *[]){ "xo" };
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index d7ac6d6b15b6..b8bbfe9622e1 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -49,6 +49,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct clk_regmap_mux_div *a53cc;
 	struct regmap *regmap;
 	struct clk_init_data init = { };
+	const char *clk_name = NULL;
 	int ret = -ENODEV;
 
 	regmap = dev_get_regmap(parent, NULL);
@@ -61,7 +62,9 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	if (!a53cc)
 		return -ENOMEM;
 
-	init.name = "a53mux";
+	of_property_read_string(parent->of_node, "clock-output-names",
+				&clk_name);
+	init.name = clk_name ? clk_name : "a53mux";
 	init.parent_data = pdata;
 	init.num_parents = ARRAY_SIZE(pdata);
 	init.ops = &clk_regmap_mux_div_ops;
-- 
2.17.1

