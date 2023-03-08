Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E6D6B0119
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbjCHIZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:25:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjCHIY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:24:58 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D393F2A6E2
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:24:45 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id ky4so16975816plb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678263885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWGkUKxc1+RShsSquL6TSNv4d+3ZNQVwM0OHF82Nolc=;
        b=nnv0TKxz1LQVhz72XMyVwhz2edQHF5C8K/gYRQygBo/yk+Dbv/xU+iD8tOrKpBybxo
         Th40/nZ5t3RuUuVaBM6w9/X487xPXQIMTOKM9TbKVKor+Z0RVV2eYg8W8PhlRGiSX/kh
         ddWdEZIFEpMwK++1pKPLAP1lGQcQYlhaYBvzvGWLWaFB70c6ZfKmR0GdchQKNjwHjGZc
         iN+14smx3G6dHXcmkw1THuLbzgflDB5QFz+VmZr10YyKqLAPt7GpI7XLw4ybBEWFJWv7
         Hrj4r6bBgz9hKSJUOWbkNDVSPO/ri5RP9664q/ztWxL4fVHCC9ZgzTxmkwpwyZYGN4gi
         v6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWGkUKxc1+RShsSquL6TSNv4d+3ZNQVwM0OHF82Nolc=;
        b=7C5kGqVtFVKQWU1XBZ2WLUoZGQKU+rC5f/UD/cwJJwstM35Z5o3S0AX+jzkmqqaqVg
         ufS4x7F1bs33nyvwvwqNp7dLJKSSkx3Le/G7ZZyBvUt4whVFeirIiCrT905DE/GwiTrC
         1Mx16M4BONdIwdaRjNb5aHSE1c10p1MgxXncoIAylGWwdoLf1OSRqmmAH3txmRcme7s9
         Hn/A5nBwyxayTgZ9k6rxSG0PlHiqtPRWWXGDKQrnufK3hzO14TcBZw+CdwTiUk8/teKK
         bVYPxBddhF2BFGxSD7qg2TPiAYxb2L93xA3uFQO/NaWLx3tQPl8u2rl9aWeDgk+x2hNB
         dexg==
X-Gm-Message-State: AO0yUKWnLpOsjzyWPEEHNbZT5Vqfc/Sn5VdyhBAxxpF2m/mHUJwq4ejp
        0mMHGT0Ozh6MES+tHkpXi2iW
X-Google-Smtp-Source: AK7set9hgLNXRCzM9+1cjNcg3cIBVdT4wUvKBQU14zJyGNk2N5NXDyJJWVjP3UoIVTQYzfWFhPYFbA==
X-Received: by 2002:a17:902:cec6:b0:19d:1bc8:488a with SMTP id d6-20020a170902cec600b0019d1bc8488amr22220855plg.29.1678263885323;
        Wed, 08 Mar 2023 00:24:45 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b0019aaab3f9d7sm9448086plg.113.2023.03.08.00.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 00:24:45 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/13] dt-bindings: PCI: qcom: Add SDX55 SoC
Date:   Wed,  8 Mar 2023 13:54:14 +0530
Message-Id: <20230308082424.140224-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308082424.140224-1-manivannan.sadhasivam@linaro.org>
References: <20230308082424.140224-1-manivannan.sadhasivam@linaro.org>
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

Add support for the PCIe controller on the Qcom SDX55 SoC to the binding.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 55ee86facbc0..35ef56553603 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,pcie-sc8180x
           - qcom,pcie-sc8280xp
           - qcom,pcie-sdm845
+          - qcom,pcie-sdx55
           - qcom,pcie-sm8150
           - qcom,pcie-sm8250
           - qcom,pcie-sm8350
@@ -203,6 +204,7 @@ allOf:
               - qcom,pcie-sc7280
               - qcom,pcie-sc8180x
               - qcom,pcie-sc8280xp
+              - qcom,pcie-sdx55
               - qcom,pcie-sm8250
               - qcom,pcie-sm8350
               - qcom,pcie-sm8450-pcie0
@@ -671,6 +673,32 @@ allOf:
           items:
             - const: pci # PCIe core reset
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-sdx55
+    then:
+      properties:
+        clocks:
+          minItems: 7
+          maxItems: 7
+        clock-names:
+          items:
+            - const: pipe # PIPE clock
+            - const: aux # Auxiliary clock
+            - const: cfg # Configuration clock
+            - const: bus_master # Master AXI clock
+            - const: bus_slave # Slave AXI clock
+            - const: slave_q2a # Slave Q2A clock
+            - const: sleep # PCIe Sleep clock
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: pci # PCIe core reset
+
   - if:
       properties:
         compatible:
-- 
2.25.1

