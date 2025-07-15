Return-Path: <linux-arm-msm+bounces-64923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93EB050EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF51B3A6A2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 05:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C972D4B47;
	Tue, 15 Jul 2025 05:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7JL0RoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9C2D3757
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752557278; cv=none; b=Nfd7s5VWDjfHAGoMsRfTc8/zJMW/sXefM8GxwOaXyJxfAkwPYK0mf7LQUOWZXEler3hiI+ztfbQZMcedw0VuFe+nRda8JpAU+8/XC4DQB0AGDJx8keflRUMFMGncXL96VBqsg2HLDSE0QHRGfcNUrIrJXBf0Ba6/YWo4D+i5i+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752557278; c=relaxed/simple;
	bh=51MNdtYntNLG/1os/32nm2tn39F84TmPT8pKmGrGibA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMjQ3y7jEjRzuJ2C2MCHaMENXZAr/r+A1hyUExaNNzlKkhERqqI2c7J/5Qa+Sve0NTBZqooGQXfJ3o7yvm7OwCj8TUMvl24BPthVhhqfIH+I553ecJHGSjOKm6pNO4g537V7GQftoE+a+fbpUFiNJkKDLaBlCDFsxDs8YjJmQas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7JL0RoC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGROln022077
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8svhojvKcb7
	NeDzSyV+TkkbBI6w4vDzPtOZ0qIkJ7gE=; b=A7JL0RoCWXi0oX9Q/bmKWsJQiEv
	YnIbkWSmAnYgjE2XuRB+h01q5y0bBqDNn6bdXtSpCSxxkSslqHNnEBkBysjzD/MO
	FMd6FmV5wvsDK5wQow13gv3wKrAmfcqpQNm37y/favgO3t5+5isedEoPoY9rjQGc
	xv6+bbnAw9wouxWPyAdREf/0xQnmsBloMR9bG1JvSyyHcAOQCDe4xvhs+jnYEEOQ
	o/+N0Lkg4dRs5uCNUkgFVKqXEok5aqgmqrO8kd68x7ldITInnNP0YLVVG/+u6rX+
	pgiGixfuqmVih6Eza7TG2J4SezvWcV+P4dsZy2y/gFdehSn2Uf7BwOvxeSA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dp9nvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso8043495b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 22:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752557275; x=1753162075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8svhojvKcb7NeDzSyV+TkkbBI6w4vDzPtOZ0qIkJ7gE=;
        b=NLIRxb2EiRQmoqrFuJa82aLXtTfXaxn6WFENuYbLomGVhCVZe2QdkcfQ3AuZSrxxyw
         rTQ/5aKlsMSe47d5KYbm+U2RZ9dgU6n52AObc4mzNfByOX8q5EBjwOQrd2YKs50bcAdT
         YuCQZtgOPYMJeDv2RLP78GJctsSaDWPQEtGPqCNhDdQdWB1HXWOG5p1eWzS2chlmxQtT
         5NW1Kmj3SPO5DDyYimu0UU7EgsutZVNV0GmtkbE8sqvq0aEpkju2emfvjeYqWKRLhIsu
         Sz+dcRiEe9rmxMpNZ/TkLg7+LWmY48AeLGbn77kd1NfO1W1+S+5W5ocp9XVyTA7KhC62
         AdiA==
X-Forwarded-Encrypted: i=1; AJvYcCUKXTQbJ0Tr8wUOnzecv6MJTFbogdh5uuYsvCvjq11krt/lPHsDH2rWqu8ysy8KXkb4c7+seh0rbijwjDyr@vger.kernel.org
X-Gm-Message-State: AOJu0YwEM8sjP6WwpmKDlnqT4XI00tk5oGKie+Bihlmf26G37bNW/rz1
	qwRDBUaWUcvB2iaB+YTTOYXtfXgVEl1ZmE5IpwsBVhkfWn377QiIkodiMPRBkeUQpW6Bxlfh35b
	awwdSSLr9woMP10cfNp8JOfH60CbHINCVABRNYQbwhCXo4Z+yE3eztT3F/5cOwXZPAnZ9
