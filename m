Return-Path: <linux-arm-msm+bounces-84311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE947CA2D3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 09:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B82A1305BFED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C7632D0FA;
	Thu,  4 Dec 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/2IOxrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2C2EC0BF;
	Thu,  4 Dec 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837179; cv=none; b=c2bw8NnvaJtdQ6zCml6z8X2LFUnvNEl+TmC/J6rBRG/beHdwpdJLeBLYtXFcoaoRFkTSYVeNuQOB0jyHtSKP/zOCNBFj2a//N5+7riFyEA70f677OA1CbCYHmHYUVS+x8r3bPfrfBYmqURFxr2aT7EslwmE16yESVxPgbXjbH/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837179; c=relaxed/simple;
	bh=sns+f50RJEA4m5QuPY+c4X4rRIJQdkZ/oOoPST0JCSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N1xLBJ6muOiq2KgJKfN1CMLFsU6ehKU+k9437xGqQ3BW98O8M9ky307qurtFVOCjbZM8x1ayU5fSpoQGgXwm2F6YJz0GRnL0ROj287/wtq+NUMz6etyPbOnXVZxvFK+AVR15ht6ucTlI7YKfcO8oNBhxhtbjpQEf7MX1Jz9hnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/2IOxrH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B48V56E952071;
	Thu, 4 Dec 2025 08:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yGEQrRgs30n
	h8rcUJjN1J8LEguU9wQzRiz5CajOESlU=; b=D/2IOxrH6rcrEaIAIQQpLTIN5Fk
	eshQP8ul7RN+wHW/JpvPCYcCQDFFxGB0FQJvqEklEwpKihk7cGrYH/H+AiOp/nzM
	vSv46sEq9IqgJ80EOiM5xyQhzHv9ib1gexJVI5aSo0VrYBfmeqMAMN98EqiVa9Xq
	ULJYf5eW6V+nex3QAbQkN0YSnpp1ofJc+Fo6g45oSpcWCZ8jySujTT9U+V3OA8V6
	1P3pW9BI9gEGcaQk1wr9f6gE5CqoF6JPBAudZ4xHqmUTqU+38zmdsKQbJBx/YG4j
	hQh16mTKLcTPYLn8DJYE3Eo2JoIy7XEO0H18YEEhSOHmjNaja2OLgVLVegA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1g061-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:54 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B48WqJR009741;
	Thu, 4 Dec 2025 08:32:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4aqswmd407-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:52 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B48Wqkl009733;
	Thu, 4 Dec 2025 08:32:52 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5B48Wp3M009728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 08:32:52 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 733E9226DD; Thu,  4 Dec 2025 16:32:50 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
Date: Thu,  4 Dec 2025 16:32:24 +0800
Message-Id: <20251204083225.1190017-2-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2OCBTYWx0ZWRfX709OIdt8B6Ml
 i71PLmLYtDtRuv7zRRZeVSbpEWQKdv1PMQipAiUXazHYmrbUGzJwEF34T9xSBs1NvbOc+EYKsmU
 6bgX/WvcfYZauNg3380DpjU6qNLdDEssyoWzNV6EPSJ1KyMMV67zrBoVqoSIc38n1CIjauh8QO5
 oWRwDFFzAze0mePN+L3GakP/a3AxKFeS9fXCJgcQ2SayJ/8uabWYnb1wzJqPH62SJzDGLT7lPnK
 PC2oJAgCVD6br+3dPTgsvphyDYac5zdpYcgMc2pkCv2L9lzQMNQz2DeCDmjeWZv3IyZeSLsBscp
 hvg3onzOiJcW5KWP+Mvmd6D38l2FlzRqQlyP93D4N4unpJ4hppsScLRZCoRGfezKXg5CV7xLDuM
 zuxQHdqTYPrt8BSE2Drpn4mwWBl/7w==
X-Proofpoint-GUID: yRKUnHkYXqeu0nEoQUI-dlQG3sKnqExR
X-Proofpoint-ORIG-GUID: yRKUnHkYXqeu0nEoQUI-dlQG3sKnqExR
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=69314736 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ZmyhYFDlZrQhgxRmxmAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040068

This patch adds the Generic Pack Router (GPR) node together with
Audio Process Manager (APM) and Proxy Resource Manager (PRM)
audio service nodes to the Talos device tree description.

It also introduces MI2S1 pinctrl states for data0, data1, sck,
and ws lines, grouped into a single entry at the SoC-level DTSI
for better reuse and clarity.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


