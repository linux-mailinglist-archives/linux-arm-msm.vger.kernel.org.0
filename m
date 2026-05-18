Return-Path: <linux-arm-msm+bounces-108172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCT2G4LzCmpZ+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:09:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4A56B484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCD3A304E65C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEFF3F44CE;
	Mon, 18 May 2026 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hy90Tyvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8A4327C0D;
	Mon, 18 May 2026 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102331; cv=none; b=c6t90LzPpzKVlOBZf91cdKkxY072MX7U3xUH+YO+ek7NLTlSETtzd72zvGniXkCT7uY4K+0PI0Bv1PNeOXryzEBjI2K3W4YI82MXjGeI/9CAP2xHVL8lzxIohbBNmmdczxOgTlzOelF85DXrvZxXlip7KqLa7TWrCEXlvDPZV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102331; c=relaxed/simple;
	bh=pVAAldO3jRSG3CGMikNR+v4fQVNDKnLv7814LISPxoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+SEBCGax860XOf/XM7z1DB+wn9YWQeMmc4G3d1UoYvY4LJl3euOW84o1R4JFssQGTkUzkw5aBybyJaiD9NzQhNcxvTF4QCZhqEacJTmfhNWIKFBPXf2jqEJEJ8dxyl36iishED9zm8qFY8mlhf8mI0Q8kiKsNLROZUfDy44VLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy90Tyvy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5bIeq1696574;
	Mon, 18 May 2026 11:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Nm/eRWnDOp3Wl41GShC2MRcFHbrqPCbucPByfJ8ars=; b=Hy90TyvywKWKLys7
	kTBP63bJnjn4DrrzKtbNs03IPH+1yE6vj/JMqyFI9uP39ezhZqRAuCvM3pVD8xpU
	/EMML4+8i9Z8Mz++vNx/V2LnKVYaeTJyCvM0/qhiHQvEmcEdB7Cy2Nsx/W0Uy+I9
	HpvKh6P4X6NCd3Z7ETEneefHYNM2sgeWFQ+7uM0JnXKb5ZWzDlZvm0nZwk5wB0JE
	EUzGerTTx2nhFSSXWG4lxT74y2DAaflZFUvn4+LQZKf+Q5juUQmEgKiY2ab/ZAoX
	/76s9b3no3dUPMrmOPMS6KPdfjKvpgh3vfSFGiqGAifr4NmuPfawLB2OYKHKeie5
	/cX8AQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vsk1d73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64IB52hn032187;
	Mon, 18 May 2026 11:05:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716d13uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:02 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64IB51xK032157;
	Mon, 18 May 2026 11:05:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64IB51Fe032142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:01 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 8BF4461A;
	Mon, 18 May 2026 16:35:00 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:34:13 +0530
Subject: [PATCH 2/2] drm/panel: add Ilitek ILI7807S panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-ili7807s-panel-v1-2-d7b048163b1c@oss.qualcomm.com>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
In-Reply-To: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        Arpit Saini <arpit.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779102300; l=11346;
 i=arpit.saini@oss.qualcomm.com; s=20260518; h=from:subject:message-id;
 bh=pVAAldO3jRSG3CGMikNR+v4fQVNDKnLv7814LISPxoc=;
 b=kOhNRBLdf5B3Lb3g+Rw9HQTvIi14lVU+Avdx7cIYH3Ku22K0TE0JO9cffUsqQHer8se8DAE2d
 jFFAkoJoA2EApGDf9rNvtG2TRqgfhaIHyL3KTBFUawVu1OE3ZHNPaIg
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=OGOh7FGwrnkILHNlcTTABbBMQxxo319duzbTg0YPDAc=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfXwJg5v7NsUFbo
 EnAFf/xOg+44Kd8UeSSKu/dKEgksFwPeOkbN5WWdObOO7EE9iDIZ2vO4+9Sz4hVMMcoF6Gurj+N
 xGaNzbK0r/umIvE1oIjhyt7GvNvgBTqpRXh1ku++npdBiuTQw8Zcoc8oy/9+b/q/PpLiV9YSxN1
 dOIk4dnK3bamPASdjMMUcR3A/bzHBGoiUMif39coNrVJ/VfX8WMVnKTmYBESlG+GrA2RjGJA8Xb
 p8Yk6uFGoP4azNJarqW7lQjUNnZvCAFdUhU2+BileBRgtGz+Tsm9IpN3t2qcVhjhhRXcXy60iSs
 owD5AUPN+KUajKZcH+D8UDd6bHJ3vTnpSdwHQM6hwIN+cP5HbUAOPcKsw50BvpTHkSbKP5Dsp2S
 az1/3+EPSeMx5f0UM7BuKkuCb9oLcWC51urIT4rrnFBIYRvgr4LiJLSYsXZsjmLlaDB66an7R1B
 GDVXPEyYsywz6I9U8Og==
