Return-Path: <linux-arm-msm+bounces-82270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D89C691EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECC334F10F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FB03570CA;
	Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tA3sR6MM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529882F6592;
	Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465445; cv=none; b=pm61GWlPKQ+qzoOrifj1pSBSr68aXUQ5rPVox8C8ByuIebl7UuEyYjHyJyP4WpNDiAYBVWdbkVEXHUyF14GUc96Q05GRSRbQVt55x16AvVg5995X9dGuMOrwgUIEDFub/lUAHebp2+SfS4ChARf9eUEKA8f9wlIGi0MxP+1Hphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465445; c=relaxed/simple;
	bh=weu9Gal9knvRbta5HZYwQ/tNsYCmMU5jIuyq+C0OJ2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCXaSFUrgBzxGOWXNgiJNAeDdAkdpjDiWAaPCOaKw3bEfHAkYurjUqA7UbT9+9WE2WpzDF3H25B4EKGE3Q1fKopJ2VbJscztAqnH4XuOSzenwUXXq+0CHhj7JUbe/A71Z6DSKGpdnaL1MOl8LbQBOA5LDZ7PSxaf829pEmO5SE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tA3sR6MM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA4C9C2BCC7;
	Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763465444;
	bh=weu9Gal9knvRbta5HZYwQ/tNsYCmMU5jIuyq+C0OJ2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tA3sR6MMd6bc9+qVNf6aAkWPSNh1IiLvbGV0Ey+IVQk66wN/pdLcYOavtIjeiGI86
	 xClZi5dzIJbGRh+Agbgo0ZJjqq+5dle6ISVS5pQyy0xAHM+vf+mAJDBg1vHsLNjer2
	 +/xo/3o+1orKPoH/ZafZ7VZa1W7QT69ts8yCxbexR/6fUfzXoLfr3Kd9KPq41d/cJ+
	 /pDCKjwlcJYUn0+0DjgBW9snDqpFNZVAn1huCpDPODa0yr4W5vbWMra1vlIUVOndbX
	 Cda/o42oePsd789kkx/139hwucR4N27itODu3hVKeJWw1j3UraX3FMpfpAjuaXdFUy
	 jNJph6I4upOcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9774CED626;
	Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:39 +0100
Subject: [PATCH v3 4/8] drm/panel: sw43408: Introduce disable/enable
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-4-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4551; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DcorS7ExFTwS0RpshjxIWUy+stR2k82f1+OQUo2ONJQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjgcc9j1JfUZSv+fsmI/k7Oo8rIPPxM9pVUj
 /ehTC/cBuqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 cmQQD/4kUKcN5KL1ahhNANvszShACU3q8may3LoRT0Kwj8vQF5U0I9rDIjzjLqf1OdRhBaVxGok
 5ib8CIOZ2ekzZJ/abH3Pjb1F5nSsCPLRNUL8qI6S174zGnLMFLFfH4ejA432mmLidZUa0L5k9Ck
 hyBj+NX0LjsPg7liK/9unIP1N+otdoTjZCGLRblwSONVhX56N6sc540AaCHd97QqioMyIkOlNpC
 80QI+fZy6VQqFIA0fjC9BVWV3LLqIR5zRSA1iUW39rS0ji5pIzUDmDnpr0m0T7wQWS78UUKGStE
 Orz19Lv75NcP3O1VO0qA7mc7Qr7mBsoWXFpm8eehVo+fBrvYk0ifPl/mARXrKK9eAJdJqY4iZgs
 D2/ib+1tgBhmggT2FMq/TinL4zAxzzL4H61kpY4eIg129VQLL31wn2GiDzIVyJXs2RnwxwpR3x0
 otAZipl+p5oYtryNnvFkuH6lyCp/6ot/+HL0P7Qf79DLSy5D9sjnSTUDieFHHz8dmWIBX3IAeFj
 Pa+uw5L9LXDmCiqKHZJ1oKK61m3ljuWHSFaTzhmDvqejb7QL9FQGLdU5Ikk3xNLjwY6sVYRwLpH
 ST3kZAI1/nQqPrisyFWKB70TXyWnCzED9sGMJk/fV2jum0muiEWVpxcq1nP8SH6HHA3ms6SshmZ
 ujokIiqn4SDIl4A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Mostly cleanup, introduced disable, enable, and reset function, which
