Return-Path: <linux-arm-msm+bounces-114488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rhM7MQj2PGosvAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:34:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6E6C4436
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:34:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=LjdJC9yp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114488-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114488-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6F45301E02B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983E338A726;
	Thu, 25 Jun 2026 09:33:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B12FD1AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:33:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380035; cv=none; b=mBS15sLxl7k9VK3DlNiIUho+LKkThWarDsRHKCZQVOYMprZXTHEPoJed2Og54EfZ2098X2ERvuCx2+cInSZVmE8hziRWF8yVOUZ5nqO8btauj2lpdM8/0CdWLELksV370/xhKO8eWz9Vmvj+oWd8Y20IxSrDOFV7W6tnEvv2YiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380035; c=relaxed/simple;
	bh=H7gd4VxIyhUDwLZ1o9Y/Vyrhuq0o94GRsg9YHnnHx9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7eoTy3xhAZVNpS/ed3dYvmbFYflwWlqNHxuir82gCmwk0R14/l+0bSV9f+Bx1f9/ITA1HuWTH35EHcOvOvqKTG6WjmnG+H05Tmyj0JouL+rW2EG9vYh61uU8vhr3Bu/+EKdZIPMyGsL6A00LYUxnPnfK9Ecj9bT2Dymy67eekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LjdJC9yp; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cdae130cso11460685e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782380033; x=1782984833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8ZTxuqiWcrBCq+pkmtlRNTt1ODfbYB+GmPFMSxFCnM=;
        b=LjdJC9yp1VedGyydTzqLJ1UfnDzNYb6su5B0iZKBbJm1+d8rWJQQWNQW27wOv1XP4C
         BR5q2P16GUa5IjQXY0NIZ0rlzxPPzhEZWZEiRVC9FrFM0piU2rXgWNP4yhzYlBAGSM1g
         tzgxTsDe68CsBxDidgm5FXRKfXJKACZGOvYOmlcwAJd4HTUhvH7DWCyhne9BuwqUzGSk
         9F/iIMVZ6BF7SXFSQBmmzbTpPnS3cwkSaGu7D34C7sWCmVCoXs+ldF5dz/Abr6/AnA1n
         8E2N8+2myJnETL1z3L+ZmGHdyS/RDlXs8BCLgFHQdV3GaQZ/g9C1/U9UXx2SiLwUHXX8
         Lozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380033; x=1782984833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8ZTxuqiWcrBCq+pkmtlRNTt1ODfbYB+GmPFMSxFCnM=;
        b=Wn7vToFRz4yKcYzO6f4Z6mC+p9vRBMlDUHxGPsTtAo3xaL7SvlNiTI2U9dDo6HrnFE
         jLcPe2QtsdbEzu8vqLgPY8QMMb1gr3pVmURrvccGFE9+vI0joWiRxoQRE7+tTy/ZeaJ6
         qp3Hpw4OT4v9JEUTrjL7WHTESQZ/rA9UJfjCZ3htLylPBxbzfEfEVzxvufAFE6VtuKQn
         xQ/sRfKST5Ppn4F6YVX/9n7KlnZQFXWt5HNbVPM5FhwcvI24tKa0DECiYxgR7ppz2j2z
         dlxzN3ZIOqQMe+m0LhTYYXZ+digwWgHNAXRvp1Uld8oyx8lNwmtck4umdc9Jwo6ne6I6
         Wk0g==
X-Gm-Message-State: AOJu0Yw52CvM6JLqsvADc1hOhiWcAykqbKF14lgVcQJwBBDFDgy7Yo3x
	Oe6ZYI4bnaTyh/0wB4az/U/X7ihmVb4e5Up6CRr5FcoHBRhCX6ikFHai4vUvzhm5V/c=
