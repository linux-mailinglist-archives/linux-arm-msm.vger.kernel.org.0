Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A4D439D23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 19:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbhJYRMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 13:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235084AbhJYRLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 13:11:34 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69931C061226
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:07:50 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so15812197otq.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+LfSjKmZZhCcN9vRI8268z9JnP7OYLp/3PjGoTQUAD0=;
        b=SYumq4bncnvY+DNH239fXF73TAOkyihvFIfQ9d4mCndMU7B/8bUMrhvf0kuPDCiSWc
         WFMFcfewkutdSBrN9sOo6xVsLSQwlQgVFfygHm/JbqyxxU0oPTsO9FPygG3spw6KsdVM
         kMbPdZbQhtUkocVi0osISBxOm+zavQ8OuqQLEP6bdNyZCg5+X8PlA2A2XFn2y8H4zZHx
         VY7PVv4qNNRlxeuwHqk/CJ0Y9Pk4TCyEmcr3xlBT3e30KiT8CEgvS2xxXv0VmGESEN+9
         LzIZ+zEWs1i8F6G0Nx+sQNBjUKu+pQm9Qg+V0bz83DC3uy0USkvz15o4T3vxQtHXPeXp
         MYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+LfSjKmZZhCcN9vRI8268z9JnP7OYLp/3PjGoTQUAD0=;
        b=3sQSI85CLfFdYMVJ5RpWco5EDp9e/5UwQQnd17eCLLRvoIvIUi1mgu1jDEK7CuNA0b
         Qik7VsFgeyCK7sq3XCo6v6gtnCOagc/a6MBam4tZXsgjcI3rT4F4Yukt2kSXZA7xpIr3
         nZTrTnOubRIUGODV75PoIueLyEL8pM6ojD4dXIEGYR59wTgt3xUn7AZ/m/nAnc6UfSMi
         cWrAbHaLTf8ZzdkGPAtGbWvOHTSDJoz3y4Am+cTT8BU6rklMH3+Nukl4moP+kn1ncskY
         IKhL1korp9ZvIEm+X40jb6zAH4y9phjUKcMFbRlxJ2iziI+l5ejNjhbQUBE+HnEBfBdc
         O7+A==
X-Gm-Message-State: AOAM530zSutoPKsHQEyxOt/HZgd9grUNwLfSuKqVdX0yD8iOqgzokU6q
        auBKh0L/JUbh0qYZ+MvDyCs6Tg==
X-Google-Smtp-Source: ABdhPJx/zc0rM4BCz/IK5OvMVUGaK83Kw/5i/82BGkK/Nx2wicd4CzYPrIai/AcUC3ENphrOCGjoQA==
X-Received: by 2002:a05:6830:2b28:: with SMTP id l40mr15621721otv.162.1635181669641;
        Mon, 25 Oct 2021 10:07:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id q2sm3076003ooe.12.2021.10.25.10.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 10:07:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 3/3] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Date:   Mon, 25 Oct 2021 10:09:25 -0700
Message-Id: <20211025170925.3096444-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211025170925.3096444-1-bjorn.andersson@linaro.org>
References: <20211025170925.3096444-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
with the primary purpose of controlling the backlight of the attached
panel. Add an implementation that exposes this using the standard PWM
framework, to allow e.g. pwm-backlight to expose this to the user.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- Updated comment to clarify T_pwm's relationship to PWM_FREQ
- "period" was used unassigned when compared with period_max

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 364 +++++++++++++++++++++++++-
 1 file changed, 358 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5b59d8dd3acd..430067a3071c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -4,7 +4,9 @@
  * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
  */
 
+#include <linux/atomic.h>
 #include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
@@ -15,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -91,6 +94,13 @@
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
+#define SN_PWM_PRE_DIV_REG			0xA0
+#define SN_BACKLIGHT_SCALE_REG			0xA1
+#define  BACKLIGHT_SCALE_MAX			0xFFFF
+#define SN_BACKLIGHT_REG			0xA3
+#define SN_PWM_EN_INV_REG			0xA5
+#define  SN_PWM_INV_MASK			BIT(0)
+#define  SN_PWM_EN_MASK				BIT(1)
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
@@ -113,11 +123,14 @@
 
 #define SN_LINK_TRAINING_TRIES		10
 
