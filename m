Return-Path: <linux-arm-msm+bounces-49386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B1A44E90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 671F8189F4DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 21:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07D52135DA;
	Tue, 25 Feb 2025 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="6vG/ZXMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0991DD889;
	Tue, 25 Feb 2025 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518103; cv=none; b=bTiU9ANjZWhfc5VejIIQqTMts1rfkPuThsfDnN8tbryfM+/2Q6/ZICvgrl27wor510XXFrRhyRZHI2mQqo/QkCjP00BrG/Jy3sy4/7zz6eSvEblov4O4nDbQzPuOahtKFY6M/AN6xmDOcdI2EN7217+mYjdg5g8hUzMaRoo7PFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518103; c=relaxed/simple;
	bh=LdSZ4472HWowhbbUl0jFJ+2G25xGFcEEysNTZYR49/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jqhHHe7/hc+ljbLZAhphjMYBhAZpnFY7V9IOoiuDD4N+6mOCg2dJ/9l0KrCmaXeCzKMQSISkete8lCzrThY+DBmyhWPhKa7v3WCXoHbwGWQjrtWVSo7qf10GJh6NZgribf0Nx+yG98xvkmkEmLlXxu+lIVTIcRaxwuwF9IBeq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=6vG/ZXMn; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740518093; bh=LdSZ4472HWowhbbUl0jFJ+2G25xGFcEEysNTZYR49/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=6vG/ZXMnNjfoxEJzIskLk6oRi3uepub2jPhz+z4ahRbyr6+JBWqMp1KP9V5tVh16y
	 5ZqEjPHQGARfdL/xF7MoGJOonOHJNUSC5Dj43TGuoejeG5kRZSV39Dn/bj7fZOrljN
	 5gyTxrpzhymLk+HsukJCxt/4+QwvvayegwUOlnv0=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 25 Feb 2025 22:14:30 +0100
Subject: [PATCH v2 2/4] dt-bindings: display: panel: Add Himax HX83112B
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
In-Reply-To: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
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
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=LdSZ4472HWowhbbUl0jFJ+2G25xGFcEEysNTZYR49/E=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnvjLJ/PdbuH0/bpKrqFb4TooGBfDRlKdlKo8tv
 ajUYSxwmkOJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ74yyQAKCRBy2EO4nU3X
 VmAiEACExQx8piZN+68FzJclFiPj+KLqEehDLZy+wWGXF5iKaj5yQQFQJm9C1AoF8rcvZDkBdYx
 L0R6InVum2CMXOpG5ZX80VTZ8DzvFtTjwkfnrSOnLo7oCILSWTnfncPdK/qzLEI5dJh7W5fj71U
 lzRBinQ0tY7dWhJh/BnWqBF5plJBqvCTygn1ntIsh6gG3SB3XQX0TKgAoY44AQbkSnkQPRkOsaQ
 zYtetfSZMdlig3pqPkkdkLBDyE/aw0OObq6nNiExdbggUKPzkeJKAeegFxsGH/ruqaW0kqqOXKC
 qB1vGE3G5zjmH6defC8qMwbRidhlsgLDtFXQEQr9C4GZ/E4DPm3LT17sjSptUjqDSHS9JK1gWdB
 oroXArpX44Evgj4C1jTE6VdnVk4Q+wEMoSLuJh1NkVK3aEnvLuYz1xfAW23bXIRLdHyn8PME/Bj
 pMI7HM1fyuXemU1Hmz0svB5hTSfvS7Lw90LTQBhskK0OOdYMlwquLrrCShs8X9nKQvw6SkT/ZIt
 rNXdONbPDQuzolIkg1y7JvHUuWTaEPzDKrlVqdzaiXGGpvBSAAp1GeD0nFl63LfhZfqRIAcTiIS
 T0/IugVjCtwle4wE4e8XmcIrtFzZW1YOs+4m0Ep433ckWgZSrcYTiCXn8LtLbx41uFbNBZfVnuv
 ig/WDUMs+D1mRfw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Himax HX83112B is a display driver IC used to drive LCD DSI panels.
Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN using
it.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..54c555c18bbe7656ec625b20e28a53fde5fe578b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -0,0 +1,75 @@
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
+  port: true
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
2.48.1


