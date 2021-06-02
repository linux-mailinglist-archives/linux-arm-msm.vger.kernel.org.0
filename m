Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2A8398DEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 17:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhFBPIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 11:08:48 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:2863 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhFBPIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 11:08:48 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 02 Jun 2021 08:07:05 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Jun 2021 08:07:03 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Jun 2021 20:36:38 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id E033B211A6; Wed,  2 Jun 2021 20:36:36 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3] dt-bindings: media: venus: Add sc7280 dt schema
Date:   Wed,  2 Jun 2021 20:36:32 +0530
Message-Id: <1622646392-27141-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a schema description for the venus video encoder/decoder on the sc7280.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../bindings/media/qcom,sc7280-venus.yaml          | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
new file mode 100644
index 0000000..b8574db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus Iris2 IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sc7280-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+      - const: iface
+      - const: vcodec_core
+      - const: vcodec_bus
+
+  iommus:
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  video-firmware:
+    type: object
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - video-decoder
+  - video-encoder
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/qcom,videocc-sc7280.h>
+
+        venus: video-codec@aa00000 {
+                compatible = "qcom,sc7280-venus";
+                reg = <0x0aa00000 0xd0600>;
+                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+                clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
+                         <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
+                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+                         <&videocc VIDEO_CC_MVS0_CORE_CLK>,
+                         <&videocc VIDEO_CC_MVS0_AXI_CLK>;
+                clock-names = "core", "bus", "iface",
+                              "vcodec_core", "vcodec_bus";
+
+                power-domains = <&videocc MVSC_GDSC>,
+                                <&videocc MVS0_GDSC>;
+                                <&rpmhpd SC7280_CX>;
+                power-domain-names = "venus", "vcodec0", "cx";
+
+                interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>
+                                <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
+                interconnect-names = "cpu-cfg", "video-mem";
+
+                iommus = <&apps_smmu 0x2180 0x20>,
+                         <&apps_smmu 0x2184 0x20>;
+
+                memory-region = <&video_mem>;
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                };
+
+                video-firmware {
+                        iommus = <&apps_smmu 0x21a2 0x0>;
+                };
+        };
-- 
2.7.4

