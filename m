Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC8853F257
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 01:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbiFFXFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 19:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235206AbiFFXFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 19:05:46 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2045.outbound.protection.outlook.com [40.92.107.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C50F35DE4;
        Mon,  6 Jun 2022 16:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aC6qtUoTYeiNFIGqSepR+FN2VmfNMFl33xHam+xn50RoNUdmRJhYdopGnllGZKlOgjfsNe4O07tDrqyl8n7aurbgCdzlWZtkAWlfL0+jBIhuR5wsnFkGcmm359FdMDa6Z0dHJJ4/Iqa8BDx6weTGlQTqXhDPK/N14UxvGWDGdKf/JN3YN66pVs9uKmxnIWZwOT9eEz0mslpwsmnZju3EiWIqAuQ+Fy/aF3W1YCD+1AtAqyu1uxKj2zrF1EOAuVhQvmK3XE3rvLTmYtwHM9htA9/sxZJB67VZ05eudQCjUlMepla0Kb57R8m6nKWCuAKBK6rRZ6t+pS8A7l7K28jqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzeIRvSm1z/qoNQEOhlsrvODgJQHnTr+rVnJabpJmLM=;
 b=VZJ5XrwnfDb0bRaJ0FV1rFTNtIX5P3pR+9Yie72/mDZLudjFC9dbyZ3vQedAYT/bspTKGZYQTaSHR8z7hSMcbzY9SquCsySCXP0P6//6u1wcy8fKFoyjVCH3xk6U9MiWeHajvq5POfuViJGuPGBq8azwkz0Hrw+kZzWBABvE+A8sBBoBwPz3V+CGhOmd3S46xtqJFY4dBkrJ7eDPhB8iQ4GdFWeBfE1OAevA2iGbc4/eABJfybrC65+AiEzfLtWYcsVW5uthK78rPD8yn1wshlxQJ7vtHIvtf/pwy51UDEyq9n5RzcbTgUBnDTk3jsKSYCdFrqN5tiX861my/ZVbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6)
 by PUZPR03MB6187.apcprd03.prod.outlook.com (2603:1096:301:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.6; Mon, 6 Jun
 2022 23:05:39 +0000
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961]) by SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961%3]) with mapi id 15.20.5332.007; Mon, 6 Jun 2022
 23:05:39 +0000
From:   Teguh Sobirin <teguh@sobir.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 2/7] gpu: drm: panel: Add Innolux TD4328 panel driver
Date:   Tue,  7 Jun 2022 06:05:17 +0700
Message-ID: <SEZPR03MB6666CFDD30995CDDD0DDACC2DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606230522.107428-1-teguh@sobir.in>
References: <20220606230522.107428-1-teguh@sobir.in>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [gOFivkEOeeGaEowq67y+CFBvVy3fLMpw]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR03MB6666.apcprd03.prod.outlook.com
 (2603:1096:101:7d::6)
