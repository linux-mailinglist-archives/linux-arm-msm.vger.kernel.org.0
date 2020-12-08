Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D402D222C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 05:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgLHElF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 23:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgLHElF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 23:41:05 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592A1C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Dec 2020 20:40:25 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id h19so14804697otr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 20:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lzzz0sMutIoUKIzQvdI67+hBnQWL6SlfqnfoJgLUlFA=;
        b=kqpKQtKxze5fiE4No1wPcG5xifpJt+yNFjr9kVOtED0h2UKsrI2PlOLw2dZjfENx5H
         E7vZecSp0wQzv0yi8zTkJq9kXfBKC7Xm/0rRskz3KaZ6O1KK82YAd1aSc0YNXWEcCXG0
         NZyWo1+7l1Q+arh0BqLGjZxmoGe65tHk04WPUXHVqsO6RzDCTFTI6yQC44esolSfv5X5
         SDCxRXcU9M5OfRobG8bxrDcIp8rbWcI0J59pF6nGimL3sEELu3+SuvMT8lVL2RQH6fDW
         gbmdM4uo9YQb2JFN5mqzy6bISejuf+LLTbcGRx+xTSLD7Gdrkhh/nilknYBWQNtbCQoT
         7giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lzzz0sMutIoUKIzQvdI67+hBnQWL6SlfqnfoJgLUlFA=;
        b=btpBuyS5IGuqzY7WVjNKEUvbE5+XNulYqyqjgk89ohRNfPqXo16LkYlYc4Em4uPf8y
         LasPAwixHAbscUgTWPHkrqwyxNgFtlzfx8FGnSm43J/07m0a+2bfFKlOVfmHGi0qJv3J
         NKyhkboc0vnaR5j8PN5p/r3CPn8UMUHlPDkJz6njAjM4xfooMet7WU/UfYXHi3XBWk7Q
         pQguAd7klVUxWbSlnj30CF31dyvqpbxYVC9QdHeWAu3f8p+DL5C4mXVPZi2SvYSbXuiO
         n3L0NmM8v0VMU81qFrNYgfctm5iI+/r4PE/QKQT+NIvC8z0gc0ZlNWFmWZXe0r4lWjnZ
         RJzg==
X-Gm-Message-State: AOAM532zSFTnmBMnBBkko4TnAZThF3gDIhkjQ3nAH+hgwg8kS3j0NXzb
        dkXMMp1gtCkB1We+k8YSwVYhqg==
X-Google-Smtp-Source: ABdhPJwaCl9gy4RvQYgksIVVraGRUDlEsehe5DzfjHOyQ+m8sIrhXdmZt6l6FlEUG4ZAqsgEBV+poA==
X-Received: by 2002:a9d:72c4:: with SMTP id d4mr15744997otk.149.1607402424524;
        Mon, 07 Dec 2020 20:40:24 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t203sm1188995oib.34.2020.12.07.20.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 20:40:23 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Date:   Mon,  7 Dec 2020 22:40:22 -0600
Message-Id: <20201208044022.972872-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
with the primary purpose of controlling the backlight of the attached
panel. Add an implementation that exposes this using the standard PWM
framework, to allow e.g. pwm-backlight to expose this to the user.

Special thanks to Doug Anderson for suggestions related to the involved
math.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 202 ++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f27306c51e4d..43c0acba57ab 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -4,6 +4,7 @@
  * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
  */
 
+#include <linux/atomic.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
@@ -14,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -89,6 +91,11 @@
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
+#define SN_PWM_PRE_DIV_REG			0xA0
+#define SN_BACKLIGHT_SCALE_REG			0xA1
+#define  BACKLIGHT_SCALE_MAX			0xFFFF
+#define SN_BACKLIGHT_REG			0xA3
+#define SN_PWM_EN_INV_REG			0xA5
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
@@ -111,6 +118,8 @@
 
 #define SN_LINK_TRAINING_TRIES		10
 
+#define SN_PWM_GPIO			3
+
 /**
  * struct ti_sn_bridge - Platform data for ti-sn65dsi86 driver.
  * @dev:          Pointer to our device.
@@ -162,6 +171,12 @@ struct ti_sn_bridge {
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
+#if defined(CONFIG_PWM)
+	struct pwm_chip			pchip;
+	bool				pwm_enabled;
+	unsigned int			pwm_refclk;
+	atomic_t			pwm_pin_busy;
+#endif
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -499,6 +514,14 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
 
 	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
 			   REFCLK_FREQ(i));
+
+#if defined(CONFIG_PWM)
+	/*
+	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
+	 * regardless of its actual sourcing.
+	 */
+	pdata->pwm_refclk = ti_sn_bridge_refclk_lut[i];
+#endif
 }
 
 static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
@@ -981,6 +1004,161 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
 	return 0;
 }
 
