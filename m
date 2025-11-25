Return-Path: <linux-arm-msm+bounces-83154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A28C833F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 04:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F893AD3D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 03:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37AD26F293;
	Tue, 25 Nov 2025 03:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8Qk98C4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491292609DC;
	Tue, 25 Nov 2025 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764041609; cv=none; b=WEnCmlo8I8kD1pA04QB9j+kICHG3SxnB5LZvQaKNKQw2H3WXuG+kd+imj+XDBFtq0ylO5kpRKARUbFRIXXwcCsVCaZsIgjins2S72CrOf9PAjkC4oor68HyLp4a25ECfldnNE9we8jxYOh1xidkKA7NE4zVQUHBKoQH3pDT2EGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764041609; c=relaxed/simple;
	bh=WYiBp1cx0TPZllUF6MRGjPEXcFBB+8zMl1RhMgirOuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=swjjgyIu5BaIxLMdLBZwwyombdtP3T61bmwwF92b38hVvPIDl/jHg1XNvdSBSYfekQ1pf2NA59X8Emmg+gsY4VDUg/g1EKDbjGpkZRoH1objfAdozLkzrU1ubtwnNW7jYhypo6FDB4iV0Heq8sqMBLWdJP/vwFBbc93+KlHQN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8Qk98C4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2giu31820780;
	Tue, 25 Nov 2025 03:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VOJcxVPUaqR
	/45Wtb29py+AlIAh74sMI86ROjSxI5KE=; b=l8Qk98C4FQrLOb/oI8rSB+Uj8G9
	K4EuFVctkprhcNACN2F2TBbxQ/lO+DNI265yJu8vurp8kJazVd+5kC7Uwze/YKsW
	e8CyAwl6a9q0SXoMh2KT1+xVCO6c8fHTj/AfhwO6jL38xiiwVtd8xjCsxfQjNsG6
	6LMQeYvABtp2Nu7LJcSTYZ5ly1c81ZRhff9e1D5DC7q4/wBZx6nsZbLjhoh9hWtW
	A9eC5F7JiXrghcbDRogzv3nKg80AKjHWUwcfLb1/1NIklWlg37FIJz3e94tPxz2y
	q0Ep+hTCaEWaO6jZve0I9T1PfOy2rYFPMYbLYsVmmOzVrh6yCIOxUKkgqzQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h2haq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:25 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP3XN4X014111;
	Tue, 25 Nov 2025 03:33:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ak68m5458-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:23 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AP3XNJa014105;
	Tue, 25 Nov 2025 03:33:23 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AP3XMCt014102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:23 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 9F59322794; Tue, 25 Nov 2025 11:33:21 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
Date: Tue, 25 Nov 2025 11:33:11 +0800
Message-Id: <20251125033311.254869-3-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125033311.254869-1-le.qi@oss.qualcomm.com>
References: <20251125033311.254869-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAyNyBTYWx0ZWRfX58zxBjguQnUa
 5iVMA/Ilj1qLdsyzU00r2MUSYAhXusDymC625Ja6iuWyZawVtyuCmCsau6Ov6KDSWKUrk+pjjc1
 OOunLmy7Vs/uoCxMIyTEDJbaRun9f9Yk72WiETZij/6BxyrUp1cQbTQFgFlYBarHWVU3Fus1wzx
 SRaSuEIYyixI7lzWisiT0dIZo0oWzI9gfWqLywp0NtZJxst1XQd92qzQSWwEmS1Op+skTmEppQV
 efUAjdlfVqa7IKgulzoD53XXizmkKbX8caLXYAjcISxG+MSINHCGc6EahKcSGlrZTtk3pquKnGe
 rXg4qe6jqCtCIKErDYQfHR9N1RgzgDtEypi7il5k4O0fHAobKkzBsaIBe0z5aAbxmutcxxBN3by
 cGbjplJ4NbAbJM4iROcsDSFeheWIYQ==
X-Proofpoint-GUID: 58tSBoPST7c43LUjLcNBw4sX7r5vY-77
X-Proofpoint-ORIG-GUID: 58tSBoPST7c43LUjLcNBw4sX7r5vY-77
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=69252385 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=NsbSkSjWJLNazAhNrCgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250027

Add the sound card node for QCS615 Talos EVK with DA7212 codec
connected over the Primary MI2S interface. The configuration enables
headphone playback and headset microphone capture, both of which have
been tested to work.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index 8ca0699e3c40..3f382fb6d1f5 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "talos-evk-cb.dtsi"
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 / {
 	hdmi-out {
@@ -18,6 +19,46 @@ hdmi_con_out: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qcs615-sndcard";
+		model = "qcs615-snd-card";
+
+		pinctrl-0 = <&mi2s1_pins>;
+		pinctrl-names = "default";
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
+	};
+
 	vreg_v5p0_out: regulator-v5p0-out {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg-v5p0-out";
@@ -88,6 +129,19 @@ adv7535_out: endpoint {
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


