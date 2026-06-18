Return-Path: <linux-arm-msm+bounces-113726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T7t6C8DHM2rBGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:26:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0EE69F4AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:26:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MOuxz6u0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113726-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113726-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1236301F9FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DC73EEAC1;
	Thu, 18 Jun 2026 10:24:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4BD3ED3A6;
	Thu, 18 Jun 2026 10:24:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778270; cv=none; b=uDNuVieZ0RsAXviqzeIFlkhNw5wad4s/UV+jmMciM/WiKEp++HupdZFDlLFL95ZGdao9M8aBmte9g9AAWJCwE4jlSNDR3GNEU8mdtFX2d4LDPjp/NgSwfqdl2wQG9Lr5CIY/frqIPbdJV+q2znWoRpeKx5M4ukcvqtxo3bW623U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778270; c=relaxed/simple;
	bh=+KNJB/LzkCWj1kKuVErf/NH5xyfHlf948DnN+wzQ7m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZfSf8xSjHKHcJeJ0qp1Ldk0Epm9PgKD2Yz9REKoov7Q+U+sbj7X47Pjs8CGojKurS0C+vGp1B4YAJLhtyT4A6aPYYht9zqRRP1KAq088uW6rdW6wCuvUy3nK5uKHJCd1sUwmdXN64i0j0rkoaBBfwrv1L8H15nBQ18e2yzg1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOuxz6u0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dw7m572706;
	Thu, 18 Jun 2026 10:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHrdX8Am2zjL5WDLlXDWBvRL6yUQkEj5botrhvRkq6c=; b=MOuxz6u0+13BN/eZ
	kke1DCkqo3MxEyKNx6EvuYcV8cIsqW6aYXsR8OxlmqEa9cCb91lNwWZxET2ZhqNH
	Ry7hrM7NIBdfNtiFg8R4HE5CSF4zJBGLeKLbS8ChdsxfSqxownkTvLvt//UYvttO
	FkkeW9URKFDEhrMoqg2PmIHCtaumHhMTAHmmL36CO57f3c/oCYoM2idc4oZHdmns
	KDPfgooLt2aQqcsDqH3doUEA+cR3eB3iAe8IPnRBm2odxZO/OyWriallt/YgdkBL
	B14u7AzCyj9BMM2lDoS/KS5hGIcBCaXTYUgGUsDqk/jYZ+zQB+X+saFRcx8R/iBW
	d13Vag==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt53t8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 10:24:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65IAO78l008715;
	Thu, 18 Jun 2026 10:24:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09kqmr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 10:24:07 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65IAO79E008700;
	Thu, 18 Jun 2026 10:24:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65IAO7a4008694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 10:24:07 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 4977A633;
	Thu, 18 Jun 2026 15:54:06 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:54:03 +0530
Subject: [PATCH v2 2/2] drm/panel: add Ilitek ILI7807S panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ili7807s-v2-2-b3f0c109b102@oss.qualcomm.com>
References: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
In-Reply-To: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: arpit.saini@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ayushi.makhija@oss.qualcomm.com,
        rajeevny@qti.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781778246; l=10436;
 i=arpit.saini@oss.qualcomm.com; h=from:subject:message-id;
 bh=+KNJB/LzkCWj1kKuVErf/NH5xyfHlf948DnN+wzQ7m0=;
 b=p+FSHTQJfxnx/GHpJFJ8MyeoJ3k+XUTKR7ckQhxNQwXinaTvxUPblZy+yXyzgfUnEf3hDbSOK
 lU6WvxLPc/xA5vI2v/9OfLK9eJr3S0Z6pUVUYgMqdVqVCGw5ZW6MT7V
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=OGOh7FGwrnkILHNlcTTABbBMQxxo319duzbTg0YPDAc=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: NkQT0yP0KaLGchBI7XJG8KTNx3CWxyWz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX9f/WK69+eSQn
 yUAYq4PV4LCM2Y6GcwnyVVEV8d1El4I86zJhsGh8zdPri3yZwGcf5eacSEeunfeJqHR9UATga0z
 sFWTaWiwrVF+7iMEXJPoCwBKW2JZQ4A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX8qDjaVfjzTLX
 Fiw7qkGqFCUOzheAE5IndCOPtki9Gpfk0zSsScsczhrw/24vSh/qe5pQyfk8VpWD55Ilo7MKJOS
 OWQFgE4AWM5nlQw4ZgHkKxMHvJ0DfGjbK8wCw/zljmXcoLMjBnDXfmuwU3uQKdLh93qaDalNiB2
 kJqoJ5VrQqUUfT70DlIMKDO4oDy5D9wT0q9FmcvGvnMAr+zDzxckC/lPGYhSco5fl4aUWzYHB8N
 2JDOy/Z5fbxgk/8I5NDLUNo68oi9OHFT8ZiS7xucVe9l31RYqCJxDFhtbDMuUIhPDjWvtmz7As+
 KZWrJpK4m29xuE5FJx5bfWUC8Gcs3sP+lqxSKFCTvPsw3C5mnH8hFAJEVKHwj0ZVXC5OmUNC5j/
 WmWdtdS4xTrn7FvR/1ebJ9EEPuqh012vio/WWVUq04HyQGHVgIn0j59ymbncaWGqmTFKxQFieu4
 N7NGwzHc2fbj8x+CHrg==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33c74b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gr7uCZvohP--tV-2FgwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: NkQT0yP0KaLGchBI7XJG8KTNx3CWxyWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113726-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C0EE69F4AA

Add a DRM panel driver for the DLC DLC0697 1080x1920@60Hz MIPI DSI
panel based on the Ilitek ILI7807S display controller.

The panel operates in video burst mode with four data lanes using
RGB888 pixel format.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  12 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili7807s.c | 297 ++++++++++++++++++++++++++
 3 files changed, 310 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7450b27622a2..1cbaac1bf545 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -264,6 +264,18 @@ config DRM_PANEL_HYDIS_HV101HD1
 
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
index c2c5cf817116..c3002b351cb8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) += panel-himax-hx83121a.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) += panel-ilitek-ili7807s.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
new file mode 100644
index 000000000000..bfbb8e29a4aa
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
@@ -0,0 +1,297 @@
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
+	.prepare = ili7807s_prepare,
+	.unprepare = ili7807s_unprepare,
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
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes      = desc->lanes;
+	dsi->format     = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	if (!ctx->panel.backlight) {
+		ctx->panel.backlight = ili7807s_create_backlight(dsi);
+		if (IS_ERR(ctx->panel.backlight))
+			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+					     "failed to create backlight\n");
+	}
+
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to add panel\n");
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to attach dsi\n");
+
+	return 0;
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


