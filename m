Return-Path: <linux-arm-msm+bounces-58600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0DABCF35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224C21663CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9535825CC74;
	Tue, 20 May 2025 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WwHD8Wt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3225CC63;
	Tue, 20 May 2025 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722427; cv=none; b=JIUYRykryya3fExOYk5W+tzuCmK+fXrgojUFhxDKuP7q478A10XpNZiaLx/o4mKqCYS0l/k0FyhMoY7qBL8gsWh98wUctnO9bi8l/cOycnA0zrKM0L/nHfw1zkNyCq7tpvE7AEeiT8tH3RgPSNjRriB/f0eYfsDfJNk+sh6+UvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722427; c=relaxed/simple;
	bh=BWw++4fTJ9YjhugLF5GVjORNbWjB1wlGy8X7svtrc1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nFzQuTBsQrdFmqCeHyjyQZhLPTzw16H7DHehqGiATjz9n7vjWUN6G1tZk7kQ41ifdEFZpV/cUAqtLJyu4HBmj4CMjBWrHqPFGlxFe48MAPFpjPGNTcUugkVPmYDtZkjTH2587jOluNhEPfGlD3PvQINNacNgz556+W3Jd2aVI0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WwHD8Wt5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4xF54023369;
	Tue, 20 May 2025 06:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0iRrtOKRL3e
	RwKJjQG+oJD7UBFaHiAvzSj+7kqewe/Q=; b=WwHD8Wt5d3NuHwxxvdnER5RZha0
	KJt+rZURMtAwC/vkHgVIoNIrEP+Ij/vNVFnnKp8YOmg/eGdLgq6QjqgSjAiS/XDi
	21eGqv2biC+aeWM4k3tRXbbVevt12+KNwB4XSCs9zMGraodlyQIW2o9gaCruWfbv
	c1T1k0F/VhqN6fam38nw1lNKDBBGFfrN64GvovRzQSGs/zpjfzJhROJiLqIxw9yM
	cesSHBPAVzYJjcCwlXiKUHEk0WL6UlGWj6Jy4s7AYeP3Ks/tYDBasPAoaDdW0+/h
	COwAiCzfWIcF+Xys77J0y4TmLS8UrLMNtfy6PL2EuL2wPdEfR++hR4BSa1Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041ub23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6QwLc011085;
	Tue, 20 May 2025 06:26:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhm5t47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:26:58 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54K6QwII011078;
	Tue, 20 May 2025 06:26:58 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54K6Qws5011071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:26:58 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id ACF395C2; Tue, 20 May 2025 11:56:57 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 1/7] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Date: Tue, 20 May 2025 11:56:12 +0530
Message-Id: <20250520062618.2765109-2-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1MCBTYWx0ZWRfX5d73GTs9Bagn
 JUP9ieWU8GPl7srl3ivCukuWkF5E4H6EGis1bCUl5muHytXJ/r9mb+ZrqPPX2M/cxMtKWqy8d46
 gwkR66IeECrZolfVeVLpjtZ6s5hgzTrICdN8xo1VXziioaCGpWhSS9W03aTJ9bn1hFSes3jyck/
 /cuvD+kamUYiu5OMPJc0bTFGifXDU2lv3kD7GoyfQZFQ2+dUpLTPkXvP/VuJ/aVJ0ThpYzfyzpe
 +R1h8Pqd8mDNI0Gp+CzOddLbIGro48kdqZWzT5MpVAq/hRboATUZtsweTDduPuHmNVlXw9SFiR5
 6UN6L+nDi/npEWnHahJBsAlc4hINxtjEXvqnYY/7jRuhcKfS3nKvrXlyfjR8IC3h/VwEsFYSvA0
 ldJFiM2wt2S6DsEVs24UMIDhIq70943r0truUff+gQ7hjJhAe7jZJIebe7F5L0Z1leCKN08D
X-Proofpoint-ORIG-GUID: eOE5mgfXGU9rLJ9bJD-hqDyfshn5T8g-
X-Proofpoint-GUID: eOE5mgfXGU9rLJ9bJD-hqDyfshn5T8g-
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c20b6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=s2LqOe0AJaebvsvSnksA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=812 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200050

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 53 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
new file mode 100644
index 000000000000..29d4a6a2db26
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * qcs6490 device tree source for Audioreach Solution.
+ * This file will handle the common audio device tree nodes.
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/clock/qcom,lpass-sc7280.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&remoteproc_adsp_glink {
+	/delete-node/ apr;
+
+	gpr {
+		compatible = "qcom,gpr";
+		qcom,glink-channels = "adsp_apps";
+		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+		qcom,intents = <512 20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		q6apm: service@1 {
+			compatible = "qcom,q6apm";
+			reg = <GPR_APM_MODULE_IID>;
+			#sound-dai-cells = <0>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6apmdai: dais {
+				compatible = "qcom,q6apm-dais";
+				iommus = <&apps_smmu 0x1801 0x0>;
+			};
+
+			q6apmbedai: bedais {
+				compatible = "qcom,q6apm-lpass-dais";
+				#sound-dai-cells = <1>;
+			};
+		};
+
+		q6prm: service@2 {
+			compatible = "qcom,q6prm";
+			reg = <GPR_PRM_MODULE_IID>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6prmcc: clock-controller {
+				compatible = "qcom,q6prm-lpass-clocks";
+				#clock-cells = <2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ac59dd41a495..cb857f0728bf 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3814,7 +3814,7 @@ remoteproc_adsp: remoteproc@3700000 {
 
 			status = "disabled";
 
-			glink-edge {
+			remoteproc_adsp_glink: glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1


