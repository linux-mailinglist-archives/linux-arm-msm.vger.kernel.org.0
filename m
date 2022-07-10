Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDF256CE32
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 11:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiGJJAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 05:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiGJJAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 05:00:47 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2379811A35
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:46 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id bx13so3063091ljb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxYOYEArwHfC1EBEGrasikYW6pj0UuIU8vXNFVNnVMM=;
        b=VA+Ew8NFOYAPVzxbQ7T7bB6jiXXyevij1M/DS3zsxWNnvntUeUmoJq6aydmYxKWtsR
         fyFYn6D2D1+xrukR8wIY0d8iG3Iz7PO6Kpl1dIE3U0KY/IO6bT60nIUSr4eLNfBbO5dY
         Ta3ExK0k5B14QkCua0E8gVXlk/xgzY/yZFVkV5nr8QhvuCGNwb2p7vKjRMC42topR5Xz
         ag1rpc/0n+acj1oEM9+wVPgFNnuyLh10w8OXaZifShu2CgyBk4B/SPFAjUm6Tjc6gHms
         SHE6b658GPbgpwF8GUW3kQhheHMSak4xVkQtNbmNeUnNdUL8orEBKYPeAUi+j4lo7371
         JffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxYOYEArwHfC1EBEGrasikYW6pj0UuIU8vXNFVNnVMM=;
        b=fleu11uO3yvGqe7bHJQ51+3WgqAtC3xpbpzw76vmAIAyTuDvtyBZD17t7NnVqkpNiY
         y33GDqeIC8Y9XCnHuXHZMtyXCI0gSn3hymu7NsBJA/Fru0Yt0MTuwHpsjVhBfGJ7MJxl
         N0top2urwZGZ6kJ6l/JdhBA//yEro1HFEyy0QfsnAlKcWjJxmgTSOf2R5in0VhNCN0lz
         xHJrPJkQD6kF1/HjiPbNZjpyjwCqaKw7CVvBpA6QtT4LDLampf1atrq0UAPAt4cdTquR
         LS4Av3BuIntjmUqRj3PqYsVF8ctm8cHiBURFd8MrLNcQvE4ZGd+bLB84x8jaAtBt1lCA
         J0qA==
X-Gm-Message-State: AJIora+WHIPtgULXarEo3J7fsoEJmnHCmST8guK75ibDtDErh53dFhGj
        Sxr3pDUDKSDZKmx+bbnskpHKmw==
X-Google-Smtp-Source: AGRyM1t/mPCH+3KpPAwyzSrxnOmsiAFwLrShnV1B0VGJHnnxi1cL4OM8P4nzwzwVvRTNcpqeGnS+Pg==
X-Received: by 2002:a2e:a78b:0:b0:25d:6898:d0d1 with SMTP id c11-20020a2ea78b000000b0025d6898d0d1mr913245ljf.218.1657443644479;
        Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Subject: [PATCH v2 04/11] dt-bindings: display/msm: split qcom, mdss bindings
Date:   Sun, 10 Jul 2022 12:00:33 +0300
Message-Id: <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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
 .../devicetree/bindings/display/msm/mdss.yaml | 161 ++++++++++++++++++
 2 files changed, 162 insertions(+), 29 deletions(-)
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
index 000000000000..ba674a261b18
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -0,0 +1,161 @@
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
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
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
+oneOf:
+  - properties:
+      clocks:
+        minItems: 3
+        maxItems: 4
+
+      clock-names:
+        minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+  - properties:
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: iface
+          - const: core
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
+  "^mdp@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    # TODO: add reference once the mdp5 is converted
+
+  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
+    $ref: dsi-controller-main.yaml#
+
+  "^dsi-phy@(0|[1-9a-f][0-9a-f]*)$":
+    oneOf:
+      - $ref: dsi-phy-28nm.yaml#
+      - $ref: dsi-phy-20nm.yaml#
+      - $ref: dsi-phy-14nm.yaml#
+      - $ref: dsi-phy-10nm.yaml#
+      - $ref: dsi-phy-7nm.yaml#
+
+  "^hdmi-phy@(0|[1-9a-f][0-9a-f]*)$":
+    oneOf:
+      - $ref: /schemas/phy/qcom,hdmi-phy-qmp.yaml#
+      - $ref: /schemas/phy/qcom,hdmi-phy-other.yaml#
+
+  "^hdmi-tx@(0|[1-9a-f][0-9a-f]*)$":
+    $ref: hdmi.yaml#
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

