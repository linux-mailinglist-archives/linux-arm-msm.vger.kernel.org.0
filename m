Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA2B6722FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbjARQYi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjARQYV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:24:21 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3958589BB
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 08:22:44 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso287949wmn.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhbZjX/koZrX9iSh81WiUJwKhhql/MHhaB/Kr/N+S/w=;
        b=yr/9wmZiTzFYxxilRSLGpxIbrlCS5ZK5VyA5sRbddu88WfeakbJ267et7UfBOZhkzL
         C8PxREakRwiCY6uHFhdvZGYBckjHMeOpl0CGuJNamF9PdqUuaGtfD1hvcfBrXHpAWPxV
         Ghjuz9jwroP90wZodO67XTyqIBdEQfbismAZmoB9AiaF3MxmB3jyuwpMgNG8GuzbIq7y
         kiRN6B0ihQ5eMRnpv8sXsUH+2d31laYsXjzTyJf4GagN78tcei6oScCImsP+caau9QTx
         8enV/4WUdaHkNOgXPglo2lh75rfgkH1nGRCo4In8aRyt6xGBAHnRAX0pLzWMT8aO2bDY
         4a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhbZjX/koZrX9iSh81WiUJwKhhql/MHhaB/Kr/N+S/w=;
        b=1kXPpXnS+7KTx3Uo5oM9T08sb59bc6IcWkGFikImgtsvrOgsp+rSQBctJKAIhrwMPB
         iT7zjsrDpwv0Ompsqyi2EufVosaA8U+6lgThIEcglKO48f043fbDuZAmXL24WqfNvXM5
         PSxa5xVH4bJocLulfo/HRHz4oEnJmeU8JxogGX5g/TWCfMYyMEhRgpqw4kNhEjxy68ka
         vLPkYglg1/sJXj4d7dWyQac8oaZYqlm5MNImhev0S1vcuhwi1BDwFhjMr4izdxI2pS8f
         5998tXp5+M0d0amDcGYqvEE+iKDts33adEa4n691lwnCixLmR1FkGypBbUZnoxM2uooz
         xdvA==
X-Gm-Message-State: AFqh2kp4shcMfkOHPPVnB39LNwul/oNOxYhHbUHID3e5K/x8sxJdmmIS
        RA+7Ir3uxJWqWaj5cnmnDqtKvg==
X-Google-Smtp-Source: AMrXdXvMYEjz/xdcBYIRDbh2a4jrJIHNl505YxCHZvp+zi/0bFGENp2nhe7nwKmk7s5aaE3zgSXVuw==
X-Received: by 2002:a05:600c:4910:b0:3d3:4406:8a3a with SMTP id f16-20020a05600c491000b003d344068a3amr7562958wmp.30.1674058963373;
        Wed, 18 Jan 2023 08:22:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b003db0dbbea53sm2744393wms.30.2023.01.18.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:22:42 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 18 Jan 2023 17:22:39 +0100
Subject: [PATCH v4 1/5] dt-bindings: remoteproc: qcom: adsp: move
 memory-region and firmware-name out of pas-common
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-1-54154c08c0b7@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-0-54154c08c0b7@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-0-54154c08c0b7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc:     Alex Elder <elder@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move memory-region and firmware-name definitions out of qcom,pas-common.yaml
since they will be redefined differently for SM8550 PAS bindings documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml       | 4 ++++
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 8 --------
 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml | 8 ++++++++
 .../devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml          | 8 ++++++++
 .../devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml         | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml  | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 8 ++++++++
 10 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index d3bfc0f472a9..643ee787a81f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -40,6 +40,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Reference to the AOSS side-channel message RAM.
 
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 1d5e01c8d8bc..171ef85de193 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -52,14 +52,6 @@ properties:
     minItems: 1
     maxItems: 3
 
-  firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: Firmware name for the Hexagon core
-
-  memory-region:
-    maxItems: 1
-    description: Reference to the reserved-memory for the Hexagon core
-
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index 007349ef51ed..5efa0e5c0439 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -41,6 +41,14 @@ properties:
   power-domain-names: false
   smd-edge: false
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 6fd768609a66..5cefd2c58593 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -50,12 +50,20 @@ properties:
       - const: mx
       - const: mss
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
   qcom,qmp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Reference to the AOSS side-channel message RAM.
 
   smd-edge: false
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
index 3026cfde5582..c1f8dd8d0e4c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
@@ -37,6 +37,14 @@ properties:
 
   smd-edge: false
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index c08274aaa6f8..f6fbc531dc28 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -37,6 +37,14 @@ properties:
 
   smd-edge: false
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index cbeaa00ca4d4..c66e298462c7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -45,12 +45,20 @@ properties:
       - const: cx
       - const: mss
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
   qcom,qmp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Reference to the AOSS side-channel message RAM.
 
   smd-edge: false
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 911529400142..fee02fa800b5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -35,8 +35,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Reference to the AOSS side-channel message RAM.
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
   smd-edge: false
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index b934252cf02b..2c085ac2c3fb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -39,8 +39,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Reference to the AOSS side-channel message RAM.
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
   smd-edge: false
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 853f97d6879f..af24f9a3cdf1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -42,6 +42,14 @@ properties:
 
   smd-edge: false
 
+  memory-region:
+    minItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - reg

-- 
2.34.1
