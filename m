Return-Path: <linux-arm-msm+bounces-25339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABCD928480
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D041F23ED1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CC81494D9;
	Fri,  5 Jul 2024 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XCAe/vfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E0B1494B5;
	Fri,  5 Jul 2024 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170104; cv=none; b=R7d3ShePzJywebpoAkCBvd+0urQ0Ogetk1bRrhmFcyNJIOb71mMRb9aPcxjvdFpc9UBbzgchkxWzvwkkaDErobA8LFOz5TqY5dqidtrpdBjhgLY6hHpDqgnXcjMfwgG08lTv9uba5yEFIb5vUp5HFS3gKti3h9geDOnseL3OyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170104; c=relaxed/simple;
	bh=doH3hx+JU3F/QLduutkMlWqB5OXqf1VorHmASnUiDzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAXuoSDCk9LD9vhTuuxtgyxwuEl36tgxhBM5/6zEwJ3OIfs/m/VpcYg0qBRJN1P0tWuhcxhad6oZmUiFiVq956xoFwOBj9iW8gHJh/O8d/bTgj8inX4dyVuZiV+UjGXZp9RNPtz/NdbnlS4N6/CC8XV3c/MocEjVn7xbhXE4gDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XCAe/vfg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464N21SA023751;
	Fri, 5 Jul 2024 09:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFKzmUotHbJUVuaVB42pEWH4u/5IP7VbsvU44n6vwas=; b=XCAe/vfgzu8VRgSb
	1jhtxlz+KH/lv0qhbwQdn/NEJTl7NyRCi/3N0uIYknm1iJR0D7snuHbC8Mhb05SD
	L9GJ9fvGCZRSSTLFkt6s0jtmv3xHvmQKwmcgd/UN2/AjIG0iu/BTRRfezwYbPKV0
	sghjAq0aclhM8OrZHWNAm1epKiSuhM3a6JjA/Q9SBCT8SG1Adb9jWwf6a7kqidW8
	mk/yPYbWNaWABXts3tiXqfz3emMBO37EnfTsEiCg6U5AjIYwE724AunQy0WGuCsB
	rwRqUOPNDny2AIj6TPx/6NYzbDDiMKiEIobW5dOVJ2lEhTXoL0aBfd0NFwTgcMBu
	EusW6g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405vxfhwgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 09:01:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46591Uls002839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 09:01:30 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 02:01:25 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Song
 Chai" <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add CCU and ETR nodes for SA8775p
Date: Fri, 5 Jul 2024 17:00:49 +0800
Message-ID: <20240705090049.1656986-5-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: IuTPZkbsn-aC-n-JyvWhbejFPnSGUf3U
X-Proofpoint-ORIG-GUID: IuTPZkbsn-aC-n-JyvWhbejFPnSGUf3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050067

Add CCU and ETR device tree nodes to enable related functions.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 163 ++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..ef4df5e59ab3 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1664,6 +1664,38 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		ccu@4001000 {
+			compatible = "qcom,coresight-ccu";
+			reg = <0x0 0x4001000 0x0 0x1000>;
+			reg-names = "ccu-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccu_in0: endpoint {
+						qcom,ccu-atid-offset = <0xf8>;
+						remote-endpoint =
+						<&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccu_in1: endpoint {
+						qcom,ccu-atid-offset = <0x108>;
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
@@ -1867,6 +1899,129 @@ qdss_funnel_in1: endpoint {
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
+						<&ccu_in0>;
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
+						<&ccu_in1>;
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
@@ -1942,6 +2097,14 @@ out-ports {
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


