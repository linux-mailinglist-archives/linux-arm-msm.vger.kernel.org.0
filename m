Return-Path: <linux-arm-msm+bounces-115885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7MW/NcU3Rmr0LwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:04:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E766F59EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:04:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="SXOXg/1K";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115885-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115885-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 964FA3220B4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA1547DD45;
	Thu,  2 Jul 2026 09:36:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38A33CAE93
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:36:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984976; cv=none; b=QB91jZYNChCCoV5VgOzRNvSflLAE0qLWsJKp5ZNCDSDfiu5Mi21sh9lqGXqTfQvmtEFaOcERrulgjCqPrDVGFb14UzKIbcUxwgfQ9GZNAmJ8NbQ/30KUEPMLVojSR1cmWRwW3RSy7IE7y1pkPpqYzo6asuQzZ6xmhEsZgu1Ov5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984976; c=relaxed/simple;
	bh=T6dEV2/ULBIzJF56OL7Cm2o3OHQftr5QiIb1xoSR91g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ki3AHSC37aADhoJVnRfHwmyJnN+pmk3Jfaxv6djvcjkXGjM3PVWzAEJEkHt98IBpNHByF6yhErhT3m+kuAbvi8XWH24r6IIfVo2yHHtS+YYhxG75VhT/F6JNh2p5xNaAlXZOputjLtY5o8IFAGrd9LLV5XLyjA2QCvnRj6+2oMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXOXg/1K; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so12683765e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984973; x=1783589773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsoHiUWXQIKYIrEcMYDdQBqLZOx1ZPZka28vBGKJZ3E=;
        b=SXOXg/1KNowtoA/ZXSq5eLIgY0MhgKYk1SPc3mMRW7mn5SCGMjSCdBiDVjhR3GshBR
         t1k+Tr4B9iw4HEgyAEAaNvP0aOtFz4kgsFEigVeV66rRYaxyBJZTGYzxVnN2DAXMeOhL
         3lzQvPbT557j258+OgVeAy27/f+tnYXcG7j0gV3TJ2+yhgTOU8PJXciTHwDCAvKHyh+t
         C9bhjTMa6fNysGwIf3yChkA2OFyuzMRqTMpYxTAQL/ZJ/gJYd+LuOdK4DYpReNlRzJ4g
         9L11ZhgKW64JR76kBLPe9Ua18XXOGoJLi23iGlXsZyhUM++7l93mSZXgz1ZwAAuZ5A+f
         W2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984973; x=1783589773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GsoHiUWXQIKYIrEcMYDdQBqLZOx1ZPZka28vBGKJZ3E=;
        b=aJmZ0lYTU/vj6ipfObLyMICN483UwO+As0Gt2x8Us2Cmk7DElZFlhxlutp3ki4O4w0
         0vLjGnszporvpeN6ejp4bnnlYapOL+23tmMfEz4Cw55m1hcaybwoMXcdGa9Bh6F4ztCO
         /2mDI86uyJ0FkR844EvxKK9ooESiJe8JnLovz7vWMIefnCiXh+f5Ga2MjlNMpF4IArrh
         kh3VnqlrFqXlemYqrLSqxF16SieiPDqtykqditrW97fv7Ti9jx13m91lFROO6AIB3Bu4
         tGapL7FxDl/+icSHoz9eMfJ0iqroER+OMG9vdUaAeiU1y4cqeifDosCRGiE3avsj2vTf
         EjIQ==
X-Gm-Message-State: AOJu0Yzsv0rsTw/KV1DiIe4DSxjXkzRXmdfCy32XqvpgnYZpzokNQ2PS
	GUnfWcateG2L0rJsiSXvhbxplUAEMH5Fl7DG260I21jNx07q5H6M7GWRAUXGPn0qi2s=
