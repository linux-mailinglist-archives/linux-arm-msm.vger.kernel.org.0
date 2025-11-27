Return-Path: <linux-arm-msm+bounces-83533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB255C8D218
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 61F67342C6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7265931618C;
	Thu, 27 Nov 2025 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XezIBG9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i89laIdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C290A2D948A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228948; cv=none; b=qlGVs9zMRgy0Xg44hpWMnW/i9X4wAMZYvuGt95QDTL+kRTxsANBPUkHPhwAnFEBTm+RUGaGo5MK0l+JoA9RdQHP6Dlhvs1obrQj2Gcvx1KoVTZNCZs2J6DTKi+6EiLABX8CMosj2aXqkziGpsOl5aAh8t+ast/buiGapLo2LWM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228948; c=relaxed/simple;
	bh=VAQT0LKqi93k2ex6EIEn7ry/hIYSY47+X+BGI4Y+xHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QgefOT6/8wwxVhhlWrEpE+9co82lFUZIzDqCV3jgs9/SOQ9sNXvQpON/NazKl3Z9l+H+DupQkEJ2FKlze1Olm0uHi+qF4R54UapBbSRDtKEAce+ok/+88cXYp2fDFFLbTL+0L45WumJ5Uz6I5fLpKwR3bnC0eX3WgB6iC6WT8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XezIBG9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i89laIdY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQMbAJq1668535
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lO+6/peemys2XSn+Gg8STvP5a+BQOzlHPDO
	acrun3nY=; b=XezIBG9ddmEGkM7vDo/fB97Dxi2xQ5qsVesHAOlMCp0wz17vowC
	H8vcKW8KftIYAv6KHQXcYZkTl+uSHAaIwZUi7toO9hBysbpHE8z/BPq0Cu/egvEt
	g5PbXkFBikiDIrjKnEyAyKGcoKl0ktheUWSggOa1VCAgOZ91Q6OnGVFNsUkeaZsr
	qDUVH1IzoUVb5geZAjNcuFOglUEE6i0/G82CckfcYPKT8whAG294sZiWz4ytFoW1
	KuWvUu7rATpP8YROoDslU7smktVX5EUJxjF7oojMVPjgnWy2m4QyA1Dxl+dcd93z
	nxcv3lolvamRK6b0319Ue49XxcHHRxQQThg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmtwtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:35:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343725e6243so1158045a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 23:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764228945; x=1764833745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO+6/peemys2XSn+Gg8STvP5a+BQOzlHPDOacrun3nY=;
        b=i89laIdYnD3lP14+dLY3cRJ9EZ/xJEitFccm9AoXJb+b61BqIUXUHttdVXvG/3walS
         bVn+1U8BHHpPUPyUYjuzbQ09V3XvID0fqA7hupRZ0mtqLeVeyzMjb8NU2BY7SIhhUm80
         LiVQ0299banfvy/B8b11pyAmEd1xA+eSKb7zyA6jhf0UUAdCLaBGtl9178RVTxY6nwks
         CmlX/o5nMaC6UsBag35VY0t5ymvvRY46M3nvC7O8Tb8+jb01ht5B6KkZ9luP9vb6nmGf
         xJ5mqyl7oq4KuATYAC8lG6KO1W2hzNIjClnftGo93+DhI4xuOccVHGut21/QzBuRHLXp
         6Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764228945; x=1764833745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO+6/peemys2XSn+Gg8STvP5a+BQOzlHPDOacrun3nY=;
        b=IfyWYOgMEvSxeS9i6cAWAise+tdx0VJiO13c46qqnZhTsJStGCDE28WbZ2g+Jotp10
         G2k5vtkjfr7BSDSwab/QXJM6iPCvX1Hu140S1oz2lsAK5WGhXNiWgpj+KJZjEFI3r0Mw
         k4xHhYAXT8YXPOohZycV0ULpBDY4Rqvax9e9GqO9bRQHpantNcjXvmiKUD+t0Vzdo7Ll
         CPqd50q1aJ6WyC0vRZHZHncT+wgI6/IQFACf96WIpHEnaJVu2gDPdK5regMnBiBgdfrQ
         S9Eg9IEaOUDVR5t/eNP2VgVrgyo/oxwdGe6Hlvv14k0OIOV6Wjzw/MU+xTLeePz6n29N
         xwuw==
X-Gm-Message-State: AOJu0Yw3/3Kw4ZgRCdpFE84mHZf/JtD6iPdOhGnZeWb1LBBchZ4Qz95p
	8J4ihbbl8zsDzXFvduqhnkIkBK6HUe31Z18pUDT7FRlJ05zYOc0I41aEFgnaH4rTfikLsB96Mh1
	wiD72cK80Ggz4GSkY/84SxuWEHNiC00BsINrAKRQVOfz93Vci5IM+rJZQp61hNFfoGRzZ
X-Gm-Gg: ASbGncuELvSxrXbOSM62OevamCbVd96GmjEekau6nAMpDzolBfTCiVZ9qf6+46bUnz/
	XJ6eMG7mHwWcKPOFhHGI/pnTZBaxjimkIkqvuZcj+K1mSc59khbevlil7u2SIve3DfFmDtuIcIS
	HZq112kg7/dNq2R22Qhw7Vnbaq3AzVJ4uq2QYjf3H0bZwHk0d1PZ/yY7TaXq2BdsBa66bzgMbLM
	MWF8szV4yFRR8SkToDDzhgWKn6Sste+T9zLaBstvCvNs2Q99+HyNQywgF95W24VMJ9NqBsWwXEe
	4ok1RmP7Zt1Q0/y7XSgEEmYzZpSifWZveRrkRhkzU2z8wf2MIWGETowF4T5k/uTxSTpdJvS6IGB
	jxs0p0A50UiZXxsZe3NmIlhIjWukkt9N9CT28pBWvrwpnXIY=
