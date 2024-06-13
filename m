Return-Path: <linux-arm-msm+bounces-22664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DE9907FB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E4F28479D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BF9156960;
	Thu, 13 Jun 2024 23:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBrzoOaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387514F10C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322229; cv=none; b=M5G61tZD3uKF5c9i0CpzlwTT5hwdfp+wlJ1WrHXnUN/MWjv0Y833u4r49Mu1c+EwQI4iwR8QhE8TqotJI0NhtuQlLG/LDnSOfK+HTzTJi3hJhzpvWooIgLM5wO0sEz7WDRz31d1TaauT3lJTDGg58fsD7bnHkoln8mog5RmcyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322229; c=relaxed/simple;
	bh=OGFJA/hrdKUc1ReZqc3+VUYDy8Vgh60z6XH8Zom+Lp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IoVriMkhOrHR+Qce0rOq758P8RAHOzEZrh+gxcy6TzTvdHA0OlTkUBnnEQqYf5s465CJGybOGoCDj3Q13Vc0Ym16YCW2DokORgnArwZQi3jFGWnIn3jPgDxXsvv7e3jdKkk8OLoomrTYpT5FPLj95Tszw8o1qlfbZyWCEkYwJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBrzoOaB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52962423ed8so1909913e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 16:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718322224; x=1718927024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB1DteE9K6SZPPmkeajTCPXnEiXe0UZJ8vVnaOruBb0=;
        b=HBrzoOaBvkTyfHC7m1Z/Kp5gR4CDEmpL10eEkq/KOJPRFF08SPQkIDxP1j8dniS5sL
         wdgmdyW310QkREBE2w+TZYNoLGAqRLuRBgBxGOeE8DJl+T9ilnPjkjM8uKn+N94MTK2j
         7tKjxjW8cBRSVYGLjsRSChTi2Sv6rcHEazeDU4WiYXR43mgyGDTFCssBlC7/v3aWT3YV
         5cGC9WT/8+pn5dl4yrU4S338Bf0HEGem3c5hPCOGyacCrbOgtO1D/v86fY8gS8G7Qh7+
         dEA2gCdyXkFRgdPYKBTnxNPfoKcyk2HjBiEZqH2WtctGndQRDlNtgP5ulsB1eRFNBZLN
         /Nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322224; x=1718927024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB1DteE9K6SZPPmkeajTCPXnEiXe0UZJ8vVnaOruBb0=;
        b=HXpVZ+JcXsoyiYJo46gDXwX7CRTJlXMG2EB4GWP3di/xBfrUIm+mvsewwXp76ydA3A
         G5xvtvYGCi+lzdbiMrE6emhP4wURI6n7Lk9IvbJeJIWuGs1ubDfDpgeR/5itJMwVqjZ8
         dPZtd67cHBJdIVapj87EMNkjPPMBrwOhSh7pa6vRU3AKTy1rMczmAS705FCiwhfyrgI5
         wb26TSoCthRptQRHe8zv/f0/+3wzji8trTSR8l6tA7kJISh5ND9TjzFqfERIlmEZZGgb
         d10RouUnJ9q5e6Z9Ffac+scPZx5UA6b5FVUi5O7/PhH0EF6IYQ1vcLQ76jlqcVYALk6D
         M5pw==
X-Forwarded-Encrypted: i=1; AJvYcCW57vn/53VZ8irHI6dLVSb6iwlmZv0LC5tNwldKOKImjpuCw0i8vc+Op0kyF0CX8vhMCDE/vJWSUDrHDzY39CNL8Fv7DG2DN9lad9/HHQ==
X-Gm-Message-State: AOJu0Yw5zr8KuPN/kPQU4pQNBdwOS3Bc9YiT0nNQTAEA3H6JwX0vBD84
	j3gsaPXcs5H6NTKl7Zisswcog7zaLiVkZYh3oTAf7pVF2UfL8tosA9F52caToPk=
X-Google-Smtp-Source: AGHT+IEJgvtI4AuoaMjWsnonEoYTJQAa75DGh4NHJjN/9kYfRtemH2+H3O6xskh9mobo17XI8bKjOA==
X-Received: by 2002:a19:c20b:0:b0:52c:9ced:7508 with SMTP id 2adb3069b0e04-52ca6e56476mr724393e87.13.1718322224264;
        Thu, 13 Jun 2024 16:43:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872260sm359298e87.142.2024.06.13.16.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:43:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 02:43:39 +0300
