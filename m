Return-Path: <linux-arm-msm+bounces-78727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889EC063A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 14:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05CB73BA857
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8303164D7;
	Fri, 24 Oct 2025 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TzSfyC0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D832F316192
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308666; cv=none; b=T4g8DN5IHCxDrbCKWFq2nATH7FeavBWmn0OLo9J0I6ui4NS/WK0zk1CEO+debPLOyLmOs2TYGkx2XomOj3TbC2tQPDupyJtlzWiOJg1rEdnQf0hCcfVD4q4cMqmIuRsHb9CTq5pw38h8Qlg5dK/JWwWNVaANxKxm1ATgDHtBGUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308666; c=relaxed/simple;
	bh=u2qTN4Dfvh+diwWu8Rv5j/aOUo5k5MfxJT0vwIyS/Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M83UnHhvkPGzsqJBIc0UgPQXYNElQq8wbUO82eDbGE2vi4i3jeOh2HLRdl2VnlGfHCAtbAbkEr39DyVGw2SRfiLtGg2mrut0LeMzMIIAAw8elzJLBTrRZY9GRpu49K4a6JikxqLUSZirJlXI+yc+tavUFlKAeoYW5tFrBzwR9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TzSfyC0P; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so447266866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 05:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761308663; x=1761913463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmR9GkysiOgq7enX2b6+tUGLrWm7BFK29ZIOIaZVmUU=;
        b=TzSfyC0P/UzvAecOd7GyiYJl0PWIRVUamhyEf5MPy179MzuwJFcilmrITdbZh5OH3o
         id1dSzwRXfJhpswf41x/3kbaMGYxDMplDjtpFizgSbPDZpG9lNm1YHfS1XpoPXLhjrar
         c9FHArTG/0RK0kcMcw4wyl1zUgGq5drM50phvD876dKMjpXJOOs+3+cme8Ar8TMapPqS
         E7VfK/sbTRvdbPOV3NujvNz7AQVMGbh2n3i3+PtwDi4TwfmTfxxVnpT29U4HiApLuqLJ
         Hl7U5VlS0MLyz9yU7HLx83CY+7MZadmWm3b5m3dC19b4alw3eKTd3qUB1MQjwWGZbVrp
         88Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761308663; x=1761913463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmR9GkysiOgq7enX2b6+tUGLrWm7BFK29ZIOIaZVmUU=;
        b=MTAhTkYcItHRslCcxGkCrALdi1t7r6M3uaA+Zs3cnDw9FOG5khEXd9pjqxLt7m0Up1
         djnZvUhfYq6QW2Cq7YAFs8Ou9ypSVK5IYN/53ZxJFNvfA6VXjJW1nzwlusMV4kKhDL5B
         cHxJKiln5RagGKCVrXKKh3vdYQt7YTtHhGoALAvI+cjch5q6Mikmegx7HZL/szHhmRJi
         sg/Xs2yblhxRstl3/Vfd12gGaDdHL8packtlrdPvMf23Xy7ELBpW/bWcMv5DBIqSnqUB
         RwemvFFxTTjw0YTwlrhRqxjPGCWakG67pj5BSOiEghSkjW4EQf17Wsa67kyNpBEdbUmL
         d4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNn9glVnr9QHkHzOWBO2HJFLh20sCH5s4rWl3FlysRMdCyqfGukPcVcOIeYsjGqVfv4YUsZ8fMb4sSLPyb@vger.kernel.org
X-Gm-Message-State: AOJu0YzAypEruCUnV75wvP/+XJvLEYPjoVco0khKEyVGgmprBwgKdRQB
	IG1Sz398A/B41ayNSRwtgW7u1plIBbDWZ17QiGnSAieAxHLVhgm3RDF1cZdDAORQ+Lo=
X-Gm-Gg: ASbGncue0GHLzeLVHD0No8jiDPo2+3LHmFW1635AGYpTvo5Fj1t93qdN4hwi9mYB6nd
	vaZXaZjNgNvu1AuaD4AQ7o54rLRWU31WdwsGqEKAg3KzGfuFF7AUyzWKWlMqR5GoOqRI1rNKxCt
	UVzvUi9mFoE21uAHjIZ3l9BgEVzLk1b10aXaM1BxAGKM22EdeC3Gsd0V1NFm6K6yTE+zFMXtyqa
	3jXE08b7xpa6yZcFBtpSreElDsA7ahKcYvoWqo9Hr1JaxYb8Cy/rmx/lk8VjZs6nnmF/AymF7ru
	sxHIGKxOOepYvXCw3yft7GHf/F56ANO+2Db+JyfZb1IBJBFqYUBeheCqmCXNUNFAiYc86dn1wfw
	88TovHr4mNEqwzrBQcWYYDHPpfiAE5/It3hJ7t4Nw4YzhBP3FWHgLBLdTzP1/3tUzBwCuNqSti1
	gm53UOc6VK3f4YUe+0zQBfIA8fc8NKO6oGsQgwVYGhZuSf4fZpv5Qg0gqbU+P4WV2WLJ4=
