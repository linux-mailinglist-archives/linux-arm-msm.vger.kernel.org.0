Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8117F60B753
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 21:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbiJXTWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 15:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbiJXTVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 15:21:47 -0400
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C5C2558B
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:57:10 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id z97so32848245ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us17Onp7GR3mizhlh7cq4mCVrkwlX+F6mp/vco5VcC4=;
        b=Xyg8FAI9DnXWCQXiNBc/C/F3fiGJUJbgyplTQjvKsNryQPr5tixbUEtGFKQOjK7NPS
         77LKe4JqxbAM34qKOC7Grdc4l/BLsKxNGVo45LCx0iaFgNHSMQcU1Ywst8bgtH3rL4Vx
         O0xST5gmnIHrxOtd9TC/0Asv9plnxb76wYTbIkRLN0RX2T/bW099bJyVsJFwJU07Pz9f
         fnUJW7qfUVeUFlsC1FwLuw/C7DislcidI38YwEXlN6shO7LmtkeysshIMpHl56YbhuSk
         oL2Rf/5XJNm4zzC49nY3uPvYIy155Jjjs04LlENDZIm/O135Lslj1QU+ogy9/sN9xd9V
         e9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us17Onp7GR3mizhlh7cq4mCVrkwlX+F6mp/vco5VcC4=;
        b=zCS/Iqp4dW2Df93mshamTv49RDcYCRpGyxsqoFSDpk9B6vBbEyzdQMbLMw57jPbh/8
         lybwX7tcp2+v2GEKERgGxJLGuYiLMuKo6u7qdgpQWMXtY8ijZvt3fZnFdYwm4aHIlCH0
         5FKCqIRmhpqPuRSGRIuH0f7PItwreKn/NanOilHbZbDxTnwG6AHQS/dYjuu306S7wxwA
         xpHcp+lQmZqkgENyZrK8NYX+VAeY49QVIEqkNQSJFZFb9FEhigeM7md9BgS9r5Q6easn
         mkXFDhT7Y3XZIVitGSi1fCcFcdkVg228icwxLkKN+n5p213sHYwvdeHOo3fVB+1ZWwsj
         cxJQ==
X-Gm-Message-State: ACrzQf32cwc0Q7jgjJGTN06ek3R11K50YuX643Vms/AX8aN/7jVAZVfp
        xoCQBUHd29jbUdRw1cBF2B4KvZzkQmfTZW9j
X-Google-Smtp-Source: AMsMyM6aNMjF775ghrixwogZ6MnfgzEBaFRXCI4J2VZgnWzzhted7AevGH7HY6DW9JfDGqlc416Upg==
X-Received: by 2002:a05:6512:6d0:b0:4a4:45c3:8d8a with SMTP id u16-20020a05651206d000b004a445c38d8amr13059320lff.329.1666629754028;
        Mon, 24 Oct 2022 09:42:34 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:42:33 -0700 (PDT)
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
Subject: [PATCH v9 09/12] dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
Date:   Mon, 24 Oct 2022 19:42:22 +0300
Message-Id: <20221024164225.3236654-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to make the schema more readable, split dpu-msm8998 into the DPU
and MDSS parts, each one describing just a single device binding.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/msm/qcom,msm8998-dpu.yaml         | 95 +++++++++++++++++++
 ...pu-msm8998.yaml => qcom,msm8998-mdss.yaml} | 47 ++-------
 2 files changed, 101 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
 rename Documentation/devicetree/bindings/display/msm/{dpu-msm8998.yaml => qcom,msm8998-mdss.yaml} (69%)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
new file mode 100644
index 000000000000..b02adba36e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,msm8998-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for MSM8998 target
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,msm8998-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for regdma register set
+      - description: Address offset and size for vbif register set
+      - description: Address offset and size for non-realtime vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: regdma
+      - const: vbif
+      - const: vbif_nrt
+
+  clocks:
+    items:
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display mem-noc clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: mnoc
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@c901000 {
+        compatible = "qcom,msm8998-dpu";
+        reg = <0x0c901000 0x8f000>,
+              <0x0c9a8e00 0xf0>,
+              <0x0c9b0000 0x2008>,
+              <0x0c9b8000 0x1040>;
+        reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
+
+        clocks = <&mmcc MDSS_AHB_CLK>,
+                 <&mmcc MDSS_AXI_CLK>,
+                 <&mmcc MNOC_AHB_CLK>,
+                 <&mmcc MDSS_MDP_CLK>,
+                 <&mmcc MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "mnoc", "core", "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmpd MSM8998_VDDMX>;
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
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
similarity index 69%
rename from Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 67791dbc3b5d..192a832ef808 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -1,18 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dpu-msm8998.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,msm8998-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for MSM8998 target
+title: Qualcomm MSM8998 Display MDSS
 
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
 
-description: |
+description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for MSM8998 target.
+  bindings of MDSS are mentioned for MSM8998 target.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
@@ -39,44 +39,9 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/display/msm/dpu-common.yaml#
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
     properties:
       compatible:
-        items:
-          - const: qcom,msm8998-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for regdma register set
-          - description: Address offset and size for vbif register set
-          - description: Address offset and size for non-realtime vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: regdma
-          - const: vbif
-          - const: vbif_nrt
-
-      clocks:
-        items:
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display mem-noc clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: iface
-          - const: bus
-          - const: mnoc
-          - const: core
-          - const: vsync
+        const: qcom,msm8998-dpu
 
 unevaluatedProperties: false
 
@@ -86,7 +51,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss: display-subsystem@c900000 {
+    display-subsystem@c900000 {
         compatible = "qcom,msm8998-mdss";
         reg = <0x0c900000 0x1000>;
         reg-names = "mdss";
-- 
2.35.1

