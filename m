Return-Path: <linux-arm-msm+bounces-56071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13229AA0719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27E6A1B615B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62502BE7D7;
	Tue, 29 Apr 2025 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IrryLzM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20512BE0F7;
	Tue, 29 Apr 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918699; cv=none; b=ix6fIowZ2eePIW2xN48kBJQX6ffoi1pyX0oTKSNSrfwuSLEbelvhWJA0dS54HQ4EMcSxOhzikl0tk0lt27Ir75ZjIEyaig5sO+b8DhRGYeKaNt544UYUgnbMC1XlVpESQYeIQcTqscM2jSZiCHzmo6BYdPfD/rGFjRa0kDKm/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918699; c=relaxed/simple;
	bh=g6b0UiU1Yr1LIpZ8iSsgdl9s/e9l585BeZPUdautnVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AUrspmIcR0xfMB8FORe4rdNW15cfd0VdmzYFjiYnotuhndoXbnxXiHWepWY4rQ9e/ylBQdRi+gi8Zs/tbrbWDSe7m/dmeW4frQxZMn4QdgOz0Aj0pgSq6ajLVRey35U3L0WUzW22M60OdC+G+BvVaVNM3ono+euZy1KQiyf1gQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IrryLzM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqOHa015471;
	Tue, 29 Apr 2025 09:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=afBM2sWFlSw/p24Y0btWDnTuLTabXgYU7WYKb4/WA1Q=; b=Ir
	ryLzM6/Ek7XteRf7qoj6JGw9p0qFfZsB2+q4NRx67H/4RietxiapqI1l6kM2wC28
	c0KitRhbV5eW3m70e0r3//ze9Q92RSOyiS9Gr9xr6j2abT0EIg+FLknifS0dG3lo
	yO2I+1YtPIs3A9/Ynd4Tzkv5kvqcPB3S5rp9ec5UVDbP+YUdDdi8rO8ZsMq1cxMH
	zJbcfQ8Dn5AvAnP/SA/i7Tcm58gmOTI85V6/8mdKimDvDpsx9UDWt+MakFnOhbWc
	1BjyZ4L3as3IjqorPohDgRt+hZWzuy3Ccl+yQZrVMLCHOCf98KUpKO31t53UOBej
	mb4wzB9GFydKPCfHqHGw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8htx4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9OmXk031634;
	Tue, 29 Apr 2025 09:24:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 468rjmhb3v-1;
	Tue, 29 Apr 2025 09:24:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T9OmCa031674;
	Tue, 29 Apr 2025 09:24:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53T9Om7J031659;
	Tue, 29 Apr 2025 09:24:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id A0308604547; Tue, 29 Apr 2025 14:54:46 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v2 6/7] arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
Date: Tue, 29 Apr 2025 14:54:29 +0530
Message-Id: <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z97-j7Cqb7jxxRwG9a6VXxwqYFQ0z74l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2OSBTYWx0ZWRfX6ztghCBQJysz waqRMKwlWBIMuOBJ8Azmyke14L+5nkH0dWJPTt3oTzEHBzj518Nr3jCamCd6QrbLkg9qcHQjMAq TNZ/a8vRJtzSBc0n+x54FjMgCKjm5fozcPFGNp62wsR64+fQ/aem88HYrKRYP4TLzm8i+3nhOfN
 br2K/TK6pZxq7exNAVL6oNHopl444pA16FyjOLc+HnY5/zKJ85auZwt+56AtPCrDTc3FA2IPVmB 9cQnXwSs4Z17Xv2guQyWr4ZaFUNdFIrqmsCRRufGt41fVrgggR+/5ciTAZ1cIDbEjpPLbByHpdE YROff0rvym/dgnKhfLlHkviyZs9RVXqUxjVZv2UKOxbXNfuoNeDebBHeOKjzidli68UuFD9WzAY
 IyibJ3sWi7Cgmk0QESURCK9zV4yYVwfmYa3eoTzht1zIDZrCqTMVCj4B58GV8Um9DDEsLwwT
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=68109ae4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=ki5966V2wckrMalOmGkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: z97-j7Cqb7jxxRwG9a6VXxwqYFQ0z74l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add nodes for WSA8830 speakers and WCD9370 headset codec
on qcm6490-idp board.

Enable lpass macros along with audio support pin controls.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 162 +++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e..1a59080cbfaf 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -18,6 +18,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
@@ -169,6 +170,30 @@
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
+
+	wcd9370: audio-codec-0 {
+		compatible = "qcom,wcd9370-codec";
+
+		pinctrl-0 = <&wcd_reset_n>;
+		pinctrl-1 = <&wcd_reset_n_sleep>;
+		pinctrl-names = "default", "sleep";
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
+
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+
+		#sound-dai-cells = <1>;
+	};
 };
 
 &apps_rsc {
@@ -536,6 +561,76 @@
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&lpass_dmic01_clk {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&lpass_dmic01_data {
+	bias-pull-down;
+};
+
+&lpass_dmic23_clk {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&lpass_dmic23_data {
+	bias-pull-down;
+};
+
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_rx_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_rx_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
+&lpass_tx_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_tx_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
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
+&lpass_wsa_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_wsa_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
+};
+
 &mdss {
 	status = "okay";
 };
@@ -716,6 +811,54 @@
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&swr0 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
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
+		qcom,tx-port-mapping = <1 1 2 3>;
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
@@ -725,6 +868,25 @@
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	sw_ctrl: sw-ctrl-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	wcd_reset_n: wcd-reset-n-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <8>;
+	};
+
+	wcd_reset_n_sleep: wcd-reset-n-sleep-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
 };
 
 &uart5 {
-- 
2.17.1


