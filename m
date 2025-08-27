Return-Path: <linux-arm-msm+bounces-71016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D4B38377
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 15:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CEB16836C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 13:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0EB350D7A;
	Wed, 27 Aug 2025 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhY4Qw17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72017353364
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756300366; cv=none; b=o6QHTExw/cc3qclyd4p9o/PzmS1WM0zr4U+E5nK+ILnsNQOHY56oX7bHALT44RuyQOV6fsEcfkzJpjWL5l5tvuVahx+ASknrvAg6tDlYpfll7UJbiIFpqPPKK9y2mCi+paZ6SdJDXrioFdv8qJ33XbTWBtcKwVTKKz7v39YO12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756300366; c=relaxed/simple;
	bh=lkEkNI6U5UMNHhspuDTyPj/+zirteVHnTk56Di9FfME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhpe24fSV8p8r8OLDz1/laA711yc6dfecNg3rxGqyGG5nwtTWiCsHiRoAONK/PiDUGWoJE5TRb8m3qlmia9XnDsgozyt0kjc3HAIAFZZaT92C+Pi6xu3DFZJ4ETnsTUOd0sBEjVGO4h2Hqzy3/efcHj1vWpltwTu72ElvQz3GTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhY4Qw17; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kHXB015950
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bl2TJs4T4ux1GQlk8A5Nbj4tfsZuZ244zRVaui58pQM=; b=JhY4Qw17s+bMt+L7
	sZhWvqrCeNWST8IP2HDJa9j9I70zvQC4aQxCYgmFv5pNw4AHTKON/mBR1m8QVHUc
	YhjVVvnfsk1LtKyuvIKHep/wbk/DJxOqRaFk8kElGIPbZN3ZBb4n67IIV7CYokDt
	//i0k2Jq+IE5XFXRkRcl+sTvVqA6+abEqpm/1vtrF6yLXsIj61rp6n5M2T+Dforh
	gMAj2PHf28NZsWwI1zQ+atxUmoBJNr2tyObsdIFnScmLzkwiYD0S/lLYWem6hdtA
	LzTCPLXxx99Q0xqCYqj2oivLTkErj9JUAf715yfdE3WkSZqlgYTHOE+TMqenzsNk
	5kjFew==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpey1rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7704769dbb0so4053828b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 06:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300362; x=1756905162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl2TJs4T4ux1GQlk8A5Nbj4tfsZuZ244zRVaui58pQM=;
        b=SWHxpqWe02/sKKqNE9GH3G/KBgxKSSSjUjZ/J02b2R+xGfHkUu+8Jxbbt33Y6akrOC
         FXCGgPiQcYdbPITDeSOuWEf3pb5Q/4TX2fv1fGoo0pD9HTBszHv9IxKTFZbLA1n9TWbR
         ui0L6lDZ6ZB/nVnu8fIHQ40SI3yz3AyoQA5Xv2ID2Hg1NjPibuHKUHN52iPuRwNcSY5X
         tm/V5vz3eg/6O5Y6b50Fkev7ap3rW3PQif1u5pxnDO6odQV5LSOySEuedZWv7+v/BM/f
         L6Z+qb40Dai3L2/aII/jFBHwDI+c4PHurrTDPG3DRgEl8HgOV+ck0Hu0pryNyt430DBy
         8bzg==
X-Gm-Message-State: AOJu0YwZEYYxsPNCkCUmThiDKGldeDeQ3tEZzuWB9Nboq4qjXgvVbMfq
	3aEl7AZ7dCXVYAyImasM72GcI9u6eoG/0e1UBrUOQwGNCXJBy1cOqVIqZr0qKRMDSFXT3Yn/Iac
	LRkZgs5j8NxK3lGaiBcxmI4dZwxOT4vpoWWfEEW2Sg0xVtqHN/ARFFvlitzhTnrvYxom8692B2s
	KxB3o=
