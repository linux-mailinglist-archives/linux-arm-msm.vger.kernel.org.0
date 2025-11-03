Return-Path: <linux-arm-msm+bounces-80126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A459C2CBC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BA1189C8CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1D2325714;
	Mon,  3 Nov 2025 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1kJzan/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC1325498
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182903; cv=none; b=fhbYYjlz29BMGJ2DkI1jB5o0eSriaGZHDYhntLlbuLMquS/KpxE4CK2+honjBEaUh0EQe8qeb+atGqMti/xH/+hsBVfqv3RDf8BfSW9ytsj5FWtIhgi/m7gq1WAwebd2O/Y9IMQQCMXqFBflFv2JgjxMQx4JM6H7oYj+QfqlXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182903; c=relaxed/simple;
	bh=egHww2t1z7O8lMAW4nDR4uMRLOlHCAlm1FDiQSbolnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3LRC2GvUhkre66Tzodhq/ztS1Tp2kKEkZ+0627/2uK54EUUTWrlAskvsNWjczt2NPt5PgZd5rhP4R9TbKTsv0UdgkcIObQM8axGVMxNL09ftXPfdeYQOuNl9Gsi1mzi3W1L/U3rgxgZ2TdBtNIENhRWguiNozCBwbErQx64kH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1kJzan/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b70afc39b87so9895166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762182900; x=1762787700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChU9xcP6l7Vj6IpJ2XKjkHdCFEUFK/0Ic063b9tHQ60=;
        b=H1kJzan/233Zuj88+Sc4Wk8f3CiFwn3DankyA98FUezq3p0cfapRGvNyMqRKb5W2dz
         tXKlxZHCGKTMdvSLZ4UoCVVsR80ar9Yuy60AzYZtoEFbHX3OOIghwgnKNGN7L/DR7TjR
         U+H7VwwhILLOPnh4KdIYCnHL7aVdSYozG+Kh4LjRup3hi3//TrbnGzrnjRt6ZaxjouhL
         zJ5e09gGWpPgOMDO8xAMW6cQgaM8hxPf9hg+FVNmEpC2NbCtgw7dle2g1GZBDZRwE9yY
         SxceXuSCg1JhRCRzmLzvZGOYZfHrxHnUXHpMe8VHAvnIvTbUIGLU5faiLDy41VBvDK3Y
         8paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762182900; x=1762787700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChU9xcP6l7Vj6IpJ2XKjkHdCFEUFK/0Ic063b9tHQ60=;
        b=gqr6xlY9L+Y1DmzkJp1XSwhtDD0r+q6gJ2IkiIr6SSD6tssmC9vcyKRKpd4zYxQo6j
         VTKPG5XlaGSBPcsdYcaMPpqIX18qhrMPwkorFTwAIt4AkTSlG9ZHsx8udNMlrktMaZEO
         LFyyMNQHhIAm6gp1dnY/AirxPv2rSywiJ3ITdhg+l9QTIzq4HxX89imOybGrRSJGly/E
         G9+GdaZG40yD8kGxTyoyz0zozOHZL/Loh4tGy8UjYGiPTbqPh2AY/KjJ8P4rUYfz0pGY
         6g0S47/L45JzbG+Ea69aAo8FP+vz2ZoYOUlU5u5Jxs/wS5aJME1QIyzH5BXduJDit0f+
         Qd2A==
X-Gm-Message-State: AOJu0Yz52Iwgkcei8HJMLYtt9DnpkNFv3T+apmr7c+irnJP/VqgRZQDZ
	QjdfAAKbwvS5Zqh578ALvkkjUnYVuBqIFq3KbEnPeG5//13QBnMeG1MtwKX7PmU/3Xw=
