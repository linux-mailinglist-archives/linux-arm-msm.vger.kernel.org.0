Return-Path: <linux-arm-msm+bounces-102920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIZjHkG13GlVVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:20:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 137503E9BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49A983006807
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73853B19C1;
	Mon, 13 Apr 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfRawPMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D473B2FC8;
	Mon, 13 Apr 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071994; cv=none; b=Po3B6tI09gev9eUv8pK5xSvRwN4yPmZsJ+zBj4OfvcOEEEhZptOpCo4yc4RzE00BV8F8oBuY0idWs+baYZdpiZ3/cQl3Z4upYA1mdky5DMvIvQplwUYPAN5oakpLdpyVhroQmZTj7h8dCEkUCInX7Gf6TWVpIbjWphnVoKt60nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071994; c=relaxed/simple;
	bh=9oMLXa/eifPgZUlywcMWP8cS0Jd0DMrpYnyL54gsZHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ac6Ywmk+RDeyhDjYWM8dVt9FwtQznUoNY5DRpU0V9dT2E9QHZM1q4okNnhyoeF8BH4n3gRcHMx9uu039Qi2IiGlNdIX64PryV0WyH4+AfGRFXeSl69DN8WI5uo29+UNeu/fEXNfpIBf8/5B8ANiv+YPEeHM3GihAVbvmjADXTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfRawPMS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5F7lt3561252;
	Mon, 13 Apr 2026 09:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UnWJNewxrA6
	RPlbIc9Eg5wnSQFJvDWHrb3f4benuOHU=; b=LfRawPMSY0jUsWBtLcfDb9d9Ggf
	H2zOCS83M0hix59AbYNntYqLGaAgoJcpXSuvx4fIF+pDT4HaotQaNMe5gHPfqB85
	6tw/U8Dscaig1m1hZ5eRS+KWeFkUO+Tov7wWeAEtVwbu8o6fR4oRr4QsgBNsggI7
	kXjZMuOx8SBjx/DhvHRWc/In+Jx6f6IOr0+rIkDlTLP4Lz0syrBwaA1XuG2alUhE
	0GvKnVbgXfLo8Z05l6Qx7Piy2GGgeVA653STijrbTAl6WKaP6O6kOh/c2MTyMD8F
	EEOKXY8YXqjmaQGutpX3v8bK+DnD48FZsWvq0atknLHKsgAny8Ynfvv9kyw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mkhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:44 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63D9JhNn014645;
	Mon, 13 Apr 2026 09:19:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5er2ej9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:43 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63D9JhKP014613;
	Mon, 13 Apr 2026 09:19:43 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 63D9Jhke014604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:43 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id D212B6B0; Mon, 13 Apr 2026 02:19:42 -0700 (PDT)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v1 1/4] arm64: dts: qcom: Enable secondary mi2s
Date: Mon, 13 Apr 2026 02:19:34 -0700
Message-Id: <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcb530 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=AxyP6w8U-odTa1jU-CQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX+CoRwl6+dByX
 jGOx73IteZQW9Q3KkEFNzY7RdzxGuTPyMUUVdCUNQ9Bc0r6xLievgNdEWNkrMy9VcvSKp8kpiry
 0bioQBLwa8aAKBLdshmflzXq44qtjaG3wWUKKM7mjLivwr+cLoQLY4VGrQ8vKporFi2VDKGC3jp
 ZcKhS7SOT3b+SGBeO6ZsOe/q3daHPf4ygIfcHV9Pocx4y1t+Jm7AiK8jn+jXFTQB/43oTL5aY9r
 UNwqX3JUwwyW9CzTq/zjnVkSgdBOrY5q8y8vrED5CuEPnaa6g+4dtJaSLR3f+kYEDnabgWS4n96
 xl5BzFUFONDzIwcZgJUK9Nl36Egp0/Br0S55QStCSs4Eqm/yf8H6YTQd7IFtOpnkbHMakoddtGf
 bFCNPxauXaWX13I3OOmHzxnDp/EnXF+ueUkWg+0sA8chv1wwjgiG/0iaqllnVAyDx5Qh5wCds3A
 uP1c+GE64BYKwzQw/gg==
X-Proofpoint-ORIG-GUID: 8dRbUcM8Z8H0PrnhAacFBzttDMx75Njc
X-Proofpoint-GUID: 8dRbUcM8Z8H0PrnhAacFBzttDMx75Njc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130090
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102920-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,2b:email,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 137503E9BE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable secondary mi2s to support HDMI audio.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 +++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 43 ++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..d1009debc12b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5827,6 +5827,11 @@ mi2s1_ws: mi2s1-ws-state {
 				function = "mi2s1_ws";
 			};
 
+			mi2s1_mclk: mi2s1-mclk-state {
+				pins = "gpio105";
+				function = "sec_mi2s";
+			};
+
 			pcie0_clkreq_n: pcie0-clkreq-n-state {
 				pins = "gpio88";
 				function = "pcie0_clkreqn";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..2e4062052828 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -672,6 +672,7 @@ &i2c0 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
@@ -1110,6 +1111,9 @@ &sound {
 	compatible = "qcom,qcs6490-rb3gen2-sndcard";
 	model = "QCS6490-RB3Gen2";
 
+	pinctrl-0 = <&mi2s1_data0>, <&mi2s1_mclk>, <&mi2s1_sclk>, <&mi2s1_ws>;
+	pinctrl-names = "default";
+
 	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 			"SpkrRight IN", "WSA_SPK2 OUT",
 			"VA DMIC0", "vdd-micb",
@@ -1149,6 +1153,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	mi2s1-playback-dai-link {
+		link-name = "Secondary MI2S Playback";
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr2 {
@@ -1437,3 +1457,26 @@ &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
 };
+
+&mi2s1_data0 {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&mi2s1_mclk {
+	drive-strength = <8>;
+	bias-disable;
+	output-high;
+};
+
+&mi2s1_sclk {
+	drive-strength = <8>;
+	bias-disable;
+	output-high;
+};
+
+&mi2s1_ws {
+	drive-strength = <8>;
+	bias-disable;
+	output-high;
+};
-- 
2.34.1


