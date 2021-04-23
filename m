Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9624E369C45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 23:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhDWV4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 17:56:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61827 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhDWV4Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 17:56:24 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Apr 2021 14:55:47 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Apr 2021 14:55:46 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Apr 2021 03:25:15 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id E4AC2212C3; Sat, 24 Apr 2021 03:25:13 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: [v2 1/2] dt-bindings: backlight: add DisplayPort aux backlight
Date:   Sat, 24 Apr 2021 03:25:03 +0530
Message-Id: <1619214904-10218-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619214904-10218-1-git-send-email-rajeevny@codeaurora.org>
References: <1619214904-10218-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for DisplayPort aux backlight driver.

Changes in v2:
- New

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
new file mode 100644
index 00000000..0fa8bf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DisplayPort aux backlight driver bindings
+
+maintainers:
+  - Rajeev Nandan <rajeevny@codeaurora.org>
+
+description:
+  Backlight driver to control the brightness over DisplayPort aux channel.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: dp-aux-backlight
+
+  ddc-i2c-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the system I2C controller connected to the DDC bus used
+      for the DisplayPort AUX channel.
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for backlight enable pin.
+
+  max-brightness: true
+
+required:
+  - compatible
+  - ddc-i2c-bus
+
+additionalProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "dp-aux-backlight";
+        ddc-i2c-bus = <&sn65dsi86_bridge>;
+        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+        max-brightness = <2047>;
+    };
+
+...
-- 
2.7.4

