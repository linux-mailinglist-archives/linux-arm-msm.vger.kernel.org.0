Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F36C42913
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439810AbfFLO2D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 10:28:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37178 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408719AbfFLO1B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 10:27:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id 22so6769532wmg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2019 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/Aaq1IVmTDwb5aMIJ54pXjvtw4nnZoMXSsSE3y/KzPo=;
        b=spIr1HI0F3AbtAb8DiEu9/whqpOq+KBs10UFyXRd2fSUB1k5RBU6LCcCvVt+QuW/vS
         oYdIGMzDfdkTfT6jYYjOpkFonvS+vzQwx9/Fxl6TXi+O2dNyxmmXE9Df9WzDen3//b5y
         ljMssjx4qZ3ak18yl9aXl4FmlH/NWEAUxLlxVICaMzyU0EUL30iFeE0e9VXlrGA7UcOX
         AXrZQIlUpuFk5xKlo2l/vShTgeyK3RUyY5UNypj3AV4gPjqd0e5jHOoEU+O6mIKCWA9i
         0nAvG33btRAYHe81prn37js+mnL5VvdULXuL0SeXnGYxD2GuopufTTmtY1oh7HJIUUgY
         DNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/Aaq1IVmTDwb5aMIJ54pXjvtw4nnZoMXSsSE3y/KzPo=;
        b=HX5Ejx1JYZ1ClzxDNLHLN+pWlsBjK2RKsY3uR5R8iiDRCe1kc4fjIc8ikqc/8HUF6p
         yO5Lp8AbDr0K0iJzNKQdtPoMY+gV3dhQ8Ljm9y0Caiygfi7CKmaSxbMpEs5+GVdIkA2g
         Wy48fytQ4kInWCX0pOGmEfOqL2ZcTY5iRccH1nY71i5fEGw4WMn9WzzN6NEHCK7atKGa
         XrFfeCTjpp9A9LUVeNlMpBQpVvO5WXJ5hAq0oG4n3NW+nsSPTAs35E7x/tnTuyRKrQTa
         GorSgMEOK8xKnS72NLqXTodjrpNLS5FUW1fnXpe7g1j3aVYGbnZ1QEU7SSaBeVfA1S0b
         JeXw==
X-Gm-Message-State: APjAAAUqmIjJphL3oByxxGuJMmzf61nPv7NURE/+afuXFKG8fKUPmgwF
        9ScdCT91qQFwjpvuvwjOU9avsA==
X-Google-Smtp-Source: APXvYqzhMtr87FUQtkIgk6gBz7+K8Bh4W4ijluuKFWE7BZ8jROvsdnXNClEI8US18UFuYTFEkTusGw==
X-Received: by 2002:a1c:6c14:: with SMTP id h20mr6555123wmc.168.1560349619579;
        Wed, 12 Jun 2019 07:26:59 -0700 (PDT)
Received: from dell.watershed.co.uk ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id y18sm203959wmd.29.2019.06.12.07.26.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:26:58 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 1/6] i2c: i2c-qcom-geni: Provide support for ACPI
Date:   Wed, 12 Jun 2019 15:26:49 +0100
Message-Id: <20190612142654.9639-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612142654.9639-1-lee.jones@linaro.org>
References: <20190612142654.9639-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a match table to allow automatic probing of ACPI device
QCOM0220.  Ignore clock attainment errors.  Set default clock
frequency value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index db075bc0d952..9e3b8a98688d 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -483,6 +484,14 @@ static const struct i2c_algorithm geni_i2c_algo = {
 	.functionality	= geni_i2c_func,
 };
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id geni_i2c_acpi_match[] = {
+	{ "QCOM0220"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
+#endif
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -502,7 +511,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(gi2c->se.base);
 
 	gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
-	if (IS_ERR(gi2c->se.clk)) {
+	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(&pdev->dev)) {
 		ret = PTR_ERR(gi2c->se.clk);
 		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
 		return ret;
@@ -516,6 +525,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	if (has_acpi_companion(&pdev->dev))
+		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
+
 	gi2c->irq = platform_get_irq(pdev, 0);
 	if (gi2c->irq < 0) {
 		dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
@@ -660,6 +672,7 @@ static struct platform_driver geni_i2c_driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
 		.of_match_table = geni_i2c_dt_match,
+		.acpi_match_table = ACPI_PTR(geni_i2c_acpi_match),
 	},
 };
 
-- 
2.17.1

