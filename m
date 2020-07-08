Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1935921801B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 09:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgGHG77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 02:59:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgGHG76 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 02:59:58 -0400
Received: from localhost.localdomain (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82DC22075B;
        Wed,  8 Jul 2020 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594191597;
        bh=pH9hCqHfdlU+w6Ab8i9hBud2GdbD3VXacsj5zyagtEA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VEwB3wC3ugbPvMrlH8chv3kwNGZtAFl+rA/nasLgzB4RQv1n9Zup2+2Mwxt6BztS4
         9LvQ4t+rXLO0ZM68bddWE6Uk9ZfmZm4uY/3y6abKNH95nSSiv+sqKMO1qxBve0edsl
         6v1n/dJfpfl8VlQf2UczKNqD4jVNl+If2N3Mostc=
From:   Vinod Koul <vkoul@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH v4 2/4] dt-bindings: display: bridge: Add documentation for LT9611
Date:   Wed,  8 Jul 2020 12:29:22 +0530
Message-Id: <20200708065924.59257-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708065924.59257-1-vkoul@kernel.org>
References: <20200708065924.59257-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lontium LT9611 is a DSI to HDMI bridge which supports 2 DSI ports
and I2S port as input and one HDMI port as output

Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../display/bridge/lontium,lt9611.yaml        | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
new file mode 100644
index 000000000000..d60208359234
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9611 2 Port MIPI to HDMI Bridge
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  The LT9611 is a bridge device which converts DSI to HDMI
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt9611
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  vdd-supply:
+    description: Regulator for 1.8V MIPI phy power.
+
+  vcc-supply:
+    description: Regulator for 3.3V IO power.
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description: |
+          Primary MIPI port-1 for MIPI input
+
+        properties:
+          reg:
+            const: 0
+
+        patternProperties:
+          "^endpoint(@[0-9])$":
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint:
+                $ref: /schemas/types.yaml#/definitions/phandle
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        description: |
+          Additional MIPI port-2 for MIPI input, used in combination
+          with primary MIPI port-1 to drive higher resolution displays
+
+        properties:
+          reg:
+            const: 1
+
+        patternProperties:
+          "^endpoint(@[0-9])$":
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint:
+                $ref: /schemas/types.yaml#/definitions/phandle
+
+        required:
+          - reg
+
+      port@2:
+        type: object
+        description: |
+          HDMI port for HDMI output
+
+        properties:
+          reg:
+            const: 2
+
+        patternProperties:
+          "^endpoint(@[0-9])$":
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint:
+                $ref: /schemas/types.yaml#/definitions/phandle
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+  - vcc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c10 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hdmi-bridge@3b {
+        compatible = "lontium,lt9611";
+        reg = <0x3b>;
+
+        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
+
+        vdd-supply = <&lt9611_1v8>;
+        vcc-supply = <&lt9611_3v3>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            lt9611_a: endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            lt9611_b: endpoint {
+              remote-endpoint = <&dsi1_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+            lt9611_out: endpoint {
+              remote-endpoint = <&hdmi_con>;
+            };
+          };
+        };
+      };
+    };
+
+...
-- 
2.26.2

