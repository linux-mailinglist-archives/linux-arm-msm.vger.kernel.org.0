Return-Path: <linux-arm-msm+bounces-97709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAR0NovYtWkn5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 22:52:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1828F1FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 22:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C5430B8E6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 21:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00575388E6D;
	Sat, 14 Mar 2026 21:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIXhabWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F3E386C0C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773524797; cv=none; b=USFmkdrM0tl37uPAweCmrxQ0Q6qFxJyeDptdrV+Ed66vfao5PP46YASdbmdqSKYsorB9GVtIOJDJPP8vKjCqznYxjOUt18+lUTagmbqrf/akSIr73tajEgqOu5bQgYYWlQhTP9IeY419s00wqdYSccEzkcEeG90CAqu42/t2WAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773524797; c=relaxed/simple;
	bh=7QWXwQae0M3nfvVtdUe9fsLhIDOP/YC+Hs++mWbyNjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TC044IeZDTo5MSZwXDzG9NFQwHDhVdVBertSwf735wSDQMSSomPsvKNaXF92yznXp/e+NWsRGxc+3LnC1jp7xep7N35Pb0k6eyDgef8HK0l/XNq+t0cV5cf+bGMV4I0zS/ltiS4FqCzydFL+ha+GGDZ0IDu5+WR1gBOhnoOpSIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIXhabWM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so37558115e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773524792; x=1774129592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4dcDIIqWjuCuDIw/EKfyfSSct6pSLR9IhCmDMZcgFo=;
        b=MIXhabWMahk7K2SqxTfZ428iUeEwbAmESJui9p41r3DoRvGcodeQqZEw7TuI2R6IHO
         MFwE56LUXbyjV/7eyl8LU3dPGK+UFRkN0AUq2+aKkOir821+tu85a2cVlcljXZiklJoi
         WE6XtaYpwirRHJyl3rOWFJM4R5Xl7CCzzAAYNLkStWU+vXUL0RX/wCyIb/QmAUhlL28Q
         h6PTU/BkMbaGGdcrEGDDUqE0ICwbAJGXITzoxg1vYBcHc0k5b1hNwJ0Gg5xZb8b/IT9z
         EIxV0qybPFcWI8AUXvV60Qqf0UYbgAy6jV4jENa4K1J5KxmXkptR7UwCHJ5KAkZPsWUa
         8F6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773524792; x=1774129592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4dcDIIqWjuCuDIw/EKfyfSSct6pSLR9IhCmDMZcgFo=;
        b=YsdEQ39+G+ehowbkkyxATewx39HYjv1kby1C6a2O3kpjLI+B0fA/o3gcWlrlv+2rmv
         ZNwI9j6DT5SEQwJmQjZU3moyL2juAe/5irH9F2KxzccfexDgk1aFP9JS3SJ3gssjJP9o
         RiQ2blG4++GwWSOkTjtQ5njz33ZglxDHNQ8js0S4YF04q5MQgUBU1Xv7eJaDQQFG6H7r
         8YVHF8Lz52EJ7/Tl+Z4ag/JYVnXHWs76iQqsFvEncIfaAR0OGPxkpbVCohILj8AcBJaB
         yspheplp81Zhx+bPzhc375IQHP7Bvpfm2eeF/4A73lX1PFDC0KnBrJEeXsPhIlcmqmAB
         L31Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKOYkhR9vRLUjB9FiNh1I5YUyWldlNCg1aJMtj8BukJt0en+W8SHQF/LlQQ+ka8Y+Gv0nQDFyERD6Ieesf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr0mBjS8VSCb0Wa3jDl2WBPWGLxn7LucQoaJ7kprYVhbn+qJQf
	zlE7QY4Ed0PjcH35PEyvdDX71UnkgjkAPPXLb5T46m9pGGcCQOrcJMO6