X-Gm-Gg: ASbGncuWDhcZM+MJ4gTgWp5Ch5Vbl20VArIt2bOZ45G/jju6vseDMTEs1CODCVUSVDd
	SBc11aEdJgSR/QrWxuSXsnCi0yyfoCd46nZD8DwYIvIEMpxoyJmZFjSg8tUBUxWivZsgck4BOh9
	hu8tZVgRqc/yg9eJ4epThle9XObXOyRJ6MPD9cqCw/yphG3PI1NDIQRooMHPeUux5bw+IQhaLfs
	OrD7D9PtldTg2TE8hkHinUhv/8RBhxs00L8eIF+dSVGmQ6fpRjGTP0udas5Wnz6poYAjoOS4V4N
	ZH1pzv4GKyaz0S5y8/c/hR42BxYqp2nfTsIoVCklBNHnsUKvCIsWahfzmvOUSbjZnV02ASGMbXm
	5X9ipTOi+dzHDv60OXobBl/4AkX0tErxIAGD4BLLI5+vYdZGuZO81M6VDLqmOSlV5gS7H7Tg2+f
	NVBLZbEMEP+lgpp47Y
X-Google-Smtp-Source: AGHT+IGO1QZdLsp5RDeaAkvSiJvBz83lfZBDLxcTKsYb6sp8J8NF8tf7de2//pzCihxlCT9dk4XJLw==
X-Received: by 2002:a17:906:2683:b0:b70:bb39:6f34 with SMTP id a640c23a62f3a-b70bb398a8emr174411166b.1.1762182899017;
        Mon, 03 Nov 2025 07:14:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975dfdsm1045203066b.13.2025.11.03.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:14:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Nov 2025 16:14:41 +0100
Subject: [PATCH 01/12] dt-bindings: PCI: qcom,pcie-sm8150: Merge SC8180x
 into SM8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-dt-bindings-pci-qcom-v1-1-c0f6041abf9b@linaro.org>
References: <20251103-dt-bindings-pci-qcom-v1-0-c0f6041abf9b@linaro.org>
In-Reply-To: <20251103-dt-bindings-pci-qcom-v1-0-c0f6041abf9b@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=egHww2t1z7O8lMAW4nDR4uMRLOlHCAlm1FDiQSbolnQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpCMbkbycgIuII735kdFAk5l4/HQanwul6bIOoV
 O31e1EFk4WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQjG5AAKCRDBN2bmhouD
 1/5vD/91z+wKMVCx1xw6cB2blR0nC4FmrkHdj3/ipVGRrpkIvXwzwcnr8KjprOewWDgZVTtUxV+
 rEMKWBLt6vP0b4ho5RlbEVBvS2t/cx7nrCbOXY1a1tyq2qERz5fisVCDynU9bAZ+zLbk5WFazmn
 LS5ZC7oFpI6jVWyP1zhz5Nnr+6QPdAMwFHJYrzAfDh0L+oXuxwzIDxvWAqcxPxIZbw6FG+Ssz/X
 Usi3oCGvuiyBXm5ydxdW2rPsPmAjXmr7eFpgLOJH9/pK1TVjodcXJ8tOnfhROKeQaV6jfli01de
 cczaEHs93zvpqO8EGxVHAqPxTMQ8GM8jy1yGTzWYPcSj+RGs1FMPp6q37tPCOBDNu8XAbY1FGKF
 yp/LBkllnyNdW7eH/HCdXXUaR2VlV09PxP3JDODm73UiuULe/936g3mXzBRJAQGwFkJluNucJdX
 U/mwb8Tu2WClOcHjmIUpC6xI3eRKU40hmcraTskU4a6dzzsMQMZHVoL1LvOI3U3XKckaVkIo+Oj
 sjmHic8+UuA//A328NVGKWnc2Kwh826vrzXEhSLqgSpAJ9l6QmY3mu1vwEKiTq4qgmK7pWMrkYV
 rBPRpP+QlmzHDp2bWRmqC3T+e2wdVui23WRFj6OZKoC0EBXD5/+H36DsGjS/DbJyHNqoHw3tDAL
 iL76VZ0o3oLAd7A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

