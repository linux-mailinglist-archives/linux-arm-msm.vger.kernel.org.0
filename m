Return-Path: <linux-arm-msm+bounces-82517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A553C6F4B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 40AA9381401
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD2D368280;
	Wed, 19 Nov 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHsiJ8Ar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAAB368268;
	Wed, 19 Nov 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562104; cv=none; b=W7uZdYi6yer1pJcv0KTvpN5QGip6Rpj1V+yh+x1FnNXvFxry9hl4ypvPtz+rdMSk30Uv9lPrEqPwbEu7L9jA0HeA+CDv1YTwQ7AlqKZQPyU7mTF9f6f/ED3fO3Y3kEJOPvzzfao6hMKjRzkg5IM06jJK671ljvcQ3BF6vMV9mJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562104; c=relaxed/simple;
	bh=8P+oEugwPDNniFX9jpbpGjr3Q7WMxpS+rZBZ/vMYm2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFXUnqdPj7uEjDMnuolWO5E4MdUkfQkI5M2KeTa/Jk0qbJHEMsnaK5AEcMyGic+gVKBmCFMVcHuIkkD8NmxEtvmb/3hwoFUnusG/Feleq4IP7jcpGT0/mWGdR3elom+ouvQ1f3ap+nZg1qU+4C/vH1TXVeEY87g5/OxROtMT7J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHsiJ8Ar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A7EEC4AF0E;
	Wed, 19 Nov 2025 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562102;
	bh=8P+oEugwPDNniFX9jpbpGjr3Q7WMxpS+rZBZ/vMYm2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fHsiJ8ArhC+APU7eHM2VfMs237bdT28BgNO+bW1UCAkhUKRDPGq9oVOUMjsSVn6FF
	 0cnnB4NcJeJ/jRTTxXEic2OV5f1EwvTM9rtNEFJzlrorx+08KgTBLv0m+DchLqgIAb
	 baonZrliofbwwt7FVK8QCVFB/xeCwLWtfaP/ZWwxTbhuu7waT1LL0VLM4WqJVuifz/
	 A8f0F6bzh+WH1/2Ipv1xc+4zfT8A7BikHbEJ2f4BaVrTgIyMU+FScdWS5Q7dYe5qLD
	 BBaiyK+x7RguVURjd4zyNoaXbTSlahc0TrSlWq+6j13ulUVANfVmMZpWvdrjvcY0NC
	 sIIciNICAStcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25061CF34C2;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:36 +0100
Subject: [PATCH v3 11/12] drm/panel: sofef00: Mark the LPM mode always-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-11-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=oJUn+PKpj5llEIJZZEJFyisMkk6yg/4H6PZ4hxEEiTc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyb9N0LOagPPMjYmh9CRKV+Ca80ELfGUFkO
 f8Zr+VLariJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 ckmID/4mnB+PJW1yJTLvCBaXnUg0TbiINpx+ISXuKICjRxNDgEpaScZBrH7TfCH65YAu7Mf9si+
 ol7GzI35mHuJvpJbwSldjdUiAPpdHlb579BNxgqldXuCH/JGAaYx/BCIZ5xUV8n4nd9g26njhjE
 QMxOl1XrX//8m6SmXRbfX9+2gLCXkQxjeG9LHvpqKoqUqYnsM8lqyt2/z7J3hpT5SPWH2xif+N2
 bE0vVzmgxS7+SJtD9fLoMzZVmnAlPfouT0R966vPxyY1VcPxilmxomEmgM1e0zW+PrvC+8ELRCn
 ZA7DT3IlIwJiPF5bPIPfnBwiL95FzkEsSaRXWLhINSftY6jHABgqCDarBxzfo438HXlTHksikUR
 plzdTUdipWBMQilZNIgfL94s7fTMkz7x3qi9O5Yk4qqLcFV4GJm0zuU6OKVRpWP/Do4K/0ZJ+75
 aiYgsoEf78KWQESdlp0Bc51misvLmDBixNX+VjAqFyHdOWNN2D6k0OON10h2ClWDv6VZbtpwaX5
 UFlG7PNMC3EJlmivrtwHga7C3WLs8IPO6m915IfSNd+XbKTu0T3zdFa+obAGi8KyIY8q9Sux1Ce
 uxtV+TWUoWYOqGHnebdTdYk1CdE/AnAZfbJrN52dAykqvEr+Zb8QZBYQ3P+tzaJpk5q7p0Y5H5X
 bhVnj4q3HQ+GQYw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The panel operated in low-power mode, with exception of changing the
brightness levels.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 0e857abda5964..db9c181695f1d 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -92,8 +92,6 @@ static int sofef00_panel_off(struct sofef00_panel *ctx)
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 	mipi_dsi_msleep(&dsi_ctx, 40);
 
@@ -180,10 +178,14 @@ static int sofef00_panel_bl_update_status(struct backlight_device *bl)
 	int err;
 	u16 brightness = (u16)backlight_get_brightness(bl);
 
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
 	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 	if (err < 0)
 		return err;
 
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
 	return 0;
 }
 
@@ -234,6 +236,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_LPM;
 
 	ctx->panel.prepare_prev_first = true;
 

-- 
2.51.0



