Return-Path: <linux-arm-msm+bounces-116217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sVLWCX1uR2rIYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:10:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C7F6FFEBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:10:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=z8YsEicG;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116217-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116217-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D944D300F757
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D198636F900;
	Fri,  3 Jul 2026 08:10:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A192FE0F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:10:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066226; cv=none; b=UO3XUjEhHGDtCGemCmVHVBiGmHHu7V6EkjFojnNd/rginLEe8N6cHXuJI7vcwnGOaofDFZ4Jb0CKXXwwyXpECRHqPKozDMv9mDJbrYp2M5ihSib0ITO9RHJVJVct8yIGVys4CHUmv0OxEMuGcyGFoDtdOKCY59L1/w6N8H7RDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066226; c=relaxed/simple;
	bh=u6X1PmFCEi6loJAdL+eqKmVSp7B3NbRSN22WkKSjOnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMm28W1Taj/myigU2nni84325l3RKpB9TLZmm+kplQQTzdJbwrgmoLqmA436daOlWdfZvdPQqNhe/zjq2dfJNXPS4GjYTvzeKdGdDiKDxVwLOBvQ0qbrd4+Fm087+l61fTYtrpUkBkFNV101eLMhoZwuTYZwYNOS7HHI7+Ft1TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8YsEicG; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4728c12ba97so166787f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783066224; x=1783671024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSPmWMOnYMh4YzScP5oQHK6zIv+hGpTPzQ1TRS7oZG0=;
        b=z8YsEicGXlLVMn9MR4ZAaog+p+QAc21a2ggeKAYCZNkrj/HU8R3mTYncmJIlFmpO5A
         Alh6yDH0Mct/dSYRoBGS7WL5+w4U4VwIrgmHzdxazGkjeI1mSVLZ+EzbZDE64t8JPKkk
         SwdSmqLQJ4IgsgwFf79WB9/0mdDNhzTvbMLhsjCH3rtDb1xP5JOndBBo+kxE26XkFy35
         rA7BPesGFJzen2fpR+D6zidddb51ACSlN+vvx4KxSlZXN+PmXfQuQTppOXFANckbHPse
         ApM2RkBQyziwcrYO+EvY5sSRixN0T//RPeDn1fYTExAnbxiBvfbja6ixArCMWN/8rohP
         /XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066224; x=1783671024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nSPmWMOnYMh4YzScP5oQHK6zIv+hGpTPzQ1TRS7oZG0=;
        b=N2vQwSYic+zVwSnsi6t/9OojVsFaAWFh+GJJ6LigF65GtensYYu0PuOjGmCX3RHKZM
         KNh8XPq35SXXcypDHWrmJLcrpQLcJQ3MeBdSEszKixLcQvffE9UoHGXGfDyq+VXxT1QI
         Hu2yJ/c0r/JadnZdNNlwucZ7Nj08BxseixDGiytSvPGu4LrhxHc69aRGOuRwKRVR7Gzr
         asm6ZTAjI4BuNagLnhrOg6BIIAO4+/VTe4RUsOLH+1Wo3AnBuGgGkttf8qJVEuUAzTb4
         ou0bQwn8Lq5yhlfzjqQ8z2GBt07bise6W5M39QnQ3AsSqfl+3cTOBTTjfwx1ntCQjAfJ
         GLyQ==
X-Gm-Message-State: AOJu0YzSD2Tj2cAfcnoXEQ71Z7yDgBmJsvNEmQzQ1RJcL6KEj1wTapzJ
	tJFlkPCGxf+2/zLIhseFhJa3ShoekL4tB45HgKyCTSVP3qP+oTIxsKIk99vv1YRf3Ms=
X-Gm-Gg: AfdE7cledSmoG4Qe9jy2krr3b0X42dOLMX+ltLOX2PYv7XfEIg48Cuufi/h9OwSTavi
	OTB0X69f9ZThPQF0KZIFIMtPk6PAAcoJL9JfvYckuzRd03vWWBIPTyjCFmZjc481vdgsRKdq3KG
	nc3WSKZgOcpmQ0ONXQ+qycswj9IpHhmVJng2OrgzAkkrq8akg5kpn6R1Bm1e6ZdRXwJnk3dm/98
	R/F9qyY9wvzmnsMQkc2gAxLyQsJ5sVHJ8e1rb1oymaWDzQUpKKgtaZUWlQffXxgYxIkb8GJ+P8U
	f3K3joAUqhcJOHBerwViRnvDVaXxuat6RlhqiA6GET8ttVlo9rh3W9F4nvJ5k/OGEzSytjQCuol
	lBt/vDxyQtLSFvsxCfFR7kJP6aULYWoIrfsW5A6l4M9wmdsFyOqyyY5xl2GaeiX+Ht4EjoCau+W
	8K2tOafIKKcFFBOunduwdZ02E6Krs=
