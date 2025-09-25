Return-Path: <linux-arm-msm+bounces-74827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA5B9CDD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42CC22E8425
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E939923314B;
	Thu, 25 Sep 2025 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8dCO8zJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C331DDA14
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759475; cv=none; b=aHXm0qhhiCuEy/Q83dDkd471feZJXooF/JDqeh+umlpLu/7+l24P8ua6Swdzg0OFdXTQDMf41V8h7220cMGFLL6sAaIa/N/nOnk+eiiDT+B7DBPMMLFMQBU8o4jrw3fZHgkIxKG7Zh1S/QI46sM4EmckU/jbHOdNFBTUjg7jdUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759475; c=relaxed/simple;
	bh=RKEMiM3gkVPSZhZFthZwYvSmpZrF3e8CuIg3oEwNZH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0L66ZQFwu3f+IkOKnDPGW3CCChXawM9lp3ERYjqAUVcC5dAYO8FbGEaNBlM/nZvjMSZ7C3uJm0rgVAU62Yz18xueFLEF58k7tu9QsywZsLWgYmwfGKafdU92QQ2Geqon9LqzcJkBQiqxH7U2CJQGM5DyeafxDWl3pQdAW+uVYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8dCO8zJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFQaW024258
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgsoNYxgiaTn/i/3L7JlUrEi4TFVQisW69Zggkv7Wqw=; b=g8dCO8zJsY5Sw6/t
	T104KIohCavd7MxWpP0AwEzOwfgBX7OsaEVdjgBF7RTVhvE3+Sd8WnKWw0W/11hg
	ijaMEQsO0oLD2TnKl1b7jDZShJW5oy75RBaXWHw9mGt4TKEkxz3PprGyaihdWpUi
	wvrXs7byLyK5XJG6EWyqdm2BHevoYGOGm1E4h0B1nKN5MB2uzDe1oAkGZoO/1dfS
	0qwIyfcBnxBI8jV6ffqrCGKYeOnLpWqAwFv8WJpl2sDGUbkS3DqfBllpBzIu1w9p
	4JHfm0lJPNMyE1or82o2PIS63b6Tmk2uIJhQbfjns+jAbqOb7+Vnrnps5fPmu6I/
	7xYdXg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d5wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f2e48a829so598433b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759469; x=1759364269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgsoNYxgiaTn/i/3L7JlUrEi4TFVQisW69Zggkv7Wqw=;
        b=GMvsh2QAQPsdEivqj1LdYi0m46jKFVBKC43HUfH4bbUvMpTMZrkjKSxPV3O7PoPtE2
         NvQpJ/qwxpJZwPWIBquw7zErsH6xFX4vHSrHx4Ewveq6PhLJaKvpNmbpGeo4PGzKo86f
         Hj6iQb++O7gpQKQkuUZ+93BR0m7LCYOh+vH080YZGkY+OaBQeVb9XGABPxWa17OZrK7s
         +vyPQnhl09jQ7dxF5jIOJvv4KtR346M/o0ZZdtqMT2tepgJpxjecvGalue44v/8Nv4SG
         zJcTW/647Du0wkJcRsjyYAYSA+sNicEUB0di5BvroDpxg5P6kpRV6D4LoK0Hued7B7dw
         smuQ==
X-Gm-Message-State: AOJu0YwStyjRKl5gEsJaDaWkQqXnklRTQLvX+wCMv1i2gTdpTs122j0O
	esEsYRcByys4ztpi8QN0q8gfec65r+X8wX5hLgMTr98IMahl0fovUlkW7MiBClu1UlRIjht6g6U
	Uwn71M6n64PraG71W+RHKwrGFZVf/snl7cG9omi23OOsJmO6dI1nngZUSPr+JJabKoMgn
