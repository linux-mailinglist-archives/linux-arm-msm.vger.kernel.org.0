Return-Path: <linux-arm-msm+bounces-44470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C89A068A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789511636FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A02A204C0A;
	Wed,  8 Jan 2025 22:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hJ/haWYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F52054EB;
	Wed,  8 Jan 2025 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376211; cv=none; b=oTNPvUXJ3CLcIDiHWu9mq+x+oHfcspto90iE7uvZubsJNgenUHoG5UUyLMi4Vj2IIT/dVR8McHKYPLfQBTGFujYCYtKEfn8WMdEkFvplx01XW4a+XsEyGqk7j8px3d3sgWu9yea/v1eivOhKcyDaVJrcRyRJ7DKuS+xkraorYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376211; c=relaxed/simple;
	bh=4Ai8HrQO7EXhOT1kTkYJbhuu4yAE42T8DLKwX/0Efqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=S0vWmIiNjnkYy+3MLdcmPbMX2uxkwukRRLUNDqp39XJMDBpqpYiL4QZGVXgr6o+Qkob0CWBzbfsCDCCW8fAlOqRTP/m4I+LU1+wYlW6ii1lBBineZPGJqUkMcwMjn2AjWH1dLHb+oWDA4COu+bOcAxfapAX4ln4XyWK8ueqHojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hJ/haWYG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508EmESu028206;
	Wed, 8 Jan 2025 22:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQ+zRfen3LUkJ9wz1WargbiioroTKQoYfOUyy5uxeRE=; b=hJ/haWYGvgxniYKr
	PB11qBFtB7o+HRrSA67E8NnVTj2YYkFw57DAhyK/y7A/NUj8KcytRBWobKZtt6fr
	Sh/zjM4D816R8rBcnpQxRNBwWJ+w39CVNvhPNXHHVlCu2vQcWzRsdFvwpDjO3JmI
	aW7ullQf/IiXJYaFJ2O3ibEPOPf9yAgOFNOOE2HUh5DiI7aWbfA7FTzisXSeXHBY
	j08pRZ2wAVpKFUJ1cr1faHtbKAdoJWzLCP5c40fAvEkxf+S5TcWAz2etqDvu84JS
	0JteqTi453BVBbvdiUfkJUxCj4kgFxTue1i2uyZ4McZeh87VPNYgyGkhw+d3NGoo
	SHeRNA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441uefs3a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:43:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508MhLGc020970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:43:21 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:43:16 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 9 Jan 2025 04:12:41 +0530
Subject: [PATCH RFC 4/4] arm64: dts: qcom: x1e80100: Update GPU OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-x1e-speedbin-b4-v1-4-009e812b7f2a@quicinc.com>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
In-Reply-To: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376174; l=4654;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=4Ai8HrQO7EXhOT1kTkYJbhuu4yAE42T8DLKwX/0Efqo=;
 b=QvCdn6edjXbsBK7FnLYHSPOeDjpxUCGK0uVqyaLoMc4Fw2wOgDiEgS7EVRcpuGLdxwBj6TySh
 fi76J4jCc19BJtak1SYsYGiSvGyurC3qG8A8YYszYPMim6EiLGwsCKi
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oDm9JioO8NfvSz4nA2vGUs6Kuzl5KgZR
X-Proofpoint-GUID: oDm9JioO8NfvSz4nA2vGUs6Kuzl5KgZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 mlxlogscore=974
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186

Update GPU OPP table with new levels along with the speedbin
configurations.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 444723ab4f11d15cb7c0f9829ec8123b76e4ebeb..0a4f179ef2eb2de11485580d797457f823f3c528 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3325,6 +3325,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			nvmem-cells = <&gpu_speed_bin>, <&gpu_speed_bin_hi>;
+			nvmem-cell-names = "speed_bin", "speed_bin_hi";
+
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
 
@@ -3337,11 +3340,28 @@ zap-shader {
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2-adreno", "operating-points-v2";
 
+				opp-1500000000 {
+					opp-hz = /bits/ 64 <1500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x01>;
+				};
+
+				opp-1375000000 {
+					opp-hz = /bits/ 64 <1375000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x01>;
+				};
+
 				opp-1250000000 {
 					opp-hz = /bits/ 64 <1250000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
 					opp-peak-kBps = <16500000>;
 					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-1175000000 {
@@ -3349,6 +3369,7 @@ opp-1175000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-1100000000 {
@@ -3356,6 +3377,7 @@ opp-1100000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-1000000000 {
@@ -3363,6 +3385,7 @@ opp-1000000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82b5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-925000000 {
@@ -3370,6 +3393,7 @@ opp-925000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82b5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-800000000 {
@@ -3377,6 +3401,7 @@ opp-800000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					opp-peak-kBps = <12449219>;
 					qcom,opp-acd-level = <0xa82c5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-744000000 {
@@ -3384,6 +3409,7 @@ opp-744000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <10687500>;
 					qcom,opp-acd-level = <0x882e5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-687000000 {
@@ -3391,6 +3417,7 @@ opp-687000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <8171875>;
 					qcom,opp-acd-level = <0x882e5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-550000000 {
@@ -3398,6 +3425,7 @@ opp-550000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <6074219>;
 					qcom,opp-acd-level = <0xc0285ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-390000000 {
@@ -3405,6 +3433,7 @@ opp-390000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <3000000>;
 					qcom,opp-acd-level = <0xc0285ffd>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-300000000 {
@@ -3412,6 +3441,7 @@ opp-300000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
 					opp-peak-kBps = <2136719>;
 					qcom,opp-acd-level = <0xc02b5ffd>;
+					opp-supported-hw = <0x03>;
 				};
 			};
 		};
@@ -5992,6 +6022,23 @@ frame@1780d000 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
+			reg = <0 0x221c8000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@119 {
+				reg = <0x119 0x2>;
+				bits = <7 8>;
+			};
+
+			gpu_speed_bin_hi: gpu_speed_bin_hi@11b {
+				reg = <0x11b 0x1>;
+				bits = <7 1>;
+			};
+		};
+
 		pmu@24091000 {
 			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0 0x24091000 0 0x1000>;

-- 
2.45.2


