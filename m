Return-Path: <linux-arm-msm+bounces-42720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A419F72D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 03:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03D0418877C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 02:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30B5194080;
	Thu, 19 Dec 2024 02:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V2qnf5sF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041CF1850AF;
	Thu, 19 Dec 2024 02:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734576158; cv=none; b=lXHJCC/0gaLppj/pgaI1f7XPZKIapF/qXcQej42KCbEDznaY/HCXSlhWNxFHk33wIrT0fkSiiv5N30UivduQRwwi8T5uskAJLpfuRpqQnq3PXIDQRoGcp2sHs34c16iX59Vxs0iSdAqpuiVqi4WodYHVlZqEzaF8crOA1sZ373k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734576158; c=relaxed/simple;
	bh=Ioy/HDHbSH1wRhze1kQ0MjRGJlfMAmx9AFNs6TdA9QI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vEmJLu+j+se4XwjHLUCSFeStUTgIDXSUj7MKB5dcChsFpQrjhmx2dsEgYwSv0rWn2eEaQtETcAJEgEvAbh4IhmII+txLItMybt62QFfc2XT7lHkG6akWmHybT8D5Wxi5MQeJ7t/WqvdVfkcNBCyre90KprSkFRe/h9s2Wy13/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V2qnf5sF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIMhcoG028895;
	Thu, 19 Dec 2024 02:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7oHuk/KVS/M2XrJbCF0V/X
	wx46OYW57NZeJQWRAgu40=; b=V2qnf5sFtMOqsZ6R3w/dikt77FKb20ZxlqIUm/
	8u6tRSro3TuAE983NiXZqf9HEwMfXDt+LQRmdYCpZgovn2wfKDG/GhJOqr3nc3XB
	pndul5uFKc9MsaDRb9tUeBUDER0F6yywqYEdjAGWuHS+qdQ5gjkhXvPrrXFy5oG2
	PlRXSVIT8/3t3RMZz/zH6nuU5p4FNZUUl+aGgDc2c3jqHDdioS6Vc2A5XA2PIiyq
	auq3ZA6f6/GL2biG9BKg/2KO009387MxYyJ8pIKjzMul2CA9If3s1x/6ic1FNae2
	XVCSPyMUel4VRqNq5jkaGhoGc9H72Hf8aSTr45/6h7fX+aWA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m7eb0edy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 02:42:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ2gT6O005336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 02:42:29 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 18:42:26 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] arm64: dts: qcom: qcs8300: Add coresight nodes
Date: Thu, 19 Dec 2024 10:42:08 +0800
Message-ID: <20241219024208.3462358-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: -t7B50-e1w8-0JBYyUw1q3WNZqQxsbyH
X-Proofpoint-ORIG-GUID: -t7B50-e1w8-0JBYyUw1q3WNZqQxsbyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=965 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190016

Add following coresight components for QCS8300 platform.
It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
TPDM, TPDA and TMC ETF.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
Changes in V2:
1. Rebased on tag next-20241204.
2. Padding the register address to 8 bits.
Link to V1 - https://lore.kernel.org/linux-arm-msm/20240929-add_coresight_devices_for_qcs8300-v1-1-4f14e8cb8955@quicinc.com/

Changes in V3:
1. Correct the subject prefix.
2. Remove all disbaled devices to avoid confusion.
Link to V2 - https://lore.kernel.org/linux-arm-msm/20241205084418.671631-1-quic_jiegan@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 1695 +++++++++++++++++++++++++
 1 file changed, 1695 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 73abf2ef9c9f..55c75cdb39ef 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -293,6 +293,18 @@ system_sleep: domain-sleep {
 		};
 	};
 
