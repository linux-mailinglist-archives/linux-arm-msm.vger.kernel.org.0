Return-Path: <linux-arm-msm+bounces-84286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E8CA24D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED1D13065AD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5441819E968;
	Thu,  4 Dec 2025 04:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJlawK+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0996D2FC01A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821718; cv=none; b=AKjuKYq9mYR0gWvqqA9INgmYlQb4IzNiHdn9cvrG13Z3GtWKoFEZ1UwmI1sy8jH3fscxUjpJfZCBjCRzAT5wAxP9qVP2JjYFth6FwVRAP4EBAMji4WdDSv7USGuCrBytq8O5PQK3ZONBDGxhXxHWJW7r3XPdYWLkA7+3aXQ6W+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821718; c=relaxed/simple;
	bh=Tsk0VR72xwOrCrV6ZPvCB4QaXnMD2oR0smlKvIVFiJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVR8x764s42dT2XdURsMSVKu4uebCaBKf7AhEpQRqfb2puUsdG/T1PPMbvOCu5Fl4qcLSESzvlve6CHPzpsMLGweBu6K1stu9fsNft9szMt3Ldp2/K6mvjDJrtwbB/mLp16mZXH65/gJfzSfkFmpndbTj390x1aFYJSh+wGDdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJlawK+F; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5957a623c7fso95323e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764821713; x=1765426513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFz2p0oh7b4Y+y4JOUaDx6XE/XTZUDdMejQmJ8Y20Ts=;
        b=kJlawK+FuAd0ff4u59WQYuAjRIbNHBaXFo8Y+2SOlUTLXuXbBgHRxpRGVVCJ2D+jG/
         bmrA2sXvO2YP1L5wO79i94u0yuGKXnoB4rGOtLx1OCwgIm512bhapuEn7a9ZGhgJpLfi
         ByLfzru7ZnbSQdv6Wd3AhOWoHeapNFHnBMtCK0iudNCZrOCwjSUYL7R9K1zs60AaYhTu
         vT/3buyX1Zztm94FhHgWp1EvHy8I4bUeriBgcPtd4183bb3veyzfPac2zwRbPhgdZjT8
         3910fuZFR97S7R1VCUQrT4Te3GRrXjTNujIE0sg6Q5pt+S+FRZGBU5LaoBVZJpjmm+IE
         NyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821713; x=1765426513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFz2p0oh7b4Y+y4JOUaDx6XE/XTZUDdMejQmJ8Y20Ts=;
        b=KwlSK3dgFoSS+5dqHqLyCpOnXBaDlJMWeVxbt4tXxg5QuSWEhcG91GJ6AsCU7ylh2O
         grUmVk7NeR344NUu1857WlarooomH9ddr8h8DpT5CKJ/Tl3rA9FDhaIv1+eqyFVBCNJf
         cz7gQRC4pPkofgHPVCiHTt74iFL6tYd164GZKTtX5p9GZetUayYJT6YasjZilkuHcuP4
         8jkR03FJ/pfcsAPZz2eXdWAr1r5KjiOwUh2LaCIZUS+V3BZoYA2nGFzuMGNZBubnCNEQ
         BwEoxYiwEuqqh4mc0e7xRkEbursIB0mugOCdVWDl4jb0NGWwaQcelz+Bk5wnyQtCCoJp
         sgjw==
X-Forwarded-Encrypted: i=1; AJvYcCXywMfRTNdDHyP+Xhx/j2NLpVxc5PkrIRwTWg7do6NNCuXrKTn/oWQyA2EmMUF2vCMMnw287eYlQGA7nLiv@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfAEwN6d9CjWhqv6YUCwaLGrEw+Cdypf0jukh8ARkac3X2QRZ
	2nZu8wXLxABjvsloFglzGpJiNMQVAqXPCgmLe7UJbDWdJVPpGNkHvSlHFIgWx1lDn8KozDKwnUq
	m5l7B
X-Gm-Gg: ASbGncslVrU1+fuw+4J84m9Q2SYGy35dbXXO6kHdr3XoAL39fKxsVQQnh8D1iZsZot+
	P1esJReIfxDuDT1NYPPwTHMK87Kte49uiPlwjsbg7OlXu1YsK0NHxso92bPZgRrDcdS64jyP/as
	PqyAwQ+aOBLJIyduRBxxc35CYvMkD/pWn2z7BDXNOEwzHQ5qxkMG17ZhrRe9TVTp1dS1uHl7uP1
	QN4ux26G5JiEzWWJWSsCsFbaI3DbuEQr7mISobkUzxFAsX8+oRTA2Cy4STxe9TfeR+2FSrPU7/k
	Cg7q7Ccg0svp85rR/Szd2z4T0yx0Y9owBrIHb4V/RRUO7F752hTwCNXoLhMa0OTgRuKZ7Fr/cv2
	5QDekXaz3m7jH3O6z37yjHyevcE46gD8BimIFCF2vdDfOf4Nm1M5Rjv+ujRBH7NeJBVWVNIOpV7
	qwvokBzQl45NDt6vFf4/TO7B2RMjB7SzPtvC+Gxuyy0yn4T2ADw6espA==
X-Google-Smtp-Source: AGHT+IEml5kYKRi+gdEzoTWIqZFGm6T0gb+jJ2l4C2jqedfssPhSHCA5Kd7kW2BEGjbFBkAw5jUVew==
X-Received: by 2002:a2e:bc02:0:b0:37a:3c8c:ee16 with SMTP id 38308e7fff4ca-37e63528711mr6703321fa.0.1764821712692;
        Wed, 03 Dec 2025 20:15:12 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2a1sm67649e87.64.2025.12.03.20.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:15:11 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm8650: Add CAMSS device tree node
Date: Thu,  4 Dec 2025 06:15:02 +0200
Message-ID: <20251204041505.131891-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
References: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Qualcomm SM8650 CAMSS device tree node to the platform dtsi file,
the SM8650 CAMSS IP contains
* 6 x CSIPHY,
* 3 x CSID, 2 x CSID Lite,
* 3 x IFE, 2 x IFE Lite.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 187 +++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 07ae74851621..06eedd2cd782 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5380,6 +5380,193 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,sm8650-camss";
+
+			reg = <0 0x0acb6000 0 0x1000>,
+			      <0 0x0acb8000 0 0x1000>,
+			      <0 0x0acba000 0 0x1000>,
+			      <0 0x0acbc000 0 0x1000>,
+			      <0 0x0accb000 0 0x1000>,
+			      <0 0x0acd0000 0 0x1000>,
+			      <0 0x0ace4000 0 0x2000>,
+			      <0 0x0ace6000 0 0x2000>,
+			      <0 0x0ace8000 0 0x2000>,
+			      <0 0x0acea000 0 0x2000>,
+			      <0 0x0acec000 0 0x2000>,
+			      <0 0x0acee000 0 0x2000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0ac80000 0 0xf000>,
+			      <0 0x0accc000 0 0x2000>,
+			      <0 0x0acd1000 0 0x2000>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "qdss_debug_xo",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0
+					 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x20>,
+				 <&apps_smmu 0x18a0 0x40>,
+				 <&apps_smmu 0x1860 0x00>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_IFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0", "ife1", "ife2", "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8650-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
-- 
2.49.0


