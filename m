Return-Path: <linux-arm-msm+bounces-81689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73276C5957E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02113A6FD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FE33590D8;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu+t67Wn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F430AAB3;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056663; cv=none; b=E6XXl6l4t3oQHIRPkgfruR6rb/vAIlIQkwYg+b2quiJZDxKOpjj2htLrPf2k5EPCc2+q/psrbhmJ5ag6k+RLYdJBcpqsFSTMZx/z71sJuliNWV3wofYvce0JCa5I4ClgL0Cz+IELKVP9bynaGfz+fGkLmYFG7muJBxnmyqLsVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056663; c=relaxed/simple;
	bh=uFbPXmbMEAHhJ0wYQFNs6fH4az3w5KpMD/1oKdF7a8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omVu6Kl2T3aXTiQbpFj5wPmdY6zoSIxTNv0UpuEgCIITFCmIQLvbe5436lcDcDSE8tBrJ6YyXEqKwR8jn3IhgHha/JL61cz6tnXhbiHyxEt7lVy+T6nyueBhxM7mDWenmQSewyLDyfmK6WkP4izInjYN9EJtEr4qbr9Xyo5mxTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu+t67Wn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3169BC19421;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=uFbPXmbMEAHhJ0wYQFNs6fH4az3w5KpMD/1oKdF7a8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eu+t67WntrJXQkscPhCKuC6tKwngm6Pl1jQ4b1UmpxZxVUOuM43tWwCKJg6nt13E4
	 GutY1R0gSvBEWyh2rpuKrP9NXitwK987rKRvMugjTfj9qqCpQhUygnt7PWWwiyfiDg
	 Dvym27+PjYmJsPci+Qoiuo8R+pJVbRJ9jhLVSPRQlZlgndQRW2Pf1h1sIG4ypqjXL6
	 vh4ZQILZN/kVcnNTl0LlAp1LOGALsHTOtUg6exChWDHt5GoNL2g4FtBH/8mG0+Wdbj
	 phFonxROug+xYyQO5gWx25Z+1ABJKQ2kLKahvvMm1F/JePDhSl9Gro7pi74EtK0daw
	 L43tQFBnnezpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A42CD8CB1;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:35 +0100
Subject: [PATCH v2 01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC
 into standalone yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5223; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KcvZ6HH3tv4tYyjsZH5js8KMkizn6EnBiH2Cf4wtXuE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwUIFmfIxRvdM9zgz/7D86ElPcYaUzPd3949
 gfKJmAYVBiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 cqyTD/47zUozqhH/hFT3EcH52HUFMGlDxpvDvOYYtVSYV8TZ7ORcrn5PmBU1+xHSXjouZ40mDj6
 +9hVI4Ew6wbFgXamNhBGs39eutr2SehuGuBjZ6C7ccSNIfso+cIhOM/VCfrGS2uXatsCK33cgkO
 VzFq6Ll481hz1bZ0PkO34nm5vQ1NB3CtkcszxWJzQAG/q9PN6oNM4C+f9H51+ZOpCq14BGMbrxl
 AGpWmMn1MVtHPtdQajjMNfT2XlTUtgxcjycUWVPHtUWaxNPwTw1+22iiIEuasxrpR/MAboBk02b
 bRU76FTJXolXFbonwdZCdA1lQ9hLY8iLHUudJ7dV5JsvGlX/ccLztosYnO4i+Qp3i/0rRfoaqWZ
 3qUQr8ZeW8yu2f8etP7TBazfda4wTLjXip9pRjcGziRcOtgdys1TW3M8kWqtXz02PPtZBqNyN0K
 HU9fyWCRQtJZYFFE90ZOdtcIjiofDmZ7+4gVfOEfNxTXmufhvT/hGsiIhr2OdUGDMTFo3zNMZQI
 dhOADGx92x0D/5/QKcWLGPTAj6ZGuA2yolxToiFJeXs0m9fHJvZoZLtmXJJx+c8IV+2oS57IMMY
 koKm6lQhEotGRqwCz6uufs08K/iW7TG3m3fYa8cEbsp2GmhsEu5gGqGRLxAS3hB/uwb8OXHMvmD
 2dORrwKNRv+pBbw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Reason for moving from simple panel is this DDIC has three supplies,
while panel-simple-dsi is limited to one.

Previous compatible only described the DDIC, but didn't include panel
connected to it. Let's fix it, and offer bindings authors two
compatibles to distinguish the connected panel.

Basic description for SOFEF00 DDIC with attached panels

 - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
 - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio

There is only one user which uses samsung,sofef00 and it's updated to
comply within this patch series.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/panel-simple-dsi.yaml   | 25 ++-----
 .../bindings/display/panel/samsung,sofef00.yaml    | 79 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 3 files changed, 89 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index ac2db8cf5eb76..464d7c8a7665e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -19,6 +19,9 @@ description: |
 
   If the panel is more advanced a dedicated binding file is required.
 
+allOf:
+  - $ref: panel-common.yaml#
+
 properties:
 
   compatible:
@@ -56,8 +59,6 @@ properties:
       - panasonic,vvx10f034n00
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
-        # Samsung sofef00 1080x2280 AMOLED panel
-      - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
 
@@ -70,30 +71,12 @@ properties:
   reset-gpios: true
   port: true
   power-supply: true
-  vddio-supply: true
-
-allOf:
-  - $ref: panel-common.yaml#
-  - if:
-      properties:
-        compatible:
-          enum:
-            - samsung,sofef00
-    then:
-      properties:
-        power-supply: false
-      required:
-        - vddio-supply
-    else:
-      properties:
-        vddio-supply: false
-      required:
-        - power-supply
 
 additionalProperties: false
 
 required:
   - compatible
+  - power-supply
   - reg
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
new file mode 100644
index 0000000000000..eeee3cac72e31
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SOFEF00 AMOLED DDIC
+
+description: The SOFEF00 is display driver IC with connected panel.
+
+maintainers:
+  - David Heidelberg <david@ixit.cz>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # Samsung 6.01 inch, 1080x2160 pixels, 18:9 ratio
+          - samsung,sofef00-ams601nt22
+            # Samsung 6.28 inch, 1080x2280 pixels, 19:9 ratio
+          - samsung,sofef00-ams628nw01
+      - const: samsung,sofef00
+
+  reg:
+    maxItems: 1
+
+  poc-supply:
+    description: POC regulator
+
+  vci-supply:
+    description: VCI regulator
+
+  vddio-supply:
+    description: VDD regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - poc-supply
+  - vci-supply
+  - vddio-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";
+            reg = <0>;
+
+            vddio-supply = <&vreg_l14a_1p88>;
+            vci-supply = <&s2dos05_buck1>;
+            poc-supply = <&s2dos05_ldo1>;
+
+            te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-0 = <&panel_active>;
+            pinctrl-1 = <&panel_suspend>;
+            pinctrl-names = "default", "sleep";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7e015dcbac732..a4b16812d5a0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8117,6 +8117,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
+M:	David Heidelberg <david@ixit.cz>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-sofef00.c
+
 DRM DRIVER FOR SHARP MEMORY LCD
 M:	Alex Lanzano <lanzano.alex@gmail.com>
 S:	Maintained

-- 
2.51.0



