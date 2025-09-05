Return-Path: <linux-arm-msm+bounces-72168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26000B44B21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 03:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128F41C82C1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C4C1EBFF7;
	Fri,  5 Sep 2025 01:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yv1EX1rl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018F51E51FB;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757034580; cv=none; b=QS6VbxJ4bCh5KwybFcv0SgIcCyvMdgHU1kpo2hlucmVYVYV+jygb/84SR/OsABoxvI+OlTXhcRanZPz4qlhXvdW6j2xVVsvbOyV9pWPKXdkPF5n1zX67HP3M7e23muwYIg5KNnF8pbznBs6cUk8XeFjXNhZfUxXAueAy3p+CmFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757034580; c=relaxed/simple;
	bh=lWMpo+E6MLY6a4x2xzNAWZWEEpZDtgmM+QLZCDJcBHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAR1WorIFipuoNIJlz3BMFQDEry9q+gp3CzENxDYgz2+ORccut0O8NU/zX0k+YBiTgRxoBCb95RxBpBGeHZ0LLXLWD1ws0UdjEhtgGJ5dNJYS2BU12h76yipQHJ38Wg+J1IzeA5gr9JLc7Uc+DNXH+Y83Sg0QifNFmj18N54zrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv1EX1rl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3097DC113CF;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757034579;
	bh=lWMpo+E6MLY6a4x2xzNAWZWEEpZDtgmM+QLZCDJcBHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yv1EX1rlKOaf0xO9Hqhm7YxTnM0uZu3fyfoI7Qv0XQve4vGd2/0jwFtHONBP3lwf6
	 QlxQLQmQyv4kpR/B2+xpEYD7wLGCFB4rkttygM9MCqzR6Of9T1B6vQEOEbmXnRRudL
	 TEkdz+QU4l2n9/B4rUR85YEgT5A4hrjwnbow3Phpmxz5pWViJ7G2T/aIPlBThhVyZK
	 pZOraboUsJWKeG80hmSIOMzF5veQANNB97uvrIHmgTU+gqkELndLEJDUF1P8XCaBcC
	 dfKFalDdsTbZKFw+6Cvll4201xMZuAUTt9OwHEaUuu/ll0wPOUEljT6ekTKsehklMh
	 s0C34Balc3RWQ==
Received: by venus (Postfix, from userid 1000)
	id 10857180B18; Fri, 05 Sep 2025 03:09:36 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Fri, 05 Sep 2025 03:09:32 +0200
