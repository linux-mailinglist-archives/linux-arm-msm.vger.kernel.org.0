Return-Path: <linux-arm-msm+bounces-109118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B20KS8xD2pSHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:22:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4F45A928E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB762332E654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1D936C0AC;
	Thu, 21 May 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6HsLMaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAEB39D6DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374863; cv=none; b=auaTqhDkgOIv42NF4RkCUuai649dnBx1temWLH69F4tKn+En4EOZpjjkOwAJm8/H0to2NujoqwJTxS0uztDZfrkujco3H5Byt3qpgNDYF73PuiMogJzZhuZnXmy0ds5m3u6KsssjBv6fbOTAUpHObD8po1aUVRp988+D8Hejg1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374863; c=relaxed/simple;
	bh=bLOSNqbzfuOgrd1FnCtq0Eh2B0RG45bLlGBeWk9o/9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2vPW88Yw9yiNmt7EAT0In6V+lotFKvNxe1k9dngj2GL8qIgBIhrG/Vf5kJcsBj1h8Xtd4y/f5ijQpfT/QQrS4AOrocEBbH9M9DHUkrizD8wpprH3uvC0MnRJ+N7qAv+grv02xGr0HXgM8/Kr9rZN8IcSCo32sKhwktkaHbvUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6HsLMaF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so4017633a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374861; x=1779979661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYjNxNVO+/q5b5BSMglVEnw6f3LJbKc4jq3m67yWYB0=;
        b=K6HsLMaFNea2gaC4/qy4Di+dZChs2jA/1+XYim9vWRbaf+XW+MlDNSfWwCZOwmR5Yh
         KxKVBzP6qOcb/7GmERSrnP/fkWmT2IAzD55XUHajpK51W7gsJCWHj4zMRRYWEDDBKkQT
         /0mvXdzlWDpS+yOe1qpMCkz0YLP/fKYeHIZKjlJK5fDitjpJNAPjLD9I34WF5T/fPPQg
         NH5xU7xUadf+ziyoACno0KcbXGI3YDP4Vfm7iaZ4+L9K3F8hK3xT6HiexMzMMvMGI1n1
         NlSVZhNgRP2X+JVXJQo56aJNt25lFRMuRPfRb6TKqDxSiEJJtryV6aeUSIGNHDgNKB92
         /ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374861; x=1779979661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EYjNxNVO+/q5b5BSMglVEnw6f3LJbKc4jq3m67yWYB0=;
        b=eh7jGjdAVguh+VscAoEaRgBNYHBI84mzfJXk8prjvkeo8NImqKIuEhTFtyCNA29MkC
         elYZM0o22ln58iQth8IYHv99uUcNSlc8/ikxg3+LxV2fR9pN3OgVEuvnaFxogq2rTwl5
         INbdDQgLe/p6zGAmxslHR4wiLRpnSg64nScqwfqSLXPqOyipJoArzDWkGJVVvQ1llgPs
         AYrKZUdHZ0g9ub4iv7GsXcwNuNILIEB0/lVXTfi0jMtDlB8f4utOGS5bmvFlpXXMOMA+
         jInLg6MiJlomYsXIDZCzBi1D6ngpkXXsNezlh2htW/t7Jx+at1IPtTrPikZN0MmuAQE2
         hfSA==
X-Gm-Message-State: AOJu0YzQQo4BOARCPDBB1Uu758Jn3iqMMMXwB6rHx7mPkYpi6yuCQeTO
	6x0W4JP1Nhq3y5I8/6/KRe6ak/DOd+JKoSO+qcXlHC6DqtBYLrHFs2SCMlFIBdVA/mQ=
