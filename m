Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63BA361256D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 23:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ2VNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 17:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiJ2VNS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 17:13:18 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F0B3D59D
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:13:17 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id o4so12422538ljp.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swTzgpM0Pz/+17CyZPXCMYY39bgiFlYC7ketMF0VDSU=;
        b=qjDZPTSAikMnTJw7RtegzieQLRrkmgafUzkKPtnThgNEijjf25ZKWiCCeVSP1kgyHv
         cWfRIghlWgmJ66I4haQOKw8sqctrjoqjx663Dqfy0aO+AcHvoKy3TwAhadIM57/jHMBW
         ZijkEKoHFMkO6a2/RJU88Dcw5A25uaE9+Iu4Rw9AJR435Q5/VRkyMXymAMEOqml1EvfN
         zTwBlgPCzp3szymADo5qBioYfMKB2WipypdqyFDyUwkm8K8DWs/oy1+YK2WazzUAW/O/
         y8z1lZpBe9fq8cLNlOGaiN19gkFcojJR9zb+0Tr69VqE70hhX+IeGO7LcCeZ/tAX95ol
         VLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swTzgpM0Pz/+17CyZPXCMYY39bgiFlYC7ketMF0VDSU=;
        b=pJxXneYNhXSKv5a7xjt7d+NdvH0seINBcghacxcRdpZMSeRzrx7N+jGxsaoyyei2ta
         XD9P/bhSnTUFVfW7UeIQ0Wba1ZovYX2grFBZU0taYuDzyqIG7PVOXF4aa3ImkcWceRzo
         U5k2H0NbG5NGDyJnz48pI1mZh/QzRzY6bJ5WqZX10+kFJ2QIk+P1kqG3mqyhKeWXSvev
         RvVQYHqSi4opzOI+sh+FPpmiTf6dH3yMU7qj5z2ivFbzt+6VemKrNj1FA+VO8AkWxfx+
         aWVmvXVVtKPwqwL9bzcB4u02XMvaF7jaIK+zUq5CIESEdfuach1q0O1SyZfBd0ZmqICa
         I40A==
X-Gm-Message-State: ACrzQf3x3eG5Hp5G2Mr1Zy0+vesSUgdLABNDqblHk3SbMoSAh8xn3avB
        TX+ooNi1s0EZ7g/XSs8Em1eBqg==
X-Google-Smtp-Source: AMsMyM7MYkde/YdEibYj6wq2j+5pTXEeJMeIPK+cSHSOHrk7IOl01tEyuBC+b8dntHuhTnTnu1sffg==
X-Received: by 2002:a2e:5cb:0:b0:277:794:cb70 with SMTP id 194-20020a2e05cb000000b002770794cb70mr2288707ljf.280.1667077995491;
        Sat, 29 Oct 2022 14:13:15 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id j14-20020a05651231ce00b004a480c8f770sm433508lfe.210.2022.10.29.14.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 14:13:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 1/7] dt-bindings: PCI: qcom: Add sm8350 to bindings
Date:   Sun, 30 Oct 2022 00:13:06 +0300
Message-Id: <20221029211312.929862-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221029211312.929862-1-dmitry.baryshkov@linaro.org>
References: <20221029211312.929862-1-dmitry.baryshkov@linaro.org>
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

Add bindings for two PCIe hosts on SM8350 platform. The only difference
between them is in the aggre0 clock, which warrants the oneOf clause for
the clocks properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 54f07852d279..55bf5958ef79 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,pcie-sdm845
       - qcom,pcie-sm8150
       - qcom,pcie-sm8250
+      - qcom,pcie-sm8350
       - qcom,pcie-sm8450-pcie0
       - qcom,pcie-sm8450-pcie1
       - qcom,pcie-ipq6018
@@ -185,6 +186,7 @@ allOf:
               - qcom,pcie-sc8180x
               - qcom,pcie-sc8280xp
               - qcom,pcie-sm8250
+              - qcom,pcie-sm8350
               - qcom,pcie-sm8450-pcie0
               - qcom,pcie-sm8450-pcie1
     then:
@@ -540,6 +542,57 @@ allOf:
           items:
             - const: pci # PCIe core reset
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-sm8350
+    then:
+      oneOf:
+          # Unfortunately the "optional" ref clock is used in the middle of the list
+        - properties:
+            clocks:
+              maxItems: 13
+            clock-names:
+              items:
+                - const: pipe # PIPE clock
+                - const: pipe_mux # PIPE MUX
+                - const: phy_pipe # PIPE output clock
+                - const: ref # REFERENCE clock
+                - const: aux # Auxiliary clock
+                - const: cfg # Configuration clock
+                - const: bus_master # Master AXI clock
+                - const: bus_slave # Slave AXI clock
+                - const: slave_q2a # Slave Q2A clock
+                - const: tbu # PCIe TBU clock
+                - const: ddrss_sf_tbu # PCIe SF TBU clock
+                - const: aggre0 # Aggre NoC PCIe0 AXI clock
+                - const: aggre1 # Aggre NoC PCIe1 AXI clock
+        - properties:
+            clocks:
+              maxItems: 12
+            clock-names:
+              items:
+                - const: pipe # PIPE clock
+                - const: pipe_mux # PIPE MUX
+                - const: phy_pipe # PIPE output clock
+                - const: ref # REFERENCE clock
+                - const: aux # Auxiliary clock
+                - const: cfg # Configuration clock
+                - const: bus_master # Master AXI clock
+                - const: bus_slave # Slave AXI clock
+                - const: slave_q2a # Slave Q2A clock
+                - const: tbu # PCIe TBU clock
+                - const: ddrss_sf_tbu # PCIe SF TBU clock
+                - const: aggre1 # Aggre NoC PCIe1 AXI clock
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: pci # PCIe core reset
+
   - if:
       properties:
         compatible:
@@ -670,6 +723,7 @@ allOf:
               - qcom,pcie-sdm845
               - qcom,pcie-sm8150
               - qcom,pcie-sm8250
+              - qcom,pcie-sm8350
               - qcom,pcie-sm8450-pcie0
               - qcom,pcie-sm8450-pcie1
     then:
-- 
2.35.1

