Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EBE29DB42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgJ1XrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729203AbgJ1Xq5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:46:57 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDA4C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:46:57 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l8so855711wmg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XnuhgZaYUD0ayPx08w+UvM9KLy1LMXZz/+HsWLgxZNQ=;
        b=Rcm2eEuDK4UtInVDv6MwgfC8qnx10PBdggNToMZ9u9+EakMkwmIXISfG5rq0n88wTy
         MWsFYi593jAwaqD5QOj0bJBWlzlWTkjNSPrCCpg3IdlJQR1BrfWbujAmtg3sXPwsi0hg
         OLVexzD1jOzTxtwFrCFlSZIcxa1LX3hKUwiTLD74jmL9vfHf5BCB3V+QR4ftPtu0stlA
         j4jHHDi1ao5mp1ZRzBx0e4ysxjzulPKXy0bIGHvW57GUQUWVnuMC9v+A1MpBru1D2CYq
         UK4pC43iwtl3KB6JKTRiSDJN/X1fqtNkyMMarcAB6Rrj2bJ68Ja9OhllYfIc0gWhtlXX
         USuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XnuhgZaYUD0ayPx08w+UvM9KLy1LMXZz/+HsWLgxZNQ=;
        b=Tuxp/9C7yXcKnWRqpcpVQmW5UyJMt+5BAjAuj3qgK7++R1JwFhT2STxFKK3G68zJSe
         Nigo60ttB2IChBmhTedA3/4UjwYMsoeN3hHLgTRWK2GxKbFbYKgohSzizMMW4uuzAqGw
         gpkUxkKBkbK7IfH3xcfdqmRvvH93xKkWJJpbKkUXNwxyLqY21j9oV5cXWC63wAKVb/wZ
         J4Nk1OpuFB5XG+Y38uYb7Cp7mS9VAn1PzME0aH2cIT9ZgxTYClAYyK6zJ9EPSXqnzlOO
         /YhLc2TZoBbYQnfSMA+155xGLKHLdv6qDHHEs7tgmuPsaA5AcCx3A7gKIjgt+9wPowfr
         /pcA==
X-Gm-Message-State: AOAM531zpBYmGPcm89v9GKHiA+IuH7i1W5R0uaXE4kinQhNWoo1OL18/
        37BdELWnsSGgKIE0ROsxdjcviSBRCvFiaEji
X-Google-Smtp-Source: ABdhPJwbIXkQkonhnyPuX/G0JjBnGtgHd7TK7GQX4d74obu9pQRCJDGXzt1HjCbBCeSttoZaa+Rmlg==
X-Received: by 2002:a1c:9cd8:: with SMTP id f207mr7542761wme.76.1603885348662;
        Wed, 28 Oct 2020 04:42:28 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-200.xnet.hr. [88.207.98.200])
        by smtp.googlemail.com with ESMTPSA id c8sm1091647wrv.26.2020.10.28.04.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:42:27 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when appropriate
Date:   Wed, 28 Oct 2020 12:42:21 +0100
Message-Id: <20201028114221.6594-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Robert Marko <robimarko@gmail.com>

If the watchdog hardware is enabled/running during boot, e.g.
due to a boot loader configuring it, we must tell the
watchdog framework about this fact so that it can ping the
watchdog until userspace opens the device and takes over
control.

Do so using the WDOG_HW_RUNNING flag that exists for exactly
that use-case.

Given the watchdog driver core doesn't know what timeout was
originally set by whoever started the watchdog (boot loader),
we make sure to update the timeout in the hardware according
to what the watchdog core thinks it is.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 drivers/watchdog/qcom-wdt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index eb47fe5ed280..546ac5b78869 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -147,6 +147,13 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 	return 0;
 }
 
+static int qcom_wdt_is_running(struct watchdog_device *wdd)
+{
+	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
+
+	return (readl(wdt_addr(wdt, WDT_EN)) & 1);
+}
+
 static const struct watchdog_ops qcom_wdt_ops = {
 	.start		= qcom_wdt_start,
 	.stop		= qcom_wdt_stop,
@@ -280,6 +287,21 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
+	if (qcom_wdt_is_running(&wdt->wdd)) {
+		/*
+		 * Make sure to apply timeout from watchdog core, taking
+		 * the prescaler of this driver here into account (the
+		 * boot loader might be using a different prescaler).
+		 *
+		 * To avoid spurious resets because of different scaling,
+		 * we first disable the watchdog, set the new prescaler
+		 * and timeout, and then re-enable the watchdog.
+		 */
+		qcom_wdt_stop(&wdt->wdd);
+		qcom_wdt_start(&wdt->wdd);
+		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+	}
+
 	ret = devm_watchdog_register_device(dev, &wdt->wdd);
 	if (ret)
 		return ret;
-- 
2.28.0

