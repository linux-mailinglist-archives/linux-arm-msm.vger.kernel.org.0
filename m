Return-Path: <linux-arm-msm+bounces-7216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C882CE81
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764A3283366
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD3518036;
	Sat, 13 Jan 2024 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wshf89ZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F1910797
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd2f472665so80621931fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179356; x=1705784156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJc3qa2P7/gJ3egsD0VQ5u3r1xsQIdR/8Y8k0L14qog=;
        b=wshf89ZNEQmQDDtQ2nCJRdMSM8lQcsKRq7NDyrMOc/2gQkimunLdMSxc9DsAnhOU8U
         lEsn20yrK1mMLOuQS+cIflYXVY9R3LAxN2iYLZZlbwBQ8A8CzjWX0qq7Uwk4/NPmzFzT
         jnUHyI5nrrnlRB4xzHxFaS9UWTBiW727RCnxK4sjUGPkfIxVbTC7jncmorNQRNDqECr2
         6oBq5TZpv/Dp0Cw+g5OZgk1C3KH6cmG6Ck220ZYh8RUmSdFcPGnJ+6n5bsi3ai9o9+fL
         d/YD13jp8NE4LWqyhjUqI21v6OQRHCrKW36gbxs/KABYQuoDnEfJ8p4LvzHf2Jd13WKT
         /wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179356; x=1705784156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJc3qa2P7/gJ3egsD0VQ5u3r1xsQIdR/8Y8k0L14qog=;
        b=EOVqBTzAt71w03KdBsZzWVOM4HWkkZZ6gtBXGowEYYaFK1rp61Vp/vImjAXwEcBZV5
         h6BMY/mlg4B6LrSVlz9wjqvNdW9532DrjiTccEcTHq/F0eSOtArFN23LtrnFlTJpYmqP
         Ac69X7PKE8DkNkr7erQtTVDGb8PdcBnh1d/cVsmsgQSP4qzlxUtdDQ0GNElADXMMT0ch
         RTsIB1KdLMk3w/DGrDILlw13iyAbi80u7fIQLwPNkmXMh7A9X/yARwJT4mO/t6oFyZhf
         CsyFpncHUYZ0q1JWXJDeb3VBkqIxWz+X0TkqfJ52phE9HCvCb3H7WdyAlLiXFHbmUV78
         Sqew==
X-Gm-Message-State: AOJu0Yxul2p1qRC2PDoJ3aSkBqeNIVteIKtL14JN/wIaFxdipXxwDdDY
	xOuKONaO0aS2vGPy8MGXzfXK8KimUrpa/A==
X-Google-Smtp-Source: AGHT+IFGOz38rv/jFZy78aEi8m4E1SFPUPvXCxXm9dHWNW/1yST8bvaF7Cql0c5VqqH8tKpjiXSEyQ==
X-Received: by 2002:a19:915d:0:b0:50e:74f3:9c5a with SMTP id y29-20020a19915d000000b0050e74f39c5amr1307891lfj.38.1705179356079;
        Sat, 13 Jan 2024 12:55:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:46 +0200
Subject: [PATCH v2 03/15] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 split from sc8280xp PHY schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-3-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5562;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CnztgRTnoisu3CgikOKmKjlZnjUtPFGoAOLDjHVdlrc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjWgSDszgG526QkzvdPnaAay8pbdMhtePPnI
 JsmmL70clGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41gAKCRCLPIo+Aiko
 1d3OB/9zvU6LOrEM7HZqtFBq2HMJAhMv70IISGUt0BPYKRQwc8/4qjysO+eQDKHFBZ43WIGgiLO
 o1q01crazGs28C45IMOjCqoHSh/3iGKMYcgCwXbxcQnXLIXaaoj41jxw+ZIsxDUm23GbDxbE+W6
 TBR2JqH48e6HAVk51iPYD00mn4dbPTg0SJKlTagYuekPxGKUoXw904YJ6zahRqbkfy9E6RpgDo+
 buiySKkig+2fEourHLVpTqYZTzP15dR3v2dL7GtwhuOXE9Wt8bb8aGYQN1M6sZB/UZOEFssYNbJ
 +Gn84Xh0hh72lCXxVi0VneTTpbJOdQKV44gp4H92dy4Hrgjk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation to defining the USB-C handling on MSM8998, QCM2290 and
SM6115 split existing QMP USB3 PHY schema into pure USB3 and USB-C
schema definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 132 +++++++++++++++++++++
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |  22 ----
 2 files changed, 132 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
new file mode 100644
index 000000000000..868fabd44d72
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,msm8998-qmp-usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP PHY controller (USB, MSM8998)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP PHY controller supports physical layer functionality for USB-C on
+  several Qualcomm chipsets.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8998-qmp-usb3-phy
+      - qcom,qcm2290-qmp-usb3-phy
+      - qcom,sm6115-qmp-usb3-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    maxItems: 4
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy
+      - const: phy_phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-qmp-usb3-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: cfg_ahb
+            - const: pipe
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-qmp-usb3-phy
+              - qcom,sm6115-qmp-usb3-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: cfg_ahb
+            - const: ref
+            - const: com_aux
+            - const: pipe
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@c010000 {
+      compatible = "qcom,msm8998-qmp-usb3-phy";
+      reg = <0x0c010000 0x1000>;
+
+      clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+               <&gcc GCC_USB3_CLKREF_CLK>,
+               <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+               <&gcc GCC_USB3_PHY_PIPE_CLK>;
+      clock-names = "aux",
+                    "ref",
+                    "cfg_ahb",
+                    "pipe";
+      clock-output-names = "usb3_phy_pipe_clk_src";
+      #clock-cells = <0>;
+      #phy-cells = <0>;
+
+      resets = <&gcc GCC_USB3_PHY_BCR>,
+               <&gcc GCC_USB3PHY_PHY_BCR>;
+      reset-names = "phy",
+                    "phy_phy";
+
+      vdda-phy-supply = <&vreg_l1a_0p875>;
+      vdda-pll-supply = <&vreg_l2a_1p2>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 15d82c67f157..1e2d4ddc5391 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -20,15 +20,12 @@ properties:
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,ipq9574-qmp-usb3-phy
       - qcom,msm8996-qmp-usb3-phy
-      - qcom,msm8998-qmp-usb3-phy
-      - qcom,qcm2290-qmp-usb3-phy
       - qcom,sa8775p-qmp-usb3-uni-phy
       - qcom,sc8280xp-qmp-usb3-uni-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
       - qcom,sdx65-qmp-usb3-uni-phy
       - qcom,sdx75-qmp-usb3-uni-phy
-      - qcom,sm6115-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
       - qcom,sm8250-qmp-usb3-uni-phy
       - qcom,sm8350-qmp-usb3-uni-phy
@@ -93,7 +90,6 @@ allOf:
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
-              - qcom,msm8998-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy
               - qcom,sdx75-qmp-usb3-uni-phy
@@ -108,24 +104,6 @@ allOf:
             - const: cfg_ahb
             - const: pipe
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qcm2290-qmp-usb3-phy
-              - qcom,sm6115-qmp-usb3-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 4
-        clock-names:
-          items:
-            - const: cfg_ahb
-            - const: ref
-            - const: com_aux
-            - const: pipe
-
   - if:
       properties:
         compatible:

-- 
2.39.2


