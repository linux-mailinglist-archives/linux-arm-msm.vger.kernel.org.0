Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A6E3BAAF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 04:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhGDCnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jul 2021 22:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhGDCna (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jul 2021 22:43:30 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9267EC061765
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jul 2021 19:40:55 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id y2so153413pff.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jul 2021 19:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d8JSTZ8+AJaTgMTmOHganaZdhQwLLSMBu10AnlPFiu8=;
        b=PnY/ZDSCQHF9HQBdG9c1eAxBf+DvgnK/Fp3L2oNhBpUlIXGXseKmWkKH0t83FxzfVe
         6ySklp1/zytHkgSkwaFl+PtOvzK/zeYaE8DzjHDdUO/KrLZ9it8CaaTNZO2zlfWNZWy+
         FMHC6JMpOOTIJ937i3DJBh/BHNj53v3u5zIoZE5FUNJXVLB9EWjrDMB/xX1djQqgfRtu
         c5gRdUHkyGOl4wRVekD2GYVZtFN96P8u0tIIDKs9Q8AuHAYaJSEOq25vKcrh9L4XN5I+
         lebw/BuVFLpsGTt6mdDce1WSNKnJ181mNdFOB92XdxjLet+OptG0oPA8K9c5pKZldc4h
         W62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d8JSTZ8+AJaTgMTmOHganaZdhQwLLSMBu10AnlPFiu8=;
        b=ZHJJepFVLHYdqjf8WAESSxmrYy4UeNWV4hci3tpYILQKF+hXDDu7JSmLOD3CxG4g1k
         cyYgzClFBcq6hETKsKPjkgs0DkY8DaL1yJ1BofMYvFYJONLISGKNy/I3qGmoOM4QEYQR
         ZbsozVCXU8MkMTV7jkxhbOrfpC2g6nEgOFDNan/jIxvfNCwFtEKVM/N/UmS+UBWdfLQx
         MhwO8m1czaMX7QY1sbfqqnm9859INPR3LilgBOPN4v9I2wvTfUbNGPHs/ajfNN9AkP8B
         Vc28yP1n86fOTXNlVEWhMAyPWEFQtgVjmpTveAFeK+kJiFrS7YOpUucG8VRl0pkr0x2f
         6rcg==
X-Gm-Message-State: AOAM533lR8nWdfOOPhjGgrzs+aoRtYLz6WbgLwdLsVuvzCBxgBUhzu12
        OAQrCuHGPiV6w23djSn8NC8GtA==
X-Google-Smtp-Source: ABdhPJw30azYjSjAVyKtrYg9dwjnrZwUuxSrQwuNQdK1ZESMOLH4te0aJZ/9Jy4bxaJUh4+WFSHMUw==
X-Received: by 2002:a63:de45:: with SMTP id y5mr1273481pgi.261.1625366454995;
        Sat, 03 Jul 2021 19:40:54 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g17sm9394624pgh.61.2021.07.03.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 19:40:54 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 4/4] clk: qcom: a53-pll: Add MSM8939 a53pll support
Date:   Sun,  4 Jul 2021 10:40:32 +0800
Message-Id: <20210704024032.11559-5-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210704024032.11559-1-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8939 has 3 a53pll clocks with different frequency table for Cluster0,
Cluster1 and CCI.  It adds function qcom_a53pll_get_freq_tbl() to create
pll_freq_tbl from OPP, so that those a53pll frequencies can be defined
in DT with operating-points-v2 bindings rather than being coded in the
driver.  In this case, one compatible rather than three would be needed
for these 3 a53pll clocks.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c | 59 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 96a118be912d..9e6decb9c26f 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -6,9 +6,11 @@
  * Author: Georgi Djakov <georgi.djakov@linaro.org>
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/regmap.h>
 #include <linux/module.h>
 
@@ -34,6 +36,55 @@ static const struct regmap_config a53pll_regmap_config = {
 	.fast_io		= true,
 };
 
+static struct pll_freq_tbl *qcom_a53pll_get_freq_tbl(struct device *dev)
+{
+	struct pll_freq_tbl *freq_tbl;
+	unsigned long xo_freq;
+	unsigned long freq;
+	struct clk *xo_clk;
+	int count;
+	int ret;
+	int i;
+
+	xo_clk = devm_clk_get(dev, "xo");
+	if (IS_ERR(xo_clk))
+		return NULL;
+
+	xo_freq = clk_get_rate(xo_clk);
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return NULL;
+
+	count = dev_pm_opp_get_opp_count(dev);
+	if (count <= 0)
+		return NULL;
+
+	freq_tbl = devm_kcalloc(dev, count + 1, sizeof(*freq_tbl), GFP_KERNEL);
+	if (!freq_tbl)
+		return NULL;
+
+	for (i = 0, freq = 0; i < count; i++, freq++) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
+		if (IS_ERR(opp))
+			return NULL;
+
+		/* Skip the freq that is not divisible */
+		if (freq % xo_freq)
+			continue;
+
+		freq_tbl[i].freq = freq;
+		freq_tbl[i].l = freq / xo_freq;
+		freq_tbl[i].n = 1;
+
+		dev_pm_opp_put(opp);
+	}
+
+	return freq_tbl;
+}
+
 static int qcom_a53pll_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -65,7 +116,12 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	pll->mode_reg = 0x00;
 	pll->status_reg = 0x1c;
 	pll->status_bit = 16;
-	pll->freq_tbl = a53pll_freq;
+
+	pll->freq_tbl = qcom_a53pll_get_freq_tbl(dev);
+	if (!pll->freq_tbl) {
+		/* Fall on a53pll_freq if no freq_tbl is found from OPP */
+		pll->freq_tbl = a53pll_freq;
+	}
 
 	/* Use an unique name by appending @unit-address */
 	init.name = devm_kasprintf(dev, GFP_KERNEL, "a53pll%s",
@@ -96,6 +152,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_a53pll_match_table[] = {
 	{ .compatible = "qcom,msm8916-a53pll" },
+	{ .compatible = "qcom,msm8939-a53pll" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_a53pll_match_table);
-- 
2.17.1

