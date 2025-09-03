Return-Path: <linux-arm-msm+bounces-71804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA7B41C56
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C68756045D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8AD2FB63B;
	Wed,  3 Sep 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4sxe+Xq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687C22FB618
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896731; cv=none; b=PYvWg63hpom25+731iYUZ+7wFfi1OFYZtvsD1xpd0A63XZ8AyV3A07hLNY5ndJDJ6HvRculDOo3jPUIoDjhDs1Hfyg87RZLB1b2heHzWLVdgKeKCitnyihJ8CIfTadIlnEhScdCHP066dx3lsS0RgmcGIblGe+1ng9VE7PbGp64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896731; c=relaxed/simple;
	bh=adWF80ugC+EDwBzUUBDcIfxbXVrvKhBukeq7yh/1elw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJsRbdjQBH53S7lNbSj4ScatAE2ShxBsIbXwDN3py3YPyvpGML3IlVhPTI4fDhgUp1v+PvDGrAf+NdqVzlP/u2vFbZOWCd3yoenjlkXXkbfHIWD8dROgsITDG/DigEIhg+u1adGkaD38Z7S2+YziWu3bszjpg217BZq5FyBcqyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4sxe+Xq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839dTK5025285
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 10:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgbAUrFTyrgVN9+6rZcIArY1i8eYje+6+RRRMcTrAp0=; b=m4sxe+XqGgzcxtYP
	r3r8dOEH9MCtAYG6fzVtmqzniViOv6HqMjhnvyWqoEX7NcJaLftjmSuExc+kmeQc
	ru/rjVW+akG5hgI295q9dHM22Y0LUMKscLKQob0yxFLAl8QmS2mMa93AcKyTa+qZ
	7SVV6HujbFWA9G8gsed5n6CwDOS1UDk37VCg6h4we76QxZVZt6PB1pbouYqrB0jQ
	iqfWQXtEJysNWylwZZvnCFf3bn8eDSoAKm0KnnIl+e0ej8V83YkRxAnCp/qRE/iV
	KngysCVksSIAe2g/ccbbb6vFgwBRPe3KAQy9iyxzwBj94jwBV3bOveDuWKFC5gvD
	4wVJhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv3g0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 10:52:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329e0a8337bso2454843a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 03:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896727; x=1757501527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgbAUrFTyrgVN9+6rZcIArY1i8eYje+6+RRRMcTrAp0=;
        b=L09jMjXLrbRLHNr7LJjCwumGWRcrKE164eui4Fi0IzZf8azgLViIQkgn+rdPmNqH88
         BssF//0qrmIu/u44LKYNx3RLU04uEyWkYM4p1LpyCUZUMUA8AqTP5QWSQbpWr3iEcJj7
         g32uMT2rd69XZMXj/DBAAOGVGlkYLbfM2EWOzkITBgOjRYpwYXVhCFmXhSumA+u+hauR
         8xJNmSLDPTE/bODz9ygWY/LWNI/zf3ugPszequd71ZOhbkXdUiZbo8TMNZXbs0b5g0JZ
         TviGdkUn9keBG/Acl/K7rAeMThpiFTWvZDTYGv3QHs/xLvQ3e8c381ouT7Pige3IE5bc
         jVdQ==
X-Gm-Message-State: AOJu0YzNB24/o2WEqslcK52IG1qCopTwrkO+QJcJC8uoDUq7/aRf0oTQ
	sBF4v67+Sthlw+DMcK1Bv0B72oEjOtIcOBz1U8Ow6ZKqvgLvRHF9SdvhBD7swN6yA293koAOdAX
	POIDoq0CDd+pb7lVIZ7t1OC8yMeAWddYcDZt4iXipsBcbuHnEBVtrJxq1UwIL8sMJQuhX
X-Gm-Gg: ASbGnculPLR6somJIuOWxHtYOojRLqPPeAiKe19/kUq8/o++oM8/hu6w+Pv9ScuP0Hd
	fusFeC07CaOhsqRn/O63vfuAr143cn6IVEf64vCeRetJlnKXT05XYmvYJPYk/FtqhbMOLJt8z7F
	m2Yu+jcfzvfWuvz8Dl5h/d1n8YQ3UwRgkSFgAGKtBTAyje36TpnwuAx448nVhnPZZ3xdQ1f1trf
	EL2gzK5Zzyk+VJlnWneOUhbsZvhxHhofOGCTvfkixIF/xYQ5YtpwsgleqggOKFsZApw9/6Syih4
	Vy2OkXbcAVYVfpRAPSSoPB6mCwxQ+1d9NCiiQ+r6eC94eogq7ckU6MNWGswyDldMyxYV4y41Y1h
	y+cmh3dIwU/Vtu9bCVkUSRklk9hNc02sRWcj52LP1Z360FieBummJ+Z26
