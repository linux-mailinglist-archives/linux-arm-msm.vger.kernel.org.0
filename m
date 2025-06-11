Return-Path: <linux-arm-msm+bounces-61014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 910B6AD5C4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 18:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673363A3F99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6844217730;
	Wed, 11 Jun 2025 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="AZBnIro8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A81FAC48;
	Wed, 11 Jun 2025 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659643; cv=none; b=UgVx/GL29tl7s9W1n7Os3/4O4tl3TFYHSHX4xsut5Wn6NwpuOQlHqR0ANDMEYNRIi+2ISXr/ZXe9dFkoflliWTUCrHJyPiRmSdWrvqY+vQiPnc+Su0EMCD0AIYDe17FKzjkRlUYBCnA8vCZfQbadJO5d/ke5/VN7w6PHoLBRTnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659643; c=relaxed/simple;
	bh=t7hdxYz+chmbcKWjNALyrNVpKeDqXfdchbiPUCyhJ8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXFX1+sz3NIDUW7c1hj5nfbpw1UsImVqlc210Rl27fsvXEmkdn/AMrk9eu9uzR+1ELlhc3Ni0oSY4B9ruASyQYa44BGi42ARA1QAfPn4zi/enxTst8YWZO/ixwvZBZOpl1D72BLGlCEacA5jqcgoBUCIl6JUNFF59NaZ9gAxQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=AZBnIro8; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749659638; bh=t7hdxYz+chmbcKWjNALyrNVpKeDqXfdchbiPUCyhJ8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AZBnIro8yt85w69usmIHTSxeHi32OmkcAChW3N36BpWTvyaydf0o5fiaksWUuKohL
	 qXBGa6PgmlI0y8iXPifx/4KA554k4fdooCi458sgOMM9I9AvLSn5NxJPEo8FnPFt+T
	 GOHfkcVofS7D2+1Nkk6UQp9cICIw4P08in1UKixY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 11 Jun 2025 18:33:16 +0200
Subject: [PATCH v4 2/4] dt-bindings: display: panel: Add Himax HX83112B
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-fp3-display-v4-2-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2316; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=t7hdxYz+chmbcKWjNALyrNVpKeDqXfdchbiPUCyhJ8E=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/yh5K+T861P0/TUJU7Q/RAQB+B5GNaj9ppv
 EWyzeadN1eJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmv8gAKCRBy2EO4nU3X
 VvoOEACW0QL96gtaDGYOCCf4z/uZc1aXTxshqI8dINxhfgDT6kd2AAh0Kx+/WnePSQuvKcxYlMq
 TKSRodwTj4DVJfTbGDSLiqODQFL8ruCQcGP2xs8BMWFVwBQ2IY1uqn2sNqnCV3G87Z+5z4aU72T
 CRlZYcE+Qi4V+Zg03awUWTljt/pY/VlmFh/pVq40qSXswrSzHn5ZhE6JUfLTLhfNguO7BXYHoqt
 oTCnVRHiSzh4h+npAuB857BJU00+q63kbRCEY4RcBfOXBEOZwJN3OCMtAH9mf4vJYXauG7ZMU6k
 N2NP6ljB0JCfXilAe+X5SUFoNaOSI3FzIq4FJyJEyVupjGWF9r9zH8eoa77C3Vy7rnUGU7Wxn2M
 0+YAKcrsFPFG7VqBoGfaFhQFhfKefC2Lg1xOT6JYDrRX4mbCf7BEC7ktmFLALovXMXM9ralB4CY
 F04MjnlkRkBkJlBrFQrx0scdvYw9QTvIpUQhtqJFLYKWpkGB39pcLEtEfTYtnlD76wvpqe6w33X
 9lGArsT4zJkV3mp7+KLCFpDVPlJ1yDEidR1ULcnc8pxe1pbTgRgVG+EV7eL+F400KHP3vPID2F3
 pmLXGiKOgf1apiAKlJPd5YF4tgMvKuDvFfue2hofC5fFblVCfvVYYOH2W8czu6q59+v9exJc1NC
 h15Hr0pXHgR7VcQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Himax HX83112B is a display driver IC used to drive LCD DSI panels.
Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN using
it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/display/panel/himax,hx83112b.yaml     | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e58bb3d45331490e0ae2764aa341d3c3391af550
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83112B-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca@lucaweiss.eu>
+
+description:
+  The Himax HX83112B is a generic DSI Panel IC used to control
+  LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: djn,98-03057-6598b-i
+
+  reg:
+    maxItems: 1
+
+  iovcc-supply:
+    description: I/O voltage rail
+
+  vsn-supply:
+    description: Positive source voltage rail
+
+  vsp-supply:
+    description: Negative source voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - iovcc-supply
+  - vsn-supply
+  - vsp-supply
+  - port
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
+            compatible = "djn,98-03057-6598b-i";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+
+            iovcc-supply = <&pm8953_l6>;
+            vsn-supply = <&pmi632_lcdb_ncp>;
+            vsp-supply = <&pmi632_lcdb_ldo>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.49.0


