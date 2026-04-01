Return-Path: <linux-arm-msm+bounces-101256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MGkHs7MzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:44:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10781376331
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64DE8308EFEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B82390CA9;
	Wed,  1 Apr 2026 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="f0LYuS1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733E38E118;
	Wed,  1 Apr 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028852; cv=none; b=MqxaSoFXEyZm/VzdzLPsqbVF4aFsR/DQD+y8oOAjnY9aCx0sIlKHzD2LEEHRIZuM4oX9Wj7aFJotCel4/+VxtG7RhyceYSDO9nhua998/D0gNioBaghHPKddVrBv3cnOIMmYjgzpDROgshst/OYgeL1oC6zsAcpDeMiiqUf1Zuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028852; c=relaxed/simple;
	bh=lLj4Xc+UftwrZsK2MCQpCga4bmKt9EEUkpkkdsD2nOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwQTJ5S4W5ZWSSjxdqXQr0kF7SyMHu1VK71D1hzuTasuhUXkFb2/Fb4WOMQxRjy1hxQ2Uu2BUpOnvojHOivUeYitlASQlx5d3wEn36hOwXbDNplYM41RrM0QisYi3b9mpWuOkRNeRyvPjXRRoN9MSHfcyPD++LNja+5K+j9unOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=fail smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=f0LYuS1w; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775028833; x=1775288033;
	bh=Hf/LAvcljlUBsXvQy4R0nX66XX6Cl+XJpVnTXqWigo8=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f0LYuS1wwHbec6j76f/UCy/Ar4/ypTlliK8nvqAm/pG+I1PFfyQNv8j5b199egihg
	 3/jodwWgAccUBOQkYVry4lyqVSxGyrpTjChuBT29Np9wpyKF3V3Ip34nYkTYn4inUp
	 yAJgejBAcWi8TidUDbeR1qclsr9UU/W8H4lVNJ+rcpfmiD6fQVMuo8DBkM8gGWj9pT
	 S4yF2Fs5IyPwIQXGlMeabWECSWVe79+IxXZH8d37gu1wFX0RiMDnSMBa5lyDJCv/1W
	 C5NYj7bm2Y/eEf6WlkhoDXinweh4J6p99El51fOoI5Ms7Q25fc5aM2STI57Y31bbov
	 q1KcY4U7vz0UQ==
X-Pm-Submission-Id: 4flxYq1WMWz1DDLW
gpg: Signature made Wed 01 Apr 2026 09:30:46 AM CEST
gpg: using EDDSA key 8BFCF5668AA29DAD00D728F6EDAE71A20F500310
gpg: Good signature from "Aleksandrs Vinarskis <alex@vinarskis.com>"
 [ultimate]
gpg: aka "Aleksandrs Vinarskis <alex.vinarskis@gmail.com>" [ultimate]
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 01 Apr 2026 09:33:11 +0200
Subject: [PATCH 2/4] platform: arm64: dell-xps-ec: new driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11550; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=lLj4Xc+UftwrZsK2MCQpCga4bmKt9EEUkpkkdsD2nOc=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJlnTkVPqZ5yaado9rZp2y48L/i/8+Da4i8L64Rcgy0+T
 jP1PX7yckcpC4MYF4OsmCJL95+vaV2L5q5luK7xDWYOKxPIEAYuTgGYSII7w/+QY9cvrlVWfJiS
 V1tTKp4bLM/ONyGto+iqvm90nYHc7lRGhsWNZ3juKG2X+bpF3E7hYJqC1Yspj/7cdDTPZvar3HT
 2OgcA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101256-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bewilderbeest.net:email,temp_work.work:url]
X-Rspamd-Queue-Id: 10781376331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
partially of fully compatible with Snapdragon-based Dell Latitude,
Inspiron ('thena'). Primary function of this driver is unblock EC's
thermal management, specifically to provide it with necessary
information to control device fans, peripherals power.

The driver was developed primarily by analyzing ACPI DSDT's _DSM and
i2c dumps of communication between SoC and EC. Changes to Windows
driver's behavior include increasing temperature feed loop from ~50ms
to 100ms here.

While Xps's EC is rather complex and controls practically all device
peripherals including touch row's brightness and special keys such as
mic mute, these do not go over this particular i2c interface.

Not yet implemented features:
- On lid-close IRQ event is registered. Windows performs what to
  appears to be thermistor constants readout, though its not obvious
  what it used for.
- According to ACPI's _DSM there is a method to readout fans' RPM.
- Initial thermistor constants were sniffed from Windows, these can be
  likely fine tuned for better cooling performance.
- There is additional temperature reading that Windows sents to EC but
  more rare than others, likely SoC T_j / TZ98 or TZ4. This is the only
  thermal zone who's reading can exceed 115C without triggering thermal
  shutdown.