X-Received: by 2002:a17:90b:5865:b0:328:a89:3dc8 with SMTP id 98e67ed59e1d1-3281543cc5emr19254876a91.14.1756896726636;
        Wed, 03 Sep 2025 03:52:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGvYlX8gAE+JcTZy031VmBvW4sOHPDohNqWmfr51tBQxFnmGCZiWsm2Od1jnlZ0X3zRBcHw==
X-Received: by 2002:a17:90b:5865:b0:328:a89:3dc8 with SMTP id 98e67ed59e1d1-3281543cc5emr19254825a91.14.1756896725994;
        Wed, 03 Sep 2025 03:52:05 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e3a6720asm4856888a91.11.2025.09.03.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:52:05 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 18:49:29 +0800
Subject: [PATCH v8 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-add-display-support-for-qcs615-platform-v8-2-7971c05d1262@oss.qualcomm.com>
References: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
In-Reply-To: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>,
        Fange Zhang <fange.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756896714; l=4362;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=iioqO7Yy62GZNJa0hLNm5uNqstxqzn757DeXBVJ7XU4=;
 b=UYL982xrh2KbMh0Uyj5T1eMaCvghDY9q0URqUzRenLwApB4Hhk4i16F1DE/0fdr9BkUbzC8ag
 HHmLio/93f3ANtqCBNi8SgIvsqQbxF/LVO2FjnNl/kzxla/q71SvoVR
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXz9uLThSACZYi
 BNfhwGZMUjg2ExKSz4M+GwEs9ZjvMKD6OCL4EVZUDE0H/hlHSiCrEuk9mPn4cQX1miI6JbyPzRc
 +XUqc3DzjntaKhXhlMHzUwZTovuXis/Skn7FRREmibf8y5+5CcS4XER2/wzIVpLWnwdNHR7CGdv
 db9IVQAVzbYYhI1gZ5QCha8Z/gaq5+pnnLe4KfvFiQZUkhrcDcmCE7d94eNIXwvBIVByIJX8xJZ
 954yGG6PsU+Egy0eMGcQ9nkS0x+FgDlFnc60MHJUC3qo9C2/TwnBc19gBAF8WMuQNfeavc4xMGp
 LdT5EZJFH3cdOsEQkHZjo/FDJDDjKUORdElZm6ZD6pWRfdea09ZW4xHR4h8V+sRq/rWr1MjorM3
 fmtzCybE
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b81dd8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M5YQ4GC9HTMohWAA_GoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ncn6tcqTL0-kmwhrDG0B7-B4iHRi3xqF
X-Proofpoint-GUID: Ncn6tcqTL0-kmwhrDG0B7-B4iHRi3xqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

From: Li Liu <li.liu@oss.qualcomm.com>

Add display MDSS and DSI configuration for QCS615 RIDE board.
QCS615 has a DP port, and DP support will be added in a later patch.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 150 +++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index e663343df75d59481786192cde647017a83c4191..00f85e58c941f59335a4e53fcacd6779eaaf00c1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -39,6 +39,18 @@ xo_board_clk: xo-board-clk {
 		};
 	};
 
+	dp-dsi0-connector {
+		compatible = "dp-connector";
+		label = "DSI0";
+		type = "mini";
+
+		port {
+			dp_dsi0_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_bridge_out>;
+			};
+		};
+	};
+
 	vreg_conn_1p8: regulator-conn-1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
@@ -65,6 +77,64 @@ regulator-usb2-vbus {
 		regulator-always-on;
 	};
 
+	vreg_12p0: regulator-vreg-12p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_12P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vreg_1p0: regulator-vreg-1p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+
+		vin-supply = <&vreg_1p8>;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_5p0>;
+	};
+
+	vreg_3p0: regulator-vreg-3p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		vin-supply = <&vreg_12p0>;
+	};
+
+	vreg_5p0: regulator-vreg-5p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_5P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vreg_12p0>;
+	};
+
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
@@ -288,6 +358,86 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	io_expander: pinctrl@3e {
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		interrupts-extended = <&tlmm 58 IRQ_TYPE_EDGE_FALLING>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		semtech,probe-reset;
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9542";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupts-extended = <&io_expander 0 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+				vdd10-supply = <&vreg_1p0>;
+				vdd18-supply = <&vreg_1p8>;
+				vdd33-supply = <&vreg_3p0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dsi2dp_bridge_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dsi2dp_bridge_out: endpoint {
+							remote-endpoint = <&dp_dsi0_connector_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&dsi2dp_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;

-- 
2.34.1


