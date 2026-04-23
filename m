Return-Path: <linux-arm-msm+bounces-104214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAxlKBDM6WkKkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:36:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5644E06F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00C6130D3FCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AC31D5151;
	Thu, 23 Apr 2026 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzyykY1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11E2989B7;
	Thu, 23 Apr 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928809; cv=none; b=ssVeYHTg7eqKdnbiYMAuqNYaYi8XLX6bL1yctQfPiHgHRrU/47OlETGEnYZZAh9Hnv5I8SlJmdFHgzquH0hrRxlz12vSwUkHoaqZ3vdRurnWgyAyo3VjbGmIK1OeYKPLDXJibkrIEdAna2xXxfvup2FBNqJ4cK/FTuSlXm3Lstw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928809; c=relaxed/simple;
	bh=0a9LBK7XKxAl1nomvJckSRI8P9oMmFGWdkfgNGcjzyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ms5oo5WYFOQ61PVQl4dTnKv7OqAGfPllvOCzg0fGE+w+nzMK1k80dEFmFhIB7kb4yF7z1+VikhcWj3VZ6kqpNs8PxdamKguKeqlF4XnmXsp+3g9UPJI7gYHcCHHQTSU6GLip2krsCCB+9sXzNJ71nFTb+EgPVW9GQQ/g8NtdDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzyykY1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3WVQX1230210;
	Thu, 23 Apr 2026 07:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gsgLa9CHtVk5xYSb0Unn/JwLaEhbKByUNwK
	LLNoUbaU=; b=MzyykY1GEv0qUC9T2ExeQHnS/+XDOyT042c8vvPTIDjsoYe/JkG
	p/lJjbDOEQehRUZiyC6oHPPsowHvJD2EyR1FrwLv9CQ41j5AyVmJpjjORH+jxEww
	Hwq38f2Jxo7QapMmbCS9odlziWZoGX8GKEqJo/1BxYiafBdsocU+0BE9hIL3TTMa
	cnPCV8jPrLcx5jhITwm9cmgThrZIZmn9VcssfvoT/jYjbJr9wl4P9LuBsBZdoL1E
	6XMVE+h05rK2fCIjZU4P8zfCWG38DziSD/x8QOJiHwSNnV9cqjkzcraKUCnlBIj1
	7XQ70XvF/hX4BdO9dREnxhZtHY8OdN1R2Fg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6apx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 07:20:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N7JutS010271;
	Thu, 23 Apr 2026 07:19:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31k0mm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 07:19:56 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N7JuUQ010264;
	Thu, 23 Apr 2026 07:19:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N7JudB010263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 07:19:56 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 38292638; Thu, 23 Apr 2026 12:49:55 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset playback and record for qcs6490-rb3gen2 industrial mezzanine
Date: Thu, 23 Apr 2026 12:49:51 +0530
Message-Id: <20260423071951.3181130-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e9c820 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=6f7Mzj8uGuO-krZabgcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2NyBTYWx0ZWRfX3L3OP1aHhfVW
 X/lMcwl8KWVTN6tYP4SOav120qDBoWEFnezpEFQmtrdR/PM+FzGVTn7uTod7oRf8OemoYYt9SKC
 VsdCJqlEnAbyUPBFwAlMhreE7OrXI2iYBuomIx7s1BPU10iaAea3Xj7eEFZIgBfn41UBIbK3WY+
 4W1jSo9063s0JSps/FEHn2k6BjfFM/3hXv5MjeV97Bd1bn8UGnvtUQaPg9+OIUWGQ7bpyhTQu7b
 pf1o4b5HcgMGY8ORPpEJD4ygsJMZDcMcBKbrxPYhQ4wFF+Rk/N665VQzRvDMVEdvbxZ417yV5lb
 n7ejR8td1lJXjKfig9jsWmCK6Kv88ZS3XU5/WBElVlsdKPYL3+dHqLrCjYdU+pOQQWJMBc+964K
 QaOEN3fQvL1MHdOHPRyS9REoYeBg1sdKe65aU1RShcX6nH8po3HsstqWiKApURs8aZJeS7hd7L5
 Bb3YTwa8cuKNJL0KO0g==
X-Proofpoint-GUID: YletQzo3Y744TP5O7Qsbf2_xw5Lff0e7
X-Proofpoint-ORIG-GUID: YletQzo3Y744TP5O7Qsbf2_xw5Lff0e7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230067
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1];
	TAGGED_FROM(0.00)[bounces-104214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.820];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 03E5644E06F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add WCD playback and capture DAI link to sound node. Add WCD
codec node and corresponding soundwire nodes to perform
headset playback and record.

Changes since v1:
	- "audio-codec" node moved before "regulator".
	- renaming node from "audio-codec-0" to "audio-codec".
	- dt-nodes sorted alphabetically.
	- patchwise run on the patch and indentation errors fixed.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 83908db335af..9970a7e2462d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -6,11 +6,35 @@
 /dts-v1/;
 /plugin/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 &{/} {
 
+	wcd9370: audio-codec {
+		compatible = "qcom,wcd9370-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
+		vdd-buck-supply = <&vph_pwr>;
+		vdd-rxtx-supply = <&vph_pwr>;
+		vdd-px-supply = <&vph_pwr>;
+		vdd-mic-bias-supply = <&vph_pwr>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,hphl-jack-type-normally-closed = <1>;
+		qcom,ground-jack-type-normally-closed = <1>;
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -48,6 +72,14 @@ st33htpm0: tpm@0 {
 	};
 };
 
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
@@ -244,6 +276,100 @@ pci@0,1 {
 	};
 };
 
+&sound {
+	model = "qcs6490-rb3gen2-ia-snd-card";
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+		"SpkrRight IN", "WSA_SPK2 OUT",
+		"IN1_HPHL", "HPHL_OUT",
+		"IN2_HPHR", "HPHR_OUT",
+		"AMIC2", "MIC BIAS2",
+		"TX SWR_ADC1", "ADC2_OUTPUT",
+		"VA DMIC0", "vdd-micb",
+		"VA DMIC1", "vdd-micb",
+		"VA DMIC2", "vdd-micb",
+		"VA DMIC3", "vdd-micb";
+
+	wcd-capture-dai-link {
+		link-name = "WCD Capture";
+
+		codec {
+			sound-dai = <&wcd9370 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+
+		codec {
+			sound-dai = <&wcd9370 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+
+		/*
+		* WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+		* WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
+		* WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+		* WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
+		* WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
+		*/
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+
+		/*
+		* Static channels mapping between slave and master rx port channels.
+		* In the order of slave port channels, which is
+		* hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
+		*/
+		qcom,rx-channel-mapping = /bits/ 8 <1 2 1 1 2 1 1 2>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+		wcd937x_tx: codec@0,3 {
+		compatible = "sdw20217010a00";
+		reg = <0 3>;
+
+		/*
+		* WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
+		* WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
+		* WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
+		* WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
+		*/
+		qcom,tx-port-mapping = <1 1 2 3>;
+
+		/*
+		* Static channel mapping between slave and master tx port channels.
+		* In the order of slave port channels which is adc1, adc2, adc3,
+		* mic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
+		*/
+		qcom,tx-channel-mapping = /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;
+	};
+};
+
 &tlmm {
 	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		pins = "gpio78";
@@ -283,6 +409,12 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 		output-enable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &wifi {
-- 
2.34.1


