Return-Path: <linux-arm-msm+bounces-57137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08CAADC79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE351C23429
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA462147F2;
	Wed,  7 May 2025 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MVln2jWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD45D20C03E;
	Wed,  7 May 2025 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613631; cv=none; b=DgPH7raGTgg0aU/+ketSKoZ/a4O8fNrFUS2qpuTCbXY2Sgm3tPUkm7w6KtkhmTVhPwykv6W/hgDRw3vaZoa2SnbTV16vLcln6sTvsue8JTdehPU8w/TxxKytD/fE6Kgfr+HgRXxA64khbz5Y7YKtXFFTEA0k+eFfQvAgpIHI/lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613631; c=relaxed/simple;
	bh=d0vYKq0wSl+kqSVbGEItA1cFpDfKb7vx0nhrjcoBtgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WX9wal1XZ0PBIR14jG2CEWGLoX7Jk6UgQmpElmg28vAZAPui15CqFlHiC2YJ8I22A+qY2+ySso0/MPBLH9NoyiIPXGTM7JuipUuVOg0kvirKpDbw107LbOqxs09lyTHDzDLfW7LoTjIQsb/d8OH4cDHxSdvvDHvazfWbZJq1epk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MVln2jWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GlcG015207;
	Wed, 7 May 2025 10:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnY+Qv9rEJ1q1GxPaSO8hmfwmBEBpkJPvp7c7Gvm1vc=; b=MVln2jWjHpDzM1AJ
	pK3/lJBnyvZtCLUOD1leBMBoWwOgXK4m10cH/X6GsFVU7v1i1yle0pJOsfLFUayp
	yKkSw2rHxPsyrGzj8Qz5z7C4YFjapyXdMjuXRZYNXqCNEOFmIgOpnAVYUA7ZYBwm
	+8VoGnldqq2nlPxRZfT3B6SV++vr274N5RH3wGDBjGt/7OkS5WCthbraiiUIZ3HW
	RZkL31Xz1TySwBWGO5YglicN2ESdWigoBwLw+ulqQDCjNfeHOCLU2Lr+/Ft0n71+
	KDN2OlQhGnqFmpYTE2vjQGrE1uSPX49OX+HD3vi4jNKKy9CJ+qJgHfYeYBume8CV
	9nhqXA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u45dxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:27:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547AR4cZ013254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 10:27:04 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 03:26:57 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 7 May 2025 18:26:13 +0800
Subject: [PATCH v2 3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746613605; l=1819;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=L3s08Iv2ACx09hyF6AZi5gVi+KWMqIhLmKdhlcQY/lQ=;
 b=eJ7pQNt6G9prB6Fzc1ydkdQjj62VNwGLlmd/pv8VftoSK4eIyIDr2x9y7k6KM0JTaS0I6mYdD
 qWdTt2O7s0pA0PquKX4Dg+saeVdXGxUt5bDuAddx5GifoOea0m7zgJ4
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681b3579 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=_p9LeRYUILtONmBEkPUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: idnm3GrQGFI99wbNLlfF6Sn5hyPP2WaO
X-Proofpoint-ORIG-GUID: idnm3GrQGFI99wbNLlfF6Sn5hyPP2WaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NyBTYWx0ZWRfX5FCMXb2RyZWu
 nq04Zt2jmcUirI9eDgrDYwa8Cg0/mLHfOl0JziFMGV8uxyAxOWvND1eG4h+aAeJHPrmMhKb3llK
 cetLsX1H+rGYwobCUZS056z2I6HRCAOZrnp9hX+CYn5QsOUrBb1u2aAEWOPhXeW9vZYLTss3Syy
 ToyFi894Tneod4pcP/1q9a9BiJ60EjgSX6Qc43YsW8HvVTB7eIA554V2xIQ7db/RsRsE1/Q9IpG
 9RrHdeAuE9aOSOhz+b6sXM8js6KXm+79v156AW3OoD9wTBjZc54+T5lNcu8tZlyLqduHE2zpRBw
 zhH+pj1B6ufGt7QIV0mMJ0QcGW1dJ1gPaoJJ6ZflwjktVEQgoPySv/ohYDJREd64sbqVqxvs06B
 IMKKd7OWdALIeHqvnwVE5D52Ob5hotwcN+0A6R0LIjxoWI0/IDaTTLuRwEdKnK0O7hHs5Ysf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=554
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070097

From: Kyle Deng <quic_chunkaid@quicinc.com>

The Shared Memory Point to Point (SMP2P) protocol facilitates
communication of a single 32-bit value between two processors.
Add these two nodes for remoteproc enablement on QCS615 SoC.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 7c377f3402c1..53661e3a852e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -332,6 +332,49 @@ mc_virt: interconnect-2 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
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
2.46.0