X-Google-Smtp-Source: AGHT+IF4B76Li9/9IxqQkEqaQSlQkhNs4Qzks18AR2dqvONXvycFMOdtBvrJWsw9P7ywu3UA8SsX9g==
X-Received: by 2002:a17:906:d555:b0:b6d:5a98:d351 with SMTP id a640c23a62f3a-b6d6fe935c5mr228111666b.25.1761308662930;
        Fri, 24 Oct 2025 05:24:22 -0700 (PDT)
Received: from [192.168.178.36] (213162084087.public.t-mobile.at. [213.162.84.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d513199d0sm507233366b.37.2025.10.24.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 05:24:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 24 Oct 2025 14:23:59 +0200
Subject: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
In-Reply-To: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761308659; l=12349;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=u2qTN4Dfvh+diwWu8Rv5j/aOUo5k5MfxJT0vwIyS/Io=;
 b=dT3Wtr+lh/dXScSbPgpk2f/w9VHk2DE9sH/L5WGcqjW27Zx1QishsQ2tTx2KueplHSYJdech1
 eD3uBs7CyBPAVwoR+FXXHuJ6FbIWAMa67lVBWRQSwcDmlYKQ3IVW1J5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings for the Camera Subsystem on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
 1 file changed, 349 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
new file mode 100644
index 000000000000..e816986c8d84
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
@@ -0,0 +1,349 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm6350-camss
+
+  reg:
+    maxItems: 12
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+
+  clocks:
+    maxItems: 30
+
+  clock-names:
+    items:
+      - const: cam_ahb_clk
+      - const: cam_axi
+      - const: soc_ahb
+      - const: camnoc_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: slow_ahb_src
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe2_axi
+      - const: vfe2
+      - const: vfe2_cphy_rx
+      - const: vfe2_csid
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 12
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  vdda-0.9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to a PHY.
+
+  vdda-1.25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
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
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
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
+  - vdda-0.9-supply
+  - vdda-1.25-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm6350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb3000 {
+            compatible = "qcom,sm6350-camss";
+
+            reg = <0x0 0x0acb3000 0x0 0x1000>,
+                  <0x0 0x0acba000 0x0 0x1000>,
+                  <0x0 0x0acc1000 0x0 0x1000>,
+                  <0x0 0x0acc8000 0x0 0x1000>,
+                  <0x0 0x0ac65000 0x0 0x1000>,
+                  <0x0 0x0ac66000 0x0 0x1000>,
+                  <0x0 0x0ac67000 0x0 0x1000>,
+                  <0x0 0x0ac68000 0x0 0x1000>,
+                  <0x0 0x0acaf000 0x0 0x4000>,
+                  <0x0 0x0acb6000 0x0 0x4000>,
+                  <0x0 0x0acbd000 0x0 0x4000>,
+                  <0x0 0x0acc4000 0x0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite";
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAMCC_SOC_AHB_CLK>,
+                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
+                     <&camcc CAMCC_CORE_AHB_CLK>,
+                     <&camcc CAMCC_CPAS_AHB_CLK>,
+                     <&camcc CAMCC_CSIPHY0_CLK>,
+                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY1_CLK>,
+                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY2_CLK>,
+                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY3_CLK>,
+                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
+                     <&camcc CAMCC_IFE_0_AXI_CLK>,
+                     <&camcc CAMCC_IFE_0_CLK>,
+                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_1_AXI_CLK>,
+                     <&camcc CAMCC_IFE_1_CLK>,
+                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_2_AXI_CLK>,
+                     <&camcc CAMCC_IFE_2_CLK>,
+                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CSID_CLK>;
+            clock-names = "cam_ahb_clk",
+                          "cam_axi",
+                          "soc_ahb",
+                          "camnoc_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "slow_ahb_src",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe2_axi",
+                          "vfe2",
+                          "vfe2_cphy_rx",
+                          "vfe2_csid",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite";
+
+            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "cam_ahb",
+                                 "cam_hf_0_mnoc",
+                                 "cam_sf_0_mnoc",
+                                 "cam_sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x820 0xc0>,
+                     <&apps_smmu 0x840 0x0>,
+                     <&apps_smmu 0x860 0xc0>,
+                     <&apps_smmu 0x880 0x0>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc IFE_2_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            vdda-0.9-supply = <&vreg_l18a>;
+            vdda-1.25-supply = <&vreg_l22a>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    csiphy0_ep: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.51.1


