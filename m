Return-Path: <linux-arm-msm+bounces-36772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15789B9561
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55616282577
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5639B1CBEB5;
	Fri,  1 Nov 2024 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhqCtCuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0258148FE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730478609; cv=none; b=N6WN/gdrFGF6kWI59+5fwd++fDDzKOgob6QbYLQ9xM058azwAQFsGS6sEyrrpd8m9ABya9/LvmFqQfrk87fc91wNF/ntkt/Ow60kXxfhg9Rry84RXtYqZU1FZ/3DYPqDZFZ31Er2JDLXR1VsmR3NQSaVXzphcgXWcrqGnRcGpqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730478609; c=relaxed/simple;
	bh=3xRslzas26y3QTwNS7QcGuFPCnAXHVwX911AU3DnbH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvdDf4w9oCQ3zWcR9O+oS+Bb5hRtKqW8vkApbjWFgWB1IR0YYxEV+emonpBzlNZcSVIdJ6k1WYtJtlAQEge1eIt8X+Rruu1UWyLT4mCoQ3G0BWi0lcjJ1GUp2eFW9yqowBcN4I6PoiovX2Zt7YLzCtXj6ZV2koEAsQHSElVyoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhqCtCuA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f8490856so2314621e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730478604; x=1731083404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBIrPNuNwft7tjOqJXlD1Jeu8KmYSVfVuxFU0QFdkio=;
        b=GhqCtCuAcMdqqgZsKyYx6oFYEwUnF6jnsJc9TDWIX1GhHmOcIhCGTakDpSGxTLg66Z
         uYYik1txTyt98U5dyrgd3NoWzsF8kI0O+JdKNN2oPVvQIIMEzm7xDkYnDnQTRMinkNW4
         6chtFobEjnx1EYjfGl8M/iVoaGI2pXWuCP4NAlyqC8bnhziGfCajNRPaz81o7R8jW+va
         8d8zlNNjBaoo3/SILBVwPkxXEGE35eA4K3k1zKLf3zPwwuLMEwGLe3NapOVu+vE4GD2l
         rrfn4zZlHosp9UtkDQJUKr+9zd5FxphlRNa3nZ3lP4vC0BcCtpp/x3eO/Kt0EJFGE0BF
         mqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730478604; x=1731083404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBIrPNuNwft7tjOqJXlD1Jeu8KmYSVfVuxFU0QFdkio=;
        b=tSgxyp0gm8k4/QJAP5gf4rllQr1Oyq1m/Nu4inRCk4j14VpzPkcsaEMGgFfks1M4rv
         cjjpwwy56Bz9qIAMFQ28tadKEdgYPsND7XmReu0Pc6xu87uwPxPu94N9IuflBsJvQs3p
         vvejtwtBS6oSh/VaiYX8Cn3uESKje4q4t/Gut8wieNMtxcxmT15s4D7P489GZJ0WlHWs
         dx+KhF5E0yy7XW7ENMU9YOtmC3ROzvhNanvQGqF//ANthvpqKSQLw8yPKyEjg/1L4HVX
         zwcYQkAgeheZ6Ms6F/f6Gx36Rl4/aoBwCLo2a71bnvCdAJjvkhc6SpsJ7skYsciY6+NF
         CQig==
X-Gm-Message-State: AOJu0YwAyo/a0/7YLmC6ooRxneqyCskxHrhnppvHlvVK+HiiC45HUJiF
	JMwEdy+/lFmUR8N4Ie+aYxhecMuSXYdPvS3/o8mZN97geeODikBeAhOywODmgew=
X-Google-Smtp-Source: AGHT+IGV7q9TfT2byS8f3k/vv/HG0HcWomVAY9s+/+XZM1o7Nd0s7ddZVLK8PWliSLyFlXiCeF5b7w==
X-Received: by 2002:a05:6512:3d16:b0:539:f763:789d with SMTP id 2adb3069b0e04-53c79e91262mr4361035e87.43.1730478603662;
        Fri, 01 Nov 2024 09:30:03 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d69845csm66697555e9.47.2024.11.01.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 09:30:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 01 Nov 2024 18:29:40 +0200
