Return-Path: <linux-arm-msm+bounces-110386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOg5M8fuGmqF9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:05:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB7A60D470
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1489030427FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C617E2F5A06;
	Sat, 30 May 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="MIpkgfoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4B2F1FD0;
	Sat, 30 May 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149647; cv=none; b=li17P5IukoNJK9cflSrGNkvkrzgI9+KYw69LI6zyeeEFjdUQZgTJdlv2mZJ5+21pVfNWX+G6aVDjcC3qTAtTVbvR8J7i4uWmIZ1prCIXlaw7psLc2Hrtg94tsXlf57L8GJvePW0YsC7v40hxIJqpOJHEnU0IONigmR0HGjgFvpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149647; c=relaxed/simple;
	bh=Q1TQrZ9h1EUDkMdzhnWAIa05yiMWWL/5s31KtaBOd5c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pvf+fzZTduzuPsJ8y/nlMleuclXDR2IsqKNyJteg8KaumbRGRtTyQmtimZgfJeBzjsLypgG5jNsR0C0ZVokNGQG8HBt/RkrczE4KDdmpH4J+VjSGRuyCZ9dNeW3+LTB0TAtN4FyAcvkh6aJ/dRkO+DFOdRdlrJrJYY1lvrPwaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=MIpkgfoj; arc=none smtp.client-ip=136.144.136.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4gSMLz1mTWzrJ4b;
	Sat, 30 May 2026 16:00:43 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gSMLy3zbLzJjhXv;
	Sat, 30 May 2026 16:00:42 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Amit Kucheria <amitk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	van Hazendonk <github.com@herrie.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 2/2] thermal: qcom: add PM8901 PMIC temperature-alarm driver
Date: Sat, 30 May 2026 16:00:40 +0200
Message-ID: <1b3f3853d374d9f65e3043de27f390f7ed97a0e5.1780148149.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780149642; h=from:subject:to:references:
 in-reply-to:date:mime-version:content-type;
 bh=U/pLuBQbU2rhc92R0TkMoiu/MQTqd6dO/2LFHKZLUFo=;
 b=MIpkgfojrMn1sxaPS6bHIAO8aKKXIalxnZM84rT+r/7vvDJW2btGOp9hvnVN2dUjtPy2qo
 el9c3UL/V1c8R1G5MYIy9ciX50X5ZwIKsiQGe7ecKK5Puyt+q8Lst4+D1+rf4c1jRRf94m
 zBWObck/8zswXgyRqvCG279e1K/XaFCbpk4DXf2T6kKsWdO3ZvKDQOe992C2sLCqdHH5mp
 GaY3mhcFt6q7NXx0CJEhps1ejsB/15EBx7bt+BnqmTcpjMYymQAeWkD6QrDZEh600IzyyU
 zsym0dUC/xzpQAx/ft07GX3Y4obPTZj8GwlDHnLJUyc25ELv+n0vcR99gW0Urg==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110386-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,arm.com,gmail.com,herrie.org,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2BB7A60D470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a thermal-of sensor driver for the temperature-alarm block inside
the Qualcomm PM8901 PMIC. PM8901 is a secondary PMIC paired with
PM8058 on the MSM8x60 family (MSM8260/MSM8660/APQ8060). It exposes
an over-temperature alarm at SSBI offset 0x23/0x24 with three
escalating stages (105/125/145 C); the driver decodes the stage +
threshold pair into a millicelsius reading and registers two PMIC-
internal interrupts (TEMP_ALARM at block 6 bit 4, TEMP_HI_ALARM at
block 6 bit 5).

Used by board thermal-zones for the orderly_poweroff path on the HP
TouchPad.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/thermal/qcom/Kconfig          |  12 +
 drivers/thermal/qcom/Makefile         |   1 +
 drivers/thermal/qcom/qcom-pm8901-tm.c | 341 ++++++++++++++++++++++++++
 3 files changed, 354 insertions(+)
 create mode 100644 drivers/thermal/qcom/qcom-pm8901-tm.c

diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
index a6bb01082ec6..af099032f1e6 100644
--- a/drivers/thermal/qcom/Kconfig
+++ b/drivers/thermal/qcom/Kconfig
@@ -32,6 +32,18 @@ config QCOM_SPMI_TEMP_ALARM
 	  real time die temperature if an ADC is present or an estimate of the
 	  temperature based upon the over temperature stage value.
 
