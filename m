Return-Path: <linux-arm-msm+bounces-77625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94490BE48A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 18:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70BD7543230
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 16:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDCD350D6C;
	Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKrO6Uux"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A7350D40;
	Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631420; cv=none; b=r0whXddkeWBxDLHapxy2pJHXseRKoGHGnQoRw3/Qeo+zWXAm23GROR1h3owkY0gkRqr8QFW237kjY7sd5eWkGKvQHXzUl1goZXloxv8kRyUylepfhgARRV1Ym1YHzzk3Ksi9D/U93tmwXZKqbKlfr0pwvjRpLNSSEFZBXMj3UK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631420; c=relaxed/simple;
	bh=S0WNir74N579R+w69D4wF91+c/pfRD4OlqxTVOoiYX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ql6tDkrVkhVyXh+jTh+C8ypkavI2cauA0270sTm1XiZGpv1fvNvAvP7j2VvqSwe1Uc17vQgr/KZvg/6foDkav80A9dLEnDp3JJo+spTyLV/5oSm/ohmiwffCgUYkgxza1nELa6jNkH0K1nvO7/N/Nhc42c0XjjxlJYHhReKa3EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKrO6Uux; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56654C116B1;
	Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760631420;
	bh=S0WNir74N579R+w69D4wF91+c/pfRD4OlqxTVOoiYX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KKrO6Uuxsk+TvShgLxzPf855uttAmdkAsJwQ5n2mbc+69uXlq3BD5aDk0mM3cVKGS
	 4OKXWCKB/0dR7spuwqtrBXr5qVxIxQSfyDfofo5JUVRPeen5fVk6+p9ojkquZu3Vpq
	 pNmkhkSP0KT/cDkq0qNHQMXpeOQbH92fSHW3Iuvz1ZmWzAVBFm5auj6bPsLu53DCpx
	 HrO16A3HbFDfLVnUQBSqzrXzAvCSp3hifd9Jn3lXAG0v6uOCpgZXOlMhI1tGLf851O
	 OMvAAaZmV413NtsiCKi7ZCwqYjn4gYQZezNV1YIzX7HpeATgsRBEcun6JG3z/p+R73
	 YSsahB2yj229Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA1BCCD183;
	Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 16 Oct 2025 18:17:03 +0200
Subject: [PATCH v3 8/8] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-s6e3fc2x01-v3-8-ce0f3566b903@ixit.cz>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
In-Reply-To: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4+Nx6clkhCkST//F+2BMd0nBGtyNIXUCEfb23utzTYI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo8Rp5wt2y0Xc1+GKJ2t1MY4XOuvPZTZP7bPEqj
 ByfvV+qXciJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPEaeQAKCRBgAj/E00kg
 clAqEACCZWBWo0npnp0kidoPHG1Pd/dBw56Sdxumg+7kDxKkJfyDDdLxF/y48pxHpeBvbyINosc
 5v3HFOzDHjiBQRQMcg/sP2rr18XF6B0U4h03JqtLbaT7F6+C9UpUz+mxNmePtIz2rvn4mzNa/Ln
 gATpba3HePKXgXnGiIvBavkGW7EsQsSjiu4x2o9NbqSdE73w3tfbyCMVpdst6iXhWJLpyfH8iX5
 vxhNnr6zMZLUKidz2R/FwC0HnYE1yFU5XtUFt7bWJYh9O8SmneXpnLPKrBTH95GJVJEmvFQgtoO
 KXWLDfk2p5ZOAvIF977zt0GHzmljRvFkdhRwhXq1qfMN+HaO9IzqyIaAV8igUB548ujoguRn2Gs
 FlcN4XDl+EqaCGYZp4WjzbKwou57szMjuvFypcXxIyrIwhOR+/HPw8b7kRH1L8Sg2+FuOeEZAq4
 fgPYxtYbEaWi/dMNvJe3Bid/uymgELyqAbBhpL1gjLwznIxqJ6RGPOOjvLUU/Uk3pPwgsx1Brm4
 Cd209RKQxjTwKL8OfnBwqd1Krts46M4FPDyZXdZmgkHFRl5XFBgDXGa4A8WY80U0nHkoOvQGV3J
 KmQ/mcJenWBqi2NgUszoRJAiPBCbQCmEDF/Yfs+StH5zzoyVn1iZ51fuPyO6eQGT1MGgFCgcdAW
 KRMl6fLfDTNCrNg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Samsung S6E3FC2X01 DDIC isn't Simple DSI panel.

This panel has three supplies, while panel-simple-dsi is limited to one.
There is no user of this compatible, nor the compatible make sense.
Remove it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791ccf..6c1249a224c8a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -56,8 +56,6 @@ properties:
       - panasonic,vvx10f034n00
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
-        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-      - samsung,s6e3fc2x01
         # Samsung sofef00 1080x2280 AMOLED panel
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel

-- 
2.51.0



