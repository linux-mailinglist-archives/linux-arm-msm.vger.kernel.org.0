Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB2A524AAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 12:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352816AbiELKqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 06:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352830AbiELKqC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 06:46:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB96212AC6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:45:55 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id g16so5978622lja.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HYUuQ4fR4SBZdSuM6IAnUnoggotKrAQZZIhO70s2q7Y=;
        b=AI85gBhV83QDzlTqzRBGdsoUBihIpwwhPVRMB4CW6beKtsgIVT6XXsICRIh5STiXUu
         uj2M5iqfyFYsTe0u/w4LgGb6dLr5pYaS3qXJNRc+H6gf4Y3jSoFfLkbZ7OJbyDSk4Pgo
         aXf4SJDfQyHdaX2jLjLSgwI8z1uyPGXSskEUObgrF67Kq6oiUQCo4DSYskpEJLSRKtWQ
         klBldhv0VV6svTU1t4bhN7MrBJHrF2OjBKFiES87FiX9wQD+aWf1dnUPXpOmt/4sXXws
         PWOdmushnyirUUTxllzccd6AeFxTJSZG1BcDj4WHymTj+thLkSP7HrALyAr/QN14AbGS
         io0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HYUuQ4fR4SBZdSuM6IAnUnoggotKrAQZZIhO70s2q7Y=;
        b=kbrP5IVXQIhnWSNvVio5mP6N+oE78heBqiXu2v3aLdNOpKGWRx8LY5qNJdSeF49tqr
         K2OjDdWfSHZzcAuJAymzQ1ZF1AEI/supnvRceQVMxsqKxXErE5Tc9lMsijvjzHRVfGAu
         T+Wnyl9z6N3C0b7sd7wGTjnhg5tdFFtpd3HAnRubQFLOuZFjk3tVHWiHkq70jbmzHsP7
         Vd2d82GqJ4pL7pXiDz5IKHBv5dObFZ+pzou5qOTux5fobdcqBcACMB+SJlKMHUTGt2OD
         B030Wxud7KFAfXZXTgMc5Dpt0yKuBekQwjpwx4cw0aWXiys8cNLNTn+ciIXa3lv/o0PG
         W57Q==
X-Gm-Message-State: AOAM531Jn7qexuYAz4zkIoTejy1VRLoWLUVjG5TOSH8WFLeZEGKGS5Iq
        XQTkyx4mfCathbrVJBe6php7/Q==
X-Google-Smtp-Source: ABdhPJzPor8TdDJcn8mGSUdKJQz7zY6//R7YZZKN7pVdivQ230Ba4iZ6E3PC8j9iImLdqUkr7dBVXQ==
X-Received: by 2002:a2e:bd83:0:b0:24e:fe7b:7235 with SMTP id o3-20020a2ebd83000000b0024efe7b7235mr20276619ljq.409.1652352353242;
        Thu, 12 May 2022 03:45:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q21-20020a2e9695000000b0024f3d1daeafsm831660lji.55.2022.05.12.03.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:45:52 -0700 (PDT)
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
Subject: [PATCH v8 09/10] dt-bindings: PCI: qcom: Support additional MSI interrupts
Date:   Thu, 12 May 2022 13:45:44 +0300
Message-Id: <20220512104545.2204523-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512104545.2204523-1-dmitry.baryshkov@linaro.org>
References: <20220512104545.2204523-1-dmitry.baryshkov@linaro.org>
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

