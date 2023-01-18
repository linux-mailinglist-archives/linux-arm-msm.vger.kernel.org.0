Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6478567124E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjAREMv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjAREMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:12:50 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3898E53FAF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:48 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id mg12so7932977ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU2NjBKlsL12+iFHvXNXZs2NTtyWQGk00mwUsNeISCQ=;
        b=OJc0RjiWIFQyakGYlMw2QRSjIoKQtkThByGt0TCVS+YMdFjCxTUIeDWUNB1rWl4ClK
         GUmyjeP/3cyoQkR7CYJYnbIQ9O2F4X5WdN1+R9qsYBOiH5ZmfpVnwjRxCs/h41x32w8P
         iTvK6u6l7u2ntiY3bZs178Im1mkNaDI1LarmeeV0ob/IUQ11IQEgfGJox7iA/SL0whE2
         tlJXPO4IUiDjmbRDs0/ophNZtdfH49ZwgOUZ0+o8BlhQJY9p+o+bL3/SvgYN7F+nZ+uP
         8jYFT4M3w8biJehEs6nu0zl0BpYvYo9KWRbrOji61b3oMBUVqy8Qv5Y/T22Ztb0fS4i5
         QZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IU2NjBKlsL12+iFHvXNXZs2NTtyWQGk00mwUsNeISCQ=;
        b=nErlkV6AXfkIYDhey1wUgB9+RyN/hoK4d/mpV1ZoYGMOlpN6mNYDUBt86mor1CG2iS
         kSjn0vqXxEapbb3mFSPeXwAO8laDWLZL906rbJ8N8eVKrO1Aa99qAOgfFOMzF6QcWS4H
         nl7OOXD2Nwo7Wa0gBECEaBFOl4EcrHtEIYknxbOUL4eH1K3hir2H937GYeq7JP0fu2J5
         hTKK69X9WwO7kZOHkEznWifw9KfA+1f0523VxE+/pHsODMwfGc/ReAgW8z0nbQCJC2uU
         16UEvOQCtKQOjgluN7WMuws8k8fZNrZUTsTtxLT8swV9mCBJI2oCNdB88sLbMotVXE/u
         j3wA==
X-Gm-Message-State: AFqh2kr8zZO2zyjjuWwIHeDgZSj1xO62VK4lgZnHIa8xawDQMzJ66XTT
        WoFLU5gzMVmZmDZA4M8e4RQtpg==
X-Google-Smtp-Source: AMrXdXueqp2n9jN4WEakWTpyNhhmSWCX/x4KZyvF1G3cgWs4kHWJOj4wIIdZ1BpzkfwL51EJozaDUw==
X-Received: by 2002:a17:907:8b97:b0:84d:39ba:368b with SMTP id tb23-20020a1709078b9700b0084d39ba368bmr6296162ejc.75.1674015166789;
        Tue, 17 Jan 2023 20:12:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:12:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 01/11] dt-bindings: display/msm: convert MDP5 schema to YAML format
Date:   Wed, 18 Jan 2023 06:12:33 +0200
Message-Id: <20230118041243.1720520-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
 - MSM8996 has additional "iommu" clock, define it separately
 - Add new properties used on some of platforms:
   - interconnects, interconnect-names
   - iommus
   - power-domains
   - operating-points-v2, opp-table

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
 2 files changed, 138 insertions(+), 132 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
