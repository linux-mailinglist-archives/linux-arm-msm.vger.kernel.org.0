Return-Path: <linux-arm-msm+bounces-74929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC99B9D98A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5604188BA80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C452EA17F;
	Thu, 25 Sep 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7XCte6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4672E8E11
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781759; cv=none; b=jYkwC8vQehBLf/s+1Od8Gd6Nxri/VvXiIaSopVElYIFsX6Jx13DTZLm2igYZFJ4H9trk5BIVnOSugntycOkTVPBTx8DWaYV6J79hoBD4FEq8qcbLrrW5ELV1RO/sngoVypzTHUD/aJyB3ahdGSydPqhOmYSerMQ/MPW1i9MX+7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781759; c=relaxed/simple;
	bh=XAxOQqW3WtEfgypzX+jc1Eeq2bsJIABlPu+RMvSNV8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEVWuq49Qv6MtZOxoXqzF6owlYSM5ImY8Gn+j3D+E+VMTAswvKR7M2+U96hR/Hh02ZcW7FDsSFWpiij3sy9pIEUYQ+p0t/+lkoHZ9SWw7p0rmBUr7Xogw2Rgp+8QOAiknIIvafxCihaFgpGpMfceKEqbraRra261IXKKMJS7Twc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7XCte6h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0F4um025248
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4W3bKzw8k4Fv4Dktl2j9ijT2ChNlA6Eq8Whmi7VeI7c=; b=k7XCte6hSng7876E
	29Pz69fK6a5CRnVn6CiLcUoX1QEQC7fCSUkoSTb9cif9SbeVIPsTWJgIVDNPEzNr
	fjo4Nd7QbX/9jROjiBe3sp6VHb+ID79HAz/0aFRgwcMjVKxuEgVpMnwIBkOrhZV1
	B88/mtUDiIGP5OKL2TCNP1Irf0c8fizg6GG9lmYOjiQdPTO7mXCsloJj8LYnDseG
	oAo3Zkq9MpBE3K6a6QB35rD50UE04hna7xM8i2idUdhX/VTycYFY/820wtTtN5/N
	gE+p6emgMqTAb22f2z0qxwfWex4VYJfxEnUEAzDB0YfyMjvkqd683IcJ6l/foRH4
	AS0wmg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv171kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7810289cd5eso687476b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781753; x=1759386553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W3bKzw8k4Fv4Dktl2j9ijT2ChNlA6Eq8Whmi7VeI7c=;
        b=I9uAJIdZyC0y2t9Uro6opSjQ7mKGwk9h/t36Bqw7RSF5MT7wF8BaiZLeKpdxIXLoAT
         KJb/YtdcKqSnXt4hNFAQOC6WUKjYvRqC7SNvC8jnH24m/56k2BoYYMtV7HYgWnRsSKqX
         SCWtBAyHTbje8USmVgDiyKdoDMlLp/sQXW6TK1NXUEqaFHriYny9zsa4y8ZtbvoW2LeR
         qE9Jn/uH6EyheSJJQc2Jwr6tsOpT9YN0U/8dBnS8eCJlyWPnvOIbClA7061SG/e6Tfa9
         vPTtTqXAeDdIbdiYUVDmYrSGLQzH6pTvun3beitUohjgA7048tqyK4Q0PYaBaaVYvUqi
         axOw==
X-Gm-Message-State: AOJu0YzsELKNQxmgN1K733AWI4mzjpXovH2SFaba17oBeoR5T91JNDcA
	Dfnwrsx7PDkqFv02c8xldY3nYb1VAbyQ+gr4Adk2DBP+tIWfG/PFK0PPNayFRxLH0k0gc8PhgGM
	oecYv3F3FAKthD7aysXUAO9trxZ8S1hE06YGr7+Zh2ZJnTBfWXF86JpRb61i1yreLuPBNxYCvpr
	oR
