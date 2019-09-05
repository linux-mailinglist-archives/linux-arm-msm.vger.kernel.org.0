Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4CAAAAAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 20:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfIESNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 14:13:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42986 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbfIESNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 14:13:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id q14so3843249wrm.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 11:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQx8LFwZEFLFHsOp6JVQ136wPiDCvxTvsHmYT44VyoI=;
        b=eVM7TV5SOQ6FWjx9D+/wdXDdUZvKjsK3uwzSWmGCt3y5Xl6OGfFQk+D7+mqdwdMoQS
         lxypCMfFn+mxeQcySxr9XZbygsD9Vc9WQuhN6U1CTlHCJzA1ygCiCGOHhhcjAIbjcKGF
         AedqpmHiO+FVSlkuSiYDMxruocmwTLaw12KGRsEViDxdw3gTccgUAxMQkR93DwRrzp/1
         hhFAupdfJxpjlOBdODCLFyFdMF1/Pi4V3RMxehfuAHgtaDq+E8kwGGmyP5IpuzB4vVut
         r9FeuBdmERwmVt1aOsBrqcPqdejkhT2uIiN0TcyFRHDXHP4G2XjnABm9s5WuQIBZYTtv
         zGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQx8LFwZEFLFHsOp6JVQ136wPiDCvxTvsHmYT44VyoI=;
        b=mbEf9pM25ghsNMKyUHGOnNBQGKAGF5J/m+ko15QYeREUqQOqzql4ggouSrO1FKB4Uz
         +g4+vlgsl9DuTBs1X1d3aXiG39EJBjNO/qb9i8EdRLv2+U8gjoULS73zwERDaHO0m0Pi
         YXT61E1Ja7zIGh0K8QGuypNaKJ2oz3YfgPr1uyvDiM83WSJy5EeTzuJG/LVVYRh3IOtg
         fpWWPgBtSMKxCq/9dHW2kdLJYtsfmFjSqDotiLKWwK3Hf5pByjxyQ8dggxr1IUa8CiNJ
         7PcpjpZj82kV+noIdivbTywUt/gG1cLEOgG8KycxwMp7n3trBPmJJA7eTyBBV5kA6/pK
         XjyQ==
X-Gm-Message-State: APjAAAVyt32zdx4PruFCSTvIRzdXybR5fQ4F7L8U+/jcZjiyGnqRRzdT
        nbZQuQgmPscjM96IAwXFyWCRxg==
X-Google-Smtp-Source: APXvYqzpr0bFIpXcmfHGs4sIrFHm6dNvdMik+ugY86ATlE+okNXm7Ke46M/YG3EhgL/hDPoRwHyY7A==
X-Received: by 2002:a5d:5402:: with SMTP id g2mr4031639wrv.291.1567707181379;
        Thu, 05 Sep 2019 11:13:01 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id w8sm8783173wmc.1.2019.09.05.11.13.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 05 Sep 2019 11:13:00 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: qcom: support pre-timeout when the bark irq is available
Date:   Thu,  5 Sep 2019 20:12:57 +0200
Message-Id: <20190905181257.31949-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the bark interrupt as the pre-timeout notifier whenever this
interrupt is available.

By default, the pretimeout notification shall occur one second earlier
than the timeout.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/watchdog/qcom-wdt.c | 63 ++++++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 7be7f87be28f..2dd36914aa82 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 #include <linux/of_device.h>
+#include <linux/interrupt.h>
+#include <linux/watchdog.h>
 
 enum wdt_reg {
 	WDT_RST,
@@ -41,6 +43,7 @@ struct qcom_wdt {
 	unsigned long		rate;
 	void __iomem		*base;
 	const u32		*layout;
+	const struct device	*dev;
 };
 
 static void __iomem *wdt_addr(struct qcom_wdt *wdt, enum wdt_reg reg)
@@ -54,15 +57,37 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
 	return container_of(wdd, struct qcom_wdt, wdd);
 }
 
+static inline int qcom_wdt_enable(struct qcom_wdt *wdt)
+{
+	/* enable the bark interrupt */
+	if (wdt->wdd.info->options & WDIOF_PRETIMEOUT)
+		return 3;
+
+	return 1;
+}
+
+static irqreturn_t qcom_wdt_irq(int irq, void *cookie)
+{
+	struct watchdog_device *wdd = (struct watchdog_device *) cookie;
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static int qcom_wdt_start(struct watchdog_device *wdd)
 {
 	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
+	unsigned int bark = wdd->pretimeout;
+
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+		bark = wdd->timeout;
 
 	writel(0, wdt_addr(wdt, WDT_EN));
 	writel(1, wdt_addr(wdt, WDT_RST));
-	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
+	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
 	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(qcom_wdt_enable(wdt), wdt_addr(wdt, WDT_EN));
 	return 0;
 }
 
@@ -86,9 +111,18 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
 				unsigned int timeout)
 {
 	wdd->timeout = timeout;
+
 	return qcom_wdt_start(wdd);
 }
 
+static int qcom_wdt_set_pretimeout(struct watchdog_device *wdd,
+				   unsigned int timeout)
+{
+	wdd->pretimeout = timeout;
+
+	return 0;
+}
+
 static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			    void *data)
 {
@@ -105,7 +139,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 	writel(1, wdt_addr(wdt, WDT_RST));
 	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
 	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(qcom_wdt_enable(wdt), wdt_addr(wdt, WDT_EN));
 
 	/*
 	 * Actually make sure the above sequence hits hardware before sleeping.
@@ -121,11 +155,12 @@ static const struct watchdog_ops qcom_wdt_ops = {
 	.stop		= qcom_wdt_stop,
 	.ping		= qcom_wdt_ping,
 	.set_timeout	= qcom_wdt_set_timeout,
+	.set_pretimeout	= qcom_wdt_set_pretimeout,
 	.restart        = qcom_wdt_restart,
 	.owner		= THIS_MODULE,
 };
 
-static const struct watchdog_info qcom_wdt_info = {
+static struct watchdog_info qcom_wdt_info = {
 	.options	= WDIOF_KEEPALIVEPING
 			| WDIOF_MAGICCLOSE
 			| WDIOF_SETTIMEOUT
@@ -146,7 +181,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const u32 *regs;
 	u32 percpu_offset;
-	int ret;
+	int irq, ret;
 
 	regs = of_device_get_match_data(dev);
 	if (!regs) {
@@ -210,6 +245,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
 	wdt->wdd.parent = dev;
 	wdt->layout = regs;
+	wdt->dev = &pdev->dev;
 
 	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
@@ -222,6 +258,23 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq >= 0) {
+		/* enable the pre-timeout notification */
+		qcom_wdt_info.options |= WDIOF_PRETIMEOUT;
+
+		ret = devm_request_irq(&pdev->dev, irq, qcom_wdt_irq,
+				       IRQF_TRIGGER_RISING, "wdog_bark",
+				       &wdt->wdd);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to request irq\n");
+			return ret;
+		}
+	}
+
+	if (qcom_wdt_info.options & WDIOF_PRETIMEOUT)
+		wdt->wdd.pretimeout = wdt->wdd.timeout - 1;
+
 	ret = devm_watchdog_register_device(dev, &wdt->wdd);
 	if (ret)
 		return ret;
-- 
2.23.0

