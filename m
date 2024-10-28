Return-Path: <linux-arm-msm+bounces-36093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7519B21E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 02:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BEF1F2116F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 01:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CB2219E4;
	Mon, 28 Oct 2024 01:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V7Jw0tX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8780433C9;
	Mon, 28 Oct 2024 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730078386; cv=none; b=Jz3rEdQUFkgzPTm5pc7VQ6RiRl2gFa+uargmZ3r+1n2mH58ZXl9WWLPX2EYwuIZGAcJuwQ23N27ogIsCS3kyF+nStYgJhPMQfTDRVGt6JJqF23cDRpO9WTZB2vecvVLxzTsYonhKnYUpDkbYaCDNWP24JaMap57NU+T3CPLq8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730078386; c=relaxed/simple;
	bh=UjYYyqz69JtmdkD9cKUOQ8ZZv2csvS+wuwKJfLZr2Jg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s795aw6RoroDjO70pQa/2cnolG/OXNdSVHyasrFv6iG77GFHzj0ny8+0XNJw/TGFvJt95YaTZbZ00aNCK+aKToReJC1YZ33FWBFm5naEPR5dbAc1JkY8JaDFWtj5iZt5CwpmEgtXsCIxuvjEDydj91/ItnkARxIzgcCdBxTS6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V7Jw0tX9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNfKBw011999;
	Mon, 28 Oct 2024 01:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vOeto8lYy01feEqL6v8H5+
	MkeoFl1sGXizWygZO7mTg=; b=V7Jw0tX92Z8h2eZULLLoVQr4kZD8mf9OjzBrVX
	6U9lpE3+O+MuyR1ZJc+H1VkstmdNBADJtAmsLgBWCe5aSx8z3kqts3p7P1U/c7dI
	750sQEdoGedBXB9T2eECdpQG9xhSImj3I33mtKkcnGr7RaKAPcTPWiyr/uq2VQ1W
	n83l8uqEulYCyyYdYlkE5htPLY3q2W69hiUK6uAJFkjVGSw0DXMdJpymZ6vFle3M
	490ozgb1ck+GgOuLsUsxScj9Y45epxpepc4nLgkRNdtrq0LCi7+ZCnEnjBLJW9kZ
	pjtwjcxA9FQ14dwdg99ZKB3WpmFbJ26UOUkzsCe/LLKmXp4A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x38rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 01:19:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S1JTPG008003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 01:19:29 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Oct 2024 18:19:24 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: Add coresight nodes for QCS615
Date: Mon, 28 Oct 2024 09:19:06 +0800
Message-ID: <20241028011906.3769675-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: PUsjJ3IteBIeptgMsReXNH2-U3JUHqlo
X-Proofpoint-GUID: PUsjJ3IteBIeptgMsReXNH2-U3JUHqlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=932 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280009

Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, dynamic
Funnel, TPDA, Replicator and ETM.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
Already checked by command:dtbs_check W=1.

Dependencies:
1. Depends on qcs615 base dtsi change:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-5-e37617e91c62@quicinc.com/
2. Depends on qcs615 AOSS_QMP change:
https://lore.kernel.org/linux-arm-msm/20241017025313.2028120-4-quic_chunkaid@quicinc.com/

Changes in V2:
1. Fix format issue: "dummy-sink" from "dummy_sink".
2. Pad the non-zero address part to 8 hex digits with leading
zeroes.
Links to V1 - https://lore.kernel.org/linux-arm-msm/20241017030005.893203-1-quic_jiegan@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 1632 ++++++++++++++++++++++++++
 1 file changed, 1632 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index a36debf36f82..426a2e9ccc8e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -202,6 +202,18 @@ l3_0: l3-cache {
 		};
 	};
 
+	dummy_eud: dummy-sink {
+		compatible = "arm,coresight-dummy-sink";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&replicator_swao_out1>;
+				};
+			};
+		};
+	};
+
 	idle-states {
 		entry-method = "psci";
 
@@ -488,6 +500,1626 @@ qup_uart0_rx: qup-uart0-rx-state {
 			};
 		};
 
