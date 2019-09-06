Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49940AC1B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 22:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404019AbfIFUyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 16:54:20 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54453 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403977AbfIFUyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 16:54:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id k2so7780330wmj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 13:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fcen4t8ALRC/eyTecR6xj2ycvqKCwBYdO81MLFjTX94=;
        b=OVQATcHvrR2G3H50mlV29q3R3sZxjU4siUCn8rM/DditB7+reiuxabkbg49orRaHKY
         NwdNnCoCOvM6Eg8Qd4gSpCR+z5c56WwyEpo0bTkQClbFvy48BMKWK0hJypAoQSx07W9a
         W4hjF5ttQ4wkLS6qffiOUN3ljwOWiAqnm7+RJH0SDSS+haBT5EvoDis3M7e2bOTxej5B
         PAW5wcFYRo/0FtWVYwXoHfTeHbTGwIphie+LtGJEmSvIDG2ZGtWeSp7L3Xsqw7rXfR5o
         vuxK7s1XPg1PM0P5sfmDx6fKLxkIUeDqjN8hKGDLcUyiiN7KslFNxmM9k0jQF36FNlq2
         X36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fcen4t8ALRC/eyTecR6xj2ycvqKCwBYdO81MLFjTX94=;
        b=lkmmUzHy986VC6H8XbMlprUpP7Irr/IX3AlFBcvn4Zlo/kg4DoSR+p+ujx1HyEOVQF
         NWrnhV/BblFx9ciVa2fguRW3Ff0eyAUcJpGZinlac1+DDfZWimsUNly5kLMKolOHrrKI
         pvrLVKdEsuxZqfXFBdD5xuKFd3F1ncAVj6uXgyuzMYsDWI+sj0kY72B7VhOYjnak789r
         GK1mOabSoji8CMyA4Vko0i6Qm+upG0e/cXQKBt3yYQI0b7wltWisUNIF1UCtVo4CSONo
         jENyKHfWmvq5X28DtEXlghrxFO5K5F8kFSKGqGR9PgJ19alZAJ5gN5358CWeZfZmofyX
         ekzQ==
X-Gm-Message-State: APjAAAUCC6S89PDoe6haaYW6QeEzQyPRBdtoYiRRLYDcXbbfnOoORkFC
        +X18pNz0FqqF9tEvoOF6G/poXA==
X-Google-Smtp-Source: APXvYqz8l5Gp8o2izYZAEjl3kHvFNBZNR9bd57fzq9r1AwdI/krZ5I4P8EaB+FNEft4iPL7zcJz8wA==
X-Received: by 2002:a1c:ef13:: with SMTP id n19mr9159278wmh.48.1567803257227;
        Fri, 06 Sep 2019 13:54:17 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id q5sm317416wmq.3.2019.09.06.13.54.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 13:54:16 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        linux@roeck-us.net, wim@linux-watchdog.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] watchdog: qcom: remove unnecessary variable from private storage
Date:   Fri,  6 Sep 2019 22:54:11 +0200
Message-Id: <20190906205411.31666-3-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
References: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

there is no need to continue keeping the clock in private storage.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/watchdog/qcom-wdt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 935c78a882a3..e98f5a3d83ea 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -42,7 +42,6 @@ static const u32 reg_offset_data_kpss[] = {
 
 struct qcom_wdt {
 	struct watchdog_device	wdd;
-	struct clk		*clk;
 	unsigned long		rate;
 	void __iomem		*base;
 	const u32		*layout;
@@ -189,6 +188,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	const u32 *regs;
 	u32 percpu_offset;
 	int irq, ret;
+	struct clk *clk;
 
 	regs = of_device_get_match_data(dev);
 	if (!regs) {
@@ -215,19 +215,18 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	wdt->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(wdt->clk)) {
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
 		dev_err(dev, "failed to get input clock\n");
-		return PTR_ERR(wdt->clk);
+		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(wdt->clk);
+	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(dev, "failed to setup clock\n");
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, qcom_clk_disable_unprepare,
-				       wdt->clk);
+	ret = devm_add_action_or_reset(dev, qcom_clk_disable_unprepare, clk);
 	if (ret)
 		return ret;
 
@@ -239,7 +238,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	 * that it would bite before a second elapses it's usefulness is
 	 * limited.  Bail if this is the case.
 	 */
-	wdt->rate = clk_get_rate(wdt->clk);
+	wdt->rate = clk_get_rate(clk);
 	if (wdt->rate == 0 ||
 	    wdt->rate > 0x10000000U) {
 		dev_err(dev, "invalid clock rate\n");
-- 
2.23.0

