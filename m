Return-Path: <linux-arm-msm+bounces-27419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF22941509
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8B21C23016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 15:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF7E1A2C33;
	Tue, 30 Jul 2024 15:02:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581801A0AF5;
	Tue, 30 Jul 2024 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722351723; cv=none; b=KQgKVr18MOp0LP4fvBBpS7ThxreViKgQvJg7mdAQTybP7L6yO2a/rjbcZjPjAIPEQh3tUmFuxVG8vX5zhwtjyoIcbCxBIYaQecHffy4SKEY9Cb+arTpf7lQuTGvku4ck7pCtq4wELitBQOA7PCH6+HENWV79XxWlk0OhCUkD8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722351723; c=relaxed/simple;
	bh=683wxpjC6ihpJTjGo7UQynZw3AgpfRTVZXthNqu/FqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKauz/jNwcL1PM8Aw3PCALhTkFyO1mPrCSpG0Y6egiVQedOiG2q3ZELpz40FEu3CUObQcwQghppGzzPOAz+n5v1CID3pvn+HbAdik+jSq8RM9iaM+ezK+KyONDe41o5Km1EkgEqCkHz3lHwZMM7h0nlIwyNOzH5x8U1OJHHm0K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 5C65920CBD;
	Tue, 30 Jul 2024 17:01:51 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 4A21120A62;
	Tue, 30 Jul 2024 17:01:51 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Tue, 30 Jul 2024 17:01:32 +0200
Subject: [PATCH v4 2/2] drm/bridge: add support for TI TDP158
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-tdp158-v4-2-da69001bdea2@freebox.fr>
References: <20240730-tdp158-v4-0-da69001bdea2@freebox.fr>
In-Reply-To: <20240730-tdp158-v4-0-da69001bdea2@freebox.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
It supports DVI 1.0, HDMI 1.4b and 2.0b.
It supports 4 TMDS channels, HPD, and a DDC interface.
It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
for power reduction. Several methods of power management are
implemented to reduce overall power consumption.
It supports fixed receiver EQ gain using I2C or pin strap to
compensate for different lengths input cable or board traces.

Features

- AC-coupled TMDS or DisplayPort dual-mode physical layer input
to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
data rate, compatible with HDMI 2.0b electrical parameters
- DisplayPort dual-mode standard version 1.1
- Programmable fixed receiver equalizer up to 15.5dB
- Global or independent high speed lane control, pre-emphasis
and transmit swing, and slew rate control
- I2C or pin strap programmable
- Configurable as a DisplayPort redriver through I2C
- Full lane swap on main lanes
- Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)

https://www.ti.com/lit/ds/symlink/tdp158.pdf

On our board, I2C_EN is pulled high.
Thus, this code defines a module_i2c_driver.

The default settings work fine for our use-case.
So this basic driver doesn't need to tweak any I2C registers.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/gpu/drm/bridge/Kconfig     |   7 +++
 drivers/gpu/drm/bridge/Makefile    |   1 +
 drivers/gpu/drm/bridge/ti-tdp158.c | 108 +++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a89..c0ab5b620b57d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -368,6 +368,13 @@ config DRM_TI_DLPC3433
 	  It supports up to 720p resolution with 60 and 120 Hz refresh
 	  rates.
 
+config DRM_TI_TDP158
+	tristate "TI TDP158 HDMI/TMDS bridge"
+	depends on OF
+	select DRM_PANEL_BRIDGE
+	help
+	  Texas Instruments TDP158 HDMI/TMDS Bridge driver
+
 config DRM_TI_TFP410
 	tristate "TI TFP410 DVI/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 7df87b582dca3..3daf803ce80b6 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
 obj-$(CONFIG_DRM_TI_DLPC3433) += ti-dlpc3433.o
 obj-$(CONFIG_DRM_TI_SN65DSI83) += ti-sn65dsi83.o
 obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
+obj-$(CONFIG_DRM_TI_TDP158) += ti-tdp158.o
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
 obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
 obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/ti-tdp158.c
new file mode 100644
index 0000000000000..4ee0ad29874de
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tdp158.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2024 Freebox SAS
+ */
+#include <drm/drm_bridge.h>
+#include <drm/drm_atomic_helper.h>
+#include <linux/i2c.h>
+
+struct tdp158 {
+	struct drm_bridge bridge;
+	struct drm_bridge *next;
+	struct gpio_desc *enable; // Operation Enable - pin 36
+	struct regulator *vcc; // 3.3V
+	struct regulator *vdd; // 1.1V
+	struct device *dev;
+};
+
+static void tdp158_enable(struct drm_bridge *bridge, struct drm_bridge_state *prev)
+{
+	int err;
+	struct tdp158 *tdp158 = bridge->driver_private;
+
+	err = regulator_enable(tdp158->vcc);
+	if (err)
+		dev_err(tdp158->dev, "failed to enable vcc: %d", err);
+
+	err = regulator_enable(tdp158->vdd);
+	if (err)
+		dev_err(tdp158->dev, "failed to enable vdd: %d", err);
+
+	gpiod_set_value_cansleep(tdp158->enable, 1);
+}
+
+static void tdp158_disable(struct drm_bridge *bridge, struct drm_bridge_state *prev)
+{
+	struct tdp158 *tdp158 = bridge->driver_private;
+
+	gpiod_set_value_cansleep(tdp158->enable, 0);
+	regulator_disable(tdp158->vdd);
+	regulator_disable(tdp158->vcc);
+}
+
+static int tdp158_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
+{
+	struct tdp158 *tdp158 = bridge->driver_private;
+
+	return drm_bridge_attach(bridge->encoder, tdp158->next, bridge, flags);
+}
+
+static const struct drm_bridge_funcs tdp158_bridge_funcs = {
+	.attach = tdp158_attach,
+	.atomic_enable = tdp158_enable,
+	.atomic_disable = tdp158_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+static int tdp158_probe(struct i2c_client *client)
+{
+	struct tdp158 *tdp158;
+	struct device *dev = &client->dev;
+
+	tdp158 = devm_kzalloc(dev, sizeof(*tdp158), GFP_KERNEL);
+	if (!tdp158)
+		return -ENOMEM;
+
+	tdp158->next = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(tdp158->next))
+		return dev_err_probe(dev, PTR_ERR(tdp158->next), "missing bridge");
+
+	tdp158->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(tdp158->vcc))
+		return dev_err_probe(dev, PTR_ERR(tdp158->vcc), "vcc");
+
+	tdp158->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(tdp158->vdd))
+		return dev_err_probe(dev, PTR_ERR(tdp158->vdd), "vdd");
+
+	tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(tdp158->enable))
+		return dev_err_probe(dev, PTR_ERR(tdp158->enable), "enable");
+
+	tdp158->bridge.of_node = dev->of_node;
+	tdp158->bridge.funcs = &tdp158_bridge_funcs;
+	tdp158->bridge.driver_private = tdp158;
+	tdp158->dev = dev;
+
+	return devm_drm_bridge_add(dev, &tdp158->bridge);
+}
+
+static const struct of_device_id tdp158_match_table[] = {
+	{ .compatible = "ti,tdp158" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tdp158_match_table);
+
+static struct i2c_driver tdp158_driver = {
+	.probe = tdp158_probe,
+	.driver = {
+		.name = "tdp158",
+		.of_match_table = tdp158_match_table,
+	},
+};
+module_i2c_driver(tdp158_driver);
+
+MODULE_DESCRIPTION("TI TDP158 driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


