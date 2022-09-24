Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4487E5E8C7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbiIXMgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbiIXMgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:36:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E15EBD52
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:19 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o2so4104596lfc.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=M1hSo2r2W5YbubBUvaH3XkVCRObALWQ71kucoKWc7e4=;
        b=o3I2+esph7s1tV1TFq2U+YzvnLV7nG9v/Dy4247PckLvMDY2uHuQ+e1AmHzlOLaYJt
         jHAW2s7FHVerVFT99d8lh22WcVYNzEE4tLJ98PdKRL5mMOpB0Op3PylcwEvzj5YmgVgV
         UTxJ0MMKhS+1LFR1Q0TElFkrWLicUctow/FSLnskp+d92gLFwzG2Zbmr3LfZSgw3m0ug
         4+0K3cdbO4ZyoHAHEYJlqgkakUPka8sNQCA9++J4RLZ/OgnsXHIdkHVm293E/MBhxi1w
         jpWSYh2lUNwtBwU2TJyfAvanFumUB5x1riGlSBRKPM+2PugJCWaEjncCr5XLn+HQUDY0
         sP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=M1hSo2r2W5YbubBUvaH3XkVCRObALWQ71kucoKWc7e4=;
        b=n5o0eYJulhmMK+NVxrSSWfYBEw1F6nSQevh2EGgwJfISNqx33LhmopolWS0ubnMnaa
         z1aaoD3D1DePcjn+N4jKIymVs9Wa7rkI8EnvGPM8pumYTCPEcpmi2iN/tn/Jo/WdZBBP
         zY2+06n/x/ReOCrLkqWgMTiGTyHHTFoVPJq3jhFVXftaxICY7fMMEZznVqQLadc/iL9m
         GJoUNqu84Q6gyZ5ue6Xj/CQIHM9SFZ8y/APFTlyzLwdncEFlj6pqPMwTG6wktpeFqvic
         nZzT+k/yBbFBGtTrq7R+FemBPL0JPzaqyokteLySiMfodVZBb/nhU7kyVmDmVibgZiKp
         TSvA==
X-Gm-Message-State: ACrzQf1eH2M58v+ajxsPZhOhH07nrdzCNWuj5jIUfjJ2edmNT3oQjdPA
        vQwSOb1uPEr1DG7RJai3XRHqUA==
X-Google-Smtp-Source: AMsMyM71ic8MWkaBn5vgzI5NMULmi1m32k2z7sbPNgIuusqJuLue7hEevSnJEgUPueTz1A2NZrX0fw==
X-Received: by 2002:a05:6512:6c3:b0:49a:d227:1b5b with SMTP id u3-20020a05651206c300b0049ad2271b5bmr4971907lff.386.1664022978540;
        Sat, 24 Sep 2022 05:36:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:36:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v8 07/12] dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
Date:   Sat, 24 Sep 2022 15:36:06 +0300
Message-Id: <20220924123611.225520-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to make the schema more readable, split dpu-sc7280 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7280.yaml      | 162 ------------------
 .../bindings/display/msm/qcom,sc7280-dpu.yaml |  98 +++++++++++
 .../display/msm/qcom,sc7280-mdss.yaml         | 130 ++++++++++++++
 3 files changed, 228 insertions(+), 162 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
deleted file mode 100644
index 01ff88c06c51..000000000000
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ /dev/null
@@ -1,162 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/dpu-sc7280.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Display DPU dt properties for SC7280
-
-maintainers:
-  - Krishna Manikandan <quic_mkrishn@quicinc.com>
-
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7280.
-
-$ref: /schemas/display/msm/mdss-common.yaml#
-
-properties:
-  compatible:
-    const: qcom,sc7280-mdss
-
-  clocks:
-    items:
-      - description: Display AHB clock from gcc
-      - description: Display AHB clock from dispcc
-      - description: Display core clock
-
-  clock-names:
-    items:
-      - const: iface
-      - const: ahb
-      - const: core
-
-  iommus:
-    maxItems: 1
-
-  interconnects:
-    maxItems: 1
-
-  interconnect-names:
-    maxItems: 1
-
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    $ref: /schemas/display/msm/dpu-common.yaml#
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
-    properties:
-      compatible:
-        const: qcom,sc7280-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: vbif
-
-      clocks:
-        items:
-          - description: Display hf axi clock
-          - description: Display sf axi clock
-          - description: Display ahb clock
-          - description: Display lut clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: bus
-          - const: nrt_bus
-          - const: iface
-          - const: lut
-          - const: core
-          - const: vsync
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
-    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sc7280.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-
-    display-subsystem@ae00000 {
-         #address-cells = <1>;
-         #size-cells = <1>;
-         compatible = "qcom,sc7280-mdss";
-         reg = <0xae00000 0x1000>;
-         reg-names = "mdss";
-         power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
-         clocks = <&gcc GCC_DISP_AHB_CLK>,
-                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
-         clock-names = "iface",
-                       "ahb",
-                       "core";
-
-         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-         interrupt-controller;
-         #interrupt-cells = <1>;
-
-         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
-         interconnect-names = "mdp0-mem";
-
-         iommus = <&apps_smmu 0x900 0x402>;
-         ranges;
-
-         display-controller@ae01000 {
-                   compatible = "qcom,sc7280-dpu";
-                   reg = <0x0ae01000 0x8f000>,
-                         <0x0aeb0000 0x2008>;
-
-                   reg-names = "mdp", "vbif";
-
-                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-                            <&gcc GCC_DISP_SF_AXI_CLK>,
-                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                   clock-names = "bus",
-                                 "nrt_bus",
-                                 "iface",
-                                 "lut",
-                                 "core",
-                                 "vsync";
-
-                   interrupt-parent = <&mdss>;
-                   interrupts = <0>;
-                   power-domains = <&rpmhpd SC7280_CX>;
-                   operating-points-v2 = <&mdp_opp_table>;
-
-                   ports {
-                           #address-cells = <1>;
-                           #size-cells = <0>;
-
-                           port@0 {
-                                   reg = <0>;
-                                   dpu_intf1_out: endpoint {
-                                           remote-endpoint = <&dsi0_in>;
-                                   };
-                           };
-
-                           port@1 {
-                                   reg = <1>;
-                                   dpu_intf5_out: endpoint {
-                                           remote-endpoint = <&edp_in>;
-                                   };
-                           };
-                   };
-         };
-    };
-...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
new file mode 100644
index 000000000000..924059b387b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc7280-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SC7280
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc7280-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sc7280-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        power-domains = <&rpmhpd SC7280_CX>;
+        operating-points-v2 = <&mdp_opp_table>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&edp_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
new file mode 100644
index 000000000000..d4ac2d5d13fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc7280-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7280 Display MDSS
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SC7280.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc7280-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ahb
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    maxItems: 1
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc7280.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,sc7280-mdss";
+        reg = <0xae00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface",
+                      "ahb",
+                      "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+        interconnect-names = "mdp0-mem";
+
+        iommus = <&apps_smmu 0x900 0x402>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sc7280-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&gcc GCC_DISP_SF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus",
+                          "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+            power-domains = <&rpmhpd SC7280_CX>;
+            operating-points-v2 = <&mdp_opp_table>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf5_out: endpoint {
+                        remote-endpoint = <&edp_in>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.35.1

