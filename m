Return-Path: <linux-arm-msm+bounces-36450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE89B63BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E79A81C20F67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323EB1E909E;
	Wed, 30 Oct 2024 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g2pKL/jW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8C1E9079;
	Wed, 30 Oct 2024 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293759; cv=none; b=FMq9thQj/YjjFdzKGNVr+IGXVauOBA6955deoi9WwdYNpd4rmhmsXQVfuMOW+Ezs/HZTDGXiChNX4MXXMNiLfmY9O5HCU1bxnqZ8SIF0GQV/cm5ZSTU3F3htvXBgnxIkkICYGbwguOHTGrbJMUhTFav1UBdSzIL5DpM6/dIslBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293759; c=relaxed/simple;
	bh=5nVY/DqRUJr8j6Hiw3QsL2AAJLRZSafOrbKFmNWKHks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWlEBrVsqpkk0fxm5gmAWUXgwGtGnUCR8peWzvs5j2PjHajgXGhPHVDB9m1oXkr+VKLdTKuMaVXr/qPdeXtC6Lri2OwpoZolLG0WE7HNhHPRupWzhwyHOykEjwPXB6W0CPO9xl9Gg4xTAQm+h2zhrUI+1bZaHyq80cgVlvgeYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g2pKL/jW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9MQNF019775;
	Wed, 30 Oct 2024 13:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eiz73eEzUqQKm7NMJHTtilhRLF12VrpCyYnzRfI4OWo=; b=g2pKL/jWCaGlMZGl
	IwPeNmjNIn5c53rijycOM9zLx8w9am2hg1Y3kMpRfeD1NWzLNRuLwFc1S9rwhxDZ
	93yW4imjgrEsDLZY8bb0e+toIhM3pfFRDM40lm8nKIA/Y3dlsH2g+oOpXGZrxugj
	ctjrARRuqzIFkKjZxLaDD/a5imJ2WSdP+ckufDxP6bHDD2ZiWDrKNHqizwaVYvqq
	xiv3zRMdsn8nRTuSYZFdnotmuhrZnR6kotYgcQ1XC2N40nlZMviXL/VrTtFRv8kZ
	dyXV/atHUX+YENC+rigATr7RghCGsoltIt26JV8dSq+Jn97noUNiZLLzjYq+vMtq
	abISVg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqv5bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:09:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UD99b0008738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:09:09 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 06:09:04 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH V7 2/2] arm64: dts: qcom: x1e80100: Enable cpufreq
Date: Wed, 30 Oct 2024 18:38:40 +0530
Message-ID: <20241030130840.2890904-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030130840.2890904-1-quic_sibis@quicinc.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9eHfRjPZfLvNOqpuKyfYjMAYELSXEtKI
X-Proofpoint-GUID: 9eHfRjPZfLvNOqpuKyfYjMAYELSXEtKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=895 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300103

Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 63 ++++++++++++++++----------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index be93e482bb28..9c6d223b1b60 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -71,8 +71,8 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd0>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 
 			l2_0: l2-cache {
@@ -88,8 +88,8 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd1>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -99,8 +99,8 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd2>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -110,8 +110,8 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd3>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -121,8 +121,8 @@ cpu4: cpu@10000 {
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd4>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd4>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 
 			l2_1: l2-cache {
@@ -138,8 +138,8 @@ cpu5: cpu@10100 {
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd5>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd5>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -149,8 +149,8 @@ cpu6: cpu@10200 {
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd6>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -160,8 +160,8 @@ cpu7: cpu@10300 {
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd7>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -171,8 +171,8 @@ cpu8: cpu@20000 {
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
 			next-level-cache = <&l2_2>;
-			power-domains = <&cpu_pd8>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd8>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 
 			l2_2: l2-cache {
@@ -188,8 +188,8 @@ cpu9: cpu@20100 {
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_2>;
-			power-domains = <&cpu_pd9>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd9>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -199,8 +199,8 @@ cpu10: cpu@20200 {
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
 			next-level-cache = <&l2_2>;
-			power-domains = <&cpu_pd10>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd10>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -210,8 +210,8 @@ cpu11: cpu@20300 {
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
 			next-level-cache = <&l2_2>;
-			power-domains = <&cpu_pd11>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd11>, <&scmi_dvfs 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
 		};
 
@@ -310,6 +310,21 @@ scm: scm {
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 			qcom,dload-mode = <&tcsr 0x19000>;
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


