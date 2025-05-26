Return-Path: <linux-arm-msm+bounces-59371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F42AC38F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A735C170362
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3511D86F2;
	Mon, 26 May 2025 05:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qplx3dsk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B84F1D5ABA;
	Mon, 26 May 2025 05:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236945; cv=none; b=rjffR9tP0Q0wJN7r2OhR+roCeY8MqvjqcwG+aRGW1n2SND9oDbyXlD8CvatdRRqDGA94yA010dgEchzP2puK50fwWAPbYrLdvWUP0T7h7tEe9TOIK+xyV99tz1FPhYUEIFAXIW3bOOvQWdHKNWQ5Aqd8Qf/7rB5x2tkncq2qn38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236945; c=relaxed/simple;
	bh=vtNNSMGqRlfh+AHmNsHypMY/yECEjNpBNYCvK2ocKT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=l3kAonVm8y8Aodc7lTo3/OcoggQh0BN7lXjJ7rDz1F7ApuL5oElozwQLZqXB5WlL4BG/mSDxQGtsbXfnpPeRIoB/IM1Y9UgbuNNn1bXHZ2QK5voI4WI/b01hZJn7S5gDbd3rNaKJdui2nYJRDHwJGSAshf6KNBI2WH6mziZP8Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qplx3dsk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNo24q016460;
	Mon, 26 May 2025 05:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GdxuLiHm/i08nHO+xW9FWnPt9pI1rVcdfhRvaCEf7A=; b=Qplx3dsk65NkXEIB
	uqQpv4MjZ5tZEQ/IbkA6Nu6mICDf/3LJz4pVhouD63NaQV9dnFW+gwOEhPDXsYvd
	0oWbrQzuF1mWfni+6OqnX562BfTXyLFQC6xGQ5oNxSUREYZMmXzM45RmZSKFdb+r
	MqCd0k9WmnlJ9Eciol572Ru1/nYSpcVl389k3ksTvwaVUdYT21km3HCRxlAJu3TU
	o3wIpr45J0FPKAm4pA9x4zJhxKkqvprnMxYSixThlnHFilz+JK0iESItJk5sIz/c
	Zwa8fNaH0+Ugbrg+kZujpAtP4xnhT8uSBPvH6nmFSmC6wEBCjXoaAqdjl+NAttd1
	wjZTqw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52uu5st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q5MJgh030936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:19 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 22:22:13 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 26 May 2025 13:21:49 +0800
Subject: [PATCH v4 3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-add_qcs615_remoteproc_support-v4-3-06a7d8bed0b5@quicinc.com>
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
        "Kyle
 Deng" <quic_chunkaid@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748236923; l=2010;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=N0U92Kez/dEsxNQiT1EAryQZbXu9ZZM2b8KuONFz5xA=;
 b=cnvK28O56wHtYXEi/E8lF6MAdKU8i2o9DcMWE869jt0LFtd8zCe0BhOLrwWdKr3ggul9q5zPI
 nOM3F4X5UkiB5R0qDf20iQnzkCBqIqSc4oREnMLqBkyBKNfDs1G2zf5
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0MiBTYWx0ZWRfX+wOp7q9q07hq
 bYOuVjlxOPccEluU1yzIX4f6wytdvmWbP+RkWA62oIp9lCPCzQardQ9Okea2HsitFbBg3htJDKO
 73oOQ/J1d8cOkUA3j7CJq13Gpk2ALAZA6TtAFTNTtSLHLNWz9XzVajpBA9BlZz/P7b0lruJYc0F
 92NFUBzeGMrt3BQmV51UIlfPLEXNBEF3x8BDla+IyMnO9EnH+izAiSbRqViASbHKFp7URSHoF4o
 iklp+QgQ08Dfi9f7Sgyqpt2EXb/ZfYbsIo11vKq8maj5NWM4Zv3ftDkO/0hnSSUSYczdSUN+v6W
 aVJrcbpjejrm4RcoJB1bGioJWs2eV3u79m6UrzAiBGqwJJkRnwEWmgYqspHFaYCceaGXiMRCut1
 BKb/p5XTxZx9NMEiIXchxjUOEhPF9f8S4sy8uBDCZitphjylyxXrBLPDritRfRStHNnkd3S4
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=6833fa8c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=_p9LeRYUILtONmBEkPUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uNv5iFalOdcsrBgWx-h740Bs_YZA_sdg
X-Proofpoint-GUID: uNv5iFalOdcsrBgWx-h740Bs_YZA_sdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=600
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260042

From: Kyle Deng <quic_chunkaid@quicinc.com>

The Shared Memory Point to Point (SMP2P) protocol facilitates
communication of a single 32-bit value between two processors.
Add these two nodes for remoteproc enablement on QCS615 SoC.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bb8b6c3ebd03f086b44493024ce782acf6f9e1ed..3f1f674884e5e9b3b01ec75bcea11d9c2ea6355c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -332,6 +332,50 @@ mc_virt: interconnect-2 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+		/* On this platform, bit 26 (normally SLPI) is repurposed for ADSP */
+		mboxes = <&apss_shared 26>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apss_shared 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 		opp-shared;

-- 
2.34.1


