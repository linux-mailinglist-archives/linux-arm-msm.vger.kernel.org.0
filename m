Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32171661BBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 02:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbjAIBLI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 20:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbjAIBK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 20:10:56 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA17FE77
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 17:10:54 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id d30so5806911lfv.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 17:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL4Xu20jvCsbnyMv0f6YqClfUKZ4GC2lko393EIPIXY=;
        b=mu6A6jHutpdVwt1f1kSSRftnhL6dc/jUSHEoPVGyrcS9fTxQexylHTYytm6zNVWNP5
         mN5UTyjn+EGDAqViRl6c5mXuPCOaTVBbxNhxrwDVv464C7SSRWi1bg7Hj+PPgcxsOG7h
         6fQovwEm7siw0QPJ4+aHUjti4DwDEGnn2u8I1KrIKoQsBVc9T3kt4CbAH6NzLHWDUtsx
         6a96uq6h7EPh08JNBejiaBTSp/bIOnFenBWpBHirHWQ/3unR+7FpSsL8kWSuHEEtq4Pw
         LXUgsIrmbYoKu7qO5ADniVawLs54gO7D4ZGfzYgVTJGyYuYN4G7fG6ksSy6yVFmk+4cl
         KKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL4Xu20jvCsbnyMv0f6YqClfUKZ4GC2lko393EIPIXY=;
        b=ytA7UUWgfJ7vpJqfCgvpN+HihQUvh+iszzSm7y+yTMPqPMJeRaC6stYN7qB1o6C1FV
         WQhkGfxM350Zqzc3t/O7DoIis2Qrg0tjFEdrlpsN8FsLeFZ4QvWonfudPvgoy8dZrUo2
         VNgViygF67XdXZdem5YJGFGhL6WAGGDSgrZfz61SuOwOyfCEwP/v9JLJyhTKzbkz5YRf
         WIIqEimC86B9zo7oLsTfvnYQdOTdck/1bh1s6KbRb2ei9KLlMWslRVVbgUvo0u4/FC3f
         fVqFgqIrLD+5uGsr1T9+r+Bnl3GU/Kx9r0t51BICq676B2MTHqrvIycx2XpqyAdsa+ji
         iSpA==
X-Gm-Message-State: AFqh2krORD7Xq0Ru65ryiB8/9W9fu1W5FNuGv9g1Knwwhktk3jAeUXnC
        e41p192RIrfUfx/CgKvGD2clLw==
X-Google-Smtp-Source: AMrXdXta/OnBThuKG726eVFVun1XP0teA5Lh2eyWBpA+/2JIGddBeg82l3ZtvR1QLol82+UmF4dbGg==
X-Received: by 2002:a05:6512:3b27:b0:4ca:94cc:a288 with SMTP id f39-20020a0565123b2700b004ca94cca288mr20786248lfv.27.1673226653079;
        Sun, 08 Jan 2023 17:10:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y4-20020a0565123f0400b004cc590975f7sm1324346lfa.183.2023.01.08.17.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 17:10:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: display/msm: convert MDP5 schema to YAML format
Date:   Mon,  9 Jan 2023 03:10:48 +0200
Message-Id: <20230109011051.263391-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109011051.263391-1-dmitry.baryshkov@linaro.org>
References: <20230109011051.263391-1-dmitry.baryshkov@linaro.org>
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
index 000000000000..cbcbe8b47e9b
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
+description: >
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
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
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
+    description: |
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI, DP etc. MDP5 devices support up to 4 ports::
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

