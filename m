Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1030C5A9441
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 12:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbiIAKXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 06:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbiIAKXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 06:23:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982581360A0
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 03:23:16 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y10so14243279ljq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+X49tA4IIhRMp2sWT4xg9kHfflR0SXAycywENlVYMSw=;
        b=AlN/rHQHyslodmHFA0DSP1Z7vPUXWF12PCQppLQdKGifT4sx3ygedlWWCMGXU6EEVq
         jJBxhAh6IcOvlf99hFQPX0pl88OJpEYMu6/CuXUhP6o1wRIzaffcO4fG0WzP9LfLsClw
         B1TG2RBQpGKTCuZed80s506TVkAYkPgCe6TDcyvBvPXW0NUbP9QrBgOBAFeXUA/pvbez
         HfgY5l7VDMt2F2pzJekpJuDvA2soWcSgxNhmdN6FegEowr8SrZnhsFsvwx4CFjlqVAmS
         c2Lvg9H9+Zb22lzDV+YMCvtgUEFY80ulGdEhGyKaVscu4pIDjQEDfgFm3YRYlAz9nsga
         YCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+X49tA4IIhRMp2sWT4xg9kHfflR0SXAycywENlVYMSw=;
        b=oTFmlkcaQvM7z701OAnP9x9iD7h0C4JKCn1Kr5/ar2roeYv5VAWkpWTLMR8qVfk8o5
         HTZ/vrPKcwij1Oz6UoDur+17CZPYQ2t7VKl3qyfcFU6W8qdZmdR0GHMFtu8Mfr/obyMA
         PZmebV31JMOzATSwuLZGyhdCD0FPTWHFcTkIt+VMzSugV0rgLqi3ju+LQ+eirE057nNV
         UwhnPVx9zuak75uOaRWfTQNy/aDMomjrrwboglH3nzcigY44yP2ltkts5C3nDIjnQ2B5
         mWFcC+rB/QORalbnUfh/A9Bt1apZL5VdU2Cr7IYze0mYbCnSd/8KCg3GLTP6cKbQlrFM
         DlIw==
X-Gm-Message-State: ACgBeo2A0qAIUECV33++nhP9ulGPRghYHG3lht2AlbAvBgWT8dUHodM4
        Qxfxe/H9McVLfShNApPzROkOsA==
X-Google-Smtp-Source: AA6agR5d30YfnEkzK36R9lksTE9+rC9koZKL+N1b6Q5MYmekU/vYoOCRvJUUvkLfzgS2dRRQIEZfww==
X-Received: by 2002:a2e:910:0:b0:267:c001:c93e with SMTP id 16-20020a2e0910000000b00267c001c93emr3104829ljj.439.1662027794938;
        Thu, 01 Sep 2022 03:23:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 03:23:14 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss bindings
Date:   Thu,  1 Sep 2022 13:23:01 +0300
Message-Id: <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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

Split Mobile Display SubSystem (MDSS) root node bindings to the separate
yaml file. Changes to the existing (txt) schema:
 - Added optional "vbif_nrt_phys" region used by msm8996
 - Made "bus" and "vsync" clocks optional (they are not used by some
   platforms)
 - Added (optional) "core" clock added recently to the mdss driver
 - Added optional resets property referencing MDSS reset
 - Defined child nodes pointing to corresponding reference schema.
 - Dropped the "lut" clock. It was added to the schema by mistake (it is
   a part of mdp4 schema, not the mdss).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
 .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
 2 files changed, 167 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

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
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
new file mode 100644
index 000000000000..8860fc55cca5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
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
+  interrupt-controller:
+    true
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
+  ranges:
+    true
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
+  "^dsi-phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,dsi-phy-14nm
+          - qcom,dsi-phy-14nm-660
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
+      compatible = "qcom,mdss";
+      reg = <0x1a00000 0x1000>,
+            <0x1ac8000 0x3000>;
+      reg-names = "mdss_phys", "vbif_phys";
+
+      power-domains = <&gcc MDSS_GDSC>;
+
+      clocks = <&gcc GCC_MDSS_AHB_CLK>,
+               <&gcc GCC_MDSS_AXI_CLK>,
+               <&gcc GCC_MDSS_VSYNC_CLK>;
+      clock-names = "iface",
+                    "bus",
+                    "vsync";
+
+      interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+    };
+...
-- 
2.35.1

