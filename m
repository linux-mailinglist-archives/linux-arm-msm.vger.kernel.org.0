Return-Path: <linux-arm-msm+bounces-80361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3AC3327E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBAB44EB928
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E76F2F39C1;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSK1kkFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE892D061F;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=JEJzTPnhH4xYFnNghZfhrnWtm50wN0SiSiKvNDHIcwwX3TrGxK7m2wOTgpiJ34glF7Lw7S7R09GHmkrByvdIVyBhDoUdag2SZ++uG0ZGzfeQrbyPw0DyUEb6DWRVHKwX+djRHoY7z9C/tH2Ar12PLZh2lB9yXl8vVAcNQmDZenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=egR4AL+LaPLN6NG2HehYd+MOAw7qcr62Ps1E3HU1X1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImQbU5F7XmbW9J6oKfj218yFA2a7MP4J2ODnhewfqa673mHDHMclnO6synh/YXsuPsMXGdB3FfQm4UkWz1bZ+hKHEw0ApSPkMIqPAiwuhFhS0R5ksTdjYElgFH1x5gFU0LtTQ1BpU8MAFXHB6YR5rs9pHG/iaH/TnRpOydHdPXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSK1kkFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5175C19421;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294574;
	bh=egR4AL+LaPLN6NG2HehYd+MOAw7qcr62Ps1E3HU1X1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nSK1kkFdff+t5sT7+H0wqN31UUVow06mN10SAn0tPxbs7RA4MvxQBCFQtJCjgxYpa
	 K7jwZT/0Dri/09XknezVmXwv4/3Msd3ZH0LRyEJwzl11pb6fKrP4q8rkhaiypHNoMW
	 F0CFAZKrsqPKJbcsJbLRLfgP0WboWBlJxiDLm5oaVrO9eBUk7pS2At8lSQa+pO1nCs
	 1oaykvCJlyAbTG9o4gOoOHuh7tyGx+6p63u96yRoPsra1Cy9B5OztFD8qe77MWjlhQ
	 Jt5pHSEWMoqAkLd4j6GKun1oZeOv9/gnILOZXhqRatJrLw+jged/lsHKhQ6PM3QiRu
	 EpkPL5sOgwnpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1D6CCFA04;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:11 +0100
Subject: [PATCH 03/12] drm/panel: sofef00: Clean up panel description after
 s6e3fc2x01 removal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-3-dfcfa17eb176@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Tdo9B853+u45bPiZrtcM4vLFZtgNYIKOGwI7Qd8WyHo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnss6m/xMnOrr9iT10hP1+vEnzI5f4krDVh6A
 4nEMofrszKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 cotfEACo8El5qi+C7R3YMofHslfSXPvSnfEJKGp73NLxFMXTr8cqx6L0hg2fNabEXu/fP7DjKnn
 tI8+WWlcGnpIg0jZh4twKuuzc7JtRzLrj+mv3rBE1OBacjpFBmInLHvWl11Oc+OAc+YCF1/y6y3
 tTF9b8KaZS4HDr8s+U8+E2apACCxDd591/5ujFPiI8u/7g5y/25G93OlvHzb97tHc54TeJsX8mw
 mJLhpu2fYeBVk2d/JkyuU/TwXKVtPXFZo1K9swIA22MrS+jAmttCpSOIM/Fu1Ic9jizL94xPVMW
 ia55xNbZrv+TT41rSRBEmmPRsqfTv7UA6qjt2yH/gKAhaZTemJ65xQD/EmSrkSnn0qP281Cjwgj
 0OgI2FcjHhwCubNa+5QSAvlAYlUUVdYRkgd1Nr1E4ljrh8P0AFuke/EXJdpAItynqzU9eZF2vGp
 PrqC0t7YuW23B96mkEF5dIzNufcw20untev+OrVZm0mxgGN5liSbka1JJxgXuwKZd6+n9sgfbGn
 yJg3bnSP+hircJcF7KBkQ/3lvaj211+AF/Cvh+ZC6aLQRLfNcwQBboC45auLfqESFqXLlHqm2H+
 X7jocDWJZ9SoZRxYDejcKS5kgb4B2h8JiXgUSLR5u5lAMQWv4I3zHRhjXkAXbaOuOXdA3KZKWaD
 S8d8IAaVgfYV3Pw==
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
index 407c5f6a268b2..3442b1be6424c 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -868,16 +868,17 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
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



