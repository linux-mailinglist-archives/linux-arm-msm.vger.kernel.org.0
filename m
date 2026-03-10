Return-Path: <linux-arm-msm+bounces-96419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OpaGhNlr2koXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:25:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C17243018
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 725FB3010B52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEB71FA859;
	Tue, 10 Mar 2026 00:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mitJmfXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715671FC10C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102354; cv=none; b=PjRdeJAhC/DgoWCW0ax/cM5ok6lrLkQ3fZTwsurb45ubMUB+TL6D0NwqaVJsdwsKSN5wZk1U9lj7E0vP/6xJh10ZzhFdbOlfNdPtTbRrM4k43T1Jh00lTKIGHEWfNT48doBo6NKVofrVeSyjKSSCBzaRdBgOedOHMEvfcvE77eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102354; c=relaxed/simple;
	bh=b055vklTd/o3zjd8HlrbFNX5lzETZGoB4Q8iDJ4SUnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfRNKG+/YxKMv+4eXF+lvMO2z9tus5j37qYHUEGfyVMmtncuqydXveOR9acTPaUo8cRYOp5DV0gGO2+py1UpmkN2CZbUtbhczHVrDM1EiWboC3soeS6GwCE7AweICEvyT/sXTwkZHkOuETN5+bhqEgs0zeKSGhSYA1Y/BKuecAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mitJmfXD; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50335b926c2so109280531cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102351; x=1773707151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kwt6/4+YYamzltWumh5cBvSGfRhklA9cSVf4cF/N2DE=;
        b=mitJmfXDqWIXXuyAWrChIYjE0Hxs0Q3DcpLUcxBS1PSq6zKBAjT0pnbyNUQBPUuTju
         nGLyr2+k/v8yfvCKWtcpR4nUoSrprVrKf4K7Dw+7yy9FWPVdAhpUfHo58/l8skHcQZg4
         TEet7AN5tDQk9z30A5TP2Xia7+L0ARTtCUUyoYnj6c3aSnSEM7zHD/N6mMseqzUdIfQQ
         K1OQB+T7QqoBcfVXK+ug+1Ct4i4W2M5bBrRVgPzUuwcJmY+Jb1PsZHcP4q2ouM4ahG6T
         20IgjuovUo2ZvPt5Cp8/OOvj7S/7/NZefADZMZBFuU/6lHUwS9WfZDJXsh29UuaQ1wXE
         RMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102351; x=1773707151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kwt6/4+YYamzltWumh5cBvSGfRhklA9cSVf4cF/N2DE=;
        b=lOV4+xa1qQdIJ4B/DFQ0T9HjWOG9d9ZICWjNcdNwMDGwajQmGgiG5OCAYJwnRJi1jl
         o4p05PiLTaE2wph40TAWk/veY6XY8C1Fyr2w59QUJmuwcvfwVBwOkoMNqfufGsKomkZP
         WU0dulZWjVw4G3zVuvnqmiblDu3TX/YybnECGi5Dpz2DcP4H/PaNUQj8Db8WdIRYOerQ
         NhQDu1207UxE0+ArnAM8pRP+uFjvIKquyOLNzXQw98g9ihl7JNVfG8TBBWNuvk5p9Uky
         INS25QAjLT4WAtTR29W4xIdZc5k0+OmUfEbzjx0mTmLUEdlaiicedV6fcbyLXwRU2U79
         4QUA==
X-Forwarded-Encrypted: i=1; AJvYcCWvPLt0vuaXgFLkEz68X0aNf3Nvqx8bgnQTKXAfHGp86AaiXeQt3Dol0rstOTmPfy9eaJsB1jqy5zn0zZLt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HnBlYXiLCc9heX7FrZZPi+6Q0Tcl2EFcJV8SWoVxYKOLpU3v
	MC//pgsLsX9l8D/s7ccIQOPIgPewVSzqgJt5xSXomkPHUvXZFQ3IYZG1
X-Gm-Gg: ATEYQzyrv76DB78fOaSolcAh/+9DUskXK7yrQfTrTYW/UgEPckrZfoYU4UVbLMC2LWJ
	7gLds5iqwlVXXGQXOTZxV6nAwxjp2dyM7ijIP67peoslLpzdGhV8OMYYRczn5U+USMRlFNkj+qL
	oHCRyggCzowYJZRgzP1raBoMUAep+p5YUHAK6arkWK4XAY/VVV8rEanIT6BivVL20W21170X96a
	der4Ai1f3PLfGELTZlPqqppg2Px+DSp2Ne1Hg1JKl7RnJJbHHwl4q4dlylFXaMNmjOySwhTngzb
	UzJbAjjpSVt9pWqK2xiA6w6uORkq0V2MgJSP+DzbayveCtReKdfgPG7YLM2iVsvbjQvxKlXN6NQ
	xZet6VKPxrTY144R1sKkhsaKMaMmmZ31FlSm9UhWYSydddcAEZDsh0kDy+mrMUDBnOGmDdHyx67
	1z+5Fryyv6etVVi2z5BYPTCPvVz6CQmGzOVftFACdVQqZXw9bInVcEWLLbEV9xQFAFCy5hC5aMU
	xSfgi+/PkMvKxA=
