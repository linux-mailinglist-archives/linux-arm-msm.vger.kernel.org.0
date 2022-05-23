Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5893D531CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 22:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiEWSmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 14:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243625AbiEWSjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 14:39:02 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271DF177068
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 11:19:03 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q1so8519693ljb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 11:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HYUuQ4fR4SBZdSuM6IAnUnoggotKrAQZZIhO70s2q7Y=;
        b=QYYWiNQNm/oL2rplHN7Uw+iWwXFrRQe1iC//feAzu915Y1wyqCc8WmJdUnWIVcSqhh
         JMHtqXXBevW9e3pAJQrzhLoE135R2wRo6jqCIeGhT7z2v2J9nqL0cO3ojRgJXNc25DDn
         K1AMMnczOGAdGeZYElB7lCYf+eMNvGWSLj1GgThKm5rz4nW8WGc+EZVQMHiYsjBw9HDn
         DJ97MQBp1xbl8ONATS4C/0/GUFR4GIqgk7XNxbhWWqUE9wvvLd8T1HEUymVp5sk7pz8y
         h/aR75FyE6eH1XaMUN8vgAajV52nsEWoqG7oNdCuNKrsZ/robtm69oUaz3M3tTnInG4k
         7QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HYUuQ4fR4SBZdSuM6IAnUnoggotKrAQZZIhO70s2q7Y=;
        b=Hb+t0L+ykNjTQL6XPDQzXSrkRrt2TLpETlc/jDQLNo/2CpPPCnQDlzf2tHvVGwOUa6
         RibeuwooC7APxTOvUUyadKgKpJBErHeXkIaBKF/ksVn/VmjrAUlOWtRSd67FEYyJVnau
         +OmRD+wNKud0GVAq6wGWq2QFWG6/JYkkpwRA5i9o6RAKXRnFYGPpdf+f+gph82lb7O2Z
         99ykUkZmzqjOigpoe1dfON3/fgD0hdYhMeqBO5p/huKS/fAXWYr8c+2RHVMmGVmFgZ+J
         6ry2aZHlH2f7b0CGhiST4laHNv9KjAtq8LaRBxGs4a4uL/SX6pWyZ3gNKaoV+b2fzIzY
         /o5g==
X-Gm-Message-State: AOAM532RgVIDHBkT6pz7KnRaz6arOJr3cknp3FskCuGs9r+yP0NZwNHC
        albN+q3Nepbh6yup8wDpNrfYqA==
X-Google-Smtp-Source: ABdhPJyVKnlZ6ujYgGbG9H8omcqdxH5nnoRtCc1cglAPXhlprZD9wdrYIV7uDvnGCHE9LwmLh18bhQ==
X-Received: by 2002:a2e:920a:0:b0:253:e695:606a with SMTP id k10-20020a2e920a000000b00253e695606amr5585674ljg.17.1653329924984;
        Mon, 23 May 2022 11:18:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j20-20020a2e6e14000000b0024f3d1daedesm1904127ljc.102.2022.05.23.11.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 11:18:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 7/8] dt-bindings: PCI: qcom: Support additional MSI interrupts
Date:   Mon, 23 May 2022 21:18:35 +0300
Message-Id: <20220523181836.2019180-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523181836.2019180-1-dmitry.baryshkov@linaro.org>
References: <20220523181836.2019180-1-dmitry.baryshkov@linaro.org>
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

On Qualcomm platforms each group of 32 MSI vectors is routed to the
separate GIC interrupt. Document mapping of additional interrupts.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 53 +++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 0b69b12b849e..fe8f9a62a665 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -43,11 +43,12 @@ properties:
     maxItems: 5
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
 
   interrupt-names:
-    items:
-      - const: msi
+    minItems: 1
+    maxItems: 8
 
   # Common definitions for clocks, clock-names and reset.
   # Platform constraints are described later.
@@ -623,6 +624,52 @@ allOf:
         - resets
         - reset-names
 
+    # On newer chipsets support either 1 or 8 msi interrupts
+    # On older chipsets it's always 1 msi interrupt
+  - if:
+      properties:
+        compatibles:
+          contains:
+            enum:
+              - qcom,pcie-msm8996
+              - qcom,pcie-sc7280
+              - qcom,pcie-sc8180x
+              - qcom,pcie-sdm845
+              - qcom,pcie-sm8150
+              - qcom,pcie-sm8250
+              - qcom,pcie-sm8450-pcie0
+              - qcom,pcie-sm8450-pcie1
+    then:
+      oneOf:
+        - properties:
+            interrupts:
+              maxItems: 1
+            interrupt-names:
+              maxItems: 1
+              items:
+                - const: msi
+        - properties:
+            interrupts:
+              minItems: 8
+            interrupt-names:
+              minItems: 8
+              items:
+                - const: msi0
+                - const: msi1
+                - const: msi2
+                - const: msi3
+                - const: msi4
+                - const: msi5
+                - const: msi6
+                - const: msi7
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          items:
+            - const: msi
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

