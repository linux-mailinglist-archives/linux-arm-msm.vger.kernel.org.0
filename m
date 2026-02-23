Return-Path: <linux-arm-msm+bounces-93699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CS2JeFjnGkoFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:27:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09B177FDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D31BF30CF71C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B185C28727D;
	Mon, 23 Feb 2026 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SE4mNvDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBA6287246
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856658; cv=none; b=cj0nnOM5hZFCojvX6DHilvRAlbwQa446P8YqngMaCBeVrEHDj/LHYy1fircHaOKdKs3XogjvFHn3a1ZFLCyfH9vYNnkDo1tefd+Ht5yya2L6gibuNlmswnf1oqEOzxAxWNfAMFKlQPcizCoJv0ODIl0QqP0eIIJULQBfkJpaWv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856658; c=relaxed/simple;
	bh=vWCD9VVA/XLFPHOU8LANvMlX0vEtErby2tMCesqZVds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7MTD/0AXHcwm3/cg4sIbf+3v5kK+Kppe1vhs+zAOGFrIp0VI31oOlBBAi6AZu+m8HfVysI1AZoS8cBiqIrzX58UXU21WVN7LqWTIe3Ho6Ba1MdHoUETDJooYKPcuthQfXf/j/TVgkDK7GbyBZYxDz/C0P4jSuJzzvyrCrzWwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SE4mNvDu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a302794so3270074f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771856655; x=1772461455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xow1LRr44WebATg66foEvFNgydvBvLOSkqw1tsTT4kk=;
        b=SE4mNvDuKF4wnYtWup7/m0fUTN+GpdI6FmViiKzu2l4DJZjGWo2fpfI8+wYEPR1v2g
         4+9bFvOyikva1ifTv6q/ohDISZnRBcUdbzPDktzAIHcj76Z5MqrifPHMZRcNCl4N6OP5
         EM9hROigcq64BpDcMoAIdlHEJ4iMCjGZkQD3CtPjvPDqOR8iZx9CVuY5UZavTfuN8s1u
         ompOZ7854tdj3KqtTqtKbXPwflROtxcGuL3SnSyAaagRCFVSJNSyKHq1eQ5t2fSpIwZz
         3Bok1Eqh3w4R3YYs70tW0mieZxVUtlVmU/PeBcMneH6o+Uy9ubHASxKJnGM3ilJK+CFA
         dsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856655; x=1772461455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xow1LRr44WebATg66foEvFNgydvBvLOSkqw1tsTT4kk=;
        b=q9C1DI1zkd2UvKXIeo5SZFcSoQff5KxMl8rfijxHRwE1uH0E9YO5qRl0wFqnZbErMU
         hax3RAJW76x+HddK2jlYvE/RamDLChiXU4qmQbV2r6pvJnvVTFy7etRXa/Tpz5pS3PSM
         0JW39U7fzzSNFem6P+KrZ1HMVEdy/qBGruLPblj5yBIGcljupvXuI/Q6X02A/x9nQUN9
         BWfkCaUdM4nAgorGb1vjSMQSaOwqdO+ScXAmudTxKSFQ61MYmPDn6CJDiC2x3Ojd6WeJ
         EB8o24OBP3oJYHEGQ1xs5+T+TzxQULpo3znIDeELZwx3pguk6g7FGXN251rjq0V+9THO
         PoXg==
X-Forwarded-Encrypted: i=1; AJvYcCUz03Q4U/WmlpWP4r2iWNd2jR1bcGAB9CJZ5p1eRd8k8t6Qe+dg1Yb0S+g4mAF/hq/+itLOOpRlrSt+Rgtl@vger.kernel.org
X-Gm-Message-State: AOJu0YynoG1nxIYXX7IuyDI8x2VpCOalNW6JgIpRwCKTf9CPgREFKStj
	C5wepmdk7ANoQwkKaJjRvWkPnYtJb+x6kCEYynN0/fkiYq2T0FLfIRitYSF8v37j
X-Gm-Gg: ATEYQzxJrxCLSFFkmg5Ki+Z3NxZSE+6Zi//20FRclfLwV2qzs4RfW/pq8e52S2GY7cE
	kS6XIdiLHbiTF4yEB12ykiXlz72/t/F6O1aPDh6LSzgF133mRmHE1vuyC8e2I2LPBKQz550HoXL
	nNLWHdc+INjhLN7Xb6CyJk1RZWTZjIvbc/NlIIw4+vPjgKOZA0pCJHvEo7Y3BosWMAWj/JXn3zA
	aczFx9/cLsaOo8XTxyPu/pfAvVhBw2HIDtrnT8ej5/ttYQbJ0sBZwwBsD/4gC7xGJNoAKkyVQEd
	6R5MTHWeO3C+NAHkzsicPSV1hvgUKiYVMMq/BQp2460hMDndgJz5a1tqBLG8lfAZY9nPTxton/0
	iLo9eynujWEI8/5iY4Kwx19/pPwEU2uICBfbuMlzW2qo29POcNs/RrpRhXA8vPEyHcUwukjqXv0
	Op0HmE67ufgWRXt8InpuEt/6kI57cbbeXgZNY1Z1XJJvnPgHcFr299dMXna6SWYQY=
