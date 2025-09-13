Return-Path: <linux-arm-msm+bounces-73404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB6B5628A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 20:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3CA5648B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 18:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB2E21ABDC;
	Sat, 13 Sep 2025 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbtb3PUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24862204096
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757787819; cv=none; b=iy7rTd9T9jgg4C8Ug5R0RtBqVyfTsxGdvx+c2bCICnwjHTifmBG9nrf7xTrH3zA0IRVgxcWgUQueyZbyXEolnnRo7fB6xJFEteOQ12c66+WUe6Sz1xl7OP8PT7RpcRNdh5NjggrpUxTL7ivJsXliEqlwlWPRSxRRZvrcVcCD/Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757787819; c=relaxed/simple;
	bh=c85SNrN98xzkEFGsfLQG89TST16+VBIg04yLXeua7vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fyaWlhEdLf2pxJ1liXdHJdlNVLv4XauIOrnAljBM/ZBvQ7fK0fdnRgcJLzOqgxThb8GbyPqby6XvypgGSNRKH6AFTMmMHLoajzsFrqkBx36ktQKqZTxhNb2Mftq2O9WZSFwu7FX6T5m3iM9kPNs4W2LVqRqwK/P3ecns7vYlDD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbtb3PUS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58DF8xJl011338
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 18:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=69OGTGhOBhzOrXczM6Ub+XfVXGJbbFOHs7M
	HnHoDb4k=; b=hbtb3PUSsTRCcEbvbmNWHR2f8meU2eDJIVrz4YvmUWhqHi7Ebfz
	DzepBVy7kI+RQky/+tLD5tIc+3mZP7i2tN0J4fp9JXhIMsKXnQX7r+Cg8I5RSNVN
	8TdqtY2JzNz+TntguW3gTE2afWrLD+n/6xdpR6dm9S2CTcDqDwLej4cskFKmKnCQ
	GaxQOixqKluLvasvcOZw8HTKbQLYsVKc1eWEZZOrOUHUGW+ep1mf7b2xrI3Jm8Yf
	FfiaFlFlBTIn2hHTFVvV70ph3yaNu8K4jqPuLcVJ+0V96NsBnfGUdBVhtrbvTdDg
	SZyjO2IdhoyesCGnLALa5qlhI2b5zAu8Phw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u512vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 18:23:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7722ef6c864so2442469b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 11:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757787810; x=1758392610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69OGTGhOBhzOrXczM6Ub+XfVXGJbbFOHs7MHnHoDb4k=;
        b=jI1lv6S4PJkIdgDjZtkrGEQM09Q0Kx9agRj+ygPEUyphox94p8G4l+KUhqZqkhwRYu
         bgtaQTxqmM+K69kw70699ncEGsH6FX8nof1+iDR4/3hAVQtrcjCRco3eO+P+eI0W/YuJ
         7mQAFX2Bw8xWlSWiMBbSwgR5JyhVCrjKpKW2n4MkX7paY3y+abJ27bKs119U/VgpE22m
         qPh32NBTZtv8EPcneyAlxAlLZSsaR6hPdc3DMPmWAi53Ttu+vvzXZZEFVJ7RLpZfmlug
         OguOVcySjd8GXRUu/BWb35VYaMY9KQ/tGUH0rqLCBBhPP8SnayT9Mxo/xPLRomPfLdtB
         2LbQ==
X-Gm-Message-State: AOJu0YwWyWiEkVZG58AL69J7TrUKm+YqfcShq78iU1+8MtkewajVyZlq
	NwvwkmAnuwbku2vjg6HLOIl2mdRboXW5BdCsm6HAQsK3Y9onRKUH7kFQgPXGzCWsuMYPvgttYYN
	Z3TTuNPD/mJuSrLieYAUi5jVQm0aEntDG8Ts30afsf+nxNbOQKSySB25MhU8aONJLon1t
X-Gm-Gg: ASbGncs50sxuBhWQFyKvYL4Rga6g83bYht7dyt604E2tKeUTGHSZfy6TQFNg8KyAWw8
	Bu67oXpuy54KPypLcVlqBSL3kewzotexswNvgrQD3HEQrwR8ywY8jePsupxsZpUp4bg6tPn4IWp
	5kdHk/Oxyqp/k47ZNDahiLIBlvJh5lNic1ZqdnjO5Bx85Nff/kpyJRMu0B6iYVLYKyd14PHYd/7
	giXsZMyBYxkEpYd7klczBO2wPH7s9DBW0AHXCPHXScx3YfsXpaZ3qlbgaajd4DK96IfEvYio2hJ
	gK/DVl0kGie+ldYFbZHVERyofdAoxTrH6Ucx8ZVUEvg+jWQwj3RlZOl5GiclQzsZ/rAZOZT9tXY
	gFw==
