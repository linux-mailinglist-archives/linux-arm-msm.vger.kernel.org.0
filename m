Return-Path: <linux-arm-msm+bounces-86071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0755DCD46CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 00:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1CF53006F42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 23:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DE827B50C;
	Sun, 21 Dec 2025 23:32:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0472773CB
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766359944; cv=none; b=QaAficHD77lKyt9cNBQ6WeKHbsRSWuvJuYvaz4dk+J8apOYUyQuE4LqAnQErwpgxHdiHH5Ce8WgBvfcA/dJq0qEXCPh83T5xExNGjVl8kH6UMBvcpAz6+ldS3/5TA0qwl/gUaTWu+PM5tGt41vWsno5/YzMzTod5ZeKNGqv1rvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766359944; c=relaxed/simple;
	bh=R7ygj3sXg+oAXbbRM/q5auC9FtLhrQvwvzv1PlldSxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSwcgzMhnW1FepPUKUWTgO/X2UZAQ/Ip6hFx0ekmnon6AUfh+Tm5BtmGzaQfKspGlkG+RfFGx9ugABgYoPQSDKx35CBrPDZCE5g/HeuY6Db+tIgh+JskRwgrfsk20hGrLd87EXAei/NH0415sF0Xd82xYUYNIegWwI7bIRalJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AD6381F8B0;
	Mon, 22 Dec 2025 00:32:13 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:07 +0100
Subject: [PATCH v2 01/11] drm/panel: Clean up SOFEF00 config dependencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-1-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Casey Connolly <casey.connolly@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=R7ygj3sXg+oAXbbRM/q5auC9FtLhrQvwvzv1PlldSxw=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN6UQDO54L6rIrmpqdVcX6dt/oPQRr3W8KuO
 1Bpq8sSFIOJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDegAKCRDxYtIxx+SG
 dvqtD/95qRWMUrwqbS8tWHKGgR3x4KyNXRzJ1CKvCuOcNm8/ifds2qhXw7sQDmfBvih3FyMGjG/
 H40ivnqyVKKgiyaVoAjryOuzlN4IUiUqfKPSXgPC5Y/1JyHEqhEPOhIpLjG/UKhZPggf9xGEVxz
 YstJQ9UHrhfefOtC7GMhUmJdLLz+MVstefhalZPwUII4Hy9q9kHuPEzZzRwywjwM8CdFWXI4Mt3
 zGynjhskaEqckO+91REWq/jm8LXzdlisrrCiupHhJy32saLvHZh8WKuD/kFsJgKC24h7ESrfAll
 h+gPdRh4fIvdA7Qq5jk0CBBtgZD4YCrLXA/vDuTu82zu66Ogz73HwP+tW7Muv9iEivsjP1YCFY1
 fzmTZJdQRbygxrk4MMJ8eqermuRjsfPeniaSyM0AHueJd4egoPc3ZfFb3Gol0+Ks+mGncHIxaiU
 u1OI8Up1TxS5mRo6+lAjBsxqcIdpCtMRJyhNB0HY24/FI2OyfcOsZ0TYVF5+23QBReaaBqqQpEp
 Tr7XOqWUL+9GsA57i2T9F10k9JBmVllyjo1VzeobmYNXee00yGe3Xa6cAAspWgP3RN8YjJF3bHg
 2bX73xOi2HUfd2A79JRQplT9pnXt22wtPc+gEHowZa3qH/22GFhQ6Wxb94sPJBBBDNQEm/3aTr0
 dPy1/XRuIbian4w==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

As per the config name this Display IC features a DSI command-mode
interface (or the command to switch to video mode is not
known/documented) and does not use any of the video-mode helper
utilities, hence should not select VIDEOMODE_HELPERS.  In addition it
uses devm_gpiod_get() and related functions from GPIOLIB.

Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 307152ad7759..9242fb894511 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -908,10 +908,10 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 
 config DRM_PANEL_SAMSUNG_SOFEF00
 	tristate "Samsung SOFEF00 DSI panel controller"
+	depends on GPIOLIB
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the Samsung AMOLED
 	  panel SOFEF00 DDIC and connected panel.

-- 
2.52.0