X-Gm-Gg: ASbGnctvSpvVWzRmJa4tIYyG5HCFf5RAMmYscDdvkigYpRQA0MZN3nqdy/IVnDf+k2v
	0SITzqXAC9YeGCvKSjNbRg97LH3nvCxcv4KdLIYtAr2HEJgYHC4PGATqj2Bds6Vorhlwvx3x4dp
	tGUBywvpnsuhv8F5QDHu552D28AT39gIjXSNuJKlvk8vyYmVyhUK/NEec95fiTOEjOSqKl+U1nV
	U5YI9md/+Q4aZ5rCPfo67+FR/C+x5NkY9VVIHgQVztIY72Sf0ZQeJ8jgwOwfpzCslIXRI7/wVxt
	kcgw8XxRGhxPT5Ray3hKOs2vnc3KN2Yi5LMhF4cDRhPa6FiSMCUXq73Ko6jIihYR6ovLcpYUEv6
	G5ym66pJedJGJ1DBERRKc9s3jmwC8VzxyIJCW3uQ0KZzwEDCZoFKlkwabiZ6d
X-Received: by 2002:a05:6a00:194f:b0:77d:2ca7:84be with SMTP id d2e1a72fcca58-780fcea2dd6mr2927781b3a.18.1758781751748;
        Wed, 24 Sep 2025 23:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUiaeSTbw8bvOX50o8CT1v5zTvyPcpEFDFC2FWswqWBte00MckxTVFsInyaE8Ufu30R4hfow==
X-Received: by 2002:a05:6a00:194f:b0:77d:2ca7:84be with SMTP id d2e1a72fcca58-780fcea2dd6mr2927680b3a.18.1758781750196;
        Wed, 24 Sep 2025 23:29:10 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:09 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:10 +0530
Subject: [PATCH v2 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-4-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: IqhP_CAmFCOKP_bE0sR-tLzhxES-Czzt
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4e13a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3xYqM5imdM8eUm7DbMkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXzQxn8TrT4aVc
 6BHHJQ8FTT4vA3NDMgLFXEpi2CBDQ6JZhWpyM6O1M1D5MCwFi1jlT61MlmzDEPldpnGy5D6KykN
 AhZoNLo4Hel8yyJF9YS323D9OO6Q9oZzs4CR+6G4B+xYUAL2bu7T+5i+NtmJbzmyKyjU8iagSSo
 b066Kc2muWwwyuvVMr/nmb16BYClLflHkj97vEZOvLALE1cfdMHSIXKexr7cCfCufIEtKqSmrvY
 a8FjtBHi3IiEScwK0g+6/HnxvrrpCJeYj0AHKzTerrFw1+gH6sWWGVrRjIMBT7K4SbWPuxEvCsk
 35qzqpEUSVI18G1W8+vpxnBPNdIeFRgh5rhiehLStzoT4l0H9orXfhFZ0Z8aj+3cif9yKaGxd4R
 +J4CT6Bz
X-Proofpoint-ORIG-GUID: IqhP_CAmFCOKP_bE0sR-tLzhxES-Czzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

Add device tree support for QUPv3 serial engine protocols on Glymur.
Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
support of GPI DMA engines.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts |   43 +
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 3041 +++++++++++++++++++++++++++++--
 2 files changed, 2936 insertions(+), 148 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index a1714ec8492961b211ec761f16b39245007533b8..4561c0b87b017cba0a1db8814123a070b37fd434 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -13,6 +13,49 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
+		i2c0 = &i2c16;
+		i2c1 = &i2c17;
+		i2c2 = &i2c18;
+		i2c3 = &i2c19;
+		i2c4 = &i2c20;
+		i2c5 = &i2c22;
+		i2c6 = &i2c23;
+		i2c7 = &i2c8;
+		i2c8 = &i2c9;
+		i2c9 = &i2c10;
+		i2c10 = &i2c11;
+		i2c11 = &i2c12;
+		i2c12 = &i2c13;
+		i2c13 = &i2c15;
+		i2c14 = &i2c0;
+		i2c15 = &i2c1;
+		i2c16 = &i2c2;
+		i2c17 = &i2c3;
+		i2c18 = &i2c4;
+		i2c19 = &i2c5;
+		i2c20 = &i2c6;
+		spi0 = &spi16;
+		spi1 = &spi17;
+		spi2 = &spi18;
+		spi3 = &spi19;
+		spi4 = &spi20;
+		spi5 = &spi22;
+		spi6 = &spi23;
+		spi7 = &spi8;
+		spi8 = &spi9;
+		spi9 = &spi10;
+		spi10 = &spi11;
+		spi11 = &spi12;
+		spi12 = &spi13;
+		spi13 = &spi15;
+		spi14 = &spi0;
+		spi15 = &spi1;
+		spi16 = &spi2;
+		spi17 = &spi3;
+		spi18 = &spi4;
+		spi19 = &spi5;
+		spi20 = &spi6;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f1c5a0cb483670e9f8044e250950693b4a015479..8674465b22707207523caa8ad635d95a3396497a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -707,6 +707,32 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			dma-channel-mask = <0x3f>;
+			#dma-cells = <3>;
+			iommus = <&apps_smmu 0xd76 0x0>;
+			status = "ok";
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x3000>;
@@ -718,6 +744,339 @@ qupv3_2: geniqup@8c0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			status = "ok";
+
+			i2c16: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00880000 0 0x4000>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c16_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi16: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00880000 0 0x4000>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c17: i2c@884000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00884000 0 0x4000>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c17_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi17: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00884000 0 0x4000>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c18: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00888000 0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c18_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi18: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00888000 0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi18_data_clk>, <&qup_spi18_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c19: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0088c000 0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c19_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi19: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0088c000 0 0x4000>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart19: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0088c000 0 0x4000>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				pinctrl-0 = <&qup_uart19_default>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			i2c20: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00890000 0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c20_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi20: spi@890000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00890000 0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c21: i2c@894000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00894000 0 0x4000>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c21_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi21: spi@894000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00894000 0 0x4000>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
 			uart21: serial@894000 {
 				compatible = "qcom,geni-debug-uart";
@@ -734,181 +1093,2551 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 				pinctrl-0 = <&qup_uart21_default>;
 				pinctrl-names = "default";
 			};
-		};
 