X-Microsoft-Original-Message-ID: <20220606230522.107428-2-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d353d03f-cd30-4255-f3a9-08da4811128e
X-MS-TrafficTypeDiagnostic: PUZPR03MB6187:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feg6geMLTs+A7zDizDsxNnwPMEipzKCGxvwqzlhSEpKvOlFMIpS1bJc9r6IlmBRT8qhuq1EwpOvYdFqmA9ad8lQXKXuByMk2dNYgsXO1dvIZHMd6s18BMp69o9ZOBjPAMwJ7+fPjAZZAzCB8LlM4PhhAMCy636VldcMOc2B3atSyOPOa4Cl8KsoEKsPZlOOhSXf7nkZ9vKW8mjTdHm8UyepAHYNtUt3zKls07syrbyXnT/iYliVP94jcO5QuIssQ9H9Ie/ZKIbfYhyZihNkeCbt0iqIWUluWBZ5dmIyQ71f8a2f+pddQvf8jfYUEz61GWfM09FZeS9ymbFpXNAu5FLb6VJ95nz9kaMXu5wZe07vKGgscWk7O2beKoDvjXoRVPWqf3wxUckX4+zyEfJ6V00gScG0WhDJjFIY3NLm0T11jeuChPhf4IWWNwbQFy3BGV6m6YTY+iTtwyfIrfK6Z4aiTRwbS8F3EZ9jsywjmugn5VYoCSrbFDnEtMKyBfdUSaoCli8V0C7sSEo0O6ws/zZZ2p3VT+Elo2A8rss17hLXoiJY6BsftJvRqoYAFdd/1aavwGWO5Raoxya2q3BhwLg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVyMUhEUdsYCaSMEQGJ0TinbKuHo4kqx8GL1RHc0xt+FwsOBlMn2ryL+yx4j?=
 =?us-ascii?Q?RaSEKi+n9ujT/DonPFMR7Th//wwBnw6N/9a9a2ws7cYIAQII7VEsovDo4b5p?=
 =?us-ascii?Q?bhGt/txm38SkLXjSQCeakkoJZ19NlGRab2NKO0hQH/ueYWI1l/Lt+9rOZxVN?=
 =?us-ascii?Q?zdKijkOEtSWYxFtJmzR0Vg8GrguZkOSrESoGZY05B4fqvhm1zsEjZi+MWoU6?=
 =?us-ascii?Q?XeCa7LBxPz59B1cJ56N3OPDif/p01q00v0G/mWc7r+cmFkZhf4BySjHCk99V?=
 =?us-ascii?Q?1O70k2DzZ4LxobUifeA5xjR8dL7CqzgEC7WBX4zZUaOFzsjD7nPqSGv0Ybef?=
 =?us-ascii?Q?7vblJMcVhCO1t/7QoXT7BgV4FX4rr6SqE7ZCdGwlb6h4znq+Anm/5dhpUFum?=
 =?us-ascii?Q?TWbzOHv3q2jz22YPlST1m7aHYr0lG+s2Gam4sHmPfmPjdqbC1R/XShSj7Fv4?=
 =?us-ascii?Q?IzwDmaCAHGq0qVJZF7lzlke1EV5ENzXQCEou39kX6aGBkI8doaAkd4GqT15I?=
 =?us-ascii?Q?g8EoDTeFnH1See04jP0ZVOLsBhkuQOzDboDEc+ln2Wp+LnMWA1Aa0CtKYEq/?=
 =?us-ascii?Q?7PuEGgiPK/8O/GNb4MKvB6r72Dd0aDeBPvjK8CGhRrzHBDW/9Ee4ai3hHUMX?=
 =?us-ascii?Q?sH+WdbSUIIabysdEi9F5Fkp6a92Q+H9UiXca2ISg10WJyavzRgDxhSrXEApY?=
 =?us-ascii?Q?1tpv8fFkpwGZrZHKuN5zPQJmZlXwLORzNi6yysTz436v359nJDlnMkcZt1Tq?=
 =?us-ascii?Q?GTrkiwoFCMFPepEpRdJpk1c0oED2H24lWCod/5OXmI9oThXNRStinyVGauxd?=
 =?us-ascii?Q?S5r4gOhOnCt+ljL5dfaRdhSppG17r1tf428RvEBE/l2hHkXPlhPLy0kErqJi?=
 =?us-ascii?Q?cvsFajzVmQ/kFYG8ho+8/GbPECNUoW0rM2QmCFB1gxrFxOP4P6eZeFfzm2LT?=
 =?us-ascii?Q?5BDNeYZ3i6nh3Z63/UVaFmRsT55hZn++jT7tym3MGfFJ74uUBRAYj1UF8ace?=
 =?us-ascii?Q?FOTvCSUbKvVCgjvWiokd/RMXqwS4cSUzEYq7odXuR/n/2z7fgeSQp7hhoTVK?=
 =?us-ascii?Q?JMisu/JFE1nu651vBKhQpegdfPUjR3SvQxWldMDEoh9zKbxjbgnf57l9CyIT?=
 =?us-ascii?Q?p8/9pD51ehCVjcZJYbnyxaKzCWFFvUzMSNUL5TomqAl/kIV67qcUHN81Q0z/?=
 =?us-ascii?Q?eTCyj+Q3PD40jZIcB69mLIHR4j34bSxR+Cy+f2kaWUT9EVdRxJHvnbTSABkD?=
 =?us-ascii?Q?9EKOi3EFvDf1bH/szU9qoOLmrJquwmnwiAx3+GhGnswtNT+ywovqYhIO34GH?=
 =?us-ascii?Q?JwB2nhanYQt6EY/wPQrHqk8X37EOvTzgjCESbwbOj9axRIpgNDSQdHtlZGI1?=
 =?us-ascii?Q?INMdrnqcK+tC8nMAuozUbm6iBeMUS5wMSViD4XdGVkEemTa06A=3D=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c0b75.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d353d03f-cd30-4255-f3a9-08da4811128e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6666.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 23:05:39.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6187
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
 drivers/gpu/drm/panel/Kconfig                |   9 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-innolux-td4328.c | 339 +++++++++++++++++++
 3 files changed, 349 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-innolux-td4328.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a89c03379db5..50ecd01872b9 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -202,6 +202,15 @@ config DRM_PANEL_INNOLUX_P079ZCA
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host and has a built-in LED backlight.
 
+config DRM_PANEL_INNOLUX_TD4328
+	tristate "Innolux TD4328 DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the Innolux TD4328 display controller.
+
 config DRM_PANEL_JDI_LT070ME05000
 	tristate "JDI LT070ME05000 WUXGA DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index ddf488b96cb3..cc3389a13a2a 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
+obj-$(CONFIG_DRM_PANEL_INNOLUX_TD4328) += panel-innolux-td4328.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
 obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
 obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