- Given similarities between 'tributo' and 'thena' platforms, including
  EC i2c address, driver can be potentially extended to support both.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 MAINTAINERS                          |   1 +
 drivers/platform/arm64/Kconfig       |  12 ++
 drivers/platform/arm64/Makefile      |   1 +
 drivers/platform/arm64/dell-xps-ec.c | 269 +++++++++++++++++++++++++++++++++++
 4 files changed, 283 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe3f2fc4fbc087d8041f97708fbb93722f7d1882..f82c7f6c7377d3f2ff0ae1be263d854749541f03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7240,6 +7240,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
 M:	Aleksandrs Vinarskis <alex@vinarskis.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
+F:	drivers/platform/arm64/dell-xps-ec.c
 
 DELTA AHE-50DC FAN CONTROL MODULE DRIVER
 M:	Zev Weiss <zev@bewilderbeest.net>
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bfa5fad30a0689d3a20481268c781e..0bc8f016032bb05cb3a7cc50bdf1092da04153bc 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
 	  laptop where this information is not properly exposed via the
 	  standard ACPI devices.
 
+config EC_DELL_XPS
+	tristate "Dell XPS 9345 Embedded Controller driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	depends on IIO
+	help
+	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
+	  Dell XPS 13 9345, which handles thermal management and fan speed
+	  control.
+
+	  Say M or Y here to include this support.
+
 config EC_HUAWEI_GAOKUN
 	tristate "Huawei Matebook E Go Embedded Controller driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 60c131cff6a15bb51a49c9edab95badf513ee0f6..6768dc6c2310837374e67381cfc729bed1fdaaef 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -6,6 +6,7 @@
 #
 
 obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