X-Gm-Gg: ATEYQzxSKdV4o5/bswqFE4cPW2LSvHiolscrmzQ12Aa0TkfSFA/ZSa9qVml6YsNCUP9
	Sdbm0vckStjZ3qqFTBwJeJjhDWFrMxOWjOJJPzoj1bKEZyt5ir0I1Cz2Btya1dBvY/M7jwGZxJc
	2d6cViBd/q304c0NeaLWobTH1NyYe5lKY5LzgINcgm5cQ2/VM8VIEn/othaCV4dTBNTLkaMcMjj
	LyN6fLguJwq1m/81olHDu1pDt3Lw1DsxJJ+wsUgbv8sTVamezSe5MokzuHsYHHtzv+l+7FkPD1e
	C3ejV8C+MoegEm+2ohVoG8PdxQV34DFo5P/j0uKl982YjAErxR5ZcMpadW0qMe4CXMI0gf4ZS0o
	qvVPQQbJHeisk7wO/wc5a6pQAB/jVpn7lrRO+kiTf4we8ckx9lm+/4k4JAUqYMl+90t4UGzF8VT
	ZQkD3CpCuGEV7D+pDXsA40pwLR13PdUDmvh8JmDj1XQznpWzLo30sW6PZO9T5kWP4=
X-Received: by 2002:a05:600c:3552:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-485567028b2mr128325555e9.18.1773524791465;
        Sat, 14 Mar 2026 14:46:31 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm28756221f8f.4.2026.03.14.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:46:31 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Sat, 14 Mar 2026 23:46:22 +0200
Subject: [PATCH v4 2/3] drm: panel: Add Samsung S6E8FCO DSI controller for
 M1906F9 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-panel-patches-v4-2-1ecbb2c0c3c8@gmail.com>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
In-Reply-To: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773524784; l=12581;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=7QWXwQae0M3nfvVtdUe9fsLhIDOP/YC+Hs++mWbyNjU=;
 b=NnI0t3ib6ozAfw0oattCqPISiDzJyiVkEB94+5zVdFfiGqlIrYX1jDLcO3QneYa6iFcEbqzY5
 h2YTW3rpW5gAQK5FXGxx25Z8lj+wZ8nmJXCORPrM0+POjCjBjM2mKC0
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97709-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: 4EC1828F1FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for Samsung S6E8FCO DSI controller for M1906F9 video mode panel,
found in Xiaomi Mi A3 mobile phone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>

---

The downstream dts claims a max brightness of 2047, but seems to ignore the
MSB.
---
 MAINTAINERS                                        |   5 +
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c  | 301 +++++++++++++++++++++
 4 files changed, 320 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e087673237636268346979ddc270f8cf0905c722..0c835d432ced8cc1c8494596bc1c2a36eadd6fe8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8183,6 +8183,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
+M:	Yedaya Katsman <yedaya.ka@gmail.com>
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c
+
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
 M:	Casey Connolly <casey.connolly@linaro.org>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fedca1b688ce6fbe4295ec9009007e693..47a8a2d2535f3fa46fc4545ae30f7e0b6b3d2e1d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -893,6 +893,19 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
 	  DSI protocol with 4 lanes.
 
