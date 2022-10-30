Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3197C612B5E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 16:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJ3Pz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 11:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJ3Pz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 11:55:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138B52F3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:26 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g7so15833305lfv.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCZAa9+XUHpfPNJLDsPLhQrGMAuvPAWwGWcYkNOdla8=;
        b=KXgT0NNp7CyHl7CxzKZzmQVvV2Jg8ya7E31di7zOydrwavpxt7aUjWJzWWlq0XdSeU
         hauG0GlhCUfXUXFwW5iunxcizzw35JcPROn+Y7fN3Ku70i3SFZtnoIg2JsRzvow/vU7F
         16Q63XQep9JvbNdLjIb2/qKWOMSrxhb7ReF24IbrG1a905WN9KGlWF7Mv0TiZcEbJ9O3
         O7xz9h71E5tp5FZwft9GbTxfwW6+PLNC+CrePA1umBBcoSmF8pxRkrgGp5wNQizbdOUk
         HzMWZlC8aS0pSG+REnfAb71nqMcVjBzOcKXskLA5b0nAligKiWwrx3GDwNn0wzNlFYWV
         6HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCZAa9+XUHpfPNJLDsPLhQrGMAuvPAWwGWcYkNOdla8=;
        b=vU2W+HCuQdP4+XWw1ZPXAP2AFdyKJFFSCN9GmzSRu4+ujxOF9VIR6eYNxi+F90sQ44
         nq/LG9fjNkZrAOiZw9L0ooJfWDYd/0h7I1etCDNWOkYB4o6rZ1CEQ2ZOXx3nQEjkn4ku
         lKAzgMz4nV0WoAWS6NmjTKwU9bo6KYXFdrfxEMkAXSU8ExgAEe7X+4JP5O/yjokM5tNk
         ytVbVv9AqG6D8Q6h4NitOANyElmFxkb4lLytrc/0tUuRDf+p2Y6E1zZybtrLxheC8E/U
         s6kCzpWZ1ibFqQHsL8cXxjbd26unveJQrDYv8TPykLOcIcYBbTSm/03IYNU7iNfwtNFS
         4uvQ==
X-Gm-Message-State: ACrzQf1g88DUNpoJ/suPwqpP9AbaR+BdQE0+t3BhxY5XBUkQZ8NIOL+5
        frr+f8srMwOuIyDEIQnbZVtY0Q==
X-Google-Smtp-Source: AMsMyM5gE/SahwE0DqbWsqYE6quXIUFx+WbGxiVkDEkXDYpF+4cxsSdloi3t4bBVS8BiyRv7CS980g==
X-Received: by 2002:ac2:5384:0:b0:4a2:3a45:520 with SMTP id g4-20020ac25384000000b004a23a450520mr3448229lfh.560.1667145324302;
        Sun, 30 Oct 2022 08:55:24 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id f4-20020ac24e44000000b00497a1f92a72sm842982lfr.221.2022.10.30.08.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 08:55:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 01/11] dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate file
Date:   Sun, 30 Oct 2022 18:55:10 +0300
Message-Id: <20221030155520.91629-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
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

Move schema for the GCC on MSM8974 and MSM8226 platforms to a separate
file to be able to define device-specific clock properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8974.yaml      | 64 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  9 +--
 2 files changed, 65 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
new file mode 100644
index 000000000000..a92a60f8c1af
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8974.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8974 (including Pro) and MSM8226 Global Clock & Reset
+  Controller
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8974 (all variants) and MSM8226.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
+  - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
+
+$ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8226
+      - qcom,gcc-msm8974
+      - qcom,gcc-msm8974pro
+      - qcom,gcc-msm8974pro-ac
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@fc400000 {
+        compatible = "qcom,gcc-msm8974";
+        reg = <0x00100000 0x94000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+
+        clock-names = "xo", "sleep_clk";
+        clocks = <&xo_board>,
+                 <&sleep_clk>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 35fc22a19000..0ec8ff215007 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -19,8 +19,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-ipq6018.h
   - dt-bindings/reset/qcom,gcc-ipq6018.h
   - dt-bindings/clock/qcom,gcc-msm8953.h
-  - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
-  - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-mdm9607.h
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
@@ -34,11 +32,7 @@ properties:
       - qcom,gcc-ipq4019
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
-      - qcom,gcc-msm8226
       - qcom,gcc-msm8953
-      - qcom,gcc-msm8974
-      - qcom,gcc-msm8974pro
-      - qcom,gcc-msm8974pro-ac
       - qcom,gcc-mdm9615
 
 required:
@@ -47,10 +41,9 @@ required:
 unevaluatedProperties: false
 
 examples:
-  # Example for GCC for MSM8974:
   - |
     clock-controller@900000 {
-      compatible = "qcom,gcc-msm8974";
+      compatible = "qcom,gcc-mdm9607";
       reg = <0x900000 0x4000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-- 
2.35.1

