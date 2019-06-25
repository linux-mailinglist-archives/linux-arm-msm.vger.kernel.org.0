Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1870255508
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbfFYQsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:48:39 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45359 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731299AbfFYQrs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so18639225wre.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9dd7VfnDPDvx2vEwLGJ7RznkwWv5Ux/A/r7vpBAXcyw=;
        b=OrnMtF5KkknOxMO4HEIDwyQjyl0zrLgZXm8uI7cIqAfyS/Gecd3mdZ/D75IgqhNZJq
         lmvRq75sAhzmxQYYqgA9bQfBYppESBBqFKNRLnye3S0WXREjvJzDwnpUKwl9y467wiRs
         IT9MYvXyvJDcZPbRJD41iEFLuGbwrDHGQVo5fgl8cYkXt9lN7bqCy+1C0CmjZqs1EMcB
         T+Iq/GhvHvRiH4oUsL3mgj472MsxWcUd1eeFqJxJ87QML294aLT95zD3hTsYv9cDzMLl
         rMLH7qyQEgaFPgpt149uJNlle24WbrWY0BEUOXWDvWh1DzRx7sAvFTf5HI5fBkVo2ZHb
         j56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dd7VfnDPDvx2vEwLGJ7RznkwWv5Ux/A/r7vpBAXcyw=;
        b=oLu354OeG06DvnHZ2GK37THscKOl/bpc2vY2dqkCCUmRexLnzm1NJmo4trWGTk7XBF
         xBVVZMLBLtbqLt6fTZZrz7eOnfXCCoQFbSvDhqZGfHCxPe5oaSdBth4Pr6laNxvIpwd2
         A19oY4SPfsjyztlNpWDN1D3lupHVgqI0r/YiH8h6v0V5LtPOJ9PrEoRu8KM7ylXslV1G
         MwfSci0zXnfHzDodnajUWYQgrtdpsK1k1dhRRZPADJfX0B2q05O6Xn/SEld5ivV/wjbF
         NWYTtG91hYhpzhDmCpOerVDGFa6I85ZCGlCWLs3P1whhHzQaJdG1S1A1nY/jTzjaCXK+
         MZ/A==
X-Gm-Message-State: APjAAAUh+7epzkrEmVRL/O2BmhLxbceHPPVSLCfhpsc0L0kl4fIzoI/v
        60KZjGLeh/Wb4z99a1l7hctJHw==
X-Google-Smtp-Source: APXvYqz8vAEXUQHGsG1vxPMKOB9yycSZAepMNHXYYIhf7Yy2fRj2IbkklOflF8y8vuYoPxhZyl0zmw==
X-Received: by 2002:adf:afe8:: with SMTP id y40mr34623139wrd.328.1561481266251;
        Tue, 25 Jun 2019 09:47:46 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:45 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 05/14] clk: qcom: apcs-msm8916: get parent clock names from DT
Date:   Tue, 25 Jun 2019 18:47:24 +0200
Message-Id: <20190625164733.11091-6-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow accessing the parent clock names required for the driver
operation by using the device tree node.

This permits extending the driver to other platforms without having to
modify its source code.

For backwards compatibility leave previous values as default.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/clk/qcom/apcs-msm8916.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index a6c89a310b18..dd82eb1e5202 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -19,7 +19,7 @@
 
 static const u32 gpll0_a53cc_map[] = { 4, 5 };
 
-static const char * const gpll0_a53cc[] = {
+static const char *gpll0_a53cc[] = {
 	"gpll0_vote",
 	"a53pll",
 };
@@ -50,6 +50,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct clk_init_data init = { };
 	int ret = -ENODEV;
+	const char *parents[2];
+	int pll_index = 0;
 
 	regmap = dev_get_regmap(parent, NULL);
 	if (!regmap) {
@@ -61,6 +63,16 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	if (!a53cc)
 		return -ENOMEM;
 
+	/* legacy bindings only defined the pll parent clock (index = 0) with no
+	 * name; when both of the parents are specified in the bindings, the
+	 * pll is the second one (index = 1).
+	 */
+	if (of_clk_parent_fill(parent->of_node, parents, 2) == 2) {
+		gpll0_a53cc[0] = parents[0];
+		gpll0_a53cc[1] = parents[1];
+		pll_index = 1;
+	}
+
 	init.name = "a53mux";
 	init.parent_names = gpll0_a53cc;
 	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
@@ -76,10 +88,11 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->src_shift = 8;
 	a53cc->parent_map = gpll0_a53cc_map;
 
-	a53cc->pclk = devm_clk_get(parent, NULL);
+	a53cc->pclk = of_clk_get(parent->of_node, pll_index);
 	if (IS_ERR(a53cc->pclk)) {
 		ret = PTR_ERR(a53cc->pclk);
-		dev_err(dev, "failed to get clk: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get clk: %d\n", ret);
 		return ret;
 	}
 
@@ -87,6 +100,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
 	if (ret) {
 		dev_err(dev, "failed to register clock notifier: %d\n", ret);
+		clk_put(a53cc->pclk);
 		return ret;
 	}
 
@@ -109,6 +123,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 
 err:
 	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
+	clk_put(a53cc->pclk);
+
 	return ret;
 }
 
@@ -117,6 +133,7 @@ static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
 	struct clk_regmap_mux_div *a53cc = platform_get_drvdata(pdev);
 
 	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
+	clk_put(a53cc->pclk);
 
 	return 0;
 }
-- 
2.21.0