X-Gm-Gg: ASbGncuWo/1q2YV6At7JQFO4512f0urf0fPSd+fg33rkQAADJUL5KrZG4BYV8IAWIzx
	djKunHQpgWVJ2lWEoRZO1ULK/itqPa0C12wlzPtIF8R2K+2VG37Z6B5iGbQ8fBNKZuaRrk5a92Y
	Yvof3xwz/iBFXrqLmwWlAs1lu14kEe+tYacaRxkCo/davuUvuGc1RF5XbosXzkrphA4ZPBOFX4n
	Y3Kw+ygzdYOlCO+zDT2cz/cs59GippqQ9J1m9EhyG0c8dj3NHGMSSrBN/J2xvH4Kka3Uh8OfEJC
	WxXUtfBvcdgBCAX/2J9jpFcHtBnMOcUV1S3nphZFWwgh67i98+IOjjiLpUgLAnmf+BAJAAkvR0E
	rfA==
X-Received: by 2002:a05:6a00:2d08:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-74ee244a324mr21806850b3a.15.1752557275079;
        Mon, 14 Jul 2025 22:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0XeD/jbWxNWVKjRc2RmOnbSWjKirb5GC/CXswIUjkI8gpKZdySaeo7WrtYjWSqlw+VPpy9Q==
X-Received: by 2002:a05:6a00:2d08:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-74ee244a324mr21806812b3a.15.1752557274619;
        Mon, 14 Jul 2025 22:27:54 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8f24dsm11071535b3a.156.2025.07.14.22.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 22:27:54 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sm8450: Flatten usb controller node
Date: Tue, 15 Jul 2025 10:57:39 +0530
Message-Id: <20250715052739.3831549-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
References: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NyBTYWx0ZWRfX4JVeYGU4z/M/
 L+5W6qK2d4kJmgH9NRAkgA2dVk5PLWK8GWYM8vilRGz/PaDc7/+w7bDwW0SXEFmdHb/JboRREIA
 CuvyviYo5tbsBRf4KR/24Lk1NOWcMhNqTdCRhfIdv8yXN6Q1b146yIyIAdXujAE6EHID2zhXNw1
 yKl+JrjOc+GoeNHf8u4oc2GGJ9iZ4pPJV9hEIPYUJT4JPLvyl55ZuE0N3FV8qsIb9gcy+mtqGOa
 BfXNOAfOiNcMr7m0Xb0HJzycsuOazp7//TVRLIgLNaD+L9ttroq0Iu7/d65n2HhZyCvXd8k2F9K
 bPNly/MyyCHX81PqveiAbjVDnV56oKru1JNVh61lZnonRKZn1aja3DbHID8liV6gIQ5lI658FNX
 r3Jh9r+Qke1EHiz4xv1bB0UVwSyvcxoceN88EjYQV3aBvPUJ6yEXMNhbJe5yx1LldqBFN5H3
X-Proofpoint-GUID: jGquH2_vk2y6kwEKyFuKu9eaN7wn-Hq2
X-Proofpoint-ORIG-GUID: jGquH2_vk2y6kwEKyFuKu9eaN7wn-Hq2
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6875e6dc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xmYAXJzybh8o0rWYL1AA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150047

Flatten usb controller node and update to using latest bindings
and flattened driver approach.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  5 --
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 57 +++++++++----------
 3 files changed, 27 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 2ff40a120aad..0c6aa7ddf432 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1199,11 +1199,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "otg";
-	usb-role-switch;
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index cc1335a07a35..6bd315e10992 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -781,11 +781,8 @@ &uart7 {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "peripheral";
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 54c6d0fdb2af..89dbac3bdd2b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5417,12 +5417,9 @@ opp-202000000 {
 		};
 
 		usb_1: usb@a6f8800 {
-			compatible = "qcom,sm8450-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+			compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -5441,12 +5438,14 @@ usb_1: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -5460,36 +5459,32 @@ usb_1: usb@a6f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x0 0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
+			iommus = <&apps_smmu 0x0 0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+			usb-role-switch;
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_dwc3_hs: endpoint {
-						};
+					usb_1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
-						};
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 					};
 				};
 			};
-- 
2.34.1


