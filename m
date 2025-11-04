Return-Path: <linux-arm-msm+bounces-80369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DCFC332CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63ED618C340A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37377346A06;
	Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tk1GSwmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924993128D6;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=l/DNSWvkRm08YUYO4nG8vELLicItvEJAVYsfJVmWepZL6zDoL7rVSeFKjOHy6IqR9kWlp1NNDiBpX3xpkYEVNtbOAUHnA9UdJ8f7JaOW+bPbdwn8LGetfxdUF5LnN9g2nAU80gGpUGdqQSjdzmdL0pAPwKwdleQ/2XnuJjx4dP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=10XNWDQ1dULf+P9kZ2dHmDwf8V4xwRtNb2eTtETPwsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uwh3Yqv5o4Nod7cp5MphvnyJoWyx7fQelaGbEloeRBkY5b1PGHUwliSjuPQDC96mQp5HDyPSlzAYIFJ3T3eX45Y4siF1cvu391VgAcxHszM58wIw33yVqvZIo5G5EkGWdngewWcHdt+bXii98Pje4vVDE2b7YtlaiJpf6iqCjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tk1GSwmu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36DCAC2BC87;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294575;
	bh=10XNWDQ1dULf+P9kZ2dHmDwf8V4xwRtNb2eTtETPwsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tk1GSwmu08uHO6W8kQkko4cOuYzNXpXlmEkiryf5TEksgQ/teM6geCbnwmjLvR0mc
	 D5Qkdllt2GY44AVGc8DXZ8PMVtlAp0iLevi0Ueipg3Vj+IC2Cy7qDQR9yUihANhkvO
	 7DSPsauholZV+eb8oC/bTdO8foa2LeTiVlpjxiasOs/TkQJzUpYNkLw6SPuG0uy2KF
	 C3VSLqjGWbPmp/Q8R3nRGCp0TzsZdmwTUhkyToh1D/e/WXPcL7FK4jZ976HWUTpNri
	 txtkAe5dZ3p53F+mnrdJwkFi4s+ytaej4tFV8AcesgGy8c3FkDc5WnOkijzsdxegaL
	 p4C/rx1UNwfdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEA7CCFA15;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:19 +0100
Subject: [PATCH 11/12] drm/panel: sofef00: Mark the LPM mode always-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-11-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
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
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dv4mgLKU6V9KA5Q8a78znnVTuWL2bX0IVKAwUPXHk8E=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnss5hUpSPsdjW0ukYNFOlQ+Ocni+pVvHaxBz
 bFmfbI4Y1aJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 ckWtD/4ygHvR0CvpB1cA8D2r355X7hHWLtpzCaCEo2h29/XoojxCI/rXsvGT8mZPfFIiaI8on1O
 OFVxVBeO3obIlKmJBZT50fPKsWH1HGIyt4R2ruN/nzuzjMu9NZmIXJJfJVd2tPDxq9kvZIxt9+M
 ZIH5vfyjU1v0qbEZjHPNj5/8kQg7P/ShsF+XOULB0sGfvLbwLxyIpyRthhqfAR5PTjoPtD26mon
 5Pilf4fDZzzXy03+KxbxzdZEzIZgk3RgPGx2slG8ZOY9beymJlZggMysUjrXNpwluTIzUBlpZZu
 pW5KrK1M0iv3XqjCqFRriNP5D6czdOK4jehb0ZPZPESHDdnKMXyMLzfIgSuzl+dlgXH8fUXeUld
 wVlKofGQV4ef8mrBD4aIiIN9HrWyR5UpwLGYC7t8oJIVmnXi8yG58pT63Oc8V/mrOXJ6jPeshb/
 hPxU2qpUHSnL5fq/ac8YPX8kam79jJrq2swoPdrhVwKZppvq6lAA0Po/FKc3luaOeicGJkWBN13
 I3ANyxg3/1aORK0tgRyfEGvz5pi2wRCMstU0+kbMD4QL6pEGW7uAjmGzk605NGB1UW+sHeW2oNC
 i1g799xbgN3F3+CySS2WwQ+bT7bDzXB01LWu3bzG3TZOaOztYELiQWvNFqMaEsMxMaq5qvQdABF
 Pz2qlswvD7yvEEQ==
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
index e69a28628b656..8286cad385738 100644
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



