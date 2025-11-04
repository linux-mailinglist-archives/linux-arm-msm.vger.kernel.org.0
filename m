Return-Path: <linux-arm-msm+bounces-80367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3602C3329B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 970ED4E969D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E299345CD4;
	Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtOeuKsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8530CDB5;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=TAbU78QLq8uelfcKYn3Azbw7B38kJcXPsr4eh3jlmtI3UQ70QgIm5QJccdNQLv41JzYzbuiPnlk6SQoBPjXNKy+jxIOR+KzLXWj7VRCLkXer3GCR3bOKx/yHBlF5rr/GUBwfMOpHakg/d77jKfqoCeag7WTeELfJDLcGuDdQUEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=7kVUuFepyL1nqefy7/RVz/fzVOVxrSJ4iaI+ek8pJSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laFOwPVSWBNZzzsGygfWTMpLdSFfGpsT6WzRquvbk9E07uKcRtq71jnlSboTltGo7NuC8OMH1bf39+lbpG+S1CA4ZeYc9z/wue3RXGsvQqhkA9dHijbq+RhAD6SUXgPC9umCyscpoqD6cmBcfeLnnh9T99bKlVt/C6UXBKuyUOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtOeuKsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 254B6C4CEF7;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294575;
	bh=7kVUuFepyL1nqefy7/RVz/fzVOVxrSJ4iaI+ek8pJSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FtOeuKsjrUfQ808ka0As0INPyczTyCWSDAgoX+Gyb/lbJfu0nfdcD5AHHtWtFIVIl
	 K0c4S2KUQH8Q11G5vS0Q/REUwJQAiU1iqZARYyeNifWy+/ftvkhdfsaGntTpIzWi6H
	 2zzXkZWDr3bJDs0oihuHkr6CZvHKskiJq8Ro4g7YN6qvoRyZIYDTWmlKpwyk98iiCC
	 HPAOnC2FGaTP5gmaklh+2+qwc1CiOZmI9NfEw9vLVsf43ED3JlChN3MDB5VZsftNGX
	 yhiUWgRv8nFpCapqB5cs7wIv6QuD0yRV5o7L5ugvD+30rzqUKrXh5fJ/G7HIOFxo1O
	 iDnHzIKY9IynA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6BECCF9E3;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:18 +0100
Subject: [PATCH 10/12] drm/panel: sofef00: Simplify get_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-10-dfcfa17eb176@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8diXpj4flXvL6PBJCymDKTVmS7jlHjaf2gFdGCxh2WA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnssTJrYITqvXoSfOpO1N/xmq6B/uzeG9TnlS
 DqYQuDIxfeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 csOfD/92fqAeLGJR+XZi2fUT8DBSLFFuuY+d02H9N1VyZMdNS49uTPInJ2tXxfoaPXH6okErM6c
 jAhM9x4Jc12U+BA6h3RrWMseOYi4cdusav8PngmIbRCX1xHqrgmCVuFq08k71IFo5VWGsVw9nSz
 NSGLIFi+9JNr0uNXatGNHziS/31y4aiU+qDIWooJni1IHpYIILL+1dI32t41gqdAzT80rNi89kM
 E61JOFvwez//Cbu6a7i1rEFAp/sI2BTs6966n0i99mL2a5DdX5dW5g082+QgNJ5oP1r1k8uaHC9
 4QVYgOwusiCgd7FnHg7KVVxkmfJ83AjcnjGPImLPeeTVx46iTkHAYieD9umEBPJ8he8wVw+Hz1D
 LPQTxG5Hm1tcoOUT59XHBboB5cF5u0JNFgX6lbCA87B/uGa75uzgplwH3lKMz7AbAcOXqyGntOc
 fKZwFXGAvZEsUxEAzdKR9Xe2BugFoO5uQWsgJ2+nJC1KYCDIAgYJPxNHPEgCfmqls0zGbqk4g18
 3ugHyWRctJtD013BG82UTU2r6b9oNCSkViKwcoRAf2Wb0mdPHKBA8pC/HKXKrLZwPnCtUd85WVu
 otN8XtLJoiHtLRRr4d1Y48C0kB49ns1guGqlMuV5EcIFO7t8w+KBe3lKA+GsOb73Onbikb3q9MR
 88oF6RPjtYEyjCQ==
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



