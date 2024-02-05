Return-Path: <linux-arm-msm+bounces-9821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2583849F27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 17:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78891289138
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 16:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94FE3FE46;
	Mon,  5 Feb 2024 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwaEo2so"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4A39AF5
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707148698; cv=none; b=UV9w6Yi6bYn3G6peXG0XXOzGVGp85NayIFgYLxOwHWsoBJtJMqX/1ADwVRl7et7M3NFiCLxvppnoN3JVItyH8ljO7sOHD13fN4ilJKK0zC8TXKwGHAwqS5VDfsomjKWWQVVF80XNXi7whIxeJM7PWh5Mru8qb+p+dY0wzBl3JLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707148698; c=relaxed/simple;
	bh=nHHToYVe7UDazNBh0UHL8RPPmFaMG4R39iXsV4seckA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmiSUgxEIuZCMB6D74MnbSO6MojuAHj3ia+rQj4UEXrObsT7nbYc3HZWFqNqq3tMrqaVzsNlc9qiXMZ9aVdZMgYjmYDwWSGmb58ELrazmkYwpqTtbOeTrndbxjrkzzgX+TMpIVf6UqUoDk360AYWmAdfn/4MkfjMswQ0FtbvxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwaEo2so; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40fccd09082so21897105e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 07:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707148695; x=1707753495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd67LVywORJcC5ZhK9PLnVObuzsV4zR/OauMaIQMMEo=;
        b=iwaEo2so8fktDghhwOOackrRRZenyMhSbKxaSSTUeLczTjzYzuKBZD3gLbXao+4KcT
         OaZmA6RNgI7dhCQauh5zIvtNrzYejLlHqr45/UKzmhZ+XdCTqpXDfor5SMfghzv7/31d
         cFEMEQKKJZyct20UEo4UK6g77od7mumrv43A8G7MaDhaUxR28LhyRR6mwRF+qIaGAY/j
         67jAyzoaTbU9OfL+dq/bSeP3eQYViB0ue8UsR0ettmuDrufVcjQb9NRulANQ0uT8JHGO
         RZOi1Lem1UVpnkT3JI4lIA4JtcUg0Zb7Fh5ansEoI4DVNztD9aeX6varXJoHZItn5FEx
         YPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148695; x=1707753495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd67LVywORJcC5ZhK9PLnVObuzsV4zR/OauMaIQMMEo=;
        b=CU45TA9z2Hy/cWl5j3r9RFzEuluIgadgPPOd13wh+bOF0ouSRpy0eAnNY6BV/AmrQq
         pWaHxokdBi2JbT3VG9uNoq91rMvJQw5URWDt0lJn2szWDDNiTSdsyCuijEmVyeDmOffT
         NfqP2so4kJuEvtmMe16NCqVDsDtjZYNqfXP78OAe5fDHYoITANiUqQmB1pPEwUigNhab
         5C1GmKgXU40HFaqO5jvE3bp0xM2vjj9KaWmDwsgJ8b038JOxuJpOY87ZGWsHvkjO3Sn8
         N2eY7h8H03493D/KZCCBCjEdmTGlgqqk2eYvwN1HOa+NEU4vd3PZ5eO58W6kfMeH9y0O
         ITFA==
X-Gm-Message-State: AOJu0YyEbfkHGOgYgAl6dQj8Ne4VlVPHvrIdShWklmkWlXhlmtzxZwMh
	ZGB7/OX78cfyW2JFn344jrm9zb2DYQYLhVRyLi7n7e7GFTWwQG/poesV9fxTCNo=
