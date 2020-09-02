Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7E425AE3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 17:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgIBPEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 11:04:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbgIBPEV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 11:04:21 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2363214D8;
        Wed,  2 Sep 2020 15:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599059060;
        bh=qZbRz7vHhRuDtj+mxfFu/caG8U7KILHwDenzvK1SHbY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eNX+dwL77fegbOMgYPi65jD3MevMqzWzD66pOUe/teuPLLkkOp08Y+AaJ6dIaUNbb
         A6BjfJR8rh/kbmfihtaKPRZD7lSCBlCAv5SE4qDDhGMafSCk4QaprlcY1G26otG/FM
         nPeBT9UTfjguJrQ6TNr1TE92NHwXQJFlXazVBBUA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 05/10] clk: sunxi-ng: Simplify with dev_err_probe()
Date:   Wed,  2 Sep 2020 17:03:43 +0200
Message-Id: <20200902150348.14465-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902150348.14465-1-krzk@kernel.org>
References: <20200902150348.14465-1-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c     | 28 ++++++++----------------
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c  | 19 +++++-----------
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c |  9 +++-----
 3 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 524f33275bc7..0de024d3e466 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -297,29 +297,19 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 
 	bus_clk = devm_clk_get(&pdev->dev, "bus");
-	if (IS_ERR(bus_clk)) {
-		ret = PTR_ERR(bus_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(bus_clk),
+				     "Couldn't get bus clk\n");
 
 	mod_clk = devm_clk_get(&pdev->dev, "mod");
-	if (IS_ERR(mod_clk)) {
-		ret = PTR_ERR(mod_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Couldn't get mod clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(mod_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(mod_clk),
+				     "Couldn't get mod clk\n");
 
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(rstc)) {
-		ret = PTR_ERR(rstc);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Couldn't get reset control: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
+				     "Couldn't get reset control\n");
 
 	/* The clocks need to be enabled for us to access the registers */
 	ret = clk_prepare_enable(bus_clk);
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
index 6616e8114f62..541c3d32b93e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
@@ -215,21 +215,14 @@ static int sun9i_a80_de_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 
 	bus_clk = devm_clk_get(&pdev->dev, "bus");
-	if (IS_ERR(bus_clk)) {
-		ret = PTR_ERR(bus_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(bus_clk),
+				     "Couldn't get bus clk\n");
 
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(rstc)) {
-		ret = PTR_ERR(rstc);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Couldn't get reset control: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
+				     "Couldn't get reset control\n");
 
 	/* The bus clock needs to be enabled for us to access the registers */
 	ret = clk_prepare_enable(bus_clk);
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
index 4b4a507d04ed..f6a3989fea36 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
@@ -103,12 +103,9 @@ static int sun9i_a80_usb_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 
 	bus_clk = devm_clk_get(&pdev->dev, "bus");
-	if (IS_ERR(bus_clk)) {
-		ret = PTR_ERR(bus_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(bus_clk),
+				     "Couldn't get bus clk\n");
 
 	/* The bus clock needs to be enabled for us to access the registers */
 	ret = clk_prepare_enable(bus_clk);
-- 
2.17.1

