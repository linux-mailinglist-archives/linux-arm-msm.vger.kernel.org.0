Return-Path: <linux-arm-msm+bounces-71902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D0B424CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 117BC584EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BAE33A00B;
	Wed,  3 Sep 2025 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHxNAu8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168063376B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912469; cv=none; b=BLs2oqYBdspmI/NaO2arO/lcHImEpnw2YwFCecGJacVkTObHgOrFfxS2jcVRsyHCo8UTImJSQhJNozG1mCjVP+pfNZ+37iDXoxivPhKSGcctYVM+SpR9Udggf6+okEoagXhbsb3Z5UXUl8BljLN3ZkhAMLYhLXS5009dufGbbs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912469; c=relaxed/simple;
	bh=XGTNYwAh6SUrB3hie3zBaTpEKXaEKPaK3M5NlU6AlnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zr3rS4NkLum4Mk4iQ3fRPZl3gk+lPLM9I87BSlnLbqd4vszKwowgjoPR/bhWl0Kl70ZSeEn/Ary212WCXpon9eW3lpWmqiVjzYZeUjM2JKYgqnAphxjZ7+s++zisK4eRtQvI2FoiyyxFQK5/5PoEAG5QzqT5GQDdQkcWc0HoObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHxNAu8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx1w8005455
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=28LYAYTs7dV
	FHgNtO4RYYE1fJnduC9OmiapRYB4psmA=; b=PHxNAu8LsILWQJhrLo20lxAZp1o
	LhVf8CSlZ7ri2baVjkVQ2v0/EGkiPADOOxJx+X/+a32zXQG59xAwuJEx/0TlPmop
	sTx+iOdIYX6+/3OxLFB+1NVQT98mbwsW2dol4S5ZfYIggfoSVUsyjnpyB5MTD6lF
	++6JfyR5hA9u9LIXc3xvtR1huzyW7IaBXd3mwCHsBQDxk2yYOGbA7B6txs2GsT39
	W+pj7oeWpVOdAEpwfG5/sLYaBHPHwBRdX5hdbxm/0UzjPyRebqcvghtJRcISImWN
	Sv12dEek4xNXDdQFJL9Q+88b4qj3QgKY5Zt6kY5JH4WJ7EeFwmXRn82n7CQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjm3ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:14:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-249118cb74cso691745ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912466; x=1757517266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28LYAYTs7dVFHgNtO4RYYE1fJnduC9OmiapRYB4psmA=;
        b=BgHxnLJhAr8qd8fXRM5vSe18ppS75sm4bR5Vo67mL0gJYfc4XJkAK8G8WCR/ANIXDq
         0iyT1EHgaUqlqO1aXend6mUNPA7KCc6FzHIvDu8KyhGTO4KIyNWZ+gNbVGgkAVSpo/uA
         ETQrvy8ew98gwlGw3vGOb8U8i0sFXneUxOrzx4Xcnc5s15STOlulIjldRm8PBj3gqttx
         cFKO2qDVpSgtTAfHoyZjjYC10sp5enTPmQRnO6FMFU3xG6J8S+QbdXD4MXpe1ax3ZXpR
         Ys/UNm0IugfAWJwbu3sil4924X5wNUhI6iC4C1Ldt2tBY2bYo/TnYj/zSn8GUJRhCHDo
         kBWA==
X-Forwarded-Encrypted: i=1; AJvYcCUnv33Q8yHE9/OvEWq+4NGZAcZYstHrPZUzrRkZ4D0Bo329sDU7jtWRigrweoar75256ckSvB7MaTVGpgoh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4O/nK+V2fM7M1QlelS/THfFmc6mPtWzhihtytlSzmLzjR6H7i
	enpq0h9EJMSEXS+/Eq/mKbuEWf+t3SQfj+hSnu3EUG/vLOGFRVPvXPohNHNQMW6+Ciu6VKQ7cfg
	et3PrGlf4yuRrEqJ6lN7+/LcV00QKrL8fXdafskyrv7FmD8V41USKazfW34yOf7D4UhOj
X-Gm-Gg: ASbGncuAsOzBFaJ6LEuAZ4Blga1G0ecW5hS7Qy0yEsNmykIAtI7u7PYiXs6lK66AML1
	K/rmFRlXPeT1iDL61gY/sJq3659B0JGolXPuLBWU/vUBkBFhGJAlceHoPIgJ/wnSVCNyuhCWe/c
	Tg0k6L496devcHzEESoRV/VLXNm8SHbcFfyye4JzwLriOotjTdnB8ZdAPBi26wxiAMrJg0ldRDG
	QFMLsUuW0aE0EzJxFDhFdip2VDcwISvsaSdH3Rc1eAOx0YBTGWA2a90tFYAV9IorY0a2EmmW1+s
	/bCdVm9AqKzgXMMNpMdYbtiEtgbDs9rm7UnhT+3hSA7vrmFa/Fi8B360FbBUF89A+IWDK5TO0rP
	M
