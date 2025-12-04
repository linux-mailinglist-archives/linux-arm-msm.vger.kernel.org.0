Return-Path: <linux-arm-msm+bounces-84312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE2BCA2D45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 09:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E876307EA95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 08:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA14133033A;
	Thu,  4 Dec 2025 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRrUQ6VD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1A330313;
	Thu,  4 Dec 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837180; cv=none; b=SAL54p3KW3zq8K5sf6dJ/EWlPViOM+p9uN75xsiUzfcYErqERE1x58W0goQWfzBtZOKqy4qTC5FJY1F1N6Cd0KCszk87SlHH40II/r6pYBoegP2aVDJ86TdkrsWqvhyExLdTCMLr98kivYaKA0D8mAWwGLuEem0Yn5KiUSOvAgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837180; c=relaxed/simple;
	bh=txeQahCKE+krMX/LtNieiFI2+qv4snCqFJUn18BzqVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=amIULzzB+xtRr13YJmKjbvXj14xp3rMvImuByJ9McYi4GQb4b2uTcGx1y5EDD63P+ZCy2UrwwEfYcXbedlWODAPZGPvRuHjlscF2cOvwynIzQrn1J8ETTMRNLPBoYK2T2KneflWdUejK4IWkxHDasrnr827734azvMxT9yx1PzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRrUQ6VD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468sIW560341;
	Thu, 4 Dec 2025 08:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xFCNAMkfR71
	awz1gSc9PbEUh7Cpo/k5wQcqvzvsVgDc=; b=ZRrUQ6VD+7HaOT+y5fA778obA35
	hM8AGUFwIr1KVduD4Im4FukdfhjRby4PLipulaaXoM39PFJPMxM4vFQmqttLbL1V
	rEnHksH6NfLGdq+rWbe0mODy8FjzV/4hG2H5K/cVGxemsa2YdZgL8pao19HYz3bT
	pXV2uJGw1Dnv1lzIzCXmveUI6p0S03OgqN8TZuOcUwpRp8AOwKszX4aRDB+1l5l/
	tRQuLmjrn1+FJc4r/FEJzCt4j+HCZW7Hb4OfQRW86gRTbTpdhGcpEG0z4RT47JIm
	cntuhF4nRDyC81O1zAoAKxBimtYcqywaquQ1Od0rnWEha+YJYSnEGaibCDw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmha3v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:55 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B48WqY7008673;
	Thu, 4 Dec 2025 08:32:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswmctuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:52 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B48Wq7E008666;
	Thu, 4 Dec 2025 08:32:52 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B48Wpa0008662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:52 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id DAFD12101A; Thu,  4 Dec 2025 16:32:50 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
Date: Thu,  4 Dec 2025 16:32:25 +0800
Message-Id: <20251204083225.1190017-3-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
References: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F6KYime_cun23Tv-4XPgQB2LkiMuGxHx
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=69314737 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=NsbSkSjWJLNazAhNrCgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2OCBTYWx0ZWRfX+8HX4mMdjC1u
 OWt84/UJKGKU1oElUixkvCjeq3OmG5pbgzThTYToDyWWafapodk/IfmEyT7O21BWWNBM1TahRO2
 iSMI+Vqw6ruedC/uzzle5DY4wz2skXQ8s1eEDrcG73zEmWnfF5HaYDgEVlR0m0w/e8F5jrUPHBl
 oy1GqpaCzc5KCVu6IqZnMCaClThE1eYa9FstyElpr5I40kIUW7ce0lBNr24wO6eIt2wGjRpT+/n
 sKgQaI3lq2Kko+O6PJMhbSg7lr3eqeMSCCWWeVTqcvcgENdJRazwljtybZHfPD+qT7QyRQ8gRyJ
 77O0L0FbiivO/dA/0mTu4r64DgmrMNdoN8Ft5Qo28y5GurbycAM35yhrqjE3EMo7gtqX8NNJIm9
 4VPLr4AKpxv+xJP9rOEP+ti+WZuShQ==
X-Proofpoint-ORIG-GUID: F6KYime_cun23Tv-4XPgQB2LkiMuGxHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040068

Add the sound card node for QCS615 Talos EVK with DA7212 codec
connected over the Primary MI2S interface. The configuration enables
headphone playback and headset microphone capture, both of which have
been tested to work.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index 02656bc3cdcb..7e8f7e7f1d5e 100644
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
+		pinctrl-0 = <&mi2s1_pins>;
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
@@ -107,6 +148,19 @@ adv7535_out: endpoint {
 	};
 };
 
+&i2c5 {
+	status = "okay";
+
+	codec_da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
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