X-Received: by 2002:a05:622a:612:b0:509:1f91:dc2a with SMTP id d75a77b69052e-5091f91eb96mr47465001cf.36.1773102351352;
        Mon, 09 Mar 2026 17:25:51 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5090d9cd2d4sm55366111cf.12.2026.03.09.17.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:25:50 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 3/5] drm/panel: Add Novatek/Tianma NT37700F panel
Date: Mon,  9 Mar 2026 20:26:04 -0400
Message-ID: <20260310002606.16413-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310002606.16413-1-mailingradian@gmail.com>
References: <20260310002606.16413-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 12C17243018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96419-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
the aid of linux-mdss-dsi-panel-driver-generator.

Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Tested-by: Yifei Zhan <yifei@zhan.science>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 299 ++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 307152ad7759..21b38b640878 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -553,6 +553,15 @@ config DRM_PANEL_NOVATEK_NT36672E
 	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
 	  RGB per pixel.
 
+config DRM_PANEL_NOVATEK_NT37700F
+	tristate "Novatek NT37700F DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Novatek NT37700F DSI
+	  panel module. The panel has a resolution of 1080x2160.
+
 config DRM_PANEL_NOVATEK_NT37801
 	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index aeffaa95666d..8bde285336bd 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37700f.c b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
new file mode 100644
index 000000000000..74f46a268c0f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, The Linux Foundation. All rights reserved.
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/of.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct nt37700f_tianma {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline
+struct nt37700f_tianma *to_nt37700f_tianma(struct drm_panel *panel)
+{
+	return container_of(panel, struct nt37700f_tianma, panel);
+}
+
+static void nt37700f_tianma_reset(struct nt37700f_tianma *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+#define nt37700f_tianma_panel_switch_page(ctx, page) \
+	mipi_dsi_dcs_write_seq_multi((ctx), 0xf0, 0x55, 0xaa, 0x52, 0x08, (page))
+
+static int nt37700f_tianma_on(struct nt37700f_tianma *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	nt37700f_tianma_panel_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x2b, 0x1a);
+	nt37700f_tianma_panel_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x04, 0x82);
+	nt37700f_tianma_panel_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x01);
+
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 2160 - 1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	nt37700f_tianma_panel_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
+	nt37700f_tianma_panel_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x00);
+	nt37700f_tianma_panel_switch_page(&dsi_ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0, 0x11, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x20);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37700f_tianma_disable(struct drm_panel *panel)
+{
+	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37700f_tianma_prepare(struct drm_panel *panel)
+{
+	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_enable(ctx->supply);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable power supply: %d\n", ret);
+		return ret;
+	}
+
+	nt37700f_tianma_reset(ctx);
+
+	ret = nt37700f_tianma_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int nt37700f_tianma_unprepare(struct drm_panel *panel)
+{
+	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->supply);
+
+	return 0;
+}
+
+static const struct drm_display_mode nt37700f_tianma_mode = {
+	.clock = (1080 + 32 + 32 + 98) * (2160 + 32 + 4 + 98) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 32,
+	.hsync_end = 1080 + 32 + 32,
+	.htotal = 1080 + 32 + 32 + 98,
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 32,
+	.vsync_end = 2160 + 32 + 4,
+	.vtotal = 2160 + 32 + 4 + 98,
+	.width_mm = 69,
+	.height_mm = 137,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int nt37700f_tianma_get_modes(struct drm_panel *panel,
+				     struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &nt37700f_tianma_mode);
+}
+
+static const struct drm_panel_funcs nt37700f_tianma_panel_funcs = {
+	.prepare = nt37700f_tianma_prepare,
+	.unprepare = nt37700f_tianma_unprepare,
+	.disable = nt37700f_tianma_disable,
+	.get_modes = nt37700f_tianma_get_modes,
+};
+
+static int nt37700f_tianma_bl_update_status(struct backlight_device *bl)
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
+static int nt37700f_tianma_bl_get_brightness(struct backlight_device *bl)
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
+static const struct backlight_ops nt37700f_tianma_bl_ops = {
+	.update_status = nt37700f_tianma_bl_update_status,
+	.get_brightness = nt37700f_tianma_bl_get_brightness,
+};
+
+static struct backlight_device *
+nt37700f_tianma_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 2047,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &nt37700f_tianma_bl_ops, &props);
+}
+
+static int nt37700f_tianma_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct nt37700f_tianma *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(ctx->supply))
+		return dev_err_probe(dev, PTR_ERR(ctx->supply),
+				     "Failed to get power-supply\n");
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
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&ctx->panel, dev, &nt37700f_tianma_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = nt37700f_tianma_create_backlight(dsi);
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
+static void nt37700f_tianma_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt37700f_tianma *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id nt37700f_tianma_of_match[] = {
+	{ .compatible = "novatek,nt37700f" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nt37700f_tianma_of_match);
+
+static struct mipi_dsi_driver nt37700f_tianma_driver = {
+	.probe = nt37700f_tianma_probe,
+	.remove = nt37700f_tianma_remove,
+	.driver = {
+		.name = "panel-novatek-nt37700f",
+		.of_match_table = nt37700f_tianma_of_match,
+	},
+};
+module_mipi_dsi_driver(nt37700f_tianma_driver);
+
+MODULE_DESCRIPTION("DRM driver for nt37700f cmd mode dsi tianma panel");
+MODULE_LICENSE("GPL");
-- 
2.53.0


