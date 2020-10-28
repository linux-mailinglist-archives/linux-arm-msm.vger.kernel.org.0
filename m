Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D7529D607
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgJ1WLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730594AbgJ1WK5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:10:57 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DA9C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:10:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 2so871449ljj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/mISl4pg2C3Yg5kNFUKUKGfi4SXF1l5cc8dUSNajpE=;
        b=lVPgk539IYHFg5Ur5L1PfIGULcCeChL7FwHoUoDv1+mm6SG4DS2Xy1L/B/F7fd5+mP
         f5ADCVWTqB+KUcGrgPIXDxiVUctXLtzHuZJGtBP5hwmDhc8Okj9Cg3KvFn/EqBSoInjW
         HBvkqW1DpVt/VW6Hw8UQ4zfyvuAx8OcUMB6CjXeBvwIAkM5qMGZez67+8iuB134XJffR
         APakBda1Pa9buNE9GBl9n8v3BTW0+g4X/Hv0dLM8xCP+lhZ2VYUObPhvXmy/kZgdY027
         pyXF3k/yAbW7Dy8sg/6pJ/vWonHbtg6z7Hq1WNj2rRh60pk+h93L2Pe7NTrC2V0LJ983
         H2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/mISl4pg2C3Yg5kNFUKUKGfi4SXF1l5cc8dUSNajpE=;
        b=Gi+H7DT5WzIjHrEzpBuCkz7tRyMrGWMP0HqRpVe4oQLRu6v0JpEpadaaj0i1G42DFU
         f+pmbfCOaywBqvhSoEYAOtouZthBYJFU7Eb9eDYleNYaqc10dUJNqV9BzL5IW4AcJr/K
         TEmKRMZJdUJk/D11LVI+W40QrRqaIWLXK/jrdYPrIDapi4L/TPFFKTP3S90GQW1nVxR0
         KU4mqgBw3fn1rTVk3f+uXJZLr2nBSJQidoEpvAPAvqr67l2Pg6Aos4vHEhd0Pu5DcaH7
         u0+uznIdJpzo6sazugJ1RMPKOLh18V4i3mdGvkuKrYgM6o52KK9zLciNxLj/vIGKHCtV
         V2gA==
X-Gm-Message-State: AOAM531aIOASQBmJmIDKjKJBIzGQKdezi9XW1s6Neg7ky/16H48eHaYw
        9k1ZJPSE+GyLqK/kmCPY7TG44yxdM1VWm991
X-Google-Smtp-Source: ABdhPJwaYxESH8zh1v1ocaDitaPtaxX2VCV1QfjTTXry7ovuw85IrQFJV99PZPRQnGLR73/7yfPDnw==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr8316847wrv.224.1603885603821;
        Wed, 28 Oct 2020 04:46:43 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-200.xnet.hr. [88.207.98.200])
        by smtp.googlemail.com with ESMTPSA id f11sm5873604wml.43.2020.10.28.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:46:43 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when appropriate
Date:   Wed, 28 Oct 2020 12:46:35 +0100
Message-Id: <20201028114635.7570-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes in v2:
* Correct authorship

 drivers/watchdog/qcom-wdt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index ab7465d186fd..28c93a918e38 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -152,6 +152,13 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
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
@@ -294,6 +301,21 @@ static int qcom_wdt_probe(struct platform_device *pdev)
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

