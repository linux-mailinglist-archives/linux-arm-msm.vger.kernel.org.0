Return-Path: <linux-arm-msm+bounces-82513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C6C6F3DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 4ED882E8DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99298364059;
	Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEME1tZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69682364021;
	Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562103; cv=none; b=ftv3wZtvi/hpRjzMe5Gu8pbj15w4DuWpD5yE2XXrEX4GWb37Yfmx9ewG1KpTYQg931j6L9ONN3ljRDP6tUIJ1ypWQo0OyNGsRvGO6ur5lNAwwgt/l/8HqQwji5ey2OYVWEoOxEXlMKnrldMmcs1CkavtmE2vFHLSXw9N5TaBhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562103; c=relaxed/simple;
	bh=tORkO5c9uzVr8jR8W8QLeUA++T/SajydWlGSRg+0MBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L51fECsC7AAbV4q5H/3smDV3dMFC2j815UktPV91+3zgFIOGXakK/CalYoA/SHvlKEg3puDHO6rwqqYWR2oylz5dOwpptuwBVx8DJ/L2rFaua7UU4E3l+BJpoUwX2oNBOwHEg2/yI3Z1xIFaj5AQn4eHYWvmXhJfXufCyIdPovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEME1tZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6F5DC2BCB0;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562102;
	bh=tORkO5c9uzVr8jR8W8QLeUA++T/SajydWlGSRg+0MBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pEME1tZlTSCaqb9Gbux/lpu52/8SA9ZdMJNImqBDETlRk3QYgZa1lVPp3P+GOAmAP
	 M4Z4xt54ncsrBp12dnWTFUb8e2M9WFd2kITTzmqyH05gqCXwifcsQmpOiGdLKQwKYL
	 XW1A6BkltWnL8jbgN//i4PBNOxirC3JQviX7cobxlnbDFuZA3jq02nnpdivVILnk61
	 Zu8OTmoa86xX3/92KpqjxpgMwmqjgpvk3o1Yfm82FFpsbnufPUwsjuwz/GjdibY+Q8
	 gYkI+0Z6cyELL9jM0OQaOt62L3fU3Pj/PxZTXTdmSb7EZLS5WCR0hp6rBBInXRPZqd
	 T/bi1sTkG116A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14227CF34C4;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:35 +0100
Subject: [PATCH v3 10/12] drm/panel: sofef00: Simplify get_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-10-6cd55471e84e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=t7Ham4KLGv7LXKlYHbza6Ihf3qcaU4uzq3IWHkZmI8s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJytotmCbEIhNbMBr/c4FHlWH9+HbBvj1Q/A
 t3ypVKh/RWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 ck4YD/9sd/ZVgWPo/UW05hluFXuojHouqw0eWVPDrW4KTdGswP273ZwMrd71jKdx7DBczSfVs4U
 T+6Gp/2wCCrSefms0774lAEWdSyEtf+akci2vPIahew5JUygOl4cMwLN5n8iuORArZXzxLTZLiU
 O6fD4vl5Ac84Vcdb/ieDUXGrsAtjmlQGMw1BJXAexK88/+20hhJYMOh6aMzb7MIqWgDSfFhw5nf
 0kug5QYgVfbfrAVBTcQqjYO/0D+M6X6xLVRqbV4+E4yK83jWmnkcEMyKhcT0NOwboNgNLkgFPu9
 Lkob/pyTAxMwzvI5E2ZwfDqP8Sd/nJyfDp0U21N1XJ3hfa/if6+ArNRGfSG1boUQmXzmN3Yl82Q
 l3qIgRG0Otogy+29y4PLYPhfUhls7NlCC6jrRRRHkgx1MJArx0WJFYdJJwVmIDHmkOsasl8Jg5R
 uv5XmAH82jNFiafxaU3dStm8EnG+UfyMaX8o5wC0lmqwty+1FA9hABCU5DbIivXB/aDgX01RIRA
 uzvXXh5aq8qSmItEAIZB58Ett+YGG4dGkzbyF0jMvAL402Wlc6yi01xeJ/9outhimgugHOrmQpy
 kxPP0kKTVh+iapqHqDrtbrzOT1GGVHrvl1hES+lPO2cQGfr2dkPqI1aese2eyr/rYWhN9QMLfuI
 P7qCVKKjlcjHKsw==
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
index c2cb85997e4f3..0e857abda5964 100644
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