Subject: [PATCH v7 2/6] platform: arm64: add Lenovo Yoga C630 WOS EC driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-yoga-ec-driver-v7-2-9f0b9b40ae76@linaro.org>
References: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
In-Reply-To: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11151;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OGFJA/hrdKUc1ReZqc3+VUYDy8Vgh60z6XH8Zom+Lp0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2i071ed6DF25WsLseqwtdXbHSbKaTxu11iYK8F1wcN
 d8LGf3uZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEvB+z/2YNtj2r/pTJpfTN
 oxf/wh7LRB5Jaf/eVr150wHtGUymH9Z3LOcwrNb16+6bfzmqofvWV+74F7EyEpc4LFP2lzlvvS/
 OoON86IFpxO7Tvsnt7S57r+pq9rO/PTP3fHRXv9ScP6JnkjYccf2t757Q45LLszFVQ/Zxn5gbo9
 GX+vq9u5LNk3g4I34zGbanhx3NfDRF4X2O0YnPk/9c/Dnx4IP7/o1ZMV6VvV9d5q3VYbg1TSVOt
 CGhPv+k63yTEqcTvq86iyRLNyuG7ih8zlj3luPQblXXWeX3sw9uD1KY4/349sla39OMy0u8EnSM
 9tn9ucS4YtGmN8Ks9nuXuQs4CIqGm50tezNh98t1Pd6XAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Lenovo Yoga C630 WOS is a laptop using Snapdragon 850 SoC. Like many
laptops it uses an embedded controller (EC) to perform various platform
operations, including, but not limited, to Type-C port control or power
supply handlng.

