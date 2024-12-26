Return-Path: <linux-arm-msm+bounces-43364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48D9FCAB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 12:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CCDA161DDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 11:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA901D4341;
	Thu, 26 Dec 2024 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="daTBWSMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCEB1D278A;
	Thu, 26 Dec 2024 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735213543; cv=none; b=P2TfCQUTR0Kr2Ffo4hIWuiZBaOGNM5y8p5gBRtT83acZ3o4DOgf6BUOOxbHtyPRj84zL8VdNceOm5LBPHf3elmeGq/C09Jc0bC75LprO9EhJOXqHVUATtccpSG6QzVjgipFjh7l6tlZKgNRO6uh++AEdua57SW9F4PMzm8UYiYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735213543; c=relaxed/simple;
	bh=RvUeDnsDqD+PwSkHWnqS7qmmY5BBAAwOpVU5aW4atK8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=boiDV0IqRXbP/3rqW2MxiNbh5Uz7+/BSWCN8tapXk/qkRNPjCMB91byjNsM4Nule+y8Iy3gwoX5mfEoi12fX+Qjyu35Js6RGPuJDX6GighFjkleB7aYZQeWs8C2A+RvvGi/+6WRdNUCllAtSFeaqigAnw8i9BkAc0J2qC5kiqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=daTBWSMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ5LRIh018287;
	Thu, 26 Dec 2024 11:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IofIk8N2F/8JywPDdKbRRMQKvdHt0wg5L2xtrEwUG0U=; b=daTBWSMVdzdLM4Hw
	swJpcXut4cEP7MTRbA3ruLwnnmUdvkqQjRDnW9k/98Pbk0sT4EJ4M2sfieQG9sQH
	ECyEGesidyqBBAuQXdKXG0Gmc7m0XVcDclOMv1TMrzKvGCPts9h4DqSyFlz5oRNR
	9JFtirMdEiWUgHkU+lFag1jBRjfi2U9rJb3k+AlKPSEW3UJJav0xnk5M4uaK0S1m
	wpB3aCJKVfceEvcP5HXrn6DYWYxJfeSfA904KRQpTRxPvN6m5qDxWFYWwKWV1rBl
	63+mjEGxkQE6DLIh3fQ5WfpU6zAr3Wpd1uDIG2Xcg8Ii+E+GIFMzdOH/7mfWLcrd
	Mi0VMA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s0wqt1u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQBjZ6m030398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:35 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 03:45:30 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <vkoul@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_mmanikan@quicinc.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: ipq9574: update TRNG compatible
Date: Thu, 26 Dec 2024 17:14:59 +0530
Message-ID: <20241226114500.2623804-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
References: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J4mnKpJMJDjdt0bdMJ_-4v8X3ityqUAh
X-Proofpoint-ORIG-GUID: J4mnKpJMJDjdt0bdMJ_-4v8X3ityqUAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412260104

RNG hardware versions greater than 3.0 are Truly Random Number
Generators (TRNG). In IPQ9574, the RNGblock is a TRNG.

This patch corrects the compatible property which correctly describes
the hardware without making any functional changes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v3]

* Included Reviewed-by tag 

Change in [v2]

* Revised the commit message
* Changed IPQ95xx to IPQ9574 in the commit message
* updated compatible string

Change in [v1]

* Submitted initial patche to activate TRNG

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index d1fd35ebc4a2..453574c370f1 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -227,7 +227,7 @@ rpm_msg_ram: sram@60000 {
 		};
 
 		rng: rng@e3000 {
-			compatible = "qcom,prng-ee";
+			compatible = "qcom,ipq9574-trng", "qcom,trng";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
-- 
2.34.1