X-Gm-Gg: ASbGncvLs/5sPx2YunHZPyDeFqOeC04Ot8DvQWzxjPMB5VSdua1Tad1EtWlk9UEYvTg
	3lzzdB/N2D4sqlnzKxc+teoI6wUYNJAVvVRfSqnL95zf8tALAHAvWJBzzsR1I5I3RkT5d6DgU5+
	np5fjSrBTU0bFNhUZfogX42Hux21P2aooL9B0fgjFMAh4LYFE0ZJTxRmjmKLuAxuyznp6D3G79l
	vKK7plXbyzd7DNLC1bcxGJwAVKMaUPTv99oWAH/vqN1KfHEzZznmn5r/u7s4f6i0jitVzlhVGY9
	WmuNb+xOHVWQeqkOAjqtIjP2GiRhougTh1ATAjG39MFW4IjhWwEnF+Ud+2NjnygU9g5lGzwSzt0
	kaSbr1UHE2krvkWQ=
X-Received: by 2002:a05:6a00:13a0:b0:772:48c5:c758 with SMTP id d2e1a72fcca58-780fce20dc7mr2024642b3a.8.1758759467792;
        Wed, 24 Sep 2025 17:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVMRmJffBxGSR9VzOfXDA2zpIk4cEVGp7PvCGYxiKixeRU8uPqpXNHujJ0Zm0nmq2zgKKpwA==
X-Received: by 2002:a05:6a00:13a0:b0:772:48c5:c758 with SMTP id d2e1a72fcca58-780fce20dc7mr2024596b3a.8.1758759467014;
        Wed, 24 Sep 2025 17:17:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:46 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:30 -0700
Subject: [PATCH 13/20] arm64: dts: qcom: kaanapali: Add QUPv3 configuration
 for serial engines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-13-3fdbc4b9e1b1@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=68606;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=qOdw7T8NftBNXd79IZYzSY26HWQ7N+hc9G80NQPhcCo=;
 b=Yyx6VdP2hXmw/Ak8H4jZTa/1MlYlTHLvfDSU8faqWvSzXDufCj+PT2Mcffjy7Z4sI969k/qzg
 x/pEIQ7lWkjBDxrWUpBAShpyxt4Aa5VVcmPjn3o1kXQQY7Y2OyaSBDR
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d48a2e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ljkZNETXFm4LB4kJWQYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: i1Sd8bPdhq1oW5S22FkXSXgEmkbt_LHM
X-Proofpoint-ORIG-GUID: i1Sd8bPdhq1oW5S22FkXSXgEmkbt_LHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX2gUY4X5dQ3XX
 UYLxN6wBe0B5oRhdz/o+UFzloUBpdvdLGN52qAtpHrsixoLuZYUHj4fxeTOWvH6NgyrDRT0Qifz
 pm+YBRYfz9mbyyEiVYWBW4/LdKVWqq9GAW1R1H1X7+iGYyrEya/acm9pT5CR5gp5XVSyHHQLzpQ
 Qwg97jdyPhAbMfe7+r8igaWhJaFmmUNaRFJ4D6AQkbSDgPx+xaEkFIEHLvN/QoVerXiakvQ47DH
 ApDPbPl2G6ryiDzh7AvGCY2XonDifa2XLbGjI/34Qd5OmkYpdE2ClVqwbmR7kq75fTs4e4tWR/f
 sM0puKNEiAe3kV9favCiIhI40GRdVB7DUjOLTQdayw4n5KWwSywaNx0VwUENrf3hEMCAqa6Fzq5
 aW4PqxFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

Add device tree support for QUPv3 serial engine protocols on Kaanapali.
Kaanapali has 24 QUP serial engines across 4 QUP wrappers, each with
support of GPI DMA engines, and it also includes 5 I2C hubs.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2306 +++++++++++++++++++++++++++++--
 1 file changed, 2199 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 6ed7acdb871e..182044f61142 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -579,6 +580,508 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,kaanapali-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x1f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x436 0x0>;
+			dma-coherent;
+		};
+
+		qupv3_2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				<&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x423 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			i2c8: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c8_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi8: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c9: i2c@884000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c9_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi9: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c10: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c10_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi10: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c11: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c11_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi11: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c12: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c12_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		i2c_master_hub: geniqup@9c0000 {
+			compatible = "qcom,geni-se-i2c-master-hub";
+			reg = <0x0 0x009c0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
+			clock-names = "s-ahb";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			i2c_hub_0: i2c@980000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00980000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c0_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_1: i2c@984000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00984000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c1_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_2: i2c@988000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00988000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c2_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_3: i2c@98c000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x0098c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c3_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_4: i2c@990000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00990000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c4_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,kaanapali-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x1f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0xb6 0x0>;
+			dma-coherent;
+		};
+
 		qupv3_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x00ac0000 0x0 0x2000>;
