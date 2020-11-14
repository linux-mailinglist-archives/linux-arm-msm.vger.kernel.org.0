Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BE92B2F2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 18:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKNRoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 12:44:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:39802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgKNRoK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 12:44:10 -0500
Received: from mail.kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D9272222C;
        Sat, 14 Nov 2020 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605375849;
        bh=UTKc5AmDz2O8mWHUg53Nzuej7AFXGlvaUvHgaxeLrRE=;
        h=From:To:Cc:Subject:Date:From;
        b=EdlGltP56R90EiGnFfJizvt72PDW2Dn6Vsy7JJWU+DsXKnEFztALwNOjnFSmvkayG
         U+l/Xbu175YkOKNXvPXlXjO8qJMihYq+KwRYacZ2KVLcbp8lmZAIAV4MFgVjhBBx+Z
         gO2mrBGK5/FtoxtI0CrBSkCCY39p0D9aWeTUQEEk=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Taniya Das <tdas@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH] clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk ones
Date:   Sat, 14 Nov 2020 09:44:08 -0800
Message-Id: <20201114174408.579047-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's call pm_runtime_get() here instead of calling the PM clk APIs
directly. This avoids a compilation problem on CONFIG_PM=n where the
pm_clk_runtime_{resume,suspend}() functions don't exist and covers the
intent, i.e. enable the clks for this device so we can program PLL
settings.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Taniya Das <tdas@codeaurora.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller driver for SC7180")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/camcc-sc7180.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index f51bf5b6decc..dbac5651ab85 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -1669,16 +1669,14 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
 		goto disable_pm_runtime;
 	}
 
-	ret = pm_clk_runtime_resume(&pdev->dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "pm runtime resume failed\n");
+	ret = pm_runtime_get(&pdev->dev);
+	if (ret)
 		goto destroy_pm_clk;
-	}
 
 	regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
 	if (IS_ERR(regmap)) {
 		ret = PTR_ERR(regmap);
-		pm_clk_runtime_suspend(&pdev->dev);
+		pm_runtime_put(&pdev->dev);
 		goto destroy_pm_clk;
 	}
 
@@ -1688,9 +1686,7 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
 	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 
 	ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
-
-	pm_clk_runtime_suspend(&pdev->dev);
-
+	pm_runtime_put(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
 		goto destroy_pm_clk;
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/

