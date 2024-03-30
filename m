Return-Path: <linux-arm-msm+bounces-15831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA33892BB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 16:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2556B22244
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 15:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B403BBFF;
	Sat, 30 Mar 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3+Otqc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2638F96
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711810854; cv=none; b=MbzMUxKz81wIB1z2wU//YK/ef+RiJMFnK8faV5RbhgXV8hjgeh0ufzJ+l5W7ooRj9U+l5mOHiAc+YESthUADCvGt53UpRmHJmKWul+ak48RbUPBUI56J4DMHTBo1t+7nnUkxf2CPheqFYmExvH4uMkvVcm0ipuIY5290zv9vwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711810854; c=relaxed/simple;
	bh=6eyOWDzw9LhAdwHF11NxUmKTnAcKVzQqt7phGeeb+OU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2Qeieo6hxJaEu0pGlcsl1qnY4GP9BP9xdmojaBZ1PXw9d0Jo+QotRXToV6AIPAqoiV3dkRWuhjjC7QOw1LNd4Zvixjx4ijhxWa0loDm/o7KfpXg73WmUGR1m6r0LkhHoWLrpu+AYXiYPea9NJOywvIU79Weiz2UI1rGKte0k+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3+Otqc5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513dc9d6938so3419572e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711810850; x=1712415650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoeceOXD90b/faMyNELCuqZCbGS4AC8UJzwAJuXctxQ=;
        b=D3+Otqc5SEgS+zlRd6eB+WjDGnExgq/6uSCckpzFmdPWLzOgqwA5YWFBUYWTRQP4Gb
         Iy7Ud9Za+AdZEOUl8ieFwd7q7urV0Q0fSpVnvOWYu04ZInW7fYyNF2qXjqOcES3sqTu6
         d/VciChFa+bOtjP2LcR9IJQCIIsLDr8qGoO8xCz5gDKZKUAq3Tnhg9YgogLDydEJ1/oL
         WiXqCYxoJIlMFlznSJ077xqGHhuNVUGwiWckJzx/PrhX+YRj+x2EKukGgyIJw+M4IELW
         9WI/Ex6pynVHuGAu1wHmQPX8as/HeMNOIf/6ZdSzhoTDJUW8cw/JjdwVBSsCdCClskwY
         LlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711810850; x=1712415650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoeceOXD90b/faMyNELCuqZCbGS4AC8UJzwAJuXctxQ=;
        b=DCOi39n17fKM524fZPpgVuhZrQGPNzKl+ShpAatZziRJa/w+bYQ+DL3Pv9pud7Y1xZ
         PZHbYeILmoljAjsKtU6geXwj5mlNE3YcoDX1RGjZThwePXrcp27GSU2/vu6t6nb4aVDm
         QjVTHVyvaFD8qAAgtD//5kTb5m7ZLJRZbmKhdTbyFKD1mfFtdRIF3Y/f4ahVSBeUvBa1
         KlSfpcTptsjL3YbIANk/JssyTGj88M3ZC0X/F830mrZnLsi1WDy4XWE7Xsb5Q9zgUk6g
         KPpJa9c6sqRgw74o60xTwRdJCNk6Lb3GWL2iskclD9zuVDy9/yW+/XcVjpvkkISLowAl
         7eGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWqjwzwGEpubVns1hh+FOFE4Csh5PAmP/Mbs7uYjwIv68Wy2+/1klJ8PIxET6jKTp5O66gjx/ahh2zg6T+Y7qt1IuzXaeWUmGeb71HWw==
X-Gm-Message-State: AOJu0YwBtF7wzt31Rg9+ydDOrHEJyrYVlyxVPFNJvBpPo1HrDQsiZvAK
	WhNaaL6RnvTz7ZPY9nimfOCzfmuBW5ehPn4LBcOY4BbLKw9w3EKI57zs/mHxOhA=
X-Google-Smtp-Source: AGHT+IHec1Q0uwQWE8BAAkS24eikCNlNUYUBM6/OoSwgMUeKpOolLXm7mOQbRk6KyKGxs9Tu1tx8AQ==
X-Received: by 2002:a19:645d:0:b0:513:5951:61a4 with SMTP id b29-20020a19645d000000b00513595161a4mr3014559lfj.6.1711810850608;
        Sat, 30 Mar 2024 08:00:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j5-20020a056512344500b00515d205a6f0sm496199lfr.29.2024.03.30.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 08:00:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 17:00:48 +0200
