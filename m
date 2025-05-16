Return-Path: <linux-arm-msm+bounces-58167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DC1AB94C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 05:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51ECC7B0FCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEDB25A2DE;
	Fri, 16 May 2025 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gEkivLca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD83258CC8;
	Fri, 16 May 2025 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366088; cv=none; b=CRnfC3ocSfUi7I3XXiQRm7jWiBkUJJowpt3yOLBhC2z56uqrtnFnvoI4ahu3bAStF26lszrvlqs6f6+kS3yq9JHmbaYhq+LchMHDuunA7KlAWIa5drGqBhSXq7HCsd5tButbSQ342LqATWiiooLyjOKHIcOA8HenYsMedOHaRt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366088; c=relaxed/simple;
	bh=RNKCGAoL/2YbXZeP5hod7uwDS7fxe7vN5ocLocVsg1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IDlGmMNmdq5i4RBQiA3I0Ps6mkl5Qb94EJnUsN+hjIQ0SvP70/Vx+gVp2D/EShJqF5TIAmZ3diNwyCDm5Lm/u6U0V/pc3shuhFwt/EtcQQ8pjjwzLA0PvlTvziN22fhF0Oo4t323kYMDKEuslFx1pdpxcPagt9BDcHxe0bqJBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gEkivLca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3R309007950;
	Fri, 16 May 2025 03:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5snZJCId6AHZo9ZdcqNHC0LfZ/wN+R9d9BF+5z/cSo=; b=gEkivLcaIgtCncKz
	mGhk5Q2jOHbeikmRIHOy32v9PXcAJRXzW2Caf/xFOs6CyzxS2zOjaC21R2hRHrE5
	hyq3AdrNY0L2rpOjKFRJUGW3xIAu6vNnMTJQ9uC+dcDSt/rAk1T21beXqqSVfGfD
	DyaiqxoXNsRafWnPpZJRShjFmZqg/1ukro3ZWH+ti59wcEspB8TJ/O2vsrEHlpx2
	fVhMxdWIoVGCuddw3obRrCbWdxuS9Z1aPdgqEni6C5FeBh3g3A+hc6LHtxgR18o3
	7RHpEOgzjTcYjBx/usYD0QMs5VIdelb6NUUpoA3M/knSnnSzEjj44FSqZRR7DgWs
	D9WDYA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq0d59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:28:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G3S21c024725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:28:02 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 May 2025 20:27:56 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 16 May 2025 11:27:06 +0800
Subject: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
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
        "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747366059; l=3433;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=RNKCGAoL/2YbXZeP5hod7uwDS7fxe7vN5ocLocVsg1M=;
 b=ztL1xlHu0H6ul2WvW0UKdpOU+m3+2K92RRDkDYV/eOsLhtSKsr9y5vm3X1p24Ksw7YZ5kKHu+
 oEVYEbF0AkJDNhOoOLZy1fAySVK8Z1B+SqT/N466+Yq8YW3sXQTYFV/
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nkRUy4VYu8C927jKChtM6k9lD6xedi8W
X-Proofpoint-ORIG-GUID: nkRUy4VYu8C927jKChtM6k9lD6xedi8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMSBTYWx0ZWRfX3w4EWCQNu6X1
 mQM107BBH5pDLqDbEJydezBTnYD/ZlcHah2NhENKgAYzkf6lR/raUfCVzH2TKS+wjdD0NpDI0LZ
 rpanFSnaYJcWHmvSd4t9IrYjOIlJH0c76h2JfdYD8OE2F04dIT0O70KemreYI4yN6qILA6BPX1P
 1iKn89xeD0jfqFSQoKmTPOOEy2QxthIBwFGem0C5QJMm94onsxKGTDmGpESfJk++/FYuvYXi1di
 asO1fSJxuTqOYX2SGpOc6kDGWDM6cJt90ZPSOlEATlicVoVXXMIFLbq6PfK9xycUFweIFUK1HP2
 mRME+ufdNsgDCqvnH5nKZ+We7aVALC3QouQIqSGxXA4uzmAlh7jqYZjrEeHoA8K6aLmDQlkllvj
 bsRxpTnFWlB3oB1sCI26oVBTxD4PPImaF4hZ5k5PUAUSUesMUuuozUwcbJ+mQWs9Fcpr2M63
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6826b0c3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=GkrJffXkLMCu9anYvR4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=265 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160031

Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
remoteproc functionality.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index dd54cfe7b7a6f03c1aa658ce3014d50478df5931..b7d649822a35fd30366ecab2eeb7b2fced1b369d 100644
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
@@ -3751,6 +3799,44 @@ usb_2_dwc3: usb@a800000 {
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


