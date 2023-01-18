Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B697671B57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 13:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjARMA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 07:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjARL76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 06:59:58 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2F995745
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:17:13 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so1151543wml.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJPpRBOxYrwV3urnbAOkyowip1c70w+6VVPiwttYqU0=;
        b=VjzElyUH5tKgy1A6onEbnf+jZfZ1iO6VSxup5z4UTgEgYTrS7iXuYRq0eRTdzXozaq
         0dTa7U7nhJfNPTzdg5kLsy2Rn69lpWi+UgzZKKnpvlS+LVpR1n5yPPVpteRHaUJjZfIK
         5UGtquqFFZoiOzd+YUjBAVukyjFtQdTjRILuEUvoDHW/Ph24vyJfipA8OYzThSkVeiHy
         wtyfgq4105oUa8qJWElFy78nZCE5leLjnBBKqMv/z+v3ULNhKZxz4uh3RqfIM3KHbBi9
         f8F18gf0E9xa/m0/K8DjSSCWD/3/75zzVenyp8CaFpoD/d1ria/SU4D7xL68OU2B31ca
         X9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJPpRBOxYrwV3urnbAOkyowip1c70w+6VVPiwttYqU0=;
        b=FqprcV0pjgm5Fy2auhY/N9xfRBu0LREjuh/vDLDsVVrRy/YQ805vGXXcSpI3dceAKK
         IHXbt4qwK+ZN+sfoweQYCxavJ/2GXsVZvqSCYE/vFgScvHpySOtE4nnRWXuMnsk3DLLN
         2vr44ql/JyFVCQEDq/s5M2lc+kP7SNlVuo21ebQDexE6u6Wqa7CTM2ULOwLZd3pr25Lg
         wIgm5KMBubmUz+yYMMZGkXxNBIbJB9xsMrGB0qR/pmMHyQzclSlLFoc6Q5rIMK8aCiAF
         3Ip+l3P4V/Vwy18hCmpn4U0ZTq8wWDy64t9OyN5WlyqgrQgefyVAAQ1coxK7wc6nZznN
         bTiQ==
X-Gm-Message-State: AFqh2ko5B2MO+uZu6yhdut4GNRJ23ZH+AjflMGdwQbpLtDithNoS1dw3
        wU7Fu0WdgyTl63XKk0SEyJAkUw==
X-Google-Smtp-Source: AMrXdXuNKL5QlpIkxMMyfGxpCC1ZZ+/CZChk3sqyQtk21VYUjYYdvCxlEOblKvAMefuB8UJVi0ZQqA==
X-Received: by 2002:a05:600c:3b1e:b0:3cf:497c:c4f5 with SMTP id m30-20020a05600c3b1e00b003cf497cc4f5mr6638401wms.13.1674040631990;
        Wed, 18 Jan 2023 03:17:11 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q10-20020a1cf30a000000b003d1e3b1624dsm1670998wmq.2.2023.01.18.03.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 03:17:11 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: PCI: qcom: Add SM8550 compatible
Date:   Wed, 18 Jan 2023 13:17:03 +0200
Message-Id: <20230118111704.3553542-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Add the SM8550 platform to the binding.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v1 was here:
https://lore.kernel.org/all/20221116123505.2760397-1-abel.vesa@linaro.org/

Changes since v1:
 * Switched to single compatible for both PCIes (qcom,pcie-sm8550)
 * dropped enable-gpios property
 * dropped interconnects related properties, the power-domains properties
   and resets related properties the sm8550 specific allOf:if:then
 * dropped pipe_mux, phy_pipe and ref clocks from the sm8550 specific
   allOf:if:then clock-names array and decreased the minItems and
   maxItems for clocks property accordingly

 .../devicetree/bindings/pci/qcom,pcie.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index a5859bb3dc28..78e8babd11d9 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,pcie-sm8250
       - qcom,pcie-sm8450-pcie0
       - qcom,pcie-sm8450-pcie1
+      - qcom,pcie-sm8550
       - qcom,pcie-ipq6018
 
   reg:
@@ -197,6 +198,7 @@ allOf:
               - qcom,pcie-sm8250
               - qcom,pcie-sm8450-pcie0
               - qcom,pcie-sm8450-pcie1
+              - qcom,pcie-sm8550
     then:
       properties:
         reg:
@@ -611,6 +613,40 @@ allOf:
           items:
             - const: pci # PCIe core reset
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-sm8550
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 9
+        clock-names:
+          items:
+            - const: pipe # PIPE clock
+            - const: aux # Auxiliary clock
+            - const: cfg # Configuration clock
+            - const: bus_master # Master AXI clock
+            - const: bus_slave # Slave AXI clock
+            - const: slave_q2a # Slave Q2A clock
+            - const: ddrss_sf_tbu # PCIe SF TBU clock
+            - const: aggre # Aggre NoC PCIe0 AXI clock
+            - const: cnoc_pcie_sf_axi # Config NoC PCIe1 AXI clock
+        iommus:
+          maxItems: 1
+        iommu-map:
+          maxItems: 2
+        resets:
+          minItems: 1
+          maxItems: 2
+        reset-names:
+          items:
+            - const: pci # PCIe core reset
+            - const: pcie_1_link_down_reset # PCIe link down reset
+
   - if:
       properties:
         compatible:
@@ -694,6 +730,7 @@ allOf:
               - qcom,pcie-sm8250
               - qcom,pcie-sm8450-pcie0
               - qcom,pcie-sm8450-pcie1
+              - qcom,pcie-sm8550
     then:
       oneOf:
         - properties:
-- 
2.34.1

