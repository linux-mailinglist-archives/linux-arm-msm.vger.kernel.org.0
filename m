Return-Path: <linux-arm-msm+bounces-82516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C8FC6F533
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA1904F10E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B168366DB3;
	Wed, 19 Nov 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk8r7nfn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC91D365A09;
	Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562103; cv=none; b=LzMU9gH5cbfIuWn88mGX83prz/y1rS0agbguYovc7DWA3yZ0918Dn+vNm91mtutSMRDMS7rAGUAcwJn2/PxfqtFgdsbeooxou25xLymHQIQ75WzEvoc5KJagoYZhapd2kTDWUmsfOT4dD3NGcnuHwEA+VLlHlmFsS2kpMeNMWwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562103; c=relaxed/simple;
	bh=h8mvhLF2NQpOEhwrwGAXO5y7raG5Pj5KKGwO1xu0Ls4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/Rezl+jd70sR/tsXpcep5ir3TMcyDnGbUDNoxDGF+4O4k6i7jlTxmsBw8y3zh04TOsPACUaDmbVyvLosEvw1/GdsQjYNOZIt3X35j5g7hOx1HU+hb8ZW+WEJB7zgany8N7Ayiq4Y7x149QjsmBo36oeLKNvzZgl9s2INQjbi0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk8r7nfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A3F3C4AF12;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562102;
	bh=h8mvhLF2NQpOEhwrwGAXO5y7raG5Pj5KKGwO1xu0Ls4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Rk8r7nfnExBOLXlHcSwwW1GzD01CFs01Izo9ju/Fs4ZNjpFX0IR60CJVQloLHPSKc
	 q5B5cwoeZwVloaZbQfM0p5bPXjJJ0dDtlN/WEDWQQCd8EbckzPmfVj49LCULpcm6GQ
	 ZKgfLfmXS/nCYYStW6pm/1ExBe7f1ba2RyS3I07hFkkz8Hq5dg+U858UPe6GL+rtaY
	 sU+lS+S5WX9W0mgyF/G7GTI8rG/f3k0xCvG4gGyJg2gUDCTvRPvUfdBI3zkLj4TovE
	 H5F0zAOa3ydUTKKrCIG8/oKMSGM+SgthmePgvHlj5b88o2xaAxBJAirSXTjdcSCdHG
	 ihu+D+Onj1Jvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15A7CF34B7;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:30 +0100
Subject: [PATCH v3 05/12] drm/panel: sofef00: Split sending commands to the
 enable/disable functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-5-6cd55471e84e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xfG4W9ai59WdRLt2V9HKjqKsc6sEspLbINOP0a9yxjE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJySBNowOWWHwzh/85WA2arsosXKiFd8KulS
 VtAKVAfMgCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 cqp7D/9Rk0id/wx8xVwQZpjz1cpc0Esto+GMDs9DNsKLPzrV9jrQ9EygsxglDlkICE9PcVtwxin
 4DveLXfymwQPd9sQ7kykNkZEfly2vPUy5/WprZ8YWbFsIEKdmXIkCOZTDV0R2qTNFk2KUMJ2h14
 fbZkgpr3LNdHZkviqf4UC22D+Sgbqurbv0ogY9nwnxrMVW30LFpYF3XKA7GpMZr/pIQpNrnAa3H
 I9OP6mkzevkxvMT1cIMtMObrUxl+SwGp2lo7nQPIyl2mPVNrFTpb35uiKC8y5X3QtZ2VRjxMGDe
 xCgHIlY9cLTloOIbdVoV7jogP11hk49FM93c51O9i9HGCzOPBtK7Gd9vL5gEgxeN9DZgPyGVoLH
 MCABSvftIMB/6bhkbNOp1EGmx76f5k1HH6qMebfEASEZKua5+ke2Lac/ysGTe+eNFunn9Oh7hSK
 cgWs/hHeDbw82akmcM/5c1yzzfoH+Qy6lulkXCR9R87Gh2P+9Uy+ep+ASwzj3ftH5XFG1JMgePu
 /t1tJ9gFrVE0hcA3O3ukwL6WkAgoGceo+8tMyegAmra+xsGdczs6GEpKWH79Uu2oLzW/pesWy43
 sfS+wCR5wocOjMXOicX4IhLflaVLvisE+EX1s+IS+QMWGGvFCozyV24NAxwL+hLZnEU9yuHotRF
 tVa16LfkZLb4Z3A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

It's not possible to send DSI panel commands in the .unprepare. Move it
to .disable and do similar for prepare, where we move the display on to
the .enable.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 3097040e6bfa0..a3651f0060bde 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -68,6 +68,14 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
+	return dsi_ctx.accum_err;
+}
+
+static int sofef00_enable(struct drm_panel *panel)
+{
+	struct sofef00_panel *ctx = to_sofef00_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
 	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	return dsi_ctx.accum_err;
@@ -110,11 +118,19 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int sofef00_panel_unprepare(struct drm_panel *panel)
+static int sofef00_disable(struct drm_panel *panel)
 {
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
 
 	sofef00_panel_off(ctx);
+
+	return 0;
+}
+
+static int sofef00_panel_unprepare(struct drm_panel *panel)
+{
+	struct sofef00_panel *ctx = to_sofef00_panel(panel);
+
 	regulator_bulk_disable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
 
 	return 0;
@@ -154,6 +170,8 @@ static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector
 
 static const struct drm_panel_funcs sofef00_panel_panel_funcs = {
 	.prepare = sofef00_panel_prepare,
+	.enable = sofef00_enable,
+	.disable = sofef00_disable,
 	.unprepare = sofef00_panel_unprepare,
 	.get_modes = sofef00_panel_get_modes,
 };

-- 
2.51.0