deleted file mode 100644
index 65d03c58dee6..000000000000
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ /dev/null
@@ -1,132 +0,0 @@
-Qualcomm adreno/snapdragon MDP5 display controller
-
-Description:
-
-This is the bindings documentation for the MDP5 display
-controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
-
-MDP5:
-Required properties:
-- compatible:
-  * "qcom,mdp5" - MDP5
-- reg: Physical base address and length of the controller's registers.
-- reg-names: The names of register regions. The following regions are required:
-  * "mdp_phys"
-- interrupts: Interrupt line from MDP5 to MDSS interrupt controller.
-- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
--   * "bus"
--   * "iface"
--   * "core"
--   * "vsync"
-- ports: contains the list of output ports from MDP. These connect to interfaces
-  that are external to the MDP hardware, such as HDMI, DSI, EDP etc (LVDS is a
-  special case since it is a part of the MDP block itself).
-
-  Each output port contains an endpoint that describes how it is connected to an
-  external interface. These are described by the standard properties documented
-  here:
-	Documentation/devicetree/bindings/graph.txt
-	Documentation/devicetree/bindings/media/video-interfaces.txt
-
-  The availability of output ports can vary across SoC revisions:
-
-  For MSM8974 and APQ8084:
-	 Port 0 -> MDP_INTF0 (eDP)
-	 Port 1 -> MDP_INTF1 (DSI1)
-	 Port 2 -> MDP_INTF2 (DSI2)
-	 Port 3 -> MDP_INTF3 (HDMI)
-
-  For MSM8916:
-	 Port 0 -> MDP_INTF1 (DSI1)
-
-  For MSM8994 and MSM8996:
-	 Port 0 -> MDP_INTF1 (DSI1)
-	 Port 1 -> MDP_INTF2 (DSI2)
-	 Port 2 -> MDP_INTF3 (HDMI)
-
-Optional properties:
-- clock-names: the following clocks are optional:
-  * "lut"
-  * "tbu"
-  * "tbu_rt"
-
-Example:
-
-/ {
-	...
-
-	mdss: mdss@1a00000 {
-		compatible = "qcom,mdss";
-		reg = <0x1a00000 0x1000>,
-		      <0x1ac8000 0x3000>;
-		reg-names = "mdss_phys", "vbif_phys";
-
-		power-domains = <&gcc MDSS_GDSC>;
-
-		clocks = <&gcc GCC_MDSS_AHB_CLK>,
-			 <&gcc GCC_MDSS_AXI_CLK>,
-			 <&gcc GCC_MDSS_VSYNC_CLK>;
-		clock-names = "iface",
-			      "bus",
-			      "vsync"
-
-		interrupts = <0 72 0>;
-
-		interrupt-controller;
-		#interrupt-cells = <1>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		mdp: mdp@1a01000 {
-			compatible = "qcom,mdp5";
-			reg = <0x1a01000 0x90000>;
-			reg-names = "mdp_phys";
-
-			interrupt-parent = <&mdss>;
-			interrupts = <0 0>;
-
-			clocks = <&gcc GCC_MDSS_AHB_CLK>,
-				 <&gcc GCC_MDSS_AXI_CLK>,
-				 <&gcc GCC_MDSS_MDP_CLK>,
-				 <&gcc GCC_MDSS_VSYNC_CLK>;
-			clock-names = "iface",
-				      "bus",
-				      "core",
-				      "vsync";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					mdp5_intf1_out: endpoint {
-						remote-endpoint = <&dsi0_in>;
-					};
-				};
-			};
-		};
-
-		dsi0: dsi@1a98000 {
-			...
-			ports {
-				...
-				port@0 {
-					reg = <0>;
-					dsi0_in: endpoint {
-						remote-endpoint = <&mdp5_intf1_out>;
-					};
-				};
-				...
-			};
-			...
-		};
-
-		dsi_phy0: dsi-phy@1a98300 {
-			...
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
new file mode 100644
index 000000000000..5e3cd7abf046
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno/Snapdragon Mobile Display controller (MDP5)
+
+description:
+  MDP5 display controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994
+  and MSM8996.
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    const: qcom,mdp5
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: mdp_phys
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 7
+
+  clock-names:
+    oneOf:
+      - minItems: 4
+        items:
+          - const: iface
+          - const: bus
+          - const: core
+          - const: vsync
+          - const: lut
+          - const: tbu
+          - const: tbu_rt
+        #MSM8996 has additional iommu clock
+      - items:
+          - const: iface
+          - const: bus
+          - const: core
+          - const: iommu
+          - const: vsync
+
+  interconnects:
+    minItems: 1
+    items:
+      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from rotator port to the data bus
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+      - const: rotator-mem
+
+  iommus:
+    items:
+      - description: apps SMMU with the Stream-ID mask for Hard-Fail port0
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: >
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI, DP etc. MDP5 devices support up to 4 ports:
+      one or two DSI ports, HDMI and eDP.
+
+    patternProperties:
+      "^port@[0-3]+$":
+        $ref: /schemas/graph.yaml#/properties/port
+
+    # at least one port is required
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    display-controller@1a01000 {
+        compatible = "qcom,mdp5";
+        reg = <0x1a01000 0x90000>;
+        reg-names = "mdp_phys";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        clocks = <&gcc GCC_MDSS_AHB_CLK>,
+                 <&gcc GCC_MDSS_AXI_CLK>,
+                 <&gcc GCC_MDSS_MDP_CLK>,
+                 <&gcc GCC_MDSS_VSYNC_CLK>;
+        clock-names = "iface",
+                      "bus",
+                      "core",
+                      "vsync";
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
+        };
+    };
+...
-- 
2.39.0

