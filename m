Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96EE335B83
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 13:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfFELnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 07:43:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38627 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbfFELnN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 07:43:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id t5so1935065wmh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=Jp/JdV2yn/wqzzWfOfRwb4FDVYCujOYkpzb+HCTUS8NJcsoL4RrGPGuKPM8+By8ldP
         jPZZn5cDvQZM4hPjpBYEHrh/IeOX0Z7r4dvWciU3vsimgp8YD0BNAI+Gw25gu1z4Gz8Y
         D3ui/SE5BXLU3wep3K6tbv585rzPvuk4KGIyNY5pTZ73EYHFKqL0ETq7VHveP0ik1XbP
         vRjdeVso0R3Qf3fg30cUV1JGbZ9rPnx5URfNBjQnyBqMB1vL7SrpnuPWfhxvEodve6a9
         nxKo++m195buCgkzC5hyYHqa6Y2fqKDvoQRgatziZq1/c9ycvazbtDPQschW4lFDaiTC
         3eXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=m+mwyNd09zg2xO26B3ECkFgdQF685eRY8kvwO7J+ZXju/3b/OsmuDeIhAvkPvXLeh3
         TCGqsbYGQlMhY0Y3xt4ay7HvY0oFGetYnrPTdtOBS5Lf2MVYvXOcRYNXPcRynqFtmCm3
         JVVSmq0IjiF9ZYRbpy7jqfKOwTt0jf6mBMbhrlZvVPGC0lNMLj70ukgG9kv94n2A/vaQ
         9vGBix0H2U00ysYSkQLF8CHViaA+EbDiG9v4GtREDlZUjfQUWX3EqspMhImv8/bhgohr
         5DAniWx48kWp3ra7FLJ0l2N/3kVqF//WaydplmioEhcYhPc8mZqCCFyskKMPAg13KFos
         oQxA==
X-Gm-Message-State: APjAAAXxh2t6UqR6hu5RGLbxjakoaSDsOmbYRZqt6eGzbXtGFtrYaSvC
        3tkmrS01Y4/UOPov5EDRp5/llA==
X-Google-Smtp-Source: APXvYqyl2gwOWbUGVEnYEh9X8OzB/jrJfkYNgjV/h4onDE5kOB10EdAyUcgxHPRB9QKTfy4UfkQugg==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr1175742wmh.24.1559734991651;
        Wed, 05 Jun 2019 04:43:11 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 34sm27718740wre.32.2019.06.05.04.43.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:43:11 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 5/8] soc: qcom: geni: Add support for ACPI
Date:   Wed,  5 Jun 2019 12:42:59 +0100
Message-Id: <20190605114302.22509-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605114302.22509-1-lee.jones@linaro.org>
References: <20190605114302.22509-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting with ACPI as the active set of configuration tables,
all; clocks, regulators, pin functions ect are expected to be at
their ideal values/levels/rates, thus the associated frameworks
are unavailable.  Ensure calls to these APIs are shielded when
ACPI is enabled.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 6b8ef01472e9..cff0a413e59a 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
@@ -450,6 +451,9 @@ int geni_se_resources_off(struct geni_se *se)
 {
 	int ret;
 
+	if (ACPI_HANDLE(se->dev))
+		return 0;
+
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;
@@ -487,6 +491,9 @@ int geni_se_resources_on(struct geni_se *se)
 {
 	int ret;
 
+	if (ACPI_HANDLE(se->dev))
+		return 0;
+
 	ret = geni_se_clks_on(se);
 	if (ret)
 		return ret;
@@ -724,12 +731,14 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
-	wrapper->ahb_clks[0].id = "m-ahb";
-	wrapper->ahb_clks[1].id = "s-ahb";
-	ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
-	if (ret) {
-		dev_err(dev, "Err getting AHB clks %d\n", ret);
-		return ret;
+	if (!ACPI_HANDLE(&pdev->dev)) {
+		wrapper->ahb_clks[0].id = "m-ahb";
+		wrapper->ahb_clks[1].id = "s-ahb";
+		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
+		if (ret) {
+			dev_err(dev, "Err getting AHB clks %d\n", ret);
+			return ret;
+		}
 	}
 
 	dev_set_drvdata(dev, wrapper);
-- 
2.17.1

