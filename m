Return-Path: <linux-arm-msm+bounces-74112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A2B871AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 23:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718935827BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 21:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C072FC036;
	Thu, 18 Sep 2025 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbjLujjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D912FC01A;
	Thu, 18 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230458; cv=none; b=mZYcbzYDjQTior2HJG+t80K1cQ9vPFqAJJ1b5tA98P70cDL5aeoT6Ej2AaNnDKZkjun9geWKrxHPR4R+WkvafkAXly2Cla1uiw97O6sD+yA5+KMkVsaEiwtPNc0AtS5YOdqG1hqL4XANwuiUnPeGFgfrTxDUpHtKiMBd9Ne4y2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230458; c=relaxed/simple;
	bh=t3Hrq1vH5oFAZde+Y/gsISFwzja0VWag27pu6H1Ht88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGp4drFzT2a/O2jEE2bXk4K7pB69kHgBYdLgPWn+GK0frv/5V5kkTXjtx9tGi3zsbzUor2tgdEJE9xgRfruMsQqCE2iES0h/jvMgGZW3SzYHbOLavsZOvhyzXfs/iAKLfHAuAX6vGsLPG0jBpSG4QQ+vAkvrqZKT5Bpqtc1ss9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbjLujjn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB18DC4CEE7;
	Thu, 18 Sep 2025 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758230457;
	bh=t3Hrq1vH5oFAZde+Y/gsISFwzja0VWag27pu6H1Ht88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BbjLujjnqGFtddI2ZIWrpQHorOygbOvTdAB/N441Wgy6nBqqFuMViBlHd8HSoT7tP
	 7MHAcgyZEZGBkwO9DNC5o8ArgcW7Jy1QpKm8OoZHPKGy5/XwbNBUfyaxMaOq8uw1jh
	 fTAAzcFu1Gb3CHovOEm/GWoHmWo6XlGD7n8VgMD1X6yWlsNrQCPhd9rg2rqllmxw7T
	 wJQoCte6Q6VvNuXXsi/nor0UHJ8JhkBGTA08NnF2nYtTqS2htdg8NUVau957wic2hP
	 xVEG2JKHCVOGmMGCV5cKMnLDvGZRBJNwZGZVh/mnDxDTezSTsqRT4Zsl6Bls7TL5AR
	 aTFywDhaeBM3w==
Received: by venus (Postfix, from userid 1000)
	id 29129180F79; Thu, 18 Sep 2025 23:20:50 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Thu, 18 Sep 2025 23:20:27 +0200