X-Gm-Gg: ASbGncuo5fZ4kw3moiwz86GPqlApadTjGHDd31YTOQZQzgpWX+XoLVuvHPvufZlnZ+2
	rpbDjBvzXEw05Z42R7PC9WYk4DWvlmw7N0gCdwji1dup9QTaSwJYiLmSOhQUpDSMmE6DC4IMc70
	2jMjC14H6uz7pIdTDvyOC1jBJ9aBUuTTO2K/tAWqwN32aDqZahiB7Zq7tgaCcx5Gxh2vSMYqGl1
	Mk2G77gmUyL6N4Ll83ozIiYTOFcv8C5wZxFopxrvcmC+A7AqHMoQggA15khKxzAmZ6X2fm8xSXG
	OgJyl8PZjmKHUITIrJLgEWvTnnqo3+NYwd+Gcau1a9DpMM2hkIa4uFlSnRlemhA0VJ+KjBAk+nz
	1su+WXC+ygv221Wa32gRUBQyzLKGq1uuDj2xemwvWQFoeCbUuqeUWzgaN
X-Received: by 2002:a05:6a20:939e:b0:21a:e751:e048 with SMTP id adf61e73a8af0-24340d7bb9emr27246342637.35.1756300361751;
        Wed, 27 Aug 2025 06:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKv0SxiOk8HOhjqipABcYHZo/NM6n3Rzp99dkCa0YkacESHFFYUFbAP41DOIrGC4Tn3dm1tw==
X-Received: by 2002:a05:6a20:939e:b0:21a:e751:e048 with SMTP id adf61e73a8af0-24340d7bb9emr27246287637.35.1756300361246;
        Wed, 27 Aug 2025 06:12:41 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbba615csm11432972a12.44.2025.08.27.06.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:12:40 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 21:08:39 +0800
Subject: [PATCH v7 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-add-display-support-for-qcs615-platform-v7-2-917c3de8f9ca@oss.qualcomm.com>
References: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
In-Reply-To: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xiangxu.yin@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Li Liu <li.liu@oss.qualcomm.com>,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756300349; l=4229;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=0A09/X7LZ/FPKuEalGbQvn6eLOGaYhze9r/cZSPB9CE=;
 b=UjWhjMIjhsB4/ZoMtsO6oPaI14B3iw7RmRmQ1GfzI23d4kAQbu3yu9diD0pxQZGJmrtjf7ZhJ
 JL25beEd5OZB3p6trsGHDfi+YU1F5j0tIppIwymtjWfA3Zh3bPYEywP
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-GUID: TTWT_UgNzCSWQ4PfLDQztp64XGoZGkZ2
X-Proofpoint-ORIG-GUID: TTWT_UgNzCSWQ4PfLDQztp64XGoZGkZ2
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68af044b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=M5YQ4GC9HTMohWAA_GoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX8dwtuH8BN9UH
 DPWrBxxx8XCKcaWUA6c/VvICeLySYrs230TrZvN9jcUbLLVmMWzl/h5ztlxrNVHdb8QzPCN6kiw
 5Gk42AmPLsXbo5R8lwyKwXKMsHi7sbZISQQmF8jxSQpiGAWOMjW9jjVHDzmdy6R+dgJA4jL5NXG
 OW/wltVh4K91wjfniJ3DoWLfbTSy8aBfAnv/nV0QvFkFcfkJsI7XkzZ75/qAVFSelDiV2QhMQkC
 pCn8CbXk1xvlQiQUpLIPgeEpvl4yEerR72X8w8yh3iesDsPq/bgM5qqMOLCrRg8eSELCsHfcYAJ
 f51mlJPo/smDDR5u3fPbhZ/4wN3syRvSVOQmXmlNM2tbTHn086LCK9wOLuAWobONCzcOAzHXYIA
 2/2Q5FuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

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
index e663343df75d59481786192cde647017a83c4191..f6e0c82cf85459d8989332497ded8b6ea3670c76 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -39,6 +39,76 @@ xo_board_clk: xo-board-clk {
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
+	vreg_12p0: vreg-12p0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_12P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vreg_5p0: vreg-5p0-regulator {
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
+	vreg_1p8: vreg-1p8-regulator {
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
+	vreg_1p0: vreg-1p0-regulator {
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
+	vreg_3p0: vreg-3p0-regulator {
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
 	vreg_conn_1p8: regulator-conn-1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
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