X-Gm-Gg: AfdE7cmx25Qj8/xaTnPlqvDPEy2YJ715SfQdqD+F1Jl3Z/AzCydBTmeDUz8W4qaw7Ky
	PDqaJ2HH2SxubIfgqvwv53RBkLLnuxqcEI4NCLzwIpu8Qt4iYUzpw1eRATcIhAshKGbOto73PTy
	XPl0wkSK154No+cdJYSG/0T2RAkMTFKe68jCi6dUGLdlhawS4aEQV/jlJkKJ3GS6VyrVmRFfn1q
	2llGfAjl62kzOhEFnT4GxSwLQds63n2XvM0JnCsrgcC9rSpPTpWsYsdH8L5d9b/47NhelT1YO2G
	UX0XOPQqSHn3eeVUEnrCAuQVYsadyrzUDP8Pc4GFdt3au+nfsj6AMxVP0Dq0aOtG5Z3u5XyOa6X
	rK4DLetmgbm+RYYSeY1+vAbhyoGiNbUwDcEUU7oLcSOA465SpAlyGCkadWV1CZDQe9ldCeera7P
	SVUEatFNk7oLVhVrMp8Wr/+03m1fQtIe7q6yL2v9FiH3/K
X-Received: by 2002:a05:600c:c4b7:b0:493:c785:e0d7 with SMTP id 5b1f17b1804b1-493c785e283mr12795545e9.28.1782984972934;
        Thu, 02 Jul 2026 02:36:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bf11eba5sm80524765e9.0.2026.07.02.02.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:36:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:36:09 +0200
Subject: [PATCH v3 1/2] drm/panel: Enable DSC for Visionox VTDR6130 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-vtdr6130-dsc-v3-1-db881a3fc026@linaro.org>
References: <20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Iiygr+7SLODMDZUD6oHxQRrjVtBJ+/vkm9ffdoYKzEQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjEKFnVeUtrCAn0hGIsP6nv7cSZCMDlDMPHtJcWf
 CROgYj+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYxCgAKCRB33NvayMhJ0QhlEA
 CZVVNg5jWoJv93w1yODqdIao8o7i6EMWpQqyPQNIqzWZS8vCZZtLwVg5x6RQyvIx2WY9UdK5SYPlOk
 n5aSdY3IyFyFSjS41JWeVvws9BIayZEmPtZ2eFh6qdjqP44b5T8fVPgRDfrffZUtclqZmduRMX10Ny
 wmcZMmsGhaVq7rITl+JNrxxekQpJ6YgVa4t8c5WVdrQkpNalz9aWMFfz/COZlFHer/eJVPW9sSE4B/
 FLdZ+zmKJDftRfaXy7XeZ9uSWhT26RlZRqOsuIKX5yWdGPcKcO4u8Un6VmA17gu6gofpHk+peX6UH1
 CxFDcO/RdL9HJ8vDYbnVnonYDrabBt7FkN4bvLU40TpeXhsRnqL54L3tW+E6RhFIm2Qqh5PyuHSVqz
 8LJrndoIu8F1KBaP8xhiBFbJD02tDqcUzgk865wXR0NAoHQHRSEmnyA2KTxbY+484N7ThGMU5A3/P9
 zLCKQRBK4PPCdtgg3g4sN2TtuiGGjSJhbfGo7nG6dzWdiRSis+oxaqtgJQQ2HUh7E+7cdEUij0wOcT
 3opTBa5rgZunlQnfZcsXyiRZ/6FRXO1QiQTXyotnE6tn3j5Pk+cLpDjeTNZMkLpeAWZpDruK0mU26U
 fa1K+zzzN7xEiPkCJG+NarPhEvETtsRVPA7C0NCyHoAKAhX0VpCnXA3eX7sQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115885-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38E766F59EE

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
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                   |  2 ++
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index c0cc2bb4a3eb..d4e6535f3595 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1352,6 +1352,8 @@ config DRM_PANEL_VISIONOX_VTDR6130
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	selecy DRM_DISPLAY_HELPER
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


