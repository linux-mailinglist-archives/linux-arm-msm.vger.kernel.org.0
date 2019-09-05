Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F78AA8D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 18:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfIEQVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 12:21:41 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45997 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfIEQVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 12:21:41 -0400
Received: by mail-wr1-f65.google.com with SMTP id l16so3461849wrv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 09:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9iLVBaa77JA8FyvG+ioZMPXcw60MqtuvgoQBEbIVQs=;
        b=IiMddi9XvQ+WhSZ/tO/2VdQVWHIifwCGUsJHL8xdl+HVbJw73QtadzdFxVoc7b8lCt
         LfpjaOnqC/L+IcJ/9IYr9kUTYkluemZQtJWpEoN3DIs4YDXXShm1Ugmyxok55XqovOJM
         IHqSdYIMkcB/X2NcnFtomsciSyvLxMQLI1zs9XTp7OnCecrOezcZHl3w7XaNEA7v0hGU
         HmlhGS+QkdpfWDYKJD2blpohVRa7Y0r+964nsxfNGlzvFvszzjkSAyRaE8UJrsMoC3uP
         XXYkRFe+njHAhSI7FKiWqFybTT9CJRsbmfhrryUXS/EieDGxrghx8pHrlaC1rWnn8SVr
         q3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9iLVBaa77JA8FyvG+ioZMPXcw60MqtuvgoQBEbIVQs=;
        b=siiQ8S6rneX9hsUHo1af6l2TAKhGdNS2T0rBEiMYMVxRrglNjg6hrPhDc140hu/OXj
         kEvqdIadulO2RXplIa8Jv7q/8m4FJP8/woG5gJF+8vh2AyEYhy914C59gCReQA17hnxW
         GQzc/CT4pu/4Xb7upWjbXuXRkhIXVjKOFCkyC2c9fsSOI272PaGR5aYoRF0hRm8RgCf0
         JXzBVgCn1CuFO/+0iyof/PqtQkkeFBX1mGcgVA/h4OdfUOHFDIShSkf1W1lmAMOKImZN
         QxCl2C4t+uKHsANnO1JELrc0LQtLp72jHY3wr2ORKN4U7j5gfCavOFZN/Y0O2fi0d5Ed
         cS2g==
X-Gm-Message-State: APjAAAXpY2B23DZdQ2SftCdGHrWgNT70hoziii8Re7qpdhOlvXPlU6z0
        qdgUASiSVtbZA75EQcUGw6PtEw==
X-Google-Smtp-Source: APXvYqxbB0DIJUksWhec8m1//rRloZbcmMNo09mRdk1QtT2YzBbOxuggDjgDCCiFlgO4AyooKsqU7g==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr3143492wrq.328.1567700499515;
        Thu, 05 Sep 2019 09:21:39 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id i73sm4183550wmg.33.2019.09.05.09.21.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 05 Sep 2019 09:21:38 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        wim@linux-watchdog.org
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH] watchdog: qcom: add support for the bark interrupt
Date:   Thu,  5 Sep 2019 18:21:35 +0200
Message-Id: <20190905162135.2618-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the bark interrupt to notify the bark event. Since the bark and bite
timeouts are identical, increase the bite timeout by one second so
that the bark event can be logged to the console.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 7be7f87be28f..5eaf92084b93 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 #include <linux/of_device.h>
+#include <linux/interrupt.h>
 
 enum wdt_reg {
 	WDT_RST,
@@ -41,6 +42,8 @@ struct qcom_wdt {
 	unsigned long		rate;
 	void __iomem		*base;
 	const u32		*layout;
+	unsigned int		irq;
+	const struct device	*dev;
 };
 
 static void __iomem *wdt_addr(struct qcom_wdt *wdt, enum wdt_reg reg)
@@ -54,15 +57,37 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
 	return container_of(wdd, struct qcom_wdt, wdd);
 }
 
+static inline int qcom_wdt_enable(struct qcom_wdt *wdt)
+{
+	if (wdt->irq < 0)
+		return 1;
+
+	/* enable timeout with interrupt */
+	return 3;
+}
+
+static irqreturn_t qcom_wdt_irq(int irq, void *cookie)
+{
+	struct qcom_wdt *wdt =  (struct qcom_wdt *) cookie;
+
+	dev_warn(wdt->dev, "barking, one second countdown to reset\n");
+
+	return IRQ_HANDLED;
+}
+
 static int qcom_wdt_start(struct watchdog_device *wdd)
 {
 	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
+	unsigned int bark, bite;
+
+	bark = wdd->timeout;
+	bite = wdt->irq < 0 ? bark : bark + 1;
 
 	writel(0, wdt_addr(wdt, WDT_EN));
 	writel(1, wdt_addr(wdt, WDT_RST));
-	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
-	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
+	writel(bite * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
+	writel(qcom_wdt_enable(wdt), wdt_addr(wdt, WDT_EN));
 	return 0;
 }
 
@@ -210,10 +235,21 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
 	wdt->wdd.parent = dev;
 	wdt->layout = regs;
+	wdt->dev = &pdev->dev;
 
 	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
+	wdt->irq = platform_get_irq(pdev, 0);
+	if (wdt->irq >= 0) {
+		ret = devm_request_irq(&pdev->dev, wdt->irq, qcom_wdt_irq,
+				       IRQF_TRIGGER_RISING, "wdog_bark", wdt);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to request irq\n");
+			return ret;
+		}
+	}
+
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
 	 * default, unless the max timeout is less than 30 seconds, then use
-- 
2.23.0

