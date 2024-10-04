Return-Path: <linux-arm-msm+bounces-33129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39199051D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6805B283E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0578B21BAFB;
	Fri,  4 Oct 2024 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LeLNDwmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA76F2178F6
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050280; cv=none; b=AoFDXFJr/6qG6fhLIZr4seMe1yeJSEExd5dGe60zFHAJvbK+3Bdmyraelc1I+pBQ8I+uMnAySKGNfLUuAl82l047SNmBtN3w3lK+W1+PW54GQ1oq3ceizcuTQmVR5TbKZEXVj2yscehDv9dFptxdbJWgO0yPPX/evraToF2+hHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050280; c=relaxed/simple;
	bh=MOsAwTocnT8Bs9P4rYzCLm6wsbez+HGmyV8KqKMXs7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6lYr2zr67RQIGvXfBHms/iyXU8U73GEVfiTBkI4LWlL+4cEz/gv7YNpI+ICc42cYL6pEgSqtQLoTM0sKcFOPtihcaUhFtv8DcRZFj4/cvGAZ1uDBheinotkkv3EJ8BDBnHJyf6FYy7O104F2cGauV4B5wLfpodMTJbK6VpxBeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LeLNDwmE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37cd26c6dd1so2118271f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728050277; x=1728655077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNm/UG5Qf3sDk/kO2ZiuuzZ8OFLCUh9B0vH0eR1WPlE=;
        b=LeLNDwmEvlgvVROnto6jMWGpC1p+ozqjtqBMv0XhMTMff+1Lgjmn7wXhYtvAmOY7i+
         TReGgKDbzr+iQnDz78x1CxfDMrulIrkcnbBSsIXke3aERHFGVCR3XxYZe335WaXW1sOn
         jMIv3z0mhhbXNsmM4zqd2M7+39YHJRQST9CpplydmmjhMrW5sE1ADO/1whNd4G0xRXno
         jhnQtQDzVkw/LpGRj7pETsGOT98PxMjAq620f77uRCrlHQpeeBGw1suRhQd6N9durCm3
         gXj4PJF4S1MMLs1j3fh8ECShoaWwWBd2tAMW+Tk7oQj14vzkAq+JovJBlwiDLhqOrc+C
         TiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050277; x=1728655077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNm/UG5Qf3sDk/kO2ZiuuzZ8OFLCUh9B0vH0eR1WPlE=;
        b=VrNXnfaSRSy1scbflKBohGYJRbyUL2T6afTR1OHx+KuNURkdxSlG4bSzCM1jM6VL8v
         5lDn0ZIJ9AwL021K/daWKtkP5avNjlrdDP4sM7OlnGRS4LHD4rMbXuSxcwU9DvwbGD9S
         q3eX+q+uasRDyH1QPZQeGg9cWLiS4Coypr8USZnndkNjZFHiLN8e3zn2nTumOf/++60J
         8cizrKmHXtnDa/Ay4f5LB3fqEKrOnFwyjN84bGCjMbq5IBJcwI738VGaHOFDbSBPrxjN
         MD/ZzMjGWVE4jR0NsF30B5JJ0vu7EZkB7rcbqE1XMN33xkFaWD6xKq/okEPcR5aGUSkT
         pQTQ==
X-Gm-Message-State: AOJu0Yzg0U+9VmMceSV7859dbplf3JCEa405aCpD3/+cH/71HFgDuhsT
	2QEeZ8B4i2XtIl38R+iFZZ6UFcMb8ki96cNAbkmKYeRnwtsoqkhgAF2wfiQw8vE=
X-Google-Smtp-Source: AGHT+IGj6b66dfo8jr6SIY+ra1Qw4TIW0tVfVCE53sIc4n5sDU0/qK43ad5PbtfY04jSBk09rMkr2g==
X-Received: by 2002:adf:a30a:0:b0:37c:d1d2:dbe3 with SMTP id ffacd0b85a97d-37d0e8f133bmr2335081f8f.54.1728050276844;
        Fri, 04 Oct 2024 06:57:56 -0700 (PDT)
