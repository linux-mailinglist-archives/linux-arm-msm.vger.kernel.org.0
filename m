Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5BF50D204
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Apr 2022 15:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbiDXNXy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Apr 2022 09:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbiDXNXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Apr 2022 09:23:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EA364D8
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 06:20:39 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w1so21906350lfa.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5tyniSskDTIXODGPLs+HB18G+we+Q5MAKVT2YXtvq24=;
        b=qKedvybloeH7alrveMpSKmACShSnfnPehnvmXTwmgXvZYR0gJCuBTBwNIbiNf7b9M9
         B5HB7qSD/bcNbJGG/hOAF/2P7dG9XU35FP8p8zY89DReaR8Gm8XoyJwTsZbYAO/jIKnC
         SwmaGT5biHFN8pszuOorU0Hj6PGk21CRITrTf1xv6knLzHq9yjQ5LYjof4svdqNJVrQy
         OnibG9ZXSRjMiFvc+GgB3zl6pp3Quxfi4DmxjnnlEdcnB1bjdgVNnz1NLqYfb7LPq47D
         T/Woxh/LDWC9AYwi2VniXubj9MciBl2w4VX30lKyRtdo3GjBVEkCaUNGqlH/AtNzQ82j
         7XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tyniSskDTIXODGPLs+HB18G+we+Q5MAKVT2YXtvq24=;
        b=n3o1bmQECq6yVj/JQH1tMXStMQLg/u7n7htU72hWGcF5+SjV3SNCLprCeB4dIxdRLR
         YKgXmWOWr2tNOKT/MH3FFtUqSKqDpHYAlYyUgzhI2eV3TiPS6Te8uQH6Rzn9My012Wx/
         UDuVu0ZczN95ZmUfhMoCCEeHyZ9L2Hhjylz9zHrBEvHI1fnKTMw3gc9qQhdKLI9m94T4
         t9Ee2yvtgBftJXVGo2YVjiZUGM4FWv6C7zVN0r8sVxREHx5oVrsx+dKE9l31QOSQJkSV
         biuOOmPJZuXyQiQFzxpqNQix/kkNrkdToLpOORZMkRcJKSo1DEpI3wiBOfKTvKjvo5bd
         HoGA==
X-Gm-Message-State: AOAM533SStpOr7z9pAGN7Pfutk9zkdXu0VOM2hIIo2EnJ7UB4kCrYSGW
        nk0mIIgnzeIGlR80ujc108gjRQ==
X-Google-Smtp-Source: ABdhPJyh5tJkh3oKNbJrxtmfyOAbJbC2niaUzq0/bWEV443N8THcaqhkmoZGvQfRjj1FF539AZxp4Q==
X-Received: by 2002:ac2:4892:0:b0:471:febe:2e7b with SMTP id x18-20020ac24892000000b00471febe2e7bmr2773606lfc.69.1650806437950;
        Sun, 24 Apr 2022 06:20:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l12-20020a056512332c00b0046d0e0e5b44sm1015877lfe.20.2022.04.24.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 06:20:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 3/8] dt-bindings: pci/qcom-pcie: specify reg-names explicitly
Date:   Sun, 24 Apr 2022 16:20:29 +0300
Message-Id: <20220424132034.2235768-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424132034.2235768-1-dmitry.baryshkov@linaro.org>
References: <20220424132034.2235768-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of specifying the enum of possible reg-names, specify them
explicitly. This allows us to specify which chipsets need the "atu"
regions, which do not. Also it clearly describes which platforms
enumerate PCIe cores using the dbi region and which use parf region for
that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 91 +++++++++++++++++--
 1 file changed, 84 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 3a1d0c751217..c79b12a0d315 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -39,13 +39,6 @@ properties:
   reg-names:
     minItems: 4
     maxItems: 5
-    items:
-      enum:
-        - parf # Qualcomm specific registers
-        - dbi # DesignWare PCIe registers
-        - elbi # External local bus interface registers
-        - config # PCIe configuration space
-        - atu # ATU address space (optional)
 
   interrupts:
     maxItems: 1
@@ -116,6 +109,90 @@ required:
 
 allOf:
   - $ref: /schemas/pci/pci-bus.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-apq8064
+              - qcom,pcie-ipq4019
+              - qcom,pcie-ipq8064
+              - qcom,pcie-ipq8064v2
+              - qcom,pcie-ipq8074
+              - qcom,pcie-qcs404
+    then:
+      properties:
+        reg:
+          minItems: 4
+          maxItems: 4
+        reg-names:
+          items:
+            - const: dbi # DesignWare PCIe registers
+            - const: elbi # External local bus interface registers
+            - const: parf # Qualcomm specific registers
+            - const: config # PCIe configuration space
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-ipq6018
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        reg-names:
+          items:
+            - const: dbi # DesignWare PCIe registers
+            - const: elbi # External local bus interface registers
+            - const: atu # ATU address space
+            - const: parf # Qualcomm specific registers
+            - const: config # PCIe configuration space
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-apq8084
+              - qcom,pcie-msm8996
+              - qcom,pcie-sdm845
+    then:
+      properties:
+        reg:
+          minItems: 4
+          maxItems: 4
+        reg-names:
+          items:
+            - const: parf # Qualcomm specific registers
+            - const: dbi # DesignWare PCIe registers
+            - const: elbi # External local bus interface registers
+            - const: config # PCIe configuration space
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-sc8180x
+              - qcom,pcie-sm8250
+              - qcom,pcie-sm8450-pcie0
+              - qcom,pcie-sm8450-pcie1
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        reg-names:
+          items:
+            - const: parf # Qualcomm specific registers
+            - const: dbi # DesignWare PCIe registers
+            - const: elbi # External local bus interface registers
+            - const: atu # ATU address space
+            - const: config # PCIe configuration space
+
   - if:
       properties:
         compatible:
-- 
2.35.1

