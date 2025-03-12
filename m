Return-Path: <linux-arm-msm+bounces-51129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF8CA5DAD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA683188943C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 10:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4AA24BBFD;
	Wed, 12 Mar 2025 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MR41h2J8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E7C2417FA;
	Wed, 12 Mar 2025 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776264; cv=none; b=r2YXd3z2qgNmIBYb4tCtObo0noLNBq7HpWh5MWDOI5RFzd2KZiZRukKmLWVsyde3cD9BqN2SCCRAXTBPm2rHV5A7WXiK/RUSPiNrzi1XcPbCUZAndBvSVmMrK/0Vwtu3mkIYHmuZzov/EBN0fsuNBjTmAXUZryGCJfKiGPj5lFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776264; c=relaxed/simple;
	bh=5Z9DCT9kmA5zGGr2AtOLJ1x0i0Yi2zFP/1NJpEtBiUA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XJz0hPP0StsU1wrEPI792ih6Bcj80BSTzxytNUlREzAgB2Pj5BB1HP9BUfqgsnnFHzEgifQNs4INmp3MpKit5JHMiFH7I9hpUA355mW0y+md6+tg9+rcekGfSZO51xpfhcu0SkQVsdKvDDMWRrpwNKW2OMaT+LfkQ/dzS9uQFkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MR41h2J8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C9ls0g013947;
	Wed, 12 Mar 2025 10:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=6J7aMHvgfGI26N7jsDed/Tmee/bXJyys35uwHP5Quqc=; b=MR
	41h2J8ULys5aoZ7U5bcXZlAcmuEzy2WXnxGxt22ypBk44in/Gi8r7Lbo9MQRf4Ie
	O/0JLmw9/PnaCUChVCfoj3aNYMQPcLUP0j/a9ENvk4RdBb5Z4fQe8ER/Yjfy42Aa
	ZTzJTY2ws++aRqUOfV/dd1pGANohx6jeFRJfkY9BuECSrQAV3fwZRBf5j0LEmhSZ
	8d84HfXBtHdtxqg6u16DRzUGBcX0axk0D/1ZKa7pkHFyr5lle5U+vIW+h8V41TmW
	uKSx3mSojCw9XgPgBrRuNglOTeAVdL/I1epSR8kdcgImEQj32cehMogDnipSs2/G
	wo1J/XS3vzPMWf6A59NA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p22e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 10:44:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52CAiKiX026985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 10:44:20 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Mar 2025 03:44:16 -0700
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: sm8750: Correct clocks property for uart14 node
Date: Wed, 12 Mar 2025 16:13:58 +0530
Message-ID: <20250312104358.2558-1-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ePkTjGp1 c=1 sm=1 tr=0 ts=67d16584 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Q4-S5rRWIOGwMoE6wUMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nRmpPufG0V-xgK4RQuHDdlLOFrlEqu9G
X-Proofpoint-GUID: nRmpPufG0V-xgK4RQuHDdlLOFrlEqu9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=768 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120074

Correct the clocks property for the uart14 node to fix UART functionality
on QUP2_SE6. The current failure is due to an incorrect clocks assignment.

Change the clocks property to GCC_QUPV3_WRAP2_S6_CLK to resolve the issue.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3bbd7d18598e..9f23a07d0080 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -987,7 +987,7 @@
 
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
 				clock-names = "se";
 
 				interconnects =	<&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-- 
2.17.1


