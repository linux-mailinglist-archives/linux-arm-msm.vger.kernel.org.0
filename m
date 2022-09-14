Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3776D5B8278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiINH4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiINHzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:55:40 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AF82317A
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:55:03 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so18076017pja.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UjeSr7GmOsJMT+Z5PzuL7iC6REVk9JcijrDBIjQQMQs=;
        b=EN6Ft8Rz9yghwWkUn60ljbTMJvs7oQkdctRPhspX04PXtDiKzJlZelV6ThXigY9vIy
         slMpTByqT+wwa0qsNA67qOffrtIkd22b8KzKhha9CkEqh1lGRYDsR3gQrrRRDipaFV4J
         fZ+XhrDVHScaaiWqzgXw1iGhJLchqgsbWMEK//KmkWpNehAwjlsfXouybNflY09KEds1
         ELmpdZyOcvpNCIK5bj/3DGz1xnJThayB2DLoZ9F8XC1y3OPcc8CGgg8dia/1nkwjzWbU
         ffxH3X93K93wfn6c7ARHhTO2YV9dKE3oX7l07aYsSrAd8g13A9bUgM5ISs0L2XQ1qnZT
         2pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UjeSr7GmOsJMT+Z5PzuL7iC6REVk9JcijrDBIjQQMQs=;
        b=32C1UH/wJCFimiAlYZv03VHnbtfGVx2SY8tiGWoregTqgeJGVjuhTFeG8pf2Cz+qfX
         luHWjI9Z4a6fnxDD+aLfOGX6Q477HwooqPOBimWTql3yeKyJ+eg2mId6QzIa98+sEpvj
         0T3BwY/t7c14MtAnU0RqVqgcgd4bNkBXwdACvsi8HFRSObRONaWb/XHL5sCZJZcx7Thd
         qCjb0n7NoxAYgO1zTzFOvYLGJ6+t/fA1+TIqxOCZtr2VqjdHq09XbtNRr4+cbyT7ciQ2
         gY5NcHlV18TvmhokZrgQxJrbM0UuqZseNlBY6HTqbK1YWB4Rkhb1mQzOX+Vsxus8MNaH
         Brfw==
X-Gm-Message-State: ACgBeo2Z4IwNqsIwJaG4gw+j5dE8CPjOzpaIbmoMQPEAOfWHAukjD2CL
        BVkHlnLi5dF96Jon3vL4oEDI
X-Google-Smtp-Source: AA6agR5SGWWD95fzg7S819tEkj4IaSeAloUhWHNsvTHW9b3Ay5m7gWQ4qz8AI3tkXdh5Ecf3qipDtg==
X-Received: by 2002:a17:902:dad1:b0:178:1d6b:cf91 with SMTP id q17-20020a170902dad100b001781d6bcf91mr19447796plx.70.1663142102287;
        Wed, 14 Sep 2022 00:55:02 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:55:01 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 10/12] dt-bindings: PCI: qcom-ep: Define clocks per platform
Date:   Wed, 14 Sep 2022 13:23:48 +0530
Message-Id: <20220914075350.7992-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
References: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation of adding the bindings for future SoCs, let's define the
clocks per platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 50 ++++++++++++-------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index b728ede3f09f..bb8e982e69be 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -9,9 +9,6 @@ title: Qualcomm PCIe Endpoint Controller binding
 maintainers:
   - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 
-allOf:
-  - $ref: "pci-ep.yaml#"
-
 properties:
   compatible:
     const: qcom,sdx55-pcie-ep
@@ -35,24 +32,10 @@ properties:
       - const: mmio
 
   clocks:
-    items:
-      - description: PCIe Auxiliary clock
-      - description: PCIe CFG AHB clock
-      - description: PCIe Master AXI clock
-      - description: PCIe Slave AXI clock
-      - description: PCIe Slave Q2A AXI clock
-      - description: PCIe Sleep clock
-      - description: PCIe Reference clock
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: aux
-      - const: cfg
-      - const: bus_master
-      - const: bus_slave
-      - const: slave_q2a
-      - const: sleep
-      - const: ref
+    maxItems: 7
 
   qcom,perst-regs:
     description: Reference to a syscon representing TCSR followed by the two
@@ -112,6 +95,35 @@ required:
   - reset-names
   - power-domains
 
+allOf:
+  - $ref: pci-ep.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdx55-pcie-ep
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PCIe Auxiliary clock
+            - description: PCIe CFG AHB clock
+            - description: PCIe Master AXI clock
+            - description: PCIe Slave AXI clock
+            - description: PCIe Slave Q2A AXI clock
+            - description: PCIe Sleep clock
+            - description: PCIe Reference clock
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg
+            - const: bus_master
+            - const: bus_slave
+            - const: slave_q2a
+            - const: sleep
+            - const: ref
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