-		cnoc_main: interconnect@1500000 {
-			compatible = "qcom,glymur-cnoc-main";
-			reg = <0x0 0x01500000 0x0 0x17080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			i2c22: i2c@898000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00898000 0 0x4000>;
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c22_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
-		config_noc: interconnect@1600000 {
-			compatible = "qcom,glymur-cnoc-cfg";
-			reg = <0x0 0x01600000 0x0 0x6600>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			spi22: spi@898000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00898000 0 0x4000>;
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi22_data_clk>, <&qup_spi22_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
-		system_noc: interconnect@1680000 {
-			compatible = "qcom,glymur-system-noc";
-			reg = <0x0 0x01680000 0x0 0x1c080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			uart22: serial@898000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00898000 0 0x4000>;
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+							"qup-config";
+				pinctrl-0 = <&qup_uart22_default>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
 
-		pcie_west_anoc: interconnect@16c0000 {
-			compatible = "qcom,glymur-pcie-west-anoc";
-			reg = <0x0 0x016c0000 0x0 0xf580>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-			clocks = <&gcc GCC_AGGRE_NOC_PCIE_3A_WEST_SF_AXI_CLK>,
-				 <&gcc GCC_AGGRE_NOC_PCIE_3B_WEST_SF_AXI_CLK>,
-				 <&gcc GCC_AGGRE_NOC_PCIE_4_WEST_SF_AXI_CLK>,
-				 <&gcc GCC_AGGRE_NOC_PCIE_6_WEST_SF_AXI_CLK>;
-		};
+			i2c23: i2c@89c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0089c000 0 0x4000>;
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c23_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
-		pcie_east_anoc: interconnect@16d0000 {
-			compatible = "qcom,glymur-pcie-east-anoc";
-			reg = <0x0 0x016d0000 0x0 0xf300>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-			clocks = <&gcc GCC_AGGRE_NOC_PCIE_5_EAST_SF_AXI_CLK>;
+			spi23: spi@89c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0089c000 0 0x4000>;
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi23_data_clk>, <&qup_spi23_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
-		aggre1_noc: interconnect@16e0000 {
-			compatible = "qcom,glymur-aggre1-noc";
-			reg = <0x0 0x016e0000 0x0 0x14400>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			dma-channel-mask = <0x3f>;
+			#dma-cells = <3>;
+			iommus = <&apps_smmu 0xcb6 0x0>;
+			status = "okay";
+		};
+
+		qupv3_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x00ac0000 0 0x3000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				<&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+			iommus = <&apps_smmu 0xca3 0x0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "ok";
 
-		aggre2_noc: interconnect@1720000 {
-			compatible = "qcom,glymur-aggre2-noc";
-			reg = <0x0 0x01720000 0x0 0x14400>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-			clocks = <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>,
-				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
-		};
+			i2c8: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a80000 0 0x4000>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c8_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
-		aggre3_noc: interconnect@1700000 {
-			compatible = "qcom,glymur-aggre3-noc";
-			reg = <0x0 0x01700000 0x0 0x1d400>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			spi8: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a80000 0 0x4000>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
-		aggre4_noc: interconnect@1740000 {
-			compatible = "qcom,glymur-aggre4-noc";
-			reg = <0x0 0x01740000 0x0 0x14400>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>;
-		};
+			i2c9: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a84000 0 0x4000>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c9_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
-		mmss_noc: interconnect@1780000 {
-			compatible = "qcom,glymur-mmss-noc";
-			reg = <0x0 0x01780000 0x0 0x5b800>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			spi9: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a84000 0 0x4000>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 
-		pcie_east_slv_noc: interconnect@1900000 {
-			compatible = "qcom,glymur-pcie-east-slv-noc";
-			reg = <0x0 0x01900000 0x0 0xe080>;
+			i2c10: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a88000 0 0x4000>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c10_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi10: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a88000 0 0x4000>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a8c000 0 0x4000>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c11_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi11: spi@a8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a8c000 0 0x4000>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a90000 0 0x4000>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c12_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi12: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a90000 0 0x4000>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c13: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a94000 0 0x4000>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c13_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi13: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a94000 0 0x4000>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c14: i2c@a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a98000 0 0x4000>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c14_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi14: spi@a98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a98000 0 0x4000>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart14: serial@a98000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a98000 0 0x4000>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				pinctrl-0 = <&qup_uart14_default>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			i2c15: i2c@a9c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a9c000 0 0x4000>;
+				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c15_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi15: spi@a9c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a9c000 0 0x4000>;
+				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		gpi_dma0: dma-controller@b00000  {
+			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00b00000 0 0x60000>;
+			interrupts = <GIC_ESPI 76 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			dma-channel-mask = <0x3f>;
+			#dma-cells = <3>;
+			iommus = <&apps_smmu 0xd36 0x0>;
+			status = "ok";
+		};
+
+		qupv3_0: geniqup@bc0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x00bc0000 0 0x3000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+			iommus = <&apps_smmu 0xd23 0x0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "ok";
+
+			i2c0: i2c@b80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b80000 0 0x4000>;
+				interrupts = <GIC_ESPI 92 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c0_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi0: spi@b80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b80000 0 0x4000>;
+				interrupts = <GIC_SPI 1052 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+							"qup-config",
+							"qup-memory";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+					pinctrl-names = "default";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+			};
+
+			i2c1: i2c@b84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b84000 0 0x4000>;
+				interrupts = <GIC_SPI 1053 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi1: spi@b84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b84000 0 0x4000>;
+				interrupts = <GIC_SPI 1053 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@b88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b88000 0 0x4000>;
+				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+					<&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi2: spi@b88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b88000 0 0x4000>;
+				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart2: serial@b88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00b88000 0 0x4000>;
+				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				pinctrl-0 = <&qup_uart2_default>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			i2c3: i2c@b8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b8c000 0 0x4000>;
+				interrupts = <GIC_ESPI 95 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi3: spi@b8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b8c000 0 0x4000>;
+				interrupts = <GIC_SPI 1055 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@b90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b90000 0 0x4000>;
+				interrupts = <GIC_ESPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c4_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi4: spi@b90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b90000 0 0x4000>;
+				interrupts = <GIC_SPI 1056 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@b94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b94000 0 0x4000>;
+				interrupts = <GIC_ESPI 97 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c5_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi5: spi@b94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b94000 0 0x4000>;
+				interrupts = <GIC_SPI 1057 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@b98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b98000 0 0x4000>;
+				interrupts = <GIC_SPI 1058 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c6_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi6: spi@b98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b98000 0 0x4000>;
+				interrupts = <GIC_SPI 1058 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@b9c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00b9c000 0 0x4000>;
+				interrupts = <GIC_SPI 1059 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_i2c7_data_clk>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi7: spi@b9c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00b9c000 0 0x4000>;
+				interrupts = <GIC_SPI 1059 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre3_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		cnoc_main: interconnect@1500000 {
+			compatible = "qcom,glymur-cnoc-main";
+			reg = <0x0 0x01500000 0x0 0x17080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		config_noc: interconnect@1600000 {
+			compatible = "qcom,glymur-cnoc-cfg";
+			reg = <0x0 0x01600000 0x0 0x6600>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		system_noc: interconnect@1680000 {
+			compatible = "qcom,glymur-system-noc";
+			reg = <0x0 0x01680000 0x0 0x1c080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		pcie_west_anoc: interconnect@16c0000 {
+			compatible = "qcom,glymur-pcie-west-anoc";
+			reg = <0x0 0x016c0000 0x0 0xf580>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_NOC_PCIE_3A_WEST_SF_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_3B_WEST_SF_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_4_WEST_SF_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_6_WEST_SF_AXI_CLK>;
+		};
+
+		pcie_east_anoc: interconnect@16d0000 {
+			compatible = "qcom,glymur-pcie-east-anoc";
+			reg = <0x0 0x016d0000 0x0 0xf300>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_NOC_PCIE_5_EAST_SF_AXI_CLK>;
 		};
 
-		pcie_west_slv_noc: interconnect@1920000 {
-			compatible = "qcom,glymur-pcie-west-slv-noc";
-			reg = <0x0 0x01920000 0x0 0xf180>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+		aggre1_noc: interconnect@16e0000 {
+			compatible = "qcom,glymur-aggre1-noc";
+			reg = <0x0 0x016e0000 0x0 0x14400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		aggre2_noc: interconnect@1720000 {
+			compatible = "qcom,glymur-aggre2-noc";
+			reg = <0x0 0x01720000 0x0 0x14400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
+		};
+
+		aggre3_noc: interconnect@1700000 {
+			compatible = "qcom,glymur-aggre3-noc";
+			reg = <0x0 0x01700000 0x0 0x1d400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		aggre4_noc: interconnect@1740000 {
+			compatible = "qcom,glymur-aggre4-noc";
+			reg = <0x0 0x01740000 0x0 0x14400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>;
+		};
+
+		mmss_noc: interconnect@1780000 {
+			compatible = "qcom,glymur-mmss-noc";
+			reg = <0x0 0x01780000 0x0 0x5b800>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		pcie_east_slv_noc: interconnect@1900000 {
+			compatible = "qcom,glymur-pcie-east-slv-noc";
+			reg = <0x0 0x01900000 0x0 0xe080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		pcie_west_slv_noc: interconnect@1920000 {
+			compatible = "qcom,glymur-pcie-west-slv-noc";
+			reg = <0x0 0x01920000 0x0 0xf180>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+
+			#hwlock-cells = <1>;
+		};
+
+		tcsrcc: clock-controller@1fd5044 {
+			compatible = "qcom,glymur-tcsr";
+			reg = <0x0 0x1fd5044 0x0 0x48>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		tcsr: syscon@1fd6000 {
+			compatible = "syscon";
+			reg = <0x0 0x1fd6000 0x0 0x20000>;
+		};
+
+		hsc_noc: interconnect@2000000 {
+			compatible = "qcom,glymur-hscnoc";
+			reg = <0x0 0x02000000 0x0 0x93a080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		lpass_lpiaon_noc: interconnect@7400000 {
+			compatible = "qcom,glymur-lpass-lpiaon-noc";
+			reg = <0x0 0x07400000 0x0 0x19080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		lpass_lpicx_noc: interconnect@7420000 {
+			compatible = "qcom,glymur-lpass-lpicx-noc";
+			reg = <0x0 0x07420000 0x0 0x44080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		lpass_ag_noc: interconnect@7e40000 {
+			compatible = "qcom,glymur-lpass-ag-noc";
+			reg = <0x0 0x07e40000 0x0 0xe080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,glymur-pdc", "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x10000>;
+			qcom,pdc-ranges = <0 745 51>,
+					  <51 527 47>,
+					  <98 609 32>,
+					  <130 717 12>,
+					  <142 251 5>,
+					  <147 796 16>,
+					  <171 4104 36>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		sram@c30f000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c30f000 0x0 0x400>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,glymur-tlmm";
+			reg = <0x0 0x0f100000 0x0 0xf00000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 249>;
+			wakeup-parent = <&pdc>;
+
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio0";
+					function = "qup0_se0";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio1";
+					function = "qup0_se0";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio4";
+					function = "qup0_se1";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio5";
+					function = "qup0_se1";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio8";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio9";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio12";
+					function = "qup0_se3";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio13";
+					function = "qup0_se3";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio16";
+					function = "qup0_se4";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio17";
+					function = "qup0_se4";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio20";
+					function = "qup0_se5";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio21";
+					function = "qup0_se5";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio6";
+					function = "qup0_se6";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio7";
+					function = "qup0_se6";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio14";
+					function = "qup0_se7";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio15";
+					function = "qup0_se7";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio32";
+					function = "qup1_se0";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio33";
+					function = "qup1_se0";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio36";
+					function = "qup1_se1";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio37";
+					function = "qup1_se1";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio40";
+					function = "qup1_se2";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio41";
+					function = "qup1_se2";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio44";
+					function = "qup1_se3";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio45";
+					function = "qup1_se3";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio48";
+					function = "qup1_se4";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio49";
+					function = "qup1_se4";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio52";
+					function = "qup1_se5";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio53";
+					function = "qup1_se5";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio56";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio57";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio54";
+					function = "qup1_se7";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio55";
+					function = "qup1_se7";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio64";
+					function = "qup2_se0";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio65";
+					function = "qup2_se0";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio68";
+					function = "qup2_se1";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio69";
+					function = "qup2_se1";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c18_data_clk: qup-i2c18-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio72";
+					function = "qup2_se2";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio73";
+					function = "qup2_se2";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio76";
+					function = "qup2_se3";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio77";
+					function = "qup2_se3";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio80";
+					function = "qup2_se4";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio81";
+					function = "qup2_se4";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio84";
+					function = "qup2_se5";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio85";
+					function = "qup2_se5";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio88";
+					function = "qup2_se6";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio89";
+					function = "qup2_se6";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_i2c23_data_clk: qup-i2c23-data-clk-state {
+				sda_pins {
+					/* SDA */
+					pins = "gpio80";
+					function = "qup2_se7";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					/* SCL */
+					pins = "gpio81";
+					function = "qup2_se7";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio3";
+				function = "qup0_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio0";
+					function = "qup0_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio1";
+					function = "qup0_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio2";
+					function = "qup0_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio7";
+				function = "qup0_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio4";
+					function = "qup0_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio5";
+					function = "qup0_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio6";
+					function = "qup0_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio11";
+				function = "qup0_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				 miso-pins {
+					/* MISO */
+					pins = "gpio8";
+					function = "qup0_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio9";
+					function = "qup0_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio10";
+					function = "qup0_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio15";
+				function = "qup0_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio12";
+					function = "qup0_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio13";
+					function = "qup0_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio14";
+					function = "qup0_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio19";
+				function = "qup0_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio16";
+					function = "qup0_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio17";
+					function = "qup0_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio18";
+					function = "qup0_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio23";
+				function = "qup0_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio20";
+					function = "qup0_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio21";
+					function = "qup0_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio22";
+					function = "qup0_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio5";
+				function = "qup0_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio6";
+					function = "qup0_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio7";
+					function = "qup0_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio4";
+					function = "qup0_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi7_cs: qup-spi7-cs-state {
+				pins = "gpio13";
+				function = "qup0_se7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk-state {
+				/* MISO, MOSI, CLK */
+				miso-pins {
+					/* MISO */
+					pins = "gpio14";
+					function = "qup0_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio15";
+					function = "qup0_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio12";
+					function = "qup0_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio35";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio32";
+					function = "qup1_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio33";
+					function = "qup1_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio34";
+					function = "qup1_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio39";
+				function = "qup1_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio36";
+					function = "qup1_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio37";
+					function = "qup1_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio38";
+					function = "qup1_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio43";
+				function = "qup1_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio40";
+					function = "qup1_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio41";
+					function = "qup1_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio42";
+					function = "qup1_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio47";
+				function = "qup1_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio44";
+					function = "qup1_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio45";
+					function = "qup1_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio46";
+					function = "qup1_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi12_cs: qup-spi12-cs-state {
+				pins = "gpio51";
+				function = "qup1_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio48";
+					function = "qup1_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio49";
+					function = "qup1_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio50";
+					function = "qup1_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi13_cs: qup-spi13-cs-state {
+				pins = "gpio55";
+				function = "qup1_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
 
-		tcsr_mutex: hwlock@1f40000 {
-			compatible = "qcom,tcsr-mutex";
-			reg = <0x0 0x01f40000 0x0 0x20000>;
+			qup_spi13_data_clk: qup-spi13-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio52";
+					function = "qup1_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
 
-			#hwlock-cells = <1>;
-		};
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio53";
+					function = "qup1_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
 
-		tcsrcc: clock-controller@1fd5044 {
-			compatible = "qcom,glymur-tcsr";
-			reg = <0x0 0x1fd5044 0x0 0x48>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-		};
+				clk-pins {
+					/* CLK */
+					pins = "gpio54";
+					function = "qup1_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
 
-		tcsr: syscon@1fd6000 {
-			compatible = "syscon";
-			reg = <0x0 0x1fd6000 0x0 0x20000>;
-		};
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio59";
+				function = "qup1_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
 
-		hsc_noc: interconnect@2000000 {
-			compatible = "qcom,glymur-hscnoc";
-			reg = <0x0 0x02000000 0x0 0x93a080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio56";
+					function = "qup1_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio57";
+					function = "qup1_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
 
-		lpass_lpiaon_noc: interconnect@7400000 {
-			compatible = "qcom,glymur-lpass-lpiaon-noc";
-			reg = <0x0 0x07400000 0x0 0x19080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+				clk-pins {
+					/* CLK */
+					pins = "gpio58";
+					function = "qup1_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
 
-		lpass_lpicx_noc: interconnect@7420000 {
-			compatible = "qcom,glymur-lpass-lpicx-noc";
-			reg = <0x0 0x07420000 0x0 0x44080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio53";
+				function = "qup1_se7";
+				drive-strength = <6>;
+				bias-disable;
+			};
 
-		lpass_ag_noc: interconnect@7e40000 {
-			compatible = "qcom,glymur-lpass-ag-noc";
-			reg = <0x0 0x07e40000 0x0 0xe080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio54";
+					function = "qup1_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
 
-		pdc: interrupt-controller@b220000 {
-			compatible = "qcom,glymur-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>;
-			qcom,pdc-ranges = <0 745 51>,
-					  <51 527 47>,
-					  <98 609 32>,
-					  <130 717 12>,
-					  <142 251 5>,
-					  <147 796 16>,
-					  <171 4104 36>;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&intc>;
-			interrupt-controller;
-		};
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio55";
+					function = "qup1_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
 
-		sram@c30f000 {
-			compatible = "qcom,rpmh-stats";
-			reg = <0x0 0x0c30f000 0x0 0x400>;
-		};
+				clk-pins {
+					/* CLK */
+					pins = "gpio52";
+					function = "qup1_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
 
-		tlmm: pinctrl@f100000 {
-			compatible = "qcom,glymur-tlmm";
-			reg = <0x0 0x0f100000 0x0 0xf00000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 249>;
-			wakeup-parent = <&pdc>;
+			qup_spi16_cs: qup-spi16-cs-state {
+				pins = "gpio67";
+				function = "qup2_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi16_data_clk: qup-spi16-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio64";
+					function = "qup2_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio65";
+					function = "qup2_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio66";
+					function = "qup2_se0";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi17_cs: qup-spi17-cs-state {
+				pins = "gpio71";
+				function = "qup2_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi17_data_clk: qup-spi17-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio68";
+					function = "qup2_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio69";
+					function = "qup2_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio70";
+					function = "qup2_se1";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi18_cs: qup-spi18-cs-state {
+				pins = "gpio75";
+				function = "qup2_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi18_data_clk: qup-spi18-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio72";
+					function = "qup2_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio73";
+					function = "qup2_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio74";
+					function = "qup2_se2";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi19_cs: qup-spi19-cs-state {
+				pins = "gpio79";
+				function = "qup2_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi19_data_clk: qup-spi19-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio76";
+					function = "qup2_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio77";
+					function = "qup2_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio78";
+					function = "qup2_se3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi20_cs: qup-spi20-cs-state {
+				pins = "gpio83";
+				function = "qup2_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi20_data_clk: qup-spi20-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio80";
+					function = "qup2_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio81";
+					function = "qup2_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio82";
+					function = "qup2_se4";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi21_cs: qup-spi21-cs-state {
+				pins = "gpio87";
+				function = "qup2_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi21_data_clk: qup-spi21-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio84";
+					function = "qup2_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio85";
+					function = "qup2_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio86";
+					function = "qup2_se5";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi22_cs: qup-spi22-cs-state {
+				pins = "gpio91";
+				function = "qup2_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi22_data_clk: qup-spi22-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio88";
+					function = "qup2_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio89";
+					function = "qup2_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio90";
+					function = "qup2_se6";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi23_cs: qup-spi23-cs-state {
+				pins = "gpio83";
+				function = "qup2_se7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi23_data_clk: qup-spi23-data-clk-state {
+				miso-pins {
+					/* MISO */
+					pins = "gpio80";
+					function = "qup2_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				mosi-pins {
+					/* MOSI */
+					pins = "gpio81";
+					function = "qup2_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				clk-pins {
+					/* CLK */
+					pins = "gpio82";
+					function = "qup2_se7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_uart2_default: qup-uart2-default-state {
+				tx-pins {
+					pins = "gpio10";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio11";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			qup_uart14_default: qup-uart14-default-state {
+				cts-pins {
+					pins = "gpio56";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rts-pins {
+					pins = "gpio57";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio58";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio59";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			qup_uart19_default: qup-uart19-default-state {
+				cts-pins {
+					pins = "gpio76";
+					function = "qup2_se3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rts-pins {
+					pins = "gpio77";
+					function = "qup2_se3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio78";
+					function = "qup2_se3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio79";
+					function = "qup2_se3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
 
 			qup_uart21_default: qup-uart21-default-state {
 				tx-pins {
@@ -925,6 +3654,22 @@ rx-pins {
 					bias-disable;
 				};
 			};
+
+			qup_uart22_default: qup-uart22-default-state {
+				tx-pins {
+					pins = "gpio90";
+					function = "qup2_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio91";
+					function = "qup2_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {

-- 
2.34.1