Subject: [PATCH v4 2/4] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-x1e80100-ps8830-v4-2-f0f7518b263e@linaro.org>
References: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
In-Reply-To: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13913; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=3xRslzas26y3QTwNS7QcGuFPCnAXHVwX911AU3DnbH0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnJQIAjqPcONprsfWqlNxOTddupluA+i+wZ7i0W
 K9oaj7kLSeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyUCAAAKCRAbX0TJAJUV
 VpQlD/9/zdWV4fJfmZWPeU0oN1/8EDD6IO95j78jFMaekfKIvi1bzzNZB3xkkoXY4KKasGtRZzh
 15Es/D22YL294dkzOdFZf8VIrbWnpJiqijl4KnGrDWbdgpqlYNP5qGOuXSV3j8LX6VAWbzMIyDx
 ZNgja+W4mdb0b2Oaud4ViO2F7ebCwJpP6ZxyUi2oXW3WqFYAJclNUx+Vz5EdxBYb4OnDtY8Lqjw
 oRcM0bAsgyk+uaVqVIP7HnN9fP+axKKmvN0F2j8ACqtgwxftX42ofMQ5k1cWdFWFRRrAk0lbsAN
 j8QbYLDpG2M7gV3iQ2CX40eqhkOQI1X8FcZPCef5n3j/UVd2r/3qHutW6th4eB8rEbkJvFfD4/F
 ofH2u4/SS0oFMPAHaFX7k93Yrw36my91vmpsOywji/WEEhZlNe7Qg7P1MCGSdgd0Sr5OISnDHQb
 HNJq+KctVPHtXwpRkVzDvRDrreQ9T31cYaNcnCY5BuuQK4iLjJ2/t/uFSL0UwrPzpoqozChUd5g
 o07n3aef1tQ1dNhxDUE/eMsdWhCOuH40vDCOdsYPYUhvN5Eb4KOtJHJOSrVziefSNMJ1Rwl2fB8
 ZLhdQ21P7RKL8Iy4gfO+rudnICPTkW16UNBHS69DRJ5qC0Jx/NR28gcSRp7LlNXz/0Oyj3sdaaS
 IlncEvi8eDSauWA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
controlled over I2C. It usually sits between a USB/DisplayPort PHY
and the Type-C connector, and provides orientation and altmode handling.

The boards that use this retimer are the ones featuring the Qualcomm
Snapdragon X Elite SoCs.

Add a driver with support for the following modes:
 - DisplayPort 4-lanes
 - DisplayPort 2-lanes + USB3
 - USB3

There is another variant of this retimer which is called PS8833. It seems
to be really similar to the PS8830, so future-proof this driver by
naming it ps883x.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/usb/typec/mux/Kconfig  |  10 +
 drivers/usb/typec/mux/Makefile |   1 +
 drivers/usb/typec/mux/ps883x.c | 422 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 433 insertions(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index ce7db6ad30572a0a74890f5f11944fb3ff07f635..10c3464324dd7226e0c7304a99d6a558d3743553 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -56,6 +56,16 @@ config TYPEC_MUX_NB7VPQ904M
 	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
 	  redriver chip found on some devices with a Type-C port.
 
+config TYPEC_MUX_PS883X
+	tristate "Parade PS883x Type-C retimer driver"
+	depends on I2C
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
+	select REGMAP_I2C
+	help
+	  Say Y or M if your system has a Parade PS883x Type-C retimer chip
+	  found on some devices with a Type-C port.
+
 config TYPEC_MUX_PTN36502
 	tristate "NXP PTN36502 Type-C redriver driver"
 	depends on I2C
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
index bb96f30267af05b33b9277dcf1cc0e1527d2dcdd..732aded5f0590b21d45deb07bb9751d807c115f7 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -6,5 +6,6 @@ obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
 obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
 obj-$(CONFIG_TYPEC_MUX_IT5205)		+= it5205.o
 obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)	+= nb7vpq904m.o
