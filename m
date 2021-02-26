Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3660325C0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 04:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhBZDkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 22:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhBZDkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 22:40:08 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC68DC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 19:39:28 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id l18so5296108pji.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 19:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=56AvynNCW+THTU4NZfS3buEv8VRRSK5XT9Dy1cT1dG0=;
        b=jwEATEoiOzi9h1cD0myiw5d+wV2Z5W/u+/HD4cM8CnQ1KsAdrHM6JaOSISnTR53npk
         Q/9QZh3BXBy8sdxFH/EDLVC59zt2ml6IGBXPZK/3fupx189ZMHXu0s8ugQgSMyR6G2VK
         EQ0AWWqDIjyWJtlihLosQXslYvQmoh3Elj6U3Rs5yDx4eHXT7ObC+GxDqzExl0lLEwRG
         nOGSbcXMgcUygUL7NM5zhG3MrjK8V2DmUZKFNGovKQouHHJw+pYEPy13O0zzTqVjHxGp
         7y7ekLmc4gwmSJCm9fGYCI1kK+aFO2LA5nNRkY3Ri7Yk6bsei3LhBIjDf4dsHYTpJSwO
         EJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=56AvynNCW+THTU4NZfS3buEv8VRRSK5XT9Dy1cT1dG0=;
        b=VTX0O9p9XUoAwF8GmMrYGvEyqR3Xlfsz7p2Zcyx4ilt/52+bPbOsJTTMc4IbyI2zV0
         6cyIkeAgNMYL6jIvurfZbdcQJYJ6glECJ+wNfm5hp/Rwbmu/2H9+ds9R/2lubsQYYfV6
         R8+zA+koCs7nWc+UPOYUnIXs2BzkVY/48rGFw7OFzaEg9G0Ui6qiPDF2ZBYwFb9UoNF0
         ezQFd5otAhAtTQU5b+HfZuaSJsy1y78SQOtq2Iqb9+7MhuiYJuWkDIR9Zlq3zPN/ehPx
         xLiZlVZ2cWILoNSSgMvHfaxgazQYElcIgi1dWiUNPvDbWX1MkqyCVzr2aWVNF+AkyCKm
         KILg==
X-Gm-Message-State: AOAM531eGZbIljI3y94H4nu0r0t6C2DyjdiEGmJDvRUAMjrciUHO5bWq
        fsamfGecY+KaAU8Q8hCFe9FV8vDPKz3mRQ==
X-Google-Smtp-Source: ABdhPJyzrNlyAHTtcjisJZbKIWjUhRki2mKrjHFgvleVW4ikML/lSQFIihGeog6hcS6fdhGH9VrS5w==
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id g3-20020a1709026b43b02900dffb48aecfmr1260629plt.67.1614310768092;
        Thu, 25 Feb 2021 19:39:28 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e22sm4950987pgk.56.2021.02.25.19.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 19:39:27 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] gpiolib: acpi: support override broken GPIO number in ACPI table
Date:   Fri, 26 Feb 2021 11:39:19 +0800
Message-Id: <20210226033919.8871-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Running kernel with ACPI on Lenovo Flex 5G laptop, touchpad is just
not working.  That's because the GpioInt number of TSC2 node in ACPI
table is simply wrong, and the number even exceeds the maximum GPIO
lines.  As the touchpad works fine with Windows on the same machine,
presumably this is something Windows-ism.  Although it's obviously
a specification violation, believe of that Microsoft will fix this in
the near future is not really realistic.

It adds the support of overriding broken GPIO number in ACPI table
on particular machines, which are matched using DMI info.  Such
mechanism for fixing up broken firmware and ACPI table is not uncommon
in kernel.  And hopefully it can be useful for other machines that get
broken GPIO number coded in ACPI table.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 63 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index e37a57d0a2f0..30a5c5a954fa 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -93,6 +93,63 @@ static DEFINE_MUTEX(acpi_gpio_deferred_req_irqs_lock);
 static LIST_HEAD(acpi_gpio_deferred_req_irqs_list);
 static bool acpi_gpio_deferred_req_irqs_done;
 
+struct acpi_gpio_pin_fixup {
+	int pin_broken;
+	int pin_correct;
+};
+
+struct acpi_gpio_pin_override {
+	const struct acpi_gpio_pin_fixup *fixups;
+	int num;
+};
+
+static const struct acpi_gpio_pin_fixup lenovo_flex_5g_fixups[] = {
+	{
+		/* GpioInt of Touchpad (TSC2) */
+		.pin_broken = 0x0280,
+		.pin_correct = 0x0018,
+	},
+};
+
+static const struct acpi_gpio_pin_override lenovo_flex_5g_override = {
+	.fixups = lenovo_flex_5g_fixups,
+	.num = ARRAY_SIZE(lenovo_flex_5g_fixups),
+};
+
+static const struct dmi_system_id acpi_gpio_pin_override_table[] = {
+	{
+		.ident = "Lenovo Flex 5G",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_FAMILY, "Flex 5G 14Q8CX05"),
+		},
+		.driver_data = (void *)&lenovo_flex_5g_override,
+	},
+	{ } /* terminator */
+};
+
+static int acpi_gpio_pin_override(int pin)
+{
+	const struct acpi_gpio_pin_override *override;
+	const struct acpi_gpio_pin_fixup *fixup;
+	const struct dmi_system_id *system_id;
+	int i;
+
+	system_id = dmi_first_match(acpi_gpio_pin_override_table);
+	if (!system_id)
+		return pin;
+
+	override = system_id->driver_data;
+
+	for (i = 0; i < override->num; i++) {
+		fixup = &override->fixups[i];
+		if (pin == fixup->pin_broken)
+			return fixup->pin_correct;
+	}
+
+	return pin;
+}
+
 static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
 {
 	if (!gc->parent)
@@ -125,7 +182,11 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 	if (!chip)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	return gpiochip_get_desc(chip, pin);
+	/*
+	 * Give it a chance to correct the broken GPIO pin number in ACPI
+	 * table of particular machines.
+	 */
+	return gpiochip_get_desc(chip, acpi_gpio_pin_override(pin));
 }
 
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
-- 
2.17.1

