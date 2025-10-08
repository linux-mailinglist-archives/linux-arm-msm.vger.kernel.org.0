Return-Path: <linux-arm-msm+bounces-76468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA38BC63A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9CAE84E3970
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF911A2545;
	Wed,  8 Oct 2025 18:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQ+A2mB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FD019755B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946455; cv=none; b=tCyg+lzb9TaxnK0j4WD3xxG5Lu/3f/+PZnAd1GOKpEfuhqWU074ejdqS56axPWZtgKkBk1+UQIwSCpZ7XpJA+3M42hgeODZFJSTrUNXuVPiUfYRnY0Xkz41ggdDJ2yoxRAA1ozBbSz6J4lpMP8xnU4NqxsZyvpIyzemzXOXgPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946455; c=relaxed/simple;
	bh=YR9mVNwRIhtqJCcXjKJLvo3DvwzRIPwXvURQ/PSD4SE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tIvYNz/WiUTdnGVUt4nQPyqJ92wNTTJf1FYUGDkbvzhmTzpzDQl634fALJuqTYzh9bLsQsjAM9rinD5cts0XoMhRF+7W5DIK7onbElF+rw3RPUgR6oCkpt8ii5wdiYNym8Te8nbNaDTf69BVD0ZTlNF6T+i9/t3H4sNYvvs/epQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQ+A2mB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598HB8FU025026
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c6sxwSB2cPbvejOnAz8AKEMGpUCr9YPSYtO
	vfUms1lk=; b=nQ+A2mB+wHvFnuwM7l4cGSUzvquGgGah17EJfkiGkWsyzTQE8vH
	G6p6ex3v3FpGLQLrZCxK4OBqP9fTBbOIDdqxEsedvdzZT1MFyF3Xv17Fe9SaD60r
	oEmbdc97cQftSMbE5hKCFm++IxCX6sfXNE9Dfz0pq8e2ZrsS6+Aqvih1C5+PTAbc
	uaUHfgKG0KVAYKEPARkt/VG+503ybzWvJWPYN6wFSKdyKPBEtQJX3FL5e8+pWOP9
	37D5TCMSEnYcnlPkcm1k0SiTm4TUM6AY1pvjhqC4eZ3IraVml1ip2OCSq+6QpOuv
	7wgpnLhmoIH13MnTWznk987GEP7rPqFs8AQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4n855u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:00:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so244886a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759946452; x=1760551252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6sxwSB2cPbvejOnAz8AKEMGpUCr9YPSYtOvfUms1lk=;
        b=rYh9G37dvNL7BwWacfNKKsKS2y0GwPVgj7zxpLOEg4LeWNomSsUSIV2m9k69lYAplf
         0ItM8rlHV8xPX5PrdvgiuWy/8inbJxinbxTvyXDu3N/Yk9VXhEfP8XP/tyVbifZXk1yE
         aCTRq8ZA2gOvf/AdXBg+K/4ZGBvPoUqPiEv9VBBatVcBVWU1sXk1lzyP+9bKe0fUGlix
         G7hny28f4VXr8spoGIivVNIp839aVf4F6CTlBlJMTgl9GUllI0NUv/cUnd2RzMsW4iz2
         mz64tJo4bfV/KClgN55seHcfbDvOwCB/5B7j+Fsd7eFoi9RaG24eSq0cP3+fymXbvnWx
         AEhQ==
X-Gm-Message-State: AOJu0Yw/JgrDOGz7bWxZD9BL7eFX3MCkiyeiNHctqZJinJK2ODupGZGk
	aKe1hRw8Es4RR7KgsxY+Ca3o97drIaXyj/4dZ7ZAeLCstCuQF9R6Us842kfgMyLepBW8lCT4qwy
	sRdtZf6Xo7TaxoUD0opOOB+pYzUfTZKzbXdenpPZeZRBK+Eq4GRfhzCdO2NPCG4sGX9Ce
