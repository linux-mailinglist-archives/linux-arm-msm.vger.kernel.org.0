Return-Path: <linux-arm-msm+bounces-74830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE3B9CDEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C6EC3A56DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D445242D60;
	Thu, 25 Sep 2025 00:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GovzYKaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166C238D52
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759480; cv=none; b=b46uUpAhGuZFJZs+K8DxD+iTB6XEXZ6u7AfwA93LWIN19H9MET1yylnld4FJ4Gunc8GHkp/fgkc2Zz75IuEcD+1gltk+LVcuhxy95CGx2s7CbB4E6M/vY6rdf6eI9UjNHLq6iAZt0eoCttrw5qnJWDsjoG3FfuCbqFvlINvGfkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759480; c=relaxed/simple;
	bh=VDzly53SDuTAHMC7/2I0M+eOxP17EOOl6x1Fp8oWlGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqG9DUXhf4B7Nwa9hPVOvqb+IIZiC2OzwHCibBNcjwtC3SlD4OPIw5yQLqD/UCswkqIECGxP0KqWWuWgzyYcr3aHRIIX2Abo/RNJ/gPOdgYuMU1sIBUht2Pa+3XuWeUZ9x66jEPDQ/nSasxRlEP/OOTWsGaOLrT5BurRAJBv9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GovzYKaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODxWZ1002255
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iR7GsZwcHkUWCuzbnsb6/yQxC71N1K+CsxsKdlTAYAw=; b=GovzYKaF+6pdo3AQ
	OfFWAYbEr41aDJe7s2o9UjfwyA/DrIFHIbPwkS/nB8qlDIa3DvkH3VPrMQ2L3SHL
	xqtCX7UcW1qetSlycXhFNaKGLIOCgKY6lp+c7hrSAPqTIyX/exj9Qrbn2I8t/4C2
	QaMi0V0A9iDmrUrbnUQdV6ObzEDvuhRElHvSlbx12ZbHYOAsk2JNxCYt3nSj2zvO
	8cEbimMMUhY1/nr5Pi9WG0x9fijM+ShEy1z7w4z9M1t2qYerZnTD/812EqVlKjBd
	2t2eb6foPut6T+xTpE6c9tk64nv4dzZd6W2Urn45FXkMFZdirzktmLB0Fw/4hcPD
	ZvD+7w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p5fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so342485b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759475; x=1759364275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR7GsZwcHkUWCuzbnsb6/yQxC71N1K+CsxsKdlTAYAw=;
        b=Jv6ve6ocRKpay9h8TOY5XsuskjzIchd24pieaKXdOpGl4FW0hg+L6VkVxXyt68EZnT
         3n40GwU932P1k/9bE4Os3MEtGJ0mRs83kT2Qo+RFEci9URUc10o6/pJwc6ab41e42kG/
         2SYQV1/9oz603aYpnQzDiZawx8QTBu1M2Kx5urAFvWzF6GhQV4GPJ3xB7bgqwX6zMjJO
         h5fbw1SW42cx/Bpv1YBrZy4xg4Vzk9Em+XHlXX+kt35iL2XvyHRcbvbOvHLizMSMcIL9
         s2IO+pma13M+mZ9jc/BfNIVA94fMvMW7PcDbPTXwgcIXozv5TNwYLUopfCXfAkntBKKP
         WVjg==
X-Gm-Message-State: AOJu0YxPPf7Zz6NC3kxY3du0HJNypZjVJzFcSgf5PlTZUWvh/Po4iyCJ
	2h7dn35KyD5m+xmcjTQ3lt8g9c6D5QyeOBF5tuGmRxqdH+3yUE1Iqjx0C1MHo6+wyBMOGg/mW3G
	5z68WZD6iRE83sxq1cyYAHYEvtOJfnJYP+w3pg4XzewDHpfrYlGiLr0WM+1P8jxgJRXYA
X-Gm-Gg: ASbGncs+fYqqApkNzPrTqhzQAlJsgr/7k8BxGMeIpIFD/5fhmqXx7zj9a54otIAxzIT
	OozEF/6Vxy2WV3haxxiDYLW04AFQ2d6+HFT8QSYC/wa3ls+YHfIiMVOqEVi1z5H7+dFKnkl/8m9
	6bSSc+oNnZMVGIYRf5Z4+guthsQK1xB55BwlLtrYUNOAnr/p3q0O75ahOevIrn1lY6zGpy0NKV1
	jCdnTXV8bpo0lO2r7iCM0QHWxLhiC0i4/oOW34MApdyodIHjT8g2/2EdpF7t3ljUEWAL5UHj9e9
	xRtBLaNRtbDuy/djbMgO5FZumMIX58Ys1z9/VDzuZNy3QqVBf9Xqkid18neHwyGv4r8Fcs761B5
	gHlOEUr1IfalC8So=