After the commit 26daa18e35eb ("dt-bindings: PCI: qcom,pcie-sc8180x:
Drop unrelated clocks from PCIe hosts") and the
commit e1cb67ab82aa ("dt-bindings: PCI: qcom,pcie-sm8150: Drop unrelated
clocks from PCIe hosts"), which dropped two clocks from each of the
bindings, the devices share entire binding and could be kept in one file
for simplicity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-sc8180x.yaml | 168 ---------------------
 .../devicetree/bindings/pci/qcom,pcie-sm8150.yaml  |   1 +
 2 files changed, 1 insertion(+), 168 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
deleted file mode 100644
index 34a4d7b2c845..000000000000
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
+++ /dev/null
@@ -1,168 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SC8180x PCI Express Root Complex
-
-maintainers:
-  - Bjorn Andersson <andersson@kernel.org>
-  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-
-description:
-  Qualcomm SC8180x SoC PCIe root complex controller is based on the Synopsys
-  DesignWare PCIe IP.
-
-properties:
-  compatible:
-    const: qcom,pcie-sc8180x
-
-  reg:
-    minItems: 5
-    maxItems: 6
-
-  reg-names:
-    minItems: 5
-    items:
-      - const: parf # Qualcomm specific registers
-      - const: dbi # DesignWare PCIe registers
-      - const: elbi # External local bus interface registers
-      - const: atu # ATU address space
-      - const: config # PCIe configuration space
-      - const: mhi # MHI registers
-
-  clocks:
-    minItems: 6
-    maxItems: 6
-
-  clock-names:
-    items:
-      - const: pipe # PIPE clock
-      - const: aux # Auxiliary clock
-      - const: cfg # Configuration clock
-      - const: bus_master # Master AXI clock
-      - const: bus_slave # Slave AXI clock
-      - const: slave_q2a # Slave Q2A clock
-
-  interrupts:
-    minItems: 8
-    maxItems: 9
-
-  interrupt-names:
-    minItems: 8
-    items:
-      - const: msi0
-      - const: msi1
-      - const: msi2
-      - const: msi3
-      - const: msi4
-      - const: msi5
-      - const: msi6
-      - const: msi7
-      - const: global
-
-  resets:
-    maxItems: 1
-
-  reset-names:
-    items:
-      - const: pci
-
-allOf:
-  - $ref: qcom,pcie-common.yaml#
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
-    #include <dt-bindings/interconnect/qcom,sc8180x.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        pcie@1c00000 {
-            compatible = "qcom,pcie-sc8180x";
-            reg = <0 0x01c00000 0 0x3000>,
-                  <0 0x60000000 0 0xf1d>,
-                  <0 0x60000f20 0 0xa8>,
-                  <0 0x60001000 0 0x1000>,
-                  <0 0x60100000 0 0x100000>;
-            reg-names = "parf",
-                        "dbi",
-                        "elbi",
-                        "atu",
-                        "config";
-            ranges = <0x01000000 0x0 0x60200000 0x0 0x60200000 0x0 0x100000>,
-                     <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
-
-            bus-range = <0x00 0xff>;
-            device_type = "pci";
-            linux,pci-domain = <0>;
-            num-lanes = <2>;
-
-            #address-cells = <3>;
-            #size-cells = <2>;
-
-            assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
-            assigned-clock-rates = <19200000>;
-
-            clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
-                     <&gcc GCC_PCIE_0_AUX_CLK>,
-                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-            clock-names = "pipe",
-                          "aux",
-                          "cfg",
-                          "bus_master",
-                          "bus_slave",
-                          "slave_q2a";
-
-            dma-coherent;
-
-            interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "msi0",
-                          "msi1",
-                          "msi2",
-                          "msi3",
-                          "msi4",
-                          "msi5",
-                          "msi6",
-                          "msi7",
-                          "global";
-            #interrupt-cells = <1>;
-            interrupt-map-mask = <0 0 0 0x7>;
-            interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-                            <0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-                            <0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-                            <0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
-
-            interconnects = <&aggre2_noc MASTER_PCIE 0 &mc_virt SLAVE_EBI_CH0 0>,
-                            <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
-            interconnect-names = "pcie-mem", "cpu-pcie";
-
-            iommu-map = <0x0 &apps_smmu 0x1d80 0x1>,
-                        <0x100 &apps_smmu 0x1d81 0x1>;
-
-            phys = <&pcie0_phy>;
-            phy-names = "pciephy";
-
-            power-domains = <&gcc PCIE_0_GDSC>;
-
-            resets = <&gcc GCC_PCIE_0_BCR>;
-            reset-names = "pci";
-        };
-    };
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
index 17c0d58af37c..0e0adbb25b68 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     oneOf:
+      - const: qcom,pcie-sc8180x
       - const: qcom,pcie-sm8150
       - items:
           - enum:

-- 
2.48.1