X-Gm-Gg: ASbGncsMT4qLJX5xmo7a+7RbgtePdhA6k9VwqjipB4oK2x6QRN0DX0jT3nn1WAmatG+
	WvA6pcmgmPi5044dp9vSA3eqo2w9wrRDAKvfRMPkJg2J2ugx+cSp+9aJjp6EkvQbfOXh/1kTNFM
	XZ75ljq3y51aRtOQ8VcWygojVuSpdMnI5ObBUMRc9v0Ul+Vx/Bxi3jYRMZC94FkIGoSiQVcwFQZ
	b9lwVCWnGFpSNoXDD1BACL+tTEtI3hJcqiGhnfgf5nRfazgXTJej3TQSIB5rHGjrKjdwP++44aO
	jm8wj0Ck14h95wd14YJBtvi/yI66V7Ei5Hh4mdR3DkZiHJwm/8Gzy8B/1HwEGNUZ3BAdiLKQJqx
	7Yvfc/WU=
X-Received: by 2002:a17:90b:3ecb:b0:335:228c:6f24 with SMTP id 98e67ed59e1d1-33b5139a113mr5381592a91.25.1759946451804;
        Wed, 08 Oct 2025 11:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtuXmE9bvl4iiQJELyPDjtYw8XUq6GY/62FUo81mMJCEIxBEhIN1phf3ar7Toth9ysScmE0Q==
X-Received: by 2002:a17:90b:3ecb:b0:335:228c:6f24 with SMTP id 98e67ed59e1d1-33b5139a113mr5381544a91.25.1759946451257;
        Wed, 08 Oct 2025 11:00:51 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5137dea8sm4137586a91.13.2025.10.08.11.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:00:50 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
Date: Wed,  8 Oct 2025 23:30:36 +0530
Message-Id: <20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e6a6d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SErXUjo2BbdcLd6G0UgA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: amRrliHdFPgrEnuiD34hnpYNV_cm9mgf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8PwcVTP4ExsT
 ju+F5tPBarGHBnnhLkCg0Ozb6EXfWHThpIWyZ7riGkUJ63mHqKnL3xFaxjLGffJPa1/HtcJyr1V
 fcyIzEiqYzZMU+V2b402fq69+7gJUx9+Me3dt3r2ccrI7pty0el//Zhnfp57qvNoN++U0uv2FTJ
 AqjZ1DWwXBsJ3A4p1sb+lYD9uW7JJhVAOtRVhgs+EGCFA+HYnweDHxn4p5W3h0ft2hp48JRZV4v
 64VfZKGW2FW3W/KiIgDh2b0lJPLGlpZA9YDuziJn/0GOOltvxGZd/0uaU/qMjMgk36gjM8L8xTG
 ExeWWl/dWCbxjAh2E9LNtm8QQ9t3R2N5iuGxLygkGPTaXQleHIniSriEstrdEXQ5XEyqXPi7eDS
 4cGirOsrbBaVOVtdaMhsU2PmNZ73/g==
X-Proofpoint-GUID: amRrliHdFPgrEnuiD34hnpYNV_cm9mgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Enable OTG support for primary USB controller on EVK Platform. Add
HD3SS3220 Type-C port controller present between Type-C port and SoC
that provides role switch notifications to controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
Removed redundant property of dr_mode setting.
Added power-role property in connector node.

Link to driver and bindings:
https://lore.kernel.org/all/20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f4457..e06da1682f35 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -37,6 +37,33 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector0 {
+		compatible = "usb-c-connector";
+		label = "USB0-Type-C";
+		data-role = "dual";
+		power-role = "dual";
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
@@ -101,6 +128,15 @@ platform {
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
 
@@ -453,6 +489,55 @@ &gpi_dma2 {
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
+		vbus-supply = <&vbus_supply_regulator_0>;
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
+					remote-endpoint = <&usb3_role_switch>;
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
@@ -751,9 +849,31 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	dr_mode = "peripheral";
+	usb-role-switch;
 
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
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+
+	};
 };
 
 &usb_0_hsphy {
-- 
2.34.1


