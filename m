Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 789815659D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbiGDP2M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbiGDP1z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:27:55 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C6810564
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:27:53 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y16so16312992lfb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0WD/3S3OaEUwW6Va+I3QE0vQ53lrpCL74JjF6Ofi+s=;
        b=ntDonofKOutOH1FRCDXDbD4zhM8ZemEElwP75BG0Rzj5jwDA+pCsXFjFK2Zb3drec9
         6rjotxOD+9n420BlPB/9gkqSf6J29xOJghoQhwqKu2NMrTo0XT8BHV2fVs9Gb+1VE0E5
         yNojLIziW6jCy+bXDn0WlaXTEdQiLMyelv4y0VVit6/zJDxcp3zDQ8JxR4I6ZNtf8Fpo
         YS0S5DXHDBuCZXYRJtNP+vIgPmVR3pUO0MMx8gdcQYLHKVnweNdKRVBK57MZb5cZlwVI
         KfhaOLBIjIKYkm1YDvsf9hwvqB+Wk5BSrp8EHVV9TZUj6GJsGm/DVrrwHtSdhrPAojI2
         fwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0WD/3S3OaEUwW6Va+I3QE0vQ53lrpCL74JjF6Ofi+s=;
        b=T5MU9noM76fQ2K6AilYSGWhZVQj6WjHpaW9h1k/1EXPDRWu+kKZ13GD4atRYaIjFod
         8n/NJvkSGfYfah2ufdVw7PzvrOXVYSbCrJs2iRUtQF2q6uYds0PTaK/SGR3HvkczyFIr
         IPov1ZFKEwEohQtl3yQuhVY6PLNEH1A1EFOmRLkwFFsEZ1bGgqjsnEz02Zjx6sdlvLlI
         9I47woEJbC4hmU5Iy7GWE4ZfDGtPusr3qsDEAdRf9B9l8q6wsHnJ5FYZqdi85tXOeali
         SfhTK7MNTWaN3BS+drHlk9MdKrcblwYuOtYnDVF1/sL7aBvqfPhAx3H0L3opRs8u6+7u
         vWCQ==
X-Gm-Message-State: AJIora/G6SYycCx5/jfbc+OqxrmYgJtrCvLqVUxYIPZHAYWlHC7gscda
        j//wIYraGrfMm9H4ul7AcS25Yg==
X-Google-Smtp-Source: AGRyM1sGarJARFl4uQhI23UHwrKmhlsUsE3vrTkq/dp+Myf/Uf7TBRx56I8n2nyrpa+iEPXxSWtNJQ==
X-Received: by 2002:a19:6a03:0:b0:47f:9613:590f with SMTP id u3-20020a196a03000000b0047f9613590fmr18615453lfu.301.1656948471922;
        Mon, 04 Jul 2022 08:27:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h14-20020a056512220e00b004786eb19049sm5175820lfu.24.2022.07.04.08.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:27:51 -0700 (PDT)
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
        Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v16 5/6] dt-bindings: PCI: qcom: Support additional MSI interrupts
Date:   Mon,  4 Jul 2022 18:27:45 +0300
Message-Id: <20220704152746.807550-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
References: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 51 +++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index c40ba753707c..ee5414522e3c 100644
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
@@ -623,6 +624,50 @@ allOf:
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
+              items:
+                - const: msi
+        - properties:
+            interrupts:
+              minItems: 8
+            interrupt-names:
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

