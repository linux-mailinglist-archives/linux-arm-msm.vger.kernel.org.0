Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795975A863F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 20:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbiHaS7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 14:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbiHaS7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 14:59:38 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DB2C2755
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:42 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z20so15609900ljq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bv3T8WPYFThl+f9nEQNBZ4CF4xXVMlb0Mv8v7lUGZ9g=;
        b=aeavUBuAflc0zIZCHvHEfsXPKQhTBnWi6Sod5ZpwlETq/fMQ0AuF8SWBFA7kVpMpKF
         xyLhscZfyprTnovwf7238DdIx3PFFgnQGMhxlvkzKWqEr7eqcfoZIiqpk5bduEyiZnOn
         r671SIwnWuRVluTfdrNXV8fgRbG86JPwkWQnY1qdBvv1pBuUbwEi8OimwPSbg2pLrLwD
         aCY2OEmby0pyBCuE195HoHHAmSovEs28nh0mPIg97mIwMiqWS+WpY6JplVd2gSWxQ06E
         tpQ1DEYHaUmO8FEyE/UVYsJapAWPX2iIjcJjGZ/NXw/BJbOHNcovcMggdDVfDY2bWpxK
         kAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bv3T8WPYFThl+f9nEQNBZ4CF4xXVMlb0Mv8v7lUGZ9g=;
        b=LUq3A+qpAKBRbVKASGPSF8Jl82xJ34cpRS653oNOwT31CBVMFL2WkUqfKELOsPFvNn
         ZD36SFud8tBngjxvFPI3mcRh39sFq4rw/c/vNYC4ygJju0tnkmq2j59+MH0PLoSxKx8N
         y2Dx+Te1La6TXaw4grWtMF9+ua3IvUTzRK2Iw7pQ+tEn6RSqY0P/Nt2roEDWwEM3OcGB
         KUm1nqMB/grkxGNxXPLrLsZV3InGUiQyhPoA4klnnq1ux/VLKqXnE0zoRzIsN5cjPifl
         YnqCRdPc4EmnF6wsyVTF0Ll7kaU/f52iQUXdhhQuIO8jLQt4gpRIwXkjsqvrJe8xf4dS
         2Dlg==
X-Gm-Message-State: ACgBeo3d4lNdAqw9FARIkLf+FPEfXuQuORLjyzvFvmQoJ+NGkd2GDPb4
        zenomJCOPBq/5SaRRN+6F5FE4Q==
X-Google-Smtp-Source: AA6agR6gxKnik2KrBf/SiNFCpBy9rGaiP0wIH21aVrg45VkskAR9SPI1ShF4BLwBEd9XjnRb7AHfpw==
X-Received: by 2002:a2e:844a:0:b0:255:46b9:5e86 with SMTP id u10-20020a2e844a000000b0025546b95e86mr8258434ljh.388.1661972321795;
        Wed, 31 Aug 2022 11:58:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004948f583e6bsm322422lfv.138.2022.08.31.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:58:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 12/12] dt-bindings: display/msm: add support for the display on SM8250
Date:   Wed, 31 Aug 2022 21:58:30 +0300
Message-Id: <20220831185830.1798676-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
References: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
SM8250 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sm8250.yaml      |  96 ++++++++++++++++
 .../bindings/display/msm/mdss-common.yaml     |   4 +-
 .../bindings/display/msm/mdss-sm8250.yaml     | 106 ++++++++++++++++++
 3 files changed, 204 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
new file mode 100644
index 000000000000..9bc2ee4a6589
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SM8250
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: |
+  Device tree bindings for the DPU display controller for SM8250 target.
+
+allOf:
+  - $ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8250-dpu
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
+      - description: Display ahb clock
+      - description: Display hf axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+      compatible = "qcom,sm8250-dpu";
+      reg = <0x0ae01000 0x8f000>,
+            <0x0aeb0000 0x2008>;
+      reg-names = "mdp", "vbif";
+
+      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+               <&gcc GCC_DISP_HF_AXI_CLK>,
+               <&dispcc DISP_CC_MDSS_MDP_CLK>,
+               <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+      clock-names = "iface", "bus", "core", "vsync";
+
+      assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+      assigned-clock-rates = <19200000>;
+
+      operating-points-v2 = <&mdp_opp_table>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
+
+      interrupt-parent = <&mdss>;
+      interrupts = <0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          endpoint {
+            remote-endpoint = <&dsi0_in>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          endpoint {
+            remote-endpoint = <&dsi1_in>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 053c1e889552..a0a54cd63100 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -27,11 +27,11 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   clock-names:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   interrupts:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
new file mode 100644
index 000000000000..d581d10fea2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for SM8250 target
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SM8250 target.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm8250-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: nrt_bus
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm8250-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-7nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+      compatible = "qcom,sm8250-mdss";
+      reg = <0x0ae00000 0x1000>;
+      reg-names = "mdss";
+
+      interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+                      <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
+      interconnect-names = "mdp0-mem", "mdp1-mem";
+
+      power-domains = <&dispcc MDSS_GDSC>;
+
+      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+               <&gcc GCC_DISP_HF_AXI_CLK>,
+               <&gcc GCC_DISP_SF_AXI_CLK>,
+               <&dispcc DISP_CC_MDSS_MDP_CLK>;
+      clock-names = "iface", "bus", "nrt_bus", "core";
+
+      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      iommus = <&apps_smmu 0x820 0x402>;
+
+      status = "disabled";
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+    };
+...
-- 
2.35.1

