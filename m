Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EEA165377
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 01:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgBTAUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 19:20:49 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34044 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgBTAUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 19:20:49 -0500
Received: by mail-pj1-f65.google.com with SMTP id f2so581970pjq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 16:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jTaHDD+09W3xPLB5zxqrZcfKt5xjlZG4YPPLRu8eAo=;
        b=b1XelOjvj05D0Bwh2OQjpR9HZva2lUVZkRpxeC9Q98tZq8EZ4K9eDHdlUPwmiOOop8
         QkMHi2N81LsFtlBSeEFLuFw3VZUe+PpiUS4er8PSCtS5Tt8WBr3C2D2/RiSBm/RQ/aId
         920+6K4rD3kfJybAs0JO6Bag2lo7zANivnhIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jTaHDD+09W3xPLB5zxqrZcfKt5xjlZG4YPPLRu8eAo=;
        b=NnVXV6Xm/A6oJae1QgQT3Z9ovTZffxSRc0NoF8d3NYVC+djFN9PSqxsfUWEA47pzf4
         wa2ae0jUeamnaeNZAIuMzP8tTghMAP2bWYOT7qVS7WcFkuTxuKYex3QWp6qGlVQj2K04
         xQn6dBrHgxhkEFUe3dpw7MShn7bD2FbelGTS+aj53gjjwNfs213A7wH8paeJeavyxFD+
         5c9E0NLRXGrijiYRMvliUoZBgMpdl4BOfDG/9sqWscGW23cHS7NhICUSWArT/3xwe9n5
         EE8IZ5/N8hobnutyg/EDw1uVBKSIXxVpAkqU8Men8hXyJjbnxOj3xp01xJwEX+q2h7sV
         eeRw==
X-Gm-Message-State: APjAAAUmA74irfc8K3Vu3CRC0xhvENGpXouCM/Sn+JR4g+U5drUJJUL9
        AJCKOJqsMfzVD4lI6q52M5ye7A==
X-Google-Smtp-Source: APXvYqxZJROEl7Go9mJ14zcRqIEZy8MOQhYz52cxdH9LK3/ms/0tqs13Hch4RiI8ug3rWwZp182Wog==
X-Received: by 2002:a17:902:104:: with SMTP id 4mr28045532plb.24.1582158048735;
        Wed, 19 Feb 2020 16:20:48 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g21sm804731pfb.126.2020.02.19.16.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:20:48 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] watchdog: qcom: Use irq flags from firmware
Date:   Wed, 19 Feb 2020 16:20:47 -0800
Message-Id: <20200220002047.115000-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DT or ACPI tables should tell the driver what the irq flags are.
Given that this driver probes only on DT based platforms and those DT
platforms specify the irq flags we can safely drop the forced irq flag
setting here.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/watchdog/qcom-wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index eb47fe5ed280..c70e89013101 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -248,8 +248,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	/* check if there is pretimeout support */
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
-		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
-				       IRQF_TRIGGER_RISING,
+		ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
 				       "wdt_bark", &wdt->wdd);
 		if (ret)
 			return ret;
-- 
Sent by a computer, using git, on the internet