+#if defined(CONFIG_PWM)
+static int ti_sn_pwm_pin_request(struct ti_sn_bridge *pdata)
+{
+	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
+}
+
+static void ti_sn_pwm_pin_release(struct ti_sn_bridge *pdata)
+{
+	atomic_set(&pdata->pwm_pin_busy, 0);
+}
+
+static struct ti_sn_bridge *
+pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
+{
+	return container_of(chip, struct ti_sn_bridge, pchip);
+}
+
+static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn_bridge *pdata = pwm_chip_to_ti_sn_bridge(chip);
+
+	return ti_sn_pwm_pin_request(pdata);
+}
+
+static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn_bridge *pdata = pwm_chip_to_ti_sn_bridge(chip);
+
+	ti_sn_pwm_pin_release(pdata);
+}
+
+static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			   const struct pwm_state *state)
+{
+	struct ti_sn_bridge *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	unsigned int pwm_en_inv;
+	unsigned int backlight;
+	unsigned int pwm_freq;
+	unsigned int pre_div;
+	unsigned int scale;
+	int ret;
+
+	if (!pdata->pwm_enabled) {
+		ret = pm_runtime_get_sync(pdata->dev);
+		if (ret < 0)
+			return ret;
+
+		ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+					 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO),
+					 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO));
+		if (ret) {
+			dev_err(pdata->dev, "failed to mux in PWM function\n");
+			goto out;
+		}
+	}
+
+	if (state->enabled) {
+		/*
+		 * Per the datasheet the PWM frequency is given by:
+		 *
+		 * PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
+		 *
+		 * In order to find the PWM_FREQ that best suits the requested
+		 * state->period, the PWM_PRE_DIV is calculated with the
+		 * maximum possible number of steps (BACKLIGHT_SCALE_MAX). The
+		 * actual BACKLIGHT_SCALE is then adjusted down to match the
+		 * requested period.
+		 *
+		 * The BACKLIGHT value is then calculated against the
+		 * BACKLIGHT_SCALE, based on the requested duty_cycle and
+		 * period.
+		 */
+		pwm_freq = NSEC_PER_SEC / state->period;
+		pre_div = DIV_ROUND_UP(pdata->pwm_refclk / pwm_freq - 1, BACKLIGHT_SCALE_MAX);
+		scale = (pdata->pwm_refclk / pwm_freq - 1) / pre_div;
+
+		backlight = scale * state->duty_cycle / state->period;
+
+		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
+		if (ret) {
+			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
+			goto out;
+		}
+
+		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
+		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
+	}
+
+	pwm_en_inv = FIELD_PREP(BIT(1), !!state->enabled) |
+		     FIELD_PREP(BIT(0), state->polarity == PWM_POLARITY_INVERSED);
+	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
+	if (ret) {
+		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
+		goto out;
+	}
+
+	pdata->pwm_enabled = !!state->enabled;
+out:
+
+	if (!pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+
+	return ret;
+}
+
+static const struct pwm_ops ti_sn_pwm_ops = {
+	.request = ti_sn_pwm_request,
+	.free = ti_sn_pwm_free,
+	.apply = ti_sn_pwm_apply,
+	.owner = THIS_MODULE,
+};
+
+static struct pwm_device *ti_sn_pwm_of_xlate(struct pwm_chip *pc,
+					     const struct of_phandle_args *args)
+{
+	struct pwm_device *pwm;
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	pwm = pwm_request_from_chip(pc, 0, NULL);
+	if (IS_ERR(pwm))
+		return pwm;
+
+	pwm->args.period = args->args[0];
+
+	return pwm;
+}
+
+static int ti_sn_setup_pwmchip(struct ti_sn_bridge *pdata)
+{
+	pdata->pchip.dev = pdata->dev;
+	pdata->pchip.ops = &ti_sn_pwm_ops;
+	pdata->pchip.base = -1;
+	pdata->pchip.npwm = 1;
+	pdata->pchip.of_xlate = ti_sn_pwm_of_xlate;
+	pdata->pchip.of_pwm_n_cells = 1;
+
+	return pwmchip_add(&pdata->pchip);
+}
+
+static void ti_sn_remove_pwmchip(struct ti_sn_bridge *pdata)
+{
+	pwmchip_remove(&pdata->pchip);
+
+	if (pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+}
+#else
+static int ti_sn_pwm_pin_request(struct ti_sn_bridge *pdata) { return 0; }
+static void ti_sn_pwm_pin_release(struct ti_sn_bridge *pdata) {}
+static int ti_sn_setup_pwmchip(struct ti_sn_bridge *pdata) { return 0; }
+static void ti_sn_remove_pwmchip(struct ti_sn_bridge *pdata) {}
+#endif
+
 #if defined(CONFIG_OF_GPIO)
 
 static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
@@ -1113,10 +1291,25 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 	return ret;
 }
 
+static int ti_sn_bridge_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+
+	if (offset == SN_PWM_GPIO)
+		return ti_sn_pwm_pin_request(pdata);
+
+	return 0;
+}
+
 static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
+	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+
 	/* We won't keep pm_runtime if we're input, so switch there on free */
 	ti_sn_bridge_gpio_direction_input(chip, offset);
+
+	if (offset == SN_PWM_GPIO)
+		ti_sn_pwm_pin_release(pdata);
 }
 
 static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
@@ -1136,6 +1329,7 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
 	pdata->gchip.owner = THIS_MODULE;
 	pdata->gchip.of_xlate = tn_sn_bridge_of_xlate;
 	pdata->gchip.of_gpio_n_cells = 2;
+	pdata->gchip.request = ti_sn_bridge_gpio_request;
 	pdata->gchip.free = ti_sn_bridge_gpio_free;
 	pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
 	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
@@ -1282,6 +1476,12 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ret = ti_sn_setup_pwmchip(pdata);
+	if (ret)  {
+		pm_runtime_disable(pdata->dev);
+		return ret;
+	}
+
 	i2c_set_clientdata(client, pdata);
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
@@ -1320,6 +1520,8 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&pdata->bridge);
 
+	ti_sn_remove_pwmchip(pdata);
+
 	return 0;
 }
 
-- 
2.29.2

