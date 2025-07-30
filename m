Return-Path: <linux-arm-msm+bounces-67066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC719B15A75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03CDE4E30BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435F02641F9;
	Wed, 30 Jul 2025 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jZqDHrnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A1F2512DE;
	Wed, 30 Jul 2025 08:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753863797; cv=none; b=Gwd/WMMJAszoGWczdaVWboL6Z2gtA5z8s51dayxuq2+3Pu0st4svzIQ4IR665LyexgM2Xr08zqim7Kz13y+IKch8CTttxJxSS9o2i4jlWm6NsmVzkM6Mc9h5oasYV2NvOi+6mmIWcnIOOn/iPXl7F3VyteowEj9VndASJa7yf4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753863797; c=relaxed/simple;
	bh=DzpfPF/m57Evw/TLSB/8MYKARqnZY5P0zmOOuitde8k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S92eNuNbeBSuIF4kMWTQ2QjjkguDiys40NjjnqMez1lzXmjWympdkVYH0/I7PAXVrrvWPCOhFZ9etJgpgHV/hmZyyR/VNIsYCzG9fSp+ySt1OcXe3Kx0eeQ/8YXyLMMVOcZF4NLhAiWKao/haZykJAOeBPyPPh9gO6fpSm5gR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jZqDHrnB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5efjx031251;
	Wed, 30 Jul 2025 08:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQNGzDEK6eKty96rgcVMx9btsxD5fTyZGxvZiaEgtp8=; b=jZqDHrnB4+rfGYcG
	UQWaOH1a9ghkz40r9nNSVB4y/OIhfIng0nhWO+keiGf6N0T8XCXAgEFLBlV4TI5H
	NIUzkv/xUh4fqoSgsPws2EgtEfd+w4EtP2KoTHMBH8jhkMJQqDtyoB/Ib98MnCA/
	lI40HspDHx6gdYc29mLSh2fZc8DVeiat8VbjUY0nqit4U7yJrNm+WEM9sFKa/w67
	A+VdkiEBaEI+MqonQESFrCeKpzEdoyhAIOnTiz/6f8djWRXjSaveV8k2vx3naLUB
	lPNCFhfYH7ZFN+QBDQ8iAdeYGI8HBcb3YI0G1OskRz3wRoV1KGSiemF285p7mnB7
	9lBdYA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xgdbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:22:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U8MuSI021004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:22:56 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 01:22:52 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 1/3] dt-bindings: ufs: qcom: Add reg and reg-names
Date: Wed, 30 Jul 2025 13:52:27 +0530
Message-ID: <20250730082229.23475-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NyBTYWx0ZWRfX2pFJsAHhWqjB
 GIcRVRTaZx0Z7ZJxzdisl2UCk5m5cjMlwJrrivrmJQSwJFn5ShCpAQcStjn6X4sxQ6nHsxNBtKL
 JYf+FQX6KxFsSKX9h7rAMhMmjsvLL8mqbFjl05xpXMHcFYpV51Nkx70WWq2au58xWSIDKetggNv
 AQBBrAsG/mceyMV3TsA4E/1sgknZGVs2rUDb8htKZLqlxdUXcyECu+vGvqUfYIwm5waHdl34VEH
 3JPfQdt7AFSiOlUkn6Owx4ctlyBtjSWiddmGKH9avUIGOOrtwCXsNwBLmkn9PcTPSy6rMe+TX6C
 aPbKu5/F9cbwUu9KXMVmGMxFI2/4hsRK2wcHTxNVlg4ZHlIaQldUekzADVPkXE+CL4oSjfNIZ/i
 6g2a2QFu1ApB+PZ1mmrFO2BUdUmvdRbnKsR9nvCPXseSpm0TZP2inVcVf91cbio/luf4j3Wn
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6889d661 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=uVvpafz-p1P7gohKaXoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CHKQQ8VSPPtUhH__fgUwvrq44j-Kf9Gd
X-Proofpoint-GUID: CHKQQ8VSPPtUhH__fgUwvrq44j-Kf9Gd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=941 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300057

Update the Qualcomm UFS device tree bindings to support Multi-Circular
Queue (MCQ) operation. This includes increasing the maximum number of
register entries from 2 to 3 and extending the accepted values for
reg-names to include "mcq_sqd" and "mcq_vs".

These changes are required to enable MCQ support via Device Tree for
platforms such as SM8650 and SM8750.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 6c6043d9809e..de263118b552 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -86,12 +86,17 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: std
-      - const: ice
+    oneOf:
+      - items:
+          - const: std
+          - const: ice
+      - items:
+          - const: ufs_mem
+          - const: mcq_sqd
+          - const: mcq_vs
 
   required-opps:
     maxItems: 1
@@ -177,9 +182,9 @@ allOf:
             - const: rx_lane1_sync_clk
         reg:
           minItems: 1
-          maxItems: 1
+          maxItems: 3
         reg-names:
-          maxItems: 1
+          maxItems: 3
 
   - if:
       properties:
@@ -280,7 +285,7 @@ allOf:
     then:
       properties:
         reg:
-          maxItems: 1
+          maxItems: 3
         clocks:
           minItems: 7
           maxItems: 8
@@ -288,7 +293,7 @@ allOf:
       properties:
         reg:
           minItems: 1
-          maxItems: 2
+          maxItems: 3
         clocks:
           minItems: 7
           maxItems: 9
-- 
2.50.1


