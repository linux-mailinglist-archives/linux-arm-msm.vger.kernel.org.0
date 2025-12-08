Return-Path: <linux-arm-msm+bounces-84646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2293CACC0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 10:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2405301FA40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 09:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43547314D12;
	Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAobI2px"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD32FE560;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186946; cv=none; b=gaFX6/IWjoQ+Ex0cocoPci7ejUzz+DScY4fZ2X6gAlQSMtQIQYBUAta8xOFZDjiQHYOrLQHMNgYUAA6HU8xhDwxElNXpDNNNLmY2GvkYTYq+E7LEHPHeqq1zQfa62zffCRuhfUUdCCB8Yuqwwb52KyRX8bqvK50B+8GHOkG/5go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186946; c=relaxed/simple;
	bh=7dRCkVhoY2x3WSouCqiav3GqVK107vBblD9M5kWqe3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocdCMrUB4xJKf4SCTzqo9bMcqRrVNqF7wwIElETf6ks0bzperp80+GDcjwLIe23o5OoL7/SxKv1wezDSWlRKqiu50/qBby2/kGaehmaF5Ih5LE3urgKUDIL1NqcrpPWpNcGfRYJR8znoyHOGgB2VdqrqmnhX+y7xIOBYFYyMiUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAobI2px; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6360C16AAE;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765186945;
	bh=7dRCkVhoY2x3WSouCqiav3GqVK107vBblD9M5kWqe3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hAobI2pxRfWoBTOsgHxYyMaxEnwUnn38eghXjc2s4uqBY25XUN0lEOgrFuvh6cu1U
	 yHWrh802lrm4fSGrdVt7x56I8aimnpWKADxzNH00YVMLUv18sGK90wzcNqW0yOm6I3
	 h8zwRMRV15RedJdG8TYvinQR/vG3IK/sxJW26J2BtOMcQCom6IliiTjmyB6DwWRW1d
	 8tnmRasRp2QNMv6l/UZ+NYfu3BShyKweIGYr3K4WtBxys6kjN4pLDjX95DCXN+/CKh
	 9oZIMok/GoZyYuAnBSoyHNywVFQWBiTkyY4PoGXqD/GPEyQb3eeVmJTCHI97pEvGjI
	 k0y8ROZ/oGILA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FD4D3B7EB;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:41:56 +0100
Subject: [PATCH v6 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-3-e9e559d6f412@ixit.cz>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
In-Reply-To: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=K5KrfoqgLLk98vvZLiz1OAUosAiZymNlygbzh53UxIQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/90irK0UolOH2zOZv2yI82ykWEOJlbnkPZ
 zph1dDz3w6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 csOTD/4j8h8D0ACjR3hGNmO/UsN6h21O6p3z14Bc80eyhqEWmVebf/felupuaRq17Ptc+qLLT2i
 S593RKsObEUkppbTSqEiOJ22kfT6tzetJShnKpelFANXgwWBdMOLFZICll9ZKG20pncQ8BkWuwc
 0BSIR3ej2LYNpKg776b9G76z7Kmb2cNctGrTS3lQFi6loCjU7G3T7peRZR0CA6UHw1mrHU6gnOV
 grx5wkooVgPx5qKb9pSuPEnlwN8BIgE5kwKfRAcEy0AOKjsaOyWB+QO9FN59oiBYCPCWh61Dppv
 ukApZFMSzfy8gMNZkIchf1Y8pdJEXOcxFKaMSBLmPkeeyaIC1EEF8UjqvqMpZKGdAey5vJMnemt
 FKdIMrtE6h5QKQbaVTnTqtUlNdvLBwEnIulw0HiEYk6rhkAEgcZE57nXU8CZkgg7TpOh46OxJfl
 ViBAl5lZ3p4ezPS7OSeOGrUVD2duPd4AVie9n6gJv0msIZ1oYgdF3HPFmHpyj3anAL2WClYFzsq
 mXrKNXZE+co47xlOpgLudARjXar9M/JePX652FyyoxB7QsrF0DzvRtOQBc/5cEsP7ScA0brrtqR
 yTG/dO33J6EYqniLVCTMLAZ5M9GKSsQ2/oH2wIFZOKWm/8NyifD1w+lnFVOwC9VRBVbk4brC3cY
 C3TDTsERRGu+8+A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The supported panel is LH546WF1-ED01, add compatible and adjust the
struct name to reflect that.

The standalone compatible lg,sw43408 will continue to work, even thou
there are no users yet.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 46a56ea92ad9f..dcca7873acf8e 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -149,7 +149,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode sw43408_mode = {
+static const struct drm_display_mode lh546wf1_ed01_mode = {
 	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
 
 	.hdisplay = 1080,
@@ -171,7 +171,7 @@ static const struct drm_display_mode sw43408_mode = {
 static int sw43408_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
-	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
+	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
 }
 
 static int sw43408_backlight_update_status(struct backlight_device *bl)
@@ -214,7 +214,8 @@ static const struct drm_panel_funcs sw43408_funcs = {
 };
 
 static const struct of_device_id sw43408_of_match[] = {
-	{ .compatible = "lg,sw43408", },
+	{ .compatible = "lg,sw43408", }, /* legacy */
+	{ .compatible = "lg,sw43408-lh546wf1-ed01", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sw43408_of_match);

-- 
2.51.0



