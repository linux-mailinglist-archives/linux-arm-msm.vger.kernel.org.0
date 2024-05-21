Return-Path: <linux-arm-msm+bounces-20091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625818CA5AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 03:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83E891C2120B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 01:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC1DBA53;
	Tue, 21 May 2024 01:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KAGAcbND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408033DD;
	Tue, 21 May 2024 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716254434; cv=none; b=BK1qJcHeMfK8Wzt2f47D7hN8QT6KaRRLuQ5zSx4Qgwxq4Tpway0dtCSR5S1VQqik76rdQ6Bfbux2vBm0okJ7nCwCULlpN7AKiNrj1XfoiRlZzRnJJxE1DZ4q9ElAvXHR4esbvnQnsDe+IzsvHSWNzIowKke3sqPnpejw1CnyoBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716254434; c=relaxed/simple;
	bh=JEu8nHoeIV+AscV8v5M5zQF519FeLzEheycQCRfQClY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvDzL1UWdBV46W+pSV00Z4BJCG8QKsgRnH2VHfs1BcORqpst6iBR7y/kT/vifG9TN9PmzBUkTmGkGRGQeGg4IuIZnnphJmfdKxCveYJBKnPviQcryfVPBUtTXQs8WAzyqK+Es0xqhSuVpxuZY+nVYtsOZcciJ+GP7//CTls6a0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KAGAcbND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KNQelT003043;
	Tue, 21 May 2024 01:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Uv5ze7dsW9K8/MJ6Rdc8EU3vfFPwbm5+WcbxMh/C64A=; b=KA
	GAcbNDq1jHylVErZjTxXnZ6DytwZeHHf65QEWbpdZ5dKlL4iqUhsu2kaaxcLADZ5
	mxqGyYSPTzMS6Cny6IlpYzNlQAZ5wnnx00EY/j+auuhrNcOQiMySw41BnMJ0wQVO
	v0ikVjxD1HHKOe1flpir2FdePxlo/udW6OujbmzgM4XNCwSf7rYSYZWL0JCPC5nv
	VluZVuHy0B3zmOjNFOQeNOeyI4LRU9mp/UmfFQa6TDWkIckrGKDhfJ39ZaNdBb3p
	mGm7bQVXyqCPL2omsVIWWCrFawhpsY+yNYpS9+STKX9Vcya86snwNEbmFSuFosQb
	r3POo/xsdeVkDqh6l2Tw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psnchu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:20:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44L1KDks014040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:20:13 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 May 2024 18:20:07 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao
 Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song
 Chai <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>
Subject: [PATCH v1 1/1] arm64: dts: qcom: Add coresight nodes for SA8775p
Date: Tue, 21 May 2024 09:19:46 +0800
Message-ID: <20240521011946.3148712-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521011946.3148712-1-quic_jiegan@quicinc.com>
References: <20240521011946.3148712-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Op5CKaSj-LQiJRitLtxAUnFcHdu5ZIXs
X-Proofpoint-ORIG-GUID: Op5CKaSj-LQiJRitLtxAUnFcHdu5ZIXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_13,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210009

Add following coresight components on SA8775p, TMC/ETF, TPDM,
dynamic Funnel, TPDA and ETM.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 926 ++++++++++++++++++++++++++
 1 file changed, 926 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 231cea1f0fa8..884700d251dc 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -205,6 +205,19 @@ core3 {
 		};
 	};
 
