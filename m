Return-Path: <linux-arm-msm+bounces-58166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734EAB94BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 05:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B3EE1BA85AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6E1257AC9;
	Fri, 16 May 2025 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q3rUHN/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067D24291B;
	Fri, 16 May 2025 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366085; cv=none; b=NjeR7SzC/IiCecrecyrDso0au1LFUqHaZjROkJJzdl0FWJ1pZ/KYMSA8bNUfjUyJXNkwfg5IYf7X++cnyMaKGure1OHq5S7kxaNZvp3BDJXTAqknDxlIvUoxC4VES9fiFswlukQpGIC9GGc24KjzZxEZmFurs5aDarOWzjz8hkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366085; c=relaxed/simple;
	bh=c41pPDH44WkCetCmZSGXLDyzgSNsrAWy8fPrfRJLSLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Hkg95AY1TWQcdWv6KORggD/3ygh14fSrAHd6+MWxobPBHJ8uB4q3TI3cleIb1geQGnfiPK/7DV/6ubYlCQxmZiW2PTZFzNF4aRiaPEWb2nzZyL7/nHCcAMZS4jQ4OULqYjOlQsqEiI+L+Cc1Snjt+f5XhueclIoVW8pXnD0dHnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q3rUHN/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFPpk018755;
	Fri, 16 May 2025 03:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTMtoLfWpeEiolBO4XT7cnBKerh5cYYxW2CLYjqvMWM=; b=Q3rUHN/MxSciSRLd
	dBTAn/1KoepC8xei9dcg0te7x6urdlkFWoRfARoxeZLXv2nONRzK2Ft2dCuhc/IG
	4BY4rNh03WQ1esVzJjoILvaWXpwnoI9/WCRBE9U7Z3tSCvKbhKyTJF2vdwifiC6E
	0gpSGjJEtxWOiYS+I7LROGYj5XGcowNej5Ew0YRHbUjf6NKItCroz37rdXZPddH9
	hImupK/n3eviXRVuk5jAtmKtanBhds79aQlCEkzi+AEEiq483TBdCN5JFe5n77Vr
	EA6NaI1q3DJrk2evNtuk9dEj5kbATjsxDvv2JJ6qBIkhMaK/MQV+ka1LuM7wU6A5
	OdQCYg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnrbyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G3RtYD032419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:55 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 May 2025 20:27:50 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 16 May 2025 11:27:04 +0800
Subject: [PATCH v3 3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250516-add_qcs615_remoteproc_support-v3-3-ad12ceeafdd0@quicinc.com>
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
        "Kyle
 Deng" <quic_chunkaid@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747366059; l=1949;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=NcfdfmwyyqKE14GPsrDqMvai2DwuKCS1MxDLcXsimdA=;
 b=nPcqXZa1CrDuS1lpGPagG/O//g4Phs0jpIRVhkiBOVrPROXzxiW4ZMOjB7v3TLGJfNsIhtq+P
 ZApCD/juTJNDBncXUbWxkHWvG2NA9wARmJvMbCsh/9c0FLuaEB8SyOM
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Fc7Z_RRuE4jP5CtzqfwPa8NUIVuL7dD-
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6826b0bc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=_p9LeRYUILtONmBEkPUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Fc7Z_RRuE4jP5CtzqfwPa8NUIVuL7dD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMSBTYWx0ZWRfX5C32akwep4jp
 F4p0PODe9PVrMTx23l+hA0dALaevhDExxaigHXJ02zSwJo2x5X4A0pmvDB3iA0w3UykRPWLyIxt
 M1K9IqH395pa6XHHYGsJyxID6zjp4g5oVQtn/Qp0au+l/mFj2MsocUJn1nkBBZVfhEsUAw3VU19
 KKTQ8qcnEbhF1qFK8/nbTjwULO/dUgau8iZQvm5WKqacO7myPquwm8wLQZeQAQFvW8V6KloPhqJ
 22EZVLG8tfw0yhljo9Egt9hWx7P2F5ekooHjWdlxZt/CTbUjkDuCtD73rS8Cmf/DOZuodomegEx
 dwWqmnqyIaSafyclfulW2gMVgIplR7fzoMTZjvpRcIeb5sK3+CJaMmtjvWbCiJR6PkIeUJ1/A/u
 Af1t5XuwMgxdoK6/j7rUxNGuJ3GI5gd8OZDKIUnmXJlTtYp7NHEU0IoboRc1X8JlcD4k9bfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=607 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160031

From: Kyle Deng <quic_chunkaid@quicinc.com>

The Shared Memory Point to Point (SMP2P) protocol facilitates
communication of a single 32-bit value between two processors.
Add these two nodes for remoteproc enablement on QCS615 SoC.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f08ba09772f333adaade2d30897cf50c555a4d12..f922349758d11ec7fda1c43736a4bf290916e67f 100644
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