X-Gm-Gg: AfdE7cnVJ/rOT2s7tN5W7a1YMUrh6Ezvr/lymJgf2TjczMTkyHKdpRyZnqVLBO7xWHj
	lumAKvcmm4yQNRUeEp6Ee0010V3YyPkITz9v3dilWpNOc2a3PYcqttFdkEutaFweOTn4XD4fVi0
	ktSN9ig4gCxVAypSKI7jBNptNwDxgXNinGPsvNgjMR4ndw/HSNZuXaVPTTCb9jz5SnkuT2YkPRg
	J53Ssqic6ML5HIKEDmk7/JNgncxPOvIzFq/pOWqncO85+HexHxFzVK4IMHbuqTwQPnfOJcAgR2h
	YGw0OgrLdkv7Y25ip0uRWjCd+7IPGiLAxKBbBM/ET9aw1Xuuac4yA3yDZcuBB2nCQkEK7OaXno3
	EKXmyRDhCuBdqNJtb7H9KZXp1MWDE9vlBurh0/Djxk7lj9TeoZPU5lrvo54nrTcK+nEVzldEAK/
	XuwlVJO+B9gFDfR2QHjw3NAHJXKgsvFvpzMw==
X-Received: by 2002:a05:600c:4e94:b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-492668933e5mr20437485e9.35.1782380032604;
        Thu, 25 Jun 2026 02:33:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660a32ddsm40154745e9.1.2026.06.25.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:33:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Jun 2026 11:33:48 +0200
Subject: [PATCH v2 1/2] drm/panel: Enable DSC for Visionox VTDR6130 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-topic-sm8x50-vtdr6130-dsc-v2-1-cd375ef0e0ce@linaro.org>
References: <20260625-topic-sm8x50-vtdr6130-dsc-v2-0-cd375ef0e0ce@linaro.org>
In-Reply-To: <20260625-topic-sm8x50-vtdr6130-dsc-v2-0-cd375ef0e0ce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3072;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MdVgHdfadA5/GTJS3XHHolJKFzKWuE/Xlx7DIXNZZTw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqPPX9WtWjS40eQlA0c7MsvR8Q1VHx24Dh2BNDeUaH
 aP5kNveJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajz1/QAKCRB33NvayMhJ0QMWEA
 C3w4PIWzG3kVzfghLlyl+Nde7cB4FR9J7E3pSyn4QOIBDpgocLlfMsFXY35tCvy0SWWXQZps8BwjVI
 aYIBoQ9wBL5YjSXfHL4s+66ZUWKQ7GMKMQKohWEQXZu4bCVVsrWERQXT3qPsxMkqVxgTGVlEwtLGUw
 IRI5SYo1WENEK+hO/mFKwkctrCi7DuxGIPNpHdO+hopP5BGMMZh1RbNcslVLJK2X7lKGbd4pJ8ExXd
 p3NlR8cPcG9fexi+0t3GaQEtAC7vsN1/fmcoD2T9Cxv7InOxyqO8PtE9snN3y7O97k0a0oftqPtPnW
 /KNzVb6p+5c2o3paYvTHLT2diwEMQBNcpM5UWVDBr7IZUXmlM97ijURtZja1lQr8HDoMWyzm050vXJ
 1sPvMKxVFo+CEy8OHe03q1y2mRRTq3qYbWt3kZpXRgDmlKxZIOQBDaGbOw/WuBvc3u6/DzH3xGnxAD
 2ksplLeZkNPp0iKC5gU7pv92W0NOozj+ET6swbYBzTWMRaiE7ozwQTlL474KACYMs3nz/78n9W33Q6
 Jn0R07yjmtCE0aEAs16we1ngaJ2NQ35R+tWViaQ7n1O/ib9P4oUJI6hVTwnl0iXcZ3t172yrNbM4HC
 74Qn/uPBtUXJLZ53oliBPfKFExU7cKCr4MV7EYWEg13areEIPudR+b7P1i1g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114488-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67A6E6C4436

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
 drivers/gpu/drm/panel/Kconfig                   |  1 +
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index c0cc2bb4a3eb..298c08f29326 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1352,6 +1352,7 @@ config DRM_PANEL_VISIONOX_VTDR6130
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
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


