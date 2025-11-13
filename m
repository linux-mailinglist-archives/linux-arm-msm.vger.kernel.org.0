Return-Path: <linux-arm-msm+bounces-81690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05BC59587
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA093AA36C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C72359712;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUyTtw2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BDD3590CE;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056663; cv=none; b=OPOFlfMWHOJ75ElFWJ3u2RTFqqzt7tj+51JLs5/1C7vNj4Okm+VYq0FMeX8QSbu6ob9ioKyCLbm1U1+VEfgXhMx4+up4aDLGU4cffLFV6SX4mXiwTnCOuNnAv0KgBtFhgn+HbsKpkHDftaZkoPJCFW3kDBYA6GLOOraPZU5XRvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056663; c=relaxed/simple;
	bh=GVLBLculdCKnhAiFJ2ef4yLpdlinMTlal7/JRCLg0f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dA6i6wAAUDNGr7ba3zPBuKM6ZOvN/xZMt1CD2owz6MyrWh6176FVs6XTH4sTwTi/ROKifFNQ/N/8dk4PQ5WdK4MmYFgo0MtHeAEOvLISquc/lPw3ZeD9Y+qlNbvptD8IxVBrfQRYuiN5MlpKOhpXCSNHt9WBOsFv5Zr4aTKeObE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUyTtw2r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A72CC19423;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=GVLBLculdCKnhAiFJ2ef4yLpdlinMTlal7/JRCLg0f0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LUyTtw2rmME8Jz8lhPxijBZgVwqcWVLEbyx9HoHTTEI+SSqbOg+6xB/WlwUZ6T3Mj
	 O7jY78xhqVR7PZ/r6h13FibQokgSeaDsKinnrGYX7MUD2slZvFOJxHQLSXvJqYxid1
	 7THfXCqMkkGTWUnxpS5W2vyrfY3MiUVU9glaxmXBpQfeFDRHm1gdOwGFw++VRc1hst
	 wSnJ2RjGx2E3RizbxOHjLo4CeQbnoBt4Rplk0/9QSdMv6Zvl7hVKvWrtucPuRXGoGz
	 zY7DG2HVuvtKS7sMNd9y22alHemdJNTKdrv2ZQdnM7tHJrjMIdSDwgRfT5TsMlPtw0
	 5ITaoAzSEHeRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41079CD8CB9;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:37 +0100
Subject: [PATCH v2 03/12] drm/panel: sofef00: Clean up panel description
 after s6e3fc2x01 removal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-3-e175053061ec@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bCUObjPE6sND+pIgM/wutRNG+EBQRl07BHTzasDZhH4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwUwr2wir4U7ZIpBZumdeQhzmdrM5CQ0pfPU
 JhiNpj4bW6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 cmi3D/0bTHoMJmN/Qo9o/LvNKjVSwqXrRUWf+hKCXWN71h4CU/p0Ch1ymDLvZBeRzt8a4OhWCen
 O4Oj5GulsPt9EiOZyD0VdMbnida8rKnO2/AhKjjTXel/PSH6uGcFmK3jneUEe8vXea4/pBJk+XF
 izmgXvIg9KBz+qVfzzQF2jlUNpZr0FMydljZKshetQl0pPn0nRgmHOKZ7jwrHUFI3c7njZmij2T
 2W7+V9NFhpSmqDuRk7oj0nCLs0twtuqZrpZbhRmGlsad1W8PxM1WkLFUmAZLM4sPo/Mgnpje+Di
 j8oqoTOJxhC+NEKtV03vXkVQqHx/9tpas3jQRKZNBIJVe7qLVjq3RYj3ETQnfO2e6kLMwbZh1ZO
 UsDLhStxOPRpboxawEhygeLR4uW/prsnxcoM9UIMLhWRQeLO9wFo6bysMkpf9keFNy6vTz1Kh31
 sqPonL1f4Wnfpy2uCFz+xJuh8XaaqB4G+8FkZDmhPyluXdwZGzgyWO5OC1B0U+Ja0ltLO4FU6ji
 Svq/B1ge+nO+f0KCDZxcR0GA+QCjushTYotwhVZx9AX9KmLOsvYGgVySqf3TOega737zOqszSt9
 HnKlF4UCODAKiM8+GH5sDJRQALP1qQCElDie9oTUCVNywpmxbwnMgRroHsjavY9xUIQHANulsp9
 1PRC7gwC9ZKvsOQ==
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



