Return-Path: <linux-arm-msm+bounces-51407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EADA6123B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5AD1B62A83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 13:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F1A1FFC69;
	Fri, 14 Mar 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOsHwK3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A41FF60D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958056; cv=none; b=swyHAEra5vRkRlJkKfPDHJneMQvbaJHF/omNLYtbs3xgLYGhVca3bMx4peuPqxa7fMw23NUnc+PE3GUG6U1VqwQXu2enBOd7ncqs9xDJIWQx72ODpe302SEg/0wmLJBjk6PB3FWwq1DrZe2LyH3XSqePPlitB558wwdJng7LEgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958056; c=relaxed/simple;
	bh=c+Qj4DKg1eJLbF7tyQrBCEXmEKREnLZPMNtUuVGeFP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXXYRBCIo36WokzQcONI/M0Xb2+kpCeo+rwW8BduL7YkUGDpSue2w7W4DpOhme2P5Xvxlvqw2vfBTzb5ShEw8v+CF6/N6eadBDT30aDIAL22X9Hb/aMikwqxkJU8ir5xEDynJILTDHUtXuB3eOfK4d5P/9BR+fl6B3Ufn34ndek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOsHwK3D; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2c663a3daso425598366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741958052; x=1742562852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4FtVmYZgckl7YtfkY/SWerCLj70ANs6HxOobmm+Pok=;
        b=SOsHwK3D6zi03JQqiEO98Wb9SYjrhsMoF7IOFuONfLPm/h3nfJfYyv4du2W7BuQVkE
         057wE53zjTQ2PRUMI/2Pip28aHaeZcv9F+EPCZw2B0QUmqI4YnPw+f8AIqJY8w9Vv+aZ
         a9XtHx4vihW0NISClQb2MgG5u5y/b5rzuRaPTees6ebZ6g6VjWuvmCn2VnGBl/GJrB0d
         chNHiR2VcL+oIN8poQRLpYmD0H3GXu5uxBMzEhRmdzmM4g/e9VOK6GmwNT2P2N5iSrAS
         ZqtTU44CfQ1oVio5ToRYiAidVKdJ35jEWpNe8eDP5vVXhtzmuLKkrR3sJhZWrnxN36u/
         XTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958052; x=1742562852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4FtVmYZgckl7YtfkY/SWerCLj70ANs6HxOobmm+Pok=;
        b=Sy6ElMrkrOPB69jlG4fyzh5rlARqGeB9WzNQMPEAau5RUGrppctL4djIhOWLDIWanr
         csR/oXt20GEikLRYGUzqQsD4HCLJ5GwrCkdOvlOqamSYVePoJlWs+9iPqdvflA9F0o2i
         MSHBcUotXLzuiJTvA5P05qkXnCVlL6IVjMtMd9hsuOD02vIECxJm0NNqw4CyWW6ZGbZI
         mboqFc1fClysXviQNX7dErQkJ5AIOLb99SFfyxP8MGCaXf9QXe5NQ21rMw/NkwlTcdgF
         lG37+6JRowA2kgB4JRthYXFNuA1Pipix7mSDoSFo0INQMCfROSjJBGY1i45xkNnhvL3S
         mEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY1MrBGL+0h5hEDp4HsXzBQUPWejt8MTBIDdvsqzwFYyR3Lli4oYMZEqOtSnfFdFVZaV0gRR+BIOmIaHQU@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDpvt+Y/FwlQwiHIQSkFLh9M7Dw6qS50M4+JS5shKpTV1F6Z2
	S3n9/aIlgUqaZLk5lPLrWpCKvPCrxRe0aU2l7X/vDnMdjRwCjn54i2oNAWU2+Sg=
X-Gm-Gg: ASbGncuCWiP7nALUMKpGW1rBlcsbFiEEXlxMlkCarPG4X1ixK3F+U8AqU6br+1VGXTB
	F30isDWnOQYE06WixmU4YjUCPT7ALJMCvZi1dKap6dn+eJ7sQQMdGmD/GeFx3cEM6j0tLbCJM9P
	YTEuWT9VJiDCd0cqBVQ0uSlP07ocjrosvhC59Oc8QOEMEPDgRQ+E3dGWPscpqu7Hu/P7z6iUtcA
	voy2F8p7GpHg+VDRMIov2wRWOfmiZPgYqM1dnMqJd3Mu2MpbHEglkDBUZDDDOMEw2ByoTJM5K2t
	DKb7bWAG6E2kpad81kRifCQfSGcvR+buFSbnywyPxENiFfqTfKFxKo31vzHfdRwkpsq54cStp/I
	aSBosXWAj7GCnYUjR82YnQG0wVMaJNveZvtptEq4Nl8A+mWwLfOj6KROTxnx7CaemJeQZ
X-Google-Smtp-Source: AGHT+IFequ+YS5iUv8GkwBddYmWr5GbJOg2zcOTzWe1RDltRny+OESDbPF1vd2jrSBihp+8+Kv+bRg==
X-Received: by 2002:a17:907:8694:b0:ac1:fb00:2b38 with SMTP id a640c23a62f3a-ac3301e4d63mr243638366b.25.1741958051724;
        Fri, 14 Mar 2025 06:14:11 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm226008566b.137.2025.03.14.06.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 06:14:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 13:14:00 +0000
Subject: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Add bindings for qcom,x1e80100-camss in order to support the camera
subsystem for x1e80100 as found in various Co-Pilot laptops.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 1 file changed, 367 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..113565cf2a991a8dcbc20889090e177e8bcadaac
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -0,0 +1,367 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,x1e80100-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-camss
+
+  reg:
+    maxItems: 17
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 29
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe_lite
+      - const: cphy_rx_clk_src
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 13
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    maxItems: 8
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
+
+  vdd-csiphy-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to a PHY.
+
+  vdd-csiphy-1p2-supply:
+    description:
+      Phandle to 1.8V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdd-csiphy-0p8-supply
+  - vdd-csiphy-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@acb6000 {
+            compatible = "qcom,x1e80100-camss";
+
+            reg = <0 0x0acb7000 0 0x2000>,
+                  <0 0x0acb9000 0 0x2000>,
+                  <0 0x0acbb000 0 0x2000>,
+                  <0 0x0acc6000 0 0x1000>,
+                  <0 0x0acca000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0ace4000 0 0x1000>,
+                  <0 0x0ace6000 0 0x1000>,
+                  <0 0x0ace8000 0 0x1000>,
+                  <0 0x0acec000 0 0x4000>,
+                  <0 0x0acf6000 0 0x1000>,
+                  <0 0x0acf7000 0 0x1000>,
+                  <0 0x0acf8000 0 0x1000>,
+                  <0 0x0ac62000 0 0x4000>,
+                  <0 0x0ac71000 0 0x4000>,
+                  <0 0x0acc7000 0 0x2000>,
+                  <0 0x0accb000 0 0x2000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy4",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY4_CLK>,
+                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe_lite",
+                          "cphy_rx_clk_src",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy4",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x860 0x60>,
+                     <&apps_smmu 0x1800 0x60>,
+                     <&apps_smmu 0x1860 0x60>,
+                     <&apps_smmu 0x18e0 0x00>,
+                     <&apps_smmu 0x1980 0x20>,
+                     <&apps_smmu 0x1900 0x00>,
+                     <&apps_smmu 0x19a0 0x20>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    csiphy_ep0: endpoint {
+                        clock-lanes = <7>;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.48.1


