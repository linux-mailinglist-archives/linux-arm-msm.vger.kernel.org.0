Return-Path: <linux-arm-msm+bounces-45363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D48A14879
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 04:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EF6416996B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 03:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4101F560E;
	Fri, 17 Jan 2025 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="orA9EgNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6516425A645;
	Fri, 17 Jan 2025 03:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737084319; cv=none; b=opVkXtD1CHZfsAP01H9lMPq3JPN5T/WQq0xmveD6Q4vJBt818Ikrd9dKU+aa3+nTGeVcpgTCcx/d1NpIVEApDkxJRy21wC8dqIJ7ug2OrIyjH2u5u292RpMuYSaRIeTS3GcLlO1sufVnv2L9eN1zYBQboS4pUS8FmePYv2h9duM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737084319; c=relaxed/simple;
	bh=zWewJFQARh+onD8k0ILCh3QNHgBv4U0mSe08YICN9O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=dhAQ8iY5AkPJ5Yno7g4DPoz0vxJPzfDfo/dAJulTqeC9Bj/YgJLyoURs/NMPOJVCTzfIeMiRCEZFopl6vnJJNUoEFCjwwH39sawMH5nxyHtS4F7GLMa18KSAPOR+3OiDA7oEtc+BpL4WQLq51W8eiaOoszfKRFmTEiAeNFxtses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=orA9EgNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GFpdHL010187;
	Fri, 17 Jan 2025 03:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KBQQP+zyTT5FVJjUtxijuc
	jK7qTBH7fBoLCqZxRCiYk=; b=orA9EgNvT2loMYjIvKwuUNrjN2okUd3EGV1ial
	1vp7RHfo0l78+TRRFvuzW7Z2PU0iJdmL9gLL7Dwh/Yd2UwukosM4Z3Fx8qp1iTbY
	m+V3D35SuZLwjwdKn3as8HcGrfbuj7v3JG4F6x4QUxo3JXzq2ELfmrMnIltr8a0t
	mjrFKoxH7o1SPEW+R4e5NO1rSEIvarJJ96dfyHgYNADsZwhS1s2TYpRf2hnD921+
	12RddyvleTRQ3gguLwgMIF3+F0jwflwYYH87Hi4Km4cZGQG+P/DlIZEHhmv0IMsI
	/ZGI9+B07q0dNs64YqaD4bPMNIsu0+Ay65SOqbMyLRq/mcsg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44754g9dmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 03:25:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H3PBPt012516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 03:25:11 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 19:25:04 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Fri, 17 Jan 2025 11:24:31 +0800
Subject: [PATCH v2] arm64: dts: qcom: qcs615: remove disallowed property in
 spmi bus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250117-fix-kernel-test-robot-unexpected-property-issue-v2-1-0b68cf481249@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAG/NiWcC/5WPQU7DMBBFr1J5zaDYsZPCinugLuqZH2pB42A7U
 asqd6+bcgGWbxbvv7mpjBSQ1fvuphKWkEMcK5iXneLTcfwCBamsTGNco3VLQ7jQN9KIHyrIhVL
 0sdA84jKBC4SmFCekcqWQ8wzyovdDJ9Z4y6pap4Sq2BY/D09O+J3rcHkelT9mEMfzOZQa0jtnY
 TwGK32zt5qtmEbeOu76VuA0xLeuZfVwnUIuMV23Zxa9yf66u393L5o0eT1YZsPOiPuokRxGfq1
 p6rCu6x0OCNDBPAEAAA==
X-Change-ID: 20250113-fix-kernel-test-robot-unexpected-property-issue-bd18f6d42b4c
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        "Tingguo
 Cheng" <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737084304; l=1349;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=zWewJFQARh+onD8k0ILCh3QNHgBv4U0mSe08YICN9O4=;
 b=YI+j7t9TNm1SFJYBJg9AX0pTQbzRNK0OS/Sg5axLThzkbdX/DkPMhCUUbGEux2jlCsOx5y2BJ
 oOr0pISHJtxBE9YpNZi434GTXzbc6GQEWuNOGwPGYLt7fJaUeR+4sgD
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fRYn2VDv8yNI2IzfdOqCILJVXviheL0D
X-Proofpoint-ORIG-GUID: fRYn2VDv8yNI2IzfdOqCILJVXviheL0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_11,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=891 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170024

Remove the unevaluated 'cell-index' property from qcs615-ride.dtb
spmi@c440000 to fix the kernel test robot issue.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202412272210.GpGmqcPC-lkp@intel.com/
Fixes: 27554e2bef4d ("arm64: dts: qcom: qcs615: Adds SPMI support")
Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
Changes in v2:
- Rephrased commit message in a concise way, added Fixes tag.
- Link to v1: https://lore.kernel.org/r/20250116-fix-kernel-test-robot-unexpected-property-issue-v1-1-b1f4cc2c52d5@quicinc.com
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index fc69abff71270af591ad41f33bf893751cd7d300..7b3de4b8605722c2f24bc3dcbe9471440685745d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -2964,7 +2964,6 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 			#address-cells = <2>;
 			#size-cells = <0>;
-			cell-index = <0>;
 			qcom,channel = <0>;
 			qcom,ee = <0>;
 		};

---
base-commit: 27554e2bef4d70841c4d20d96c673de51edb353c
change-id: 20250113-fix-kernel-test-robot-unexpected-property-issue-bd18f6d42b4c

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


