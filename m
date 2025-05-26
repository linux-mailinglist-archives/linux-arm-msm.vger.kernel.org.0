Return-Path: <linux-arm-msm+bounces-59373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3194AC38FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4846916BAEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAB81DE4E0;
	Mon, 26 May 2025 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HOb+jmCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABBF1DE3B5;
	Mon, 26 May 2025 05:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236952; cv=none; b=YUu0WDKfNPT6vuQmAPLy/ncjXTzMX8SxIROrV6UNNQ0U6gw3uFo3Cazc0dQ5ZSX5Cgp12mnPtFhWvjCgIx+/DnEj33kvRSh0Bdnccp/FjhGKbnyXgkKqSeYeO/0ASBNtyDpwSsir+1FTudtSRzJU1szPrhVkRhQFtpOudBae8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236952; c=relaxed/simple;
	bh=JIoTOwqCKAkbqzegb79llPEyntenAEIlwofYkVaCJG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KQMVmlIrIPUKlHsDZKNgTo8XbI+pCq7d9BJhLiDjDZg8S1kYcC0noxBTg4EA1PYyXtHqPRGSsOcviheLM0tJdCEP2PMQ9wEWemmSkcczwRHv+Q48zTmPdwqk6Kt9vv6mNdsmh4DpN4RmOdY5ctq/DWL3hICD/pQDStPsZ7VUFSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HOb+jmCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNTg1Q013173;
	Mon, 26 May 2025 05:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdVAYpAps+uv4k/mJFNZBFKvMs3oNDo7MyXsoUBazfw=; b=HOb+jmCoKly3drdK
	2aVP1RzkwXGhzGmZgNOUv+Cq2jikj2NWtrei0mTEl5P8CAaafqH14M6nYyzGAd+f
	giluwSbIg4S+7UJeRcDUkj982ejMRDkhOjGp6FE7uAvGLHsSlJCvclhy+/R3v3ax
	V5iTbjHX+xKOu2vx4q3fj2EiPbBA72OQFo/9PSKCrm5qYbbM9ufdQ3y22rQ3GIcP
	6jePYsh+AviIRw2UdY8uAsjU3deByRbxjkjlDsoMO6eucfk5QhMIjBiGb2q7ITnz
	RnAIg707dixfccDJYNY9+9n5b6hsDS5pqSnM0oIAxtuL5dFI8Ne1lLXRIrkLejoQ
	DL4Xhw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52uu5t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q5MQX1012790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:26 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 22:22:20 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 26 May 2025 13:21:51 +0800
Subject: [PATCH v4 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-add_qcs615_remoteproc_support-v4-5-06a7d8bed0b5@quicinc.com>
References: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
In-Reply-To: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748236923; l=3500;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=JIoTOwqCKAkbqzegb79llPEyntenAEIlwofYkVaCJG0=;
 b=U8/GeiFwypXLDMu6sZf20UIQm57Lk6KhKrbg+Cei0cFl87LaUqLtAiJzyUhzlqMsXavxVazUF
 RGLZeJPwsP+CYdH5xVBX39zoCpocVnE9F8QUYA+yqXdrNB6O6JM7pXX
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0MiBTYWx0ZWRfX1UrN1KKdH4X4
 z3q9cFdehm7DOchP7y2xV3K5QmfZwssqgO/KyTiqCSdBBinW2YxopY/iFuK89/LqUHNPW3DPDVx
 WUJiOLUiLBRVAw7bTdDh2THL/h6wF23B7j7oR553sq2SnLa+HRk71AtH6j9wL+pbHA2Fo0mGW6T
 SjiYXO6ahqQP+MyImR8LrhoJbaaE/0UZzDbRAzwdAD+b7vKUtz62BG2bo1W8fZGA5D3gaDcrXQv
 dT8aeI+DtMVQLi5gybDuPmgvu7aEbK+8oBDV3swHztXupJJNW5aA5HqAJPRD2hisnshbYUfN32s
 Q8q0mfNXdbClxf1nsj/kAf4UTuAhcarqS/7xwMb5E71nfsidmlYjH+weBBVuvA6Pf502CTGdvlX
 k42IPdjaMsVTgrdbVDoJ1N8rxiEqOE0hWt4gALJIbt43X17hIeRg9cXOdnYtvZjaJyhqJLyi
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=6833fa93 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=GkrJffXkLMCu9anYvR4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Tzml3lvSXRbAHbkkmcXiYKymVZ5YAijs
X-Proofpoint-GUID: Tzml3lvSXRbAHbkkmcXiYKymVZ5YAijs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=266
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260042

Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
remoteproc functionality.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 9220d6727136b34fa42b5eeb3eb00938d21a5adf..c31a314a1f5f2a67569f81297eef96e1bb2a698f 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -473,6 +473,16 @@ smem_region: smem@86000000 {
 			no-map;
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		rproc_cdsp_mem: rproc-cdsp@93b00000 {
+			reg = <0x0 0x93b00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		rproc_adsp_mem: rproc-adsp@95900000 {
+			reg = <0x0 0x95900000 0x0 0x1e00000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -3117,6 +3127,44 @@ cti@7900000 {
 			clock-names = "apb_pclk";
 		};
 
+		remoteproc_cdsp: remoteproc@8300000 {
+			compatible = "qcom,qcs615-cdsp-pas", "qcom,sm8150-cdsp-pas";
+			reg = <0x0 0x08300000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			power-domain-names = "cx";
+
+			memory-region = <&rproc_cdsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&apss_shared 4>;
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
+
 		pmu@90b6300 {
 			compatible = "qcom,qcs615-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0x0 0x090b6300 0x0 0x600>;
@@ -3750,6 +3798,44 @@ usb_2_dwc3: usb@a800000 {
 				maximum-speed = "high-speed";
 			};
 		};
+
+		remoteproc_adsp: remoteproc@62400000 {
+			compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
+			reg = <0x0 0x62400000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			power-domain-names = "cx";
+
+			memory-region = <&rproc_adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink_edge: glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&apss_shared 24>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
 	};
 
 	arch_timer: timer {

-- 
2.34.1