X-Authority-Analysis: v=2.4 cv=Bq+tB4X5 c=1 sm=1 tr=0 ts=6a0af262 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gr7uCZvohP--tV-2FgwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9HnTmUzUP_AnfaQabfhoC57SLlf-htAK
X-Proofpoint-ORIG-GUID: 9HnTmUzUP_AnfaQabfhoC57SLlf-htAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
X-Rspamd-Queue-Id: 01F4A56B484
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108172-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,60hz:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Add a DRM panel driver for the DLC DLC0697 1080x1920@60Hz MIPI DSI
panel based on the Ilitek ILI7807S display controller.

Backlight brightness is controlled by sending DCS commands
directly over DSI using mipi_dsi_dcs.

The panel operates in video burst mode with four data lanes using
RGB888 pixel format.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili7807s.c | 328 ++++++++++++++++++++++++++
 3 files changed, 341 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 307152ad7759..226e4923aa3a 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -228,6 +228,18 @@ config DRM_PANEL_HYDIS_HV101HD1
 
 	  If M is selected the module will be called panel-hydis-hv101hd1
 
+config DRM_PANEL_ILITEK_ILI7807S
+	tristate "Ilitek ILI7807S-based panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Ilitek ILI7807S display controller, such as the DLC DLC0697
+	  1080x1920 MIPI DSI panel.
+
+	  If M is selected the module will be called panel-ilitek-ili7807s.
+
 config DRM_PANEL_ILITEK_IL9322
 	tristate "Ilitek ILI9322 320x240 QVGA panels"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index aeffaa95666d..13bd324e17a8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) += panel-ilitek-ili7807s.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
