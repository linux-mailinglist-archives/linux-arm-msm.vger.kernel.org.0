Return-Path: <linux-arm-msm+bounces-42836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6F9F857D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45D737A2F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA751CEAC8;
	Thu, 19 Dec 2024 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHEShny4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F11C6F55;
	Thu, 19 Dec 2024 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734638918; cv=none; b=DHJuCfMBHXK7duFiKmnJ31lOSAfKWp9jcjrb4xH+eATtKnvD3V48r/4o/2IxD54aOtB2iD2k3nTopNd8rZniShfyBWqrh57KT6Wg+eVY2TDD/KVum8T3FeYefpqVcHTKtZCqYrd84ujQkRsd2iVsLlcoydvSCaH215oA49kwX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734638918; c=relaxed/simple;
	bh=jg+Er16seDmoKpGs/9lT/ITlebvU2tlXkSQV2i9rWOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jhcr8iRuV3IaYPhmWTlOTEobWPP1/cYg4fAu+a8r8c+Ub9Q/oe/57yh6VSeP1+X+P0ejp6X9BU6YHaQnQ9Gr2yOg1ntyBK1Ftzfui5POK0lUHsPDNUPW/Mx8finuh7HSmZGEzqq6qjMMMj1/bUXnzl8dcvExRWc7surm9hxyqTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHEShny4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so2367640e87.1;
        Thu, 19 Dec 2024 12:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734638915; x=1735243715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPaohUawxCoZuNaOQRaHJC/S0epHyE5msg96wUYCYlM=;
        b=CHEShny4v3FAQ3G/tQJjogtxewI3IZwXaIRYfxoC0NjqDF5yd2/EsKNcFzmQT3OgDT
         0QMhPNNCCYvCBkcXAaq3XUoFHJkoBSZSXMgInqOOSG45HL3+LA/zeAqsqVR1R5//tKc1
         LLSVfsHM4dF6hFaguQRkJ1TvkLIk82J0qXJO/rlXq1wueGH/vmfxcl4e8Agjbc7lbNQH
         PjxfDayWelaj1vA2mZdR5NqpudeC9bCEg78XedQjpFnVLOgqJHOljbgl14sGWE2f4k+V
         aPNJ0fJGAZy9l3tp2+9Q090jDmp8V3AHv9oQ8bKLBM32HPjLJSzuMKZRPf5Zm0lD4Ryl
         JLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638915; x=1735243715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPaohUawxCoZuNaOQRaHJC/S0epHyE5msg96wUYCYlM=;
        b=Cob8mW/KvEqDlHVMQ/xFv5IMfqqJMJvLxuVMSaB4QTnj+mz+HVAbElUmq+9nsuwGb7
         wdNIqBq6VdF7BBJcGzBiwZiYJTJgYYIIu3vX6Bne9sTCak8KJaO1jDfvEoP+pgM0GrHW
         na/vy8Hy7VQ3PNqrfU4OdMzW7gveutkdKYwo0VSBAKErxD0nklg9BzljFxrqWfdjGe8h
         YMcAB8D1Y16LoQmP7y17QyQvmVE21JjjQB3OiMNsHZm47xNdF7uSWLFZZuwQvnUegW96
         k9mwmAVTolI0b5Zho7yp5sm2iM9OqFZ3mY8AuNsVB8WL8fyaQJpxA+FBf9tsjFP8lSRq
         1FCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC6RZNV7ISOUGnx+KnTWU2GuY7XIt7Kt9q9fxyWpcHoZIDzlRTEuOOKYGXjbnit+yhalxgFlAIGJ9AKpY=@vger.kernel.org, AJvYcCXdDHHfj6AHXogLNPWOU12BVTyKhNLfRD4isSSs3EX/drngYIScVJY9CcKoRW2Hp/zTyN6Tdj+jkxNPI229rK4=@vger.kernel.org, AJvYcCXxEUajrEQWWerloef3Y5yK6ULhZBSsCWieklFNzHuKQMdUulpb1wrdnDiZw558+yIyPJeJ4lO++bjvBK39XpOkm0W79Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIMgvwcj8BLK8B7F73rAkwlEVEfs+FMfCsqR6ShDHHBsbaFHT
	m6JfynU9QinLx8qEsKbz0wsQlvaOGo2REE0Xd043Mbi8EwrvpEZP
