Return-Path: <linux-arm-msm+bounces-49041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF7A40AD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 18:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6C277AC431
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 17:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A3020B1F9;
	Sat, 22 Feb 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Aqa+ragB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76C201034;
	Sat, 22 Feb 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740247097; cv=none; b=R/BhRtujKj8CxNxLMZIdb+aF3/M4OSY4ZdNp5mgFS7/8jKuQlRTyCxYF9yAsKEvp5cx+HyI6hx35bBqyyFjeeMgHd/y///MjaTDSvHuqe0T3ZKlxfn/HSAUAIUVVQ5pryHTA9jkhd8QqrJNkqisqaB4b0pHvOUJBcUclhVPlTLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740247097; c=relaxed/simple;
	bh=uOTZ6w5F/QVUfzYDDHW1oSDwuDIcbKSfDmjsbQ08n8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9YD0D/y8d0Z2e2/WnYIK3VWJozorZPkjYZD2MtM3rZ1UPBvKz1foDPodNBI1uHUtceDfSSKj4z0eEgswMbUsi+DD5KLHfHcefx/aedqNA+NO4tYWq8UoBAB3AZhCmQploO+Q4dGlAILDFCl2dXfTNz9mX5JCJhrYUIweVJYUDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Aqa+ragB; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740247094; bh=uOTZ6w5F/QVUfzYDDHW1oSDwuDIcbKSfDmjsbQ08n8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Aqa+ragBgDTY6nh25HY4HOXyRN/U9dnvsIBfc5tbSsFw96cjRzbnZki/Gi58y8bVu
	 lL3wvitX2CgAVr9bOWw4l+XCDb5b++Be5gWJ2ZonJNi88K/ZiPecvGrrNz/8GlHIGk
	 rHxulfQhbDXf0By0e1TsGEDtc/ae/RPNIFSbRxCI=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 18:58:05 +0100
Subject: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
In-Reply-To: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=uOTZ6w5F/QVUfzYDDHW1oSDwuDIcbKSfDmjsbQ08n8M=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnuhAy2zK2gofuVwCEFjaW4Dk7ucYCGIT+QxvYi
 VwdQ87xbJOJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7oQMgAKCRBy2EO4nU3X
 VjspD/0ZDU4ZmU2PbTqUxEx4jwWkjKRaUTjbndEjvWc2jRg2rIzDMFiKRlhpF2P1NpsW1VeTnRm
 TwRq9gGnXotpqI7HC5HM+UltpxGIVyPCJp/SAt0NpDrmmiZp8z5Oqak/kAFDOijxT42gi+s98nN
 rk/ObWlZRtUBHOJNlBvN8VOTqC5UV+qXvOZNh0XtAiQg7cHhxPkaNSv/Xfhfqdo1oxRq0WUpx/J
 rJ+JTJBgwBQQRpEMFwgjQQT+teggx3DbxUzFatL9KZq/QSXc2mZ/ZGufHhl3u/ysvOplFJQtxeZ
 /BbAWPCXSK1yGixEX9WLfM1W6IuIM2pTn6EWK1rcbkiLDUY4kiRLY2HSFqOlhB48JWHfLI+Gqo6
 UGm1SN+W2rgKrcOBNA76ZRbspwU53/ggGKSXu436XM3go+qg3UdcZmR6qVJji16OvtRnG5pySs5
 zxcOhaP4XqjSA89A1OI9YmT/zkt8X54ppk9hKl4GmFf2W/RGv9DCicbo4oZ5w/9cv9Q+qNISWff
 MJGvV5jZx2BQVzADYJphc2XhSXaf0uj+5rYKIhVnHUXftT8S7un4L+OeYU0ueXTgcx4PsBmz7gn
 IyjDNE4xCIijXJJZ+GHAZpc9e38gKeLXvxYV4TieZsuGtkDqTvlNCCTXYT/0V9LKACQCG4tJcgY
 fb0TU7eXXM7UXdg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Himax HX83112B is a display driver IC used to drive LCD DSI panels.
Describe it and the Fairphone 3 panel from DJN using it.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
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
+      const: djn,fairphone-fp3-panel
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
+            compatible = "djn,fairphone-fp3-panel";
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


