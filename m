Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB1629A8F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 09:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388420AbfHWHfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 03:35:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33728 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389265AbfHWHfG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 03:35:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id z17so7988355ljz.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZiXvXuEAB80JH4Izjr6bAOct54iEzBQ2GtzAaQY3rk=;
        b=fhuZt4UcPw1bSfjxRqNz+x/5kXt33QMeN67+VvZhvbEOmTSj1Faeyii4zpBlIx/md9
         4L90S3OBpsHUIUNG9LSJBM3fblGBV7uBek3dfGMIliNHM/XhtxwY4AqBYwHPTpt9usvm
         SncGQV2uykuVT03rhAhf8/B1k2Cs6Nge2fe1y1nQleSrxGYuC15a1cx33H7egG2Q1jfh
         e7hjwSwNZCJvcHJurOOQ92cC+WdTdDS0sx74wzf0KLsmkMBe4Qg3+n0R311jRcdj62ft
         aD6+jr6mc2uvK87tmDE5tJ+/GScdSTn4cAgL+S3PPol/ThWHRH5IWlzWkDC+IRXTUPrL
         H6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZiXvXuEAB80JH4Izjr6bAOct54iEzBQ2GtzAaQY3rk=;
        b=KwCVjJ1q2mi+iqElVgJPLXNIkw/86ML9hllKj6+5DVj91gaIgVac7pUAMeo3Ra+NRr
         2nqr9zzqITfLUCp7zDc9+oVXxOdHNmW+QROOJo0FV/IcbnUMgIyBy9pdrBPl6L/IoFr9
         rHKyshRucWMPMfP5oUdlJwYq3CDE5sz63Ic5OABL4nVBKyGycp1T76PVRU7EwngKw7+a
         5KIfpfFUw9qCx1VSdOWuOVyu8dkTXBRaSaYkgpQPZGybv18hFeiCakZ6y8hzEoVifNSH
         xskV2fg943DCerox7M9TnFx9SWOUGfSeiXlRTP/1EH+BBYSBzEN3NgE6MUZLgUG8rxJT
         DZyw==
X-Gm-Message-State: APjAAAXgA56xIENBu8Nl7qj2rK38T6PpFpjdy5ySAL46Whs0ONfEwqaD
        3FTapv/ZyviqCkwcXwNzv3cY1g==
X-Google-Smtp-Source: APXvYqwggeDlxFAPMMtQH3mwrmyGH02VY7NAKe26ctEF5h2N8nl5sVriLG9JqvdvB1+w9Xo94SbAjg==
X-Received: by 2002:a2e:8559:: with SMTP id u25mr1987921ljj.224.1566545703187;
        Fri, 23 Aug 2019 00:35:03 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 00:35:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 5/6 v2] drm/msm/hdmi: Bring up HDMI connector OFF
Date:   Fri, 23 Aug 2019 09:34:47 +0200
Message-Id: <20190823073448.8385-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
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
Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v5.3-rc1
- Collected review tag
---
 drivers/gpu/drm/msm/hdmi/hdmi.c           | 19 ++++++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 25 ++++++-----------------
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 355afb936401..5739eec65659 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -552,13 +552,22 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -572,7 +581,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 			 * in the upstream bindings.
 			 */
 			if (sscanf(name, "qcom,hdmi-tx-%s", name3))
-				gpiod = devm_gpiod_get_optional(dev, name3, GPIOD_ASIS);
+				gpiod = devm_gpiod_get_optional(dev, name3, flags);
 			if (IS_ERR(gpiod))
 				return PTR_ERR(gpiod);
 			if (!gpiod)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index d0575d4f747d..f006682935e9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -75,16 +75,9 @@ static int gpio_config(struct hdmi *hdmi, bool on)
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
@@ -92,16 +85,10 @@ static int gpio_config(struct hdmi *hdmi, bool on)
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
2.21.0