+	dummy_eud: dummy-sink {
+		compatible = "arm,coresight-dummy-sink";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&swao_rep_out1>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs8300", "qcom,scm";
@@ -798,6 +810,1689 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		stm@4002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x04002000 0x0 0x1000>,
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
+						remote-endpoint = <&funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@4004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					qdss_tpda_in1: endpoint {
+						remote-endpoint = <&qdss_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint = <&funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@400f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0400f000 0x0 0x1000>;
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
+						remote-endpoint = <&qdss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@4041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04041000 0x0 0x1000>;
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
+					funnel0_in6: endpoint {
+						remote-endpoint = <&qdss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel0_out: endpoint {
+						remote-endpoint = <&qdss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04042000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@4 {
+					reg = <4>;
+
+					funnel1_in4: endpoint {
+						remote-endpoint = <&apss_funnel1_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel1_in5: endpoint {
+						remote-endpoint = <&dlct0_funnel_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel1_in6: endpoint {
+						remote-endpoint = <&dlmm_funnel_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel1_in7: endpoint {
+						remote-endpoint = <&dlst_ch_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel1_out: endpoint {
+						remote-endpoint = <&qdss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@4045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04045000 0x0 0x1000>;
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
+					qdss_funnel_in0: endpoint {
+						remote-endpoint = <&funnel0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					qdss_funnel_in1: endpoint {
+						remote-endpoint = <&funnel1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_funnel_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@4841000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04841000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					prng_tpdm_out: endpoint {
+						remote-endpoint = <&dlct0_tpda_in19>;
+					};
+				};
+			};
+		};
+
+		tpdm@4850000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04850000 0x0 0x1000>;
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
+					pimem_tpdm_out: endpoint {
+						remote-endpoint = <&dlct0_tpda_in25>;
+					};
+				};
+			};
+		};
+
+		tpdm@4860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04860000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlst_ch_tpdm0_out: endpoint {
+						remote-endpoint = <&dlst_ch_tpda_in8>;
+					};
+				};
+			};
+		};
+
+		tpda@4864000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04864000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@8 {
+					reg = <8>;
+
+					dlst_ch_tpda_in8: endpoint {
+						remote-endpoint = <&dlst_ch_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlst_ch_tpda_out: endpoint {
+						remote-endpoint = <&dlst_ch_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4865000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04865000 0x0 0x1000>;
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
+					dlst_ch_funnel_in0: endpoint {
+						remote-endpoint = <&dlst_ch_tpda_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					dlst_ch_funnel_in4: endpoint {
+						remote-endpoint = <&dlst_funnel_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					dlst_ch_funnel_in6: endpoint {
+						remote-endpoint = <&gdsp_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlst_ch_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@4980000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04980000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					turing2_tpdm_out: endpoint {
+						remote-endpoint = <&turing2_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4983000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04983000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					turing2_funnel_in0: endpoint {
+						remote-endpoint = <&turing2_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					turing2_funnel_out0: endpoint {
+						remote-endpoint = <&gdsp_tpda_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@4ac0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04ac0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlmm_tpdm0_out: endpoint {
+						remote-endpoint = <&dlmm_tpda_in27>;
+					};
+				};
+			};
+		};
+
+		tpda@4ac4000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04ac4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1b {
+					reg = <27>;
+
+					dlmm_tpda_in27: endpoint {
+						remote-endpoint = <&dlmm_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlmm_tpda_out: endpoint {
+						remote-endpoint = <&dlmm_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4ac5000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04ac5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					dlmm_funnel_in0: endpoint {
+						remote-endpoint = <&dlmm_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlmm_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@4ad0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04ad0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlct0_tpdm0_out: endpoint {
+						remote-endpoint = <&dlct0_tpda_in26>;
+					};
+				};
+			};
+		};
+
+		tpda@4ad3000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04ad3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@13 {
+					reg = <19>;
+
+					dlct0_tpda_in19: endpoint {
+						remote-endpoint = <&prng_tpdm_out>;
+					};
+				};
+
+				port@19 {
+					reg = <25>;
+
+					dlct0_tpda_in25: endpoint {
+						remote-endpoint = <&pimem_tpdm_out>;
+					};
+				};
+
+				port@1a {
+					reg = <26>;
+
+					dlct0_tpda_in26: endpoint {
+						remote-endpoint = <&dlct0_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_tpda_out: endpoint {
+						remote-endpoint = <&dlct0_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4ad4000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04ad4000 0x0 0x1000>;
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
+					dlct0_funnel_in0: endpoint {
+						remote-endpoint = <&dlct0_tpda_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					dlct0_funnel_in4: endpoint {
+						remote-endpoint = <&ddr_funnel5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in5>;
+					};
+				};
+			};
+		};
+
+		funnel@4b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04b04000 0x0 0x1000>;
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
+					aoss_funnel_in6: endpoint {
+						remote-endpoint = <&aoss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					aoss_funnel_in7: endpoint {
+						remote-endpoint = <&qdss_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_funnel_out: endpoint {
+						remote-endpoint = <&etf0_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etf: tmc@4b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x04b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etf0_in: endpoint {
+						remote-endpoint = <&aoss_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etf0_out: endpoint {
+						remote-endpoint = <&swao_rep_in>;
+					};
+				};
+			};
+		};
+
+		replicator@4b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x04b06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					swao_rep_in: endpoint {
+						remote-endpoint = <&etf0_out>;
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
+					swao_rep_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpda@4b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04b08000 0x0 0x1000>;
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
+					aoss_tpda_in0: endpoint {
+						remote-endpoint = <&aoss_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_tpda_in1: endpoint {
+						remote-endpoint = <&aoss_tpdm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					aoss_tpda_in2: endpoint {
+						remote-endpoint = <&aoss_tpdm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					aoss_tpda_in3: endpoint {
+						remote-endpoint = <&aoss_tpdm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					aoss_tpda_in4: endpoint {
+						remote-endpoint = <&aoss_tpdm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04b09000 0x0 0x1000>;
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
+						remote-endpoint = <&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04b0a000 0x0 0x1000>;
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
+						remote-endpoint = <&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04b0b000 0x0 0x1000>;
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
+						remote-endpoint = <&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04b0c000 0x0 0x1000>;
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
+						remote-endpoint = <&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@4b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04b0d000 0x0 0x1000>;
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
+						remote-endpoint = <&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		cti@4b13000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x04b13000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@4b80000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04b80000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					turing0_tpdm0_out: endpoint {
+						remote-endpoint = <&turing0_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@4b86000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04b86000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					turing0_tpda_in0: endpoint {
+						remote-endpoint = <&turing0_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					turing0_tpda_out: endpoint {
+						remote-endpoint = <&turing0_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4b87000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04b87000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					turing0_funnel_in0: endpoint {
+						remote-endpoint = <&turing0_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					turing0_funnel_out: endpoint {
+						remote-endpoint = <&gdsp_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		cti@4b8b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x04b8b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@4c40000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04c40000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					gdsp_tpdm0_out: endpoint {
+						remote-endpoint = <&gdsp_tpda_in8>;
+					};
+				};
+			};
+		};
+
+		tpda@4c44000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04c44000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					gdsp_tpda_in5: endpoint {
+						remote-endpoint = <&turing2_funnel_out0>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					gdsp_tpda_in8: endpoint {
+						remote-endpoint = <&gdsp_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					gdsp_tpda_out: endpoint {
+						remote-endpoint = <&gdsp_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4c45000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04c45000 0x0 0x1000>;
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
+					gdsp_funnel_in0: endpoint {
+						remote-endpoint = <&gdsp_tpda_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					gdsp_funnel_in4: endpoint {
+						remote-endpoint = <&turing0_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					gdsp_funnel_out: endpoint {
+						remote-endpoint = <&dlst_ch_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@4c50000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04c50000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlst_tpdm0_out: endpoint {
+						remote-endpoint = <&dlst_tpda_in8>;
+					};
+				};
+			};
+		};
+
+		tpda@4c54000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04c54000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@8 {
+					reg = <8>;
+
+					dlst_tpda_in8: endpoint {
+						remote-endpoint = <&dlst_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlst_tpda_out: endpoint {
+						remote-endpoint = <&dlst_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4c55000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04c55000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					dlst_funnel_in0: endpoint {
+						remote-endpoint = <&dlst_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlst_funnel_out: endpoint {
+						remote-endpoint = <&dlst_ch_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@4e00000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04e00000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr_tpdm3_out: endpoint {
+						remote-endpoint = <&ddr_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		tpda@4e03000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x04e03000 0x0 0x1000>;
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
+					ddr_tpda_in0: endpoint {
+						remote-endpoint = <&ddr_funnel0_out0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ddr_tpda_in1: endpoint {
+						remote-endpoint = <&ddr_funnel1_out0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					ddr_tpda_in4: endpoint {
+						remote-endpoint = <&ddr_tpdm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ddr_tpda_out: endpoint {
+						remote-endpoint = <&ddr_funnel5_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4e04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04e04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					ddr_funnel5_in0: endpoint {
+						remote-endpoint = <&ddr_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ddr_funnel5_out: endpoint {
+						remote-endpoint = <&dlct0_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@4e10000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04e10000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr_tpdm0_out: endpoint {
+						remote-endpoint = <&ddr_funnel0_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4e12000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04e12000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					ddr_funnel0_in0: endpoint {
+						remote-endpoint = <&ddr_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ddr_funnel0_out0: endpoint {
+						remote-endpoint = <&ddr_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@4e20000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x04e20000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr_tpdm1_out: endpoint {
+						remote-endpoint = <&ddr_funnel1_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@4e22000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x04e22000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					ddr_funnel1_in0: endpoint {
+						remote-endpoint = <&ddr_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ddr_funnel1_out0: endpoint {
+						remote-endpoint = <&ddr_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		etm@6040000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06040000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in0>;
+					};
+				};
+			};
+		};
+
+		etm@6140000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06140000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in1>;
+					};
+				};
+			};
+		};
+
+		etm@6240000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06240000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in2>;
+					};
+				};
+			};
+		};
+
+		etm@6340000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06340000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in3>;
+					};
+				};
+			};
+		};
+
+		etm@6440000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06440000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in4>;
+					};
+				};
+			};
+		};
+
+		etm@6540000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06540000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in5>;
+					};
+				};
+			};
+		};
+
+		etm@6640000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06640000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		etm@6740000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x06740000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		funnel@6800000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06800000 0x0 0x1000>;
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
+					apss_funnel0_in0: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_funnel0_in1: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					apss_funnel0_in2: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					apss_funnel0_in3: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					apss_funnel0_in4: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					apss_funnel0_in5: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					apss_funnel0_in6: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					apss_funnel0_in7: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel0_out: endpoint {
+						remote-endpoint = <&apss_funnel1_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@6810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06810000 0x0 0x1000>;
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
+					apss_funnel1_in0: endpoint {
+						remote-endpoint = <&apss_funnel0_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					apss_funnel1_in3: endpoint {
+						remote-endpoint = <&apss_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel1_out: endpoint {
+						remote-endpoint = <&funnel1_in4>;
+					};
+				};
+			};
+		};
+
+		cti@682b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0682b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@6860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06860000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@6861000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06861000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		tpda@6863000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x06863000 0x0 0x1000>;
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
+					apss_tpda_in0: endpoint {
+						remote-endpoint = <&apss_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_tpda_in1: endpoint {
+						remote-endpoint = <&apss_tpdm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					apss_tpda_in2: endpoint {
+						remote-endpoint = <&apss_tpdm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					apss_tpda_in3: endpoint {
+						remote-endpoint = <&apss_tpdm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					apss_tpda_in4: endpoint {
+						remote-endpoint = <&apss_tpdm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_tpda_out: endpoint {
+						remote-endpoint = <&apss_funnel1_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@68a0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x068a0000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@68b0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x068b0000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@68c0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x068c0000 0x0 0x1000>;
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
+						remote-endpoint = <&apss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		cti@68e0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x068e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@68f0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x068f0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6900000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06900000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		pmu@9091000 {
 			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0x0 0x9091000 0x0 0x1000>;
-- 
2.34.1


