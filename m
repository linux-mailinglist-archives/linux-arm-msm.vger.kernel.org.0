Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86506654F96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 12:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiLWLSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 06:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiLWLSn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 06:18:43 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4A612A9E
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 03:18:41 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id v11so4661427ljk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BN78cS6rE9Yp4B3TRTbxmbnWU/S5h0cAk1EFG+5tItQ=;
        b=uUe6o9Cmm9zvEzHBBsQSg3P4exeeOEsHNZBzcvpO+Nf+oFHMrAJE1KJkbjKlBGj6Vm
         Bb2rK2s4t81FW6t2SWizTZNrH4BZVxG0Zc4U4PVO5ZMaHf7AfovVTAovpMQ/+t0L7/qM
         /GvpVlACV3K6MltxN+RNcoAI398QVpDcBqylhrJINlYM23f6Wpf4GkEVYoNel9ZXvD3W
         lnBuYhrklSFfC9h0X+5gZGwd+d28CNa4GBofaNqQXyhSZttpBVr58VnFYB7jFPRZIwpy
         Cf/XkF5iBvRCK8jdllUr0AYvC58UrmoAT5Lxfl2GUE0JVDLc1rs+b8cKMoOoXBsjEyqb
         dVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BN78cS6rE9Yp4B3TRTbxmbnWU/S5h0cAk1EFG+5tItQ=;
        b=aszDhPM5vh+5En3ncW+BR8t/uW3FHf6PIyovhru1hcn6sLaEUMMvmg3Dk0dSNcWiQl
         YTE3zZSxK0SKD1Metq9hhUcYyGSJMVQtwpHV9WZP6QgM0gua0+K2bbSkjVo6axpt2nzj
         +umApyPCAaCWgk/0W9J2xWmd8GwBVuR+AQP0lOnySiein0G1FfZ7uvA8hmAB7oifdyoO
         U25YfDekyR1Sk77PsiaqUZDW/H3Egx9CaljD7+qwR6PPRbFkYqvib7ca/lmGGakLYDID
         tpXc1UTfVtgm7J9d0eytbPCP0s6ZXw8TIqMs0wnn02LKExSFKTqX/cYCkQeZYp+nwMg8
         94zQ==
X-Gm-Message-State: AFqh2kohaNd8iiTRLCUTbFUL4EOOq619WJHh2cKzwDFJwzz2spIg0AkM
        tZny1cIP0vMX1SStMb6gFySbcw==
X-Google-Smtp-Source: AMrXdXvUGRb5NIIujgOVvZRAbSbFSTLCDIcNtu4d6J9ydxgw8Bi+S2NGSfpVFQYVlEhTe0voPcEhMw==
X-Received: by 2002:a2e:8945:0:b0:27f:958a:9279 with SMTP id b5-20020a2e8945000000b0027f958a9279mr2475446ljk.1.1671794319703;
        Fri, 23 Dec 2022 03:18:39 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q13-20020a056512210d00b004b5732080d1sm483280lfr.150.2022.12.23.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 03:18:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: clock: qcom,spmi-clkdiv: convert to DT schema
Date:   Fri, 23 Dec 2022 12:18:35 +0100
Message-Id: <20221223111835.37610-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Convert Qualcomm SPMI PMIC clock divider bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,spmi-clkdiv.txt       | 59 ---------------
 .../bindings/clock/qcom,spmi-clkdiv.yaml      | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.txt b/Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.txt
deleted file mode 100644
index 7474aba36607..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Qualcomm Technologies, Inc. SPMI PMIC clock divider (clkdiv)
-
-clkdiv configures the clock frequency of a set of outputs on the PMIC.
-These clocks are typically wired through alternate functions on
-gpio pins.
-
-=======================
-Properties
-=======================
-
-- compatible
-	Usage:      required
-	Value type: <string>
-	Definition: must be "qcom,spmi-clkdiv".
-
-- reg
-	Usage:      required
-	Value type: <prop-encoded-array>
-	Definition: base address of CLKDIV peripherals.
-
-- qcom,num-clkdivs
-	Usage:      required
-	Value type: <u32>
-	Definition: number of CLKDIV peripherals.
-
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the xo clock.
-
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "xo".
-
-- #clock-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: shall contain 1.
-
-=======
-Example
-=======
-
-pm8998_clk_divs: clock-controller@5b00 {
-	compatible = "qcom,spmi-clkdiv";
-	reg = <0x5b00>;
-	#clock-cells = <1>;
-	qcom,num-clkdivs = <3>;
-	clocks = <&xo_board>;
-	clock-names = "xo";
-
-	assigned-clocks = <&pm8998_clk_divs 1>,
-			  <&pm8998_clk_divs 2>,
-			  <&pm8998_clk_divs 3>;
-	assigned-clock-rates = <9600000>,
-			       <9600000>,
-			       <9600000>;
-};
diff --git a/Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.yaml b/Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.yaml
new file mode 100644
index 000000000000..16c95ad6c9d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,spmi-clkdiv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC clock divider
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  Qualcomm SPMI PMIC clock divider configures the clock frequency of a set of
+  outputs on the PMIC.  These clocks are typically wired through alternate
+  functions on GPIO pins.
+
+properties:
+  compatible:
+    const: qcom,spmi-clkdiv
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: xo
+
+  "#clock-cells":
+    const: 1
+
+  qcom,num-clkdivs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of CLKDIV peripherals.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - qcom,num-clkdivs
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-controller@5b00 {
+            compatible = "qcom,spmi-clkdiv";
+            reg = <0x5b00>;
+            clocks = <&xo_board>;
+            clock-names = "xo";
+            #clock-cells = <1>;
+            qcom,num-clkdivs = <3>;
+
+            assigned-clocks = <&pm8998_clk_divs 1>,
+                              <&pm8998_clk_divs 2>,
+                              <&pm8998_clk_divs 3>;
+            assigned-clock-rates = <9600000>,
+                                   <9600000>,
+                                   <9600000>;
+        };
+    };
-- 
2.34.1