@@ -596,142 +1099,1230 @@ qupv3_1: geniqup@ac0000 {
 			#size-cells = <2>;
 			ranges;
 
-			uart7: serial@a9c000 {
-				compatible = "qcom,geni-debug-uart";
-				reg = <0x0 0x00a9c000 0x0 0x4000>;
+			i2c0: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 828 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c0_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi0: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 828 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c1: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 829 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi1: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 829 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c2: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi2: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c3: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi3: spi@a8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c4: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c4_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi4: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c5: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c5_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi5: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c6: i2c@a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c6_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi6: spi@a98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart7: serial@a9c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x00a9c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart7_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		remoteproc_soccp: remoteproc-soccp@d00000 {
+			compatible = "qcom,kaanapali-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong",
+					  "wake-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccp_dtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 10>,
+					   <&soccp_smp2p_out 9>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"wakeup",
+						"sleep",
+						"ping";
+
+			status = "okay";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
+		rng: rng@10c3000 {
+			compatible = "qcom,kaanapali-trng", "qcom,trng";
+			reg = <0x0 0x010c3000 0x0 0x1000>;
+		};
+
+		ipcc: mailbox@1106000 {
+			compatible = "qcom,kaanapali-ipcc", "qcom,ipcc";
+			reg = <0x0 0x01106000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
+		cnoc_main: interconnect@1500000 {
+			compatible = "qcom,kaanapali-cnoc-main";
+			reg = <0x0 0x01500000 0x0 0x1a080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		config_noc: interconnect@1600000 {
+			compatible = "qcom,kaanapali-cnoc-cfg";
+			reg = <0x0 0x01600000 0x0 0x6200>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		system_noc: interconnect@1680000 {
+			compatible = "qcom,kaanapali-system-noc";
+			reg = <0x0 0x01680000 0x0 0x1f080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		pcie_noc: interconnect@16c0000 {
+			compatible = "qcom,kaanapali-pcie-anoc";
+			reg = <0x0 0x016c0000 0x0 0x11400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
+		};
+
+		aggre_noc: interconnect@16e0000 {
+			compatible = "qcom,kaanapali-aggre-noc";
+			reg = <0x0 0x016e0000 0x0 0x42400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
+		};
+
+		mmss_noc: interconnect@1780000 {
+			compatible = "qcom,kaanapali-mmss-noc";
+			reg = <0x0 0x01780000 0x0 0x5b800>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		gpi_dma3: dma-controller@1900000 {
+			compatible = "qcom,kaanapali-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x01900000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x1e>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x4d6 0x0>;
+			dma-coherent;
+		};
+
+		qupv3_3: geniqup@19c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x019c0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x4c3 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			i2c13: i2c@1980000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01980000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c13_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c14: i2c@1984000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01984000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c14_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi14: spi@1984000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01984000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c15: i2c@1988000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01988000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c15_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi15: spi@1988000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01988000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c16: i2c@198c000  {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0198c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c16_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi16: spi@198c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x198c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c17: i2c@1990000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01990000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c17_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi17: spi@1990000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01990000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart18: serial@1994000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x01994000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart18_default>, <&qup_uart18_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma4: dma-controller@1a00000 {
+			compatible = "qcom,kaanapali-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x01a00000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x1e>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x536 0x0>;
+			dma-coherent;
+		};
+
+		qupv3_4: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x01ac0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_4_M_AHB_CLK>,
+				<&gcc GCC_QUPV3_WRAP_4_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x523 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			i2c19: i2c@1a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c19_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi19: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma4 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma4 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c20: i2c@1a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c20_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi20: spi@1a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma4 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma4 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c21: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c21_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi21: spi@1a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
 
-				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>;
 
-				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP4_S2_CLK>;
 				clock-names = "se";
 
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-				pinctrl-0 = <&qup_uart7_default>;
+				dmas = <&gpi_dma4 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma4 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
 				pinctrl-names = "default";
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
-		};
 
-		remoteproc_soccp: remoteproc-soccp@d00000 {
-			compatible = "qcom,kaanapali-soccp-pas";
-			reg = <0x0 0x00d00000 0x0 0x200000>;
+			i2c22: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
 
-			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
-					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
-					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
-					      <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack",
-					  "pong",
-					  "wake-ack";
+				interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+				clocks = <&gcc GCC_QUPV3_WRAP4_S3_CLK>;
+				clock-names = "se";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "cx",
-					     "mx";
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 
-			memory-region = <&soccp_mem>,
-					<&soccp_dtb_mem>;
+				dmas = <&gpi_dma4 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 
-			qcom,smem-states = <&soccp_smp2p_out 0>,
-					   <&soccp_smp2p_out 10>,
-					   <&soccp_smp2p_out 9>,
-					   <&soccp_smp2p_out 8>;
-			qcom,smem-state-names = "stop",
-						"wakeup",
-						"sleep",
-						"ping";
+				pinctrl-0 = <&qup_i2c22_data_clk>;
+				pinctrl-names = "default";
 
-			status = "okay";
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_MPROC_SOCCP
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-				qcom,remote-pid = <19>;
-				label = "soccp";
+				status = "disabled";
 			};
-		};
 
-		rng: rng@10c3000 {
-			compatible = "qcom,kaanapali-trng", "qcom,trng";
-			reg = <0x0 0x010c3000 0x0 0x1000>;
-		};
-
-		ipcc: mailbox@1106000 {
-			compatible = "qcom,kaanapali-ipcc", "qcom,ipcc";
-			reg = <0x0 0x01106000 0x0 0x1000>;
+			i2c23: i2c@1a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
 
-			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-controller;
-			#interrupt-cells = <3>;
-
-			#mbox-cells = <2>;
-		};
+				interrupts = <GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>;
 
-		cnoc_main: interconnect@1500000 {
-			compatible = "qcom,kaanapali-cnoc-main";
-			reg = <0x0 0x01500000 0x0 0x1a080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+				clocks = <&gcc GCC_QUPV3_WRAP4_S4_CLK>;
+				clock-names = "se";
 
-		config_noc: interconnect@1600000 {
-			compatible = "qcom,kaanapali-cnoc-cfg";
-			reg = <0x0 0x01600000 0x0 0x6200>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 
-		system_noc: interconnect@1680000 {
-			compatible = "qcom,kaanapali-system-noc";
-			reg = <0x0 0x01680000 0x0 0x1f080>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-		};
+				dmas = <&gpi_dma4 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 
-		pcie_noc: interconnect@16c0000 {
-			compatible = "qcom,kaanapali-pcie-anoc";
-			reg = <0x0 0x016c0000 0x0 0x11400>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
-				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
-		};
+				pinctrl-0 = <&qup_i2c23_data_clk>;
+				pinctrl-names = "default";
 
-		aggre_noc: interconnect@16e0000 {
-			compatible = "qcom,kaanapali-aggre-noc";
-			reg = <0x0 0x016e0000 0x0 0x42400>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
-			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&rpmhcc RPMH_IPA_CLK>;
-		};
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-		mmss_noc: interconnect@1780000 {
-			compatible = "qcom,kaanapali-mmss-noc";
-			reg = <0x0 0x01780000 0x0 0x5b800>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			#interconnect-cells = <2>;
+				status = "disabled";
+			};
 		};
 
 		pcie0: pcie@1c00000 {
@@ -1666,6 +3257,491 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio66", "gpio67";
+				function = "i2chub0_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c1_data_clk: hub-i2c1-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio78", "gpio79";
+				function = "i2chub0_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c2_data_clk: hub-i2c2-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio68", "gpio69";
+				function = "i2chub0_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c3_data_clk: hub-i2c3-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio70", "gpio71";
+				function = "i2chub0_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c4_data_clk: hub-i2c4-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio72", "gpio73";
+				function = "i2chub0_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio80", "gpio83";
+				function = "qup1_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio74", "gpio75";
+				function = "qup1_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio40", "gpio41";
+				function = "qup1_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio44", "gpio45";
+				function = "qup1_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "qup1_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio52", "gpio53";
+				function = "qup1_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio56", "gpio57";
+				function = "qup1_se6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio0", "gpio1";
+				function = "qup2_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio4", "gpio5";
+				function = "qup2_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio117", "gpio118";
+				function = "qup2_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio122", "gpio123";
+				function = "qup2_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio208", "gpio209";
+				function = "qup2_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio64", "gpio65";
+				function = "qup3_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio8", "gpio9";
+				function = "qup3_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio12", "gpio13";
+				function = "qup3_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio16", "gpio17";
+				function = "qup3_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio20", "gpio21";
+				function = "qup3_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio48", "gpio49";
+				function = "qup4_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio28", "gpio29";
+				function = "qup4_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "qup4_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio121", "gpio84";
+				function = "qup4_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c23_data_clk: qup-i2c23-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio161", "gpio162";
+				function = "qup4_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio81";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio80", "gpio83", "gpio82";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio77";
+				function = "qup1_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio74", "gpio75", "gpio76";
+				function = "qup1_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio43";
+				function = "qup1_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio40", "gpio41", "gpio42";
+				function = "qup1_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio47";
+				function = "qup1_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio44", "gpio45", "gpio46";
+				function = "qup1_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio39";
+				function = "qup1_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup1_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio55";
+				function = "qup1_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio52", "gpio53", "gpio54";
+				function = "qup1_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio59";
+				function = "qup1_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio56", "gpio57", "gpio58";
+				function = "qup1_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio3";
+				function = "qup2_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				/* MISO, MOSI, CLK */pins = "gpio0", "gpio1", "gpio2";
+				function = "qup2_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio7";
+				function = "qup2_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup2_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio120";
+				function = "qup2_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio117", "gpio118", "gpio119";
+				function = "qup2_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio125";
+				function = "qup2_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio122", "gpio123", "gpio124";
+				function = "qup2_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio11";
+				function = "qup3_se1";
+				drive-strength = <6>;
+				bias-pull-up;
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio8", "gpio9", "gpio10";
+				function = "qup3_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio15";
+				function = "qup3_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio12", "gpio13", "gpio14";
+				function = "qup3_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi16_cs: qup-spi16-cs-state {
+				pins = "gpio19";
+				function = "qup3_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi16_data_clk: qup-spi16-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio16", "gpio17", "gpio18";
+				function = "qup3_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi17_cs: qup-spi17-cs-state {
+				pins = "gpio23";
+				function = "qup3_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi17_data_clk: qup-spi17-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio20", "gpio21", "gpio22";
+				function = "qup3_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi19_cs: qup-spi19-cs-state {
+				pins = "gpio51";
+				function = "qup4_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi19_data_clk: qup-spi19-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio48", "gpio49", "gpio50";
+				function = "qup4_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi20_cs: qup-spi20-cs-state {
+				pins = "gpio31";
+				function = "qup4_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi20_data_clk: qup-spi20-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio28", "gpio29", "gpio30";
+				function = "qup4_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi21_cs: qup-spi21-cs-state {
+				pins = "gpio35";
+				function = "qup4_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi21_data_clk: qup-spi21-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio32", "gpio33", "gpio34";
+				function = "qup4_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_uart7_default: qup-uart7-state {
 				 /* TX, RX */
 				 pins = "gpio62", "gpio63";
@@ -1674,6 +3750,22 @@ qup_uart7_default: qup-uart7-state {
 				 bias-disable;
 			};
 
+			qup_uart18_default: qup-uart18-default-state {
+				/* TX, RX */
+				pins = "gpio26", "gpio27";
+				function = "qup3_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart18_cts_rts: qup-uart18-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio24", "gpio25";
+				function = "qup3_se5";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc2_default: sdc2-default-state {
 				clk-pins {
 					pins = "sdc2_clk";

-- 
2.25.1


