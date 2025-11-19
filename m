Return-Path: <linux-arm-msm+bounces-82506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A4C6F385
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 7B87929372
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD58275105;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LE+l582E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7632652AC;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562101; cv=none; b=g5CXlVGofV9Tne1SMnKwjTbV75OyyZ5NSagpb16NYaOhbRCSNPV1AEhDCrZJBc17/ovHv+eXiGasNO2mqTOisUH1E5sWW4Orcw7eEV/nw2ZaE+eIfMnt9igtB2AbMw342CdEuxclT9yG7FSln/OXGK1qfne6Ev5XyV4uTtEP+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562101; c=relaxed/simple;
	bh=Tb+w/XbxOriNJgYQFbC8+hCQCLxQbYZDylDn4vEl52Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FU7K4IONYwOag9Fwg3XRnLZ2LnFklSjSZhePDQ95/q8vHY5lgIn/RsGCFV2a/4mItXNB356q74LvPw9V+M0f9CmV5Te7l5bC8AjYfD6gvNRFPuivgT4ypd5SmblLmrXM/I8chjcNuyr5Ku5DMhQcD0nNoFnq7pPOT1ziIeSxgxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LE+l582E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCC5EC4AF09;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562101;
	bh=Tb+w/XbxOriNJgYQFbC8+hCQCLxQbYZDylDn4vEl52Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LE+l582E+DJEHXsHAf+dLt+/AGwJuTYRa9MKQY9PHfkepu92glus8JSYwyVrN+4rZ
	 7QLUb1mDVC1VhtOoc/6+PeXVYKvfFwIrnft/vvnhsGPjh012NuK1q/8TcxJ4CYBtYE
	 CzgEhFr1KUzcFJrREMh3BgcS/NRX9cdS5f1LESq25w8+ro8DYsk7vFecIhBFcFCwd1
	 tu2hOYO1mUyVa6DfIQ3W7TEPnxkUqs0UBhXFReFTo/CpoZo0S77v7BraQlekToFUp7
	 bQQVxF5CjubM+THvmoCZLap6Gu1r6Wy0GWygqhEbEhx2Gw11XxuWLhcqrwH3yHy4sn
	 kA1RjOFG4jwSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C6CF34AD;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:26 +0100
Subject: [PATCH v3 01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC
 into standalone yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-1-6cd55471e84e@ixit.cz>
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
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5338; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Ci3WVsbLezRICGGBNkNcuK4J529ZhFEeGZtioYqJtVk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJxE5Znoy6cf8rgB8XRZ3ZAtj+ovz/aOZDmk
 AsIngOQO2+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScQAKCRBgAj/E00kg
 crGlD/9ZptNDbEgTSfUag9/iY4Y7PuQ0z7V19gwhFARYrYkYm54b8ZiGauBTgZUtoQyYHHq5YFw
 oLXdgPm26/flE0n7fJ2oH0TSe2X+SVVvbVIj/jO1iLYIkb+i7wRXAFlClwWdrWrcRPMv5f2xAWg
 UzmZxO0ny2QNm8pYiGXyJTD2SIFIGWvYTYK4wLoe0ElQ/u2wddYVEs3tsN0/KNOLACPzY8gm6DI
 nnt47AMqkHeRyTjb9I3AK7WR+iI4OCWDmwJ4rufh15CEhUt51hmtMseDRc9l0RI6SXyzjdjrkVE
 1n7cYNdbXWfBVNt8bzv72hIEVmYddSZllZiqKM0FFA5xmGDkD/P3AsYJdpsygcN0fBZjU+6ZChR
 YmUJu8fel86ChtLojvjwpO46FtLWz4rnSiKB8UfdFM50KeMxECxOgbAN5KYCBBGgHglcSBfGaAV
 v+iDjoyR5339kHrHoMnMkhZh8RoctRJLxhi6sKrqqMx9ttvILnb2dpWzCqWyoW3fXRjg3ct4NKc
 OtGPEXXlHI2jd4I/JMr8ydkjBMXp9i6Wo0Hq7fGqYYCQtvbe+8vRncN0e6lfyvaeIUnyZbPOzKe
 Py2roLSmZ2p7Wy8FP7vu2VC7qEkE0LNz7DnYWdAcF4tREEUuh12TDo7VhE3sinWLtoMdPa6KIdq
 qyphhVVQXZMU8kA==
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/panel-simple-dsi.yaml   | 25 ++-----
 .../bindings/display/panel/samsung,sofef00.yaml    | 79 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 3 files changed, 90 insertions(+), 21 deletions(-)

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
index 59b145dde215f..7b158ea607b4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8140,6 +8140,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
+M:	David Heidelberg <david@ixit.cz>
+M:	Casey Connolly <casey.connolly@linaro.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-sofef00.c
+
 DRM DRIVER FOR SHARP MEMORY LCD
 M:	Alex Lanzano <lanzano.alex@gmail.com>
 S:	Maintained

-- 
2.51.0