+	dummy-sink {
+		compatible = "arm,coresight-dummy-sink";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint =
+					<&swao_rep_out1>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
@@ -1644,6 +1657,919 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		stm: stm@4002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x4002000 0x0 0x1000>,
+				  <0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base", "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint =
+						<&funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@4003000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x4003000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qdss_tpdm0_out: endpoint {
+						remote-endpoint =
+						<&qdss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@4004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x4004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint =
+						<&funnel0_in6>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					qdss_tpda_in0: endpoint {
+						remote-endpoint =
+						<&qdss_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					qdss_tpda_in1: endpoint {
+						remote-endpoint =
+						<&qdss_tpdm1_out>;
+					};
+				};
+			};
+		};
+
+		tpdm@400f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x400f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qdss_tpdm1_out: endpoint {
+						remote-endpoint =
+						<&qdss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@4041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					funnel0_out: endpoint {
+						remote-endpoint =
+						<&qdss_funnel_in0>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+					funnel0_in6: endpoint {
+						remote-endpoint =
+						<&qdss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					funnel0_in7: endpoint {
+						remote-endpoint =
+						<&stm_out>;
+					};
+				};
+			};
+		};
+
+		funnel@4042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4042000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					funnel1_out: endpoint {
+						remote-endpoint =
+						<&qdss_funnel_in1>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@4 {
+					reg = <4>;
+					funnel1_in4: endpoint {
+						remote-endpoint =
+						<&apss_funnel1_out>;
+					};
+				};
+			};
+		};
+
+		funnel@4045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4045000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					qdss_funnel_out: endpoint {
+						remote-endpoint =
+						<&aoss_funnel_in7>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					qdss_funnel_in0: endpoint {
+						remote-endpoint =
+						<&funnel0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					qdss_funnel_in1: endpoint {
+						remote-endpoint =
+						<&funnel1_out>;
+					};
+				};
+			};
+		};
+
+		funnel@4b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					aoss_funnel_out: endpoint {
+						remote-endpoint =
+						<&etf0_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+					aoss_funnel_in6: endpoint {
+						remote-endpoint =
+						<&aoss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					aoss_funnel_in7: endpoint {
+						remote-endpoint =
+						<&qdss_funnel_out>;
+					};
+				};
+			};
+		};
+
+		tmc_etf: tmc@4b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x4b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					etf0_out: endpoint {
+						remote-endpoint =
+						<&swao_rep_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					etf0_in: endpoint {
+						remote-endpoint =
+						<&aoss_funnel_out>;
+					};
+				};
+			};
+		};
+
+		replicator@4b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x4b06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					swao_rep_out1: endpoint {
+						remote-endpoint =
+						<&eud_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					swao_rep_in: endpoint {
+						remote-endpoint =
+						<&etf0_out>;
+					};
+				};
+			};
+		};
+
+		tpda@4b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x4b08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint =
+						<&aoss_funnel_in6>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aoss_tpda_in0: endpoint {
+						remote-endpoint =
+						<&aoss_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aoss_tpda_in1: endpoint {
+						remote-endpoint =
+						<&aoss_tpdm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					aoss_tpda_in2: endpoint {
+						remote-endpoint =
+						<&aoss_tpdm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					aoss_tpda_in3: endpoint {
+						remote-endpoint =
+						<&aoss_tpdm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					aoss_tpda_in4: endpoint {
+						remote-endpoint =
+						<&aoss_tpdm4_out>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x4b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm0_out: endpoint {
+						remote-endpoint =
+						<&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x4b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm1_out: endpoint {
+						remote-endpoint =
+						<&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x4b0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm2_out: endpoint {
+						remote-endpoint =
+						<&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x4b0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm3_out: endpoint {
+						remote-endpoint =
+						<&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x4b0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm4_out: endpoint {
+						remote-endpoint =
+						<&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		aoss_cti: cti@4b13000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x4b13000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@6040000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6040000 0x0 0x1000>;
+			cpu = <&CPU0>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in0>;
+					};
+				};
+			};
+		};
+
+		etm@6140000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6140000 0x0 0x1000>;
+			cpu = <&CPU1>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in1>;
+					};
+				};
+			};
+		};
+
+		etm@6240000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6240000 0x0 0x1000>;
+			cpu = <&CPU2>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in2>;
+					};
+				};
+			};
+		};
+
+		etm@6340000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6340000 0x0 0x1000>;
+			cpu = <&CPU3>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in3>;
+					};
+				};
+			};
+		};
+
+		etm@6440000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6440000 0x0 0x1000>;
+			cpu = <&CPU4>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm4_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in4>;
+					};
+				};
+			};
+		};
+
+		etm@6540000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6540000 0x0 0x1000>;
+			cpu = <&CPU5>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm5_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in5>;
+					};
+				};
+			};
+		};
+
+		etm@6640000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6640000 0x0 0x1000>;
+			cpu = <&CPU6>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm6_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		etm@6740000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x6740000 0x0 0x1000>;
+			cpu = <&CPU7>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm7_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		funnel@6800000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x6800000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					apss_funnel0_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel1_in0>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					apss_funnel0_in0: endpoint {
+						remote-endpoint =
+						<&etm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					apss_funnel0_in1: endpoint {
+						remote-endpoint =
+						<&etm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					apss_funnel0_in2: endpoint {
+						remote-endpoint =
+						<&etm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					apss_funnel0_in3: endpoint {
+						remote-endpoint =
+						<&etm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					apss_funnel0_in4: endpoint {
+						remote-endpoint =
+						<&etm4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					apss_funnel0_in5: endpoint {
+						remote-endpoint =
+						<&etm5_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					apss_funnel0_in6: endpoint {
+						remote-endpoint =
+						<&etm6_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					apss_funnel0_in7: endpoint {
+						remote-endpoint =
+						<&etm7_out>;
+					};
+				};
+			};
+		};
+
+		funnel@6810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x6810000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					apss_funnel1_out: endpoint {
+						remote-endpoint =
+						<&funnel1_in4>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					apss_funnel1_in0: endpoint {
+						remote-endpoint =
+						<&apss_funnel0_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					apss_funnel1_in3: endpoint {
+						remote-endpoint =
+						<&apss_tpda_out>;
+					};
+				};
+			};
+		};
+
+		tpdm@6860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x6860000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					apss_tpdm3_out: endpoint {
+						remote-endpoint =
+						<&apss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@6861000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x6861000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					apss_tpdm4_out: endpoint {
+						remote-endpoint =
+						<&apss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		tpda@6863000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x6863000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					apss_tpda_out: endpoint {
+						remote-endpoint =
+						<&apss_funnel1_in3>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					apss_tpda_in0: endpoint {
+						remote-endpoint =
+						<&apss_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					apss_tpda_in1: endpoint {
+						remote-endpoint =
+						<&apss_tpdm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					apss_tpda_in2: endpoint {
+						remote-endpoint =
+						<&apss_tpdm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					apss_tpda_in3: endpoint {
+						remote-endpoint =
+						<&apss_tpdm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					apss_tpda_in4: endpoint {
+						remote-endpoint =
+						<&apss_tpdm4_out>;
+					};
+				};
+			};
+		};
+
+		tpdm@68a0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x68a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					apss_tpdm0_out: endpoint {
+						remote-endpoint =
+						<&apss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@68b0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x68b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					apss_tpdm1_out: endpoint {
+						remote-endpoint =
+						<&apss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@68c0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x68c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					apss_tpdm2_out: endpoint {
+						remote-endpoint =
+						<&apss_tpda_in2>;
+					};
+				};
+			};
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
-- 
2.34.1


