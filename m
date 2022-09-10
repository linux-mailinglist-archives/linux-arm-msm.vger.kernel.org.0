Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9640E5B449C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 08:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiIJGcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 02:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiIJGcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 02:32:35 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B03DAE21B
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 23:32:22 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d2so6607670wrn.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=g2cRg6vja1xVLyvuk31wUicvTsmqZJjRGy3zZQep69w=;
        b=gPdrnmuPn77o8HVG6IUn596O9hfZI6jr9wJlrxIwXr4tn9LE/Rwikk6FDJ+MiH8c3L
         bimiHBpWLM2YeP+wV4JB7R4YCmRKyWQeDjjcqkfoV8+eTRs2u1aq9VaZ8bwglBHcPKNK
         1XATRAXX8ds5H76/g9PhMrY6YE3Lw6o3AgVeklmmrpvAh2sXBR5aBMt4YRtrX6iJWULF
         JadGls0oPbJdgBdq4CPEaVnAU4HmXWk6nANY59XxiSAQ6pxDXvqdFiRVazf229Jja8yt
         eq+KURMPSdqFPmFZg/PsO8FFGBKmGie/8KdQ6lNv/GntocxrkY+p0lbZOITS9Ks7PfDf
         3crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=g2cRg6vja1xVLyvuk31wUicvTsmqZJjRGy3zZQep69w=;
        b=xlAvFMbFlFmFblR4NX4eqeg69Gc4idxiDvhcWAFevPm7ucWH+DU3ZidiJiAbrIb8JG
         zgbOfzXtK1Ci/TLpT13wzyZuk30V7weXl3uwbJSySFK8qXbLVeWYOlHM06J0vvDaGakr
         3N5c3kudRVM6QpyVpQFE7+jTOToqCakn2ZJ+hhTSsh8XhSs1voOA1jp4d8C0xZeyMGdR
         IRrU5wH6v+cpnin4/DNQoIhlLiJZ+VvzQ4uqx1PVxfbkKcOTfPqJdMlOhXwQym8d+esR
         tEq1J9AzRe5Thxfx7jGpzEraIFx4RLx/MElioSLTqL2dXiL4jpwKdw1e+OKOkeoCFSDb
         CSww==
X-Gm-Message-State: ACgBeo2Q335x0LM85w7lDK8W53dm7dsPLoV7pA6PYCe9FEHwVPrE1d1r
        mHktvw21s9xcfvXVQOweMCLJ
X-Google-Smtp-Source: AA6agR6TKT1M3WAffPM55QUeI+tz68QvLvb4lXO9kJncgFLfYcQTyMeTv4jjCZKc/7CV92cfLG/mHg==
X-Received: by 2002:a05:6000:136b:b0:22a:3b92:4c05 with SMTP id q11-20020a056000136b00b0022a3b924c05mr3775896wrz.183.1662791540600;
        Fri, 09 Sep 2022 23:32:20 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.47])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c4f9000b003a5c7a942edsm2828122wmq.28.2022.09.09.23.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 23:32:20 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 10/12] dt-bindings: PCI: qcom-ep: Define clocks per platform
Date:   Sat, 10 Sep 2022 12:00:43 +0530
Message-Id: <20220910063045.16648-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220910063045.16648-1-manivannan.sadhasivam@linaro.org>
References: <20220910063045.16648-1-manivannan.sadhasivam@linaro.org>
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