X-Received: by 2002:a17:902:d543:b0:246:4077:456f with SMTP id d9443c01a7336-24944b35030mr192538175ad.58.1756912465687;
        Wed, 03 Sep 2025 08:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/jVXL55CUd5wuHJqnQAV4G/lWQy8YP2hW4F8a8GQCBf1WAC6F++wnzcYIk4FTLBQKKG5eIg==
X-Received: by 2002:a17:902:d543:b0:246:4077:456f with SMTP id d9443c01a7336-24944b35030mr192537735ad.58.1756912465087;
        Wed, 03 Sep 2025 08:14:25 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:24 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v9 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
Date: Wed,  3 Sep 2025 20:43:36 +0530
Message-Id: <20250903151337.1037246-8-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b85b53 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=U1-NlgUr8jZUk8VuFV4A:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w60k3984K2hXuEN2Vk2OdTRp2wujIDCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX+niTv60M6rPo
 8vwuXVShgqj8V2fRsZGgccDGCPjKeuZXRtfPIXLey7aW4Ua8JC6FeOVHDYrBERBAqIPH02POgp7
 xmvpHxtOtE1+wSNiupgV6C3KGhT/aPc4q9iT9yUr+A803ieR11yHLm3xgaBaJ5kuIXomyR+lR8g
 Rh+GDHuuAezYNlEu3xVlV/SDXUgfqjqJbY76GRifA9FCDge913owqMFOkYJLuRtaIKDfX5j5WiH
 pUZq8ikMNTE8Lf3zDChObZtvt0VmjRuWFj3GOfDHJqmANmeahWez++bvyUxr67V5h5xj1vkj6aN
 +UPLp/fXC+ajqIvU/sSgjyDP5EcqtnryqnajgftU2apW8o/CEiPS/YKhaTJ1qNM4Sp73QvuYkgx
 3ZUgtyJz
X-Proofpoint-ORIG-GUID: w60k3984K2hXuEN2Vk2OdTRp2wujIDCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Add nodes for WSA8830 speakers and WCD9370 headset codec
on qcm6490-idp board and enable lpass macros along with
audio support pin controls.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 123 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     |  12 +++
 2 files changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 8ed6e28b0c29..379ee346a33a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -18,6 +18,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
@@ -169,6 +170,30 @@ vph_pwr: vph-pwr-regulator {
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
+
+	wcd9370: audio-codec-0 {
+		compatible = "qcom,wcd9370-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+
+		vdd-buck-supply = <&vreg_l17b_1p7>;
+		vdd-rxtx-supply = <&vreg_l18b_1p8>;
+		vdd-px-supply = <&vreg_l18b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob_3p296>;
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+
+		#sound-dai-cells = <1>;
+	};
 };
 
 &apps_rsc {
@@ -536,6 +561,22 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
+&lpass_va_macro {
+	status = "okay";
+};
+
+&lpass_wsa_macro {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -716,6 +757,81 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&swr0 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+		 * WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
+		 * WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+		 * WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
+		 * WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+
+		/*
+		 * Static channels mapping between slave and master rx port channels.
+		 * In the order of slave port channels, which is
+		 * hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
+		 */
+		qcom,rx-channel-mapping = /bits/ 8 <1 2 1 1 2 1 1 2>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	wcd937x_tx: codec@0,3 {
+		compatible = "sdw20217010a00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
+		 * WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
+		 * WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
+		 * WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
+		 */
+		qcom,tx-port-mapping = <1 1 2 3>;
+
+		/*
+		 * Static channel mapping between slave and master tx port channels.
+		 * In the order of slave port channels which is adc1, adc2, adc3,
+		 * mic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
+		 */
+		qcom,tx-channel-mapping = /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	left_spkr: speaker@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		powerdown-gpios = <&tlmm 63 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <1 2 3 7>;
+	};
+
+	right_spkr: speaker@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		powerdown-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <4 5 6 8>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
@@ -725,6 +841,13 @@ sd_cd: sd-cd-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart5 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5b78d111b2f2..4ac909214a86 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3029,21 +3029,33 @@ lpass_dmic23_data: dmic23-data-state {
 			lpass_rx_swr_clk: rx-swr-clk-state {
 				pins = "gpio3";
 				function = "swr_rx_clk";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-disable;
 			};
 
 			lpass_rx_swr_data: rx-swr-data-state {
 				pins = "gpio4", "gpio5";
 				function = "swr_rx_data";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-bus-hold;
 			};
 
 			lpass_tx_swr_clk: tx-swr-clk-state {
 				pins = "gpio0";
 				function = "swr_tx_clk";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-disable;
 			};
 
 			lpass_tx_swr_data: tx-swr-data-state {
 				pins = "gpio1", "gpio2", "gpio14";
 				function = "swr_tx_data";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-bus-hold;
 			};
 
 			lpass_wsa_swr_clk: wsa-swr-clk-state {
-- 
2.34.1