Add the driver for the EC, that creates devices for UCSI and power
supply devices.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/platform/arm64/Kconfig                 |  14 ++
 drivers/platform/arm64/Makefile                |   1 +
 drivers/platform/arm64/lenovo-yoga-c630.c      | 290 +++++++++++++++++++++++++
 include/linux/platform_data/lenovo-yoga-c630.h |  44 ++++
 4 files changed, 349 insertions(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 8fdca0f8e909..8c103b3150d1 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -32,4 +32,18 @@ config EC_ACER_ASPIRE1
 	  laptop where this information is not properly exposed via the
 	  standard ACPI devices.
 
+config EC_LENOVO_YOGA_C630
+	tristate "Lenovo Yoga C630 Embedded Controller driver"
+	depends on I2C
+	help
+	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
+	  Lenovo Yoga C630, which provides battery and power adapter
+	  information.
+
+	  This driver provides battery and AC status support for the mentioned
+	  laptop where this information is not properly exposed via the
+	  standard ACPI devices.
+
+	  Say M or Y here to include this support.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 4fcc9855579b..b2ae9114fdd8 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -6,3 +6,4 @@
 #
 
 obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
+obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
new file mode 100644
index 000000000000..edd2ad91292f
--- /dev/null
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024, Linaro Ltd
+ * Authors:
+ *    Bjorn Andersson
+ *    Dmitry Baryshkov
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/irqreturn.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/slab.h>
+#include <linux/platform_data/lenovo-yoga-c630.h>
+
+#define LENOVO_EC_RESPONSE_REG		0x01
+#define LENOVO_EC_REQUEST_REG		0x02
+
+#define LENOVO_EC_UCSI_WRITE		0x20
+#define LENOVO_EC_UCSI_READ		0x21
+
+#define LENOVO_EC_READ_REG		0xb0
+#define LENOVO_EC_REQUEST_NEXT_EVENT	0x84
+
+#define LENOVO_EC_UCSI_VERSION		0x20
+
+struct yoga_c630_ec {
+	struct i2c_client *client;
+	struct mutex lock;
+	struct blocking_notifier_head notifier_list;
+};
+
+static int yoga_c630_ec_request(struct yoga_c630_ec *ec, u8 *req, size_t req_len,
+				u8 *resp, size_t resp_len)
+{
+	int ret;
+
+	lockdep_assert_held(&ec->lock);
+
+	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_REQUEST_REG,
+					     req_len, req);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_read_i2c_block_data(ec->client, LENOVO_EC_RESPONSE_REG,
+					     resp_len, resp);
+}
+
+int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
+{
+	u8 req[2] = { LENOVO_EC_READ_REG, };
+	int ret;
+	u8 val;
+
+	guard(mutex)(&ec->lock);
+
+	req[1] = addr;
+	ret = yoga_c630_ec_request(ec, req, sizeof(req), &val, 1);
+	if (ret < 0)
+		return ret;
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(yoga_c630_ec_read8);
+
+int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr)
+{
+	u8 req[2] = { LENOVO_EC_READ_REG, };
+	int ret;
+	u8 msb;
+	u8 lsb;
+
+	/* don't overflow the address */
+	if (addr == 0xff)
+		return -EINVAL;
+
+	guard(mutex)(&ec->lock);
+
+	req[1] = addr;
+	ret = yoga_c630_ec_request(ec, req, sizeof(req), &lsb, 1);
+	if (ret < 0)
+		return ret;
+
+	req[1] = addr + 1;
+	ret = yoga_c630_ec_request(ec, req, sizeof(req), &msb, 1);
+	if (ret < 0)
+		return ret;
+
+	return msb << 8 | lsb;
+}
+EXPORT_SYMBOL_GPL(yoga_c630_ec_read16);
+
+u16 yoga_c630_ec_ucsi_get_version(struct yoga_c630_ec *ec)
+{
+	u8 req[3] = { 0xb3, 0xf2, };
+	int ret;
+	u8 msb;
+	u8 lsb;
+
+	guard(mutex)(&ec->lock);
+
+	req[2] = LENOVO_EC_UCSI_VERSION;
+	ret = yoga_c630_ec_request(ec, req, sizeof(req), &lsb, 1);
+	if (ret < 0)
+		return ret;
+
+	req[2] = LENOVO_EC_UCSI_VERSION + 1;
+	ret = yoga_c630_ec_request(ec, req, sizeof(req), &msb, 1);
+	if (ret < 0)
+		return ret;
+
+	return msb << 8 | lsb;
+}
+EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_get_version);
+
+int yoga_c630_ec_ucsi_write(struct yoga_c630_ec *ec,
+			    const u8 req[YOGA_C630_UCSI_WRITE_SIZE])
+{
+	int ret;
+
+	mutex_lock(&ec->lock);
+	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_UCSI_WRITE,
+					     YOGA_C630_UCSI_WRITE_SIZE, req);
+	mutex_unlock(&ec->lock);
+
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_write);
+
+int yoga_c630_ec_ucsi_read(struct yoga_c630_ec *ec,
+			   u8 resp[YOGA_C630_UCSI_READ_SIZE])
+{
+	int ret;
+
+	mutex_lock(&ec->lock);
+	ret = i2c_smbus_read_i2c_block_data(ec->client, LENOVO_EC_UCSI_READ,
+					    YOGA_C630_UCSI_READ_SIZE, resp);
+	mutex_unlock(&ec->lock);
+
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_read);
+
+static irqreturn_t yoga_c630_ec_thread_intr(int irq, void *data)
+{
+	u8 req[] = { LENOVO_EC_REQUEST_NEXT_EVENT };
+	struct yoga_c630_ec *ec = data;
+	u8 event;
+	int ret;
+
+	mutex_lock(&ec->lock);
+	ret = yoga_c630_ec_request(ec, req, sizeof(req), &event, 1);
+	mutex_unlock(&ec->lock);
+	if (ret < 0)
+		return IRQ_HANDLED;
+
+	blocking_notifier_call_chain(&ec->notifier_list, event, ec);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * yoga_c630_ec_register_notify - Register a notifier callback for EC events.
+ * @ec: Yoga C630 EC
+ * @nb: Notifier block pointer to register
+ *
+ * Return: 0 on success or negative error code.
+ */
+int yoga_c630_ec_register_notify(struct yoga_c630_ec *ec, struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&ec->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(yoga_c630_ec_register_notify);
+
+/**
+ * yoga_c630_ec_unregister_notify - Unregister notifier callback for EC events.
+ * @ec: Yoga C630 EC
+ * @nb: Notifier block pointer to unregister
+ *
+ * Unregister a notifier callback that was previously registered with
+ * yoga_c630_ec_register_notify().
+ */
+void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&ec->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
+
+static void yoga_c630_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static void yoga_c630_aux_remove(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int yoga_c630_aux_init(struct device *parent, const char *name,
+			      struct yoga_c630_ec *ec)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = name;
+	adev->id = 0;
+	adev->dev.parent = parent;
+	adev->dev.release = yoga_c630_aux_release;
+	adev->dev.platform_data = ec;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+}
+
+static int yoga_c630_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct yoga_c630_ec *ec;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	mutex_init(&ec->lock);
+	ec->client = client;
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
+
+	ret = devm_request_threaded_irq(dev, client->irq,
+					NULL, yoga_c630_ec_thread_intr,
+					IRQF_ONESHOT, "yoga_c630_ec", ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "unable to request irq\n");
+
+	ret = yoga_c630_aux_init(dev, YOGA_C630_DEV_PSY, ec);
+	if (ret)
+		return ret;
+
+	return yoga_c630_aux_init(dev, YOGA_C630_DEV_UCSI, ec);
+}
+
+
+static const struct of_device_id yoga_c630_ec_of_match[] = {
+	{ .compatible = "lenovo,yoga-c630-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, yoga_c630_ec_of_match);
+
+static const struct i2c_device_id yoga_c630_ec_i2c_id_table[] = {
+	{ "yoga-c630-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, yoga_c630_ec_i2c_id_table);
+
+static struct i2c_driver yoga_c630_ec_i2c_driver = {
+	.driver = {
+		.name = "yoga-c630-ec",
+		.of_match_table = yoga_c630_ec_of_match
+	},
+	.probe = yoga_c630_ec_probe,
+	.id_table = yoga_c630_ec_i2c_id_table,
+};
+module_i2c_driver(yoga_c630_ec_i2c_driver);
+
+MODULE_DESCRIPTION("Lenovo Yoga C630 Embedded Controller");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/lenovo-yoga-c630.h b/include/linux/platform_data/lenovo-yoga-c630.h
new file mode 100644
index 000000000000..5d1f9fb33cfc
--- /dev/null
+++ b/include/linux/platform_data/lenovo-yoga-c630.h
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024, Linaro Ltd
+ * Authors:
+ *    Bjorn Andersson
+ *    Dmitry Baryshkov
+ */
+
+#ifndef _LENOVO_YOGA_C630_DATA_H
+#define _LENOVO_YOGA_C630_DATA_H
+
+struct yoga_c630_ec;
+struct notifier_block;
+
+#define YOGA_C630_MOD_NAME	"lenovo_yoga_c630"
+
+#define YOGA_C630_DEV_UCSI	"ucsi"
+#define YOGA_C630_DEV_PSY	"psy"
+
+int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr);
+int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr);
+
+int yoga_c630_ec_register_notify(struct yoga_c630_ec *ec, struct notifier_block *nb);
+void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_block *nb);
+
+#define YOGA_C630_UCSI_WRITE_SIZE	8
+#define YOGA_C630_UCSI_CCI_SIZE		4
+#define YOGA_C630_UCSI_DATA_SIZE	16
+#define YOGA_C630_UCSI_READ_SIZE	(YOGA_C630_UCSI_CCI_SIZE + YOGA_C630_UCSI_DATA_SIZE)
+
+u16 yoga_c630_ec_ucsi_get_version(struct yoga_c630_ec *ec);
+int yoga_c630_ec_ucsi_write(struct yoga_c630_ec *ec,
+			    const u8 req[YOGA_C630_UCSI_WRITE_SIZE]);
+int yoga_c630_ec_ucsi_read(struct yoga_c630_ec *ec,
+			   u8 resp[YOGA_C630_UCSI_READ_SIZE]);
+
+#define LENOVO_EC_EVENT_USB		0x20
+#define LENOVO_EC_EVENT_UCSI		0x21
+#define LENOVO_EC_EVENT_HPD		0x22
+#define LENOVO_EC_EVENT_BAT_STATUS	0x24
+#define LENOVO_EC_EVENT_BAT_INFO	0x25
+#define LENOVO_EC_EVENT_BAT_ADPT_STATUS	0x37
+
+#endif

-- 
2.39.2


