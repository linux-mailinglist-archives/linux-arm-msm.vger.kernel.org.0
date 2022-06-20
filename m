Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0258155169C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241347AbiFTLHv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241323AbiFTLHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:07:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D9B1582D
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:07:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b7so11497730ljr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxM5Fh4o0hCwPM/3g/Dj/MQgpI2jjFoc6FSkQHRtfDs=;
        b=AHOXPjXZHoFAqbBm2TMZqN9WxMBQqz2a6nn7o5tJUorYk75b/LBf22WxQefs/rEmb+
         V2aNMX7/+LAQXYroOUBXxEduCz7MUNVejG9jsNlHjIRui0Q3WVNxprrdKFE96wUVryLj
         zGNzC5/kbPsFPIdsHK+qB+g4KTWCpQryMYdDrNgY49UfZdHL1uW5LTi3Lk52wK+DDS/T
         vX9G8HrBDFI08PghZyl0V0uXUcaALzRpdcyJ0vB1+IIh2zkA4RSJzyyedKJr1i3DYbwC
         MGOLSRxi9iZAho6Coi3i7hD8YUitI8ZisQi1m1SdUOTNZGipFo+2j5ndZb9pA5fwHvXU
         RgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxM5Fh4o0hCwPM/3g/Dj/MQgpI2jjFoc6FSkQHRtfDs=;
        b=e++oWaOOK7Sp+Jg3oX+uR8x54J8BT2s3gO+6Wl7dccd0zSzmn1Osm/lrkdgqY+5MXJ
         voqD65aCQ1N05EnNiXU1r/yL+2DoVgjfOde2c9fawuDBIJdFM6UO1Nf4678f6U9VjCRM
         HhEhJ2sSWoDzUPELgl3g+21FmsXSt5WQLyo47vSKVK80UA/JOpFgni7OGiHJzFljcweo
         CTW6lfLIAA8fsCzOpttmCnplt50z40jTD7JN1hcN6ZTUzQQtWIkrDtyplX8w+ODMZ4u+
         x91FOKC+2TZnuLBekHnUOUwqbuoH+D3iuOMFcZUtUZrB1Xd+cq8AGwbYNOBTqQ4/qemd
         aheg==
X-Gm-Message-State: AJIora8KfmGp6uPFcr8Li98xzKlriVEYi8jxWxS+zmnGncdghUyePy9N
        8nGBU3SMHpu60Sr9FgeL7VOaYQ==
X-Google-Smtp-Source: AGRyM1u4omvimDF5tT7z4eQP21s3HNrizZzAVQBkrRrULB500Rgdz8/vXXUE/UO+Vj9QHFU1nC26Uw==
X-Received: by 2002:a2e:bf1c:0:b0:259:f33:a4db with SMTP id c28-20020a2ebf1c000000b002590f33a4dbmr11077336ljr.454.1655723262648;
        Mon, 20 Jun 2022 04:07:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a194f13000000b00479a825aa5esm1722564lfb.154.2022.06.20.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:07:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: qcom,gcc-msm8660: separate GCC bindings for MSM8660
Date:   Mon, 20 Jun 2022 14:07:36 +0300
Message-Id: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Create a separate DT bindings for Global Clock Controller on MSM8660
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8660.yaml      | 54 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  3 --
 2 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
new file mode 100644
index 000000000000..09b2ea60d356
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8660
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks and resets on
+  MSM8660
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8660.h
+  - dt-bindings/reset/qcom,gcc-msm8660.h
+
+allOf:
+  - $ref: "qcom,gcc.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8660
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pxo
+      - const: cxo
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  # Example for GCC for MSM8974:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-msm8660";
+      reg = <0x900000 0x4000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&pxo_board>, <&cxo_board>;
+      clock-names = "pxo", "cxo";
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 61b90e836b5b..aae83a22b5fb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -21,8 +21,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8953.h
   - dt-bindings/reset/qcom,gcc-msm8939.h
-  - dt-bindings/clock/qcom,gcc-msm8660.h
-  - dt-bindings/reset/qcom,gcc-msm8660.h
   - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -40,7 +38,6 @@ properties:
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
-      - qcom,gcc-msm8660
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8974
-- 
2.35.1

