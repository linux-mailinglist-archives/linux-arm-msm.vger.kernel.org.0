Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED676F3930
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 22:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjEAUeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 16:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbjEAUeJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 16:34:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26037213E
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 13:34:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f122ff663eso897036e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 13:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973245; x=1685565245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+N7k63DMlIbPxfHV3R2nf9CFSmJb5A9MP2qzr3A/bI=;
        b=VPw2BK2TLIxwNbzR3bOWT3d04g5Vr24vDW9qYAF5nyGqYAEn0C3mt73tXRLRqB0b2b
         uAlKmofolUH2YAGX8ev7mHkpQnGG8kUs33ukXFinx/ET78rEynXrgRbldIFKxgjLgD0P
         Om9sOXv3iAEMepkT47ZMxsNxPbNY+SqymcmutA+pj5fB3S9rmJuTliFqqVNSHW8oLqF0
         ZhF8ZV9lwZ55w+5t1yZBm32ffO88h85v5u8s39k+xplf5xVXnrUWHanyyH0PJFBvPwlv
         jaIpA+G166mErcJxXAXN227vAagZvVJVStByxfjwPrwzHcsOyp7ofzpehthH43YzZ1gR
         os3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973245; x=1685565245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+N7k63DMlIbPxfHV3R2nf9CFSmJb5A9MP2qzr3A/bI=;
        b=HNBpP+1j9lSKqXkYvuLWen4BBls+vRjbb/jhcAg9C5++cQPbTC1TFxwgKUpeHMm8fT
         xErSBbu7Xh20tGs9BeQcilAHe6JEYrjMl6SKxE1RvPYiDSxaetM+iRJTjCrU1YBhYHw3
         vjQhBfCLoU6WtJ6phs718uObzsCXpfpbRHKReJsKqVIYnl4/+mxeZAP2Ja6QrLYIIuE4
         Iyhhg/yFILnNnTb5Ptls6mV87+iaywIUeUD9LDl6TXEWdrOkRbmB9sS09fu6KeQ9eSCz
         OeJJgX5FBUioDxsI/Dh7Sw+oLlmvMxrwogs4L+YTI/y2Nwv1AYIQlfehngPlS07JAQAJ
         K82w==
X-Gm-Message-State: AC+VfDxJaFM17QIP4UXjOS2Cwrn0tz7U7KQxwduZiRoEjcjUtajG/87/
        e+DQ+uJrDVf0pKOZCBnoZisevA==
X-Google-Smtp-Source: ACHHUZ6w5wvnB6XJJ/Mmzgnp2pMAeyjGCx9IvhpXEKq7VxSDpPtiEblqe0fDJt0OPen0Hw/O6IvsXg==
X-Received: by 2002:a05:6512:7c:b0:4f0:219f:7833 with SMTP id i28-20020a056512007c00b004f0219f7833mr1867446lfo.55.1682973245295;
        Mon, 01 May 2023 13:34:05 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 03/10] dt-bindings: clock: provide separate bindings for qcom,gcc-mdm9615
Date:   Mon,  1 May 2023 23:33:54 +0300
Message-Id: <20230501203401.41393-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
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

The global clock controller on MDM9615 uses external CXO and PLL7
clocks. Split the qcom,gcc-mdm9615 to the separate schema file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-mdm9615.yaml      | 53 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  3 --
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
new file mode 100644
index 000000000000..ca26d69ccb07
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9615.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on MDM9615
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on MDM9615.
+
+  See also::
+    include/dt-bindings/clock/qcom,gcc-mdm9615.h
+    include/dt-bindings/reset/qcom,gcc-mdm9615.h
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    const: qcom,gcc-mdm9615
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: cxo
+      - const: pll4
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,lcc-msm8960.h>
+    clock-controller@900000 {
+      compatible = "qcom,gcc-mdm9615";
+      reg = <0x00900000 0x4000>;
+      #power-domain-cells = <1>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      clocks = <&cxo_board>, <&lcc PLL4>;
+      clock-names = "cxo", "pll4";
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index ae01e7749534..b6e260755a21 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -19,8 +19,6 @@ description: |
     include/dt-bindings/reset/qcom,gcc-ipq6018.h
     include/dt-bindings/clock/qcom,gcc-msm8953.h
     include/dt-bindings/clock/qcom,gcc-mdm9607.h
-    include/dt-bindings/clock/qcom,gcc-mdm9615.h
-    include/dt-bindings/reset/qcom,gcc-mdm9615.h
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -31,7 +29,6 @@ properties:
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8953
-      - qcom,gcc-mdm9615
 
 required:
   - compatible
-- 
2.39.2

