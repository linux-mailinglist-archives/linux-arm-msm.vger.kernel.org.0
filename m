Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C395A6918
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiH3RA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 13:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbiH3Q7x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 12:59:53 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FD0B99F4
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:59:38 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 76so11944702pfy.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=+nFPGJL9DaKSTkpdD0XYV1f18/EerKy4FdCtQJJTq78=;
        b=lfYKqROpmRlpL3DqSB3zms6UXIsfrOhcyDkVHVwWGZBmQJlIujKVnDe0bdyC6sgfRj
         ftdTGzaBqQWGuuFzl8lPLDYvJjVzlxtjCN+BwQZ7TBAYHiuT4y4OC3g+75WjH9btWhB5
         8VdqYpb4VvouExkYDPiys+cnmABpX+b09ekFCYrpw3l46AZtwG/HNFXGGzZGfWBcKiUz
         XjnV4OfrLh1NkRG3EcSURvdtK36MmvcpRG448GOo51Q2qqp1/CDjK+aC8qFeh27tdUmi
         hJnXjjJWUZpkuKXakafiA+diQVRNxW72lCGXGj5UGubrUXlirQvHdqqq2CFiSp+jCDX9
         fKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+nFPGJL9DaKSTkpdD0XYV1f18/EerKy4FdCtQJJTq78=;
        b=km/ZZfdaypD1Ee8IvmqTacdpmS2R0hECNqJFdZINUsouPT21B8PkmWQhENIM3mhFhs
         mk3aQPO4i9/EkbT118ySEfzKAnnVbxH4xMPiHPErkEimnL3S8dPoOVbl+d6/mLsu50Ov
         Zitzv2fLcl1QNCIyZG6PZITkGQPle1BQBmhTABvLzMnCaxffkwEs09RlqGm5u9N1lonx
         nU+G+0g8kq5LVTLRa+JwOtcsNaqc+xDv5frn/JnO4T15LrsgWxVtMA2lTjicXA9SOXYO
         sDwhdaRwgJOFLICkBdrteAXjP5TBw2oKl+UzaapR4OS3aSkuhg4+m1rUa8bfHVAoKWRU
         SCbA==
X-Gm-Message-State: ACgBeo3lE4MdMHneEzkTpZHkB1PsJkFa/GwO+nQauzCbUF2D3B6fmd9w
        ZQGqbxnDdRpPTzV++W1CQsa3
X-Google-Smtp-Source: AA6agR4UjtYECqhqxWpR8YXyyfnUouq0WDy0qcGXLSRGaEeA4KOLING/BPaATbhjwzc+TK8sBdHqCQ==
X-Received: by 2002:a62:ed08:0:b0:537:17a6:57aa with SMTP id u8-20020a62ed08000000b0053717a657aamr22483376pfh.6.1661878773041;
        Tue, 30 Aug 2022 09:59:33 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.234])
        by smtp.gmail.com with ESMTPSA id n59-20020a17090a5ac100b001f510175984sm8841261pji.41.2022.08.30.09.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:59:32 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 09/11] dt-bindings: PCI: qcom-ep: Define clocks per platform
Date:   Tue, 30 Aug 2022 22:28:15 +0530
Message-Id: <20220830165817.183571-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830165817.183571-1-manivannan.sadhasivam@linaro.org>
References: <20220830165817.183571-1-manivannan.sadhasivam@linaro.org>
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
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 51 ++++++++++++-------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index b728ede3f09f..a15e71491722 100644
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
@@ -112,6 +95,36 @@ required:
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
+          maxItems: 7
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

