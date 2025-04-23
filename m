Return-Path: <linux-arm-msm+bounces-55095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4CDA98534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09611B63AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1212025CC7F;
	Wed, 23 Apr 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RV+E8GGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA921FF51;
	Wed, 23 Apr 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399903; cv=none; b=nbRsfVatyfP6TPHzoMG7gjCQh4SQTyzK3dx+3HcNNjMjT6uM/ZkdD7iSjtpsZZfhXz0S69HSRY5MCg1kYq2nhW2c9h+dRoEniAhgv66LM+eW61bAWla0lX5dnr0+teIynR/kVGo5LsF0itxQmN3Xt9dUbvqU+YyUJiX8Kh/3lpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399903; c=relaxed/simple;
	bh=WbCTVke9FNPrOGMgo8mxnZmhJKmoIr3EPdG7COLvt6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=u6ro6DKCt+2mMfWku4mS1WXb8IJ9JEJ0Vzlhihmmb7TGsYX7dnKoHKlqQUo5E3vzEF+hPeqZDenmv7LPAB+igMWeR50tAwcgNnuIT6WTkguIjABe1dwemSx5NOmxyau6EiRczyG449f25d/hvp2+mFIDXXst+cJJvwHrRF9bqxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RV+E8GGK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAhj013399;
	Wed, 23 Apr 2025 09:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2X93bSbSW838PetdgSiWTpJYhN7eNCyBArEdBWvbmko=; b=RV+E8GGK8hlfz8wj
	kDXFXD3iWoKvGXR3qtLrsuWxD9OnKuLJDIZh2kWgCWwE4vuCnlcU2WJ9yG+OJcEx
	+bRjuwmEIMXr5OOajN3g7rSuUaeTI7/FPSvdvZefzBZbm+jHNgAlTM0rLkuIz5K3
	KGmrFPOYCm3SKd/jglSGmU9zOUV4FDKr2VTFOcPnwi3qMS4KfEiM6Cn0tu5vORJW
	4+0KOtaLDEZ5sD7YazlC9/c6rsRPLbhlvgfv7QlkrFz45ILYEVEaiIiCeLQJ4aHO
	xnzKk6c9VFKGMSKNLH+icw1w672KDw9ZitLtTZ5zlopRrm0yN3omWbJKhQfqgZPk
	n+sUTQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39j7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9IEj3011030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:14 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 02:18:07 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 23 Apr 2025 17:17:39 +0800
Subject: [PATCH 3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-add_qcs615_remoteproc_support-v1-3-a94fe8799f14@quicinc.com>
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
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Kyle
 Deng" <quic_chunkaid@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745399876; l=2996;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=CYKigLI0WS40RMsyOamb792ArglHg8YjbnXb0JrMkvY=;
 b=NveUhSrkUyVrKYogUrm5fnioAZjNohwj54PkB7pV1aaN8DggUQoPX3lu93ZQZsx/V+okpC1wG
 iilVrGHSmZtB1pb0TvkutVfrXaUQynmbJoLMTlIZkxmt/+6uUoFh2cH
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MyBTYWx0ZWRfXxMi57OI/qsfB ov7pcJ2CvM1Xl7z50oQg2uMyt1mK3s2WsacY4m92gYAgese+A4rrqoVNlBzVhhLdYZWUDCBPTc7 j+DEK++AXR7FzhZ2gq86KapaFxF/kYWW0neOPU+OYt/SoMOwAmmKYEUgdGASjcoLokhB10n9f9p
 h2I/ZAoHzan1ncIAsRiw5YTJpzq873WJEjurGwYFIQnhPkztVRzIBBKJv9We3d5D8q/yEAD2THU opBtHArfXm+45K2EIYuSkJ5Nh/VF3xITLSR1j4xPD5Daxh1MUC8ZE9kuDJHezqM17KYJBROES3P vcPVGUEv/Oo4Fykrx4B/PIIqRy2+Tho/TKvsosJlHyi59Ng4njWv0AROBVEGFgGNAts2cPXPK9o
 O1gZvcoB+WO5cVnfrJ/PVkSV9OkB+zmfSjsaTd5entc6dew0hbhZ2l6nFZ60FTCFsv5kj1s/
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808b057 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dtWkbmE7q5G-2X-lNRIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: V2cHkRewsQj3ffOngxpRwf3fbF9S-hBM
X-Proofpoint-GUID: V2cHkRewsQj3ffOngxpRwf3fbF9S-hBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=682 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230063

From: Kyle Deng <quic_chunkaid@quicinc.com>

The Shared Memory Point to Point (SMP2P) protocol facilitates
communication of a single 32-bit value between two processors.
Add these two nodes for remoteproc enablement on QCS615 SoC.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index edfb796d8dd3..ab3c6ba5842b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -332,6 +332,80 @@ mc_virt: interconnect-2 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	qcom,smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apss_shared 26>;
+		qcom,ipc = <&apcs 0 26>;
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
+
+		sleepstate_smp2p_out: sleepstate-out {
+			qcom,entry-name = "sleepstate";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		sleepstate_smp2p_in: qcom,sleepstate-in {
+			qcom,entry-name = "sleepstate_see";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+		smp2p_rdbg2_out: qcom,smp2p-rdbg2-out {
+			qcom,entry-name = "rdbg";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_rdbg2_in: qcom,smp2p-rdbg2-in {
+			qcom,entry-name = "rdbg";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	qcom,smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apss_shared 6>;
+		qcom,ipc = <&apcs 0 6>;
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
+		smp2p_rdbg5_out: qcom,smp2p-rdbg5-out {
+			qcom,entry-name = "rdbg";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_rdbg5_in: qcom,smp2p-rdbg5-in {
+			qcom,entry-name = "rdbg";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -3337,6 +3411,11 @@ apss_shared: mailbox@17c00000 {
 			#mbox-cells = <1>;
 		};
 
+		apcs: syscon@17c0000c {
+			compatible = "syscon";
+			reg = <0x0 0x17c0000c 0x0 0x4>;
+		};
+
 		watchdog: watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-qcs615", "qcom,kpss-wdt";
 			reg = <0x0 0x17c10000 0x0 0x1000>;

-- 
2.46.0


