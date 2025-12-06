Return-Path: <linux-arm-msm+bounces-84581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BDCAA6E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 14:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 043D53012944
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 13:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7142FC874;
	Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ac0yzfxV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A82FC006;
	Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028084; cv=none; b=OrXXpaIcZ/Ee0Au60AIxtc6TbljstfoafSQUnrdMNkKs+C35P0g0FQvazDK/SPbnmGkGiz98SgX4/ZGYnkB6rt588gITpiyKPaiCXg9Py+Xu2d9C3SU6f3cme2EBv+g/wMeGVzq8erK4zUcQ4El0vuinEElFHgrFDOQXD+3Nw1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028084; c=relaxed/simple;
	bh=7dRCkVhoY2x3WSouCqiav3GqVK107vBblD9M5kWqe3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PiS/F4kC4X76EQK2QOFG8JMdsvKFOIzNdGrc8eQALKm0fX0G8mUh9bcKaLqrrcs8/njbLpYp4ycv8cvbEApuqdNjeiVWecxxTjx4P9nPtqI+PwgRfFaXZRxdNqm3PLZ34IH16rMeq7wVQx8/tr7sVsPg8Z3yEMvIlSqcZq0IwXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ac0yzfxV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1701FC4CEF5;
	Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765028084;
	bh=7dRCkVhoY2x3WSouCqiav3GqVK107vBblD9M5kWqe3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ac0yzfxV5sgX1VkDb/wKSum5Dx7L5/rGOtvrCsRgu/cEx2o50U/xlly5sN70D24eZ
	 xkk+MQBB5s0+fohI7IpbReb+VAFOIdgu4s4lMUuntWJoTdYhQYAu0s7PFyZ8b9dWmv
	 ZoThorvO7IvxqbDYFleb9ZyE2iqC04LYE2MrXrTy/M66erza58pSF+TYFYw6tOp2TK
	 A9OBMzmI1H2S1iGVzglwS7fd3CJHK12bhxYeukRw4iNllaocW24YyAzuE8aBLHCGSo
	 0EHBd3gHIUvlYejVVVJ5B7as+fasqOttASpIOSisCTHfe7tqBXIYa8Kn+Z2JsMSB6T
	 i5siwBS3b79xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADF0D3B7D2;
	Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:20 +0100
Subject: [PATCH v5 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-3-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDw0iRqtud2wJK5tlpQJSM3IKgtgqcfBohqK
 sddE6k+kJiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 crtAD/9Y2PURNGt6jhl8+861Qln6l4gWac48D5IsT5LGy9ZGrbNVcSAgNHHEw1FxJ/gDVT+Fmjx
 jbNq8ERVvdeegB93LYpcdLt3moc9pRnORIEipdEv0MLzjqN6NwOzgNQ9+/d21FZv4lIpSCdMjNs
 rUHGQ7jPWsc1rw+n08dbEO5nH1w17s/nY6pIP7QMSiEepSyAZ9Xz+j2qx0WDtqOm+lTPtACdUkM
 +2SC8jVsWQVzpFNg3j47sdpTmW2aFWWL1PfkTCIHMqyyLsFRQw5Kl+NARX7L8qV+cDNjg8yLw/W
 IhRfLFVT65+Z2dIgNxVO+OLwm1IZzl1Fg5P3vPtCPUb6PP08YwJxIRklW0o2uwTERYuWdCuqTo2
 8o7S+KBqB9QssgxV66Th9z/dKnB2kPyzWaFXmIDnrtDTw2IyJgwQhoAqn/z7s4w8d2TE/p8aOr5
 PZcL6Yv4fhVx411BYrPjISyMwAbnpHxtJhXrM4z0GEgLC0sTD72cFEmzyYcVLM0cd1uPuDvn436
 3he85OmFwSXW8ZMI78M5ie/1yjIlD/ctn+MsDe3UnsZSvsfp3EntZ5XCpnKqze6INoc1KxOrY9m
 a1iyMqfN8m+SSTLIRK/aakgREU+1xIn6eK4rv0GnVDKS/rUsC8Wwu1vqjLyy7uDs5YuDm5A/sEc
 sSLk1ddUOQpAC3Q==
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