+		stm@6002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x06002000 0x0 0x1000>,
+			      <0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@6004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x06004000 0x0 0x1000>;
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
+
+					tpda_qdss_in0: endpoint {
+						remote-endpoint = <&tpdm_center_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_qdss_in4: endpoint {
+						remote-endpoint = <&funnel_monaq_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					tpda_qdss_in5: endpoint {
+						remote-endpoint = <&funnel_ddr_0_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_qdss_in6: endpoint {
+						remote-endpoint = <&funnel_turing_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					tpda_qdss_in7: endpoint {
+						remote-endpoint = <&tpdm_vsense_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tpda_qdss_in8: endpoint {
+						remote-endpoint = <&tpdm_dcc_out>;
+					};
+				};
+
+				port@9 {
+					reg = <9>;
+
+					tpda_qdss_in9: endpoint {
+						remote-endpoint = <&tpdm_prng_out>;
+					};
+				};
+
+				port@b {
+					reg = <11>;
+
+					tpda_qdss_in11: endpoint {
+						remote-endpoint = <&tpdm_qm_out>;
+					};
+				};
+
+				port@c {
+					reg = <12>;
+
+					tpda_qdss_in12: endpoint {
+						remote-endpoint = <&tpdm_west_out>;
+					};
+				};
+
+				port@d {
+					reg = <13>;
+
+					tpda_qdss_in13: endpoint {
+						remote-endpoint = <&tpdm_pimem_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_qatb_in>;
+					};
+				};
+			};
+		};
+
+		funnel@6005000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06005000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_qatb_in: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_qatb_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		cti@6010000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06010000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6011000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06011000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6012000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06012000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6013000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06013000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6014000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06014000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6015000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06015000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6016000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06016000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6017000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06017000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6018000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06018000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6019000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06019000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@601a000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0601a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@601b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0601b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@601c000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0601c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@601d000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0601d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@601e000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0601e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@601f000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0601f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		funnel@6041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&funnel_qatb_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_merg_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@6042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06042000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@3 {
+					reg = <3>;
+
+					funnel_in1_in3: endpoint {
+						remote-endpoint = <&replicator_swao_out0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					funnel_in1_in4: endpoint {
+						remote-endpoint = <&tpdm_wcss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in1_in7: endpoint {
+						remote-endpoint = <&funnel_apss_merg_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in1_out: endpoint {
+						remote-endpoint = <&funnel_merg_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@6045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06045000 0x0 0x1000>;
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
+
+					funnel_merg_in0: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_merg_in1: endpoint {
+						remote-endpoint = <&funnel_in1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_merg_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		replicator@6046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x06046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator0_in: endpoint {
+						remote-endpoint= <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					replicator0_out1: endpoint {
+						remote-endpoint= <&replicator1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@6047000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x06047000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_merg_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&replicator0_in>;
+					};
+				};
+			};
+		};
+
+		replicator@604a000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x0604a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator1_in: endpoint {
+						remote-endpoint= <&replicator0_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					replicator1_out: endpoint {
+						remote-endpoint= <&funnel_swao_in6>;
+					};
+				};
+			};
+		};
+
+		cti@683b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0683b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@6840000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06840000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+			status = "disabled";
+
+			out-ports {
+				port {
+					tpdm_vsense_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@684c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0684c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_prng_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in9>;
+					};
+				};
+			};
+		};
+
+		tpdm@6850000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06850000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_pimem_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in13>;
+					};
+				};
+			};
+		};
+
+		tpdm@6860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06860000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_turing_out: endpoint {
+						remote-endpoint = <&funnel_turing_in>;
+					};
+				};
+			};
+		};
+
+		funnel@6861000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06861000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_turing_in: endpoint {
+						remote-endpoint = <&tpdm_turing_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_turing_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in6>;
+					};
+				};
+			};
+		};
+
+		cti@6867000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06867000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@6870000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06870000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+			status = "disabled";
+
+			out-ports {
+				port {
+					tpdm_dcc_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in8>;
+					};
+				};
+			};
+		};
+
+		tpdm@699c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0699c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+			status = "disabled";
+
+			out-ports {
+				port {
+					tpdm_wcss_out: endpoint {
+						remote-endpoint = <&funnel_in1_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@69c0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x069c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_monaq_out: endpoint {
+						remote-endpoint = <&funnel_monaq_in>;
+					};
+				};
+			};
+		};
+
+		funnel@69c3000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x069c3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_monaq_in: endpoint {
+						remote-endpoint = <&tpdm_monaq_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_monaq_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@69d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x069d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+			status = "disabled";
+
+			out-ports {
+				port {
+					tpdm_qm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in11>;
+					};
+				};
+			};
+		};
+
+		tpdm@6a00000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06a00000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+			status = "disabled";
+
+			out-ports {
+				port {
+					tpdm_ddr_out: endpoint {
+						remote-endpoint = <&funnel_ddr_0_in>;
+					};
+				};
+			};
+		};
+
+		cti@6a02000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06a02000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6a03000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06a03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6a10000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06a10000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6a11000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06a11000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		funnel@6a05000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06a05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_ddr_0_in: endpoint {
+						remote-endpoint = <&tpdm_ddr_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_ddr_0_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in5>;
+					};
+				};
+			};
+		};
+
+		tpda@6b01000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x06b01000 0x0 0x1000>;
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
+
+					tpda_swao_in0: endpoint {
+						remote-endpoint = <&tpdm_swao0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_swao_in1: endpoint {
+						remote-endpoint = <&tpdm_swao1_out>;
+					};
+
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_swao_out: endpoint {
+						remote-endpoint = <&funnel_swao_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b02000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b02000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+			status = "disabled";
+
+			out-ports {
+				port {
+					tpdm_swao0_out: endpoint {
+						remote-endpoint = <&tpda_swao_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b03000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+			status = "disabled";
+
+			out-ports {
+				port {
+					tpdm_swao1_out: endpoint {
+						remote-endpoint = <&tpda_swao_in1>;
+					};
+				};
+			};
+		};
+
+		cti@6b04000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b05000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b06000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b07000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b07000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		funnel@6b08000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06b08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					funnel_swao_in6: endpoint {
+						remote-endpoint= <&replicator1_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_swao_in7: endpoint {
+						remote-endpoint= <&tpda_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_swao_out: endpoint {
+						remote-endpoint = <&tmc_etf_swao_in>;
+					};
+				};
+			};
+		};
+
+		tmc@6b09000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x06b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_swao_in: endpoint {
+						remote-endpoint= <&funnel_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etf_swao_out: endpoint {
+						remote-endpoint= <&replicator_swao_in>;
+					};
+				};
+			};
+		};
+
+		replicator@6b0a000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x06b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_swao_in: endpoint {
+						remote-endpoint = <&tmc_etf_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_swao_out0: endpoint {
+						remote-endpoint = <&funnel_in1_in3>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_swao_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		cti@6b21000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b21000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@6b48000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b48000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_west_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in12>;
+					};
+				};
+			};
+		};
+
+		cti@6c13000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06c13000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6c20000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06c20000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@6c28000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06c28000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_center_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in0>;
+					};
+				};
+			};
+		};
+
+		cti@6c29000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06c29000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6c2a000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06c2a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@7020000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07020000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7040000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07040000 0x0 0x1000>;
+			cpu = <&cpu0>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&funnel_apss_in0>;
+					};
+				};
+			};
+		};
+
+		cti@7120000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07120000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7140000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07140000 0x0 0x1000>;
+			cpu = <&cpu1>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&funnel_apss_in1>;
+					};
+				};
+			};
+		};
+
+		cti@7220000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07220000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7240000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07240000 0x0 0x1000>;
+			cpu = <&cpu2>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&funnel_apss_in2>;
+					};
+				};
+			};
+		};
+
+		cti@7320000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07320000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7340000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07340000 0x0 0x1000>;
+			cpu = <&cpu3>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&funnel_apss_in3>;
+					};
+				};
+			};
+		};
+
+		cti@7420000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07420000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7440000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07440000 0x0 0x1000>;
+			cpu = <&cpu4>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm4_out: endpoint {
+						remote-endpoint = <&funnel_apss_in4>;
+					};
+				};
+			};
+		};
+
+		cti@7520000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07520000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7540000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07540000 0x0 0x1000>;
+			cpu = <&cpu5>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm5_out: endpoint {
+						remote-endpoint = <&funnel_apss_in5>;
+					};
+				};
+			};
+		};
+
+		cti@7620000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07620000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7640000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07640000 0x0 0x1000>;
+			cpu = <&cpu6>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm6_out: endpoint {
+						remote-endpoint = <&funnel_apss_in6>;
+					};
+				};
+			};
+		};
+
+		cti@7720000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07720000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		etm@7740000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x07740000 0x0 0x1000>;
+			cpu = <&cpu7>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm7_out: endpoint {
+						remote-endpoint = <&funnel_apss_in7>;
+					};
+				};
+			};
+		};
+
+		funnel@7800000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x07800000 0x0 0x1000>;
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
+
+					funnel_apss_in0: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_apss_in1: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					funnel_apss_in2: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_apss_in3: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					funnel_apss_in4: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel_apss_in5: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_apss_in6: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_apss_in7: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_apss_out: endpoint {
+						remote-endpoint = <&funnel_apss_merg_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@7810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x07810000 0x0 0x1000>;
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
+
+					funnel_apss_merg_in0: endpoint {
+						remote-endpoint = <&funnel_apss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					funnel_apss_merg_in2: endpoint {
+						remote-endpoint = <&tpda_olc_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_apss_merg_in3: endpoint {
+						remote-endpoint = <&tpda_llm_silver_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					funnel_apss_merg_in4: endpoint {
+						remote-endpoint = <&tpda_llm_gold_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel_apss_merg_in5: endpoint {
+						remote-endpoint = <&tpda_apss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_apss_merg_out: endpoint {
+						remote-endpoint = <&funnel_in1_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@7830000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x07830000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_olc_out: endpoint {
+						remote-endpoint = <&tpda_olc_in>;
+					};
+				};
+			};
+		};
+
+		tpda@7832000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x07832000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_olc_in: endpoint {
+						remote-endpoint = <&tpdm_olc_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_olc_out: endpoint {
+						remote-endpoint = <&funnel_apss_merg_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@7860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x07860000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_apss_out: endpoint {
+						remote-endpoint = <&tpda_apss_in>;
+					};
+				};
+			};
+		};
+
+		tpda@7862000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x07862000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_apss_in: endpoint {
+						remote-endpoint = <&tpdm_apss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_apss_out: endpoint {
+						remote-endpoint = <&funnel_apss_merg_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@78a0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x078a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_silver_out: endpoint {
+						remote-endpoint = <&tpda_llm_silver_in>;
+					};
+				};
+			};
+		};
+
+		tpdm@78b0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x078b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_gold_out: endpoint {
+						remote-endpoint = <&tpda_llm_gold_in>;
+					};
+				};
+			};
+		};
+
+		tpda@78c0000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x078c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_llm_silver_in: endpoint {
+						remote-endpoint = <&tpdm_llm_silver_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_llm_silver_out: endpoint {
+						remote-endpoint = <&funnel_apss_merg_in3>;
+					};
+				};
+			};
+		};
+
+		tpda@78d0000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x078d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_llm_gold_in: endpoint {
+						remote-endpoint = <&tpdm_llm_gold_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_llm_gold_out: endpoint {
+						remote-endpoint = <&funnel_apss_merg_in4>;
+					};
+				};
+			};
+		};
+
+		cti@78e0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x078e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@78f0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x078f0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@7900000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x07900000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x9160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";
-- 
2.34.1


