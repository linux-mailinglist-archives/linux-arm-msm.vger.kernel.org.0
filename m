Return-Path: <linux-arm-msm+bounces-81696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E28C595A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E880A3ABBF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7542D35A14B;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6x7AKAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE4359FBF;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056664; cv=none; b=orIm/lA66a0i64izuw9U1SQXIRIA0smXAA3AoJBZipU+Ur58S7EIQz385lwl/87Obg4PNWuI2mEpkDfBhd1EZGwNU2izF5e5vdJl4aW2NB1OLd/XMuwW3DlJkwlzjRcONE0cFHJxHgPtw1pFESiFrtJ3wbiKX9xwYcro10pQP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056664; c=relaxed/simple;
	bh=7kVUuFepyL1nqefy7/RVz/fzVOVxrSJ4iaI+ek8pJSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uragp+9zybPv5fQwgNiUxk/0Lbfat0GD8xalGEerBOZI0nGU0ud9XCAC4KBlLvd11fZAGgmdRMuCrcVWRnTDmwrQxmm2WLsDnSZNTahxJGVymOr4/XW3MrPzrjc6yUdF1dyABmdveIgFks5SpXlgGb9DtFDt3zSORg2hKrf7rOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6x7AKAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B76D5C19424;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=7kVUuFepyL1nqefy7/RVz/fzVOVxrSJ4iaI+ek8pJSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q6x7AKAdtOyerUx7QPcOs7cWBRLgc+nkQD/i35oCokn5BbmSiPMaXt3Q4/pPWGYga
	 R+uWUqJm09XhOJ0eeqvESJCDETBzdNClTrY5hrXLy3wGDpn/iSZrh0bgAc5bHyQ8sj
	 YNQbQ32Mt+Ne81pj2S4GBwv0MIIuaMHAtAjEVVkUGI1sgZY7cetIFaJ4pmnArGQMZC
	 eDmQNPMxILrkgUvLycNz29vxzyb6eFgbRUH6g+AN3VoaS4itHRrYxCXXAGDa8FHi7P
	 61IN7uJXqH//8c0Js6PW8xW0Zb36BJJ5yW/8Qzzj1y/6OC/csz7CP/BwhuHE5X62TJ
	 RREvjv0cMKgZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42DECD8CB2;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:44 +0100
Subject: [PATCH v2 10/12] drm/panel: sofef00: Simplify get_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-10-e175053061ec@ixit.cz>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
In-Reply-To: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8diXpj4flXvL6PBJCymDKTVmS7jlHjaf2gFdGCxh2WA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwVKIRpFqk9VNuj0DzQ/MME2NFt0dVorHkqM
 TzTQ+QjZL2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFQAKCRBgAj/E00kg
 ckEDD/9lSX6mTKnL3nHiq4n7s39OdBTvTG0m5j7WJtVgpLXBL1TCRnBNvI1WVbHKleLmB45A2JR
 FeefsU/bfld7LSTz6+QzApBnegBsLiWFPh3LA5RqSWBXsXoaVgBnox89xEiVGE8oOd+I++acFfb
 APTTKlCVARJJ5pfLAKPiA/wNtD1W+ogE+MYbQ+JascO/fcPvagjlRZRzfN61eZWyOL0He5d9A4J
 nL4B0nuGfhGUXutQGwkm4mWS4Ke9vyF2j0kE2ibtKGhWQbrwKzKieBCXvASM9Q1FAPNVFvGgxJO
 RlEaGWo/KgSZBQv4HQkGfAgm0sK7jZ2Z4cRpX/AzAbX7xeMqNnos5PSPwiRSubMQkw6wbOfckq6
 3PfEEHVqx/PyAbUA8fNrcVVwbaKE1mIxRqGjRWVGhB0C7Hb63HR5kK9gFdKfDXsfhNeWX8GRHAP
 t3Nb0zPYxrLa5kFoidvShTVBPUV7m+Eele6MigA6RweflH8+LteT+WYpu7UQ9sFU7j+CUY+hV7e
 Qk8g+RTBRdF6IzJPedvHoRU+KspCLQ4f7e1cC72l774vqd1DEz6M4ynw2nv0xHI4CUHZJ0pPV2y
 7OGoHPvoQjJOE+7ED5dct9tU0qoga6PREhYchDoN5ttHJLiy4Jb3LAObtdjxotxd1Jta0okE0Bt
 UfyfgIp7bCu+fXw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Levearage drm_connector_helper_get_modes_fixed helper function.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 7947adf908772..e69a28628b656 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 struct sofef00_panel {
 	struct drm_panel panel;
@@ -143,34 +144,26 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 
 static const struct drm_display_mode ams628nw01_panel_mode = {
 	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
+
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 112,
 	.hsync_end = 1080 + 112 + 16,
 	.htotal = 1080 + 112 + 16 + 36,
+
 	.vdisplay = 2280,
 	.vsync_start = 2280 + 36,
 	.vsync_end = 2280 + 36 + 8,
 	.vtotal = 2280 + 36 + 8 + 12,
+
 	.width_mm = 68,
 	.height_mm = 145,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
 static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector)
 {
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, &ams628nw01_panel_mode);
-	if (!mode)
-		return -ENOMEM;
-
-	drm_mode_set_name(mode);
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &ams628nw01_panel_mode);
 }
 
 static const struct drm_panel_funcs sofef00_panel_panel_funcs = {

-- 
2.51.0