+obj-$(CONFIG_EC_DELL_XPS)	+= dell-xps-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm64/dell-xps-ec.c
new file mode 100644
index 0000000000000000000000000000000000000000..5ea8f30931d8b61acbb948d8617dde3681fb8de3
--- /dev/null
+++ b/drivers/platform/arm64/dell-xps-ec.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/devm-helpers.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/iio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/workqueue.h>
+
+#define DELL_XPS_EC_SUSPEND_CMD		0xb9
+#define DELL_XPS_EC_SUSPEND_MSG_LEN	64
+
+#define DELL_XPS_EC_TEMP_CMD0		0xfb
+#define DELL_XPS_EC_TEMP_CMD1		0x20
+#define DELL_XPS_EC_TEMP_CMD3		0x02
+#define DELL_XPS_EC_TEMP_MSG_LEN	6
+#define DELL_XPS_EC_TEMP_INTERVAL_MS	100
+
+/*
+ * Format:
+ * - header/unknown (2 bytes)
+ * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
+ */
+static const u8 dell_xps_ec_thermistor_profile[] = {
+	0xff, 0x54,
+	0x01, 0x00, 0x2b,	/* sys_therm0 */
+	0x02, 0x44, 0x2a,	/* sys_therm1 */
+	0x03, 0x44, 0x2b,	/* sys_therm2 */
+	0x04, 0x44, 0x28,	/* sys_therm3 */
+	0x05, 0x55, 0x2a,	/* sys_therm4 */
+	0x06, 0x44, 0x26,	/* sys_therm5 */
+	0x07, 0x44, 0x2b,	/* sys_therm6 */
+};
+
+/*
+ * Mapping from IIO channel name to EC command byte
+ */
+static const struct {
+	const char *name;
+	u8 cmd;
+} dell_xps_ec_therms[] = {
+	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
+	{ "sys_therm0", 0x02 },
+	{ "sys_therm1", 0x03 },
+	{ "sys_therm2", 0x04 },
+	{ "sys_therm3", 0x05 },
+	{ "sys_therm4", 0x06 },
+	{ "sys_therm5", 0x07 },
+	{ "sys_therm6", 0x08 },
+};
+
+struct dell_xps_ec {
+	struct device *dev;
+	struct i2c_client *client;
+	struct iio_channel *therm_channels[ARRAY_SIZE(dell_xps_ec_therms)];
+	struct delayed_work temp_work;
+};
+
+static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspend)
+{
+	u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] = {};
+	int ret;
+
+	buf[0] = DELL_XPS_EC_SUSPEND_CMD;
+	buf[1] = suspend ? 0x01 : 0x00;
+	/* bytes 2..63 remain zero */
+
+	ret = i2c_master_send(ec->client, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dell_xps_ec_send_temp(struct dell_xps_ec *ec, u8 cmd_byte,
+				 int milli_celsius)
+{
+	u8 buf[DELL_XPS_EC_TEMP_MSG_LEN];
+	u16 deci_celsius;
+	int ret;
+
+	/* Convert milli-Celsius to deci-Celsius (Celsius * 10) */
+	deci_celsius = milli_celsius / 100;
+
+	buf[0] = DELL_XPS_EC_TEMP_CMD0;
+	buf[1] = DELL_XPS_EC_TEMP_CMD1;
+	buf[2] = cmd_byte;
+	buf[3] = DELL_XPS_EC_TEMP_CMD3;
+	buf[4] = deci_celsius & 0xff;		/* LSB */
+	buf[5] = (deci_celsius >> 8) & 0xff;	/* MSB */
+
+	ret = i2c_master_send(ec->client, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static void dell_xps_ec_temp_work_fn(struct work_struct *work)
+{
+	struct dell_xps_ec *ec = container_of(work, struct dell_xps_ec,
+					      temp_work.work);
+	int val, ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
+		if (!ec->therm_channels[i])
+			continue;
+
+		ret = iio_read_channel_processed(ec->therm_channels[i], &val);
+		if (ret < 0) {
+			dev_err_ratelimited(ec->dev,
+					    "Failed to read thermistor %s: %d\n",
+					    dell_xps_ec_therms[i].name, ret);
+			continue;
+		}
+
+		ret = dell_xps_ec_send_temp(ec, dell_xps_ec_therms[i].cmd, val);
+		if (ret < 0) {
+			dev_err_ratelimited(ec->dev,
+					    "Failed to send temp for %s: %d\n",
+					    dell_xps_ec_therms[i].name, ret);
+		}
+	}
+
+	schedule_delayed_work(&ec->temp_work,
+			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
+}
+
+static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
+{
+	struct dell_xps_ec *ec = data;
+
+	/*
+	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
+	 *       the thermistor thresholds and potentially fan speeds.
+	 */
+	dev_info_ratelimited(ec->dev, "IRQ triggered! (irq=%d)\n", irq);
+
+	return IRQ_HANDLED;
+}
+
+static int dell_xps_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct dell_xps_ec *ec;
+	int ret, i;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->dev = dev;
+	ec->client = client;
+	i2c_set_clientdata(client, ec);
+
+	/* Set default thermistor profile */
+	ret = i2c_master_send(client, dell_xps_ec_thermistor_profile,
+			      sizeof(dell_xps_ec_thermistor_profile));
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to set thermistor profile\n");
+
+	/* Get IIO channels for thermistors */
+	for (i = 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
+		ec->therm_channels[i] = devm_iio_channel_get(dev,
+					dell_xps_ec_therms[i].name);
+		if (IS_ERR(ec->therm_channels[i])) {
+			ret = PTR_ERR(ec->therm_channels[i]);
+			ec->therm_channels[i] = NULL;
+			if (ret == -EPROBE_DEFER)
+				return ret;
+			dev_warn(dev, "Thermistor %s not available: %d\n",
+				 dell_xps_ec_therms[i].name, ret);
+		}
+	}
+
+	/* Start periodic temperature reporting */
+	ret = devm_delayed_work_autocancel(dev, &ec->temp_work,
+					   dell_xps_ec_temp_work_fn);
+	if (ret)
+		return ret;
+	schedule_delayed_work(&ec->temp_work,
+			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
+	dev_info(dev, "Started periodic temperature reporting to EC every %d ms\n",
+		 DELL_XPS_EC_TEMP_INTERVAL_MS);
+
+	/* Request IRQ for EC events */
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					dell_xps_ec_irq_handler,
+					IRQF_ONESHOT, dev_name(dev), ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	return 0;
+}
+
+/*
+ * Notify EC of suspend
+ *
+ * This will:
+ * - Ramp down the fans
+ * - Cut power to display/trackpad/keyboard/touch row
+ * - Periodically (?) power them back, such that wake-up source still works
+ */
+static int dell_xps_ec_suspend(struct device *dev)
+{
+	struct dell_xps_ec *ec = dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&ec->temp_work);
+
+	return dell_xps_ec_suspend_cmd(ec, true);
+}
+
+/*
+ * Notify EC of resume
+ *
+ * This will undo the suspend actions
+ * Without the resume signal, device would wake up but be forced back into
+ * suspend by EC within seconds
+ */
+static int dell_xps_ec_resume(struct device *dev)
+{
+	struct dell_xps_ec *ec = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dell_xps_ec_suspend_cmd(ec, false);
+	if (ret)
+		return ret;
+
+	schedule_delayed_work(&ec->temp_work,
+			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
+	return 0;
+}
+
+static const struct of_device_id dell_xps_ec_of_match[] = {
+	{ .compatible = "dell,xps13-9345-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dell_xps_ec_of_match);
+
+static const struct i2c_device_id dell_xps_ec_i2c_id[] = {
+	{ "dell-xps-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dell_xps_ec_i2c_id);
+
+static const struct dev_pm_ops dell_xps_ec_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dell_xps_ec_suspend, dell_xps_ec_resume)
+};
+
+static struct i2c_driver dell_xps_ec_driver = {
+	.driver = {
+		.name = "dell-xps-ec",
+		.of_match_table = dell_xps_ec_of_match,
+		.pm = &dell_xps_ec_pm_ops,
+	},
+	.probe = dell_xps_ec_probe,
+	.id_table = dell_xps_ec_i2c_id,
+};
+module_i2c_driver(dell_xps_ec_driver);
+
+MODULE_AUTHOR("Aleksandrs Vinarskis <alex@vinarskis.com>");
+MODULE_DESCRIPTION("Dell XPS 13 9345 Embedded Controller");
+MODULE_LICENSE("GPL");

-- 
2.53.0


