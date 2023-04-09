Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6FB6DC150
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Apr 2023 22:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjDIUJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Apr 2023 16:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjDIUJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Apr 2023 16:09:51 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E753AA8
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Apr 2023 13:09:50 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso5568011pjm.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Apr 2023 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681070989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wTaJuCyXlD00SHjLvnITgGqsWKx5b0Mb7VmDrRSn9I=;
        b=QbaGXRByQ8d+g0urjUhE9HkJFysukU8YzyzzMGS1vbIDOmlqMC5J1JwZEf2yXu8zl+
         JVaikt8AdE/3X6LU4dcEw2Em4PQqNzBB7WSvAGJQ4a75VhtnZLKaFSAsz9DkNobaLCIe
         jA7pvISJKv/GOeIp+bIaH18j4gf9vuuyqyCAi0p3jN2RhPLI37BsCzIkuQ/okO0kkQWJ
         fJpkJfI1PmrnOoyJJcuCcOkPyntka6ekshhqc9woDxmxUX+m5shdLXNPOVORHzCRvoBo
         qdDyas5yrWwJMVPW6kOYviHJFZxI8Gzb8CiUlE0f4ZjtmeS3xPqCKpmJPYqeEn6erzZw
         HPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681070989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wTaJuCyXlD00SHjLvnITgGqsWKx5b0Mb7VmDrRSn9I=;
        b=IsOfawUwVUAKEJuqT6Ij9u3mg22tf1xoDGXGTZwjlf8HSxwbsEQfOAlBfAd4i9rG12
         1XnemLJVs5yFzVAJU8gDiLGg52thcOltSgAzIU2cd7PrFgzaqqNpU+aH4TkiV4DrQmJ4
         bI7APEcu0n+3Ade5SouAdNYapzWGpKn40JDWOrSn+0CBxLEu6A4slzkM6qwKWVBWTZuQ
         DsM/4eewCD6Ask95NyrkZwQ9NYvv7nluPVDbAJ5un6hEh/W0cGPuPnZ8H7OttgSEg7hh
         m3F0bfXoM1cFzYKtNu+QW6Xlr6eUb0gosZQujmAI0tow2UNbQWomnPyeMPVp/sZ3DuII
         JjIA==
X-Gm-Message-State: AAQBX9cdcjy7Uz3WCGsqbk6b18Dd35PUw4/8sglJNRWEaPGgGARQqp+G
        5ESQsJcau0Afn9ZBZmozMC1NFU+Xjy5yldH9fB4=
X-Google-Smtp-Source: AKy350bJmgPAtue3mKPe+a42LrLzoebWN8P+VCoith7puIH/Kj9XBi3TM2KRfPdJulwr7DYCL5rP4g==
X-Received: by 2002:a17:903:2943:b0:1a4:f156:a1e3 with SMTP id li3-20020a170903294300b001a4f156a1e3mr5608966plb.58.1681070989187;
        Sun, 09 Apr 2023 13:09:49 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6a11:8ba1:beba:def7:a4ae])
        by smtp.gmail.com with ESMTPSA id ji21-20020a170903325500b001a5260a6e6csm2876304plb.206.2023.04.09.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 13:09:48 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v7 1/2] dt-bindings: phy: qcom,qmp-usb: Drop legacy bindings and move to newer one (SM6115 & QCM2290)
Date:   Mon, 10 Apr 2023 01:39:33 +0530
Message-Id: <20230409200934.2329297-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230409200934.2329297-1-bhupesh.sharma@linaro.org>
References: <20230409200934.2329297-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'qcom,msm8996-qmp-usb3-phy.yaml' defines bindings for several PHYs
which predate USB -> USB+DP migration. Since SM6115 and QCM2290
nodes for USB QMP phy are being added to dtsi files by followup patches,
move these bindings instead to the newer style
'qcom,sc8280xp-qmp-usb3-uni-phy.yaml' file.

Since no device trees use these bindings presently, so we have no ABI breakages
with this patch.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 27 -----------
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 45 ++++++++++++++++---
 2 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
index e81a38281f8c..4c96dab5b9e3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
@@ -23,14 +23,12 @@ properties:
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,msm8996-qmp-usb3-phy
       - qcom,msm8998-qmp-usb3-phy
-      - qcom,qcm2290-qmp-usb3-phy
       - qcom,sc7180-qmp-usb3-phy
       - qcom,sc8180x-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
       - qcom,sdx65-qmp-usb3-uni-phy
-      - qcom,sm6115-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
       - qcom,sm8250-qmp-usb3-phy
@@ -248,29 +246,6 @@ allOf:
             - const: phy
             - const: common
 
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
-          maxItems: 3
-        clock-names:
-          items:
-            - const: cfg_ahb
-            - const: ref
-            - const: com_aux
-        resets:
-          maxItems: 2
-        reset-names:
-          items:
-            - const: phy_phy
-            - const: phy
-
   - if:
       properties:
         compatible:
@@ -318,12 +293,10 @@ allOf:
             enum:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
-              - qcom,qcm2290-qmp-usb3-phy
               - qcom,sc7180-qmp-usb3-phy
               - qcom,sc8180x-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy
-              - qcom,sm6115-qmp-usb3-phy
               - qcom,sm8150-qmp-usb3-uni-phy
               - qcom,sm8250-qmp-usb3-phy
     then:
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 16fce1038285..aa16d50c7c4e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,20 +16,20 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,qcm2290-qmp-usb3-phy
       - qcom,sc8280xp-qmp-usb3-uni-phy
+      - qcom,sm6115-qmp-usb3-phy
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 3
     maxItems: 4
 
   clock-names:
-    items:
-      - const: aux
-      - const: ref
-      - const: com_aux
-      - const: pipe
+    minItems: 3
+    maxItems: 4
 
   power-domains:
     maxItems: 1
@@ -71,6 +71,41 @@ required:
 
 additionalProperties: false
 
+allOf:
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
+          maxItems: 3
+        clock-names:
+          items:
+            - const: cfg_ahb
+            - const: ref
+            - const: com_aux
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-qmp-usb3-uni-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: pipe
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
-- 
2.38.1

