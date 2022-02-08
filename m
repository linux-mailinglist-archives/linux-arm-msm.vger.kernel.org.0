Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072734ADE81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 17:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383448AbiBHQml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 11:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349731AbiBHQmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 11:42:40 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768D5C061578
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 08:42:39 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id k1so15307760wrd.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iirFYwI123MfHC7aSLTWZrlvayTl2d/ajLq6G4r/EJ8=;
        b=WR4FACdgoP4hEyrgtoj3ka4kb9i+cpSadAajW0tSivFV/LE5kcgvZcmQajpGlqRBPj
         DkBIbgAgMo/AgYwbhTah15HoeRLD8V//nd/D9DJqadUVXQWiZ1/ARj6OAse65dWhRlgP
         ceRTOWCgql2vWtC8fENjutGzPz2etjeDro1wUO9zgepyIHMSizVMcJryP832SS1xW2NS
         73qBStaUCSxXVyPbjTcdHdh5sVh5K35/8aIR+JY2oE8W044OU/k9GLqnEMHYtdwdmYFr
         lnks4bT7gx2cbfzu1HjdOyCDzBhtItVCaV5TOoEwY+MBTTuXdybQN7LYIw1RdkRO+mK9
         VJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iirFYwI123MfHC7aSLTWZrlvayTl2d/ajLq6G4r/EJ8=;
        b=2IIL4tcZVP0SpttI96td3+uMkXHF1cPtpIU4MglasLThNjOBgyblrs3eUKI9gyPbFQ
         JLc6GNnUkBN2SWBhkzL4YCFSMjl0NKXj3SGdNBVMAz8bobEGklKtFSQyTbhwrv+BxkBA
         lW2R9z4rLpw5Hts4C0sNSk84tA70lZgb0jplouLT4uZdVVzk4oHaNF8kPxPB95LU3Hhv
         r16N/NPT5tUkZRhKg0Lc+0p2tywJ6Ptde8ST2y74BSL3VyFC2iAkqE4mX1Q74ASsDf+7
         0VKm8p38K5TOBR3aDo0YBLLhRJJ6yi2ijSgUo03uO8I/N9ELja2XoAY4q9sZCik2aYQr
         8rmw==
X-Gm-Message-State: AOAM530w/8j6yd0WLcBuqpisdX5t7ek0AJzo2wg54q4UAkdi+LjW3Rqv
        56cXNzaCtVJMNpWk5OArQZmJvA==
X-Google-Smtp-Source: ABdhPJyVzt4XiOJDg++/YcaRhfIfLWJvT5Oyvh0T1IWswuZ6gzE9M4Q0v+oTJAQ99GBfCMXunfdWrw==
X-Received: by 2002:a05:6000:3cf:: with SMTP id b15mr4370978wrg.82.1644338557914;
        Tue, 08 Feb 2022 08:42:37 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id o27sm2853202wms.4.2022.02.08.08.42.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Feb 2022 08:42:37 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, dmitry.baryshkov@linaro.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings
Date:   Tue,  8 Feb 2022 17:42:32 +0100
Message-Id: <1644338552-14426-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644338552-14426-1-git-send-email-loic.poulain@linaro.org>
References: <1644338552-14426-1-git-send-email-loic.poulain@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema for DPU device
tree bindings

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: no change

 .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
 1 file changed, 214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
new file mode 100644
index 00000000..8766b13
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-qcm2290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for QCM2290 target
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
+  and DPU are mentioned for QCM2290 target.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcm2290-mdss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+  ranges: true
+
+  interconnects:
+    items:
+      - description: Interconnect path specifying the port ids for data bus
+
+  interconnect-names:
+    const: mdp0-mem
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,qcm2290-dpu
+
+      reg:
+        items:
+          - description: Address offset and size for mdp register set
+          - description: Address offset and size for vbif register set
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        items:
+          - description: Display AXI clock from gcc
+          - description: Display AHB clock from dispcc
+          - description: Display core clock from dispcc
+          - description: Display lut clock from dispcc
+          - description: Display vsync clock from dispcc
+
+      clock-names:
+        items:
+          - const: bus
+          - const: iface
+          - const: core
+          - const: lut
+          - const: vsync
+
+      interrupts:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      operating-points-v2: true
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI. Each output port contains an endpoint that
+          describes how it is connected to an external interface.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU_INTF1 (DSI1)
+
+        required:
+          - port@0
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - clocks
+      - interrupts
+      - power-domains
+      - operating-points-v2
+      - ports
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    mdss: mdss@5e00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,qcm2290-mdss", "qcom,mdss";
+        reg = <0x05e00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interconnects = <&mmrt_virt MASTER_MDP0 &bimc SLAVE_EBI1>;
+        interconnect-names = "mdp0-mem";
+
+        iommus = <&apps_smmu 0x420 0x2>,
+                 <&apps_smmu 0x421 0x0>;
+        ranges;
+
+        mdss_mdp: mdp@5e01000 {
+                compatible = "qcom,qcm2290-dpu";
+                reg = <0x05e01000 0x8f000>,
+                      <0x05eb0000 0x2008>;
+                reg-names = "mdp", "vbif";
+
+                clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                         <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                         <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                         <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                         <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                clock-names = "bus", "iface", "core", "lut", "vsync";
+
+                operating-points-v2 = <&mdp_opp_table>;
+                power-domains = <&rpmpd QCM2290_VDDCX>;
+
+                interrupt-parent = <&mdss>;
+                interrupts = <0 IRQ_TYPE_NONE>;
+
+                ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                                reg = <0>;
+                                dpu_intf1_out: endpoint {
+                                        remote-endpoint = <&dsi0_in>;
+                                };
+                        };
+                 };
+         };
+...
-- 
2.7.4