X-Received: by 2002:a05:6a00:240d:b0:76e:885a:c32c with SMTP id d2e1a72fcca58-780fceda55bmr1786827b3a.26.1758759474783;
        Wed, 24 Sep 2025 17:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgYquhbzxeP69jabqUkNaxZcKifXxz3CEdAi2zm818sIhbhfLD8GiGCFVHJJfO40BdRv4UUg==
X-Received: by 2002:a05:6a00:240d:b0:76e:885a:c32c with SMTP id d2e1a72fcca58-780fceda55bmr1786797b3a.26.1758759474257;
        Wed, 24 Sep 2025 17:17:54 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:35 -0700
Subject: [PATCH 18/20] arm64: dts: qcom: kaanapali-mtp: Add audio support
 (WSA8845, WCD9395, DMIC)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
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
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=7373;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Jk0ioazJjN/fBNtwPRm9/IP0u4zYTxU6hdpNqQs+ijI=;
 b=BfDjFeKmuTSn2yC3RXvC+3XAwbcuc0aYZWiQaunavX+LDc7zFF4gDw7ozo8l2Ltw/rqgpkkhR
 pmauHn6CsZxD4ljjSmu9UkZh8FrHs/7yxHIh1USkL8xOYTND1yxeS+u
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: jLRbMNVHLSpAP-cw1nHOUl_IVVus5sAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX2zswBrfgaLRy
 w2PBP4DLiXZkCjCVN6ZWuZsvowl/5+xeGnkXEYqmPx752k71VxOvPVxoESyg3odi0wNCcvOOZM0
 EvqtfevEQzYcBb019RxF1qZf2rrGe/AmpLWRGeQ3WpFYPMi22mCwSHvRo2LnsOJFDaPYhlrZms4
 WPLBhNt9BZrEH547O7hpdsj/RA0coS9Vqfez12MV5pSFfxrqVL+GBqJNCsHivEUAqhqvlVHI1xK
 7uLJyHVjEG7rnnsH3VHkpOPHxkXhXBRE4i5iGazGHIK09JWyLzhlvJ54WibyLqkRfxRWoLm+fmj
 WO4yTckFedNHpDLIRnDKAbx1qgznQtROqT2MHfdjfCKYMSdn6nkRgGjSGfTyLr9YgUpktaw22U4
 6bhaw/pE
X-Proofpoint-ORIG-GUID: jLRbMNVHLSpAP-cw1nHOUl_IVVus5sAE
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d48a34 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZN7uiJcRf5jCIa_5M7EA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add support for audio on the Kaanapali MTP platform by introducing device
tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
microphone for capture, and sound card routing. The WCD9395 codec is add
to supply MIC-BIAS, for enabling onboard microphone capture.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 8d1b3278389e..759414b87146 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -84,6 +84,87 @@ key-volume-up {
 		};
 	};
 
+	sound {
+		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
+		model = "Kaanapali-MTP";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS1",
+				"VA DMIC1", "MIC BIAS1",
+				"VA DMIC2", "MIC BIAS3",
+				"VA DMIC3", "MIC BIAS3",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd939x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			codec {
+				sound-dai = <&wcd939x 1>, <&swr2 0>, <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&north_spkr>, <&south_spkr>, <&swr0 0>,
+					    <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	thermal-zones {
 		pmh0101-thermal {
 			polling-delay-passive = <100>;
@@ -304,6 +385,34 @@ trip1 {
 		};
 	};
 
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
+							  500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+		vdd-px-supply = <&vreg_l1g_1p2>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -987,6 +1096,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pmh0110_d_e0 {
 	status = "okay";
 };
@@ -1164,6 +1281,94 @@ led@3 {
 	};
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Speaker North */
+	north_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_0_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker South */
+	south_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9395 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
+		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
+		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
+		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
+		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
+		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9395 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9395 TX Port 1 (ADC1,2,3,4)         <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 2 (ADC3,4 & DMIC0,1)   <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3 (TX SWR_INPUT 4,5,6,7)
+		 * WCD9395 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4 (TX SWR_INPUT 8,9,10,11)
+		 */
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
 &tlmm {
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
@@ -1178,6 +1383,20 @@ sw_ctrl_default: sw-ctrl-default-state {
 		bias-pull-down;
 	};
 
+	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio101";
 		function = "gpio";
@@ -1207,6 +1426,13 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &pcie0 {

-- 
2.25.1


