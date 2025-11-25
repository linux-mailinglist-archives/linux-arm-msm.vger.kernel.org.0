Return-Path: <linux-arm-msm+bounces-83153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AACEC833E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 04:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35F134E2131
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 03:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7651B26C3BC;
	Tue, 25 Nov 2025 03:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIej/OB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A425A321;
	Tue, 25 Nov 2025 03:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764041609; cv=none; b=rFz1TG0y5U8H42mQ1GgVCG/pFsakKo+rV2D+tbaQc6JBi3IMy0j5AXtxoyPND7QjZjMsQ+pryoOzYorwxqEK4vMna2W6IUFL7c7Yu1wkePiP9yaFe2E/ToykSyeA2D6geIABiBqWA8xoyY24GFc/t5J971tXp9X8kjlqAfJ+kJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764041609; c=relaxed/simple;
	bh=Hdwzql7/a3oeTOfclxRyrAe7SiDLgtBKV3+HBwicufU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H4tpyPRbSj+C6XjRw4cpHX7dCHKe5LenhCj3KyRCmZ4wfGyNWFx2Zjklm0oM3BHkfnJ2ua3ERtoYmP8HTgnBGPb6j7cAUgHOiw9XxKacNmS+dnK9ybH6VeUKo2seM/4tIhouatKKltvPsmAzFrMvybL17g6LyltZAk4Q+JtYa6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIej/OB8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2ggeT1741109;
	Tue, 25 Nov 2025 03:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=84KlgLZCcYF
	qNAAYOWC60ue1u3+ZD2oTWyTK/t7O0SM=; b=BIej/OB8NlVqgFqF2wdvxJyfBbb
	Ym0AUhbEpAcLFzGfTo8cosWpUHGxgZ12f6KhAyNP3cLpA58oLBoEA6zbyepYDxxK
	DsI6HGeY6mWacTV1jAe5Efb2J0uebxSNTyka+fDepq9nR4zd9pPdWRI0B5VP3dle
	c62Pn8DETYoxojpMfyK+lxV1w/oc+tMqn5aXtlP8Kds+O2qa3rS0mXp4nQh1goEV
	HIiffHd/JV1gyHSIfGLmJUvdOCnPiMyxM1KOT0ArnrwtS96DOJAaMC3mchp4Gyby
	mYlkg7WmVDDZwzO6ffOg0ponhn75pVnBlunsvgsMX9xvor0b5K3+iIGMKYw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amteb9pvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:25 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP3XNIW022298;
	Tue, 25 Nov 2025 03:33:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68m5gun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:22 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AP3XMif022291;
	Tue, 25 Nov 2025 03:33:22 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AP3XMXx022289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:22 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 1569522785; Tue, 25 Nov 2025 11:33:21 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
Date: Tue, 25 Nov 2025 11:33:10 +0800
Message-Id: <20251125033311.254869-2-le.qi@oss.qualcomm.com>
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
X-Proofpoint-GUID: L70r4Za18-9mBkXJ2BSLL_Z2WFYmVqIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAyNyBTYWx0ZWRfX3AZPKbFWRHzX
 Mu4gA6BoWubUNYdLeYQL7csfTAC7riZWjZ2983l+Kw6oBJdu26PL8+yydePVrD6zrQNdUI4XArm
 9Z0eAL9+cCebofhQ6wBafPgg9UjzhR9BmViuc5rrC4RBpF9yUFoQ5S2whg1pVR7pQ31vxgPk2bS
 lFmUOUNxRgw9XrE6WqrthlfF9CMLk6I9GeCwCO97Mkkyoytx6Hpbdi0EihjwTdGooiCH51UkOrc
 hhtr8ai7SQ80GCu9R4LEHsxZQ+lOCGDD5Ox9QF3s3vhN/o7RUCkOilFoZUBkCyyGHLfKfVwmJp0
 kdC1J1ZxLizLmlTyBPAVQeIuZCSl4WZYWlVQgNQpLC6iDtlgZxcFjJ2mzEfy4BkMbzzHoa3uD2a
 JQVlTq95YE/sfOB3cu7u1S4d01vbnA==
X-Proofpoint-ORIG-GUID: L70r4Za18-9mBkXJ2BSLL_Z2WFYmVqIp
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=69252385 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ZmyhYFDlZrQhgxRmxmAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250027

This patch adds the Generic Pack Router (GPR) node together with
Audio Process Manager (APM) and Proxy Resource Manager (PRM)
audio service nodes to the Talos device tree description.

It also introduces MI2S1 pinctrl states for data0, data1, sck,
and ws lines, grouped into a single entry at the SoC-level DTSI
for better reuse and clarity.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c..71db4d019853 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1549,6 +1550,13 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			mi2s1_pins: mi2s1-state {
+				pins = "gpio108", "gpio109", "gpio110", "gpio111";
+				function = "mi2s_1";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -4572,6 +4580,45 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1721 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.34.1


