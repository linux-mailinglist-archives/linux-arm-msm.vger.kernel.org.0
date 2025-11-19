Return-Path: <linux-arm-msm+bounces-82510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE0C6F3C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BEE1423D10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE92C3559EF;
	Wed, 19 Nov 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKJbEeMo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134F2749F2;
	Wed, 19 Nov 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562102; cv=none; b=jfuz77mDkhQUpOZizKOI8QIm/0DiW6rftY0RorO+u1FfolnDIYBV8NCV1w05AmEy/wQjBuPEy7Rf1waM6VD4fWKdLAOGuh/H6hhWyMiUyjzPHNZLnFQjw1qeOdXjmW+rTn6iTBpuiOLYjNV4BK4cYBmHIQWiKeAEoTs8/voKzYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562102; c=relaxed/simple;
	bh=GVLBLculdCKnhAiFJ2ef4yLpdlinMTlal7/JRCLg0f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCc2G1FMYJCA33qm23SL5EQeFKWxVEQsQS4G4oi0gRU58eOXy204eg7pLv+RWBpB8NRjmp6di8noxfbXnOQU2qum3hvGb5zxqEwXMXeSBJ6/1a4Fpkn5xiRZ4MPzinaOVxhJdH78mK7br2oKniwu06W+LPwYFHUhr4WSsS34KpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKJbEeMo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AF85C4CEF5;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562101;
	bh=GVLBLculdCKnhAiFJ2ef4yLpdlinMTlal7/JRCLg0f0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kKJbEeMok/XcZxgmDFRbs2KqBhT12CurirfxbcECcHTn/P0cWY28W/KBDguEnX2fz
	 uFbm+aso9nyKB6a1vqa7MG8rRAeBDYAqsglJlUoHg5tfVvcN3F/CJmIVbaHoxun0St
	 /Lep877OREMm8Ow+8k9jku+/HBDW4yfNIRjXY0DhySIKQzodzRbDTCYCVgP9o5FoJK
	 ZjreqV47VukHubQMRuD+c6anv9H4exLbFVTWI6RERwDjeJ2eYm4+/ZLwZLdvHx0JPs
	 G3N2YMhsfdH6I3JP4sR2bByFv+/AbCGlb2xC63pA1Rvn0tXiTmFoWFRDvhALvfv3H/
	 Aly6CW5sn1NyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BF6CF34B5;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:28 +0100
Subject: [PATCH v3 03/12] drm/panel: sofef00: Clean up panel description
 after s6e3fc2x01 removal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-3-6cd55471e84e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bCUObjPE6sND+pIgM/wutRNG+EBQRl07BHTzasDZhH4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyyre2YbJbCWgb/t9aDqoEt/8YTa5GBezgU
 ro/WdhEc/WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 cmUoD/9wPQvQ4yOEbaf4EQ6WJDuk2dQEMVA0cR9bovkgOZseBZDUlFFIUNjxEU+WNi+fVKjJ4ME
 de1tnYUW3io2mifxkIn4U7OTL2R5H+yXGazhF8LyaJSVEc4Wm3N0bU1gieo5i36J7W/r2aeJYLU
 qt49I+/ykCLZzIidWT1HUvH5UxJYAdrl3O7I6SjcoWSj0zBKeabXD4TNamhe5YAxpfVMndS4Trg
 a5L9guVqcpQN8ltSAZuyh70D+/f52m4dreg7MRsdP6146buSrlIeI0BX5DE83IS4/+LBoAljkKE
 Q5XAaUJWMj2ERh4CiM9Wn0tKxEe6FlECaE87wX17JynDlNQ7P/oQqdjFc8cW0mN63O+GnKXUV+b
 1qDw3Pckn6v16Anb/rDSPSto7q9AkcmEThcdayq6NtNxv4I5SRqr5FnGz3adkqFo2bJ1J4jxW9f
 0JlYcAlE2b6l29l/ufy0b+SlKZLmSrgv+b++rZb/z1hs3YxaBhXFRq24Vnxm3B7tMaHVGD+32Up
 VqojuhTr1S1Nm+aloXbX8FB6hH6UblmbAQUU1z5tlvbVekUnXDPIhQ/aRX/5UfzlXBRFwrAca2I
 PbS9Qhg3MSLIyywHFABzqrHQpCCAK3F3ipE2KEUc/WFumIU6q3OHc+ogMzc42zaL6578vj6gqxH
 /mZX7RxbKUAJv8Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Remove leftover from s6e3fc2x01 support drop and clarify supported panel.

The Samsung SOFEF00 DDIC is used in multiple phones, so describe it
properly and generalize.

Fixes: e1eb7293ab41 ("drm/panel: samsung-sofef00: Drop s6e3fc2x01 support")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig                 | 7 ++++---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ad54537d914a4..4a0b4da0fea46 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -881,16 +881,17 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 	  DSI protocol with 4 lanes.
 
 config DRM_PANEL_SAMSUNG_SOFEF00
-	tristate "Samsung sofef00/s6e3fc2x01 OnePlus 6/6T DSI cmd mode panels"
+	tristate "Samsung SOFEF00 DSI panel controller"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the Samsung AMOLED
-	  command mode panels found in the OnePlus 6/6T smartphones.
+	  panel SOFEF00 DDIC and connected panel.
+	  Currently supported panels:
 
-	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
+	    Samsung AMS628NW01 (found in OnePlus 6, 1080x2280@60Hz)
 
 config DRM_PANEL_SEIKO_43WVF1G
 	tristate "Seiko 43WVF1G panel"
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 064258217d50a..c88574ea66e1c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -252,7 +252,7 @@ static struct mipi_dsi_driver sofef00_panel_driver = {
 	.probe = sofef00_panel_probe,
 	.remove = sofef00_panel_remove,
 	.driver = {
-		.name = "panel-oneplus6",
+		.name = "panel-samsung-sofef00",
 		.of_match_table = sofef00_panel_of_match,
 	},
 };
@@ -260,5 +260,5 @@ static struct mipi_dsi_driver sofef00_panel_driver = {
 module_mipi_dsi_driver(sofef00_panel_driver);
 
 MODULE_AUTHOR("Casey Connolly <casey.connolly@linaro.org>");
-MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in OnePlus 6/6T phones");
+MODULE_DESCRIPTION("DRM driver for Samsung SOFEF00 DDIC");
 MODULE_LICENSE("GPL v2");

-- 
2.51.0



