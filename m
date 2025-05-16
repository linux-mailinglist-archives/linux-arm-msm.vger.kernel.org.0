Return-Path: <linux-arm-msm+bounces-58200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13AAB9AC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40AD71BC5407
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4577A2376F5;
	Fri, 16 May 2025 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oQ/wNm+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69442376EB;
	Fri, 16 May 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393262; cv=none; b=VdQLwUZ0NHdhOwGQcSTwjF+JnowFKMNOlOwAMwl7o5KcGyH2UsZkR8bcmIstNVJ9qG8z3gnVpElXcY4WbZr2zDwVdWKE7D9iHfWDGfb2LOoQiKPxnZSazdVQklcl4caEB3jyfcakoF60qd4huWrhCceXeFxINvdVQRdsn7KPRwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393262; c=relaxed/simple;
	bh=IxwYEJFijV5wR5l2jtz5sYyeT5WVapiC7lOlkFuI6qw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KeREYQpL2TY3W8LIQFBZvGMjSO3ySy/QwhdgqJZhWhUcFDhZlUwhWPCqNNLgxh7xpk09jXaHYTBaU+Rc2FiIzxjOZCBHGT3JwdwdmZrS2wYKZGXNQG23HfYr5sQynHZ0OtzIJjJw+u/wI+XNzFlu9W1lHmovnSumDCrI+/SJ3es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oQ/wNm+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G39KQA001801;
	Fri, 16 May 2025 11:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBbFPg11hJCM2ZghN1OznTfqrX2M0u6CLq1oaFvpyFk=; b=oQ/wNm+AAM0Plmll
	6LWAWuYefuhgnbhnfvTsc922FPNhwyoD29v9HtR6cZ2ME0rjXEPnWvF/lybK7Kva
	O+6c3jDl1/eKmMrxzBVPtWB6tlL8vF8xyiZUjTB/3PYoBJl+XDxOar+GiRINcepu
	e1EtsMzff7LFgwGtnkx2YsOj0uJ4YxvR3ZbRD1pTNF5KiWMUBCz+MFWo7etgmuSj
	dwEsDKHG9na36ZQFECXWFQLB4ggc4TWCICUQ21O12TBLYQou6VIC6OmdC620Aj2S
	OyGiMzEZnr0Tp55mw7gLcuZn+qi8XofeOVMk+wRvPo8UFJbU3r1rZr3oqAToW2ou
	MqK+vA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrhhxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GB0st3028492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:54 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 May 2025 04:00:52 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc7280: Add nsessions property for adsp
Date: Fri, 16 May 2025 16:30:28 +0530
Message-ID: <20250516110029.1637270-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vt-yRU6AHje4HlBpTD-wdmoYloodC8_5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNCBTYWx0ZWRfX+752hgrSLMWb
 zuoqmOh7S34zDqM3HdXoWY5hfK98e4b3/810KvwcnYnmOrLDpkaLULHNFTh5nOquO6Iguz4bFNv
 qceP55+tfZq93H6v/hPQGSrQwCQ6n0FKKixCg68uqJPV6XGwBxsXiDYXoAw/oBmU6bMtiJBOBK7
 ueZN1NZ0nbd1rPbY+VGZoZIJm6qPe4g5mOuOFjt0KfBvHNukacQjcZhD6AZ6dblMD3W7prsxYKk
 oT5lOldEJxnaDB9uxNbRVYokc0xI6I7eRPjBawcnUw6Xmx4Lj6Yvf6WLt4u2chPzt06a5f2m3gO
 J0gNX+Ep/jALiVTXolcwD+5hqx4Kdglved/+0SgjQuXQONUmThhZBfN9sMAx/fs8MiBOvIqAdfJ
 R1ZxuWKi0A3XP8MiKvgJ5vEp1ILGHkkF4vp+W4VtXnt7XKMLgv716xCz2n0CsNxv85L5qLbv
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68271ae8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=xzk0jXLcH6ia1Ng78ZoA:9
 a=kph8uwvA8Js1ya5A:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vt-yRU6AHje4HlBpTD-wdmoYloodC8_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=762 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160104

Add nsessions property for adsp context bank to make sessions
available for ADSP offload.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index d9af79ff8c4e..86b51cffcd54 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3893,6 +3893,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						qcom,nsessions = <5>;
 					};
 				};
 			};
-- 
2.34.1


