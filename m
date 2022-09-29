Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA445EF1B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235410AbiI2JVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235033AbiI2JVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:21:50 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC5112FF0A
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:48 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a10so898692ljq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OCZAa9+XUHpfPNJLDsPLhQrGMAuvPAWwGWcYkNOdla8=;
        b=GTrGeoH1cNGkC/i4ECTud17E9GIIZPrGjorDDHYiXFWYlp46OxbByebyNKBYuhXzeV
         78BrjUMLHFedsaPxifCxVHTCWCtZSLXUUlJphgn1uBdju4u5isKKcCooX9fobx5UWKwZ
         WByT1MfnW8wFjtKkzypRuCupsBW2lxGkbxTDLldPqvfbDFTMzsna9OMTN8VyiDcGWl2g
         s/C50ks8KtvAkWaLNmyHsSdhVdloAjOziuIQNUe1JqIOQvNQaxnnKim2XIFSL//AA7zP
         k0X+v5LFiuIMdoBz4ohIfwceF5SaQJBvvj6GRiE+AD/Aqp8UbqaQSZDflbwP+Fws70k1
         Qz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OCZAa9+XUHpfPNJLDsPLhQrGMAuvPAWwGWcYkNOdla8=;
        b=rOz9AH5kZXFOyqWnufIVl94jVzxe/nTthNor8BrxC9PPQj5xbodmTfwmK3TcZcvb13
         AgRsIP+YGKwj24Ch1Ys1UcnfvY89vBp3yifm96idF41aOAU9QXBbHg7iJDbbdFc1RLoD
         GIUAnmNZcu5BIcm+K8qKwVRAPHAAyfCk5hHeIN3cWPsRvqnlkQ4nZcpOPET7ghBQUea5
         taYEnOFxOJqpQUIhsj13CT8obBvm86/VBY86meE+qXrfsmPh0F5KA0Pzxj1mOv3H4wXh
         lfO8V+45ppXFIvQ20+ZlIgo9DhIREHsjZ9mzJAZweg+C/+2mqrYBWk+2vdiIKSYTg7FD
         5kBA==
X-Gm-Message-State: ACrzQf2+8TOMESJbAkbH05wKhL2PdN4z1VXd1baj2Aj0ts+KcRtqwH1l
        kJi++SEzSwHECiFbu1MFUtzL/Q==
X-Google-Smtp-Source: AMsMyM7LHM/e3UeiuyrTSXYmQVQV/DASZXXCZBoTixxDOvVnb48PLx/b+oVZYZsOj0+6u2CS66EV8g==
X-Received: by 2002:a2e:b4a9:0:b0:26d:a4bd:9f4c with SMTP id q9-20020a2eb4a9000000b0026da4bd9f4cmr837139ljm.72.1664443306759;
        Thu, 29 Sep 2022 02:21:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:46 -0700 (PDT)
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
Subject: [PATCH v2 01/11] dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate file
Date:   Thu, 29 Sep 2022 12:21:35 +0300
Message-Id: <20220929092145.473009-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
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