X-Gm-Gg: ASbGncv3IMj7yEcWbrGWJO6CpXec4dEA0VVr0SJRFLL/d2pVy95Khxh/tZiZ8mTnTtV
	js6RJ0N6xq4au/zqCSGbQ9JW5aWAzKoepIj2OQbqR9MeFdKCLOXrOLbXHwWNnyK+JLgyMda9kR3
	rIDOoQBJE81+LQboA2H0hWBdlEjJIONP+D0IEgrzGKwDx1ghZFCn2cNZyIDgBCuajolYMkOCVXJ
	vdsgtcLh3YubiBZ09zBVnVP7Lp1l8hKowOt30Fk4qSZyF//ALlEwPA4AVbDKrY4w2mgjAL4byRw
	9hE=
X-Google-Smtp-Source: AGHT+IHsvHxtOEZWZs4q6trnCTg7IDIJ2M+dLqrP3IZVxsZpl8GaPLsxWOz/E2bnOsH9DUfbp+toZQ==
X-Received: by 2002:a05:6512:1591:b0:540:3566:5396 with SMTP id 2adb3069b0e04-54229474f7fmr11253e87.27.1734638914675;
        Thu, 19 Dec 2024 12:08:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:9433:9060:39fc:2954])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238135d8sm265642e87.145.2024.12.19.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:08:33 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most X1E laptops
Date: Thu, 19 Dec 2024 21:08:19 +0100
Message-ID: <20241219200821.8328-2-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219200821.8328-1-maccraft123mc@gmail.com>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently it features only reporting that the AP is going to suspend,
which results in keyboard backlight turning off and the power LED
slowly blinking on the Lenovo Yoga Slim 7x.

Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
firmware with extensions which would need appropriate handling.
For reverse engineering the firmware on them I have written a Rust
utility:

https://github.com/Maccraft123/it8987-qcom-tool.git

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 MAINTAINERS                              |   6 +
 drivers/platform/arm64/Kconfig           |   8 ++
 drivers/platform/arm64/Makefile          |   1 +
 drivers/platform/arm64/qcom-x1e-it8987.c | 158 +++++++++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b878ddc99f94..08d170e2e1e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12890,6 +12890,12 @@ S:	Maintained
 W:	http://legousb.sourceforge.net/
 F:	drivers/usb/misc/legousbtower.c
 
+QCOM IT8987 EC DRIVER
+M:	Maya Matuszczyk <maccraft123mc@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
+F:	drivers/platform/arm64/qcom-x1e-it8987.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index f88395ea3376..ebb7b4f70ca0 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -49,4 +49,12 @@ config EC_LENOVO_YOGA_C630
 
 	  Say M or Y here to include this support.
 
+config EC_QCOM_X1E_IT8987
+	tristate "Embedded Controller driver for most X1E80100 laptops"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	help
+	  This driver currently supports reporting device suspend to the EC so it
+	  can take appropriate actions.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index b2ae9114fdd8..b9aa195bc1e6 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -7,3 +7,4 @@
 
 obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