X-Received: by 2002:a05:6a00:1883:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-77612060bc4mr7713160b3a.7.1757787809770;
        Sat, 13 Sep 2025 11:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0GtFVXoogFKyoszBrasvcPM065mYqGCi8oRnvFa3a7Wts3hugxKh50FS+GXifDJ3OxSf4Cg==
X-Received: by 2002:a05:6a00:1883:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-77612060bc4mr7713140b3a.7.1757787809265;
        Sat, 13 Sep 2025 11:23:29 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7769a0cffedsm1972701b3a.39.2025.09.13.11.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 11:23:28 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcs8300: Flatten usb controller nodes
Date: Sat, 13 Sep 2025 23:53:18 +0530
Message-Id: <20250913182318.3547789-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tQ9X4yUgQE1mi8Rs5qxJIwHkbU5QAUHY
X-Proofpoint-ORIG-GUID: tQ9X4yUgQE1mi8Rs5qxJIwHkbU5QAUHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX32Sk4xCiC3hh
 VVaB2jMmB6C/yVw7Da6JVlrk0im09dTvppvlMznB+0Y97gJG9DR4Ma1Uog/CB4dv/x5oWH3Uept
 UXwz9i9JXbbawJUP6fdI26QYZvC/vCD5YkRcNzZYArkwMBKj4pWgEWpqP8qoihN6WB68LeWxjM+
 NG0336JkPaZOrj0QQZwlOgusVqJeWzIv6ZKSrcnGVpjzv9dmfTAPOWDcgLNLH3lp0evC58coG7c
 92hUsNp4z4sMba4d0z2kXwpjAujfPSw61sIu4FnuBQzUBveemaqKwqGBrxAKgKitaSpTAV+x0Bv
 nuxN70qMnSUmw6p3e9kRqWICaVjG6kmLmEytoagvTNAx/V+DLp1ejw3r0DlJi31+y1DW+9uQeIz
 xgQd2A14
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c5b6a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Vg8O3R_S489Qebhi9VEA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-13_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach. Enumeration of ADB has been tested on EVK
Platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   |  6 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 10 +--
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 85 ++++++++++-------------
 3 files changed, 40 insertions(+), 61 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index f3c5d363921e..116378d4ce7a 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -478,11 +478,9 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 9c37a0f5ba25..f8ed510477cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -414,17 +414,13 @@ &usb_qmpphy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "peripheral";
-};
 
-&usb_2 {
 	status = "okay";
 };
 
-&usb_2_dwc3 {
+&usb_2 {
 	dr_mode = "host";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8afd77a2d737..d35bfece60d1 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -4467,9 +4467,9 @@ llcc: system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		usb_1: usb@a6f8800 {
-			compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
-			reg = <0x0 0x0a6f8800 0x0 0x400>;
+		usb_1: usb@a600000 {
+			compatible = "qcom,qcs8300-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -4486,12 +4486,14 @@ usb_1: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -4507,32 +4509,23 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			wakeup-source;
+			iommus = <&apps_smmu 0x80 0x0>;
+			phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			wakeup-source;
 
 			status = "disabled";
-
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x0a600000 0x0 0xe000>;
-				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x80 0x0>;
-				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis_enblslpm_quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
 		};
 
-		usb_2: usb@a4f8800 {
-			compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
-			reg = <0x0 0x0a4f8800 0x0 0x400>;
+		usb_2: usb@a400000 {
+			compatible = "qcom,qcs8300-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a400000 0x0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB20_MASTER_CLK>,
@@ -4549,11 +4542,13 @@ usb_2: usb@a4f8800 {
 					  <&gcc GCC_USB20_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <120000000>;
 
-			interrupts-extended = <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
@@ -4569,32 +4564,22 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			qcom,select-utmi-as-pipe-clk;
-			wakeup-source;
+			iommus = <&apps_smmu 0x20 0x0>;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_2_dwc3: usb@a400000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x0a400000 0x0 0xe000>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+			maximum-speed = "high-speed";
 
-				interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x20 0x0>;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
 
-				phys = <&usb_2_hsphy>;
-				phy-names = "usb2-phy";
-				maximum-speed = "high-speed";
+			qcom,select-utmi-as-pipe-clk;
+			wakeup-source;
 
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-			};
+			status = "disabled";
 		};
 
 		iris: video-codec@aa00000 {
-- 
2.34.1