diff --git a/drivers/gpu/drm/panel/panel-innolux-td4328.c b/drivers/gpu/drm/panel/panel-innolux-td4328.c
new file mode 100644
index 000000000000..7c17f8c06512
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-innolux-td4328.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Teguh Sobirin
+ * Author: Teguh Sobirin <teguh@sobir.in>
+ *
+ * This driver is for the DSI interface to Innolux panel
+ * Using the TD4328 display driver IC from Synaptics.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/display_timing.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct td4328 {
+	struct device *dev;
+	struct drm_panel panel;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+	enum drm_panel_orientation orientation;
+	bool prepared;
+};
+
+static inline struct td4328 *panel_to_td4328(struct drm_panel *panel)
+{
+	return container_of(panel, struct td4328, panel);
+}
+
+static int td4328_init_sequence(struct td4328 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct device *dev = ctx->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(70);
+
+	ret = mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set sleep column address: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_page_address(dsi, 0, 1920 - 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set sleep page address: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear on: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "Panel init sequence done\n");
+	return 0;
+}
+
+static int td4328_unprepare(struct drm_panel *panel)
+{
+	struct td4328 *ctx = panel_to_td4328(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	regulator_disable(ctx->supply);
+
+	ctx->prepared = false;
+
+	return 0;
+}
+
+static int td4328_prepare(struct drm_panel *panel)
+{
+	struct td4328 *ctx = panel_to_td4328(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	dev_dbg(ctx->dev, "Resetting the panel\n");
+	ret = regulator_enable(ctx->supply);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to enable supply: %d\n", ret);
+		return ret;
+	}
+
+	msleep(20);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10, 20);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	msleep(20);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
+		goto disable_supply;
+	}
+
+	msleep(250);
+
+	ret = td4328_init_sequence(ctx);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
+		goto disable_supply;
+	}
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
+		goto disable_supply;
+	}
+
+	msleep(50);
+
+	ctx->prepared = true;
+
+	return 0;
+
+disable_supply:
+	regulator_disable(ctx->supply);
+	return ret;
+}
+
+static const struct drm_display_mode default_mode = {
+	.clock       = (1080 + 60 + 10 + 60) * (1920 + 20 + 8 + 20) * 60 / 1000,
+	.hdisplay    = 1080,
+	.hsync_start = 1080 + 60,
+	.hsync_end   = 1080 + 60 + 10,
+	.htotal      = 1080 + 60 + 10 + 60,
+	.vdisplay    = 1920,
+	.vsync_start = 1920 + 20,
+	.vsync_end   = 1920 + 20 + 8,
+	.vtotal      = 1920 + 20 + 8 + 20,
+	.width_mm    = 75,
+	.height_mm   = 132,
+};
+
+static int td4328_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct td4328 *ctx = panel_to_td4328(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	if (!mode) {
+		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
+			default_mode.hdisplay, default_mode.vdisplay,
+			drm_mode_vrefresh(&default_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+	drm_connector_set_panel_orientation(connector, ctx->orientation);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs td4328_funcs = {
+	.unprepare	= td4328_unprepare,
+	.prepare	= td4328_prepare,
+	.get_modes	= td4328_get_modes,
+};
+
+static int td4328_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct td4328 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio)) {
+		dev_err(dev, "cannot get reset gpio\n");
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ctx->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(ctx->supply)) {
+		ret = PTR_ERR(ctx->supply);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request vdd regulator: %d\n", ret);
+		return ret;
+	}
+
+	ctx->supply = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(ctx->supply)) {
+		ret = PTR_ERR(ctx->supply);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request vddio regulator: %d\n", ret);
+		return ret;
+	}
+
+	ctx->supply = devm_regulator_get(dev, "vddpos");
+	if (IS_ERR(ctx->supply)) {
+		ret = PTR_ERR(ctx->supply);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request vddpos regulator: %d\n", ret);
+		return ret;
+	}
+
+	ctx->supply = devm_regulator_get(dev, "vddneg");
+	if (IS_ERR(ctx->supply)) {
+		ret = PTR_ERR(ctx->supply);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request vddneg regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get orientation %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->dev = dev;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_LPM
+		| MIPI_DSI_MODE_VIDEO_HSE
+		| MIPI_DSI_CLOCK_NON_CONTINUOUS
+		| MIPI_DSI_MODE_VIDEO_BURST
+		| MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	drm_panel_init(&ctx->panel, &dsi->dev, &td4328_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void td4328_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct td4328 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = drm_panel_unprepare(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
+
+	ret = drm_panel_disable(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+}
+
+static int td4328_remove(struct mipi_dsi_device *dsi)
+{
+	struct td4328 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	td4328_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id td4328_of_match[] = {
+	{ .compatible = "innolux,td4328" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, td4328_of_match);
+
+static struct mipi_dsi_driver td4328_driver = {
+	.driver = {
+		.name = "panel-innolux-td4328",
+		.of_match_table = td4328_of_match,
+	},
+	.probe	= td4328_probe,
+	.remove = td4328_remove,
+	.shutdown = td4328_shutdown,
+};
+module_mipi_dsi_driver(td4328_driver);
+
+MODULE_AUTHOR("Teguh Sobirin <teguh@sobir.in>");
+MODULE_DESCRIPTION("DRM driver for TD4328 cmd mode DSI Innolux panel");
+MODULE_LICENSE("GPL v2");
-- 
2.30.2