X-Received: by 2002:a05:6000:188e:b0:436:f7e5:e047 with SMTP id ffacd0b85a97d-4396f18541dmr14270704f8f.47.1771856654978;
        Mon, 23 Feb 2026 06:24:14 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il. [46.116.183.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm18713233f8f.3.2026.02.23.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:24:14 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 16:24:03 +0200
Subject: [PATCH 2/3] drivers: gpu: drm: panel: Add Samsung S6E8FCO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v1-2-7756209477f9@gmail.com>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
In-Reply-To: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771856648; l=12055;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=vWCD9VVA/XLFPHOU8LANvMlX0vEtErby2tMCesqZVds=;
 b=NOgxjw3RnbQzlPZ0XRijCwLNP3CX6+wkcc03575jZ+9l7ipjjg0MtJAXRMpV+FvB2rukK+2Og
 ozKVbDAew9cDMaHELsyvQQrSu7qv3/Fcsm2xCTJXQGm3oST1bvBZ3KG
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC09B177FDE
X-Rspamd-Action: no action

Add driver for Samsung S6E8FCO DSI video mode panel, used in
Xiaomi Mi A3 mobile phone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panel/Kconfig                 |  12 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 ++++++++++++++++++++++++++
 4 files changed, 307 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb9834084e24671ccaee79939 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
 M:	Yedaya Katsman <yedaya.ka@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
 
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fedca1b688ce6fbe4295ec9009007e693..734640bb3f73c83e9273573aeb720ea1ba20862f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -893,6 +893,18 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
 	  DSI protocol with 4 lanes.
 
+config DRM_PANEL_SAMSUNG_S6E8FCO
+	tristate "Samsung S6E8FCO DSI video mode panel"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DSI
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y or M here if you want to enable support for the Samsung video
+	  mode panel S6E8FCO. The panel has a 6.09 inch AMOLED display, with
+	  a resolution of 720x1560.
+	  Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
+
 config DRM_PANEL_SAMSUNG_SOFEF00
 	tristate "Samsung SOFEF00 DSI panel controller"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..54eca60e5b57328ea94ed7880f4dead981f87fc1 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams4
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) += panel-samsung-s6e8fco.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
new file mode 100644
index 0000000000000000000000000000000000000000..0a1a1c680ee143d2429a6e1ea59a4fdd16b156b4
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2025 Kamil Gołda <kamil.golda@protonmail.com>
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+// Copyright (c) 2026, The Linux Foundation. All rights reserved.
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
+struct s6e8fco_samsungp {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data s6e8fco_samsungp_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "ldo" },
+	{ .supply = "iovcc" },
+};
+
+static inline
+struct s6e8fco_samsungp *to_s6e8fco_samsungp(struct drm_panel *panel)
+{
+	return container_of_const(panel, struct s6e8fco_samsungp, panel);
+}
+
+static void s6e8fco_samsungp_reset(struct s6e8fco_samsungp *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int s6e8fco_samsungp_on(struct s6e8fco_samsungp *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x01, 0x81, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e8fco_samsungp_off(struct s6e8fco_samsungp *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e8fco_samsungp_prepare(struct drm_panel *panel)
+{
+	struct s6e8fco_samsungp *ctx = to_s6e8fco_samsungp(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	s6e8fco_samsungp_reset(ctx);
+
+	ret = s6e8fco_samsungp_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s6e8fco_samsungp_unprepare(struct drm_panel *panel)
+{
+	struct s6e8fco_samsungp *ctx = to_s6e8fco_samsungp(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = s6e8fco_samsungp_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode s6e8fco_samsungp_mode = {
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
+static int s6e8fco_samsungp_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &s6e8fco_samsungp_mode);
+}
+
+static const struct drm_panel_funcs s6e8fco_samsungp_panel_funcs = {
+	.prepare = s6e8fco_samsungp_prepare,
+	.unprepare = s6e8fco_samsungp_unprepare,
+	.get_modes = s6e8fco_samsungp_get_modes,
+};
+
+static int s6e8fco_samsungp_bl_update_status(struct backlight_device *bl)
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
+static int s6e8fco_samsungp_bl_get_brightness(struct backlight_device *bl)
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
+static const struct backlight_ops s6e8fco_samsungp_bl_ops = {
+	.update_status = s6e8fco_samsungp_bl_update_status,
+	.get_brightness = s6e8fco_samsungp_bl_get_brightness,
+};
+
+static struct backlight_device *
+s6e8fco_samsungp_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 268,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &s6e8fco_samsungp_bl_ops, &props);
+}
+
+static int s6e8fco_samsungp_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct s6e8fco_samsungp *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct s6e8fco_samsungp, panel,
+				   &s6e8fco_samsungp_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(s6e8fco_samsungp_supplies),
+					    s6e8fco_samsungp_supplies,
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
+	ctx->panel.backlight = s6e8fco_samsungp_create_backlight(dsi);
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
+static void s6e8fco_samsungp_remove(struct mipi_dsi_device *dsi)
+{
+	struct s6e8fco_samsungp *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id s6e8fco_samsungp_of_match[] = {
+	{ .compatible = "samsung,s6e8fco" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s6e8fco_samsungp_of_match);
+
+static struct mipi_dsi_driver s6e8fco_samsungp_driver = {
+	.probe = s6e8fco_samsungp_probe,
+	.remove = s6e8fco_samsungp_remove,
+	.driver = {
+		.name = "panel-samsung-s6e8fco",
+		.of_match_table = s6e8fco_samsungp_of_match,
+	},
+};
+module_mipi_dsi_driver(s6e8fco_samsungp_driver);
+
+MODULE_AUTHOR("Kamil Gołda <kamil.golda@protonmail.com>");
+MODULE_DESCRIPTION("DRM driver for s6e8fco samsung amoled video mode dsi panel");
+MODULE_LICENSE("GPL");

-- 
2.53.0


