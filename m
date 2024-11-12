Return-Path: <linux-arm-msm+bounces-37661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A19C5E24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D76281B1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F22C215039;
	Tue, 12 Nov 2024 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xpBPuFY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAAE2144B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430899; cv=none; b=VJWKkG9NKtV0B4cZCzMIK4ZR4RdtnpjtQLl5YJ7Dpvvtouh03Lvv3KZCfE7LNv0vJKJf06IBP33g23yNJfrKFH6zPmOFKgkVCrePM02NyA3E3XH2sKvTmWs8Ho7UB6X58zd2gsFs6u3OLriYUi6Lc13H5gb2nrXsrgKCO+b3fAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430899; c=relaxed/simple;
	bh=gKsNo34eTR5e/XIJURjIoPFHu63ccJTygJajHjh9qjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmLEOSdduKG0GQx14wyn9fUhAaS33zCCXHYKZm+WKr98CRKONlleueNhJusVAkaRFBIxfrIyQfuxyzeGgkTDus4/suLgjRLP4Yo3PQLkshtjS1f186EIPCWrQbwH4XGG9Y3djAgstksQml0fb3ZN7C2JbsyVudXeDg5CClmMKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xpBPuFY8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4319399a411so56261275e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731430895; x=1732035695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXDkw0UP+V48h7JGNE40mW0FZDmkOXY/pSkLl94urJs=;
        b=xpBPuFY84FSOrsnzwXYvCGue2E99SP/nX4fUUpwD+wEDKSBh9Hj1v3++oz44qlIHCz
         OExI3xBCcOZJvX2NjVvD6lxsKJbSIAt+nwL3GH8iA+Gjpq/A84imU+KySDIAVfOvq4Iv
         q74Wu43nvGt2y7BzZldQs3E7Y8h+QcgSsFhZ1kqaqfYHWO/XH5iINSVDgNC537mPXyb6
         cAw+2DdG60uQ6TlESPf7hx17VxumkDrTGZe73P6Wfsl4mMHoVs9bJ5e0Yk//i43b2nbm
         j6DFFqa/q1KIlPF0z5hfyBRr893ooESwOZKc4DhjNsHTjejhol6gEnFufAWB7hp571C4
         UzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731430895; x=1732035695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXDkw0UP+V48h7JGNE40mW0FZDmkOXY/pSkLl94urJs=;
        b=d7jz6UwLycCCBT8BuNl2phue7Y1o5QGFiN2coGTLYAZ+1FMMR9aGjpaMd32tqw2iKH
         zyZy6XJT5Mct3jRCN6Y7Und4mcFki7MgGAysqoXJ+gl3rtGRnb3utP2iiWmPLGqNpZ8L
         9GSJ7v8PuoIFT9CXrneLYmPMgFDj4HmZO5vDIWgzJnVsq4UwKUemUA42Yzy4/T/S1TGr
         Q9XQiVtQZYt0czJriQhOtdCyEQlpmpKqiq1MuCfN1YPtiLrjVVI9xy7Fdj7N2m0+a43x
         5BpbSCzh0Al944NcKyBgkmbFfZdO1OILzI3y2qo8U4sQkBd3riylUfqNmFgq01M5ixdz
         LH0A==
X-Forwarded-Encrypted: i=1; AJvYcCXc627E+n8/5Vdw4tOgcp821onRhtCZ3GHnUWEmMjKW87YP8bRNxLPP0eKH8GFQwbpXxfWTdfrIYUjQbU5g@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9w++tnzdh8qc+TSfcvfWZfa5pbla7ibnQ1/LMYhqRv4rdMcC
	JJCXCEVsxusGQfaosm8j3BFKbxwRSdSyCksRDAUkbLmN55a0PgtbaHAdtKlozmQ=
