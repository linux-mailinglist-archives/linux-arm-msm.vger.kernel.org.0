Return-Path: <linux-arm-msm+bounces-31237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC59970C5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 05:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6231F223A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 03:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C351AE025;
	Mon,  9 Sep 2024 03:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="em0hMnqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4BE1AD9DE;
	Mon,  9 Sep 2024 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725852968; cv=none; b=eN6oo/j3iTrTywV7cDS0AyIQAmqYwFiYxYR+2zl9icno23pfXgE2Kdj4qq8EShG9HK7/ruxtw5zoabkldejhgJKskfo4EVAZPKZ6eS3TDXr6K3D/dVzmTgEV88I0rwcA76JCiV6ge+1M0q/uXyjisr2btwQwIRxkKAEytiNKWVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725852968; c=relaxed/simple;
	bh=+4lnVmz1HkbC5gG9G3ZPV4NnrsBsSmQNOr/IMQ2D4sY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ltwm+/Fs8y3vZZRnBTydFiRGT7mR0Po7ciVukVQeCc9eXarewgwe/jZm7YPL5guKejgyF3ABDu5Lc2Xq3gnzxOsToGSQDIygakDCn2EXvvz2+/q9PdptuYIrpOgdB8aR5W8iFOoQ2oBobDjgAGctChXu2aHpd7zpofUZMsSUFW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=em0hMnqR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488NTALp023914;
	Mon, 9 Sep 2024 03:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	osMgB0mb3XqW8YTk8xRMOzQT5xdZ8ZkzCS7pK5HdoYo=; b=em0hMnqRUCGiPtzI
	fQFPxzDiO5uCrMxqUDNxBfC87qiUj8wcRebgZsjLMMzoQWo0f+TD/Q/x8I81bw6A
	cBAQvoqBOFYoau9N0Yy6Fm9HMT0gaTOwEEOYedoeb2b8mp/31+4YdkLIZaHXzfh1
	z3bXXjN3imF1xj4WhX1PmpvCGih50Fmixau07nm/WL+uPGEfmiTwVBDDhGYKJr7w
	y8RKg8vvZWXQoC1PwPtbbQB2bAilN/fwitY2Dbe0h909MltUeBCN1o0BZbbfF4b0
	YeNVFJhVvrkxKsTheZfgpL1JN9qfgapigw8FXQFR90DazGcZ6zHsujbP4NlcPl7T
	jrmtaw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6p1jf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 03:35:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4893ZlTN001745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 03:35:47 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 8 Sep 2024 20:35:42 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v5 5/5] arm64: dts: qcom: Add CTCU and ETR nodes for SA8775p
Date: Mon, 9 Sep 2024 11:34:58 +0800
Message-ID: <20240909033458.3118238-6-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
References: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jvnNOCDB0sv-W--CU1BlIuN43YUNlREz
X-Proofpoint-GUID: jvnNOCDB0sv-W--CU1BlIuN43YUNlREz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090027

Add CTCU and ETR nodes in DT to enable related functions.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 160 ++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..a8b509495440 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1664,6 +1664,35 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		ctcu@4001000 {
+			compatible = "qcom,sa8775p-ctcu";
+			reg = <0x0 0x4001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ctcu_in0: endpoint {
+						remote-endpoint =
+						<&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ctcu_in1: endpoint {
+						remote-endpoint =
+						<&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm: stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x4002000 0x0 0x1000>,
@@ -1867,6 +1896,129 @@ qdss_funnel_in1: endpoint {
 			};
 		};
 
+		replicator@4046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x4046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint =
+						<&etr_rep_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint =
+						<&swao_rep_out0>;
+					};
+				};
+			};
+		};
+
+		tmc_etr: tmc@4048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x4048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04c0 0x00>;
+
+			arm,scatter-gather;
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint =
+						<&ctcu_in0>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint =
+						<&etr_rep_out0>;
+					};
+				};
+			};
+		};
+
+		replicator@404e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x404e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					etr_rep_out0: endpoint {
+						remote-endpoint =
+						<&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					etr_rep_out1: endpoint {
+						remote-endpoint =
+						<&etr1_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint =
+						<&qdss_rep_out0>;
+					};
+				};
+			};
+		};
+
+		tmc_etr1: tmc@404f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x404f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04a0 0x40>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint =
+						<&ctcu_in1>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint =
+						<&etr_rep_out1>;
+					};
+				};
+			};
+		};
+
 		funnel@4b04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x0 0x4b04000 0x0 0x1000>;
@@ -1942,6 +2094,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+					swao_rep_out0: endpoint {
+						remote-endpoint =
+						<&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 					swao_rep_out1: endpoint {
-- 
2.34.1