X-Google-Smtp-Source: AGHT+IGDuVQQtVJ5jNm79dOhLXCyGQIYaviUdG02y+lpA+4WPODAzqez7/K4R8u8hsGwhq3RP16IfA==
X-Received: by 2002:a05:600c:4f95:b0:40e:f3ee:5622 with SMTP id n21-20020a05600c4f9500b0040ef3ee5622mr159015wmq.11.1707148694950;
        Mon, 05 Feb 2024 07:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUifZdu33C96BZpe+tFkmI0RVRx8WLvi5A3F44DdITKPd/iaG8hGd5vgBDF2lReQskUo+KWjbvgj3/er0VN5uh6xacfHxCAaatUeCJpFkA2rSUBYbUlCnsuEzk1Rmo5EbUffpwLj9xNOL/fFSffGNqaNOqwaOE2ZyC6d+2lNaWOiEi+CcOKXY+CFLObalsRfe7nMczF3bokRhx8VU/N+MzWnTXlQmLB6YTsi2UAMeGma4fGlpx51MuzCa7MFa7xjDFAn4wSqWgRgSa1dhVmOsuWqOrtW5O+WQegJKtv3CVVC4tQGsh8qqC4JNazMNwVqBc+S/eb5sEKTBgf6sBD3TALzd/kG8FCgQCiK6uL6zKicepma+8vluUqnVWPz5DiQ96YAIiQYHNbrp0eFDAoA5BQna99fBCUFtmxZcPdwU+wRc/Ng4jBvUKwiQtdJP+5VbiAdpRQ
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b0040fddae917bsm243714wmb.9.2024.02.05.07.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 07:58:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 05 Feb 2024 16:58:03 +0100
Subject: [PATCH 3/3] dt-bindings: PCI: qcom,pcie-sa8775p: move SA8775p to
 dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-dt-bindings-pci-qcom-split-continued-v1-3-c333cab5eeea@linaro.org>
References: <20240205-dt-bindings-pci-qcom-split-continued-v1-0-c333cab5eeea@linaro.org>
In-Reply-To: <20240205-dt-bindings-pci-qcom-split-continued-v1-0-c333cab5eeea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8285;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nHHToYVe7UDazNBh0UHL8RPPmFaMG4R39iXsV4seckA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBlwQWQihmErBYS9Z1zBNfPnFt5Mj/4JqB8FNs7S
 NqBE/B2J62JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZcEFkAAKCRDBN2bmhouD
 1y9zD/4+gr5chQPKMCgooZvd9ON2IXvsoTcYxo87MjsY9CatpIp4y9kssx6OnMi49aTovszNuF9
 OdrxzOTbARSen2NDepjmk5ZlefA+aRPM2T1GttmSG3wCXvUfGBuk9bVGm7vbNogj+rCeqcJctPD
 roli2D4VdF2aTOkXRuI29B9BaXxKFLjTWCvrz9UiN6hzFN9cNMttdtP4wUtL7NCC4NuNwxudroT
 CRat/ggqfVK1hnVqXvlDOxdTwnHh3sqL6ygwsoCF0/136qm0XVw16HJNQ1MpfPLjVUpZvstBqKH
 gMwnIBVBAdBVfYoqYSkLwa/hlcll/j6yI4+fp3uR7bCWQc3nntcNStMOdQN+mYubrJfLsXRws2T
 gHStI5QlCNFxcN/rxS30fcdF/SucdmRObP0OcKayleatThRZfSwUePFwAliHB9W6nsWnzWcZzmV
 CM3KKSWRJf5p2gr4+ibdW8xtYUqm03z1zAZS55VuC3gsXbrcADNfh8WRrZsOc3qLPa7syc8+vgx
 yzN4LiEhwPSACougxUrDc2C/NDxybWCnckcEWu1LuOsXMjDcO79GhbS9sMjgPYAeGGEmvWhgxCP
 ttjRJZi8ArsfMvQeUpGzPCls2KuMjKHCOCj8HitFQIrEazQBHYI8bBigVHyuBlrcvYrNYpv8sPV
 Sw3P1Ie1B4kwvFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Move SA8775p PCIe devices from qcom,pcie.yaml binding to a dedicated file
to make reviewing easier.