X-Gm-Gg: Acq92OFTFRsig7Vr9dpTRwsCeqRuC7jRLHCCLGeGmXPpjIP2Y/7Fq+7sjQRmLU0mcQm
	ihJj1VLUivrVL5RQoy7zoMMkCC87+R397FMf5MpWLDsOXUdcVNJ7G0cB72iHUyTJHyCponyke0L
	eOu/HexVBD79hFXOHF+4/N1UHfj1jDKSzOqDVLoeBA/XAEJ4csiB+cFxAJQfgdMTX0jtr6PzpwP
	H7Xtu62t+qqIluiBfQxvSBErmf+zjk3E5hdvr5mf8Cd63O7JIxyhUifKjhRjl74pxE5CkscERCF
	3SThtAacvuMWALIY7Nxmdr/H5voW9+akGhFevnNFLSC5CGT9FYOVA8SJXAT+FjTcEcHzBDGY+6l
	L67GnYGho37MPHfeMDMEK5E4jf8gpVWgA+hPnP35UJB03xc515vzcliV+W+fYE23cYQLuig==
X-Received: by 2002:a17:90b:514b:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-36a4561b382mr3274090a91.13.1779374860838;
        Thu, 21 May 2026 07:47:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:47:40 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 22:46:07 +0800
Subject: [PATCH v4 5/5] drm/panel: Add driver for Synaptics R63455 DSI
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-5-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=22158;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=bLOSNqbzfuOgrd1FnCtq0Eh2B0RG45bLlGBeWk9o/9o=;
 b=BfZ7+vfzhsxFeBxLMYY87l7rtZtTFofeRwDyOdlorQQy+WNEPyUGHrMaxlLpuERd0Qpu6Z8uX
 9YIGuOaCyCLBdszIfRSsO+6m8JDkeYPRx4qSi7QkREpOqRu79jwi0dm
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109118-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 1B4F45A928E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the DSI panels used in the virtual reality device.
The device features two physical panels, each providing a MIPI DSI
interface and a built-in LED backlight and expose a single logical
panel to the DRM framework.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                  |   9 +
 drivers/gpu/drm/panel/Makefile                 |   1 +
 drivers/gpu/drm/panel/panel-synaptics-r63455.c | 631 +++++++++++++++++++++++++
 3 files changed, 641 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7c2d9feb4064e..1ef3f51ec6593 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1227,6 +1227,15 @@ config DRM_PANEL_SYNAPTICS_TDDI
 	  namesake, with varying resolutions and data lanes. They also have a
 	  built-in LED backlight and a touch controller.
 