+#define SN_PWM_GPIO_IDX			3 /* 4th GPIO */
+
 /**
  * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
  * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
  * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
  * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
+ * @pwm_aux:      AUX-bus sub device for PWM controller functionality.
  *
  * @dev:          Pointer to the top level (i2c) device.
  * @regmap:       Regmap for accessing i2c.
@@ -145,11 +158,17 @@
  *                bitmap so we can do atomic ops on it without an extra
  *                lock so concurrent users of our 4 GPIOs don't stomp on
  *                each other's read-modify-write.
+ *
+ * @pchip:        pwm_chip if the PWM is exposed.
+ * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
+ * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
+ * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
  */
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
 	struct auxiliary_device		gpio_aux;
 	struct auxiliary_device		aux_aux;
+	struct auxiliary_device		pwm_aux;
 
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -172,6 +191,12 @@ struct ti_sn65dsi86 {
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
+#if defined(CONFIG_PWM)
+	struct pwm_chip			pchip;
+	bool				pwm_enabled;
+	atomic_t			pwm_pin_busy;
+#endif
+	unsigned int			pwm_refclk_freq;
 };
 
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
@@ -190,6 +215,21 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
+static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
+				 unsigned int reg, u16 *val)
+{
+	u8 buf[2];
+	int ret;
+
+	ret = regmap_bulk_read(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
+	if (ret)
+		return ret;
+
+	*val = buf[0] | (buf[1] << 8);
+
+	return 0;
+}
+
 static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
@@ -254,6 +294,12 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 
 	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
 			   REFCLK_FREQ(i));
+
+	/*
+	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
+	 * regardless of its actual sourcing.
+	 */
+	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
 }
 
 static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
@@ -1261,9 +1307,287 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
 };
 
 /* -----------------------------------------------------------------------------
- * GPIO Controller
+ * PWM Controller
  */
+#if defined(CONFIG_PWM)
+static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
+{
+	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
+}
+
+static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
+{
+	atomic_set(&pdata->pwm_pin_busy, 0);
+}
+
+static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
+{
+	return container_of(chip, struct ti_sn65dsi86, pchip);
+}
+
+static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
 