X-Received: by 2002:a5d:5f54:0:b0:472:3090:d878 with SMTP id ffacd0b85a97d-477571cb785mr13709799f8f.4.1783066223396;
        Fri, 03 Jul 2026 01:10:23 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm14920012f8f.9.2026.07.03.01.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:10:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 03 Jul 2026 10:10:19 +0200
Subject: [PATCH v4 1/2] drm/panel: Enable DSC for Visionox VTDR6130 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-topic-sm8x50-vtdr6130-dsc-v4-1-9eff51ec717a@linaro.org>
References: <20260703-topic-sm8x50-vtdr6130-dsc-v4-0-9eff51ec717a@linaro.org>
In-Reply-To: <20260703-topic-sm8x50-vtdr6130-dsc-v4-0-9eff51ec717a@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8Zw0MXaPsWTl48e5TuYlrhdzoxfYdkEW8De0VsWE2Qc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqR25sF0x/xevRh6INh4UzdIjc3l6Qze2uwMfUqdJ9
 YqnSV3aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakdubAAKCRB33NvayMhJ0V2CEA
 CMCr4BZUhBdFJKI6Z3AXX7a7XNPIrKviWw/ixFpB4bVY8CWzeUDeQiv4XgcZetZxZebT7JULBXu3/I
 Q+dcUQVpVrGBDZeE7RF6EWMYaLvUF7flgoJAJKAbouWL5ELf3URnzT8OUsRKQ6wABz5KvUErdBi6un
 QU4oltuDAaPINQYH1bHu+CcMeTsxUgF6apXh10uPZVyAgRk/Jvk3PBLbn/Hn6Xz03KPfeOW7E4lS52
 WMKM7jv4dr7LwZqC/N8+MX8v4r4ObztuTnrlWprqfVxSLopkISqMzdjEIHc2FshdJZM0UoysP1/xxM
 Y485WKM1zetJU+qdYPx9HqLY3c0lV8WgnSwVjjKIrJNizdXRG9H1AF0jXDRwA/D6dkPW+1nGrcRj7p
 /kvOd1tIoa7C+ArIu1MSqQa+5H8FpxnCDVpLWbX8/hK6cyv3PWuxYCZiJoTF8TcBA+bZ/A1jd7qOSJ
 SyhjMj1An1JQXEXzKEnNd/v9vqJRjn2Sm+3Q6xI1z2tS69eEWuSZP803yb38ruXsFkE3a8pVwIBe+Z
 VLlDRp+A2vTHJ8fLDJmYCKxY5d+Dgzqp4/CRI2jDrjujaFhY0x2Cw46xK9k4KWr8rNJ/L4wazUl/z0
 tskjH2yIrTKE6NjQvlDNYWwrAICabAz3jVK3Aj8jtyYUg0Lsngh3KMwyym0g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116217-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99C7F6FFEBC

From: Jun Nie <jun.nie@linaro.org>

Enable display compression (DSC v1.2) for 1080x2400 Visionox
VTDR6130 AMOLED DSI panel.

This panel is the default panel for the following devices:
- SM8550-QRD
- SM8550-HDK
- SM8650-QRD
- SM8650-HDK

Enable DSC since now functional in the MSM/DPU/DSI driver.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                   |  2 ++
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index c0cc2bb4a3eb..fd2552203610 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1352,6 +1352,8 @@ config DRM_PANEL_VISIONOX_VTDR6130
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox
 	  VTDR6130 1080x2400 AMOLED DSI panel.
diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 97a79411e1ec..0cdcdbbc766d 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
@@ -17,6 +18,7 @@
 
 struct visionox_vtdr6130 {
 	struct drm_panel panel;
+	struct drm_dsc_config dsc;
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data *supplies;
@@ -47,9 +49,12 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+	struct drm_dsc_picture_parameter_set pps;
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
+
 	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
@@ -123,6 +128,9 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
 	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 	mipi_dsi_msleep(&dsi_ctx, 20);
 
+	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+
 	return dsi_ctx.accum_err;
 }
 
@@ -269,6 +277,16 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 	ctx->dsi = dsi;
 	mipi_dsi_set_drvdata(dsi, ctx);
 
+	ctx->dsc.dsc_version_major = 0x1;
+	ctx->dsc.dsc_version_minor = 0x2;
+	ctx->dsc.slice_height = 40;
+	ctx->dsc.slice_width = 540;
+	ctx->dsc.slice_count = 2;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4;
+	ctx->dsc.block_pred_enable = true;
+
+	dsi->dsc = &ctx->dsc;
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |

-- 
2.34.1


