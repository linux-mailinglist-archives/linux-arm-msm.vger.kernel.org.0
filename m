Return-Path: <linux-arm-msm+bounces-78758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7199C07BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 20:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD750427CF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 18:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354272638B2;
	Fri, 24 Oct 2025 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiIxXjrI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B312AE90
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761330112; cv=none; b=PdeKDGFDevOLnZF8vzCxOUCclTnLdikESCImNk1oUkFiSbZtxL69uE3U45FxQDTT/TALXEI+VIbY4IO6OkdAY2o4stxU1So+tg8DwxJ/7pGbyXscAR59UuFJH371j0UXYtlYKU7Vmy4krR5i15Lxn1I16SK3g/ymaQXxaDwUQH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761330112; c=relaxed/simple;
	bh=7yw31bKvWUXdvacjCgGUN3ci8Wb+0zbHalVNF1rBPcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dhPJ0BJQuiLwean7oU2TeXSRZcMeC9XIj5JJzmOi1kzgMjw2E2QqRyruShu+/SISrtXFrrOPaJtBHK9Uj+TBWBfQmJzdY7YKrwTeFeH3fsN2EsViDaYHr4TJkhibyzPACtR8oIcwsB3JWeAyrazAf51/hJVgoJV36ncIe998RKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiIxXjrI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9YK0019216
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 18:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NYTo5MWdhu8itDq1/g3Rc83Xox23JPr1moP
	RAN/6mts=; b=IiIxXjrIgUrUI8rZ3VlKwK8BsUnMoIPJx8Xp+sF/GNeCTWbmk09
	Y45EzylHKaoZ7cIqGM2RsdTlnCDSxmcpPopZNa6wGgaHVclUP0Rid07x7aPbs7Xx
	v+F65OFqSYBLxonE+Xgqu+8X+WmGHM310Pt3er0V4gJIDl6wdbjQUvP7Ix91O2CT
	Fo/i/LgiNBwRwjqJiGdTVMxuouDUAJfiGK/a8cEY2YHCV2Br1/m1Y8kmh4pL4DOV
	GFpKMB4+ujkJvp7B2/F0TT1XKOoECnXu/N+/fs8P10U5S/Vzx/sVEKa/SoR8pXXX
	a50PQmoAT3DrS54/6SGgP3xPnMxKI098KhA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsjgjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 18:21:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b60992e3b27so1728512a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 11:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761330107; x=1761934907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYTo5MWdhu8itDq1/g3Rc83Xox23JPr1moPRAN/6mts=;
        b=L0chuOgnFnyYl/Ce+U0QtuXqBI6zutKdnmaxTd4kHpviGC9Aq4wZmSZhQNyG9Q2q83
         2JcHbJu/JttPUOsxICMvnjKKmDIhy0zn9Uprr/Iywtme0+EMnNGbnEzJHclhW0kLrjmW
         2MhDgte2GamjowNLWEhTrgYkUZFZop1cfmVWXLWvA4o5iJnqYHiEodk1N5qvR7l8/LN1
         423I+R1RyMXJNMIjDGNhe0V63o166iBlfg88g1zyed8UeoYAnFZcT90TXWr6bvofykCU
         SuW9w7LRIXvb32o+brRnTA8WEDj6Qooe20gpMCTw0dfAjxyH0Foft4al5VXyuKubXMmr
         hZ2Q==
X-Gm-Message-State: AOJu0Yw2CSvxoXzaHt2p+Krzf79YgdYOQSd6DkW3a2fJrjbRVaMidfqW
	uNwcgwOJ9Zeq40mMdKIZI0PkVSnyDYPjGg3u/OKZVny7/CjKUiu19Ue5Rz3GQWw9ddGuMafqJAT
	BuNsCpLzZ2TanThs88tCBpj2gJikQRKB6NFqNgzgJ4UmNOaKK1MVPpxnB0LUXSTOD2wvl
