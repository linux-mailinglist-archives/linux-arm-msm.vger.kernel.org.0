Return-Path: <linux-arm-msm+bounces-80359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD9C33275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58BA3B5D16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376072D2384;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMSvnWnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A228488D;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=ImNmnJXgHHdAFIiiVLKuz7vpfHYEUMk1d5bloan6phXKdBWYAPTr0gGmy2i7OAiste0MWlpJ0teAPiAjw2AAANO+Mh9+w0efvCqevaMu5J082egnElDROuXjZolxPBIOZsyGyo8Ehs0Jge1ET+FTi2+j6hOR8wAu8YTaXmZEG3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=Rtx91GxuKaex+BdsMgDIfUh/ugamROd6AIG7Rf3SlNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSj1AqYDWPKxjCOLcng/vXGm3Pjm18B/Kpy1ZfMNEd6ctM+2y+BhjvltK0sxAcwTeKYW33sjmcuCH8LsvgvMxULNL0KIFjbKk+c651zSp8Kn6OeJ1I57um+U62k3S1Y6iiaqvH8amN9oHp/U8LdjbG5phHQFn3G/0D1Beh516Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMSvnWnb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87037C4CEF7;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294574;
	bh=Rtx91GxuKaex+BdsMgDIfUh/ugamROd6AIG7Rf3SlNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EMSvnWnb+Z24IlIy01JpOG3Ay7SepVAPiDoEwLP4k0i7v5lAzpYLU9nrCk855JPri
	 VqkF9nDTJnQ7J5y/CnVpgOhR1ji7qY1AM0Hi5GZ/oRxpwScpW/jbDa6UyqcZtS5cB/
	 5OA/ePRUcAtDyGQuq4+ysH9Y4ryWRQ7MAgUpzWR/0VY4lzIAnQJqFm7BjIlyuUSmy4
	 5TGWAZ9Qc3LaLhIHOFh+AlSnudSmgehPo0zTCjZswQ1cxyYirg8pV3+UkmiRMHO+Kv
	 MXXS49GQd3b93kbO+20O8etVpQBn5+PxWGll6GEqcO17+An2xefVwER4AtXSWCc4ze
	 tmEVqh6XwpVzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732DECCF9E3;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:09 +0100
Subject: [PATCH 01/12] dt-bindings: panel: Add Samsung SOFEF00 DDIC with
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4392; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=PkSSGm3j9T2gwK/ORpLvNpYx1PQpZQW7tYqo+X+7emI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnsrpk1sBezguEBNXI5RcmUmxcf9kW4kVGM80
 GeTQns4NgmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7KwAKCRBgAj/E00kg
 cgsBD/4olfy+nJCIugvB9e4JIW/M/22idrW086QUJeCN/wHktveiLpk6DzBsCIEpFy3ebIgs0Cr
 jluDoX/7ImNMF8szroWlFfOkpQkVw7cJWxS/VfEpiHPsDUkHAnmQDQmWRxqjSCat8h9giYGACOg
 TMi1W+eHOKjN1hJKobR/KbUwBsS9vpRQ1gEyS3K11W1r03O7tvE223hoML/rfc3izQgD52HK0WG
 /24BSUEMeDxqV0sukGBId+1QfHZkuPLuSsyY4zhfU776H7csY76lbuYBS1iamcT59c9Ofb7bat2
 Qs26MRZ0TCacV2MW37DcL5iBdFRqN0aLclEXMtSocrpfjRk6Frr0jZ+qGozqpqeKmvqlTkF/hK1
 tiCUoa9d5Z8ZZBGl+zJ3eSY+MBVTPfH871wrFXc7bmm9iL9OzPnnomWfe6LW6+1l9sSwqwxMpIT
 wo5P+kDjMTJzHbi/t61Ssx6+jQ84g76m3uyc4dJk62BJLlQv3BH99uFC/v17VYemxsrvbNNGiMq
 L5HIfIXXFJx3jy5M3xpvcdq4F9hUOFcOBLUXz9pv8CDpk1stTqqz4D30cwhuYO4PWfvsUfHMJr7
 ZOhB6BCANCrAH8j71Sr7btznPX6K8wHxPUIXRL2OOm1XB3/pjx8TkWNmb0c8vLX3/O73P61a74G
 HHpP24iTi8bhTcg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Basic description for S6E3FC2X01 DDIC with attached panels

 - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
 - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio

This panel has three supplies, while panel-simple-dsi is limited to one.
There is no user of this compatible, nor the compatible make sense.
Remove it from simple DSI panel definitions.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/panel-simple-dsi.yaml   | 25 ++-----
 .../bindings/display/panel/samsung,sofef00.yaml    | 83 ++++++++++++++++++++++
 2 files changed, 87 insertions(+), 21 deletions(-)

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
index 0000000000000..527a10e3b798e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
@@ -0,0 +1,83 @@
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
+  reset-gpios: true
+
+  port: true
+
+  vddio-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+  poc-supply:
+    description: POC regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vddio-supply
+  - vci-supply
+  - poc-supply
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

-- 
2.51.0



