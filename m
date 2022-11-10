Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D131623FD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 11:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiKJKdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 05:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiKJKdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 05:33:51 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCA0317D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:50 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id g7so2364131lfv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/is0taNXLslowunLGClJmRq4bGkunbgWU7W/P30/eU=;
        b=tGeALP/Fg/0LrOJE9suXQsCf1lJbB/hoJO4PNAsf/zhf0QKa6taViJVx3SrAy50TSo
         S0bzg+08NQIhkicAi8QTRW4Z/h7FR/i+VomE3gaLzeMJIKEFIKdvJgnLtLQ/oD9dT1bu
         YFPWULdw76wooTn4kRN+5/+EiCpXLtElsNOzZ/LQ19nkH2sqdaBu9FgLrY7Gl2Y3rF8f
         SbvWwyvb9yx/HT81cvdqTUPqoUeL07DTQEFlUgL5ADSvBOzPewudUTxkyAmU57cNXNS2
         jFVfbj9WheuDuZLmko9gkC5gvUNK5xi7PSSpQrUdhEjQmOBf1mjiMhUawN5RI3bZdYIW
         xsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/is0taNXLslowunLGClJmRq4bGkunbgWU7W/P30/eU=;
        b=LJuuwKgflsP3uLjbqChv/JLIroE1IFeYcnRQp4Fjz8j7+SRDSsaPhVFlZMpE8dg/8h
         dwu+ZIOrmzqRYAMHpczD8qGHnOMJqyVaUHUdzDyWAiussyfeO5msHkOFNWWbm+swqlRE
         97O035G3md3FxeNefYC9DFcNMttjg4OE9HQEXok+VutIWdIzaO1Ad+k5VdHzH/xXx8Sq
         2wEADB9XuVj84JvjLzHTNXs7pC60nxRbhK/G37zb81eJFxVRTSMbxHEIss/MhTfZMod/
         QsPM5GaN4CRgOLLUcduY5SYmY+ve/OZXKj+LIRpY3wUH0UxEHC5SqoorptWLnngA5Tgt
         ZXgw==
X-Gm-Message-State: ACrzQf3iCTAPFwSQezINMrtpPKMV5eB2H7oximghaKbJQWVR7iQOE6oZ
        CbUTq6x2G1UjWOKWq8PasMTvIw==
X-Google-Smtp-Source: AMsMyM7XD4ARqKcBdJZhUsgf6Wg13cEtDV0E8et7ZHgNi3+yZcATHV9Ccz/dSUiHCdGLrmM5smyFqA==
X-Received: by 2002:ac2:5cd1:0:b0:4a2:291a:9460 with SMTP id f17-20020ac25cd1000000b004a2291a9460mr20904690lfq.203.1668076428443;
        Thu, 10 Nov 2022 02:33:48 -0800 (PST)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id p22-20020ac246d6000000b00498f32ae907sm2687837lfo.95.2022.11.10.02.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:33:48 -0800 (PST)
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
Subject: [PATCH v2 1/8] dt-bindings: PCI: qcom: Add sm8350 to bindings
Date:   Thu, 10 Nov 2022 13:33:38 +0300
Message-Id: <20221110103345.729018-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
References: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
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
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 54f07852d279..502c15f7dd96 100644
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
@@ -540,6 +542,49 @@ allOf:
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
+          # Unfortunately the "optional" aggre0 clock is used in the middle of the list
+        - properties:
+            clocks:
+              maxItems: 9
+            clock-names:
+              items:
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
+              maxItems: 8
+            clock-names:
+              items:
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
@@ -670,6 +715,7 @@ allOf:
               - qcom,pcie-sdm845
               - qcom,pcie-sm8150
               - qcom,pcie-sm8250
+              - qcom,pcie-sm8350
               - qcom,pcie-sm8450-pcie0
               - qcom,pcie-sm8450-pcie1
     then:
-- 
2.35.1

