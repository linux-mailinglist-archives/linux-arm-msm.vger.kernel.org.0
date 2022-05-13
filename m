Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D9452686C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 19:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383012AbiEMR0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 13:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383005AbiEMR0l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 13:26:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4AE7712EA
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:32 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y32so15666277lfa.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HYUuQ4fR4SBZdSuM6IAnUnoggotKrAQZZIhO70s2q7Y=;
        b=aYogHwM28rVSe1gmJKZChmVT5a8H2SRM5oq6FocUxjQElKyDPH2lglb9Xy+suEHVQg
         h+DSYL0Ek0qZfCjRygy3aPjee9JgIEngsVqPQxXjV0XDcTITotD/988vsq+fRHie8vIi
         CLsAngRIpl9+j8MVRAy76P5cQpUY35Lv4kS6q60I0SCRhNsGDuz9n25iTJzAjHdaG3KU
         WZn/PJeTsyLTRSXxW/TU+Y/+72t/+GDyM9rT+FBgCULZgDVD1iv0sli0g1TQgD4SoYrq
         a3E6wLlKebpYmHkolrQplAEKb2bxsDznFJIjawgst+gXqGzNWR3un7Tm+AqrZNLnA7Nn
         i4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HYUuQ4fR4SBZdSuM6IAnUnoggotKrAQZZIhO70s2q7Y=;
        b=4pLVywaHnCUp97qJ+LDFnQUYLqV8rnTNxaWaPUi0i1YfcV0c8ddMlvF7qAB+xOA7FM
         Ji/LpjsGHXQmH5agPTuoasrohGJ7kG3jLBNdKhOWvdgKi0bjwfRRFSHzPcbRegecIApv
         WgDSJw4xZ9tft9i4vGWOTvjjXZ6l8jj0veEOE1Iw9OHJmSA8O2Xq/WozUHIREDb9Mb7K
         WJ7ZlH7X1z2Qso6OyaDNkTnulqdJ1VV0jWb5YnhUv6syvJu+hiC7W8Y3P4WMpT9cjcwC
         xXiGphAKy4Ckfjf5UvbvmVix/cHedl6DunBBBCwMI4XAailfBkt6mwC6HK5jE1xboqyV
         US+g==
X-Gm-Message-State: AOAM532S61483SsJ6xHbfnJ3zLXt+/hya/KT/ZrhAOllAqYmM/m8bz0T
        dITO2KlSP8squknH1NR+bmwfkw==
X-Google-Smtp-Source: ABdhPJwIIwnzoWOB5P9szj3u3+LmWWrBC088kCFePfKkRL88hnV7pM2/c7QLaTOZ8dKqLu4vrM8lCA==
X-Received: by 2002:a05:6512:31cd:b0:473:a235:1ac0 with SMTP id j13-20020a05651231cd00b00473a2351ac0mr4364227lfe.364.1652462791209;
        Fri, 13 May 2022 10:26:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e8183000000b0024f3d1daec0sm511157ljg.72.2022.05.13.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 10:26:30 -0700 (PDT)
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
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 09/10] dt-bindings: PCI: qcom: Support additional MSI interrupts
Date:   Fri, 13 May 2022 20:26:21 +0300
Message-Id: <20220513172622.2968887-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513172622.2968887-1-dmitry.baryshkov@linaro.org>
References: <20220513172622.2968887-1-dmitry.baryshkov@linaro.org>
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