+config DRM_PANEL_SYNAPTICS_R63455
+	tristate "Synaptics R63455-based panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Synaptics R63455 controller.
+
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index dc8a05f2c34d9..ee6b41151804c 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -115,6 +115,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_TDDI) += panel-synaptics-tddi.o
+obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63455) += panel-synaptics-r63455.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63455.c b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
new file mode 100644
index 0000000000000..e429c28c7efc9
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
@@ -0,0 +1,631 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026, Linaro Ltd. All rights reserved.
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#define R63455_MF_CMD_ACCESS_PROTECT	0xb0
+#define R63455_SEQ_CTL			0xd6
+#define R63455_DSI_CTL			0xb6
+#define R63455_DISP_MODE		0xb7
+#define R63455_GEN_OUTPIN_SET		0xb9
+#define R63455_DISP_SET1		0xc0
+#define R63455_DISP_SET2		0xf1
+#define R63455_DISP_SET3		0xc6
+#define R63455_DISP_SET3_2		0xcd
+#define R63455_DISP_SET4		0xcf
+#define R63455_DISP_SET5		0xec
+#define R63455_DISP_SET6		0xef
+#define R63455_TE_GPIO_CTL		0xbe
+#define R63455_PPS_SET			0xe6
+
+#define BRIGHTNESS_DEFAULT		256
+#define BRIGHTNESS_MAX_120		367
+
+#define VBP				100
+#define VFP				700
+#define VID_VS_DELAY			1112
+#define GPO1_TES1			4068
+#define RTN				59
+
+static const char * const vdda_driver[] = {
+	"vdda",
+};
+
+static const char * const dual_backlight_driver[] = {
+	"left-backlight",
+	"right-backlight",
+};
+
+static const char * const dual_lcd_bias_pos[] = {
+	"left-pos",
+	"right-pos",
+};
+
+static const char * const dual_lcd_bias_neg[] = {
+	"left-neg",
+	"right-neg"
+};
+
+struct r63455_ctx {
+	struct device *dev;
+	struct drm_panel panel;
+
+	struct regulator_bulk_data reg_vdda[ARRAY_SIZE(vdda_driver)];
+	struct regulator_bulk_data reg_bl[ARRAY_SIZE(dual_backlight_driver)];
+	struct regulator_bulk_data reg_lcd_bias_pos[ARRAY_SIZE(dual_lcd_bias_pos)];
+	struct regulator_bulk_data reg_lcd_bias_neg[ARRAY_SIZE(dual_lcd_bias_neg)];
+
+	struct gpio_descs *reset_gpios;
+	int (*dsi_init_seq)(struct drm_panel *panel);
+	struct backlight_device *backlight;
+	struct mipi_dsi_device *dsi[2];
+	struct drm_dsc_config dsc_cfg;
+};
+
+static inline struct r63455_ctx *panel_to_ctx(struct drm_panel *panel)
+{
+	return container_of(panel, struct r63455_ctx, panel);
+}
+
+static const struct drm_display_mode modes = {
+	.name = "4320x2160_120",
+	.clock = (2160 + 24 + 20 + 20) * (2160 + 404 + 1 + 20) * 120 * 2 / 1000,
+	.hdisplay = 2160 * 2,
+	.hsync_start = (2160 + 24) * 2,
+	.hsync_end = (2160 + 24 + 20) * 2,
+	.htotal = (2160 + 24 + 20 + 20) * 2,
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 404,
+	.vsync_end = 2160 + 404 + 1,
+	.vtotal = 2160 + 404 + 1 + 20,
+	.width_mm = 50 * 2,
+	.height_mm = 50,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+#define r63455_dsi_write_seq(ctx, dsi_ctx, cmd, seq...)					\
+	do {										\
+		u8 d[] = {cmd, seq};							\
+		dsi_ctx.dsi = ctx->dsi[0];						\
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
+		dsi_ctx.dsi = ctx->dsi[1];						\
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
+	} while (0)
+
+#define r63455_dsi_write_buffer(ctx, dsi_ctx, d)					\
+	do {										\
+		dsi_ctx.dsi = ctx->dsi[0];						\
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
+		dsi_ctx.dsi = ctx->dsi[1];						\
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
+	} while (0)
+
+#define LE16_BYTE0(val) (le16_to_cpu(val) & 0xff)
+#define LE16_BYTE1(val) ((le16_to_cpu(val) >> 8) & 0xff)
+#define BE16_BYTE0(val) (be16_to_cpu(val) & 0xff)
+#define BE16_BYTE1(val) ((be16_to_cpu(val) >> 8) & 0xff)
+
+static int r63455_dsi_populate_dsc_params(struct r63455_ctx *ctx)
+{
+	int ret;
+	struct drm_dsc_config *dsc = &ctx->dsc_cfg;
+
+	dsc->simple_422 = 0;
+	dsc->convert_rgb = 1;
+	dsc->vbr_enable = 0;
+
+	drm_dsc_set_const_params(dsc);
+	drm_dsc_set_rc_buf_thresh(dsc);
+
+	/* handle only bpp = bpc = 8, pre-SCR panels */
+	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->dev, "failed to setup dsc params\n");
+
+	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
+	dsc->line_buf_depth = dsc->bits_per_component + 1;
+
+	return drm_dsc_compute_rc_parameters(dsc);
+}
+
+static int r63455_init_dsc_config(struct r63455_ctx *ctx)
+{
+	ctx->dsc_cfg = (struct drm_dsc_config) {
+		.dsc_version_major = 0x1,
+		.dsc_version_minor = 0x2,
+		.dsc_slice_per_pkt = 4,
+		.slice_height = 48,
+		.slice_width = 540,
+		.slice_count = 4,
+		.bits_per_component = 8,
+		.bits_per_pixel = 8 << 4,
+		.block_pred_enable = true,
+
+		.pic_width = 2160,
+		.pic_height = 2160,
+	};
+
+	return r63455_dsi_populate_dsc_params(ctx);
+}
+
+static int r63455_panel_on_sharp_ls026b3sa06(struct drm_panel *panel)
+{
+	struct r63455_ctx *ctx = panel_to_ctx(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+
+	u8 pps_cmd[1 + sizeof(struct drm_dsc_picture_parameter_set)];
+
+	drm_dsc_pps_payload_pack((void *)&pps_cmd[1], &ctx->dsc_cfg);
+	pps_cmd[0] = R63455_PPS_SET;
+
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_MF_CMD_ACCESS_PROTECT, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_SEQ_CTL, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx,
+			     R63455_DSI_CTL,
+			     0x20, 0x6b, 0x80, 0x06, 0x33, 0x9a, 0x00, 0x1a,
+			     0x7a);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_MODE,
+			     0x54, 0x00, 0x00, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
+			     0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0xf, 0xb2, 0x00, 0x64);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3,
+			     0x08, 0x70, 0x28, 0x48, 0x00, 0x00, 0x13, 0x21,
+			     0xff, 0x00, 0x0f, 0x01, 0x14, 0x17, 0x00, 0x00,
+			     0x00, 0x02, 0x40, 0x0C, 0x00, 0x00, 0x00, 0x20,
+			     0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x70, 0x08,
+			     0xD0, 0x02, 0x21, 0x6F, 0x08, 0x5A, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET1,
+			     RTN, 0x86, LE16_BYTE0(VBP), LE16_BYTE1(VBP), 0x08,
+			     0x70, BE16_BYTE0(VFP), BE16_BYTE1(VFP), 0x00,
+			     0x00, 0x08, 0x3B, 0x00, 0x00, 0x19, 0x01, 0x22);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3_2, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET4,
+			     0x8b, 0x00, 0x80, 0x46, 0x61, 0x00, 0x8b);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET5,
+			     BE16_BYTE0(VID_VS_DELAY),
+			     BE16_BYTE1(VID_VS_DELAY),
+			     0x00, 0x00, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET6,
+			     0x00, 0x24, 0x00, 0x00, 0x1f, 0x00, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
+			     0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x03,
+			     0x1D, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
+			     0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_TE_GPIO_CTL,
+			     0x00, 0x6A, 0x02);
+	r63455_dsi_write_buffer(ctx, dsi_ctx, pps_cmd);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_TEAR_ON, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x40);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE);
+	mipi_dsi_msleep(&dsi_ctx, 170);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_DISPLAY_ON);
+	mipi_dsi_msleep(&dsi_ctx, 200);
+
+	return dsi_ctx.accum_err;
+}
+
+static int r63455_panel_on_boe_vs026c4m_n52_26000(struct drm_panel *panel)
+{
+	struct r63455_ctx *ctx = panel_to_ctx(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+
+	u8 pps_cmd[1 + sizeof(struct drm_dsc_picture_parameter_set)];
+
+	drm_dsc_pps_payload_pack((void *)&pps_cmd[1], &ctx->dsc_cfg);
+	pps_cmd[0] = R63455_PPS_SET;
+
+	r63455_dsi_write_seq(ctx, dsi_ctx,
+			     R63455_MF_CMD_ACCESS_PROTECT, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_SEQ_CTL, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DSI_CTL,
+			     0x20, 0x6b, 0x80, 0x06, 0x33, 0x9A, 0x00,
+			     0x1a, 0x7a);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_MODE,
+			     0x54, 0x00, 0x00, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
+			     0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0xf, 0xb2,
+			     0xf, 0xb2, 0x00, 0x64);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3,
+			     0x0B, 0x70, 0x08, 0x48, 0x00, 0x00, 0x13, 0x01,
+			     0xFF, 0x00, 0x01, 0x09, 0x16, 0x16, 0x00, 0x00,
+			     0x00, 0x01, 0x40, 0x0C, 0x00, 0x00, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x70, 0x08,
+			     0xD0, 0x02, 0x21, 0x6F, 0x08, 0x5A, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET1,
+			     RTN, 0x86, LE16_BYTE0(VBP), LE16_BYTE1(VBP), 0x08,
+			     0x70, BE16_BYTE0(VFP), BE16_BYTE1(VFP), 0x00,
+			     0x00, 0x08, 0x3A, 0x00, 0x00, 0x17, 0x00, 0x17);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3_2, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET4,
+			     0x8b, 0x00, 0x80, 0x46, 0x61, 0x00, 0x8b);
+	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET5,
+			     BE16_BYTE0(VID_VS_DELAY), BE16_BYTE1(VID_VS_DELAY),
+			     0x00, 0x00, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx,
+			     R63455_TE_GPIO_CTL, 0x00, 0x6A, 0x02);
+	r63455_dsi_write_buffer(ctx, dsi_ctx, pps_cmd);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_TEAR_ON, 0x00);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE);
+	mipi_dsi_msleep(&dsi_ctx, 170);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_DISPLAY_ON);
+	mipi_dsi_msleep(&dsi_ctx, 200);
+
+	return dsi_ctx.accum_err;
+}
+
+static int r63455_set_brightness(struct r63455_ctx *ctx, u16 brightness,
+				  u16 pulse_offset_rows)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+	u16 gpo1_tew1;
+
+	gpo1_tew1 = brightness > BRIGHTNESS_MAX_120 ?
+		    BRIGHTNESS_MAX_120 : brightness;
+
+	ctx->dsi[0]->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	r63455_dsi_write_seq(ctx, dsi_ctx,
+			     R63455_GEN_OUTPIN_SET,
+			     0x0f, 0xe4,
+			     BE16_BYTE0(gpo1_tew1),
+			     BE16_BYTE1(gpo1_tew1),
+			     0x00, 0x00, 0x00, 0x00, 0x0f, 0xb2,
+			     BE16_BYTE0(brightness),
+			     BE16_BYTE1(brightness));
+
+	ctx->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
+	ctx->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return dsi_ctx.accum_err;
+}
+
+static int r63455_disable(struct drm_panel *panel)
+{
+	struct r63455_ctx *ctx = panel_to_ctx(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+
+	ctx->dsi[0]->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_DISPLAY_OFF);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_TEAR_OFF);
+	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_ENTER_SLEEP_MODE);
+
+	mipi_dsi_msleep(&dsi_ctx, 200);
+
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
+
+	return backlight_disable(ctx->backlight);
+}
+
+static int r63455_unprepare(struct drm_panel *panel)
+{
+	struct r63455_ctx *ctx = panel_to_ctx(panel);
+	int ret;
+
+	gpiod_set_value(ctx->reset_gpios->desc[0], 0);
+	gpiod_set_value(ctx->reset_gpios->desc[1], 0);
+
+	msleep(25);
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->reg_lcd_bias_neg),
+				     ctx->reg_lcd_bias_neg);
+	if (ret)
+		dev_err(ctx->dev, "Could not disable bias negative\n");
+
+	usleep_range(1000, 2000);
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->reg_lcd_bias_pos),
+				     ctx->reg_lcd_bias_pos);
+	if (ret)
+		dev_err(ctx->dev, "Could not disable bias positive\n");
+
+	msleep(20);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->reg_vdda), ctx->reg_vdda);
+	if (ret)
+		dev_err(ctx->dev, "Could not disable vdda\n");
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->reg_bl), ctx->reg_bl);
+	if (ret)
+		dev_err(ctx->dev,
+			"failed to disable regulator backlight: %d\n", ret);
+
+	return ret;
+}
+
+static int r63455_enable(struct drm_panel *panel)
+{
+	struct r63455_ctx *ctx = panel_to_ctx(panel);
+	int ret;
+
+	ctx->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
+	ctx->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	msleep(20);
+	ret = ctx->dsi_init_seq(panel);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "dsi init failed\n");
+		return ret;
+	}
+	ctx->backlight->props.pulse_offset_rows = GPO1_TES1;
+
+	ret = backlight_enable(ctx->backlight);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "failed to enable backlight\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int r63455_prepare(struct drm_panel *panel)
+{
+	struct r63455_ctx *ctx = panel_to_ctx(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->reg_bl), ctx->reg_bl);
+	if (ret) {
+		dev_err(ctx->dev, "Could not enable backlight\n");
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->reg_vdda), ctx->reg_vdda);
+	if (ret) {
+		dev_err(ctx->dev, "Could not enable vdda\n");
+		goto bl_off;
+	}
+
+	usleep_range(1000, 2000);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->reg_lcd_bias_pos),
+				    ctx->reg_lcd_bias_pos);
+	if (ret) {
+		dev_err(ctx->dev, "Could not enable bias positive\n");
+		goto vdda_off;
+	}
+	usleep_range(1000, 2000);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->reg_lcd_bias_neg),
+				    ctx->reg_lcd_bias_neg);
+	if (ret) {
+		dev_err(ctx->dev, "Could not enable bias negative\n");
+		goto bias_off;
+	}
+
+	msleep(20);
+	gpiod_set_value(ctx->reset_gpios->desc[0], 1);
+	gpiod_set_value(ctx->reset_gpios->desc[1], 1);
+
+	return 0;
+
+bl_off:
+	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_bl), ctx->reg_bl);
+vdda_off:
+	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_vdda), ctx->reg_vdda);
+bias_off:
+	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_lcd_bias_pos),
+			       ctx->reg_lcd_bias_pos);
+	return ret;
+}
+
+static int r63455_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	struct r63455_ctx *r63455_ctx = mipi_dsi_get_drvdata(dsi);
+
+	return r63455_set_brightness(r63455_ctx, bl->props.brightness,
+				     bl->props.pulse_offset_rows);
+}
+
+static const struct backlight_ops r63455_bl_ops = {
+	.update_status = r63455_bl_update_status,
+};
+
+static int r63455_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &modes);
+}
+
+static const struct drm_panel_funcs r63455_drm_funcs = {
+	.disable = r63455_disable,
+	.enable = r63455_enable,
+	.unprepare = r63455_unprepare,
+	.prepare = r63455_prepare,
+	.get_modes = r63455_get_modes,
+};
+
+static int r63455_panel_add(struct r63455_ctx *ctx)
+{
+	struct device *dev = ctx->dev;
+	struct backlight_properties bl_props;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->reg_vdda); i++)
+		ctx->reg_vdda[i].supply = vdda_driver[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->reg_vdda),
+				      ctx->reg_vdda);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(dual_backlight_driver); i++)
+		ctx->reg_bl[i].supply = dual_backlight_driver[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->reg_bl),
+				      ctx->reg_bl);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->reg_lcd_bias_pos); i++)
+		ctx->reg_lcd_bias_pos[i].supply = dual_lcd_bias_pos[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->reg_lcd_bias_pos),
+				      ctx->reg_lcd_bias_pos);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->reg_lcd_bias_neg); i++)
+		ctx->reg_lcd_bias_neg[i].supply = dual_lcd_bias_neg[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->reg_lcd_bias_neg),
+				      ctx->reg_lcd_bias_neg);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpios = devm_gpiod_get_array(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpios))
+		return PTR_ERR(ctx->reset_gpios);
+
+	memset(&bl_props, 0, sizeof(bl_props));
+	bl_props.type = BACKLIGHT_RAW;
+	bl_props.brightness = BRIGHTNESS_DEFAULT;
+	bl_props.max_brightness = BRIGHTNESS_MAX_120;
+
+	ctx->backlight = devm_backlight_device_register(dev, dev_name(dev),
+							dev, ctx->dsi[0],
+							&r63455_bl_ops,
+							&bl_props);
+	if (IS_ERR(ctx->backlight)) {
+		ret = PTR_ERR(ctx->backlight);
+		dev_err(dev, "Failed to register backlight (%d)\n", ret);
+		return ret;
+	}
+
+	ctx->panel.prepare_prev_first = true;
+	return devm_drm_panel_add(dev, &ctx->panel);
+}
+
+static int r63455_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct r63455_ctx *ctx;
+	struct mipi_dsi_device *dsi1_device;
+	struct device_node *dsi1;
+	struct mipi_dsi_host *dsi1_host;
+	struct mipi_dsi_device *dsi_dev;
+	int ret = 0;
+	int i;
+
+	const struct mipi_dsi_device_info info = {
+		.type = "r63455-dsi-panel",
+		.channel = 0,
+		.node = NULL,
+	};
+
+	ctx = devm_drm_panel_alloc(&dsi->dev, __typeof(*ctx), panel,
+				   &r63455_drm_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	ctx->dsi_init_seq = of_device_get_match_data(dev);
+	if (!ctx->dsi_init_seq)
+		return -ENODEV;
+
+	dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+	if (!dsi1) {
+		DRM_DEV_ERROR(dev, "failed to get secondary dsi\n");
+		return -ENODEV;
+	}
+
+	dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
+	of_node_put(dsi1);
+	if (!dsi1_host) {
+		DRM_DEV_ERROR(dev, "failed to find secondary dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi1_device = mipi_dsi_device_register_full(dsi1_host, &info);
+	if (IS_ERR(dsi1_device)) {
+		DRM_DEV_ERROR(dev, "failed to create dsi device\n");
+		return PTR_ERR(dsi1_device);
+	}
+
+	ctx->dsi[1] = dsi1_device;
+	mipi_dsi_set_drvdata(dsi, ctx);
+	ctx->dev = dev;
+	ctx->dsi[0] = dsi;
+
+	ret = r63455_init_dsc_config(ctx);
+	if (ret)
+		return ret;
+
+	ctx->dsi[0]->dsc = &ctx->dsc_cfg;
+	ctx->dsi[0]->dual_panel = true;
+	ctx->dsi[1]->dual_panel = true;
+	ctx->dsi[1]->dsc = &ctx->dsc_cfg;
+
+	ret = r63455_panel_add(ctx);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to add panel %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < 2; i++) {
+		dsi_dev = ctx->dsi[i];
+		dsi_dev->lanes = 3;
+		dsi_dev->format = MIPI_DSI_FMT_RGB888;
+		dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
+			MIPI_DSI_CLOCK_NON_CONTINUOUS;
+		ret = devm_mipi_dsi_attach(dev, dsi_dev);
+		if (ret < 0) {
+			DRM_DEV_ERROR(dev, "dsi attach failed i = %d\n", i);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct of_device_id r63455_of_match[] = {
+	{
+		.compatible = "sharp,ls026b3sa06",
+		.data = r63455_panel_on_sharp_ls026b3sa06,
+	},
+	{
+		.compatible = "boe,vs026c4m-n52-6000",
+		.data = r63455_panel_on_boe_vs026c4m_n52_26000,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, r63455_of_match);
+
+static struct mipi_dsi_driver r63455_driver = {
+	.driver = {
+		.name = "panel-synaptics-r63455",
+		.of_match_table = r63455_of_match,
+	},
+	.probe = r63455_probe,
+};
+module_mipi_dsi_driver(r63455_driver);
+
+MODULE_DESCRIPTION("Synaptics R63455 DSI Panel Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


