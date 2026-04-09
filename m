Return-Path: <linux-arm-msm+bounces-102399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM1FMNYX12k1KwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:07:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A013C5EAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E02A30252AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 03:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F0236EA98;
	Thu,  9 Apr 2026 03:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIUzniQM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B7283C89;
	Thu,  9 Apr 2026 03:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775703737; cv=none; b=hZ8YD7qS+SN56nko1ZVESUCt4lK3d2psSRVkF/72BjrHk5jQrS69Y62Xc0S426HyW/ADnVEt6QYpWmEJdeKj/+z88MTDMlmjsPddtF9sVkgEHtErYjNeKuTQVfI5uZGAyZBkFsBKmlIF/IrRk/i5d+Sf/k0T7VwWWNngLVkl3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775703737; c=relaxed/simple;
	bh=ZK0Jt09C4Z9U33V+ppXkSe1vacGRZVaGrK1Ie+JDaNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dHR2F4mxniE83YJREBI4IcBMraIA8GJcgcEgWHmHhMzH3/OaxWy/PS3eI9QJyjEgRbqtgkunK3PJ4y7Hp9006bHO4Eyaja8F6ZBlQInopdykcfE2xGiXRWegb/7gvETEErZ4GMiYEoAhAHPyPsEDK0jApMuQwxTKADMpsiMGxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIUzniQM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NbUdg2845979;
	Thu, 9 Apr 2026 03:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UwJ8M5/B4qA
	zvuVvs50+96VS34OzafblppBlZqLUgo4=; b=VIUzniQMtqvK7YPw9CffpqV7ahB
	KZCO+GiQvQrywdjdSQ01CAH/42TOZYUXTB52x7lvleDnpTuyofG4KZvuv3L2EBn/
	hmzJOaWZuOLtUiVyQiRwdNaRfl7RMKy4alaV91fvuiUuJbhd7Hz55UlcmYZEIeqv
	jZLXwsXznbnL7SADgFBVnVpKiia/V19JQxbJVn7TzEbpmJxU2AX128S+1w7ucl64
	0OyBlZVFTXMqoD1XPFBxe+AW8ha1R9Ah6BXcY5VoCo/Y1hRC3a5o1utc87509AiC
	fykjXbJgxGHR5VPfK9ejXC5ZRIeYwl8PyvY6hwaNCGGPQ4beP/3j/DJ9fQg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hj3sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:12 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 639329Gc018159;
	Thu, 9 Apr 2026 03:02:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4db3njt426-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:09 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6393293v018150;
	Thu, 9 Apr 2026 03:02:09 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 639328G0018141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:08 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 9DB2921BB8; Thu,  9 Apr 2026 11:02:07 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
Date: Thu,  9 Apr 2026 11:01:56 +0800
Message-Id: <20260409030156.155455-3-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409030156.155455-1-le.qi@oss.qualcomm.com>
References: <20260409030156.155455-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d716b4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=c-OUY-gO7Egmvcr4Y_wA:9
X-Proofpoint-ORIG-GUID: IpHvtYo-oMHb9d8K2SztoKc1asNCOVUH
X-Proofpoint-GUID: IpHvtYo-oMHb9d8K2SztoKc1asNCOVUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAyNCBTYWx0ZWRfX9i76uMwix2HJ
 l7iEQ56WcnPQE2Qa5KHFIl+DEyFZ8LpAPLDaXcPDvNPaCC7s1/8pr/QOSbhXtTj3V+2Z7s/mF+F
 ea2BJUbRHO2+DWmTyqvL43QE6Qm44ly/jqaoejelWl1JnW3lpIca7btWC2UEipExWez2eNUkee7
 2+JKd8Uot4tl5BYrQLWh4GVEeHl0T4rU3xuNtSiqkHxqp2NuAogCF2+N36co+O0yzqaV1sR9cMq
 /5x/FAJJmymK4R/6SbGUMEGnWNgxTPyXz6bbhdVdd+T9m8K8mnuRmFhyWB4C2sSR/POce1qM5q2
 0IStFgkOEKZnD7fP7poMtppnkvpp6Fd26JdGrR/cz941HqBkOdQoyAEse7uJgRVQVmlUk2dt0n1
 /gcRa4FKyhMCwoCZ3PuVJUXF0NBeiqbpR+epEv33WPCHX7QA8Gx+5lZ/2NwVUo8Jppsr98MXMWT
 ieltf5nxBlh88ECvj/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090024
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102399-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1a:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 61A013C5EAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the sound card node for QCS615 Talos EVK with DA7212 codec
connected over the Primary MI2S interface. The configuration enables
headphone playback and headset microphone capture, both of which have
been tested to work.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk.dts | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index af100e22beee..b7f514fbc7b2 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "talos-evk-som.dtsi"
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 / {
 	model = "Qualcomm QCS615 IQ 615 EVK";
@@ -40,6 +41,46 @@ hdmi_con_out: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qcs615-sndcard";
+		model = "TALOS-EVK";
+
+		pinctrl-0 = <&mi2s1_pins>, <&mi2s_mclk>;
+		pinctrl-names = "default";
+
+		pri-mi2s-capture-dai-link {
+			link-name = "Primary MI2S Capture";
+
+			codec {
+				sound-dai = <&codec_da7212>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-mi2s-playback-dai-link {
+			link-name = "Primary MI2S Playback";
+
+			codec {
+				sound-dai = <&codec_da7212>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_v1p8_out: regulator-v1p8-out {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg-v1p8-out";
@@ -109,6 +150,21 @@ adv7535_out: endpoint {
 	};
 };
 
+&i2c5 {
+	status = "okay";
+
+	codec_da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		VDDA-supply = <&vreg_v1p8_out>;
+		VDDIO-supply = <&vreg_v1p8_out>;
+		VDDMIC-supply = <&vreg_v3p3_out>;
+	};
+};
+
 &mdss_dsi0_out {
 	remote-endpoint = <&adv7535_in>;
 	data-lanes = <0 1 2 3>;
-- 
2.34.1