+obj-$(CONFIG_TYPEC_MUX_PS883X)		+= ps883x.o
 obj-$(CONFIG_TYPEC_MUX_PTN36502)	+= ptn36502.o
 obj-$(CONFIG_TYPEC_MUX_WCD939X_USBSS)	+= wcd939x-usbss.o
diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
new file mode 100644
index 0000000000000000000000000000000000000000..101e3dc3a867601f13385f55935af5a9701e7ec3
--- /dev/null
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Parade ps883x usb retimer driver
+ *
+ * Copyright (C) 2024 Linaro Ltd.
+ */
+
+#include <drm/bridge/aux-bridge.h>
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_retimer.h>
+
+struct ps883x_retimer {
+	struct i2c_client *client;
+	struct gpio_desc *reset_gpio;
+	struct regmap *regmap;
+	struct typec_switch_dev *sw;
+	struct typec_retimer *retimer;
+	struct clk *xo_clk;
+	struct regulator *vdd_supply;
+	struct regulator *vdd33_supply;
+	struct regulator *vdd33_cap_supply;
+	struct regulator *vddat_supply;
+	struct regulator *vddar_supply;
+	struct regulator *vddio_supply;
+
+	struct typec_switch *typec_switch;
+	struct typec_mux *typec_mux;
+
+	struct mutex lock; /* protect non-concurrent retimer & switch */
+
+	enum typec_orientation orientation;
+	unsigned long mode;
+	unsigned int svid;
+};
+
+static void ps883x_configure(struct ps883x_retimer *retimer, int cfg0, int cfg1, int cfg2)
+{
+	regmap_write(retimer->regmap, 0x0, cfg0);
+	regmap_write(retimer->regmap, 0x1, cfg1);
+	regmap_write(retimer->regmap, 0x2, cfg2);
+}
+
+static int ps883x_set(struct ps883x_retimer *retimer)
+{
+	int cfg0 = 0x00;
+	int cfg1 = 0x00;
+	int cfg2 = 0x00;
+
+	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
+	    retimer->mode == TYPEC_STATE_SAFE) {
+		ps883x_configure(retimer, 0x1, 0x0, 0x0);
+		return 0;
+	}
+
+	if (retimer->mode != TYPEC_STATE_USB && retimer->svid != USB_TYPEC_DP_SID)
+		return -EINVAL;
+
+	if (retimer->orientation == TYPEC_ORIENTATION_NORMAL)
+		cfg0 = 0x01;
+	else
+		cfg0 = 0x03;
+
+	switch (retimer->mode) {
+	case TYPEC_STATE_USB:
+		cfg0 |= 0x20;
+		break;
+
+	case TYPEC_DP_STATE_C:
+		cfg1 = 0x85;
+		break;
+
+	case TYPEC_DP_STATE_D:
+		cfg0 |= 0x20;
+		cfg1 = 0x85;
+		break;
+
+	case TYPEC_DP_STATE_E:
+		cfg1 = 0x81;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ps883x_configure(retimer, cfg0, cfg1, cfg2);
+
+	return 0;
+}
+
+static int ps883x_sw_set(struct typec_switch_dev *sw,
+			 enum typec_orientation orientation)
+{
+	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
+	int ret = 0;
+
+	ret = typec_switch_set(retimer->typec_switch, orientation);
+	if (ret)
+		return ret;
+
+	mutex_lock(&retimer->lock);
+
+	if (retimer->orientation != orientation) {
+		retimer->orientation = orientation;
+
+		ret = ps883x_set(retimer);
+	}
+
+	mutex_unlock(&retimer->lock);
+
+	return ret;
+}
+
+static int ps883x_retimer_set(struct typec_retimer *rtmr,
+			      struct typec_retimer_state *state)
+{
+	struct ps883x_retimer *retimer = typec_retimer_get_drvdata(rtmr);
+	struct typec_mux_state mux_state;
+	int ret = 0;
+
+	mutex_lock(&retimer->lock);
+
+	if (state->mode != retimer->mode) {
+		retimer->mode = state->mode;
+
+		if (state->alt)
+			retimer->svid = state->alt->svid;
+		else
+			retimer->svid = 0; // No SVID
+
+		ret = ps883x_set(retimer);
+	}
+
+	mutex_unlock(&retimer->lock);
+
+	if (ret)
+		return ret;
+
+	mux_state.alt = state->alt;
+	mux_state.data = state->data;
+	mux_state.mode = state->mode;
+
+	return typec_mux_set(retimer->typec_mux, &mux_state);
+}
+
+static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
+{
+	struct device *dev = &retimer->client->dev;
+	int ret;
+
+	ret = regulator_enable(retimer->vdd33_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(retimer->vdd33_cap_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
+		goto err_vdd33_disable;
+	}
+
+	usleep_range(4000, 10000);
+
+	ret = regulator_enable(retimer->vdd_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
+		goto err_vdd33_cap_disable;
+	}
+
+	ret = regulator_enable(retimer->vddar_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
+		goto err_vdd_disable;
+	}
+
+	ret = regulator_enable(retimer->vddat_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
+		goto err_vddar_disable;
+	}
+
+	ret = regulator_enable(retimer->vddio_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
+		goto err_vddat_disable;
+	}
+
+	return 0;
+
+err_vddat_disable:
+	regulator_disable(retimer->vddat_supply);
+err_vddar_disable:
+	regulator_disable(retimer->vddar_supply);
+err_vdd_disable:
+	regulator_disable(retimer->vdd_supply);
+err_vdd33_cap_disable:
+	regulator_disable(retimer->vdd33_cap_supply);
+err_vdd33_disable:
+	regulator_disable(retimer->vdd33_supply);
+
+	return ret;
+}
+
+static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
+{
+	regulator_disable(retimer->vddio_supply);
+	regulator_disable(retimer->vddat_supply);
+	regulator_disable(retimer->vddar_supply);
+	regulator_disable(retimer->vdd_supply);
+	regulator_disable(retimer->vdd33_cap_supply);
+	regulator_disable(retimer->vdd33_supply);
+}
+
+static int ps883x_get_vregs(struct ps883x_retimer *retimer)
+{
+	struct device *dev = &retimer->client->dev;
+
+	retimer->vdd_supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(retimer->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vdd_supply),
+				     "failed to get VDD\n");
+
+	retimer->vdd33_supply = devm_regulator_get(dev, "vdd33");
+	if (IS_ERR(retimer->vdd33_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vdd33_supply),
+				     "failed to get VDD 3.3V\n");
+
+	retimer->vdd33_cap_supply = devm_regulator_get(dev, "vdd33-cap");
+	if (IS_ERR(retimer->vdd33_cap_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vdd33_cap_supply),
+				     "failed to get VDD CAP 3.3V\n");
+
+	retimer->vddat_supply = devm_regulator_get(dev, "vddat");
+	if (IS_ERR(retimer->vddat_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vddat_supply),
+				     "failed to get VDD AT\n");
+
+	retimer->vddar_supply = devm_regulator_get(dev, "vddar");
+	if (IS_ERR(retimer->vddar_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vddar_supply),
+				     "failed to get VDD AR\n");
+
+	retimer->vddio_supply = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(retimer->vddio_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vddio_supply),
+				     "failed to get VDD IO\n");
+
+	return 0;
+}
+
+static const struct regmap_config ps883x_retimer_regmap = {
+	.max_register = 0x1f,
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ps883x_retimer_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct typec_switch_desc sw_desc = { };
+	struct typec_retimer_desc rtmr_desc = { };
+	struct ps883x_retimer *retimer;
+	int ret;
+
+	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
+	if (!retimer)
+		return -ENOMEM;
+
+	retimer->client = client;
+
+	mutex_init(&retimer->lock);
+
+	retimer->regmap = devm_regmap_init_i2c(client, &ps883x_retimer_regmap);
+	if (IS_ERR(retimer->regmap)) {
+		ret = PTR_ERR(retimer->regmap);
+		dev_err(dev, "failed to allocate register map: %d\n", ret);
+		return ret;
+	}
+
+	ret = ps883x_get_vregs(retimer);
+	if (ret)
+		return ret;
+
+	retimer->xo_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(retimer->xo_clk))
+		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
+				     "failed to get xo clock\n");
+
+	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(retimer->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	retimer->typec_switch = typec_switch_get(dev);
+	if (IS_ERR(retimer->typec_switch))
+		return dev_err_probe(dev, PTR_ERR(retimer->typec_switch),
+				     "failed to acquire orientation-switch\n");
+
+	retimer->typec_mux = typec_mux_get(dev);
+	if (IS_ERR(retimer->typec_mux)) {
+		ret = dev_err_probe(dev, PTR_ERR(retimer->typec_mux),
+				    "failed to acquire mode-mux\n");
+		goto err_switch_put;
+	}
+
+	ret = drm_aux_bridge_register(dev);
+	if (ret)
+		goto err_mux_put;
+
+	ret = clk_prepare_enable(retimer->xo_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable XO: %d\n", ret);
+		goto err_mux_put;
+	}
+
+	ret = ps883x_enable_vregs(retimer);
+	if (ret)
+		goto err_clk_disable;
+
+	sw_desc.drvdata = retimer;
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.set = ps883x_sw_set;
+
+	retimer->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(retimer->sw)) {
+		ret = PTR_ERR(retimer->sw);
+		dev_err(dev, "failed to register typec switch: %d\n", ret);
+		goto err_vregs_disable;
+	}
+
+	rtmr_desc.drvdata = retimer;
+	rtmr_desc.fwnode = dev_fwnode(dev);
+	rtmr_desc.set = ps883x_retimer_set;
+
+	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
+	if (IS_ERR(retimer->retimer)) {
+		ret = PTR_ERR(retimer->retimer);
+		dev_err(dev, "failed to register typec retimer: %d\n", ret);
+		goto err_switch_unregister;
+	}
+
+	/* skip resetting if already configured */
+	if (regmap_test_bits(retimer->regmap, 0x00, BIT(0)))
+		return 0;
+
+	gpiod_direction_output(retimer->reset_gpio, 1);
+
+	/* VDD IO supply enable to reset release delay */
+	usleep_range(4000, 14000);
+
+	gpiod_set_value(retimer->reset_gpio, 0);
+
+	/* firmware initialization delay */
+	msleep(60);
+
+	return 0;
+
+err_switch_unregister:
+	typec_switch_unregister(retimer->sw);
+err_vregs_disable:
+	ps883x_disable_vregs(retimer);
+err_clk_disable:
+	clk_disable_unprepare(retimer->xo_clk);
+err_mux_put:
+	typec_mux_put(retimer->typec_mux);
+err_switch_put:
+	typec_switch_put(retimer->typec_switch);
+
+	return ret;
+}
+
+static void ps883x_retimer_remove(struct i2c_client *client)
+{
+	struct ps883x_retimer *retimer = i2c_get_clientdata(client);
+
+	typec_retimer_unregister(retimer->retimer);
+	typec_switch_unregister(retimer->sw);
+
+	gpiod_set_value(retimer->reset_gpio, 1);
+
+	regulator_disable(retimer->vddio_supply);
+	regulator_disable(retimer->vddat_supply);
+	regulator_disable(retimer->vddar_supply);
+	regulator_disable(retimer->vdd_supply);
+	regulator_disable(retimer->vdd33_cap_supply);
+	regulator_disable(retimer->vdd33_supply);
+
+	clk_disable_unprepare(retimer->xo_clk);
+
+	typec_mux_put(retimer->typec_mux);
+	typec_switch_put(retimer->typec_switch);
+}
+
+static const struct of_device_id ps883x_retimer_of_table[] = {
+	{ .compatible = "parade,ps8830" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ps883x_retimer_of_table);
+
+static struct i2c_driver ps883x_retimer_driver = {
+	.driver = {
+		.name = "ps883x_retimer",
+		.of_match_table = ps883x_retimer_of_table,
+	},
+	.probe		= ps883x_retimer_probe,
+	.remove		= ps883x_retimer_remove,
+};
+
+module_i2c_driver(ps883x_retimer_driver);
+
+MODULE_DESCRIPTION("Parade ps883x Type-C Retimer driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