+obj-$(CONFIG_EC_QCOM_X1E_IT8987) += qcom-x1e-it8987.o
diff --git a/drivers/platform/arm64/qcom-x1e-it8987.c b/drivers/platform/arm64/qcom-x1e-it8987.c
new file mode 100644
index 000000000000..d27067d6326a
--- /dev/null
+++ b/drivers/platform/arm64/qcom-x1e-it8987.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
+ */
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+
+#define EC_IRQ_REASON_REG 0x05
+#define EC_SUSPEND_RESUME_REG 0x23
+#define EC_IRQ_ENABLE_REG 0x35
+
+#define EC_NOTIFY_SUSPEND_ENTER 0x01
+#define EC_NOTIFY_SUSPEND_EXIT 0x00
+#define EC_NOTIFY_SCREEN_OFF 0x03
+#define EC_NOTIFY_SCREEN_ON 0x04
+
+#define EC_IRQ_MICMUTE_BUTTON 0x04
+#define EC_IRQ_FAN1_STATUS_CHANGE 0x30
+#define EC_IRQ_FAN2_STATUS_CHANGE 0x31
+#define EC_IRQ_FAN1_SPEED_CHANGE 0x32
+#define EC_IRQ_FAN2_SPEED_CHANGE 0x33
+#define EC_IRQ_COMPLETED_LUT_UPDATE 0x34
+#define EC_IRQ_COMPLETED_FAN_PROFILE_SWITCH 0x35
+#define EC_IRQ_THERMISTOR_1_TEMP_THRESHOLD_CROSS 0x36
+#define EC_IRQ_THERMISTOR_2_TEMP_THRESHOLD_CROSS 0x37
+#define EC_IRQ_THERMISTOR_3_TEMP_THRESHOLD_CROSS 0x38
+#define EC_IRQ_THERMISTOR_4_TEMP_THRESHOLD_CROSS 0x39
+#define EC_IRQ_THERMISTOR_5_TEMP_THRESHOLD_CROSS 0x3a
+#define EC_IRQ_THERMISTOR_6_TEMP_THRESHOLD_CROSS 0x3b
+#define EC_IRQ_THERMISTOR_7_TEMP_THRESHOLD_CROSS 0x3c
+#define EC_IRQ_RECOVERED_FROM_RESET 0x3d
+
+struct qcom_x1e_it8987_ec {
+	struct i2c_client *client;
+	struct input_dev *idev;
+	struct mutex lock;
+};
+
+static irqreturn_t qcom_x1e_it8987_ec_irq(int irq, void *data)
+{
+	struct qcom_x1e_it8987_ec *ec = data;
+	struct device *dev = &ec->client->dev;
+	int val;
+
+	guard(mutex)(&ec->lock);
+
+	val = i2c_smbus_read_byte_data(ec->client, EC_IRQ_REASON_REG);
+	if (val < 0) {
+		dev_err(dev, "Failed to get EC IRQ reason: %d\n", val);
+		return IRQ_HANDLED;
+	}
+
+	dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_x1e_it8987_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct qcom_x1e_it8987_ec *ec;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	mutex_init(&ec->lock);
+	ec->client = client;
+
+	ret = devm_request_threaded_irq(dev, client->irq,
+					NULL, qcom_x1e_it8987_ec_irq,
+					IRQF_ONESHOT, "qcom_x1e_it8987_ec", ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to request irq\n");
+
+	ret = i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x01);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable interrupts\n");
+
+	return 0;
+}
+
+static void qcom_x1e_it8987_ec_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x00);
+	if (ret < 0)
+		dev_err(dev, "Failed to disable interrupts: %d\n", ret);
+}
+
+static int qcom_x1e_it8987_ec_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SCREEN_OFF);
+	if (ret)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SUSPEND_ENTER);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int qcom_x1e_it8987_ec_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SUSPEND_EXIT);
+	if (ret)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SCREEN_ON);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id qcom_x1e_it8987_ec_of_match[] = {
+	{ .compatible = "lenovo,yoga-slim7x-ec" },
+	{ .compatible = "qcom,x1e-it9897-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);
+
+static const struct i2c_device_id qcom_x1e_it8987_ec_i2c_id_table[] = {
+	{ "qcom-x1e-it8987-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, qcom_x1e_it8987_ec_i2c_id_table);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(qcom_x1e_it8987_ec_pm_ops,
+		qcom_x1e_it8987_ec_suspend,
+		qcom_x1e_it8987_ec_resume);
+
+static struct i2c_driver qcom_x1e_it8987_ec_i2c_driver = {
+	.driver = {
+		.name = "yoga-slim7x-ec",
+		.of_match_table = qcom_x1e_it8987_ec_of_match,
+		.pm = &qcom_x1e_it8987_ec_pm_ops
+	},
+	.probe = qcom_x1e_it8987_ec_probe,
+	.remove = qcom_x1e_it8987_ec_remove,
+	.id_table = qcom_x1e_it8987_ec_i2c_id_table,
+};
+module_i2c_driver(qcom_x1e_it8987_ec_i2c_driver);
+
+MODULE_DESCRIPTION("Lenovo Yoga Slim 7x Embedded Controller");
+MODULE_LICENSE("GPL");
-- 
2.45.2