Subject: [PATCH v2 3/3] drm: panel: Add LG sw43408 panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-lg-sw43408-panel-v2-3-293a58717b38@linaro.org>
References: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
In-Reply-To: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12229;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D6vJJI+0cd9TezSGqlz9pC0jmFumI9Fyojywzyt3GeA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCCkffNwBqAropCyO2l9Jyg07Kxpr10x4DXZIo
 z9bQSoOw56JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZggpHwAKCRCLPIo+Aiko
 1SZ5B/9Cv+ba2KyMkgNicBHJyvACx8mdXa5zay9s9JfnrmHcgAMkkTyvPWJn3cA7lBke+Zj7LwX
 zz6JpF0DZij96RrVVs3h8HqkOrkHe3F/oVRCPA/jhy7weDjRCr8LZzbyff/cqqLbkFwu8hcsjSS
 +W0/jxzrtS78N6nd4YQ7G+GOLYd0VN/5BafXu9i6Hqv/FxwsynObGSnk/zzQ9ydQ/9RbKYnWwbg
 ayQ+dEXOTThpxdIbVZkughUOUtEAnqh94MenrmDUqFR988DJTrNs6M7UF6AjIPymiJPYYpe19rs
 bbeDlR50Es5A2/QRQ/PqZ79YtGSzKyikuMmyeiylkXpURNXO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel, used in some Pixel3
phones.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[vinod: Add DSC support]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
[caleb: cleanup and support turning off the panel]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
[DB: partially rewrote the driver and fixed DSC programming]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                              |   8 +
 drivers/gpu/drm/panel/Kconfig            |  11 ++
 drivers/gpu/drm/panel/Makefile           |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 321 +++++++++++++++++++++++++++++++
 4 files changed, 341 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b511a55101c..f4cf7ee97376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6755,6 +6755,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
 F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 
+DRM DRIVER FOR LG SW43408 PANELS
+M:	Sumit Semwal <sumit.semwal@linaro.org>
+M:	Caleb Connolly <caleb.connolly@linaro.org>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
 S:	Supported
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d037b3b8b999..f94c702735cb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -335,6 +335,17 @@ config DRM_PANEL_LG_LG4573
 	  Say Y here if you want to enable support for LG4573 RGB panel.
 	  To compile this driver as a module, choose M here.
 
+config DRM_PANEL_LG_SW43408
+	tristate "LG SW43408 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for LG sw43408 panel.
+	  The panel has a 1080x2160 resolution and uses
+	  24 bit RGB per pixel. It provides a MIPI DSI interface to
+	  the host and has a built-in LED backlight.
+
 config DRM_PANEL_MAGNACHIP_D53E6EA8966
 	tristate "Magnachip D53E6EA8966 DSI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index f156d7fa0bcc..a75687d13caf 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
+obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
new file mode 100644
index 000000000000..6c244b9642f1
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019-2024 Linaro Ltd
+ * Author: Sumit Semwal <sumit.semwal@linaro.org>
+ *	 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+
+#define NUM_SUPPLIES 2
+
+struct sw43408_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *link;
+
+	const struct drm_display_mode *mode;
+
+	struct regulator_bulk_data supplies[NUM_SUPPLIES];
+
+	struct gpio_desc *reset_gpio;
+
+	struct drm_dsc_config dsc;
+};
+
+static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
+{
+	return container_of(panel, struct sw43408_panel, base);
+}
+
+static int sw43408_unprepare(struct drm_panel *panel)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(ctx->link);
+	if (ret < 0)
+		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->link);
+	if (ret < 0)
+		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
+
+	msleep(100);
+
+	gpiod_set_value(ctx->reset_gpio, 1);
+
+	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+}
+
+static int sw43408_program(struct drm_panel *panel)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+	struct drm_dsc_picture_parameter_set pps;
+	/* Note; this uses a non-standard argument format */
+	u8 dsc_en[] = { 0x11 };
+
+	mipi_dsi_dcs_write_seq(ctx->link, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
+
+	mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_dcs_write_seq(ctx->link, 0x53, 0x0c, 0x30);
+	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xf7, 0x01, 0x49, 0x0c);
+
+	mipi_dsi_dcs_exit_sleep_mode(ctx->link);
+
+	msleep(135);
+
+	mipi_dsi_compression_mode_raw(ctx->link, dsc_en, sizeof(dsc_en));
+
+	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xac);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xe5,
+			       0x00, 0x3a, 0x00, 0x3a, 0x00, 0x0e, 0x10);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xb5,
+			       0x75, 0x60, 0x2d, 0x5d, 0x80, 0x00, 0x0a, 0x0b,
+			       0x00, 0x05, 0x0b, 0x00, 0x80, 0x0d, 0x0e, 0x40,
+			       0x00, 0x0c, 0x00, 0x16, 0x00, 0xb8, 0x00, 0x80,
+			       0x0d, 0x0e, 0x40, 0x00, 0x0c, 0x00, 0x16, 0x00,
+			       0xb8, 0x00, 0x81, 0x00, 0x03, 0x03, 0x03, 0x01,
+			       0x01);
+	msleep(85);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xcd,
+			       0x00, 0x00, 0x00, 0x19, 0x19, 0x19, 0x19, 0x19,
+			       0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19,
+			       0x16, 0x16);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xcb, 0x80, 0x5c, 0x07, 0x03, 0x28);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xc0, 0x02, 0x02, 0x0f);
+	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xca);
+
+	mipi_dsi_dcs_set_display_on(ctx->link);
+
+	msleep(50);
+
+	ctx->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	drm_dsc_pps_payload_pack(&pps, ctx->link->dsc);
+	mipi_dsi_picture_parameter_set(ctx->link, &pps);
+
+	ctx->link->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int sw43408_prepare(struct drm_panel *panel)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(5000, 6000);
+
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
+
+	ret = sw43408_program(panel);
+	if (ret)
+		goto poweroff;
+
+	return 0;
+
+poweroff:
+	gpiod_set_value(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	return ret;
+}
+
+static int sw43408_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+
+	return drm_connector_helper_get_modes_fixed(connector, ctx->mode);
+}
+
+static int sw43408_backlight_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	uint16_t brightness = backlight_get_brightness(bl);
+
+	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+}
+
+const struct backlight_ops sw43408_backlight_ops = {
+	.update_status = sw43408_backlight_update_status,
+};
+
+static int sw43408_backlight_init(struct sw43408_panel *ctx)
+{
+	struct device *dev = &ctx->link->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_PLATFORM,
+		.brightness = 255,
+		.max_brightness = 255,
+	};
+
+	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
+							ctx->link,
+							&sw43408_backlight_ops,
+							&props);
+
+	if (IS_ERR(ctx->base.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
+				     "Failed to create backlight\n");
+
+	return 0;
+}
+
+static const struct drm_panel_funcs sw43408_funcs = {
+	.unprepare = sw43408_unprepare,
+	.prepare = sw43408_prepare,
+	.get_modes = sw43408_get_modes,
+};
+
+static const struct drm_display_mode sw43408_default_mode = {
+	.clock = 152340,
+
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 20,
+	.hsync_end = 1080 + 20 + 32,
+	.htotal = 1080 + 20 + 32 + 20,
+
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 20,
+	.vsync_end = 2160 + 20 + 4,
+	.vtotal = 2160 + 20 + 4 + 20,
+
+	.width_mm = 62,
+	.height_mm = 124,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct of_device_id sw43408_of_match[] = {
+	{ .compatible = "lg,sw43408", .data = &sw43408_default_mode },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sw43408_of_match);
+
+static int sw43408_add(struct sw43408_panel *ctx)
+{
+	struct device *dev = &ctx->link->dev;
+	int ret;
+
+	ctx->supplies[0].supply = "vddi"; /* 1.88 V */
+	ctx->supplies[0].init_load_uA = 62000;
+	ctx->supplies[1].supply = "vpnl"; /* 3.0 V */
+	ctx->supplies[1].init_load_uA = 857000;
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		dev_err(dev, "cannot get reset gpio %ld\n",
+			      PTR_ERR(ctx->reset_gpio));
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ret = sw43408_backlight_init(ctx);
+	if (ret < 0)
+		return ret;
+
+	ctx->base.prepare_prev_first = true;
+
+	drm_panel_init(&ctx->base, dev, &sw43408_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	drm_panel_add(&ctx->base);
+	return ret;
+}
+
+static int sw43408_probe(struct mipi_dsi_device *dsi)
+{
+	struct sw43408_panel *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->mode = of_device_get_match_data(&dsi->dev);
+	dsi->mode_flags = MIPI_DSI_MODE_LPM;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->lanes = 4;
+
+	ctx->link = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ret = sw43408_add(ctx);
+	if (ret < 0)
+		return ret;
+
+	/* The panel is DSC panel only, set the dsc params */
+	ctx->dsc.dsc_version_major = 0x1;
+	ctx->dsc.dsc_version_minor = 0x1;
+
+	/* slice_count * slice_width == width */
+	ctx->dsc.slice_height = 16;
+	ctx->dsc.slice_width = 540;
+	ctx->dsc.slice_count = 2;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4;
+	ctx->dsc.block_pred_enable = true;
+
+	dsi->dsc = &ctx->dsc;
+
+	return mipi_dsi_attach(dsi);
+}
+
+static void sw43408_remove(struct mipi_dsi_device *dsi)
+{
+	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = sw43408_unprepare(&ctx->base);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to unprepare panel: %d\n",
+			      ret);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->base);
+}
+
+static struct mipi_dsi_driver sw43408_driver = {
+	.driver = {
+		.name = "panel-lg-sw43408",
+		.of_match_table = sw43408_of_match,
+	},
+	.probe = sw43408_probe,
+	.remove = sw43408_remove,
+};
+module_mipi_dsi_driver(sw43408_driver);
+
+MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
+MODULE_DESCRIPTION("LG SW436408 MIPI-DSI LED panel");
+MODULE_LICENSE("GPL");

-- 
2.39.2


