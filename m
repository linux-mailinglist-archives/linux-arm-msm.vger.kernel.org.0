Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF8C5156D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238169AbiD2VeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238008AbiD2Vd6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:33:58 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A83956F93
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:30:37 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s27so11980231ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/QSONSEpjxrPZtFb9gmtNnByfU6eZhR98/Jc/QyZERA=;
        b=x7beQQgbMAdCioc8kKhbF/1XtAbgKZJrmfwN4UDQJvgOBoX8yOsW1uf2WI30hympwW
         vmfcQP3+qHsnaeBh5WVoAFREBHqzZ9HjrC8Nwnqp/4Aam4RqaKTZj1ibJ13af+MvXTJ6
         AuIdbAUJPdIWN5CiwwF3GxNa3LecHoZQg7K+hCqnxAqfPWZ/HJxgpjIwgZZQc7RZCGq0
         +wCS6L7TBl4J/0A80LQgk//iTv04x5r5WpkTYAUh8ONF/RvrtRDp4neHw9ilAmK8S/si
         8zPQoSPCojTs9Jw5VE7J+duud6Hczq++khCk7tnNDA33zX1hVu/qtnEag+zv0yDsE1Lr
         ksmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/QSONSEpjxrPZtFb9gmtNnByfU6eZhR98/Jc/QyZERA=;
        b=hLKNy0yJ5si3aIE4xAUFs4doP9GZ3JHxV+0ZeRgiqq4iXcXqvpfpDitBs/O6Qi8ZS7
         MDObZ723azX1uFQn62cMfsqmOTu9Sfu5nVp5E5OZO8F/mkCCk4Qx8vyq5pSx936Zruwc
         d/qd/KvPawGEcjlOIVCnlmR4nCgv2OWAIaVsbtQ5zvGkALvuJaEQdZdvDOdWiqdg/wbd
         h5YjRWYhrtKxaeVB7JAD1KLFa/08uGKBbhQK9EoWHqEw+DsWRsANrCKhngEQ6aCurj0R
         CF8ZZx73J5Q9ZuFZTaK+8e2n24Wepyn2O5+OGRDr3RcX+WwGS3Ey288T4GPtAq5DEIy1
         dX5Q==
X-Gm-Message-State: AOAM5333dm3vtnRmUYrq0fb67WJ1Zn5eJJo15rW07MCIE4k+2PQboYng
        vxDX+HuAe737JhACH32mhLwzCw==
X-Google-Smtp-Source: ABdhPJzPVEt5YmDUC9irmHriMk4Djh8h64ZUV8m0yD+tN+6fOiHj3JiMVKg2hOyRleuG0mvFZN9bdA==
X-Received: by 2002:a2e:b5d9:0:b0:244:cbbe:89d5 with SMTP id g25-20020a2eb5d9000000b00244cbbe89d5mr730473ljn.124.1651267835535;
        Fri, 29 Apr 2022 14:30:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 11-20020ac2568b000000b0047255d21182sm28589lfr.177.2022.04.29.14.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 14:30:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/8] dt-bindings: PCI: qcom: Specify reg-names explicitly
Date:   Sat, 30 Apr 2022 00:30:27 +0300
Message-Id: <20220429213032.3724066-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429213032.3724066-1-dmitry.baryshkov@linaro.org>
References: <20220429213032.3724066-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 91 +++++++++++++++++--
 1 file changed, 84 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index ce4f53cdaba0..e91ae436cafe 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -40,13 +40,6 @@ properties:
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
@@ -117,6 +110,90 @@ required:
 
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