new file mode 100644
index 000000000000..09288b602a94
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct panel_desc {
+	const struct drm_display_mode *mode;
+	unsigned int lanes;
+	enum mipi_dsi_pixel_format format;
+	unsigned long mode_flags;
+	void (*init)(struct mipi_dsi_multi_context *dsi_ctx);
+};
+
+struct ili7807s {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	const struct panel_desc *desc;
+
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *backlight_en_gpio;
+};
+
+static const struct regulator_bulk_data ili7807s_supplies[] = {
+	{ .supply = "vddi" },
+	{ .supply = "avdd" },
+	{ .supply = "avee" },
+};
+
+static inline struct ili7807s *to_ili7807s(struct drm_panel *panel)
+{
+	return container_of(panel, struct ili7807s, panel);
+}
+
+static void ili7807s_reset(struct ili7807s *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static void dlc0697_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_soft_reset_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x78, 0x07, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5e, 0x09, 0x99);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0x3f, 0xff);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 20);
+}
+
+static int ili7807s_on(struct ili7807s *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ctx->desc->init(&dsi_ctx);
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	return dsi_ctx.accum_err;
+}
+
+static int ili7807s_off(struct ili7807s *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	return dsi_ctx.accum_err;
+}
+
+static int ili7807s_enable(struct drm_panel *panel)
+{
+	struct ili7807s *ctx = to_ili7807s(panel);
+
+	if (ctx->backlight_en_gpio)
+		gpiod_set_value_cansleep(ctx->backlight_en_gpio, 1);
+
+	return 0;
+}
+
+static int ili7807s_disable(struct drm_panel *panel)
+{
+	struct ili7807s *ctx = to_ili7807s(panel);
+
+	if (ctx->backlight_en_gpio)
+		gpiod_set_value_cansleep(ctx->backlight_en_gpio, 0);
+
+	return 0;
+}
+
+static int ili7807s_prepare(struct drm_panel *panel)
+{
+	struct ili7807s *ctx = to_ili7807s(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(ctx->panel.dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	msleep(20);
+
+	ili7807s_reset(ctx);
+
+	ret = ili7807s_on(ctx);
+	if (ret < 0) {
+		dev_err(ctx->panel.dev, "failed to initialise panel: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
+	return ret;
+}
+
+static int ili7807s_unprepare(struct drm_panel *panel)
+{
+	struct ili7807s *ctx = to_ili7807s(panel);
+	int ret;
+
+	ret = ili7807s_off(ctx);
+	if (ret < 0)
+		dev_err(ctx->panel.dev, "failed to disable panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static int ili7807s_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	struct ili7807s *ctx = to_ili7807s(panel);
+
+	return drm_connector_helper_get_modes_fixed(connector, ctx->desc->mode);
+}
+
+static const struct drm_panel_funcs ili7807s_panel_funcs = {
+	.prepare   = ili7807s_prepare,
+	.unprepare = ili7807s_unprepare,
+	.enable    = ili7807s_enable,
+	.disable   = ili7807s_disable,
+	.get_modes = ili7807s_get_modes,
+};
+
+static int ili7807s_bl_update_status(struct backlight_device *bl)
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
+	return ret;
+}
+
+static const struct backlight_ops ili7807s_bl_ops = {
+	.update_status = ili7807s_bl_update_status,
+};
+
+static struct backlight_device *ili7807s_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type           = BACKLIGHT_RAW,
+		.brightness     = 0x3fff,
+		.max_brightness = 0x3fff,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &ili7807s_bl_ops, &props);
+}
+
+static const struct drm_display_mode dlc0697_mode = {
+	.clock = 131911,
+
+	.hdisplay    = 1080,
+	.hsync_start = 1080 + 18,
+	.hsync_end   = 1080 + 18 + 2,
+	.htotal      = 1080 + 18 + 2 + 16,
+
+	.vdisplay    = 1920,
+	.vsync_start = 1920 + 26,
+	.vsync_end   = 1920 + 26 + 4,
+	.vtotal      = 1920 + 26 + 4 + 20,
+
+	.width_mm  = 0,
+	.height_mm = 0,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc dlc0697_desc = {
+	.mode       = &dlc0697_mode,
+	.lanes      = 4,
+	.format     = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
+	.init       = dlc0697_init_sequence,
+};
+
+static int ili7807s_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct panel_desc *desc;
+	struct ili7807s *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct ili7807s, panel,
+				   &ili7807s_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	desc = of_device_get_match_data(dev);
+	ctx->desc = desc;
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(ili7807s_supplies),
+					    ili7807s_supplies, &ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	ctx->backlight_en_gpio = devm_gpiod_get_optional(dev, "backlight-en",
+							 GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->backlight_en_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->backlight_en_gpio),
+				     "failed to get backlight-en gpio\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes      = desc->lanes;
+	dsi->format     = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = ili7807s_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to attach dsi\n");
+
+	return 0;
+}
+
+static void ili7807s_remove(struct mipi_dsi_device *dsi)
+{
+	struct ili7807s *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id ili7807s_of_match[] = {
+	{ .compatible = "dlc,dlc0697", .data = &dlc0697_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ili7807s_of_match);
+
+static struct mipi_dsi_driver ili7807s_dsi_driver = {
+	.probe  = ili7807s_probe,
+	.remove = ili7807s_remove,
+	.driver = {
+		.name           = "panel-ilitek-ili7807s",
+		.of_match_table = ili7807s_of_match,
+	},
+};
+module_mipi_dsi_driver(ili7807s_dsi_driver);
+
+MODULE_AUTHOR("Arpit Saini <arpit.saini@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Panel driver for Ilitek ILI7807S LCD DSI panel");
+MODULE_LICENSE("GPL");

-- 
2.34.1


