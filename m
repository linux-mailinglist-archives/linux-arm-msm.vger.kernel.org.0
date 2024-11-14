Return-Path: <linux-arm-msm+bounces-37898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD69C88FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 12:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70324B239EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 11:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD62E1F77B8;
	Thu, 14 Nov 2024 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NVzXNwh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317A1189BA0;
	Thu, 14 Nov 2024 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731582378; cv=none; b=CKuP2HsjLiu6mBHKY2mf3Fwdz18KH+4V3AbtLj9lBDF26sESDy1W1Hw4ZF0T/weESfqciicRUsQ5c8J6dyiecwRWYy3ciC6NDz5ncFg/oWXc+MqpVsI3eexYDf2CQjRfIIHolUiBAENjaDz/UK3L2zWZnPSBSTun1cWgl+nrbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731582378; c=relaxed/simple;
	bh=AZso2QVYImR1GGZkPip6idDqxJkv3xa62pqrqqeF4/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=EZ2A8Re2esyq7X/+THwS6H3MnEv/gysMHo4Z+saQObRjUlj49DmOoKM+A8u6H8bO+nGoaX76FTrFJiFcJ/XTJc5hmoh9Knjf1ievZDB//6Ktre9AXao2YKM0HPGy+1cYXQbApbhr+OcSWC/Q2ct1ZDv696hzO+1ol+LHzG/RzPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NVzXNwh+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE9oWj1021409;
	Thu, 14 Nov 2024 11:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dyuhwi9rHgnSBBlXYluMiR
	+AjdINFNaR5pj7dyevPCk=; b=NVzXNwh+owclWHwxcxL5eRLc3P8FERVvhPOyfJ
	WSmiI0ElOx3c5aCENI3uUVNs8nTGWZyVPGNiartTTcvr2ubihvUhVr6lur9tbqEM
	s2BQgJOZIDb1bOEnYi5GxfH2QMPSPTtcWp4J6FbMlx4rjRM4qlyWhsdkt00nuOyQ
	XkQ0LLMmAbSxvAsGdQx2IVqhFvvtLQI+6aKCyAOhrYxHdxnh8ybPnmK5EzWEogg1
	601vmNJT2HETJjiJVPGxKY3TzGBN3/VLN/k3JpKIGH7SjDma5BD32ubXmdixj0vF
	6Q1Pga2aPi1wiKEtST6AGftDQC7H1a7a2kx+WQwSUf42uliw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wex8r6r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 11:06:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AEB6DiZ027509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 11:06:13 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 03:06:09 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 14 Nov 2024 16:35:55 +0530
Subject: [PATCH] arm64: dts: qcom: qcs8300: Add support for clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJLZNWcC/y3MSwrDMAxF0a0EjSuQk+B+tlI6EIraaJCf7ZaCy
 d5jkgzPg3czRA2mER5VhqA/izaNBe5SgfQ8fhStK4aa6tY51+Ii8dYQ4TCgCHYJZ07SIzF7Fn9
 lT3co5zno2/57+Pk6HHT5ln46x3XdAO/Tzct9AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Imran Shaik
	<quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 23p0LF8AKIh8pfGeqC-8XsginUEXizfs
X-Proofpoint-ORIG-GUID: 23p0LF8AKIh8pfGeqC-8XsginUEXizfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140086

Add support for GPU, Video, Camera and Display clock controllers on
Qualcomm QCS8300 platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Please note that this series is dependent on [1] and [2], which adds support
for QCS8300 initial device tree and QCS8300 multi media clock controllers respectively.

[1] https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
[2] https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/ 
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 59 +++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..e43fada4acb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -5,6 +5,10 @@
 
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
+#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -772,6 +776,20 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,qcs8300-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pmu@9091000 {
 			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0x0 0x9091000 0x0 0x1000>;
@@ -882,6 +900,47 @@ gem_noc: interconnect@9100000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,qcs8300-videocc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,qcs8300-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sa8775p-dispcc0";
+			reg = <0x0 0x0af00000 0x0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
 			reg = <0x0 0xb220000 0x0 0x30000>,

---
base-commit: 78cd5a71d1cb4ca645294a1dbe603a8c356c86a7
change-id: 20241114-qcs8300-mm-cc-dt-patch-0aa6ac67a609

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