Received: from [127.0.1.1] ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d08215cd6sm3302550f8f.28.2024.10.04.06.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:57:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 04 Oct 2024 16:57:38 +0300
Subject: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
In-Reply-To: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13284; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=MOsAwTocnT8Bs9P4rYzCLm6wsbez+HGmyV8KqKMXs7M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm//Re2C+RUme5X/cpoXLAb+ielJhHFKJ/YI4fF
 36IWQ5MfzGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZv/0XgAKCRAbX0TJAJUV
 VuwqD/4uRQtoRTwEyQxaxR3rP7eGCX7C4hZHj9NT3IQsxmydMoX3Fyn/nQ/TfSuHQFoH0EN64b+
 6VxnBOR8Cp8HBrvePk88w/eX+vfuga+BXT6gCSvgKVRKKCMmJgdx3H8NLcnVFaNHJ7Dg70Xs4hz
 XStuYAtG9DJ4ufx9lu1vwB4jHoofGBXsY+UDoYrrYzbcWYsHzViOfJXI3g9cCyAhfnf/aMMAZPp
 0Ro5F0pcqkXQ81VMh+7zuGEgHfDXC9qpoO4vzPJucglHlTiUb/ag7DOI3uzwAzB83Gw3NmoZFxY
 Ag42OLMrxh4eX9h4S+T+PgHM5WaAc97wdTkXO1Vau7Rv75ZiYPaglEE2/d1y7qDJ8fQOloeI9Sj
 WjTPcI0XxwwA0BH3u98ZNu3QVFJSBLtJTEIE87AfZBgr8rBRUUnkXKM7Y+kbystBqWTuFgffqnT
 NtQH6OWp0M0aa9UuXRj8v8CcVyTR8MATls1e3E2HxsnpOKbkLQEzg473NwxbFXgSRG1TRKGFFQs
 vuM/OLTn+HQ04SCctIPt0CqhVxZyl7p1HIS+D1GirWVJTzzjv4KbWSVN5Kk+xr3qtRQSpb1IXr1
 f83bGbaXeDY1UmMIqOIlzLJJWqdwAXImUgZRsfuQ3W5FxTc1CwPBekuai786msJOmZAwzU+b9MN
 MGIv3XqEXaUkC+g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Parade PS8830 is a Type-C muti-protocol retimer controlled over I2C.
It provides both altmode and orientation handling.

Add a driver with support for the following modes:
 - DP 4lanes
 - DP 2lanes + USB3
 - USB3

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/usb/typec/mux/Kconfig  |  10 +
 drivers/usb/typec/mux/Makefile |   1 +
 drivers/usb/typec/mux/ps8830.c | 424 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 435 insertions(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index ce7db6ad30572a0a74890f5f11944fb3ff07f635..48613b67f1c5dacd14d54baf91c3066377cf97be 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -56,6 +56,16 @@ config TYPEC_MUX_NB7VPQ904M
 	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
 	  redriver chip found on some devices with a Type-C port.
 
+config TYPEC_MUX_PS8830
+	tristate "Parade PS8830 Type-C retimer driver"
+	depends on I2C
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
+	select REGMAP_I2C
+	help
+	  Say Y or M if your system has a Parade PS8830 Type-C retimer chip
+	  found on some devices with a Type-C port.
+
 config TYPEC_MUX_PTN36502
 	tristate "NXP PTN36502 Type-C redriver driver"
 	depends on I2C
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
index bb96f30267af05b33b9277dcf1cc0e1527d2dcdd..4b23b12cfe45a0ff8a37f38c7ba050f572d556e7 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -6,5 +6,6 @@ obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
 obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
 obj-$(CONFIG_TYPEC_MUX_IT5205)		+= it5205.o
 obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)	+= nb7vpq904m.o
+obj-$(CONFIG_TYPEC_MUX_PS8830)		+= ps8830.o
 obj-$(CONFIG_TYPEC_MUX_PTN36502)	+= ptn36502.o
 obj-$(CONFIG_TYPEC_MUX_WCD939X_USBSS)	+= wcd939x-usbss.o
