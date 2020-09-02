Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71FC25AF2F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 17:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgIBPEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 11:04:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:41758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726927AbgIBPEZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 11:04:25 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9506721527;
        Wed,  2 Sep 2020 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599059065;
        bh=UZsEqgnFpRCIfv/X8lhKedsjXG7tPysKFsM4O+5c1og=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pFq+pQYc6BCe2NtK7+Ig4Fdw+9S38KkYFXn8TIkEETbiabdtq0tgVHZ/k9Pw74Cqx
         PCf4+yC0vOzAjjqQrsEfJLtXDD9AgYzuRNQPSlXc2O+fJyET6GDcxzxobEXRbpeY3Y
         5jVIIsyW/+qgVU+p/Ns2ZuirTc5iI7Zhou59OcVo=
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
Subject: [PATCH 06/10] clk: keystone: Simplify with dev_err_probe()
Date:   Wed,  2 Sep 2020 17:03:44 +0200
Message-Id: <20200902150348.14465-6-krzk@kernel.org>
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
 drivers/clk/keystone/syscon-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index 5b3d36462174..12ddcbed00e4 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -102,12 +102,9 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	regmap = syscon_node_to_regmap(dev->of_node);
-	if (IS_ERR(regmap)) {
-		if (PTR_ERR(regmap) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_err(dev, "failed to find parent regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to find parent regmap\n");
 
 	num_clks = 0;
 	for (p = data; p->name; p++)
-- 
2.17.1

