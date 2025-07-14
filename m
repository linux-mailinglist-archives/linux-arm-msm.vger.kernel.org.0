Return-Path: <linux-arm-msm+bounces-64744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1070B03561
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB84B178679
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 04:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AFA20C004;
	Mon, 14 Jul 2025 04:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsgihV6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5175229B21
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752468815; cv=none; b=A6/QB74NWUQZyppU0hhxWJAsI1pww6P2g8Niy9P+94Yy4xy7HxRCMoH/aRdrNuC1SJllCrcf4C8bMxz4Pr0gf7fXvMWdqTQJYFG0jt4KZUlDD+yQ6uOuyJOUlasa7NG4AYokSmjAiPxS7cSI+j4DTBpgenm2YarCGg0U5bnvhKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752468815; c=relaxed/simple;
	bh=NmP+z2gJhCckmjfrrn6o5QQ2wttiVpsior0DP9i+DfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4L7xfE/XQ9jLMPcJeysdgEO3vySAqlAKT2mhVfUKRufM8Roc4jG3B+wIYxnLEPGcoyhqLx0nUlR+8ifyo0lBC6nVBHfpwh7iiH5BourpuNAJjSei8hIeaDV3HPG+ZnKDn1324v41b/Q5nQhFsZxtuSlM5SsACpV3aRjxsINmKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsgihV6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLSi9H018876
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u43++Fr6U58
	TyPcHVzc+ZU40XgfyA9QmeiVTvprQmbs=; b=HsgihV6RAnsZpdrY+WGkb+qQfo9
	Tooe25XcGGqmmJjakZkRZLvfGlS2/bPeom8UzZ2N5guCena/tUcD4drHsmETEXL7
	/i7eQ2K2ffiWmc1U7DwVZSdu98a9t8j0c8JNOLcreRVy6bny0tzZ5HlCYgn4tgQ4
	LYN56ZGDe+l9ViIUPnV8IDFKaJe+4Gy+QA5BojhGyC2JzrYKL2GOIHeap4OUYKdy
	cZUaq2g124pCHFjk6L56DMemJxasyvt/GG6nPgQZTOw5Ly2BaFte4REkw8gXSnUv
	lFG4qMh00FM75HZRWNhzHt9VEmf0WcXNnx/0xx1MQ9AdKxEsVhBNvVMpwCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmb944-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:53:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23692793178so35742785ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 21:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752468811; x=1753073611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u43++Fr6U58TyPcHVzc+ZU40XgfyA9QmeiVTvprQmbs=;
        b=vt71PdMfUlI6WBxHP+vi548FqMQJlnOsU9io215Y6XsXTTJ40Io7ZvWSRdTwVPwB8J
         +jbhwEu4jZ0I8Ka5ETji8wmpPhNIcHh/8chM42ekHGJTk5z1Ol6+1OllqaGsp5L72pvz
         YIAvhPfs6NvY+E2yjLf50JuqJ/ZaqC2ORVxhzLPac6g9RdMiAqtJPCWtsijvrOwiQGwC
         HmgYGMwjVnQL4ufpkRAJDEfoksALrlpyJr1tG0Zz2e3UboEJVquI4VtKanHZH5jMLU7p
         +WwENycfkEwTwHlDpT8cdKNQ3CEI8CULxEzgqEjGlyCAvoxga22YQzlyX9FupoD5Nfwg
         UyYw==
X-Forwarded-Encrypted: i=1; AJvYcCXH7SzNENOePvjHfSnjSQssW5MfAEeSwV8jhau7teYk4BEIaEUw7lA9Q6kSnlBIS7iPcZi2uFU6/0idEtNx@vger.kernel.org
X-Gm-Message-State: AOJu0YyWZDoFb4fkx54KuxnEkntifQXcHcCGwnBKsTUWaolumwbfZ0cq
	jFbuzhY3VmwtHr5Mon/INkuvDVA4A1uH2UUiFKQm1J6o8YidaKVFMJNoQxhpP+LrjlpyLlZMyDa
	w+UOvW+qBTpYramKNfrIBxMQd3XLcp3ZnCJ7pdIC3BXvWGGWVxPNtg+3MYIuS4kjnGhgy