takeover parts of prepare and unprepare suitable for splitting.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 83 ++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index bd55f6d8f2771..e5a8a9bb8d15c 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -38,11 +38,10 @@ static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
 	return container_of(panel, struct sw43408_panel, base);
 }
 
-static int sw43408_unprepare(struct drm_panel *panel)
+static int sw43408_disable(struct drm_panel *panel)
 {
 	struct sw43408_panel *sw43408 = to_panel_info(panel);
 	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
-	int ret;
 
 	mipi_dsi_dcs_set_display_off_multi(&ctx);
 
@@ -50,19 +49,55 @@ static int sw43408_unprepare(struct drm_panel *panel)
 
 	mipi_dsi_msleep(&ctx, 100);
 
+	return ctx.accum_err;
+}
+
+static int sw43408_unprepare(struct drm_panel *panel)
+{
+	struct sw43408_panel *sw43408 = to_panel_info(panel);
+	int ret;
+
 	gpiod_set_value(sw43408->reset_gpio, 1);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408->supplies), sw43408->supplies);
 
-	return ret ? : ctx.accum_err;
+	return ret;
 }
 
-static int sw43408_program(struct drm_panel *panel)
+static int sw43408_enable(struct drm_panel *panel)
 {
 	struct sw43408_panel *sw43408 = to_panel_info(panel);
 	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
 	struct drm_dsc_picture_parameter_set pps;
 
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+
+	mipi_dsi_msleep(&ctx, 50);
+
+	sw43408->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	drm_dsc_pps_payload_pack(&pps, sw43408->link->dsc);
+
+	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
+
+	sw43408->link->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	/*
+	 * This panel uses PPS selectors with offset:
+	 * PPS 1 if pps_identifier is 0
+	 * PPS 2 if pps_identifier is 1
+	 */
+	mipi_dsi_compression_mode_ext_multi(&ctx, true,
+					    MIPI_DSI_COMPRESSION_DSC, 1);
+
+	return ctx.accum_err;
+}
+
+static int sw43408_program(struct drm_panel *panel)
+{
+	struct sw43408_panel *sw43408 = to_panel_info(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
+
 	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
 
 	mipi_dsi_dcs_set_tear_on_multi(&ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
@@ -97,26 +132,19 @@ static int sw43408_program(struct drm_panel *panel)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0xca);
 
-	mipi_dsi_dcs_set_display_on_multi(&ctx);
-
-	mipi_dsi_msleep(&ctx, 50);
-
-	sw43408->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	drm_dsc_pps_payload_pack(&pps, sw43408->link->dsc);
-
-	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
+	return ctx.accum_err;
+}
 
-	sw43408->link->mode_flags |= MIPI_DSI_MODE_LPM;
+static void sw43408_reset(struct sw43408_panel *ctx)
+{
+	usleep_range(5000, 6000);
 
-	/*
-	 * This panel uses PPS selectors with offset:
-	 * PPS 1 if pps_identifier is 0
-	 * PPS 2 if pps_identifier is 1
-	 */
-	mipi_dsi_compression_mode_ext_multi(&ctx, true,
-					    MIPI_DSI_COMPRESSION_DSC, 1);
-	return ctx.accum_err;
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
 }
 
 static int sw43408_prepare(struct drm_panel *panel)
@@ -128,14 +156,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	usleep_range(5000, 6000);
-
-	gpiod_set_value(ctx->reset_gpio, 0);
-	usleep_range(9000, 10000);
-	gpiod_set_value(ctx->reset_gpio, 1);
-	usleep_range(1000, 2000);
-	gpiod_set_value(ctx->reset_gpio, 0);
-	usleep_range(9000, 10000);
+	sw43408_reset(ctx);
 
 	ret = sw43408_program(panel);
 	if (ret)
@@ -208,6 +229,8 @@ static int sw43408_backlight_init(struct sw43408_panel *ctx)
 }
 
 static const struct drm_panel_funcs sw43408_funcs = {
+	.disable = sw43408_disable,
+	.enable = sw43408_enable,
 	.unprepare = sw43408_unprepare,
 	.prepare = sw43408_prepare,
 	.get_modes = sw43408_get_modes,

-- 
2.51.0



