Return-Path: <linux-arm-msm+bounces-23997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D483915172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91CB6B23695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BFF19CCED;
	Mon, 24 Jun 2024 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqYK+KWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284E519B3F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241724; cv=none; b=kSR0VJezTfQMeQiguRvt3X1imgeKmfyJf5l554HkDOR0XqLJbMHL7SE2kh2J7hrpWZGuIc97+9kZtR4SRCvcY3HqHHqV3g3dC6+BuF6aVXpY6TKEMBOmTWK2mi1qIjzFoX0OJE1aYx32ffjcjJ4qoiX/lauWWEpZeMBc4/oV254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241724; c=relaxed/simple;
	bh=6OYh9GVmCFzlYYtPr1/rlWFN2LdtNayCv9r+cMa7gHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rB6U/jQWTyUGtBhiKu1OVWefnYb5ri4OZoMoasDRnS3MyQ3hZ58yshEmROYU/7YyvMF1J6VS3e2qUxAX3rNoIgIHISAmF8ZNrOVgElc4tPuEJqXbm+wRgsl1+maon+Q78B3oJSQ7hzDb93eLazpeIsp6udfMWETCqMoRuvm/P+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqYK+KWA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cdb0d816bso2220966e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719241720; x=1719846520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fNkTYJPvQWZmgLjYfNjuf35JHpZNSgZEp1wXGwNUwU=;
        b=OqYK+KWAOXHOKr9k0qfN19HHR8t4/aTmSIDdJvVrQBYqZzFr622ZyE9hu9/VV5wgoL
         TkjeFTxmH4NAQNKIPnEUeeknA3Nft9fjTbYRK7h8kzlAeYlXgaL9lN4bDb7Q8WdgTIAz
         B81lAQzW9bcboIva3sgg1Vu5gZfmPM2KTCQLd3HDK3ywcrHPNriNk7fbP+H6r09vtio3
         Kd9epPLHwAW1hAnFJO0q3cNg/8njlO9z78QWTY4lKxSeC/3T3u3+U3lcWW7+cfAI7FhJ
         MlBOObh5ZRG0QnJf5BjBf/NRjlkcvlhCBS8r9oBIGsulXiHI7WI4JXG+z5bnNwVC2JAR
         foDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719241720; x=1719846520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fNkTYJPvQWZmgLjYfNjuf35JHpZNSgZEp1wXGwNUwU=;
        b=Geoe20kxU1dOszQK56r+/+GHsAirfB+eK/ANgqTxhCeyFRgSc6aC3DQAYFfFwg0KcR
         fD46TpAPaOPO4fR+yCTtimIsC0Fs1p4eDO8hhe7h9TWn2tIjMfLF6kx7WZyuopefKLYW
         4c7RZltvhgyaeo9Fbz1xUAWOvXTBUuzZGjiqsT/y4h5Pxs6iKxalu3FYTcV4vaphdNgS
         lISOVkbgaibYATfJElIVdzBKoZbK0bdP8WRRifatuoTX9zXTjsqwZ6OIm4jHcj2IgCwh
         n2azaraY+1pfa6qz7QrI701ULPc1o484aNlkCzGnzenQv/P8aqfeWcl1/uqaQ1jx7emF
         z9ng==
X-Forwarded-Encrypted: i=1; AJvYcCXS1Urw+LVjsNmZyYOXi2tf2llsjKcI7Hwlfy/AF2d1z7ZyepnDpG6VgRaZMrI731/FzJb7772xjpzSJv/x0hKZZNNYOTiCW+wqD7IvNA==
X-Gm-Message-State: AOJu0Yx7C4GB/HrnigyRkVvl9m8NCg9RTLEAEhyPsA0ud2+D4Ox422Wh
	Q1MENGYjnMumtd1+qd1eIkVxbPvVK8HoGS93dBOK71gpqTiGE154oDspzAnylcw=
