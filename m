Return-Path: <linux-arm-msm+bounces-21562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8A8FAE35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44378B2427A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 09:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96770142E8E;
	Tue,  4 Jun 2024 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iu5VzAwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C1B1428F5;
	Tue,  4 Jun 2024 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491600; cv=none; b=lpNjf88UM6jRS4TKwrKbSDhp+H3MgzIO87c0spMluijkRsJeydrEqNEXgcsZ11GMRp2GFCYqr5TDWyUzNn8Enk/QF2rJzcXher0pM6qEoP36s3EPSbHNGzJb0V6inibVbA878GCmuOz12G9UheGuz9mrGJaIjwDdpaIoCQwBSc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491600; c=relaxed/simple;
	bh=ZlnA2UQ2YhOjyyGVocjq3kQA1XbSfLOFhBNjOXe1Rxc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S72FR3kXohtea5PnOoiV4GUG9+pBqgEf2uAWQbeov+ac3G8iYjgvicIymp8w095Kz9hxVHk6bhqTztPTSFkYuAeAaDiMyrC4PS44catRbVcRYLdK11deDhW9UNLhf+jcK/9LRHVn+u39g2I7ZoSJgbkaNXU7VFRSFSdX2XjWm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iu5VzAwQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4542F7dZ024027;
	Tue, 4 Jun 2024 08:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e7UGS1BnY1uFoNhYId4VCr
	29yEHJlN9Yn5o6AbT/6fI=; b=Iu5VzAwQRXHn7L+slBTOo12ALkKAi8XyDvgusF
	I4P7G1A0prY27KHwZExDjb+xwiZMQy0WfEQlmVNiMDlt2pQXwrLkKj/mtrlFrYVH
	Lf99rJEN9ZOvfM3tQXrBqWBsFqjYF4EBQeLujcpMdeCkzAFoC09pBc4ASCFi8+C9
	u1/v0zhtzNKOW00R+5xnDH73pjPQOkWtUOFjgrg5eITCYsN0pOThLmUiNVju4P/N
	knFKbZOiBH9oqROevpHdNshN2DDLUz2XMRGA4NctP3oGsUDtH3Uq7cmjC3Nrg9QF
	iiC9JQjrwplni8BctCnYW2oQ4EZt1UzOrzZJypa8JibBdPfQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dp7g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 08:59:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4548xrhU026574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 08:59:53 GMT
Received: from congzhan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Jun 2024 01:59:47 -0700
From: Cong Zhang <quic_congzhan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: Cong Zhang <quic_congzhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sa8775p: Correct IRQ number of EL2 non-secure physical timer
Date: Tue, 4 Jun 2024 16:59:29 +0800
Message-ID: <20240604085929.49227-1-quic_congzhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dxfrFcNTXb99rDI2wLPAbHPg9ExvA3iI
X-Proofpoint-GUID: dxfrFcNTXb99rDI2wLPAbHPg9ExvA3iI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=587 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040072

The INTID of EL2 non-secure physical timer is 26. In linux, the IRQ
number has a fixed 16 offset for PPIs. Therefore, the linux IRQ number
of EL2 non-secure physical timer should be 10 (26 - 16).

Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
Signed-off-by: Cong Zhang <quic_congzhan@quicinc.com>
---
ARM documentation for reference:
https://developer.arm.com/documentation/102379/0103/The-processor-timers/Summary-table

---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 89496728d840..efd588fa2abb 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4566,7 +4566,7 @@ arch_timer: timer {
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
 	pcie0: pcie@1c00000 {
-- 
2.25.1