Subject: [PATCH v2 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-thinkpad-t14s-ec-v2-2-7da5d70aa423@collabora.com>
References: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
In-Reply-To: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22892;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lWMpo+E6MLY6a4x2xzNAWZWEEpZDtgmM+QLZCDJcBHs=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBoujhPJzn3RD8D7+lXxyD0Dfb0UZ25tgz5LVLtF
 qvWdy1e0h6JAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLo4TwAKCRDY7tfzyDv6
 mrb4D/4nIFfmwiVZe4wSkLCNlfNUh2wgo1LVgewWuIs19nX6hHMqC1n6cwYVE5WjfLCRB7dZwer
 aDWXMf1+thKoilqjCyGF5BwxIYWxCw5G1avdv1xopivyJ0irewUuGrbIyAxWKH9oIFVwCuyFtsJ
 KsOIBNa6ercK5kQg/UR4xZouY2aLq7+3pikYSmPhY6UllEIs3BVGIAWOm9894DT7B9V7Xrn5RVW
 ekKBaB1mMAhAh0uwvtAX1CMX0FmUlIWCbwjvMkAj0WeuwlD7ebZWSl+i4d3YfbII67w56kSTb7U
 /mpe+n4/gsZw/clmFfMwb6ZDQi/OZR0GNLnQcs+ZjHx9PUjEVnLfcmvT+QgPRkRiZAHH2qX2Sin
 pyZSdWPH8cQQkUS69FQbzcBiCpbmepR62VFO4pIKFITXBQXydxLNXjfLZjySbB/ISnsOjQoTV9S
 sZR2nBY6xsRuOTmMLfFJq+I5668V1/hx/2XFzQA5y1If2PxKlVUHaYtvIKq8mCnH1A2B3UD6Bl7
 2UvnFEPX36qjOP5aekMAlbF803EsmATevPxEgfb2tUYNhQvXpY60pzofHq0U5Z4Q/HstGx/bIgc
 1s1dZO6rckgwm2DwLbalxJ0AE2UilzeOszVka3+fh2/pq/lo39lb6Ybc/fxbztTSxcfon81OXL9
 e7xtKy83TO7Sz6g==
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
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 610 ++++++++++++++++++++++++++
 4 files changed, 637 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..83375e4e6e8c6ddd82e71503416ad655c25684f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25092,6 +25092,12 @@ W:	http://thinkwiki.org/wiki/Ibm-acpi
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
index 0000000000000000000000000000000000000000..ee7d6343a0ff50e64b08d7e507486c91d4b41735
--- /dev/null
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -0,0 +1,610 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Sebastian Reichel
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/leds.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define THINKPAD_T14S_EC_CMD_ECRD 0x02
+#define THINKPAD_T14S_EC_CMD_ECWR 0x03
+#define THINKPAD_T14S_EC_CMD_EVT 0xf0
+
+#define THINKPAD_T14S_EC_REG_LED	0x0c
+#define THINKPAD_T14S_EC_REG_KBD_BL1	0x0d
+#define THINKPAD_T14S_EC_REG_KBD_BL2	0xe1
+#define THINKPAD_T14S_EC_KBD_BL1_MASK	GENMASK_U8(7, 6)
+#define THINKPAD_T14S_EC_KBD_BL2_MASK	GENMASK_U8(3, 2)
+#define THINKPAD_T14S_EC_REG_AUD	0x30
+#define THINKPAD_T14S_EC_MIC_MUTE_LED	BIT(5)
+#define THINKPAD_T14S_EC_SPK_MUTE_LED	BIT(6)
+
+#define THINKPAD_T14S_EC_EVT_NONE			0x00
+#define THINKPAD_T14S_EC_EVT_KEY_FN_4			0x13
+#define THINKPAD_T14S_EC_EVT_KEY_FN_F7			0x16
+#define THINKPAD_T14S_EC_EVT_KEY_FN_SPACE		0x1F
+#define THINKPAD_T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
+#define THINKPAD_T14S_EC_EVT_AC_CONNECTED		0x26
+#define THINKPAD_T14S_EC_EVT_AC_DISCONNECTED		0x27
+#define THINKPAD_T14S_EC_EVT_KEY_POWER			0x28
+#define THINKPAD_T14S_EC_EVT_LID_OPEN			0x2A
+#define THINKPAD_T14S_EC_EVT_LID_CLOSED			0x2B
+#define THINKPAD_T14S_EC_EVT_KEY_FN_F12			0x62
+#define THINKPAD_T14S_EC_EVT_KEY_FN_TAB			0x63
+#define THINKPAD_T14S_EC_EVT_KEY_FN_F8			0x64
+#define THINKPAD_T14S_EC_EVT_KEY_FN_F10			0x65
+#define THINKPAD_T14S_EC_EVT_KEY_FN_F4			0x6A
+#define THINKPAD_T14S_EC_EVT_KEY_FN_D			0x6B
+#define THINKPAD_T14S_EC_EVT_KEY_FN_T			0x6C
+#define THINKPAD_T14S_EC_EVT_KEY_FN_H			0x6D
+#define THINKPAD_T14S_EC_EVT_KEY_FN_M			0x6E
+#define THINKPAD_T14S_EC_EVT_KEY_FN_L			0x6F
+#define THINKPAD_T14S_EC_EVT_KEY_FN_RIGHT_SHIFT		0x71
+#define THINKPAD_T14S_EC_EVT_KEY_FN_ESC			0x74
+#define THINKPAD_T14S_EC_EVT_KEY_FN_N			0x79
+#define THINKPAD_T14S_EC_EVT_KEY_FN_F11			0x7A
+#define THINKPAD_T14S_EC_EVT_KEY_FN_G			0x7E
+
+/* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
+#define THINKPAD_T14S_EC_BLINK_RATE_ON_OFF_MS		500
+
+/*
+ * Add a virtual offset on all key event codes for sparse keymap handling,
+ * since the sparse keymap infrastructure does not map some raw key event codes
+ * used by the EC. For example 0x16 (THINKPAD_T14S_EC_EVT_KEY_FN_F7) is mapped
+ * to KEY_MUTE if no offset is applied.
+ */
+#define THINKPAD_T14S_EC_KEY_EVT_OFFSET			0x1000
+#define THINKPAD_T14S_EC_KEY_ENTRY(key, value) \
+	{ KE_KEY, THINKPAD_T14S_EC_KEY_EVT_OFFSET + THINKPAD_T14S_EC_EVT_KEY_##key, { value } }
+
+enum thinkpad_t14s_ec_led_status_t {
+	THINKPAD_EC_LED_OFF =	0x00,
+	THINKPAD_EC_LED_ON =	0x80,
+	THINKPAD_EC_LED_BLINK =	0xc0,
+};
+
+struct thinkpad_t14s_ec_led_classdev {
+	struct led_classdev led_classdev;
+	int led;
+	enum thinkpad_t14s_ec_led_status_t cache;
+	struct thinkpad_t14s_ec *ec;
+};
+
+struct thinkpad_t14s_ec {
+	struct regmap *regmap;
+	struct device *dev;
+	struct thinkpad_t14s_ec_led_classdev led_pwr_btn;
+	struct thinkpad_t14s_ec_led_classdev led_chrg_orange;
+	struct thinkpad_t14s_ec_led_classdev led_chrg_white;
+	struct thinkpad_t14s_ec_led_classdev led_lid_logo_dot;
+	struct led_classdev kbd_backlight;
+	struct led_classdev led_mic_mute;
+	struct led_classdev led_spk_mute;
+	struct input_dev *inputdev;
+};
+
+static const struct regmap_config thinkpad_t14s_ec_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+};
+
+static int thinkpad_t14s_ec_write(void *context, unsigned int reg,
+				  unsigned int val)
+{
+	u8 buf[5] = {THINKPAD_T14S_EC_CMD_ECWR, reg, 0x00, 0x01, val};
+	struct thinkpad_t14s_ec *ec = context;
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	int ret;
+
+	ret = i2c_master_send(client, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int thinkpad_t14s_ec_read(void *context, unsigned int reg,
+				 unsigned int *val)
+{
+	u8 buf[4] = {THINKPAD_T14S_EC_CMD_ECRD, reg, 0x00, 0x01};
+	struct thinkpad_t14s_ec *ec = context;
+	struct i2c_client *client = to_i2c_client(ec->dev);
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
+static const struct regmap_bus thinkpad_t14s_ec_regmap_bus = {
+	.reg_write = thinkpad_t14s_ec_write,
+	.reg_read = thinkpad_t14s_ec_read,
+};
+
+static int thinkpad_t14s_ec_read_evt(struct thinkpad_t14s_ec *ec, u8 *val)
+{
+	u8 buf[4] = {THINKPAD_T14S_EC_CMD_EVT, 0x00, 0x00, 0x01};
+	struct i2c_client *client = to_i2c_client(ec->dev);
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
+static int thinkpad_t14s_led_set_status(struct thinkpad_t14s_ec *ec,
+			struct thinkpad_t14s_ec_led_classdev *led,
+			const enum thinkpad_t14s_ec_led_status_t ledstatus)
+{
+	int ret;
+
+	ret = regmap_write(ec->regmap, THINKPAD_T14S_EC_REG_LED,
+			   led->led | ledstatus);
+	if (ret < 0)
+		return ret;
+
+	led->cache = ledstatus;
+	return 0;
+}
+
+static int thinkpad_t14s_led_set(struct led_classdev *led_cdev,
+				 enum led_brightness brightness)
+{
+	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
+			struct thinkpad_t14s_ec_led_classdev, led_classdev);
+	enum thinkpad_t14s_ec_led_status_t new_state;
+
+	if (brightness == LED_OFF)
+		new_state = THINKPAD_EC_LED_OFF;
+	else if (led->cache != THINKPAD_EC_LED_BLINK)
+		new_state = THINKPAD_EC_LED_ON;
+	else
+		new_state = THINKPAD_EC_LED_BLINK;
+
+	return thinkpad_t14s_led_set_status(led->ec, led, new_state);
+}
+
+static int thinkpad_t14s_led_blink_set(struct led_classdev *led_cdev,
+				       unsigned long *delay_on,
+				       unsigned long *delay_off)
+{
+	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
+			struct thinkpad_t14s_ec_led_classdev, led_classdev);
+
+	if (*delay_on == 0 && *delay_off == 0) {
+		/* We can choose the blink rate */
+		*delay_on = THINKPAD_T14S_EC_BLINK_RATE_ON_OFF_MS;
+		*delay_off = THINKPAD_T14S_EC_BLINK_RATE_ON_OFF_MS;
+	} else if ((*delay_on != THINKPAD_T14S_EC_BLINK_RATE_ON_OFF_MS) ||
+		   (*delay_off != THINKPAD_T14S_EC_BLINK_RATE_ON_OFF_MS))
+		return -EINVAL;
+
+	return thinkpad_t14s_led_set_status(led->ec, led, THINKPAD_EC_LED_BLINK);
+}
+
+static int thinkpad_t14s_init_led(struct thinkpad_t14s_ec *ec,
+				  struct thinkpad_t14s_ec_led_classdev *led,
+				  u8 id, const char *name)
+{
+	led->led_classdev.name = name;
+	led->led_classdev.flags = LED_RETAIN_AT_SHUTDOWN;
+	led->led_classdev.max_brightness = 1;
+	led->led_classdev.brightness_set_blocking = thinkpad_t14s_led_set;
+	led->led_classdev.blink_set = thinkpad_t14s_led_blink_set;
+	led->ec = ec;
+	led->led = id;
+
+	return devm_led_classdev_register(ec->dev, &led->led_classdev);
+}
+
+static int thinkpad_t14s_leds_probe(struct thinkpad_t14s_ec *ec)
+{
+	int ret;
+
+	ret = thinkpad_t14s_init_led(ec, &ec->led_pwr_btn, 0,
+				     "platform::power");
+	if (ret)
+		return ret;
+
+	ret = thinkpad_t14s_init_led(ec, &ec->led_chrg_orange, 1,
+				     "platform:amber:battery-charging");
+	if (ret)
+		return ret;
+
+	ret = thinkpad_t14s_init_led(ec, &ec->led_chrg_white, 2,
+				     "platform:white:battery-full");
+	if (ret)
+		return ret;
+
+	ret = thinkpad_t14s_init_led(ec, &ec->led_lid_logo_dot, 10,
+				     "platform::lid_logo_dot");
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int thinkpad_t14s_kbd_bl_set(struct led_classdev *led_cdev,
+				    enum led_brightness brightness)
+{
+	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
+					struct thinkpad_t14s_ec, kbd_backlight);
+	int ret;
+	u8 val;
+
+	val = FIELD_PREP(THINKPAD_T14S_EC_KBD_BL1_MASK, brightness);
+	ret = regmap_update_bits(ec->regmap, THINKPAD_T14S_EC_REG_KBD_BL1,
+				 THINKPAD_T14S_EC_KBD_BL1_MASK, val);
+	if (ret < 0)
+		return ret;
+
+	val = FIELD_PREP(THINKPAD_T14S_EC_KBD_BL2_MASK, brightness);
+	ret = regmap_update_bits(ec->regmap, THINKPAD_T14S_EC_REG_KBD_BL2,
+				 THINKPAD_T14S_EC_KBD_BL2_MASK, val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static enum led_brightness thinkpad_t14s_kbd_bl_get(struct led_classdev *led_cdev)
+{
+	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
+					struct thinkpad_t14s_ec, kbd_backlight);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(ec->regmap, THINKPAD_T14S_EC_REG_KBD_BL1, &val);
+	if (ret < 0)
+		return ret;
+
+	return FIELD_GET(THINKPAD_T14S_EC_KBD_BL1_MASK, val);
+}
+
+static void thinkpad_t14s_kbd_bl_update(struct thinkpad_t14s_ec *ec)
+{
+	enum led_brightness brightness = thinkpad_t14s_kbd_bl_get(&ec->kbd_backlight);
+
+	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, brightness);
+}
+
+static int thinkpad_t14s_kbd_backlight_probe(struct thinkpad_t14s_ec *ec)
+{
+	ec->kbd_backlight.name = "platform::kbd_backlight";
+	ec->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
+	ec->kbd_backlight.max_brightness = 2;
+	ec->kbd_backlight.brightness_set_blocking = thinkpad_t14s_kbd_bl_set;
+	ec->kbd_backlight.brightness_get = thinkpad_t14s_kbd_bl_get;
+
+	return devm_led_classdev_register(ec->dev, &ec->kbd_backlight);
+}
+
+static enum led_brightness thinkpad_t14s_audio_led_get(struct thinkpad_t14s_ec *ec,
+						       u8 led_bit)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(ec->regmap, THINKPAD_T14S_EC_REG_AUD, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val && led_bit) ? LED_ON : LED_OFF;
+}
+
+static enum led_brightness thinkpad_t14s_audio_led_set(struct thinkpad_t14s_ec *ec,
+						       u8 led_bit,
+						       enum led_brightness brightness)
+{
+	u8 val = brightness ? led_bit : 0;
+
+	return regmap_update_bits(ec->regmap, THINKPAD_T14S_EC_REG_AUD, led_bit, val);
+}
+
+static enum led_brightness thinkpad_t14s_mic_mute_led_get(struct led_classdev *led_cdev)
+{
+	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
+					struct thinkpad_t14s_ec, led_mic_mute);
+
+	return thinkpad_t14s_audio_led_get(ec, THINKPAD_T14S_EC_MIC_MUTE_LED);
+}
+
+static int thinkpad_t14s_mic_mute_led_set(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
+					struct thinkpad_t14s_ec, led_mic_mute);
+
+	return thinkpad_t14s_audio_led_set(ec, THINKPAD_T14S_EC_MIC_MUTE_LED, brightness);
+}
+
+static enum led_brightness thinkpad_t14s_spk_mute_led_get(struct led_classdev *led_cdev)
+{
+	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
+					struct thinkpad_t14s_ec, led_spk_mute);
+
+	return thinkpad_t14s_audio_led_get(ec, THINKPAD_T14S_EC_SPK_MUTE_LED);
+}
+
+static int thinkpad_t14s_spk_mute_led_set(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
+					struct thinkpad_t14s_ec, led_spk_mute);
+
+	return thinkpad_t14s_audio_led_set(ec, THINKPAD_T14S_EC_SPK_MUTE_LED, brightness);
+}
+
+static int thinkpad_t14s_kbd_audio_led_probe(struct thinkpad_t14s_ec *ec)
+{
+	int ret;
+
+	ec->led_mic_mute.name = "platform::micmute";
+	ec->led_mic_mute.max_brightness = 1,
+	ec->led_mic_mute.default_trigger = "audio-micmute",
+	ec->led_mic_mute.brightness_set_blocking = thinkpad_t14s_mic_mute_led_set;
+	ec->led_mic_mute.brightness_get = thinkpad_t14s_mic_mute_led_get;
+
+	ec->led_spk_mute.name = "platform::mute";
+	ec->led_spk_mute.max_brightness = 1,
+	ec->led_spk_mute.default_trigger = "audio-mute",
+	ec->led_spk_mute.brightness_set_blocking = thinkpad_t14s_spk_mute_led_set;
+	ec->led_spk_mute.brightness_get = thinkpad_t14s_spk_mute_led_get;
+
+	ret = devm_led_classdev_register(ec->dev, &ec->led_mic_mute);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register(ec->dev, &ec->led_spk_mute);
+}
+
+static const struct key_entry thinkpad_t14s_keymap[] = {
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_4, KEY_SLEEP),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_N, KEY_VENDOR),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_F4, KEY_MICMUTE),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_F7, KEY_SWITCHVIDEOMODE),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_F8, KEY_PERFORMANCE),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_F10, KEY_SELECTIVE_SCREENSHOT),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_F11, KEY_LINK_PHONE),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_F12, KEY_BOOKMARKS),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_SPACE, KEY_KBDILLUMTOGGLE),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_ESC, KEY_FN_ESC),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_TAB, KEY_ZOOM),
+	THINKPAD_T14S_EC_KEY_ENTRY(FN_RIGHT_SHIFT, KEY_FN_RIGHT_SHIFT),
+	THINKPAD_T14S_EC_KEY_ENTRY(TP_DOUBLE_TAP, KEY_PROG4),
+	{ KE_END }
+};
+
+static int thinkpad_t14s_input_probe(struct thinkpad_t14s_ec *ec)
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
+	ret = sparse_keymap_setup(ec->inputdev, thinkpad_t14s_keymap, NULL);
+	if (ret)
+		return ret;
+
+	ret = input_register_device(ec->inputdev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static irqreturn_t thinkpad_t14s_ec_irq_handler(int irq, void *data)
+{
+	struct thinkpad_t14s_ec *ec = data;
+	int ret;
+	u8 val;
+
+	ret = thinkpad_t14s_ec_read_evt(ec, &val);
+	if (ret < 0) {
+		dev_err(ec->dev, "Failed to read event\n");
+		return IRQ_HANDLED;
+	}
+
+	switch (val) {
+	case THINKPAD_T14S_EC_EVT_NONE:
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_SPACE:
+		thinkpad_t14s_kbd_bl_update(ec);
+		fallthrough;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_F4:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_F7:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_4:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_F8:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_F12:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_TAB:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_F10:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_N:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_F11:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_ESC:
+	case THINKPAD_T14S_EC_EVT_KEY_FN_RIGHT_SHIFT:
+	case THINKPAD_T14S_EC_EVT_KEY_TP_DOUBLE_TAP:
+		sparse_keymap_report_event(ec->inputdev,
+				THINKPAD_T14S_EC_KEY_EVT_OFFSET + val, 1, true);
+		break;
+	case THINKPAD_T14S_EC_EVT_AC_CONNECTED:
+		dev_dbg(ec->dev, "AC connected\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_AC_DISCONNECTED:
+		dev_dbg(ec->dev, "AC disconnected\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_POWER:
+		dev_dbg(ec->dev, "power button\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_LID_OPEN:
+		dev_dbg(ec->dev, "LID open\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_LID_CLOSED:
+		dev_dbg(ec->dev, "LID closed\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_G:
+		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_L:
+		dev_dbg(ec->dev, "FN + L - low performance mode\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_M:
+		dev_dbg(ec->dev, "FN + M - medium performance mode\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_H:
+		dev_dbg(ec->dev, "FN + H - high performance mode\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_T:
+		dev_dbg(ec->dev, "FN + T - toggle intelligent cooling mode\n");
+		break;
+	case THINKPAD_T14S_EC_EVT_KEY_FN_D:
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
+static int thinkpad_t14s_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct thinkpad_t14s_ec *ec;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->dev = dev;
+
+	ec->regmap = devm_regmap_init(dev, &thinkpad_t14s_ec_regmap_bus,
+				      ec, &thinkpad_t14s_ec_regmap_config);
+	if (IS_ERR(ec->regmap))
+		return dev_err_probe(dev, PTR_ERR(ec->regmap),
+				     "Failed to init regmap\n");
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					thinkpad_t14s_ec_irq_handler,
+					IRQF_ONESHOT, dev_name(dev), ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
+
+	ret = thinkpad_t14s_leds_probe(ec);
+	if (ret < 0)
+		return ret;
+
+	ret = thinkpad_t14s_kbd_backlight_probe(ec);
+	if (ret < 0)
+		return ret;
+
+	ret = thinkpad_t14s_kbd_audio_led_probe(ec);
+	if (ret < 0)
+		return ret;
+
+	ret = thinkpad_t14s_input_probe(ec);
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
+static const struct of_device_id thinkpad_t14s_ec_of_match[] = {
+	{ .compatible = "lenovo,thinkpad-t14s-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, thinkpad_t14s_ec_of_match);
+
+static const struct i2c_device_id thinkpad_t14s_ec_i2c_id_table[] = {
+	{ "thinkpad-t14s-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, thinkpad_t14s_ec_i2c_id_table);
+
+static struct i2c_driver thinkpad_t14s_ec_i2c_driver = {
+	.driver = {
+		.name = "thinkpad-t14s-ec",
+		.of_match_table = thinkpad_t14s_ec_of_match,
+	},
+	.probe = thinkpad_t14s_ec_probe,
+	.id_table = thinkpad_t14s_ec_i2c_id_table,
+};
+module_i2c_driver(thinkpad_t14s_ec_i2c_driver);
+
+MODULE_AUTHOR("Sebastian Reichel <sre@kernel.org>");
+MODULE_DESCRIPTION("Lenovo Thinkpad T14s Embedded Controller");
+MODULE_LICENSE("GPL");

-- 
2.50.1