X-Gm-Gg: ASbGncuJoRUWYmxikVUU51Rnh57EhGUC2mSdheSW/OG/Dfg6dQ4JEkq3f3y4aL4E30l
	AnVjVLc49078tjIk8xVAlOibh8R73SVeLZfSWFHqPQnsHMFOsehVqFFyiiQtQeYyyKK1t3P45Yp
	FJHhkV5kPNWttliiIg+BALm2AU4j+ZmzzVhsjkXWsOUNK64qPmHOuVswYSfGh+TD/wP7SBWjqgn
	DSoR9pC+Wg7R6YZ6U1HHF7Psx69Mvr8VRZkVASg2omQXyb7kBKgc9xt4ZODm837pjr/jxmzt+Us
	4JkpPWERks7/HWGbT9lcBj2HT3qiKJ1wqJckP0eYnbahggt0NA8VlP1prHPudPrqdhSQRuaRPC4
	VDkKpq+008Xf6prJ8RaKAk2asIZ2vpVmjw3Xp
X-Received: by 2002:a05:6a20:258a:b0:340:cc06:94ef with SMTP id adf61e73a8af0-340cc069898mr876514637.56.1761330107030;
        Fri, 24 Oct 2025 11:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEByz0nyj2zcoNef7NunU6xkWZY16Ha1VVUMQcY0WT/uHuWevE8eC1lu5R2c6w/pwEuqUNT+A==
X-Received: by 2002:a05:6a20:258a:b0:340:cc06:94ef with SMTP id adf61e73a8af0-340cc069898mr876490637.56.1761330106550;
        Fri, 24 Oct 2025 11:21:46 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01724a5sm6501423a91.15.2025.10.24.11.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:21:46 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
Date: Fri, 24 Oct 2025 23:51:38 +0530
Message-Id: <20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX3cByY7M7tXFF
 IlT3aE9zfEkcaS2EwowYYaucv2QXB9cAebx9zf+5DLoVGF8rnRnrZ8l3uLV5Vu5M9Av4bcjN5WS
 xfVUhoEBpb/Mdu2uzDVKMO/xJlVct7Vuc42UnVgDPk6olEKKy44gb1R/JEyVzxiKUxzuEOuJU8i
 waMdeNuiqUbzFrT+e7AMhOLQqPXPR5mZ3T49IEDFJvZOGg6RGoiImHkmWNXRuxbN7tZy6v/6PxP
 jRa49BhEqOsmYhNMCwnRvH42HawGYUyVzwmww3I1ySdhMbXcOKx5IxOfhgtqilkd0bQKFXVlgsP
 bmROhY7B1qaAh5jChZ7hYhoY+BB4KUgExiFfAFPDcxhi5MCHZ0XSxORU76ptKPur5IIwwwqEIJc
 X2De3H7ChHkd1wKpFOieCdo093p4Zg==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fbc3bc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZnWjciNKi5aIwXxU4VsA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: G2lSiDyANcytOnL6sroJm5QKPthRXj7d
X-Proofpoint-ORIG-GUID: G2lSiDyANcytOnL6sroJm5QKPthRXj7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Enable OTG support for primary USB controller on EVK Platform. Add
HD3SS3220 Type-C port controller present between Type-C port and SoC
that provides role switch notifications to controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v3:
- Moved "usb-role-switch" to lemans dtsi file
- Moved vbus supply to connector node

Link to v3 bindings and driver support:
https://lore.kernel.org/all/20251024181832.2744502-1-krishna.kurapati@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi    |   1 +
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f4457..2baad2612b16 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -37,6 +37,35 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector0 {
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
+					remote-endpoint = <&usb3_hs_ep>;
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
@@ -101,6 +130,15 @@ platform {
 		};
 	};
 
+	vbus_supply_regulator_0: vbus-supply-regulator-0 {
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
 
@@ -453,6 +491,53 @@ &gpi_dma2 {
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
+					remote-endpoint = <&usb3_ss_ep>;
+				};
+			};
+		};
+	};
+};
+
 &i2c18 {
 	status = "okay";
 
@@ -718,11 +803,24 @@ wake-pins {
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
@@ -751,9 +849,29 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	dr_mode = "peripheral";
-
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb3_hs_ep: endpoint {
+				remote-endpoint = <&usb0_con_hs_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb3_ss_ep: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+
+	};
 };
 
 &usb_0_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186ed..f624d8d4aa9d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3970,6 +3970,7 @@ usb_0: usb@a600000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
 			status = "disabled";
 		};
 
-- 
2.34.1


