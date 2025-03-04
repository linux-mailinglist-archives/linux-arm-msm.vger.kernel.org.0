Return-Path: <linux-arm-msm+bounces-50284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FCA4F034
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE473A6009
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 22:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0609127934D;
	Tue,  4 Mar 2025 22:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MlaBkcXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F227810E;
	Tue,  4 Mar 2025 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127057; cv=none; b=d1z7lLoWVtP3FMcbodr2VcBo1qGk/oHWSCTYuLXFenEvFAhgq/i7Bc6wuKJjSNOSglo9Ev5IN4QKURaU2SaazhvhUSVeQMbbsKcUqHwpELywpvd97UBI1jHv6XhyLt4K/tmekNqJ/yEf521SWTb6h92S18o7iIrNpHr60yAe8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127057; c=relaxed/simple;
	bh=yyuFzL9LtSYARpW4okLpxNny9DSC9xIoudXgZxXbJmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SIkLOh8HG+XjyG3M7cbfSRXUQ6lJdwM6WgUY5G9o3zFTYpSISy5Zk5dQpg2JMqDMPap2U+sdkCU1L0LdRcX95KH2jqKdK8Z50IMb4zobLMDStJXXFW1tqtuiOag58kZ31ElLjQivwuU5KwV/B+eyLxotlNECAfeJlyMeV35r2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MlaBkcXL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AZBxH010211;
	Tue, 4 Mar 2025 22:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFLzxCJhvx1kfLFhPCMDGpmV/c7io94CywbRcFPfLaQ=; b=MlaBkcXL6xOiMB/C
	iuuKdf1sjakp0lR+BsEQVtLMPyB0EquwBB+M2r5bcGoguWChIQhy/pZwzbFWK15A
	DNVDrNhg410d6Hoy3Knnw/GqeSLQEzWPTT7onV5hkLNO/XzXVI3mJINmo+lvzrDL
	lmP7Puq8J6vKMmI3Izbs34SCeaXeuGs56umfWxBt1olYwzrQgLk8rgecpv3vnsUB
	g5i/qNpMBCJxeGdZInVo4Ibl5c4u+M3dLcPjiC/C9LajOHCPjTe6CXqKLUhic52A
	b4FtzUCOnW6mesHMPGbUSzDqOtbXYZgfWSN0VVXdpgkpL1RnYXufMLtsDqADtThz
	5Riybw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6wkaj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 22:24:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524MOBfK007693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 22:24:11 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 14:24:10 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Tue, 4 Mar 2025 14:24:00 -0800
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8750: Add LLCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250304-sm8750_llcc_master-v2-4-ae4e1949546e@quicinc.com>
References: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
In-Reply-To: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741127048; l=1241;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=yyuFzL9LtSYARpW4okLpxNny9DSC9xIoudXgZxXbJmc=;
 b=HJIwEICVYXtzN87KjyEzZJ5ZLHJlfAthTNE2Cm19nA0DmdBDl2cv3SPY7cgKUlu5Ira45dMqY
 ntbaVg116frC8AsF4v/Z1AOHJL4LQCsVleuSqIzI2MgIHRQpFRZ4wOS
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c77d8c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=HB9I7tTqELxSCm6kzBkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _pD676k1tx5wXqv7XjQj_BSWLWG_tKZn
X-Proofpoint-ORIG-GUID: _pD676k1tx5wXqv7XjQj_BSWLWG_tKZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=607 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040179

Add LLCC node for SM8750 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..a3f9595c496f6f6fcdf430d44fdd465dda4bd39e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2888,6 +2888,24 @@ gem_noc: interconnect@24100000 {
 			#interconnect-cells = <2>;
 		};
 
+		system-cache-controller@24800000 {
+			compatible = "qcom,sm8750-llcc";
+			reg = <0x0 0x24800000 0x0 0x200000>,
+				  <0x0 0x25800000 0x0 0x200000>,
+				  <0x0 0x24c00000 0x0 0x200000>,
+				  <0x0 0x25c00000 0x0 0x200000>,
+				  <0x0 0x26800000 0x0 0x200000>,
+				  <0x0 0x26c00000 0x0 0x200000>;
+			reg-names = "llcc0_base",
+					"llcc1_base",
+					"llcc2_base",
+					"llcc3_base",
+					"llcc_broadcast_base",
+					"llcc_broadcast_and_base";
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,sm8750-nsp-noc";
 			reg = <0x0 0x320c0000 0x0 0x13080>;

-- 
2.46.1


