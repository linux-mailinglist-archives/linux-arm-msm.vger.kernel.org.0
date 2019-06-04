Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8F8344A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 12:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727157AbfFDKpb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 06:45:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36486 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfFDKpF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 06:45:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id v22so14191220wml.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 03:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nmWKh7PwMWUSmXx8hL09I0aV6DcSJSwvr9bLIGJ3tMI=;
        b=LXWU9/Y5JBIKMtLWOdiKJLbb9tdjt33+6OiEvBHTA/jJhGCLzOGAQnnP00IEk2mgjn
         WdifvNhB5S3ZlZZ3pE4iYbadhQWIg6Ius7qy1bSWhBvMAlhsJAZJdS+CFPSuERNxNKn+
         ZcCKs7/jHCkOe8iMYIR8/sz9OjaNcrk8Ed+L1GUEZ7uvYqJpq7Wph/IQTc0sel3X2fnF
         Gqojp9JUGPQu2bD8xZYvkFPH9j4n4DhBrwG9nhCy7PEPRUiAY52KXgO3DS5uOTWybdKF
         H/xieigYpZZPKJRTG/sj4lbfsgT2NaHAzfNowzeCGfGLM4pvPocT4MGXt5jDNXBpCFnO
         vl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nmWKh7PwMWUSmXx8hL09I0aV6DcSJSwvr9bLIGJ3tMI=;
        b=oEBxvNuTE3arpp46o+ob6xPz86D/qpuaxq808cT6C+LAweiScqBREgqhbm4YW34XqU
         7ScI2F9ykwE3QLrkQZrO6HxHRn2qUn4HvA+gYAuzmcj16nipZ+cyM99kicGTvKjuF/6v
         UUSIUD7TKRV5o38zbvXsgU5RUzBM6yX5gL/Ku4Sw4QVeKmf5fUayBWpMInAYPzOO6Mh8
         ztX9BohoB02soh0oNTUBQ/D3bpFYt3bAJooyrj58qr8/njpw3yS+eZlk/n7PDCH6BIF/
         JmIOhuZJ4yscdGsDaY/Z3C8ukwrE9/3H5DsxCIhPzdxnHCrsfEcGlUyhJLA4vkcPHJko
         Fg4Q==
X-Gm-Message-State: APjAAAVjbGdcYDg6eKDqWUOCMBu5hafAXgMRcPVjvT9ab+Ore22VN2KP
        l2edLXoiEyXx2n+7qMt7Jyrddg==
X-Google-Smtp-Source: APXvYqy1XcHrO0wRAH/ghFJRVG9ahy/5oy36W3v7PbWR26CIoI8W4F0fNxIdcXtIBLkFHh6YvnX7xw==
X-Received: by 2002:a1c:be12:: with SMTP id o18mr6011168wmf.124.1559645102805;
        Tue, 04 Jun 2019 03:45:02 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:02 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Date:   Tue,  4 Jun 2019 11:44:51 +0100
Message-Id: <20190604104455.8877-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch provides basic support for booting with ACPI instead
of the currently supported Device Tree.  When doing so there are a
couple of differences which we need to taken into consideration.

Firstly, the SDM850 ACPI tables omit information pertaining to the
4 reserved GPIOs on the platform.  If Linux attempts to touch/
initialise any of these lines, the firmware will restart the
platform.

Secondly, when booting with ACPI, it is expected that the firmware
will set-up things like; Regulators, Clocks, Pin Functions, etc in
their ideal configuration.  Thus, the possible Pin Functions
available to this platform are not advertised when providing the
higher GPIOD/Pinctrl APIs with pin information.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig          |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 35 ++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 2e66ab72c10b..aafbe932424f 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -168,7 +168,7 @@ config PINCTRL_SDM660
 
 config PINCTRL_SDM845
        tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
-       depends on GPIOLIB && OF
+       depends on GPIOLIB && (OF || ACPI)
        select PINCTRL_MSM
        help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index c97f20fca5fd..7188bee3cf3e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -1277,6 +1278,10 @@ static const struct msm_pingroup sdm845_groups[] = {
 	UFS_RESET(ufs_reset, 0x99f000),
 };
 
+static const int sdm845_acpi_reserved_gpios[] = {
+	0, 1, 2, 3, 81, 82, 83, 84, -1
+};
+
 static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.pins = sdm845_pins,
 	.npins = ARRAY_SIZE(sdm845_pins),
@@ -1284,14 +1289,41 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.nfunctions = ARRAY_SIZE(sdm845_functions),
 	.groups = sdm845_groups,
 	.ngroups = ARRAY_SIZE(sdm845_groups),
+	.reserved_gpios = sdm845_acpi_reserved_gpios,
+	.ngpios = 150,
+};
+
+static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
+	.pins = sdm845_pins,
+	.npins = ARRAY_SIZE(sdm845_pins),
+	.groups = sdm845_groups,
+	.ngroups = ARRAY_SIZE(sdm845_groups),
+	.reserved_gpios = sdm845_acpi_reserved_gpios,
 	.ngpios = 150,
 };
 
 static int sdm845_pinctrl_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &sdm845_pinctrl);
+	int ret;
+
+	if (pdev->dev.of_node) {
+		ret = msm_pinctrl_probe(pdev, &sdm845_pinctrl);
+	} else if (ACPI_HANDLE(&pdev->dev)) {
+		ret = msm_pinctrl_probe(pdev, &sdm845_acpi_pinctrl);
+	} else {
+		dev_err(&pdev->dev, "DT and ACPI disabled\n");
+		return -EINVAL;
+	}
+
+	return ret;
 }
 
+static const struct acpi_device_id sdm845_pinctrl_acpi_match[] = {
+	{ "QCOM0217"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, sdm845_pinctrl_acpi_match);
+
 static const struct of_device_id sdm845_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sdm845-pinctrl", },
 	{ },
@@ -1302,6 +1334,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
 		.name = "sdm845-pinctrl",
 		.pm = &msm_pinctrl_dev_pm_ops,
 		.of_match_table = sdm845_pinctrl_of_match,
+		.acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
 	},
 	.probe = sdm845_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