diff --git a/drivers/usb/typec/mux/ps8830.c b/drivers/usb/typec/mux/ps8830.c
new file mode 100644
index 0000000000000000000000000000000000000000..58990f7860bf77ec12d00f0d3df3a40735bbf9d8
--- /dev/null
+++ b/drivers/usb/typec/mux/ps8830.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Parade PS8830 usb retimer driver
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
+struct ps8830_retimer {
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
+	int cfg[3];
+};
+
+static void ps8830_write(struct ps8830_retimer *retimer, int cfg0, int cfg1, int cfg2)
+{
+	if (cfg0 == retimer->cfg[0] &&
+	    cfg1 == retimer->cfg[1] &&
+	    cfg2 == retimer->cfg[2])
+		return;
+
+	retimer->cfg[0] = cfg0;
+	retimer->cfg[1] = cfg1;
+	retimer->cfg[2] = cfg2;
+
+	regmap_write(retimer->regmap, 0x0, cfg0);
+	regmap_write(retimer->regmap, 0x1, cfg1);
+	regmap_write(retimer->regmap, 0x2, cfg2);
+}
+
+static void ps8830_configure(struct ps8830_retimer *retimer, int cfg0, int cfg1, int cfg2)
+{
+	/* Write safe-mode config before switching to new config */
+	ps8830_write(retimer, 0x1, 0x0, 0x0);
+
+	ps8830_write(retimer, cfg0, cfg1, cfg2);
+}
+
+static int ps8380_set(struct ps8830_retimer *retimer)
+{
+	int cfg0 = 0x00;
+	int cfg1 = 0x00;
+	int cfg2 = 0x00;
+
+	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
+	    retimer->mode == TYPEC_STATE_SAFE) {
+		ps8830_write(retimer, 0x1, 0x0, 0x0);
+		return 0;
+	}
+
+	if (retimer->orientation == TYPEC_ORIENTATION_NORMAL)
+		cfg0 = 0x01;
+	else
+		cfg0 = 0x03;
+
+	switch (retimer->mode) {
+	/* USB3 Only */
+	case TYPEC_STATE_USB:
+		cfg0 |= 0x20;
+		break;
+
+	/* DP Only */
+	case TYPEC_DP_STATE_C:
+		cfg1 = 0x85;
+		break;
+
+	case TYPEC_DP_STATE_E:
+		cfg1 = 0x81;
+		break;
+
+	/* DP + USB */
+	case TYPEC_DP_STATE_D:
+		cfg0 |= 0x20;
+		cfg1 = 0x85;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ps8830_configure(retimer, cfg0, cfg1, cfg2);
+
+	return 0;
+}
+
+static int ps8830_sw_set(struct typec_switch_dev *sw,
+			 enum typec_orientation orientation)
+{
+	struct ps8830_retimer *retimer = typec_switch_get_drvdata(sw);
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
+		ret = ps8380_set(retimer);
+	}
+
+	mutex_unlock(&retimer->lock);
+
+	return ret;
+}
+
+static int ps8830_retimer_set(struct typec_retimer *rtmr,
+			      struct typec_retimer_state *state)
+{
+	struct ps8830_retimer *retimer = typec_retimer_get_drvdata(rtmr);
+	struct typec_mux_state mux_state;
+	int ret = 0;
+
+	mutex_lock(&retimer->lock);
+
+	if (state->mode != retimer->mode) {
+		retimer->mode = state->mode;
+
+		ret = ps8380_set(retimer);
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
+static int ps8830_enable_vregs(struct ps8830_retimer *retimer)
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
+
+err_vddar_disable:
+	regulator_disable(retimer->vddar_supply);
+
+err_vdd_disable:
+	regulator_disable(retimer->vdd_supply);
+
+err_vdd33_cap_disable:
+	regulator_disable(retimer->vdd33_cap_supply);
+
+err_vdd33_disable:
+	regulator_disable(retimer->vdd33_supply);
+
+	return ret;
+}
+
+static int ps8830_get_vregs(struct ps8830_retimer *retimer)
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
+static const struct regmap_config ps8830_retimer_regmap = {
+	.max_register = 0x1f,
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ps8830_retimer_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct typec_switch_desc sw_desc = { };
+	struct typec_retimer_desc rtmr_desc = { };
+	struct ps8830_retimer *retimer;
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
+	retimer->regmap = devm_regmap_init_i2c(client, &ps8830_retimer_regmap);
+	if (IS_ERR(retimer->regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(retimer->regmap);
+	}
+
+	ret = ps8830_get_vregs(retimer);
+	if (ret)
+		return ret;
+
+	retimer->xo_clk = devm_clk_get(dev, "xo");
+	if (IS_ERR(retimer->xo_clk))
+		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
+				     "failed to get xo clock\n");
+
+	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(retimer->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	retimer->typec_switch = fwnode_typec_switch_get(dev->fwnode);
+	if (IS_ERR(retimer->typec_switch)) {
+		dev_err(dev, "failed to acquire orientation-switch\n");
+		return PTR_ERR(retimer->typec_switch);
+	}
+
+	retimer->typec_mux = fwnode_typec_mux_get(dev->fwnode);
+	if (IS_ERR(retimer->typec_mux)) {
+		dev_err(dev, "failed to acquire mode-mux\n");
+		goto err_switch_put;
+	}
+
+	sw_desc.drvdata = retimer;
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.set = ps8830_sw_set;
+
+	ret = drm_aux_bridge_register(dev);
+	if (ret)
+		goto err_mux_put;
+
+	retimer->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(retimer->sw)) {
+		dev_err(dev, "failed to register typec switch\n");
+		goto err_aux_bridge_unregister;
+	}
+
+	rtmr_desc.drvdata = retimer;
+	rtmr_desc.fwnode = dev_fwnode(dev);
+	rtmr_desc.set = ps8830_retimer_set;
+
+	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
+	if (IS_ERR(retimer->retimer)) {
+		dev_err(dev, "failed to register typec retimer\n");
+		goto err_switch_unregister;
+	}
+
+	ret = clk_prepare_enable(retimer->xo_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable XO: %d\n", ret);
+		goto err_retimer_unregister;
+	}
+
+	ret = ps8830_enable_vregs(retimer);
+	if (ret)
+		goto err_clk_disable;
+
+	/* delay needed as per datasheet */
+	usleep_range(4000, 14000);
+
+	gpiod_set_value(retimer->reset_gpio, 1);
+
+	return 0;
+
+err_clk_disable:
+	clk_disable_unprepare(retimer->xo_clk);
+
+err_retimer_unregister:
+	typec_retimer_unregister(retimer->retimer);
+
+err_switch_unregister:
+	typec_switch_unregister(retimer->sw);
+
+err_aux_bridge_unregister:
+	gpiod_set_value(retimer->reset_gpio, 0);
+	clk_disable_unprepare(retimer->xo_clk);
+
+err_mux_put:
+	typec_mux_put(retimer->typec_mux);
+
+err_switch_put:
+	typec_switch_put(retimer->typec_switch);
+
+	return ret;
+}
+
+static void ps8830_retimer_remove(struct i2c_client *client)
+{
+	struct ps8830_retimer *retimer = i2c_get_clientdata(client);
+
+	typec_retimer_unregister(retimer->retimer);
+	typec_switch_unregister(retimer->sw);
+
+	gpiod_set_value(retimer->reset_gpio, 0);
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
+static const struct of_device_id ps8830_retimer_of_table[] = {
+	{ .compatible = "parade,ps8830" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ps8830_retimer_of_table);
+
+static struct i2c_driver ps8830_retimer_driver = {
+	.driver = {
+		.name = "ps8830_retimer",
+		.of_match_table = ps8830_retimer_of_table,
+	},
+	.probe		= ps8830_retimer_probe,
+	.remove		= ps8830_retimer_remove,
+};
+
+module_i2c_driver(ps8830_retimer_driver);
+
+MODULE_DESCRIPTION("Parade PS8830 Type-C Retimer driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


