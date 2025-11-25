Return-Path: <linux-arm-msm+bounces-83319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5EFC870BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 796CB353040
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 20:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5FB33D6F6;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALARG1TR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADDF33CE91;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102580; cv=none; b=lMed1c3Z/pCphb9iHkyD7Z2lWDCPLXNg0L78NX81zxXcmuhmuyvynvsLJ0OwT3xwJjKq0dVqRQWL3aX8Kr+D9YRroszyWaCuzrQLHpoAVw+Kgq7A5jyia1gM7ISO8DhNUA7UHZ7vVdAtOfOH5lSxsmcFzomjrmoKLREbxESUih4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102580; c=relaxed/simple;
	bh=57iFOlJjHz5ySUzY0KG71UVGjXVyk+k7qQ/D/GZ+w9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNsR1+OMVXCNcLcnKqg820gfshXz2xUjRFN5dwAUx7f76Os4VyOk7dEuJvq1u7ZPg338n5x8ay+AxgM8noQ51HMADBHrlBMoHBc4dHfUXQHSQ3Vrja+QUcSJSiKz399bu7/BivC4v9+FVjb5zHPYO30KiqFWpg6NjGFlIP4kuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALARG1TR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E64C16AAE;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764102580;
	bh=57iFOlJjHz5ySUzY0KG71UVGjXVyk+k7qQ/D/GZ+w9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ALARG1TRG9czMdZsHKmrdix52spMY3jRCtJCl9fpJXTHJKJZSy/gq6zrj093l+MHa
	 l37xc8CrqtegACZ+2XUcdJlEbm42Al3xl/C39ZJUXrMVH5LKGX8342lHGoSKV2eagQ
	 LB8ElAeQnXfbt6hr+r2eJcTG1Stl9tLW0QUiqGLN/KBF4CASytoHKjRwr4Qaaxuufi
	 UCsT7njIF4onVazOoli4CgU5y5pWXSDfhcRgV1W9r/CjfRES7lRTsQ+btnvhY5Y2e2
	 a63vy2gLc7xMG9+z2uqR9aAZUB8ZVIY1Q0QTJ09vNlTeC+k73QO9P6mJy4qspJ3997
	 GVRORdNh3uljQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB8ED0EE25;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:37 +0100
Subject: [PATCH v4 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-2-3b706f8dcc96@ixit.cz>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
In-Reply-To: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
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
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NUtDhdxgm27JmLpy0LMIV+8SFYDHd5eqrKtd8gdhaI0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGxa2kozTUZUMHAbh33k98FWegntz/YxT2q8
 RDgtZMm88WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsQAKCRBgAj/E00kg
 cql0EACzbJ7MRU5M/6U505fHRfvpRGxyfS9ImojQvXzjptKh6eHWy8N6ojZ50qxeoUMEE+XK6TE
 FEQYLma4Rj0pmaIJmwuI/J9+LuJ+wROdCMyG4f1GK2PZJwivSO5n+YdJX0XEbh9pm/NrAQ4xtIt
 YZNW5SIOGwG3jsw8Wo6jMPdHzmDv0qqtuku91wtwPAPSRtBgZK6tANumSRPKsVG7BJ8IMyYPP62
 m+Lc2DskktcooHk6y8gTAJs00BLLziJWCSw+RnLx2dj892Nor1S4I9+qoUKV5iKl4YCVMTLwqry
 awR9Ch1fIIZo54cIq2PhsDIYsY6cUzpVocf6rA/RZ4LYRuyAVJncxE0BEP9xW6mMqVk3V9UArfx
 8qZBgQwKRNLOzOMEtHE3n0X0eWuKEkSVXdG0PaC8fBa3mDLc0umYtIlLxcKktVp0kCiHofBX6hl
 F/9J+POci51fxUaSCtmVroAIITkzzuFBDMY+2mpavahYndEoIQPe13/uj/SJoHM//M8b52X6RJE
 +wRmELkKGZrHujsaBJxe32+ado4rW8qA7tOwtjIek+pm6ib5sTnlcRZAp7cDyHREUnx2Bi49VkI
 LQRG/cIetrMjrSXVRURsISnMTnL0LauA8GWAJorF4saXLUFEumaOJDKK7yfDYHJPZAqc0yYAYYd
 41r+0fSUKOs+x0w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Add compatible for used LG panel.
SW43408 is not panel, but DDIC. The panel itself is the
LG LH546WF1-ED01, so introduce combined compatible for it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/panel/lg,sw43408.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
index 2219d3d4ac43b..f641efaeb8b36 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LG SW43408 1080x2160 DSI panel
+title: LG SW43408 AMOLED DDIC
 
 maintainers:
   - Casey Connolly <casey.connolly@linaro.org>
 
 description:
-  This panel is used on the Pixel 3, it is a 60hz OLED panel which
-  required DSC (Display Stream Compression) and has rounded corners.
+  The SW43408 is display driver IC with connected panel.
+
+  LG LH546WF1-ED01 panel is used on the Pixel 3, it is a 60hz OLED panel
+  which required DSC (Display Stream Compression) and has rounded corners.
 
 allOf:
   - $ref: panel-common.yaml#
@@ -19,6 +21,9 @@ allOf:
 properties:
   compatible:
     items:
+      - enum:
+            # LG 5.46 inch, 1080x2160 pixels, 18:9 ratio
+          - lg,sw43408-lh546wf1-ed01
       - const: lg,sw43408
 
   reg:
@@ -46,7 +51,7 @@ examples:
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "lg,sw43408";
+            compatible = "lg,sw43408-lh546wf1-ed01", "lg,sw43408";
             reg = <0>;
 
             vddi-supply = <&vreg_l14a_1p88>;

-- 
2.51.0



