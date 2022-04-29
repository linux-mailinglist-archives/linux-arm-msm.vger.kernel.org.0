Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE30515719
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238743AbiD2VqS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238681AbiD2VqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:46:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747C57A988
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:42:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id l19so11987027ljb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yv0gh349dkp6HOvILTuJhmFSiwOdEcYUzp0dYUF2WMc=;
        b=HInIIGpxEy6Gmdrm4hlYjbU+hAo17w9JP1pq9WRGXuvAJcmKDfBOAojf4HV1nXhBnc
         gQwC//QnWYfvD+0c3Bl/b2OksrcDLrP+4fNjWlLyzuOKUBm1jJBPEk5Ns1WxOPCcCifk
         evZAi/6HZ/o6JEUl1KyGx9WNzz4CyqCLhYzePC0eaeWRS17dlmhkssuKBsQ3MEhpaUqi
         DFAfseeALvz+6X16TdehS+XUDiLbuDGyL1wCfheNr2UGyhOjnCOGE445IGIfcnXNtyMo
         PdEQ7UnGNLmfURT7tupQtdM8Ll6h8t39oXmXaoUrKq4tNCuW9OAPayDUT+KAT1qEQYG3
         SM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yv0gh349dkp6HOvILTuJhmFSiwOdEcYUzp0dYUF2WMc=;
        b=OuKHlcH89PTADjqKqJ8g5GkV91xj9fQPxode4MrVTjpamczoT+9l0eu7/Q8CWaKXEp
         b67N5fA1/CgBWsxUhrjCA/j6612ws7iZlUF2SpJBD8pHmzWF3uAEpgstieuC8zv1NHO1
         d6oeuOrIqU2rx0FmmDN3Cb5IIWFPrmvzB4o60bEb8k77Ug7GfTpn9eyM6qDsKCw/+FmR
         KHo4ufLWYKIgF029bF1CNMgrG3zJywaCOn5ZQ9gGa/yy0qakSHdOT7OIKTQ0Tp/dn5CO
         sNG13V0Dx7OfDho0agFiuG4tXd/MAp7gctWMP0QynOHlBYq/PVEP637p6lmC0QhFk5FE
         svZA==
X-Gm-Message-State: AOAM530b/dLMR/C2Tr9okdG4KL3vdY1sJCVUXd/aWqa43oaXHVmZ4ipT
        HRjurCmzxVqEnsJw+20vvJW/eA==
X-Google-Smtp-Source: ABdhPJyFxBfivDf8iSZDamxlmFEvZ2PeypSPdlKdt/6dwunzQMNlEypMO67Ig9V9r0l6XFL8lxXG/Q==
X-Received: by 2002:a05:651c:1584:b0:24e:d796:b777 with SMTP id h4-20020a05651c158400b0024ed796b777mr744020ljq.3.1651268575859;
        Fri, 29 Apr 2022 14:42:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ac04000000b0047255d211f6sm30520lfc.293.2022.04.29.14.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 14:42:55 -0700 (PDT)
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 6/7] dt-bindings: PCI: qcom: Support additional MSI interrupts
Date:   Sat, 30 Apr 2022 00:42:49 +0300
Message-Id: <20220429214250.3728510-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429214250.3728510-1-dmitry.baryshkov@linaro.org>
References: <20220429214250.3728510-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Qualcomm platforms each group of 32 MSI vectors is routed to the
separate GIC interrupt. Document mapping of additional interrupts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 0b69b12b849e..fd3290e0e220 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -43,11 +43,20 @@ properties:
     maxItems: 5
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
 
   interrupt-names:
+    minItems: 1
     items:
       - const: msi
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: msi8
 
   # Common definitions for clocks, clock-names and reset.
   # Platform constraints are described later.
@@ -623,6 +632,40 @@ allOf:
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
+        - properties:
+            interrupts:
+              minItems: 8
+            interrupt-names:
+              minItems: 8
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