+	return ti_sn_pwm_pin_request(pdata);
+}
+
+static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+
+	ti_sn_pwm_pin_release(pdata);
+}
+
+/*
+ * Limitations:
+ * - The PWM signal is not driven when the chip is powered down, or in its
+ *   reset state and the driver does not implement the "suspend state"
+ *   described in the documentation. In order to save power, state->enabled is
+ *   interpreted as denoting if the signal is expected to be valid, and is used
+ *   to determine if the chip needs to be kept powered.
+ * - Changing both period and duty_cycle is not done atomically, neither is the
+ *   multi-byte register updates, so the output might briefly be undefined
+ *   during update.
+ */
+static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			   const struct pwm_state *state)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	unsigned int pwm_en_inv;
+	unsigned int backlight;
+	unsigned int pre_div;
+	unsigned int scale;
+	u64 period_max;
+	u64 period;
+	int ret;
+
+	if (!pdata->pwm_enabled) {
+		ret = pm_runtime_get_sync(pdata->dev);
+		if (ret < 0) {
+			pm_runtime_put_sync(pdata->dev);
+			return ret;
+		}
+	}
+
+	if (state->enabled) {
+		if (!pdata->pwm_enabled) {
+			/*
+			 * The chip might have been powered down while we
+			 * didn't hold a PM runtime reference, so mux in the
+			 * PWM function on the GPIO pin again.
+			 */
+			ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
+						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
+			if (ret) {
+				dev_err(pdata->dev, "failed to mux in PWM function\n");
+				goto out;
+			}
+		}
+
+		/*
+		 * Per the datasheet the PWM frequency is given by:
+		 *
+		 *                          REFCLK_FREQ
+		 *   PWM_FREQ = -----------------------------------
+		 *               PWM_PRE_DIV * BACKLIGHT_SCALE + 1
+		 *
+		 * However, after careful review the author is convinced that
+		 * the documentation has lost some parenthesis around
+		 * "BACKLIGHT_SCALE + 1".
+		 *
+		 * With the period T_pwm = 1/PWM_FREQ this can be written:
+		 *
+		 *   T_pwm * REFCLK_FREQ = PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)
+		 *
+		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
+		 * PWM_PRE_DIV must be:
+		 *
+		 *                     T_pwm * REFCLK_FREQ
+		 *   PWM_PRE_DIV >= -------------------------
+		 *                   BACKLIGHT_SCALE_MAX + 1
+		 *
+		 * To simplify the search and to favour higher resolution of
+		 * the duty cycle over accuracy of the period, the lowest
+		 * possible PWM_PRE_DIV is used. Finally the scale is
+		 * calculated as:
+		 *
+		 *                      T_pwm * REFCLK_FREQ
+		 *   BACKLIGHT_SCALE = ---------------------- - 1
+		 *                          PWM_PRE_DIV
+		 *
+		 * Here T_pwm is represented in seconds, so appropriate scaling
+		 * to nanoseconds is necessary.
+		 */
+
+		/* Minimum T_pwm is 1 / REFCLK_FREQ */
+		if (state->period <= NSEC_PER_SEC / pdata->pwm_refclk_freq) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
+		 * Limit period to this to avoid overflows
+		 */
+		period_max = div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1),
+				     pdata->pwm_refclk_freq);
+		period = min(state->period, period_max);
+
+		pre_div = DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
+					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
+		scale = div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
+
+		/*
+		 * The documentation has the duty ratio given as:
+		 *
+		 *     duty          BACKLIGHT
+		 *   ------- = ---------------------
+		 *    period    BACKLIGHT_SCALE + 1
+		 *
+		 * Solve for BACKLIGHT, substituting BACKLIGHT_SCALE according
+		 * to definition above and adjusting for nanosecond
+		 * representation of duty cycle gives us:
+		 */
+		backlight = div64_u64(state->duty_cycle * pdata->pwm_refclk_freq,
+				      (u64)NSEC_PER_SEC * pre_div);
+		if (backlight > scale)
+			backlight = scale;
+
+		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
+		if (ret) {
+			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
+			goto out;
+		}
+
+		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
+		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
+	}
+
+	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, state->enabled) |
+		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
+	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
+	if (ret) {
+		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
+		goto out;
+	}
+
+	pdata->pwm_enabled = state->enabled;
+out:
+
+	if (!pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+
+	return ret;
+}
+
+static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	unsigned int pwm_en_inv;
+	unsigned int pre_div;
+	u16 backlight;
+	u16 scale;
+	int ret;
+
+	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
+	if (ret)
+		return;
+
+	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
+	if (ret)
+		return;
+
+	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
+	if (ret)
+		return;
+
+	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
+	if (ret)
+		return;
+
+	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
+	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
+		state->polarity = PWM_POLARITY_INVERSED;
+	else
+		state->polarity = PWM_POLARITY_NORMAL;
+
+	state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * (scale + 1),
+					 pdata->pwm_refclk_freq);
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * backlight,
+					     pdata->pwm_refclk_freq);
+
+	if (state->duty_cycle > state->period)
+		state->duty_cycle = state->period;
+}
+
+static const struct pwm_ops ti_sn_pwm_ops = {
+	.request = ti_sn_pwm_request,
+	.free = ti_sn_pwm_free,
+	.apply = ti_sn_pwm_apply,
+	.get_state = ti_sn_pwm_get_state,
+	.owner = THIS_MODULE,
+};
+
+static int ti_sn_pwm_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	pdata->pchip.dev = pdata->dev;
+	pdata->pchip.ops = &ti_sn_pwm_ops;
+	pdata->pchip.npwm = 1;
+	pdata->pchip.of_xlate = of_pwm_single_xlate;
+	pdata->pchip.of_pwm_n_cells = 1;
+
+	return pwmchip_add(&pdata->pchip);
+}
+
+static void ti_sn_pwm_remove(struct auxiliary_device *adev)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	pwmchip_remove(&pdata->pchip);
+
+	if (pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+}
+
+static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {
+	{ .name = "ti_sn65dsi86.pwm", },
+	{},
+};
+
+static struct auxiliary_driver ti_sn_pwm_driver = {
+	.name = "pwm",
+	.probe = ti_sn_pwm_probe,
+	.remove = ti_sn_pwm_remove,
+	.id_table = ti_sn_pwm_id_table,
+};
+
+static int __init ti_sn_pwm_register(void)
+{
+	return auxiliary_driver_register(&ti_sn_pwm_driver);
+}
+
+static void ti_sn_pwm_unregister(void)
+{
+	auxiliary_driver_unregister(&ti_sn_pwm_driver);
+}
+
+#else
+static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
+static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
+
+static inline int ti_sn_pwm_register(void) { return 0; }
+static inline void ti_sn_pwm_unregister(void) {}
+#endif
+
+/* -----------------------------------------------------------------------------
+ * GPIO Controller
+ */
 #if defined(CONFIG_OF_GPIO)
 
 static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
