Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9632960B5C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 20:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiJXSjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 14:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbiJXSi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 14:38:57 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0DDEAC88
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:20:56 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id q9so6776014ejd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbuN232fH0hkFVuOU2HP82MlWZYxCsDXn6ruzLwv60E=;
        b=NHpA3R7A5kj7tpT+s7gFyIgwptI+pTcbnOss8Y2z8R4bdC6yoja0GYymCcSc6DJcRT
         Dvk70q3g4Y67K3DglS9ORaBMAgngsZDWFgSw6LcEu2U247pDKt87P59EdHhIm5LYa/D9
         lyu4hk8DV/uIcK6lpvsII5/hxJMTYiolbwltF9MXpv/zYzu+SG2E9b9+4RFx5JeeMtx3
         R3SGJKn7U8HbSRKePsm0aghKha7xQ4KmasDbcNWiHqEhSpUtkn4NJGy/lfbNqYoIyOcF
         CYNAfGik2xmv+tFIPXCV6JSuXsacm4JCt6Jg944kZiuWdg+bwquj/cYbU/w7NmpAKur1
         NLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbuN232fH0hkFVuOU2HP82MlWZYxCsDXn6ruzLwv60E=;
        b=4NRZMf1fyo/G9v8P8SYFpYiU3W7TXbAkbp1+CUUaBubJSn/owbJ2CrN8y3+jdiFAyc
         VG70y9sG50+4T0P6BbBdmfxlGkWjvoUg6+NeQv5cyW4PGStATcSq75e8eRIMTgMKV8D3
         wbgxVJTnzleI/m80hibj6S8VEHUhODvBzFYRb9t4B+o5Jle4Wddt7aYypkdO8nHqEva5
         vBusUmCfMFxfnDFz2QSlH2jZK3fT34+2o6LT4RzbnuH92JRvl8kfbrMQACSD5+JWnoHD
         DL11kIYV2c0aCg6bHYNQchwqVkPC3ojKC5ZeaPOhJvARhL+c8XkzvEJynJzLMp2Upwk6
         U+MA==
X-Gm-Message-State: ACrzQf1ncCPGHTC2CduaKivEl+/bBR6Ufm6h91xd2FjnodjNAH0U1KKy
        ostyoFjjbFKdSyUlidg84zf464tMEsM307Zv
X-Google-Smtp-Source: AMsMyM7hsL7+bvr8MzT+r9u4QwqbPuMugWGKqXMuZzuXl3zIPk1F5c4ib1sW45Ngbtu4XttcBaC6AA==
X-Received: by 2002:a05:651c:542:b0:277:fb6:b88a with SMTP id q2-20020a05651c054200b002770fb6b88amr1352641ljp.208.1666629747649;
        Mon, 24 Oct 2022 09:42:27 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:42:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 01/12] dt-bindings: display/msm: split qcom,mdss bindings
Date:   Mon, 24 Oct 2022 19:42:14 +0300
Message-Id: <20221024164225.3236654-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
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

Split Mobile Display SubSystem (MDSS) root node bindings to the separate
yaml file. Changes to the existing (txt) schema:
 - Added optional "vbif_nrt_phys" region used by msm8996
 - Made "bus" and "vsync" clocks optional (they are not used by some
   platforms)
 - Added optional resets property referencing MDSS reset
 - Defined child nodes pointing to corresponding reference schema.
 - Dropped the "lut" clock. It was added to the schema by mistake (it is
   a part of mdp4 schema, not the mdss).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +--
 .../bindings/display/msm/qcom,mdss.yaml       | 196 ++++++++++++++++++
 2 files changed, 197 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..65d03c58dee6 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
 
 Description:
 
-This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
-encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
+This is the bindings documentation for the MDP5 display
 controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
 
-MDSS:
-Required properties:
-- compatible:
-  * "qcom,mdss" - MDSS
-- reg: Physical base address and length of the controller's registers.
-- reg-names: The names of register regions. The following regions are required:
-  * "mdss_phys"
-  * "vbif_phys"
-- interrupts: The interrupt signal from MDSS.
-- interrupt-controller: identifies the node as an interrupt controller.
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- power-domains: a power domain consumer specifier according to
-  Documentation/devicetree/bindings/power/power_domain.txt
-- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
-  * "iface"
-  * "bus"
-  * "vsync"
-- #address-cells: number of address cells for the MDSS children. Should be 1.
-- #size-cells: Should be 1.
-- ranges: parent bus address space is the same as the child bus address space.
-
-Optional properties:
-- clock-names: the following clocks are optional:
-  * "lut"
-
 MDP5:
 Required properties:
 - compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
new file mode 100644
index 000000000000..ba0460268731
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mobile Display SubSystem (MDSS)
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
+  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
+
+properties:
+  compatible:
+    enum:
+      - qcom,mdss
+
+  reg:
+    minItems: 2
+    maxItems: 3
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: mdss_phys
+      - const: vbif_phys
+      - const: vbif_nrt_phys
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+    description: |
+      The MDSS power domain provided by GCC
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Display abh clock
+      - description: Display axi clock
+      - description: Display vsync clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: iface
+      - const: bus
+      - const: vsync
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - power-domains
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+patternProperties:
+  "^mdp@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdp5
+
+  "^dsi@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,dsi-phy-14nm
+          - qcom,dsi-phy-14nm-660
+          - qcom,dsi-phy-14nm-8953
+          - qcom,dsi-phy-20nm
+          - qcom,dsi-phy-28nm-hpm
+          - qcom,dsi-phy-28nm-lp
+
+  "^hdmi-phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,hdmi-phy-8084
+          - qcom,hdmi-phy-8660
+          - qcom,hdmi-phy-8960
+          - qcom,hdmi-phy-8974
+          - qcom,hdmi-phy-8996
+
+  "^hdmi-tx@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,hdmi-tx-8084
+          - qcom,hdmi-tx-8660
+          - qcom,hdmi-tx-8960
+          - qcom,hdmi-tx-8974
+          - qcom,hdmi-tx-8994
+          - qcom,hdmi-tx-8996
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdss@1a00000 {
+        compatible = "qcom,mdss";
+        reg = <0x1a00000 0x1000>,
+              <0x1ac8000 0x3000>;
+        reg-names = "mdss_phys", "vbif_phys";
+
+        power-domains = <&gcc MDSS_GDSC>;
+
+        clocks = <&gcc GCC_MDSS_AHB_CLK>,
+                 <&gcc GCC_MDSS_AXI_CLK>,
+                 <&gcc GCC_MDSS_VSYNC_CLK>;
+        clock-names = "iface",
+                      "bus",
+                      "vsync";
+
+        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        mdp@1a01000 {
+            compatible = "qcom,mdp5";
+            reg = <0x01a01000 0x89000>;
+            reg-names = "mdp_phys";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            clocks = <&gcc GCC_MDSS_AHB_CLK>,
+                     <&gcc GCC_MDSS_AXI_CLK>,
+                     <&gcc GCC_MDSS_MDP_CLK>,
+                     <&gcc GCC_MDSS_VSYNC_CLK>;
+            clock-names = "iface",
+                      "bus",
+                      "core",
+                      "vsync";
+
+            iommus = <&apps_iommu 4>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdp5_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.35.1