Subject: [PATCH v5 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-thinkpad-t14s-ec-v5-2-ac0bc6382c5c@collabora.com>
References: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
In-Reply-To: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21495;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t3Hrq1vH5oFAZde+Y/gsISFwzja0VWag27pu6H1Ht88=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBozHexUUZcqZjRBmsyI0jAyZ3DeS17G8L1l0yJU
 daTMKQi4mqJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaMx3sQAKCRDY7tfzyDv6
 miBmD/4/xO7+AZq0rzUUCsFea7LRwJek+4m+jPZ2hMOuJxTvdyTewHVTcLRzqCDZGFOYgBqBwgL
 HKTiarp7DJ/83JXnafGHGA2VK7Yozeb/IJ0/xJLC1QDV4TKX3no2yMJLzYTM+CeSDc8iMLaSYWO
 dJnyISE+COHr4QqPOjApq2DOMeWSgDXt6O0cSGJjNueJe7GH6F3DZjwAVZPLcKdFm+jD2P1tjam
 RJiU+54PA/b+koCTo22/fN5wcKi1a9X5snNIqfjldBqBtJWse9hBE7U9bhf9YUWDYPjezG4yAp3
 2CdGWkzXKzY4a/BBIbeD1YJcLcYUY/uCRgdyx6GMjPXcZfW9XUeTxJYkhxqHIYd96MUDLIPG79g
 oyV43a8YLGf+9o/tQAmkpzbW2985yFzCn5gcKS1mz6irwvvTSx5ztYo454oqcewnTZauGA/fxEa
 9sJE8kzeYRcjg9avcxRhpIJb/3wRWyU8Z5Y68KxWqMXYhxuTDflPhNCgG8pwOyKmG3BY37M/IXl
 0K8D9kIho9+sZHbnZXeGOJIIYK3G6phyv+37hy1QHnWBUlt9FZaAuvg9+8YG1lvkt9hS4ZQiJms
 +tL2Q2dvFocmsMpGo/u8rLJHI2/QJROtJzTbHZ4PmySQE0gzcCH2Fr1oF3/Yhh95ZZ0F4wpFrX5
 XrY82P7FNWE0gDQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which is in
theory compatible with ThinkPad ACPI. On Linux the system is booted with
device tree, which is not supported by the ThinkPad ACPI driver
(drivers/platform/x86/lenovo/thinkpad_acpi.c). Also most of the hardware
compatibility is handled via ACPI tables, which are obviously not used
when booting via device tree. Thus adding DT compatibility to the
existing driver is not worth it as there is almost no code sharing.

The driver currently exposes features, which are not available
via other means:

 * Extra Keys
 * System LEDs
 * Keyboard Backlight Control

The driver has been developed by reading the ACPI DSDT. There
are some more features around thermal control, which are not
yet supported by the driver.

The speaker mute and mic mute LEDs need some additional changes
in the ALSA UCM to be set automatically.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 MAINTAINERS                                   |   6 +
 drivers/platform/arm64/Kconfig                |  20 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 616 ++++++++++++++++++++++++++
 4 files changed, 643 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6206963efbf0bdbe3efb9ad818637fc090d487f..5795323291b3a6b8e1d704f2242896bb008009a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25102,6 +25102,12 @@ W:	http://thinkwiki.org/wiki/Ibm-acpi
 T:	git git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git
 F:	drivers/platform/x86/lenovo/thinkpad_acpi.c
 
+THINKPAD T14S EMBEDDED CONTROLLER DRIVER
+M:	Sebastian Reichel <sre@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml
+F:	drivers/platform/arm64/lenovo-thinkpad-t14s.c
+
 THINKPAD LMI DRIVER
 M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 06288aebc5599435065a37f8dacd046b5def80bd..10f905d7d6bfa5fad30a0689d3a20481268c781e 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -70,4 +70,24 @@ config EC_LENOVO_YOGA_C630
 
 	  Say M or Y here to include this support.
 
+config EC_LENOVO_THINKPAD_T14S
+	tristate "Lenovo Thinkpad T14s Embedded Controller driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
+	select NEW_LEDS
+	select SND_CTL_LED if SND
+	help
+	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
+	  Lenovo Thinkpad T14s, which provides access to keyboard backlight
+	  and status LEDs.
+
+	  This driver provides support for the mentioned laptop where this
+	  information is not properly exposed via the standard Qualcomm
+	  devices.
+
+	  Say M or Y here to include this support.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 46a99eba3264cc40e812567d1533bb86031a6af3..60c131cff6a15bb51a49c9edab95badf513ee0f6 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -8,3 +8,4 @@
 obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
+obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
new file mode 100644
index 0000000000000000000000000000000000000000..f721763e13cc8aedceb615b9b2c07e54fd6db108
--- /dev/null
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -0,0 +1,616 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Sebastian Reichel
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/interrupt.h>
+#include <linux/leds.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define T14S_EC_CMD_ECRD	0x02
+#define T14S_EC_CMD_ECWR	0x03
+#define T14S_EC_CMD_EVT		0xf0
+
+#define T14S_EC_REG_LED		0x0c
+#define T14S_EC_REG_KBD_BL1	0x0d
+#define T14S_EC_REG_KBD_BL2	0xe1
+#define T14S_EC_KBD_BL1_MASK	GENMASK_U8(7, 6)
+#define T14S_EC_KBD_BL2_MASK	GENMASK_U8(3, 2)
+#define T14S_EC_REG_AUD		0x30
+#define T14S_EC_MIC_MUTE_LED	BIT(5)
+#define T14S_EC_SPK_MUTE_LED	BIT(6)
+
+#define T14S_EC_EVT_NONE			0x00
+#define T14S_EC_EVT_KEY_FN_4			0x13
+#define T14S_EC_EVT_KEY_FN_F7			0x16
+#define T14S_EC_EVT_KEY_FN_SPACE		0x1f
+#define T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
+#define T14S_EC_EVT_AC_CONNECTED		0x26
+#define T14S_EC_EVT_AC_DISCONNECTED		0x27
+#define T14S_EC_EVT_KEY_POWER			0x28
+#define T14S_EC_EVT_LID_OPEN			0x2a
+#define T14S_EC_EVT_LID_CLOSED			0x2b
+#define T14S_EC_EVT_THERMAL_TZ40		0x5c
+#define T14S_EC_EVT_THERMAL_TZ42		0x5d
+#define T14S_EC_EVT_THERMAL_TZ39		0x5e
+#define T14S_EC_EVT_KEY_FN_F12			0x62
+#define T14S_EC_EVT_KEY_FN_TAB			0x63
+#define T14S_EC_EVT_KEY_FN_F8			0x64
+#define T14S_EC_EVT_KEY_FN_F10			0x65
+#define T14S_EC_EVT_KEY_FN_F4			0x6a
+#define T14S_EC_EVT_KEY_FN_D			0x6b
+#define T14S_EC_EVT_KEY_FN_T			0x6c
+#define T14S_EC_EVT_KEY_FN_H			0x6d
+#define T14S_EC_EVT_KEY_FN_M			0x6e
+#define T14S_EC_EVT_KEY_FN_L			0x6f
+#define T14S_EC_EVT_KEY_FN_RIGHT_SHIFT		0x71
+#define T14S_EC_EVT_KEY_FN_ESC			0x74
+#define T14S_EC_EVT_KEY_FN_N			0x79
+#define T14S_EC_EVT_KEY_FN_F11			0x7a
+#define T14S_EC_EVT_KEY_FN_G			0x7e
+
+/* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
+#define T14S_EC_BLINK_RATE_ON_OFF_MS		500
+
+/*
+ * Add a virtual offset on all key event codes for sparse keymap handling,
+ * since the sparse keymap infrastructure does not map some raw key event
+ * codes used by the EC. For example 0x16 (T14S_EC_EVT_KEY_FN_F7) is mapped
+ * to KEY_MUTE if no offset is applied.
+ */
+#define T14S_EC_KEY_EVT_OFFSET			0x1000
+#define T14S_EC_KEY_ENTRY(key, value) \
+	{ KE_KEY, T14S_EC_KEY_EVT_OFFSET + T14S_EC_EVT_KEY_##key, { value } }
+
+enum t14s_ec_led_status_t {
+	T14S_EC_LED_OFF =	0x00,
+	T14S_EC_LED_ON =	0x80,
+	T14S_EC_LED_BLINK =	0xc0,
+};
+
+struct t14s_ec_led_classdev {
+	struct led_classdev led_classdev;
+	int led;
+	enum t14s_ec_led_status_t cache;
+	struct t14s_ec *ec;
+};
+
+struct t14s_ec {
+	struct regmap *regmap;
+	struct device *dev;
+	struct t14s_ec_led_classdev led_pwr_btn;
+	struct t14s_ec_led_classdev led_chrg_orange;
+	struct t14s_ec_led_classdev led_chrg_white;
+	struct t14s_ec_led_classdev led_lid_logo_dot;
+	struct led_classdev kbd_backlight;
+	struct led_classdev led_mic_mute;
+	struct led_classdev led_spk_mute;
+	struct input_dev *inputdev;
+};
+
+static const struct regmap_config t14s_ec_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+};
+
+static int t14s_ec_write(void *context, unsigned int reg,
+				  unsigned int val)
+{
+	struct t14s_ec *ec = context;
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	u8 buf[5] = {T14S_EC_CMD_ECWR, reg, 0x00, 0x01, val};
+	int ret;
+
+	ret = i2c_master_send(client, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int t14s_ec_read(void *context, unsigned int reg,
+				 unsigned int *val)
+{
+	struct t14s_ec *ec = context;
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	u8 buf[4] = {T14S_EC_CMD_ECRD, reg, 0x00, 0x01};
+	struct i2c_msg request, response;
+	u8 result;
+	int ret;
+
+	request.addr = client->addr;
+	request.flags = I2C_M_STOP;
+	request.len = sizeof(buf);
+	request.buf = buf;
+	response.addr = client->addr;
+	response.flags = I2C_M_RD;
+	response.len = 1;
+	response.buf = &result;
+
+	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
+
+	ret = __i2c_transfer(client->adapter, &request, 1);
+	if (ret < 0)
+		goto out;
+
+	ret = __i2c_transfer(client->adapter, &response, 1);
+	if (ret < 0)
+		goto out;
+
+	*val = result;
+	ret = 0;
+
+out:
+	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+	return ret;
+}
+
+static const struct regmap_bus t14s_ec_regmap_bus = {
+	.reg_write = t14s_ec_write,
+	.reg_read = t14s_ec_read,
+};
+
+static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
+{
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	u8 buf[4] = {T14S_EC_CMD_EVT, 0x00, 0x00, 0x01};
+	struct i2c_msg request, response;
+	int ret;
+
+	request.addr = client->addr;
+	request.flags = I2C_M_STOP;
+	request.len = sizeof(buf);
+	request.buf = buf;
+	response.addr = client->addr;
+	response.flags = I2C_M_RD;
+	response.len = 1;
+	response.buf = val;
+
+	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
+
+	ret = __i2c_transfer(client->adapter, &request, 1);
+	if (ret < 0)
+		goto out;
+
+	ret = __i2c_transfer(client->adapter, &response, 1);
+	if (ret < 0)
+		goto out;
+
+	ret = 0;
+
+out:
+	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+	return ret;
+}
+
+static int t14s_led_set_status(struct t14s_ec *ec,
+			       struct t14s_ec_led_classdev *led,
+			       const enum t14s_ec_led_status_t ledstatus)
+{
+	int ret;
+
+	ret = regmap_write(ec->regmap, T14S_EC_REG_LED,
+			   led->led | ledstatus);
+	if (ret < 0)
+		return ret;
+
+	led->cache = ledstatus;
+	return 0;
+}
+
+static int t14s_led_brightness_set(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
+{
+	struct t14s_ec_led_classdev *led = container_of(led_cdev,
+				struct t14s_ec_led_classdev, led_classdev);
+	enum t14s_ec_led_status_t new_state;
+
+	if (brightness == LED_OFF)
+		new_state = T14S_EC_LED_OFF;
+	else if (led->cache == T14S_EC_LED_BLINK)
+		new_state = T14S_EC_LED_BLINK;
+	else
+		new_state = T14S_EC_LED_ON;
+
+	return t14s_led_set_status(led->ec, led, new_state);
+}
+
+static int t14s_led_blink_set(struct led_classdev *led_cdev,
+			      unsigned long *delay_on,
+			      unsigned long *delay_off)
+{
+	struct t14s_ec_led_classdev *led = container_of(led_cdev,
+				struct t14s_ec_led_classdev, led_classdev);
+
+	if (*delay_on == 0 && *delay_off == 0) {
+		/* Userspace does not provide a blink rate; we can choose it */
+		*delay_on = T14S_EC_BLINK_RATE_ON_OFF_MS;
+		*delay_off = T14S_EC_BLINK_RATE_ON_OFF_MS;
+	} else if ((*delay_on != T14S_EC_BLINK_RATE_ON_OFF_MS) ||
+		   (*delay_off != T14S_EC_BLINK_RATE_ON_OFF_MS))
+		return -EINVAL;
+
+	return t14s_led_set_status(led->ec, led, T14S_EC_LED_BLINK);
+}
+
+static int t14s_init_led(struct t14s_ec *ec, struct t14s_ec_led_classdev *led,
+			 u8 id, const char *name)
+{
+	led->led_classdev.name = name;
+	led->led_classdev.flags = LED_RETAIN_AT_SHUTDOWN;
+	led->led_classdev.max_brightness = 1;
+	led->led_classdev.brightness_set_blocking = t14s_led_brightness_set;
+	led->led_classdev.blink_set = t14s_led_blink_set;
+	led->ec = ec;
+	led->led = id;
+
+	return devm_led_classdev_register(ec->dev, &led->led_classdev);
+}
+
+static int t14s_leds_probe(struct t14s_ec *ec)
+{
+	int ret;
+
+	ret = t14s_init_led(ec, &ec->led_pwr_btn, 0, "platform::power");
+	if (ret)
+		return ret;
+
+	ret = t14s_init_led(ec, &ec->led_chrg_orange, 1,
+			    "platform:amber:battery-charging");
+	if (ret)
+		return ret;
+
+	ret = t14s_init_led(ec, &ec->led_chrg_white, 2,
+			    "platform:white:battery-full");
+	if (ret)
+		return ret;
+
+	ret = t14s_init_led(ec, &ec->led_lid_logo_dot, 10,
+			    "platform::lid_logo_dot");
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int t14s_kbd_bl_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
+{
+	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
+					  kbd_backlight);
+	int ret;
+	u8 val;
+
+	val = FIELD_PREP(T14S_EC_KBD_BL1_MASK, brightness);
+	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL1,
+				 T14S_EC_KBD_BL1_MASK, val);
+	if (ret < 0)
+		return ret;
+
+	val = FIELD_PREP(T14S_EC_KBD_BL2_MASK, brightness);
+	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL2,
+				 T14S_EC_KBD_BL2_MASK, val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static enum led_brightness t14s_kbd_bl_get(struct led_classdev *led_cdev)
+{
+	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
+					  kbd_backlight);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(ec->regmap, T14S_EC_REG_KBD_BL1, &val);
+	if (ret < 0)
+		return ret;
+
+	return FIELD_GET(T14S_EC_KBD_BL1_MASK, val);
+}
+
+static void t14s_kbd_bl_update(struct t14s_ec *ec)
+{
+	enum led_brightness brightness = t14s_kbd_bl_get(&ec->kbd_backlight);
+
+	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, brightness);
+}
+
+static int t14s_kbd_backlight_probe(struct t14s_ec *ec)
+{
+	ec->kbd_backlight.name = "platform::kbd_backlight";
+	ec->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
+	ec->kbd_backlight.max_brightness = 2;
+	ec->kbd_backlight.brightness_set_blocking = t14s_kbd_bl_set;
+	ec->kbd_backlight.brightness_get = t14s_kbd_bl_get;
+
+	return devm_led_classdev_register(ec->dev, &ec->kbd_backlight);
+}
+
+static enum led_brightness t14s_audio_led_get(struct t14s_ec *ec, u8 led_bit)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(ec->regmap, T14S_EC_REG_AUD, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & led_bit) ? LED_ON : LED_OFF;
+}
+
+static enum led_brightness t14s_audio_led_set(struct t14s_ec *ec,
+						       u8 led_mask,
+						       enum led_brightness brightness)
+{
+	return regmap_assign_bits(ec->regmap, T14S_EC_REG_AUD, led_mask, brightness > 0);
+}
+
+static enum led_brightness t14s_mic_mute_led_get(struct led_classdev *led_cdev)
+{
+	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
+					  led_mic_mute);
+
+	return t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
+}
+
+static int t14s_mic_mute_led_set(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
+					  led_mic_mute);
+
+	return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
+}
+
+static enum led_brightness t14s_spk_mute_led_get(struct led_classdev *led_cdev)
+{
+	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
+					  led_spk_mute);
+
+	return t14s_audio_led_get(ec, T14S_EC_SPK_MUTE_LED);
+}
+
+static int t14s_spk_mute_led_set(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
+					  led_spk_mute);
+
+	return t14s_audio_led_set(ec, T14S_EC_SPK_MUTE_LED, brightness);
+}
+
+static int t14s_kbd_audio_led_probe(struct t14s_ec *ec)
+{
+	int ret;
+
+	ec->led_mic_mute.name = "platform::micmute";
+	ec->led_mic_mute.max_brightness = 1,
+	ec->led_mic_mute.default_trigger = "audio-micmute",
+	ec->led_mic_mute.brightness_set_blocking = t14s_mic_mute_led_set;
+	ec->led_mic_mute.brightness_get = t14s_mic_mute_led_get;
+
+	ec->led_spk_mute.name = "platform::mute";
+	ec->led_spk_mute.max_brightness = 1,
+	ec->led_spk_mute.default_trigger = "audio-mute",
+	ec->led_spk_mute.brightness_set_blocking = t14s_spk_mute_led_set;
+	ec->led_spk_mute.brightness_get = t14s_spk_mute_led_get;
+
+	ret = devm_led_classdev_register(ec->dev, &ec->led_mic_mute);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register(ec->dev, &ec->led_spk_mute);
+}
+
+static const struct key_entry t14s_keymap[] = {
+	T14S_EC_KEY_ENTRY(FN_4, KEY_SLEEP),
+	T14S_EC_KEY_ENTRY(FN_N, KEY_VENDOR),
+	T14S_EC_KEY_ENTRY(FN_F4, KEY_MICMUTE),
+	T14S_EC_KEY_ENTRY(FN_F7, KEY_SWITCHVIDEOMODE),
+	T14S_EC_KEY_ENTRY(FN_F8, KEY_PERFORMANCE),
+	T14S_EC_KEY_ENTRY(FN_F10, KEY_SELECTIVE_SCREENSHOT),
+	T14S_EC_KEY_ENTRY(FN_F11, KEY_LINK_PHONE),
+	T14S_EC_KEY_ENTRY(FN_F12, KEY_BOOKMARKS),
+	T14S_EC_KEY_ENTRY(FN_SPACE, KEY_KBDILLUMTOGGLE),
+	T14S_EC_KEY_ENTRY(FN_ESC, KEY_FN_ESC),
+	T14S_EC_KEY_ENTRY(FN_TAB, KEY_ZOOM),
+	T14S_EC_KEY_ENTRY(FN_RIGHT_SHIFT, KEY_FN_RIGHT_SHIFT),
+	T14S_EC_KEY_ENTRY(TP_DOUBLE_TAP, KEY_PROG4),
+	{ KE_END }
+};
+
+static int t14s_input_probe(struct t14s_ec *ec)
+{
+	int ret;
+
+	ec->inputdev = devm_input_allocate_device(ec->dev);
+	if (!ec->inputdev)
+		return -ENOMEM;
+
+	ec->inputdev->name = "ThinkPad Extra Buttons";
+	ec->inputdev->phys = "thinkpad/input0";
+	ec->inputdev->id.bustype = BUS_HOST;
+	ec->inputdev->dev.parent = ec->dev;
+
+	ret = sparse_keymap_setup(ec->inputdev, t14s_keymap, NULL);
+	if (ret)
+		return ret;
+
+	return input_register_device(ec->inputdev);
+}
+
+static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
+{
+	struct t14s_ec *ec = data;
+	int ret;
+	u8 val;
+
+	ret = t14s_ec_read_evt(ec, &val);
+	if (ret < 0) {
+		dev_err(ec->dev, "Failed to read event\n");
+		return IRQ_HANDLED;
+	}
+
+	switch (val) {
+	case T14S_EC_EVT_NONE:
+		break;
+	case T14S_EC_EVT_KEY_FN_SPACE:
+		t14s_kbd_bl_update(ec);
+		fallthrough;
+	case T14S_EC_EVT_KEY_FN_F4:
+	case T14S_EC_EVT_KEY_FN_F7:
+	case T14S_EC_EVT_KEY_FN_4:
+	case T14S_EC_EVT_KEY_FN_F8:
+	case T14S_EC_EVT_KEY_FN_F12:
+	case T14S_EC_EVT_KEY_FN_TAB:
+	case T14S_EC_EVT_KEY_FN_F10:
+	case T14S_EC_EVT_KEY_FN_N:
+	case T14S_EC_EVT_KEY_FN_F11:
+	case T14S_EC_EVT_KEY_FN_ESC:
+	case T14S_EC_EVT_KEY_FN_RIGHT_SHIFT:
+	case T14S_EC_EVT_KEY_TP_DOUBLE_TAP:
+		sparse_keymap_report_event(ec->inputdev,
+				T14S_EC_KEY_EVT_OFFSET + val, 1, true);
+		break;
+	case T14S_EC_EVT_AC_CONNECTED:
+		dev_dbg(ec->dev, "AC connected\n");
+		break;
+	case T14S_EC_EVT_AC_DISCONNECTED:
+		dev_dbg(ec->dev, "AC disconnected\n");
+		break;
+	case T14S_EC_EVT_KEY_POWER:
+		dev_dbg(ec->dev, "power button\n");
+		break;
+	case T14S_EC_EVT_LID_OPEN:
+		dev_dbg(ec->dev, "LID open\n");
+		break;
+	case T14S_EC_EVT_LID_CLOSED:
+		dev_dbg(ec->dev, "LID closed\n");
+		break;
+	case T14S_EC_EVT_THERMAL_TZ40:
+		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
+		break;
+	case T14S_EC_EVT_THERMAL_TZ42:
+		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
+		break;
+	case T14S_EC_EVT_THERMAL_TZ39:
+		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
+		break;
+	case T14S_EC_EVT_KEY_FN_G:
+		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
+		break;
+	case T14S_EC_EVT_KEY_FN_L:
+		dev_dbg(ec->dev, "FN + L - low performance mode\n");
+		break;
+	case T14S_EC_EVT_KEY_FN_M:
+		dev_dbg(ec->dev, "FN + M - medium performance mode\n");
+		break;
+	case T14S_EC_EVT_KEY_FN_H:
+		dev_dbg(ec->dev, "FN + H - high performance mode\n");
+		break;
+	case T14S_EC_EVT_KEY_FN_T:
+		dev_dbg(ec->dev, "FN + T - toggle intelligent cooling mode\n");
+		break;
+	case T14S_EC_EVT_KEY_FN_D:
+		dev_dbg(ec->dev, "FN + D - toggle privacy guard mode\n");
+		break;
+	default:
+		dev_info(ec->dev, "Unknown EC event: 0x%02x\n", val);
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int t14s_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct t14s_ec *ec;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->dev = dev;
+
+	ec->regmap = devm_regmap_init(dev, &t14s_ec_regmap_bus,
+				      ec, &t14s_ec_regmap_config);
+	if (IS_ERR(ec->regmap))
+		return dev_err_probe(dev, PTR_ERR(ec->regmap),
+				     "Failed to init regmap\n");
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					t14s_ec_irq_handler,
+					IRQF_ONESHOT, dev_name(dev), ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
+
+	ret = t14s_leds_probe(ec);
+	if (ret < 0)
+		return ret;
+
+	ret = t14s_kbd_backlight_probe(ec);
+	if (ret < 0)
+		return ret;
+
+	ret = t14s_kbd_audio_led_probe(ec);
+	if (ret < 0)
+		return ret;
+
+	ret = t14s_input_probe(ec);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Disable wakeup support by default, because the driver currently does
+	 * not support masking any events and the laptop should not wake up when
+	 * the LID is closed.
+	 */
+	device_wakeup_disable(dev);
+
+	return 0;
+}
+
+static const struct of_device_id t14s_ec_of_match[] = {
+	{ .compatible = "lenovo,thinkpad-t14s-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, t14s_ec_of_match);
+
+static const struct i2c_device_id t14s_ec_i2c_id_table[] = {
+	{ "thinkpad-t14s-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, t14s_ec_i2c_id_table);
+
+static struct i2c_driver t14s_ec_i2c_driver = {
+	.driver = {
+		.name = "thinkpad-t14s-ec",
+		.of_match_table = t14s_ec_of_match,
+	},
+	.probe = t14s_ec_probe,
+	.id_table = t14s_ec_i2c_id_table,
+};
+module_i2c_driver(t14s_ec_i2c_driver);
+
+MODULE_AUTHOR("Sebastian Reichel <sre@kernel.org>");
+MODULE_DESCRIPTION("Lenovo Thinkpad T14s Embedded Controller");
+MODULE_LICENSE("GPL");

-- 
2.51.0


