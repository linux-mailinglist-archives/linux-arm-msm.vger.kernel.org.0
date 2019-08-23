Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4190B9A8F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 09:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390471AbfHWHfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 03:35:04 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35003 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388420AbfHWHfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 03:35:03 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so7974475lje.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 00:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U4JjuaJiqXMB2o4Ei0Z8NiWiXfcICpnx2WAq5seW+dw=;
        b=beKwdrHHjuxuM0+kjruLKtl6q5NuVehPNcKCcVIjm80K0ZHnbd4x/gqtWXZv7zRPPe
         Ih2kNUo2fRTf+xw1lCPan3iXcUNi0TPr6bkXJHWyKxYfep4Yw5uw6HitrSBtNL/4voHp
         LFG3HGCk1lDI7uU605QCiQIpAxS1kRUSkQo5RICVVSfPKa3bgJBp3DqRbxLYOK6xQ3yS
         WvnPnt+pZgJKHa7t+KSFPJ6FOBCCDrRIIFLmdgZPxZu2kinYsyqBxbm+omEVcgGtogHt
         H1QzPhjyPeDFksPwhZUu0fpAhy+OkPhcW8Ztl7OaW99MgPfFCHADyoIdDQneceDcqwCW
         7a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4JjuaJiqXMB2o4Ei0Z8NiWiXfcICpnx2WAq5seW+dw=;
        b=PAcaNzizRKhwlzk3eSewMV8oenowdFDZWFfH8ZHDK3xy7AF8EDyQfkieZFgJCDjsno
         HYq+1JLTAty2ius909Oks9XB8g+gOlEGh7r465rSLtahy1S4aUB4mStgX4gizY/uQRvd
         vGnGMNkA30w5jAGx1GAYuc0Zx6pQpSNS3mHp4mWFYW312ap1thLE0MMo4VpFpuOsRdx4
         /g0eB08iHk5rt5DH/eY/aW8wy8iUiUxGheAo9L8xuAU6ykRiaNNPFy+fFvkgZUCgefjB
         /kMHybUo37yOoQVhel7hBoND+px9caGifn35hBZrALGYBP3HWz8dQyrsRHAgzguq2mn2
         hu4A==
X-Gm-Message-State: APjAAAUiba58oW1SR3+02bH2ym7Nuvhfo7/ZK5EtVkEm8mxWd/ZUMQn8
        QY3oi0Eo/E+z79Uxx89+t1yJQw==
X-Google-Smtp-Source: APXvYqx61Q5ijD7n7Msa4Yk7wnjy3PO7NaRoLanNXNHaTVeOVPLkcRICF53epznQywZG1c9aDGtNpQ==
X-Received: by 2002:a2e:8651:: with SMTP id i17mr2102549ljj.136.1566545700968;
        Fri, 23 Aug 2019 00:35:00 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 00:34:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 4/6 v2] drm/msm/hdmi: Convert to use GPIO descriptors
Date:   Fri, 23 Aug 2019 09:34:46 +0200
Message-Id: <20190823073448.8385-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This switches the MSM HDMI code to use GPIO descriptors.
Normally we would fetch the GPIOs from the device with the
flags GPIOD_IN or GPIOD_OUT_[LOW|HIGH] to set up the lines
immediately, but since the code seems eager to actively
drive the lines high/low when turning HDMI on and off, we
just fetch the GPIOs as-is and keep the code explicitly
driving them.

The old code would try legacy bindings (GPIOs without any
"-gpios" suffix) but this has been moved to the gpiolib
as a quirk by the previous patch.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v5.3-rc1
- Collected review tag
---
 drivers/gpu/drm/msm/hdmi/hdmi.c           | 66 +++++++++++------------
 drivers/gpu/drm/msm/hdmi/hdmi.h           |  4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 42 +++++----------
 3 files changed, 45 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 0e4217be3f00..355afb936401 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -425,38 +425,6 @@ static const struct {
 	{ "qcom,hdmi-tx-mux-lpm", true, 1, "HDMI_MUX_LPM" },
 };
 
-static int msm_hdmi_get_gpio(struct device_node *of_node, const char *name)
-{
-	int gpio;
-
-	/* try with the gpio names as in the table (downstream bindings) */
-	gpio = of_get_named_gpio(of_node, name, 0);
-	if (gpio < 0) {
-		char name2[32];
-
-		/* try with the gpio names as in the upstream bindings */
-		snprintf(name2, sizeof(name2), "%s-gpios", name);
-		gpio = of_get_named_gpio(of_node, name2, 0);
-		if (gpio < 0) {
-			char name3[32];
-
-			/*
-			 * try again after stripping out the "qcom,hdmi-tx"
-			 * prefix. This is mainly to match "hpd-gpios" used
-			 * in the upstream bindings
-			 */
-			if (sscanf(name2, "qcom,hdmi-tx-%s", name3))
-				gpio = of_get_named_gpio(of_node, name3, 0);
-		}
-
-		if (gpio < 0) {
-			DBG("failed to get gpio: %s (%d)", name, gpio);
-			gpio = -1;
-		}
-	}
-	return gpio;
-}
-
 /*
  * HDMI audio codec callbacks
  */