@@ -1396,10 +1720,25 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 	return ret;
 }
 
+static int ti_sn_bridge_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
+
+	if (offset == SN_PWM_GPIO_IDX)
+		return ti_sn_pwm_pin_request(pdata);
+
+	return 0;
+}
+
 static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
+
 	/* We won't keep pm_runtime if we're input, so switch there on free */
 	ti_sn_bridge_gpio_direction_input(chip, offset);
+
+	if (offset == SN_PWM_GPIO_IDX)
+		ti_sn_pwm_pin_release(pdata);
 }
 
 static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
@@ -1421,6 +1760,7 @@ static int ti_sn_gpio_probe(struct auxiliary_device *adev,
 	pdata->gchip.owner = THIS_MODULE;
 	pdata->gchip.of_xlate = tn_sn_bridge_of_xlate;
 	pdata->gchip.of_gpio_n_cells = 2;
+	pdata->gchip.request = ti_sn_bridge_gpio_request;
 	pdata->gchip.free = ti_sn_bridge_gpio_free;
 	pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
 	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
@@ -1547,10 +1887,9 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	 * ordering. The bridge wants the panel to be there when it probes.
 	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
 	 * when it probes. The panel and maybe backlight might want the DDC
-	 * bus. Soon the PWM provided by the bridge chip will have the same
-	 * problem. Having sub-devices allows the some sub devices to finish
-	 * probing even if others return -EPROBE_DEFER and gets us around the
-	 * problems.
+	 * bus or the pwm_chip. Having sub-devices allows the some sub devices
+	 * to finish probing even if others return -EPROBE_DEFER and gets us
+	 * around the problems.
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
@@ -1559,6 +1898,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 			return ret;
 	}
 
+	if (IS_ENABLED(CONFIG_PWM)) {
+		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * NOTE: At the end of the AUX channel probe we'll add the aux device
 	 * for the bridge. This is because the bridge can't be used until the
@@ -1602,10 +1947,14 @@ static int __init ti_sn65dsi86_init(void)
 	if (ret)
 		goto err_main_was_registered;
 
-	ret = auxiliary_driver_register(&ti_sn_aux_driver);
+	ret = ti_sn_pwm_register();
 	if (ret)
 		goto err_gpio_was_registered;
 
+	ret = auxiliary_driver_register(&ti_sn_aux_driver);
+	if (ret)
+		goto err_pwm_was_registered;
+
 	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
 	if (ret)
 		goto err_aux_was_registered;
@@ -1614,6 +1963,8 @@ static int __init ti_sn65dsi86_init(void)
 
 err_aux_was_registered:
 	auxiliary_driver_unregister(&ti_sn_aux_driver);
+err_pwm_was_registered:
+	ti_sn_pwm_unregister();
 err_gpio_was_registered:
 	ti_sn_gpio_unregister();
 err_main_was_registered:
@@ -1627,6 +1978,7 @@ static void __exit ti_sn65dsi86_exit(void)
 {
 	auxiliary_driver_unregister(&ti_sn_bridge_driver);
 	auxiliary_driver_unregister(&ti_sn_aux_driver);
+	ti_sn_pwm_unregister();
 	ti_sn_gpio_unregister();
 	i2c_del_driver(&ti_sn65dsi86_driver);
 }
-- 
2.29.2

