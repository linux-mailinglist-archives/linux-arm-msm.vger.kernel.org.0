Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD0C51DBD1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 17:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442808AbiEFPZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 11:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442793AbiEFPY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 11:24:57 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353966D19E
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 08:21:14 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s27so9663634ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DldukvjOY2Z/KNrBxZEZWOyWwCLmTZVbU9USIroNwIc=;
        b=SDC+E1/tL/CTXAzfyaYvMszx0Acrbgap7rZhD1gKhI2WxKl+EnYpCXzZHZT7+AZZeM
         QU/+IYV0lY5Mcrvfkqt2hM6CR18IXckVGN/OyUtRxNxB3zDjimnFth7uFBWg1Gl4Gzef
         2idxhIUZuSJSYztjbGlt21G5MrfT9wFPtMto98tMSHZvVKraO5g1ecZHvN2QPz1XPovK
         S6ay3doAfcFbDMKAwqgqflnv0C/oLJj4hnwJlDDV4ayvToyzpyRH22UbrRo7h7oETj5d
         A6ikOMPLTjihn10apIqaSTBFKwZ9ZrNZnNI/DHq/+jWA9ULVZHaeIwPWLY0Y9AAl75/C
         fGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DldukvjOY2Z/KNrBxZEZWOyWwCLmTZVbU9USIroNwIc=;
        b=aFgNxzl64RIQ6J9Mx3SbkioUt89Bpxq92sqQfDITMku41xa2M25fxfWixDnJGrLZjW
         u7NKi/IJYaB3QrcL8awpHCi2jvAn8ZnQlbCMWJKgV4hFMeMwYjZA4zsykkr3wlbxyoQ5
         a+25+C9kL/97hqL5kf1uqt8BvAT8KBdE2VQB6KvV8oZ9AkJ9yL4qvaO5FS3KvywYc8cH
         ZBRtIN63vn1oBtZra7smFuUm4tiMzdH2rkBhVC6qgLiojSy93BwzdncezFwxJ1pyvjf8
         g3MV+O38vN6SpmoYjlK5jyJiRAnFK/igWfRQ1SVCVKgtY47CI1j5z7xx8HZlJOBNDn01
         htxg==
X-Gm-Message-State: AOAM5300ha7SXJl1pB/Cx99soNejLtfOmPilFS5BjIu9mHArIkkWtESG
        n0bvBgqJmhhcxPGuem5m4YrPsQ==
X-Google-Smtp-Source: ABdhPJx/9GSPq3e9SV0ZZu7HhjfaZzMiLaZxLGYJ+qEfdFtTLuhqGMtaD3a5I/Ddx3m8P5rrEW15Ug==
X-Received: by 2002:a2e:a794:0:b0:250:5de1:1ec5 with SMTP id c20-20020a2ea794000000b002505de11ec5mr2258286ljf.270.1651850472540;
        Fri, 06 May 2022 08:21:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651239d000b0047255d211e6sm716757lfu.277.2022.05.06.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:21:12 -0700 (PDT)
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
Subject: [PATCH v6 4/8] dt-bindings: PCI: qcom: Add schema for sc7280 chipset
Date:   Fri,  6 May 2022 18:21:03 +0300
Message-Id: <20220506152107.1527552-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506152107.1527552-1-dmitry.baryshkov@linaro.org>
References: <20220506152107.1527552-1-dmitry.baryshkov@linaro.org>
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

Add support for sc7280-specific clock and reset definitions.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index e91ae436cafe..0b69b12b849e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,pcie-ipq4019
       - qcom,pcie-ipq8074
       - qcom,pcie-qcs404
+      - qcom,pcie-sc7280
       - qcom,pcie-sc8180x
       - qcom,pcie-sdm845
       - qcom,pcie-sm8150
@@ -177,6 +178,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pcie-sc7280
               - qcom,pcie-sc8180x
               - qcom,pcie-sm8250
               - qcom,pcie-sm8450-pcie0
@@ -412,6 +414,36 @@ allOf:
             - const: pwr # PWR reset
             - const: ahb # AHB reset
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-sc7280
+    then:
+      properties:
+        clocks:
+          minItems: 11
+          maxItems: 11
+        clock-names:
+          items:
+            - const: pipe # PIPE clock
+            - const: pipe_mux # PIPE MUX
+            - const: phy_pipe # PIPE output clock
+            - const: ref # REFERENCE clock
+            - const: aux # Auxiliary clock
+            - const: cfg # Configuration clock
+            - const: bus_master # Master AXI clock
+            - const: bus_slave # Slave AXI clock
+            - const: slave_q2a # Slave Q2A clock
+            - const: tbu # PCIe TBU clock
+            - const: ddrss_sf_tbu # PCIe SF TBU clock
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
2.35.1

