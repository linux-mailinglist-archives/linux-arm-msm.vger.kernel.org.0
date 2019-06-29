Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2D75AB37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 15:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfF2NCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 09:02:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36672 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfF2NCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 09:02:08 -0400
Received: by mail-lf1-f68.google.com with SMTP id q26so5787841lfc.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2019 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bx02aBFfPRkMhKf40AS7qTzkWiU4y0/D0eEn128oWGQ=;
        b=HMJwmwK/OCpaYq/6HMbWpbRyQvbyRKO/I7HCpmQY60NBAA5MO22b/vxuEsNGmfSrQj
         fcBHaXH3QcaXBjlvZSLYDun/FB+rgDgBWoWalJEfqrFx7clYu5kbrkkBKrjVtZmMKlq8
         WC2B7LrGWBnyBnj7Drd4FPlumQkqf0Z7A5isRfAnVg65WJG+CsFsYRjJAAhuTNd2aVA7
         66LsDK1Qqc8JeCr6xmMPRc8LdBJYZN0YWR33m6YI2cjRuLFu5zKVU7UmtADnzzy1MTh6
         dKR1eH+dSyDQqLMlaA0pDm4XeS752CpzhfPClsdCtntV/lFNVKMEnL93gCLgI+lOthEm
         bLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bx02aBFfPRkMhKf40AS7qTzkWiU4y0/D0eEn128oWGQ=;
        b=aSnKAjAugyZHQmm+A82PlMqVxPMQIWVV/LQko1oUjZcfs3KfpKJP1owuxoAN1HEta6
         s+Tbh9wiaezsvBMMOe0mGqS94/ECeV85eLqNhGEWvJKCZTHPiXY5ziyU7jfhS5T6JWvz
         V7p2ZTYHNzCGu+AHQML2qKtyPoYHG0BtWATezVUe7NNkb4rU4JaDV5rWlr2WQMz8jCfE
         uk5hpi7zolZ9XSMXp1HKKv2iAI7EPDgJu4WeIaHpAHLV9uIoKQwJKauYvpDPV/gLtdlm
         MresdP5/YvlVuwVkIKVJ5cMQrnZmhfYbQuAfHCobSCg8vJ8DhNtfCpHQha6OqhAAv+uJ
         djNQ==
X-Gm-Message-State: APjAAAWMivU0w0ly8kfnnyKuAzz2+u1BN7IZeVJOvbWSVeA8g+t43V5K
        2SeQ1WAZDidpAL+AOK7XKtGtlw==
X-Google-Smtp-Source: APXvYqxTzIJVpddQHAmhA5Fk+i0uPHGclgtAxJMzxPUjiAnCGI/TQWmRQfr+sLmOyHXNV5a5lmrefQ==
X-Received: by 2002:a19:cc45:: with SMTP id c66mr7446160lfg.171.1561813326303;
        Sat, 29 Jun 2019 06:02:06 -0700 (PDT)
Received: from localhost.localdomain (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.02.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 06:02:05 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 6/7] RFT: drm/msm/hdmi: Bring up HDMI connector OFF
Date:   Sat, 29 Jun 2019 14:59:32 +0200
Message-Id: <20190629125933.679-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is elaborate code in the HDMI connector handling to
leave the connector in the state it was at power-on and
only touch the GPIOs when the connector .enable() and
.disable() callbacks are called.

I don't think this is what we normally want, initialize
the connector as OFF (possibly saving power?) using the
appropriate GPIO descriptor flags. It will still be
switched on/off in the enable()/disable() connector
callback as before, but we can drop some strange surplus
code.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c           | 19 ++++++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 25 ++++++-----------------
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c8e8268c76e2..7d87f8821d2f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -563,13 +563,22 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
 		const char *name = msm_hdmi_gpio_pdata[i].name;
 		struct gpio_desc *gpiod;
+		enum gpiod_flags flags;
 
 		/*
-		 * We are fetching the GPIO lines "as is" since the connector
-		 * code is enabling and disabling the lines. Until that point
-		 * the power-on default value will be kept.
+		 * Notice the inverse set up here: we initialize the connector
+		 * to OFF state.
 		 */
-		gpiod = devm_gpiod_get_optional(dev, name, GPIOD_ASIS);
+		if (msm_hdmi_gpio_pdata[i].output) {
+			if (msm_hdmi_gpio_pdata[i].value)
+				flags = GPIOD_OUT_LOW;
+			else
+				flags = GPIOD_OUT_HIGH;
+		} else {
+			flags = GPIOD_IN;
+		}
+
+		gpiod = devm_gpiod_get_optional(dev, name, flags);
 		/* This will catch e.g. -PROBE_DEFER */
 		if (IS_ERR(gpiod))
 			return PTR_ERR(gpiod);
@@ -583,7 +592,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 			 * in the upstream bindings.
 			 */
 			if (sscanf(name, "qcom,hdmi-tx-%s", name3))
-				gpiod = devm_gpiod_get_optional(dev, name3, GPIOD_ASIS);
+				gpiod = devm_gpiod_get_optional(dev, name3, flags);
 			if (IS_ERR(gpiod))
 				return PTR_ERR(gpiod);
 			if (!gpiod)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index c4e9f6d7960f..89c64cc85027 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -86,16 +86,9 @@ static int gpio_config(struct hdmi *hdmi, bool on)
 		for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
 			struct hdmi_gpio_data gpio = config->gpios[i];
 
-			if (gpio.gpiod) {
-				if (gpio.output) {
-					gpiod_direction_output(gpio.gpiod,
-							       gpio.value);
-				} else {
-					gpiod_direction_input(gpio.gpiod);
-					gpiod_set_value_cansleep(gpio.gpiod,
-								 gpio.value);
-				}
-			}
+			/* The value indicates the value for turning things on */
+			if (gpio.gpiod)
+				gpiod_set_value_cansleep(gpio.gpiod, gpio.value);
 		}
 
 		DBG("gpio on");
@@ -103,16 +96,10 @@ static int gpio_config(struct hdmi *hdmi, bool on)
 		for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
 			struct hdmi_gpio_data gpio = config->gpios[i];
 
-			if (!gpio.gpiod)
-				continue;
-
-			if (gpio.output) {
-				int value = gpio.value ? 0 : 1;
-
-				gpiod_set_value_cansleep(gpio.gpiod, value);
-			}
+			/* The inverse value turns stuff off */
+			if (gpio.gpiod && gpio.output)
+				gpiod_set_value_cansleep(gpio.gpiod, !gpio.value);
 		};
-
 		DBG("gpio off");
 	}
 
-- 
2.20.1