X-Google-Smtp-Source: AGHT+IGJJOO7DBibqLwx6Hc8BeWlnHSDRWgoKB3loXQyx2zDHel9Sd6tYg2Sfa480VSb8XhuJWknJg==
X-Received: by 2002:a05:6512:2398:b0:52c:df4c:92d8 with SMTP id 2adb3069b0e04-52cdf4c93b3mr2306668e87.1.1719241720366;
        Mon, 24 Jun 2024 08:08:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdbe1bcefsm840571e87.159.2024.06.24.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:08:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 18:08:13 +0300
Subject: [PATCH v9 2/2] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240624-ucsi-yoga-ec-driver-v9-2-53af411a9bd6@linaro.org>
References: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org>
In-Reply-To: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7349;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6OYh9GVmCFzlYYtPr1/rlWFN2LdtNayCv9r+cMa7gHA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYvdhrwcwKivuj6eDm/PHIBmAdcmYYZD4QMUH
 a5KA5pWtSKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmL3QAKCRCLPIo+Aiko
 1WVPB/4zVzvlBpnvJAp+CJkVqEfu6jHS41VDf/RmAalcN9mnGq/ANCXrNP2Gy3q+IIU9bw5tN1Z
 4zBdimIovfPhlIa5w5UXyJM7GFoyGXvYLNyBcLXNziSSFoJeVjtNHZr+5YEZAHKXGGGZPnd5N6x
 8ZoFUuyYa5x1ZC815FDAE6m6hWZu/wk9TfQkAeClbJqeyB2ZB+vOEy7MPeMwdSI/HFJvcH0M34S
 nsrKRaZ18/Vuk9Q+WqhudJRi99c2kvpyR4JGuWlpPw2g2ke0KwW6RBBdECjK3EEyHBMeYQc1mKZ
 TZbs1ZmZAWFcZzdxeMcxBizCA8dJJspDwQCBrgYwBMTvdjUi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
the onboard EC. Add glue driver to interface the platform's UCSI
implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/Kconfig          |   9 ++
 drivers/usb/typec/ucsi/Makefile         |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 204 ++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index bdcb1764cfae..680e1b87b152 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -69,4 +69,13 @@ config UCSI_PMIC_GLINK
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_glink.
 
+config UCSI_LENOVO_YOGA_C630
+	tristate "UCSI Interface Driver for Lenovo Yoga C630"
+	depends on EC_LENOVO_YOGA_C630
+	help
+	  This driver enables UCSI support on the Lenovo Yoga C630 laptop.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called ucsi_yoga_c630.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index b4679f94696b..aed41d23887b 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
 obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
+obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
new file mode 100644
index 000000000000..8bee0b469041
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024, Linaro Ltd
+ * Authors:
+ *  Bjorn Andersson
+ *  Dmitry Baryshkov
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/string.h>
+#include <linux/platform_data/lenovo-yoga-c630.h>
+
+#include "ucsi.h"
+
+struct yoga_c630_ucsi {
+	struct yoga_c630_ec *ec;
+	struct ucsi *ucsi;
+	struct notifier_block nb;
+	struct completion complete;
+	unsigned long flags;
+#define UCSI_C630_COMMAND_PENDING	0
+#define UCSI_C630_ACK_PENDING		1
+	u16 version;
+};
+
+static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
+			       void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+	u8 buf[YOGA_C630_UCSI_READ_SIZE];
+	int ret;
+
+	ret = yoga_c630_ec_ucsi_read(uec->ec, buf);
+	if (ret)
+		return ret;
+
+	if (offset == UCSI_VERSION) {
+		memcpy(val, &uec->version, min(val_len, sizeof(uec->version)));
+		return 0;
+	}
+
+	switch (offset) {
+	case UCSI_CCI:
+		memcpy(val, buf, min(val_len, YOGA_C630_UCSI_CCI_SIZE));
+		return 0;
+	case UCSI_MESSAGE_IN:
+		memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
+		       min(val_len, YOGA_C630_UCSI_DATA_SIZE));
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
+				      const void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+
+	if (offset != UCSI_CONTROL ||
+	    val_len != YOGA_C630_UCSI_WRITE_SIZE)
+		return -EINVAL;
+
+	return yoga_c630_ec_ucsi_write(uec->ec, val);
+}
+
+static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
+				     const void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	int ret;
+
+	if (ack)
+		set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
+	else
+		set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
+
+	reinit_completion(&uec->complete);
+
+	ret = yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
+	if (ret)
+		goto out_clear_bit;
+
+	if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
+		ret = -ETIMEDOUT;
+
+out_clear_bit:
+	if (ack)
+		clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
+	else
+		clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
+
+	return ret;
+}
+
+const struct ucsi_operations yoga_c630_ucsi_ops = {
+	.read = yoga_c630_ucsi_read,
+	.sync_write = yoga_c630_ucsi_sync_write,
+	.async_write = yoga_c630_ucsi_async_write,
+};
+
+static void yoga_c630_ucsi_notify_ucsi(struct yoga_c630_ucsi *uec, u32 cci)
+{
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(uec->ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (cci & UCSI_CCI_ACK_COMPLETE &&
+	    test_bit(UCSI_C630_ACK_PENDING, &uec->flags))
+		complete(&uec->complete);
+
+	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
+	    test_bit(UCSI_C630_COMMAND_PENDING, &uec->flags))
+		complete(&uec->complete);
+}
+
+static int yoga_c630_ucsi_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct yoga_c630_ucsi *uec = container_of(nb, struct yoga_c630_ucsi, nb);
+	u32 cci;
+	int ret;
+
+	switch (action) {
+	case LENOVO_EC_EVENT_USB:
+	case LENOVO_EC_EVENT_HPD:
+		ucsi_connector_change(uec->ucsi, 1);
+		return NOTIFY_OK;
+
+	case LENOVO_EC_EVENT_UCSI:
+		ret = uec->ucsi->ops->read(uec->ucsi, UCSI_CCI, &cci, sizeof(cci));
+		if (ret)
+			return NOTIFY_DONE;
+
+		yoga_c630_ucsi_notify_ucsi(uec, cci);
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct yoga_c630_ec *ec = adev->dev.platform_data;
+	struct yoga_c630_ucsi *uec;
+	int ret;
+
+	uec = devm_kzalloc(&adev->dev, sizeof(*uec), GFP_KERNEL);
+	if (!uec)
+		return -ENOMEM;
+
+	uec->ec = ec;
+	init_completion(&uec->complete);
+	uec->nb.notifier_call = yoga_c630_ucsi_notify;
+
+	uec->ucsi = ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);
+	if (IS_ERR(uec->ucsi))
+		return PTR_ERR(uec->ucsi);
+
+	ucsi_set_drvdata(uec->ucsi, uec);
+
+	uec->version = yoga_c630_ec_ucsi_get_version(uec->ec);
+
+	auxiliary_set_drvdata(adev, uec);
+
+	ret = yoga_c630_ec_register_notify(ec, &uec->nb);
+	if (ret)
+		return ret;
+
+	return ucsi_register(uec->ucsi);
+}
+
+static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
+{
+	struct yoga_c630_ucsi *uec = auxiliary_get_drvdata(adev);
+
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+	ucsi_unregister(uec->ucsi);
+}
+
+static const struct auxiliary_device_id yoga_c630_ucsi_id_table[] = {
+	{ .name = YOGA_C630_MOD_NAME "." YOGA_C630_DEV_UCSI, },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, yoga_c630_ucsi_id_table);
+
+static struct auxiliary_driver yoga_c630_ucsi_driver = {
+	.name = YOGA_C630_DEV_UCSI,
+	.id_table = yoga_c630_ucsi_id_table,
+	.probe = yoga_c630_ucsi_probe,
+	.remove = yoga_c630_ucsi_remove,
+};
+
+module_auxiliary_driver(yoga_c630_ucsi_driver);
+
+MODULE_DESCRIPTION("Lenovo Yoga C630 UCSI");
+MODULE_LICENSE("GPL");

-- 
2.39.2