X-Gm-Gg: ASbGncsfkYMAFowayyjy27J4Aa24TeodCrFbGbyhWYsHVMu8h7sg7eOlBlx1ojP2a51
	nqIHqymkqQxI/V4C+eZ1iPIHIHVDaY+zaYiW7BvVF5bWfdDhWj9RCDo6AWsWkEjlFrxeGnqLsNh
	iZRUwR3pU9HKtVLzZiXXdTP4KWz/SnXEj2Xa3eJf4vExWVIH/GMmN3RgnfHNBkaZdAAZCCVFRr0
	KsY1NwAGIrZb7GezVgaQqt1jB+M/xnsxcn4yKb8rkSjZkX7ur8KVHTaqLnPhQL7IM+sDvzpczXx
	nN/zMphRqTFRnGd+k2TdxDSpyeQPg3dPf817BAhkYeJ5NaLMy+ZQGhHXl1Ocuz1e625Fa3d28fH
	B6A==
X-Received: by 2002:a17:902:db0f:b0:236:7050:74af with SMTP id d9443c01a7336-23dede2eba2mr163384055ad.9.1752468811366;
        Sun, 13 Jul 2025 21:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6EU8TSHV5uuBurO9qW84gRt/Y6qmDB6VzkjDqa3YDrOiAXIDj4JW8F75hHUYBybfWtcVO5g==
X-Received: by 2002:a17:902:db0f:b0:236:7050:74af with SMTP id d9443c01a7336-23dede2eba2mr163383785ad.9.1752468810933;
        Sun, 13 Jul 2025 21:53:30 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42864a8sm85664325ad.42.2025.07.13.21.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 21:53:30 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8450: Flatten usb controller node
Date: Mon, 14 Jul 2025 10:23:10 +0530
Message-Id: <20250714045310.2092385-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714045310.2092385-1-krishna.kurapati@oss.qualcomm.com>
References: <20250714045310.2092385-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=68748d4c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xmYAXJzybh8o0rWYL1AA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ZqOQ9tEDWZTBibmtYtrJpnZ4McAXnqR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAyNiBTYWx0ZWRfXyFO1MgsPMtv2
 AcmZiO1FIibIyKhDo56XTn2vzqpx2UBxtN+7r7dOGhfTIBZ8k/Ekb67/x3JVGDiEbcmHIm1cQkm
 517ai6kIb6F5uIVz27if/gZwLYRccZcvqVX8ti6z+0CpPBi1/QQl/bQW+vODblAp9lryeoqENvP
 qJmUZ03KNDCJIpAEnu4lo1MHZrpcOVND7u/+DxMgmwGPgnAGz47NZE1kCUg/6xb3mIPuTQmU8cE
 Df9Vk3Tw4WQ9pSGv5ZUZBw9lhQgQQc+xqYC3lvdzDGUVXXBPuBszlL7T/GKLBpoPVkkRf5Hr8ak
 rCaGaKh9AKvVVH88Tfv4itm4DcVcQc0XiecwdA+hQIh8b4/TrNVLLQ/XB1/lOfmh6eLxJKKbl+u
 23x6UdPQpFreKxaJ+Wd3w4skASRCQ9NTfW9SUrxSWmqqJy9sanvzeZETfBp0my51Sbse0NXT
X-Proofpoint-GUID: ZqOQ9tEDWZTBibmtYtrJpnZ4McAXnqR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140026

Flatten usb controller node and update to using latest bindings
and flattened driver approach.

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
index 54c6d0fdb2af..77104def5ced 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5417,12 +5417,9 @@ opp-202000000 {
 		};
 
 		usb_1: usb@a6f8800 {
-			compatible = "qcom,sm8450-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+			compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0x10000>;
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


