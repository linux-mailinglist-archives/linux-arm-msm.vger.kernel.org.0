Return-Path: <linux-arm-msm+bounces-21518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8422E8D8B30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115091F2316A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDEA13C9D8;
	Mon,  3 Jun 2024 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LlPEQMlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C513B7A1;
	Mon,  3 Jun 2024 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448398; cv=none; b=FdjLWcOapJceRsCqrzmmCv3BhDSZlslk5fXAzrgznHMB0oOOgzM0lbgLK64IYnfEg0j73spXQzFpy7VvT8WPloZTdvGFl5Od+3UDabT9EuR/lHN5opLWGbw4ZC5Oxhekw+RDiMng/hOtqLSHbDY6QFR4LTHzCqLx7zK0J/zj+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448398; c=relaxed/simple;
	bh=Pvh+AiCMVIgAhsPn6Wp3P5BrTF4WN8Fj/Eu4gf4HaiY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igynDiF65QYTC5uiy5ZW5Zx4wk0hyHutF3cybKRRs/Xrp0LU1WX/3Tlrlws2p8EgiSq2f/x5QmqBUzeI0F3JzCEGrCrMVsEmKHsyK4TEUW8gwA+wy5Svk+8KRLbW6sPJ+KTH231rD8CFC8Z7N36QiT9iWzk1lTW3jaREpPHcxOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LlPEQMlX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453AOpXu019249;
	Mon, 3 Jun 2024 20:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jL40qDH7QAg5YBT+Dh0Lwk9hblbSm05o2u4Yeq9i6A4=; b=LlPEQMlXQc+4ebTj
	2IKCThSUkkkwnYfbSWctr3mKoWZfR5bKvc/W8A+pR5o0fDlH02SOjzAFqgZAzBcx
	gdBPuaqdiPEynsuuNDZtUZXzJDEG2ayBtr/80tv53GqWsO7wx9U+BUF+DV0Whjbi
	TfVD6qoMk4vU0PAZWz6a1I/8MD8QJjYp0udF07p4zqQsMJm8CN2apzb2o6oDD8Fz
	ngMZZenohD5dQMoQ5k8XIWIdzEgR8KbcpIdAKuaRFP3BC05wWYyszMyezJ72LZ6e
	5xgKA7CXN6/lCxwCC+Ufec3w/VenKrZ0vcxaGfmoTiQyqYOQQjDoGswiVakq3qQH
	El5Bhg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw59msqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:59:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453Kxm8u018624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:59:48 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 13:59:43 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH V5 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
Date: Tue, 4 Jun 2024 02:28:59 +0530
Message-ID: <20240603205859.2212225-6-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603205859.2212225-1-quic_sibis@quicinc.com>
References: <20240603205859.2212225-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7UrCHnsZhEa1xolpettZwxSWVDHouAfq
X-Proofpoint-ORIG-GUID: 7UrCHnsZhEa1xolpettZwxSWVDHouAfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 mlxlogscore=947 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030168

Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 63 ++++++++++++++++----------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index df31ca0f497c..1929c34ae70a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -69,8 +69,8 @@ CPU0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD0>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD0>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 
 			L2_0: l2-cache {
@@ -86,8 +86,8 @@ CPU1: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD1>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD1>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -97,8 +97,8 @@ CPU2: cpu@200 {
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD2>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD2>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -108,8 +108,8 @@ CPU3: cpu@300 {
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD3>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD3>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -119,8 +119,8 @@ CPU4: cpu@10000 {
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD4>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD4>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 
 			L2_1: l2-cache {
@@ -136,8 +136,8 @@ CPU5: cpu@10100 {
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD5>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD5>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -147,8 +147,8 @@ CPU6: cpu@10200 {
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD6>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD6>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -158,8 +158,8 @@ CPU7: cpu@10300 {
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD7>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD7>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -169,8 +169,8 @@ CPU8: cpu@20000 {
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
 			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD8>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD8>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 
 			L2_2: l2-cache {
@@ -186,8 +186,8 @@ CPU9: cpu@20100 {
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD9>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD9>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -197,8 +197,8 @@ CPU10: cpu@20200 {
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
 			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD10>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD10>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -208,8 +208,8 @@ CPU11: cpu@20300 {
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
 			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD11>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD11>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER_C4>;
 		};
 
@@ -309,6 +309,21 @@ scm: scm {
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
+
+		scmi {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
-- 
2.34.1


