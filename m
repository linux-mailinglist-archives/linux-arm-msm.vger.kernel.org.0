Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5529A806A4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2019 16:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfHCOUp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Aug 2019 10:20:45 -0400
Received: from onstation.org ([52.200.56.107]:57276 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727722AbfHCOUn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Aug 2019 10:20:43 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 201E23E951;
        Sat,  3 Aug 2019 14:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1564842042;
        bh=UGdvjCtm0gJf0znXNHCZZTla14pPv6AwHgdu6vRzhNM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rWmNP9sodPSUbeN0x2CtOVp4FDq8sMEf0gexPHbP/hJY8zswmkCuAI09i+KgmRp39
         Z045JmRzdrz03k7OctsdCME27B4OrH5MTP6VzSFMP4PiNy8eX/oGW3D1yQEw1XbWay
         qR2Xcb4EUdCqPaXVE2KA+tmMlhKhwrPsRbA4X5rA=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v4 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
Date:   Sat,  3 Aug 2019 10:20:21 -0400
Message-Id: <20190803142026.9647-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803142026.9647-1-masneyb@onstation.org>
References: <20190803142026.9647-1-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for the On Chip Memory (OCMEM) that is present
on some Qualcomm Snapdragon SoCs.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v3
- add ranges property
- remove unnecessary literal block |
- add #address-cells and #size-cells to binding
- rename path devicetree/bindings/sram/qcom/ to devicetree/bindings/sram/ since
  this is the only qcom binding in the sram namespace. That was a holdover from
  when I originally put this in the soc namespace.

Changes since v2:
- Add *-sram node and gmu-sram to example.

Changes since v1:
- Rename qcom,ocmem-msm8974 to qcom,msm8974-ocmem
- Renamed reg-names to ctrl and mem
- update hardware description
- moved from soc to sram namespace in the device tree bindings

 .../devicetree/bindings/sram/qcom,ocmem.yaml  | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml

diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
new file mode 100644
index 000000000000..1bb386fffa01
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sram/qcom/qcom,ocmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: On Chip Memory (OCMEM) that is present on some Qualcomm Snapdragon SoCs.
+
+maintainers:
+  - Brian Masney <masneyb@onstation.org>
+
+description: |
+  The On Chip Memory (OCMEM) is typically used by the GPU, camera/video, and
+  audio components on some Snapdragon SoCs.
+
+properties:
+  compatible:
+    const: qcom,msm8974-ocmem
+
+  reg:
+    items:
+      - description: Control registers
+      - description: OCMEM address range
+
+  reg-names:
+    items:
+      - const: ctrl
+      - const: mem
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  "^.+-sram$":
+    type: object
+    description: A region of reserved memory.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      ranges:
+        maxItems: 1
+
+    required:
+      - reg
+      - ranges
+
+examples:
+  - |
+      #include <dt-bindings/clock/qcom,rpmcc.h>
+      #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
+
+      ocmem: ocmem@fdd00000 {
+        compatible = "qcom,msm8974-ocmem";
+
+        reg = <0xfdd00000 0x2000>,
+              <0xfec00000 0x180000>;
+        reg-names = "ctrl",
+                    "mem";
+
+        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+                 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
+        clock-names = "core",
+                      "iface";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        gmu-sram@0 {
+                reg = <0x0 0x100000>;
+                ranges = <0 0 0xfec00000 0x100000>;
+        };
+      };
-- 
2.21.0

