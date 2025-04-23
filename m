Return-Path: <linux-arm-msm+bounces-55097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10612A98541
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D10F7A8963
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2207266595;
	Wed, 23 Apr 2025 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kED/IxTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF3325C803;
	Wed, 23 Apr 2025 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399907; cv=none; b=gSrMoGM3VaVcu6xH4jYYgggCeuAyozRI9Cn8UXvZC+EcQvfKm3kmoc8IY+/TQN6DBPxKCxe7FPtlEmGXEzQjlhvqcf2osubAZIS8dg6fprGjOcXfnGEt9qt9BykZvGAFoSbW63PsWFb2+VP7AQ9UkI4+cX7lbq2LNgwAmffGazQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399907; c=relaxed/simple;
	bh=bPd+yE5v28sxN5mmpGyok/5F0q3o3tjesAjvhNEFEzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lcQ7cW+daPO+HxKpKowesedRAda4g5IZMoI2V29r4dY3WJzBaszS512kihSQ8IAe3dcUtC+Tvu0RkudR0niY9BHk5C2k0EdXc5tADD42vstC8oTeCwQq/JoU2EghgN2pzg9w9H7jwDjRGalPeJ6Ns5dhLegLskAQtHeFYI/HnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kED/IxTV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0inmh016690;
	Wed, 23 Apr 2025 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GYj79Ywh7Uk3teTl+vFWKtYC4t+cnzkkx6SFf1tj4A=; b=kED/IxTVOifSaIYD
	gS55DqOtuavss+UsDWWx7rc0wfA9Fqa9haqqICaRiBaEx0ZM3ikxRLWg3pUr7LjY
	6artQnKSFIwsO3Q1dj+zwSZW1iy4lkoFLMfojY9phyg+gF6WQCFLh0I5ASR+8SB/
	+ZvbiDxCP187/3sQo2Ank38bDa8aWrhkiNrKmkQoWshWNpeaPbGIBIF/Kmj9rWNn
	A8vnEsRPyDQxY73VFNzKqVZzLQkYSmZ77zSGHHidFmO3pvTvHpEyfrzA+G7OadQw
	7e3DswXXHkTHqoFVjt9gFufyMuYhV5rkyW3ljJ9WEWmyc/o4nG9Tv5XJVcIztJVh
	Vj6bsA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09k4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9ILhN016138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:21 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 02:18:15 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 23 Apr 2025 17:17:41 +0800
Subject: [PATCH 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
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
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745399876; l=3327;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=bPd+yE5v28sxN5mmpGyok/5F0q3o3tjesAjvhNEFEzU=;
 b=FXDQ7H01vPdCuzUjZcAlHrw3M9a4Ckq2ArYJ7eMRamKmnhYjHP1Fi4HWsE0HBL5pmZBxGThwT
 ew34RIgs37xCsJioAu1P5YkrDViVos8SSqx5eMOget/1bLGcW7aZpwK
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tzsfADEld9gnI2FSG_uK2wIyqv4P0HiW
X-Proofpoint-ORIG-GUID: tzsfADEld9gnI2FSG_uK2wIyqv4P0HiW
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808b05d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=GkrJffXkLMCu9anYvR4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MiBTYWx0ZWRfXzXLkLHBMAOaW gfdYvVeYlrXQjJ4VcvtIWScyKQI4qkq4KlWv1ArsvPBUP7S00w60SbjNjyX73gyfq1nHzdplnOv bQMmQjaI1JaBoQJk2TdSDFJ2WpMrySkRbybBlIhKxOW3wOmxvdlfolAIUyYhxRpslxYvOGEbX5n
 mvQ9eMIo3SFmRCiosZzLmLgfc51do5dX1VYxXoLQbSM1+R5KmmZH7r0s6E3qNHn/LShmcgl+WEL BXiIcQoLXLTcJoRO2itVGK+fGmCYvgGjibkUrwwa5PhcDOnd+aR+gpvlOMG5uMcigCKTk+/wadm YnEHl4nKscVYZx+8Q/dcZdQS2Tn+zlSqNcGJqcE0g7xuNgRTF1psVA3OKvo+hHxJ89ict6k6lVt
 umJTRghvNjHTJJ4uhwTW+7LLoE+CjBJomiOIfixpinj61COIBqUzj28WWmuIr390UdanG9By
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=257 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230062

Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
remoteproc functionality.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index fe9fda6b71c4..c0e2d8699d05 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -503,6 +503,16 @@ smem_region: smem@86000000 {
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
@@ -3124,6 +3134,44 @@ cti@7900000 {
 			clock-names = "apb_pclk";
 		};
 
+		remoteproc_cdsp: remoteproc-cdsp@8300000 {
+			compatible = "qcom,qcs615-cdsp-pas", "qcom,sm8150-cdsp-pas";
+			reg = <0x0 0x08300000 0x0 0x100000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "handover",
+					  "ready",
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
@@ -3761,6 +3809,44 @@ usb_2_dwc3: usb@a800000 {
 				maximum-speed = "high-speed";
 			};
 		};
+
+		remoteproc_adsp: remoteproc-adsp@62400000 {
+			compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
+			reg = <0x0 0x62400000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "handover",
+					  "ready",
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
2.46.0