X-Received: by 2002:a17:90b:3a84:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-347298aa082mr24838729a91.10.1764228945134;
        Wed, 26 Nov 2025 23:35:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAXzlrCv5f8x4ZabgTa2ME2EOQu4Cn9Vsq7gaRrVn0HzvtJB3DlM5GkaW/CEgLGt4sKGXFjg==
X-Received: by 2002:a17:90b:3a84:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-347298aa082mr24838706a91.10.1764228944656;
        Wed, 26 Nov 2025 23:35:44 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b1cbdc0sm909568a91.2.2025.11.26.23.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:35:44 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v6] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
Date: Thu, 27 Nov 2025 13:05:37 +0530
Message-Id: <20251127073537.1218832-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=6927ff51 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QAzQKOYyiUK49Y4y4FoA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1MyBTYWx0ZWRfX8tkX+exKbM3X
 WwcUA90k8UakuzWFsyh0g0w3NX7itMNP8OjYCgv8Y9ndajdOLfN5zgIkIzsZPB8oDHThIgG+cmn
 haZcx14EhoizEmXM9AEoKklqstDtgZmxFC7QSqFF3oBgCIL/GnFgKAQWdOUGH2g9D+4FZygkLlq
 F0GrlISJosw+FtA74kUUNCaJ0VFlhqHSPCjdy4FRcu0CGrgSKd1ANHgcib1d4DGGXD8K4YhAK9u
 QfYt8zO05RRNITu8zk5XgVEXeA0wzO5g7ts7y6GWHkR3AeFvgqaI8zb2FvzbfGXVHOto0cXNvfB
 DDiHJi4U39ea41TA2ZGbsTZwzAZS+9PSKN8arkZH40n2VfVSim5mDwq0e8JfmCSyFL/pNV1fVPE
 FoRr7DMZQairyXEf/Hn34pNDD3c4AA==
X-Proofpoint-GUID: hyV5eM4SnMCnvaRPADvGOzeeEH2tbwCO
X-Proofpoint-ORIG-GUID: hyV5eM4SnMCnvaRPADvGOzeeEH2tbwCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270053

Enable OTG support for primary USB controller on EVK Platform. Add
HD3SS3220 Type-C port controller present between Type-C port and SoC
that provides role switch notifications to controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v6:
- Renamed remote endpoints in controller node

Link to v5:
https://lore.kernel.org/all/20251125110420.2192971-1-krishna.kurapati@oss.qualcomm.com/

Changes in v5:
- Re-organised pmic gpio node to maintain alphanumeric order

Link to v4:
https://lore.kernel.org/all/20251102165126.2799143-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved remote endpoints to SoC file.
- Renamed vbus regulator name.
- Moved usb-role-swich property to SoC file.

Link to v3:
https://lore.kernel.org/all/20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved "usb-role-switch" to lemans dtsi file
- Moved vbus supply to connector node

Link to v2:
https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Removed redundant property of dr_mode setting.
- Added power-role property in connector node.

Link to v1:
https://lore.kernel.org/all/20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 108 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  20 +++++
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2..f4a8f853e0ca 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -38,6 +38,35 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector-0 {
+		compatible = "usb-c-connector";
+		label = "USB0-Type-C";
+		data-role = "dual";
+		power-role = "dual";
+
+		vbus-supply = <&vbus_supply_regulator_0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb0_con_hs_ep: endpoint {
+					remote-endpoint = <&usb_0_dwc3_hs>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+
+				usb0_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_in_ep>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -102,6 +131,15 @@ platform {
 		};
 	};
 
+	vbus_supply_regulator_0: regulator-vbus-supply-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_0";
+		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -454,6 +492,43 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&i2c11 {
+	status = "okay";
+
+	hd3ss3220@67 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x67>;
+
+		interrupts-extended = <&pmm8654au_2_gpios 5 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_id>, <&usb0_intr_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&usb0_con_ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&usb_0_dwc3_ss>;
+				};
+			};
+		};
+	};
+};
+
 &i2c18 {
 	status = "okay";
 
@@ -607,6 +682,16 @@ &pmm8654au_0_pon_resin {
 	status = "okay";
 };
 
+&pmm8654au_2_gpios {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio5";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
@@ -746,11 +831,24 @@ wake-pins {
 		};
 	};
 
+	qup_i2c11_default: qup-i2c11-state {
+		pins = "gpio48", "gpio49";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	sd_cd: sd-cd-state {
 		pins = "gpio36";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb_id: usb-id-state {
+		pins = "gpio50";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {
@@ -779,11 +877,17 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb0_con_hs_ep>;
+};
+
+&usb_0_dwc3_ss {
+	remote-endpoint = <&hd3ss3220_out_ep>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l7a>;
 	vdda18-supply = <&vreg_l6c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..bf869c5b5ee0 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4026,7 +4026,27 @@ usb_0: usb@a600000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_dwc3_ss: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1: usb@a800000 {
-- 
2.34.1