@@ -582,11 +550,39 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
 
 	for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
-		hdmi_cfg->gpios[i].num = msm_hdmi_get_gpio(of_node,
-						msm_hdmi_gpio_pdata[i].name);
+		const char *name = msm_hdmi_gpio_pdata[i].name;
+		struct gpio_desc *gpiod;
+
+		/*
+		 * We are fetching the GPIO lines "as is" since the connector
+		 * code is enabling and disabling the lines. Until that point
+		 * the power-on default value will be kept.
+		 */
+		gpiod = devm_gpiod_get_optional(dev, name, GPIOD_ASIS);
+		/* This will catch e.g. -PROBE_DEFER */
+		if (IS_ERR(gpiod))
+			return PTR_ERR(gpiod);
+		if (!gpiod) {
+			/* Try a second time, stripping down the name */
+			char name3[32];
+
+			/*
+			 * Try again after stripping out the "qcom,hdmi-tx"
+			 * prefix. This is mainly to match "hpd-gpios" used
+			 * in the upstream bindings.
+			 */
+			if (sscanf(name, "qcom,hdmi-tx-%s", name3))
+				gpiod = devm_gpiod_get_optional(dev, name3, GPIOD_ASIS);
+			if (IS_ERR(gpiod))
+				return PTR_ERR(gpiod);
+			if (!gpiod)
+				DBG("failed to get gpio: %s", name);
+		}
+		hdmi_cfg->gpios[i].gpiod = gpiod;
+		if (gpiod)
+			gpiod_set_consumer_name(gpiod, msm_hdmi_gpio_pdata[i].label);
 		hdmi_cfg->gpios[i].output = msm_hdmi_gpio_pdata[i].output;
 		hdmi_cfg->gpios[i].value = msm_hdmi_gpio_pdata[i].value;
-		hdmi_cfg->gpios[i].label = msm_hdmi_gpio_pdata[i].label;
 	}
 
 	dev->platform_data = hdmi_cfg;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 982865866a29..bdac452b00fb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
 #include <linux/hdmi.h>
 
 #include "msm_drv.h"
@@ -22,10 +23,9 @@ struct hdmi_phy;
 struct hdmi_platform_config;
 
 struct hdmi_gpio_data {
-	int num;
+	struct gpio_desc *gpiod;
 	bool output;
 	int value;
-	const char *label;
 };
 
 struct hdmi_audio {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index 07b4cb877d82..d0575d4f747d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -4,7 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "msm_kms.h"
@@ -68,30 +68,21 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 
 static int gpio_config(struct hdmi *hdmi, bool on)
 {
-	struct device *dev = &hdmi->pdev->dev;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int ret, i;
+	int i;
 
 	if (on) {
 		for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
 			struct hdmi_gpio_data gpio = config->gpios[i];
 
-			if (gpio.num != -1) {
-				ret = gpio_request(gpio.num, gpio.label);
-				if (ret) {
-					DRM_DEV_ERROR(dev,
-						"'%s'(%d) gpio_request failed: %d\n",
-						gpio.label, gpio.num, ret);
-					goto err;
-				}
-
+			if (gpio.gpiod) {
 				if (gpio.output) {
-					gpio_direction_output(gpio.num,
-							      gpio.value);
+					gpiod_direction_output(gpio.gpiod,
+							       gpio.value);
 				} else {
-					gpio_direction_input(gpio.num);
-					gpio_set_value_cansleep(gpio.num,
-								gpio.value);
+					gpiod_direction_input(gpio.gpiod);
+					gpiod_set_value_cansleep(gpio.gpiod,
+								 gpio.value);
 				}
 			}
 		}
@@ -101,29 +92,20 @@ static int gpio_config(struct hdmi *hdmi, bool on)
 		for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
 			struct hdmi_gpio_data gpio = config->gpios[i];
 
-			if (gpio.num == -1)
+			if (!gpio.gpiod)
 				continue;
 
 			if (gpio.output) {
 				int value = gpio.value ? 0 : 1;
 
-				gpio_set_value_cansleep(gpio.num, value);
+				gpiod_set_value_cansleep(gpio.gpiod, value);
 			}
-
-			gpio_free(gpio.num);
 		};
 
 		DBG("gpio off");
 	}
 
 	return 0;
-err:
-	while (i--) {
-		if (config->gpios[i].num != -1)
-			gpio_free(config->gpios[i].num);
-	}
-
-	return ret;
 }
 
 static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
@@ -311,7 +293,7 @@ static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
 	const struct hdmi_platform_config *config = hdmi->config;
 	struct hdmi_gpio_data hpd_gpio = config->gpios[HPD_GPIO_INDEX];
 
-	return gpio_get_value(hpd_gpio.num) ?
+	return gpiod_get_value(hpd_gpio.gpiod) ?
 			connector_status_connected :
 			connector_status_disconnected;
 }
@@ -330,7 +312,7 @@ static enum drm_connector_status hdmi_connector_detect(
 	 * some platforms may not have hpd gpio. Rely only on the status
 	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
 	 */
-	if (hpd_gpio.num == -1)
+	if (!hpd_gpio.gpiod)
 		return detect_reg(hdmi);
 
 	do {
-- 
2.21.0