+config QCOM_PM8901_TEMP_ALARM
+	tristate "Qualcomm PM8901 PMIC Temperature Alarm"
+	depends on MFD_PM8XXX || COMPILE_TEST
+	depends on THERMAL_OF
+	help
+	  This enables the thermal driver for the PM8901 PMIC over-temperature
+	  alarm block. PM8901 exposes a stage-based alarm (no raw ADC) with
+	  four selectable thresholds and three escalating stages. The driver
+	  registers a thermal-of sensor so a board device tree can declare
+	  trip points and a critical-trip action (orderly_poweroff). Used on
+	  HP TouchPad (APQ8060) where PM8901 supplies the secondary PMIC die.
+
 config QCOM_LMH
 	tristate "Qualcomm Limits Management Hardware"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
index 0fa2512042e7..90dc05151e33 100644
--- a/drivers/thermal/qcom/Makefile
+++ b/drivers/thermal/qcom/Makefile
@@ -5,4 +5,5 @@ qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
 				   tsens-8960.o
 obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
 obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
+obj-$(CONFIG_QCOM_PM8901_TEMP_ALARM)	+= qcom-pm8901-tm.o
 obj-$(CONFIG_QCOM_LMH)		+= lmh.o
diff --git a/drivers/thermal/qcom/qcom-pm8901-tm.c b/drivers/thermal/qcom/qcom-pm8901-tm.c
new file mode 100644
index 000000000000..d174d6897921
--- /dev/null
+++ b/drivers/thermal/qcom/qcom-pm8901-tm.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm PM8901 PMIC Thermal-Alarm Driver
+ *
+ * Mainline port of the legacy 2.6.35-palm drivers/thermal/pmic8901-tm.c.
+ * PM8901 exposes a stage-based over-temperature alarm (no raw ADC) with
+ * four selectable thresholds and three escalating stages. This driver
+ * mirrors the legacy programming exactly (threshold-set 0, software
+ * override enabled, PWM gating at 8 Hz) and registers a thermal-of
+ * sensor so a board DT can declare trip points and a critical action.
+ *
+ * Copyright (c) 2010-2011, Code Aurora Forum.
+ * Copyright (c) 2026, HP TouchPad mainline port.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/thermal.h>
+
+/* SSBI registers (offsets from the per-instance reg base) */
+#define PM8901_TM_REG_CTRL		0x00	/* CTRL/STATUS  (base + 0) */
+#define PM8901_TM_REG_PWM		0x01	/* PWM gating  (base + 1) */
+
+/* CTRL register fields */
+#define CTRL_ST3_SD			BIT(7)
+#define CTRL_ST2_SD			BIT(6)
+#define CTRL_STATUS_MASK		GENMASK(5, 4)
+#define CTRL_THRESH_MASK		GENMASK(3, 2)
+#define CTRL_OVRD_ST3			BIT(1)
+#define CTRL_OVRD_ST2			BIT(0)
+#define CTRL_OVRD_MASK			GENMASK(1, 0)
+
+/* PWM register fields */
+#define PWM_EN				BIT(7)
+#define PWM_PER_PRE_MASK		GENMASK(5, 3)
+#define PWM_PER_DIV_MASK		GENMASK(2, 0)
+
+/* Temperature math (from legacy pmic8901-tm.c) */
+#define PM8901_TEMP_STAGE_STEP		20000	/* 20 deg C between stages */
+#define PM8901_TEMP_STAGE_HYSTERESIS	2000	/*  2 deg C transition guard */
+#define PM8901_TEMP_THRESH_MIN		105000	/* threshold 0 base = 105 C */
+#define PM8901_TEMP_THRESH_STEP		5000	/*  5 deg C per threshold step */
+
+/*
+ * PM8901 has no real die ADC; when stage == 0 ("below threshold") we
+ * report a plausible idle estimate matching the legacy DEFAULT_NO_ADC_TEMP.
+ */
+#define PM8901_TEMP_NO_ALARM		37000
+
+struct pm8901_tm_chip {
+	struct device			*dev;
+	struct regmap			*map;
+	struct thermal_zone_device	*tz_dev;
+	struct mutex			lock;
+	unsigned int			base;	/* SSBI offset, from DT reg */
+	unsigned int			stage;
+	unsigned int			thresh;
+	int				temp;
+	bool				initialised;
+};
+
+static int pm8901_tm_read_ctrl(struct pm8901_tm_chip *chip, u8 *val)
+{
+	unsigned int v;
+	int ret;
+
+	ret = regmap_read(chip->map, chip->base + PM8901_TM_REG_CTRL, &v);
+	if (!ret)
+		*val = v;
+	return ret;
+}
+
+static int pm8901_tm_write_ctrl(struct pm8901_tm_chip *chip, u8 val)
+{
+	return regmap_write(chip->map, chip->base + PM8901_TM_REG_CTRL, val);
+}
+
+static int pm8901_tm_write_pwm(struct pm8901_tm_chip *chip, u8 val)
+{
+	return regmap_write(chip->map, chip->base + PM8901_TM_REG_PWM, val);
+}
+
+/*
+ * Decode the (stage, threshold) pair into a single millicelsius value.
+ * Logic matches the legacy pmic8901-tm.c hysteresis selection:
+ *  - on a rising stage transition, use the lower bound of the new stage
+ *    plus +HYSTERESIS so we don't bounce
+ *  - on a falling stage transition, use the upper bound of the new stage
+ *    minus -HYSTERESIS
+ *  - on the first read after probe (initialised == false), pick a
+ *    representative point: midpoint of the stage range, or
+ *    PM8901_TEMP_NO_ALARM when stage == 0.
+ */
+static int pm8901_tm_update_temp_locked(struct pm8901_tm_chip *chip)
+{
+	unsigned int new_stage;
+	u8 reg;
+	int ret;
+
+	ret = pm8901_tm_read_ctrl(chip, &reg);
+	if (ret)
+		return ret;
+
+	new_stage = FIELD_GET(CTRL_STATUS_MASK, reg);
+	chip->thresh = FIELD_GET(CTRL_THRESH_MASK, reg);
+
+	if (!chip->initialised) {
+		if (new_stage)
+			chip->temp = PM8901_TEMP_THRESH_MIN +
+				     chip->thresh * PM8901_TEMP_THRESH_STEP +
+				     (new_stage - 1) * PM8901_TEMP_STAGE_STEP;
+		else
+			chip->temp = PM8901_TEMP_NO_ALARM;
+		chip->initialised = true;
+	} else if (new_stage > chip->stage) {
+		chip->temp = PM8901_TEMP_THRESH_MIN +
+			     chip->thresh * PM8901_TEMP_THRESH_STEP +
+			     (new_stage - 1) * PM8901_TEMP_STAGE_STEP +
+			     PM8901_TEMP_STAGE_HYSTERESIS;
+	} else if (new_stage < chip->stage) {
+		chip->temp = PM8901_TEMP_THRESH_MIN +
+			     chip->thresh * PM8901_TEMP_THRESH_STEP +
+			     new_stage * PM8901_TEMP_STAGE_STEP -
+			     PM8901_TEMP_STAGE_HYSTERESIS;
+	}
+
+	chip->stage = new_stage;
+	return 0;
+}
+
+static int pm8901_tm_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct pm8901_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret;
+
+	if (!temp)
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = pm8901_tm_update_temp_locked(chip);
+	if (!ret)
+		*temp = chip->temp;
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static const struct thermal_zone_device_ops pm8901_tm_zone_ops = {
+	.get_temp = pm8901_tm_get_temp,
+};
+
+/*
+ * Shared ISR for both TEMP_ALARM (stage-transition) and TEMP_HI_ALARM
+ * (hi-temp) interrupts. Updates the cached temperature, clears any
+ * latched ST2_SD / ST3_SD shutdown bits so the next stage transition
+ * can be observed, and pokes the thermal core which then re-reads
+ * temp and walks trips (a critical-trip cross triggers orderly_poweroff
+ * via the kernel's standard machinery).
+ */
+static irqreturn_t pm8901_tm_isr(int irq, void *data)
+{
+	struct pm8901_tm_chip *chip = data;
+	u8 reg;
+	int ret;
+
+	mutex_lock(&chip->lock);
+
+	ret = pm8901_tm_update_temp_locked(chip);
+	if (ret) {
+		mutex_unlock(&chip->lock);
+		return IRQ_HANDLED;
+	}
+
+	ret = pm8901_tm_read_ctrl(chip, &reg);
+	if (!ret && (reg & (CTRL_ST2_SD | CTRL_ST3_SD))) {
+		reg &= ~(CTRL_ST2_SD | CTRL_ST3_SD | CTRL_STATUS_MASK);
+		pm8901_tm_write_ctrl(chip, reg);
+	}
+
+	dev_dbg(chip->dev, "alarm irq=%d stage=%u thresh=%u temp=%d\n",
+		irq, chip->stage, chip->thresh, chip->temp);
+
+	mutex_unlock(&chip->lock);
+
+	thermal_zone_device_update(chip->tz_dev, THERMAL_EVENT_UNSPECIFIED);
+	return IRQ_HANDLED;
+}
+
+/*
+ * Program PM8901 to the legacy default: threshold-set 0 (105 / 125 / 145 C),
+ * software override enabled (kernel handles shutdown, PMIC does not auto-cut),
+ * PWM at 8 Hz (legacy "cut down on unnecessary interrupts" rate).
+ */
+static int pm8901_tm_init_hw(struct pm8901_tm_chip *chip)
+{
+	int ret;
+	u8 reg;
+
+	mutex_lock(&chip->lock);
+
+	ret = pm8901_tm_read_ctrl(chip, &reg);
+	if (ret)
+		goto out;
+
+	/*
+	 * Enable software override so PMIC does NOT auto-shut-down on stage 3.
+	 * Critical-trip orderly_poweroff is delivered by the kernel thermal
+	 * core via the DT thermal-zone trip with type = "critical".
+	 */
+	reg = (reg & ~(CTRL_OVRD_MASK | CTRL_STATUS_MASK | CTRL_THRESH_MASK)) |
+	      CTRL_OVRD_ST3 | CTRL_OVRD_ST2;
+	ret = pm8901_tm_write_ctrl(chip, reg);
+	if (ret)
+		goto out;
+
+	chip->thresh = 0;
+
+	/* PWM @ 8 Hz: PWM_EN | PRE=3 | DIV=3 — verbatim from legacy. */
+	reg = PWM_EN | FIELD_PREP(PWM_PER_PRE_MASK, 3) |
+	      FIELD_PREP(PWM_PER_DIV_MASK, 3);
+	ret = pm8901_tm_write_pwm(chip, reg);
+	if (ret)
+		goto out;
+
+	/* Prime the cached temperature from current hardware state. */
+	chip->initialised = false;
+	ret = pm8901_tm_update_temp_locked(chip);
+
+out:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static int pm8901_tm_probe(struct platform_device *pdev)
+{
+	struct pm8901_tm_chip *chip;
+	int ret, irq_alarm, irq_hi_alarm;
+	u32 res;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &pdev->dev;
+	mutex_init(&chip->lock);
+
+	chip->map = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!chip->map)
+		return dev_err_probe(&pdev->dev, -ENXIO,
+				     "no regmap on PM8901 parent\n");
+
+	ret = of_property_read_u32(pdev->dev.of_node, "reg", &res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "missing reg property\n");
+	chip->base = res;
+
+	irq_alarm = platform_get_irq_byname(pdev, "alarm");
+	if (irq_alarm < 0)
+		return irq_alarm;
+	irq_hi_alarm = platform_get_irq_byname(pdev, "hi-alarm");
+	if (irq_hi_alarm < 0)
+		return irq_hi_alarm;
+
+	ret = pm8901_tm_init_hw(chip);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "hw init failed\n");
+
+	chip->tz_dev = devm_thermal_of_zone_register(&pdev->dev, 0, chip,
+						     &pm8901_tm_zone_ops);
+	if (IS_ERR(chip->tz_dev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
+				     "thermal zone register failed\n");
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
+					pm8901_tm_isr, IRQF_ONESHOT,
+					"pm8901-tm-alarm", chip);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "alarm IRQ request failed\n");
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq_hi_alarm, NULL,
+					pm8901_tm_isr, IRQF_ONESHOT,
+					"pm8901-tm-hi-alarm", chip);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "hi-alarm IRQ request failed\n");
+
+	platform_set_drvdata(pdev, chip);
+	thermal_zone_device_update(chip->tz_dev, THERMAL_EVENT_UNSPECIFIED);
+
+	dev_info(&pdev->dev,
+		 "PM8901 thermal alarm: base=0x%x stage=%u thresh=%u temp=%d\n",
+		 chip->base, chip->stage, chip->thresh, chip->temp);
+
+	return 0;
+}
+
+static void pm8901_tm_remove(struct platform_device *pdev)
+{
+	struct pm8901_tm_chip *chip = platform_get_drvdata(pdev);
+	u8 reg;
+
+	/*
+	 * Disable software override on the way out so the PMIC reverts to
+	 * its hardware auto-cut behaviour if the kernel is no longer the
+	 * shutdown agent. Best-effort: ignore errors.
+	 */
+	mutex_lock(&chip->lock);
+	if (!pm8901_tm_read_ctrl(chip, &reg)) {
+		reg &= ~CTRL_OVRD_MASK;
+		pm8901_tm_write_ctrl(chip, reg);
+	}
+	mutex_unlock(&chip->lock);
+}
+
+static const struct of_device_id pm8901_tm_match_table[] = {
+	{ .compatible = "qcom,pm8901-temp-alarm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pm8901_tm_match_table);
+
+static struct platform_driver pm8901_tm_driver = {
+	.driver = {
+		.name		= "pm8901-temp-alarm",
+		.of_match_table	= pm8901_tm_match_table,
+	},
+	.probe	= pm8901_tm_probe,
+	.remove	= pm8901_tm_remove,
+};
+module_platform_driver(pm8901_tm_driver);
+
+MODULE_ALIAS("platform:pm8901-temp-alarm");
+MODULE_DESCRIPTION("Qualcomm PM8901 PMIC Thermal Alarm driver");
+MODULE_LICENSE("GPL v2");
-- 
2.43.0