+config DRM_PANEL_SAMSUNG_S6E8FCO
+	tristate "Samsung S6E8FCO DSI controller"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DSI
+	help
+	  Say Y or M here if you want to enable support for the Samsung
+	  S6E8FCO DSI controller and connected panel.
+	  Currently supported panels:
+
+	    M1906F9 (M1906F9SH or M1906F9SI), 6.09 inch 720x1560, found
+	    in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
+
 config DRM_PANEL_SAMSUNG_SOFEF00
 	tristate "Samsung SOFEF00 DSI panel controller"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..0cf7f0fb4654eb3dc67b2f15294ea46015a9bcdc 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams4
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) += panel-samsung-s6e8fco-m1906f9.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c b/drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c
new file mode 100644
index 0000000000000000000000000000000000000000..7fabfe19b5728612ab2a2518a8a100e7010b1d0c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Kamil Gołda <kamil.golda@protonmail.com>
+// Copyright (c) Yedaya Katsman <yedaya.ka@gmail.com>
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//   Copyright (c) The Linux Foundation. All rights reserved.
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct s6e8fco_ctx {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data s6e8fco_m1906f9_supplies[] = {
+	{ .supply = "vdd" },
+	{ .supply = "vci" },
+};
+
+static inline
+struct s6e8fco_ctx *to_s6e8fco_ctx(struct drm_panel *panel)
+{
+	return container_of_const(panel, struct s6e8fco_ctx, panel);
+}
+
+static void s6e8fco_m1906f9_reset(struct s6e8fco_ctx *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+#define s6e8fco_m1906f9_test_key_on_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
+#define s6e8fco_m1906f9_test_key_off_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
+#define s6e8fco_m1906f9_test_key_on_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
+#define s6e8fco_m1906f9_test_key_off_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
+
+static int s6e8fco_m1906f9_on(struct s6e8fco_ctx *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	s6e8fco_m1906f9_test_key_on_lvl3(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x20);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04, 0xed);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed,
+				     0xe4, 0x08, 0x96, 0xa4, 0x2a, 0x72, 0xe2,
+				     0xca, 0x00);
+	s6e8fco_m1906f9_test_key_off_lvl3(&dsi_ctx);
+	s6e8fco_m1906f9_test_key_on_lvl2(&dsi_ctx);
+	s6e8fco_m1906f9_test_key_on_lvl3(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x01, 0x81, 0x04);
+	s6e8fco_m1906f9_test_key_off_lvl2(&dsi_ctx);
+	s6e8fco_m1906f9_test_key_off_lvl3(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e8fco_m1906f9_off(struct s6e8fco_ctx *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e8fco_m1906f9_prepare(struct drm_panel *panel)
+{
+	struct s6e8fco_ctx *ctx = to_s6e8fco_ctx(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(s6e8fco_m1906f9_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	s6e8fco_m1906f9_reset(ctx);
+
+	ret = s6e8fco_m1906f9_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(s6e8fco_m1906f9_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s6e8fco_m1906f9_unprepare(struct drm_panel *panel)
+{
+	struct s6e8fco_ctx *ctx = to_s6e8fco_ctx(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = s6e8fco_m1906f9_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(s6e8fco_m1906f9_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode s6e8fco_m1906f9_samsungp_mode = {
+	.clock = (720 + 350 + 40 + 294) * (1560 + 17 + 2 + 5) * 60 / 1000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 350,
+	.hsync_end = 720 + 350 + 40,
+	.htotal = 720 + 350 + 40 + 294,
+	.vdisplay = 1560,
+	.vsync_start = 1560 + 17,
+	.vsync_end = 1560 + 17 + 2,
+	.vtotal = 1560 + 17 + 2 + 5,
+	.width_mm = 65,
+	.height_mm = 140,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int s6e8fco_m1906f9_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &s6e8fco_m1906f9_samsungp_mode);
+}
+
+static const struct drm_panel_funcs s6e8fco_m1906f9_panel_funcs = {
+	.prepare = s6e8fco_m1906f9_prepare,
+	.unprepare = s6e8fco_m1906f9_unprepare,
+	.get_modes = s6e8fco_m1906f9_get_modes,
+};
+
+static int s6e8fco_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int s6e8fco_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness;
+}
+
+static const struct backlight_ops s6e8fco_bl_ops = {
+	.update_status = s6e8fco_bl_update_status,
+	.get_brightness = s6e8fco_bl_get_brightness,
+};
+
+static struct backlight_device *
+s6e8fco_m1906f9_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 512,
+		.max_brightness = 1023,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &s6e8fco_bl_ops, &props);
+}
+
+static int s6e8fco_m1906f9_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct s6e8fco_ctx *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct s6e8fco_ctx, panel,
+				   &s6e8fco_m1906f9_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(s6e8fco_m1906f9_supplies),
+					    s6e8fco_m1906f9_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = s6e8fco_m1906f9_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void s6e8fco_remove(struct mipi_dsi_device *dsi)
+{
+	struct s6e8fco_ctx *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id samsung_s6e8fco_m1906f9_of_match[] = {
+	{ .compatible = "samsung,s6e8fco-m1906f9" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_s6e8fco_m1906f9_of_match);
+
+static struct mipi_dsi_driver s6e8fco_m1906f9_driver = {
+	.probe = s6e8fco_m1906f9_probe,
+	.remove = s6e8fco_remove,
+	.driver = {
+		.name = "panel-samsung-s6e8fco-m1906f9",
+		.of_match_table = samsung_s6e8fco_m1906f9_of_match,
+	},
+};
+module_mipi_dsi_driver(s6e8fco_m1906f9_driver);
+
+MODULE_AUTHOR("Kamil Gołda <kamil.golda@protonmail.com>");
+MODULE_DESCRIPTION("DRM driver for Samsung s6e8fco DSI controller");
+MODULE_LICENSE("GPL");

-- 
2.53.0