This creates equivalent schema file, except:
 - Missing required compatible which is actually redundant.
 - Expecting eight MSI interrupts, instead of only one, which was
   incomplete hardware description.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 166 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  38 -----
 2 files changed, 166 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
new file mode 100644
index 000000000000..efde49d1bef8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8775p PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm SA8775p SoC PCIe root complex controller is based on the Synopsys
+  DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: qcom,pcie-sa8775p
+
+  reg:
+    minItems: 6
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: parf # Qualcomm specific registers
+      - const: dbi # DesignWare PCIe registers
+      - const: elbi # External local bus interface registers
+      - const: atu # ATU address space
+      - const: config # PCIe configuration space
+      - const: mhi # MHI registers
+
+  clocks:
+    minItems: 5
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: aux # Auxiliary clock
+      - const: cfg # Configuration clock
+      - const: bus_master # Master AXI clock
+      - const: bus_slave # Slave AXI clock
+      - const: slave_q2a # Slave Q2A clock
+
+  interrupts:
+    minItems: 8
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: pci
+
+required:
+  - interconnects
+  - interconnect-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1c00000 {
+            compatible = "qcom,pcie-sa8775p";
+            reg = <0x0 0x01c00000 0x0 0x3000>,
+                  <0x0 0x40000000 0x0 0xf20>,
+                  <0x0 0x40000f20 0x0 0xa8>,
+                  <0x0 0x40001000 0x0 0x4000>,
+                  <0x0 0x40100000 0x0 0x100000>,
+                  <0x0 0x01c03000 0x0 0x1000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+
+            bus-range = <0x00 0xff>;
+            device_type = "pci";
+            linux,pci-domain = <0>;
+            num-lanes = <2>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+            clock-names = "aux",
+                          "cfg",
+                          "bus_master",
+                          "bus_slave",
+                          "slave_q2a";
+
+            dma-coherent;
+
+            interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi0",
+                              "msi1",
+                              "msi2",
+                              "msi3",
+                              "msi4",
+                              "msi5",
+                              "msi6",
+                              "msi7";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+
+            interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+                            <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+            interconnect-names = "pcie-mem", "cpu-pcie";
+
+            iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+                        <0x100 &pcie_smmu 0x0001 0x1>;
+
+            phys = <&pcie0_phy>;
+            phy-names = "pciephy";
+
+            power-domains = <&gcc PCIE_0_GDSC>;
+
+            resets = <&gcc GCC_PCIE_0_BCR>;
+            reset-names = "pci";
+
+            perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+            wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 6c50d887ad5f..aedd23a71c70 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -28,7 +28,6 @@ properties:
           - qcom,pcie-ipq8074-gen3
           - qcom,pcie-msm8996
           - qcom,pcie-qcs404
-          - qcom,pcie-sa8775p
           - qcom,pcie-sdm845
           - qcom,pcie-sdx55
       - items:
@@ -200,7 +199,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-sa8775p
               - qcom,pcie-sdx55
     then:
       properties:
@@ -495,41 +493,6 @@ allOf:
           items:
             - const: pci # PCIe core reset
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-sa8775p
-    then:
-      properties:
-        clocks:
-          minItems: 5
-          maxItems: 5
-        clock-names:
-          items:
-            - const: aux # Auxiliary clock
-            - const: cfg # Configuration clock
-            - const: bus_master # Master AXI clock
-            - const: bus_slave # Slave AXI clock
-            - const: slave_q2a # Slave Q2A clock
-        resets:
-          maxItems: 1
-        reset-names:
-          items:
-            - const: pci # PCIe core reset
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-sa8775p
-    then:
-      required:
-        - interconnects
-        - interconnect-names
-
   - if:
       not:
         properties:
@@ -565,7 +528,6 @@ allOf:
           contains:
             enum:
               - qcom,pcie-msm8996
-              - qcom,pcie-sa8775p
               - qcom,pcie-sdm845
     then:
       oneOf:

-- 
2.34.1


