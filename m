Return-Path: <linux-arm-msm+bounces-103504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGiKMCAC4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:49:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E44198ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5657D308DD11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67C93750B2;
	Fri, 17 Apr 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDBaXbNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54744363081;
	Fri, 17 Apr 2026 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418420; cv=none; b=cfRXqMoDq+85uzTOl1cxN9xE9sYXAlyB024NqejmvuVBhtAUSbuA7GX5U8d0kJV/JE/HJGjsfTBGgabCsDWV2jyN1/hFJ40dYhk4ao/uK1u/hoPFI/fuEDzJPKsljQgIdlwnxxR3WM9GwrUm6vNWeeaT0mO3L9s66e/VAUKTiak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418420; c=relaxed/simple;
	bh=BXdpks9H9rklxuI3yAO6kCgua5nDHMkIM6I8m8j0NKA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IFoxfFdsciRu5Y5KVdSuxMEMCQiWBbnv6cyflvzRDPXFiUw4PvvhBtzBkSHzTuf+BagCCmHon/uMaSPmMYtq5KEWSB9Gvhm+4PBVj6d92byq29wSHlyhZw9jHriSJIhE0Vnux3W+x0SeENBOXOtYgR7gocxSFnHXh2fVKUm/kUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDBaXbNb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H86u4Q065800;
	Fri, 17 Apr 2026 09:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5JmLXK651yqbEnZCMZk3XltBKhh2ELPuJSA
	3C1TZ3K8=; b=PDBaXbNbtXnQ04F54Z64Xzbc4VhXSl3sNuLyZUvUd+Nefv9ePp9
	mGXWI5zaXFOqwaPGJe5NnPzji7656LNAF5SHPpDa2R8bZixCpzCchyfNZD1hOcWI
	JN0av9I8TIUnuVlXeo2+KMPOqrK9ba5j7DaUKzAorclBdkIDmdqdrqu2V1zf+irn
	hgQ0CVJOOuruzoQDopmgu0xv3seUD7alXp4f/R5aOhyn/v7mvNf+GxneVV/tNOsd
	IL2g0J14uGo4o20WjZq1K9w4QR3opC2siZD4osTT1U1i+8N8JaunsRARDN8IXaRm
	J7Ymve6j84JFoVRcqofs6ELdA22bkuqg/nQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk3af3319-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 09:33:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63H9XWVq031346;
	Fri, 17 Apr 2026 09:33:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5d1q1by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 09:33:32 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63H9XWox031340;
	Fri, 17 Apr 2026 09:33:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63H9XW0K031339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 09:33:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 7EE87636; Fri, 17 Apr 2026 15:03:31 +0530 (+0530)
From: Karthik S <karthik.s@qss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@qss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset playback and record for qcs6490-rb3gen2 industrial mezzanine
Date: Fri, 17 Apr 2026 15:03:27 +0530
Message-Id: <20260417093327.3251203-1-karthik.s@qss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5NCBTYWx0ZWRfXzZCIbSjRlvZ7
 DVsTW8BF7fA9WZ40mhXFVreath2LPg9JNqR1hotoiXjR3vuFSv1I0QW1WhmANotXfWQEV27fu3i
 Vi5PdH7wz4RqHdZHJEkg2yRDqUwuYL4FpEmYdZmrMJFXRQV6sG4gxZGGXaV0sR4f7pU7udMVT2N
 P2ev1h3kKO9+vGLvwHJSp+f7IIdnUrzQFDoQ/SRCPcJg6gjL+fikcyIZkJHvkjMB+iFeHmhpx6o
 gLIoGFRD5jSWAcxfCf3JGcn8OsExc/YY+wBa4NWbzs4+WqF1eQaqbYBgiVdrirJh77b7UFCukYz
 Oikx7mnOjPtyQ7hYTVDz9nzxonO/CiG2+aKmI+bRaQCnS5zUOLzaR9LNuO43SFtvu5q5xZy5icJ
 3gZwtie+WdRW5GKfVrukpH1FWwHpfwrzXgbEk1KQ2pNL7c6CoddRtZWQ6SGiR+m0QheRkslsacj
 qNqTNSrYlhUNy/LfCVw==
X-Proofpoint-ORIG-GUID: o-7mrK4v6KSskQg0EzyZi7Ffse7nDPSX
X-Proofpoint-GUID: o-7mrK4v6KSskQg0EzyZi7Ffse7nDPSX
X-Authority-Analysis: v=2.4 cv=DfInbPtW c=1 sm=1 tr=0 ts=69e1fe70 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=091khAkvSFST2kJ2BGsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1034 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170094
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
	TAGGED_FROM(0.00)[bounces-103504-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@qss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.218];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qss.qualcomm.com:mid,0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E57E44198ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add WCD playback and capture DAI link to sound node. Add WCD
codec node and corresponding soundwire nodes to perform
headset playback and record.

Signed-off-by: Karthik S <karthik.s@qss.qualcomm.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 83908db335af..d2503fce352c 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -6,6 +6,7 @@
 /dts-v1/;
 /plugin/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
@@ -30,6 +31,29 @@ vreg_1p8: regulator-1v8 {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	wcd9370: audio-codec-0 {
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
 };
 
 &remoteproc_wpss {
@@ -283,8 +307,117 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 		output-enable;
 	};
 
+        wcd_default: wcd-reset-n-active-state {
+                pins = "gpio83";
+                function = "gpio";
+                drive-strength = <16>;
+                bias-disable;
+        };
+
 };
 
 &wifi {
        status = "disabled";
 };
+
+&swr0 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+	compatible = "sdw20217010a00";
+	reg = <0 4>;
+
+	/*
+	* WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+	* WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
+	* WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+	* WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
+	* WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
+	*/
+	qcom,rx-port-mapping = <1 2 3 4 5>;
+
+	/*
+	* Static channels mapping between slave and master rx port channels.
+	* In the order of slave port channels, which is
+	* hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
+	*/
+	qcom,rx-channel-mapping = /bits/ 8 <1 2 1 1 2 1 1 2>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+	wcd937x_tx: codec@0,3 {
+	compatible = "sdw20217010a00";
+	reg = <0 3>;
+
+	/*
+	* WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
+	* WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
+	* WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
+	* WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
+	*/
+	qcom,tx-port-mapping = <1 1 2 3>;
+
+	/*
+	* Static channel mapping between slave and master tx port channels.
+	* In the order of slave port channels which is adc1, adc2, adc3,
+	* mic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
+	*/
+	qcom,tx-channel-mapping = /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;
+	};
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
+&lpass_rx_macro {
+	status = "okay";
+};
+
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
-- 
2.34.1


