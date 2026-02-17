Return-Path: <linux-arm-msm+bounces-93027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D6xM86xk2kK7wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:09:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F851483C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD364302495C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C811D63F0;
	Tue, 17 Feb 2026 00:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAR9jADI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06371A0728
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771286947; cv=none; b=gosc2AYZ326cd5PzbfXc+Be7Q1NQ+hLLNMIDpBhi0KdlNyeDEq7gh+StA+LpyqASbdUG++T2kUgC2/O8fNm+8ncg1JwgysTtFatEsJk5ylO9d6/GeibzjLGRaBQarGYSBuGiGpJWRB5bnVENfzay/Oy/qJGUrgteDcrUruyKq9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771286947; c=relaxed/simple;
	bh=0WMGNCJbLj8Zu2WiR32oCY/M51G+oZLo9Arh6qwW12E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSUr3YSWf+EA2u3cD1+d+Due+INf1BPyDtm9oIxFbeLPimfeNkDA/N7c8/zUUYbRBSghFa7KC/jm2tII2Tgk0doi2Zz9SXhwhBjs6gdQeo594Nv/vnuE9CRt+VP4U+5w/XcVXgQ1dNBH1NnSmQ+oItgRhN1j2KJkXODeQ1W9axA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAR9jADI; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506bad34f51so18131511cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771286945; x=1771891745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZSyqzJsc7mwiDZ+ttivOXehqly7aCETswTJzVmvER4=;
        b=MAR9jADIeFp7IRbP9qBgkVYQh57Js2MGUnb2S3iZF9EF47kGFH8eb3VJfitD7wy3hY
         LiXUnKOozm/Zd7ULbFIWclnfKXVGQYAuSTXASbeTdiEBvCyMkcA756bHOfpZ/IgwmGdz
         h6BSweza5YSQzkP1exm2ZGKLnVJ+DzGHA84ATEtZESQMopjwocfmz5js0nKa9PpaCG8v
         bSPB6NHbRP9LWo1cv9uX4rBT/R+6mqPr+m+WnJTqpJMaOvIiFqXeoKKIfF5TdNXh2eLI
         9JQ1hZtwiKRPoqnmH+bJNRxOOsoIiSHAIO6cv2V7Hlh//OHsYaG2zZRK8KokDmYWl870
         H3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771286945; x=1771891745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fZSyqzJsc7mwiDZ+ttivOXehqly7aCETswTJzVmvER4=;
        b=exqyz2/Qaq7hUr6K/liIOQqWBC00yPHocLR+dLPPGAaWkCgXG1Rp2lSir77epqGBK8
         NOHC6weo9/Wao0J4sC8bbSX7pOAyozG5dT+t6vjaplLKOCjXtMG0M3YTUU6t3rGwA8z7
         xaybGz2ZLDHRbpEgDl5Pnr+ckXquxcY2rLQ+zN0/bceH1JwTxB3NLLLpZbXtiXxUSXPl
         Wp9MbsVEJPhVq5Yy3J6lypv/aiuvbQBSzYI7MfwaupX9YEXmMGMtCJes4zNAfEP/DF7t
         UH/HTGT0oUSyT6XvK/Iafm+k7D/FTsWC/fS0LophOJ/RBr2M8WVJTE9S8LUQS7t9gn3+
         Kk8w==
X-Forwarded-Encrypted: i=1; AJvYcCW5cZ2ohuuGosxAhLZl8DcJdhzZw+gHjRBfY4Hv0UyLjLoaWJj2gpRrSv2HiqMzKieN2qkQmDal5rdiHV83@vger.kernel.org
X-Gm-Message-State: AOJu0YwhK6bRi28FXmEjfOFU92cgRTdruHzh+SYNdqJOKvleXH4TOoyf
	uAnTVER7nIpFeRqPKLlW4FXEFgGKOJkDv0Yhw0D30JUq7fzn7mCC5pgV
X-Gm-Gg: AZuq6aIhzEApDU4wigEhKo/oPbonMjhc4heuQ2L7v/All0lp8s3eCpC+widHb5XhmYQ
	EPdP3XOGQbhNu2DLfqvAelEjESuv7vjaZfanjhjwINmtDGkfiB0fd+t6HN5AGYpunq53qogw9KH
	jVYpuaWjofAuBEJWD9fgdkHiNS8vQtx70vN/ELyH/XwFXhzEKMdy34vZrPianBz7BJqcGPMBq1E
	5oGn8eFBAq5c4dFJ7McKloCyv2F4TOb4Fy8DymFY7MkYfagltxNFZCDFf3SSeTHuHuTeKNU7CLK
	+V+gL4uMHAZ2oNJdVHTxzPh/HWyyfOBcxaBZ8mKJw4U8YWukulxvmbDjJv+jPN8BGQXzMiL/2lW
	L2e1YALAxv6eLU5GdNDYVXbYfIdB8/YmYgzO0LNy8tg4BgU/8GBU51ExsMdaGcK2yMwwn2mIe1o
	jX/s6eS5UVd5JrmMRIqPvvUw9k58sXYg==
X-Received: by 2002:a05:622a:1ba9:b0:4e8:838d:1992 with SMTP id d75a77b69052e-506a836444cmr161321341cf.63.1771286944499;
        Mon, 16 Feb 2026 16:09:04 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cddb9efsm171494546d6.51.2026.02.16.16.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:09:04 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
Date: Mon, 16 Feb 2026 19:08:51 -0500
Message-ID: <20260217000854.131242-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93027-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zhan.science:email]
X-Rspamd-Queue-Id: 79F851483C0
X-Rspamd-Action: no action

Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
the aid of linux-mdss-dsi-panel-driver-generator.

Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Tested-by: Yifei Zhan <yifei@zhan.science>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 282 ++++++++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 76f6af819037..138d617e8195 100644
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
index b9562a6fdcb3..9218a7d7ff34 100644
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
index 000000000000..e7e6343b2963
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
@@ -0,0 +1,282 @@
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
+static int nt37700f_tianma_on(struct nt37700f_tianma *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x2b, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x04, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x04);
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