X-Google-Smtp-Source: AGHT+IGij5t2IeXv+csfZ0WqpurW6iJlB4rzHX1GgmJ67JSvIVCySyeCLiNgQKS6a4phGfyJ78TlfQ==
X-Received: by 2002:a05:600c:3115:b0:431:7ca6:57b1 with SMTP id 5b1f17b1804b1-432b751c564mr138659355e9.32.1731430894809;
        Tue, 12 Nov 2024 09:01:34 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053051fsm215018895e9.6.2024.11.12.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:01:34 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Nov 2024 19:01:11 +0200
Subject: [PATCH v5 2/6] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-x1e80100-ps8830-v5-2-4ad83af4d162@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
In-Reply-To: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14799; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=gKsNo34eTR5e/XIJURjIoPFHu63ccJTygJajHjh9qjM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnM4njU93+dfG0llmx5rCI9W1ufwIytifrRYZJk
 xyUirlFEFSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZzOJ4wAKCRAbX0TJAJUV
 VjxqEACvgbL4bLq4QbMjp+08Wb5fjzG7s4YIFHcIJAnbX+2ymZOBiW89G3ECx7bfFa9hU3RRRMn
 Pi73X66fdOKhCA5ygRo/uFhvDAPyXtVEj8v9qvu2Qq180xorqRCwXDm4Sl8P2Xfb4QpyGYm97KN
 X9Odu8flB7hTBMK9vRaVmhBD0zOPRI1LRMwHYC8S4AJAKF5v6Pk8DUylvNVaVzWXRGn3J3NuC00
 oR2Ovi2q210/S+mQSe4hVFH9u+g1VX5zdRVji5WqyQJWI0w+02MT7q5bM85Km5GAb8GhojWqUnV
 Jg8b+ockpynk2xafOUb1MfJ/xOMovFJ2FL1DYPoDdAwChywVZ0hicJyWqKL+YNPY5CBW558QUNl
 kjbpAYkzKYDEFVEYCRWQb9AXxgcqRx/0KhbkrTP6mktgsZnC+sn7Bqx591hlIx0fX3EmuvDXeDX
 90FAKEXLLsOM8SY3AfHZOQ6eBP6ANuH1lf0ejGE4GbnkY0daYfb4y419MFcjEYJ/XVUYaWc7XLl
 OA+K4Ax1IT5+/gaMdyBocjZYz1RVbGN9Dzw22gwRNGaagc92zRa1t7CfoRPUXZRt+CVEoa4PqIe
 6ZVKiEhGz5Ltdt0hNk/BFDovBiJTFu+Q2GedjxbzA7SrJYbOCV0LcOqjPbLbWx9Zmu7WLWM6Ovx
 7JignuUhyhPixag==
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
 drivers/usb/typec/mux/ps883x.c | 437 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 448 insertions(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 67381b4ef4f68f4a6e73f157365ee24d0ab7109a..6dd8f961b593261fde1d39b238b981966e463599 100644
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
index 60879446da9365183567d3374a2fb7b5171fb3d7..b4f599eb5053b8f20e9a41409b0a2d9a03d850b6 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
 obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
 obj-$(CONFIG_TYPEC_MUX_IT5205)		+= it5205.o
 obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)	+= nb7vpq904m.o
+obj-$(CONFIG_TYPEC_MUX_PS883X)		+= ps883x.o
 obj-$(CONFIG_TYPEC_MUX_PTN36502)	+= ptn36502.o
 obj-$(CONFIG_TYPEC_MUX_TUSB1046)	+= tusb1046.o
 obj-$(CONFIG_TYPEC_MUX_WCD939X_USBSS)	+= wcd939x-usbss.o
diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
new file mode 100644
index 0000000000000000000000000000000000000000..3650e5d124727d9b9833302092331bf7f6f7b003
--- /dev/null
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -0,0 +1,437 @@
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
+#define REG_USB_PORT_CONN_STATUS_0		0x00
+
+#define CONN_STATUS_0_CONNECTION_PRESENT	BIT(0)
+#define CONN_STATUS_0_ORIENTATION_REVERSED	BIT(1)
+#define CONN_STATUS_0_USB_3_1_CONNECTED		BIT(5)
+
+#define REG_USB_PORT_CONN_STATUS_1		0x01
+
+#define CONN_STATUS_1_DP_CONNECTED		BIT(0)
+#define CONN_STATUS_1_DP_SINK_REQUESTED		BIT(1)
+#define CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D	BIT(2)
+#define CONN_STATUS_1_DP_HPD_LEVEL		BIT(7)
+
+#define REG_USB_PORT_CONN_STATUS_2		0x02
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
+static void ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
+			     int cfg1, int cfg2)
+{
+	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
+	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_1, cfg1);
+	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_2, cfg2);
+}
+
+static int ps883x_set(struct ps883x_retimer *retimer)
+{
+	int cfg0 = CONN_STATUS_0_CONNECTION_PRESENT;
+	int cfg1 = 0x00;
+	int cfg2 = 0x00;
+
+	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
+	    retimer->mode == TYPEC_STATE_SAFE) {
+		ps883x_configure(retimer, cfg0, cfg1, cfg2);
+		return 0;
+	}
+
+	if (retimer->mode != TYPEC_STATE_USB && retimer->svid != USB_TYPEC_DP_SID)
+		return -EINVAL;
+
+	if (retimer->orientation == TYPEC_ORIENTATION_REVERSE)
+		cfg0 |= CONN_STATUS_0_ORIENTATION_REVERSED;
+
+	switch (retimer->mode) {
+	case TYPEC_STATE_USB:
+		cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
+		break;
+
+	case TYPEC_DP_STATE_C:
+		cfg1 = CONN_STATUS_1_DP_CONNECTED |
+		       CONN_STATUS_1_DP_SINK_REQUESTED |
+		       CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D |
+		       CONN_STATUS_1_DP_HPD_LEVEL;
+		break;
+
+	case TYPEC_DP_STATE_D:
+		cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
+		cfg1 = CONN_STATUS_1_DP_CONNECTED |
+		       CONN_STATUS_1_DP_SINK_REQUESTED |
+		       CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D |
+		       CONN_STATUS_1_DP_HPD_LEVEL;
+		break;
+
+	case TYPEC_DP_STATE_E:
+		cfg1 = CONN_STATUS_1_DP_CONNECTED |
+		       CONN_STATUS_1_DP_HPD_LEVEL;
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
+	if (IS_ERR(retimer->regmap))
+		return dev_err_probe(dev, PTR_ERR(retimer->regmap),
+				     "failed to allocate register map\n");
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
+	ret = ps883x_enable_vregs(retimer);
+	if (ret)
+		goto err_mux_put;
+
+	ret = clk_prepare_enable(retimer->xo_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable XO: %d\n", ret);
+		goto err_vregs_disable;
+	}
+
+	sw_desc.drvdata = retimer;
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.set = ps883x_sw_set;
+
+	retimer->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(retimer->sw)) {
+		ret = dev_err_probe(dev, PTR_ERR(retimer->sw),
+				    "failed to register typec switch\n");
+		goto err_clk_disable;
+	}
+
+	rtmr_desc.drvdata = retimer;
+	rtmr_desc.fwnode = dev_fwnode(dev);
+	rtmr_desc.set = ps883x_retimer_set;
+
+	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
+	if (IS_ERR(retimer->retimer)) {
+		ret = dev_err_probe(dev, PTR_ERR(retimer->sw),
+				    "failed to register typec retimer\n");
+		goto err_switch_unregister;
+	}
+
+	/* skip resetting if already configured */
+	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
+			     CONN_STATUS_0_CONNECTION_PRESENT))
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
+	clk_disable_unprepare(retimer->xo_clk);
+
+	ps883x_disable_vregs(retimer);
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


