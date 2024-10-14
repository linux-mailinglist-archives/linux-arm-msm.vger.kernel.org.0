Return-Path: <linux-arm-msm+bounces-34231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F599BDF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 05:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDE8FB22133
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 03:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3066243ACB;
	Mon, 14 Oct 2024 03:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U41PJ2iQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4B28467;
	Mon, 14 Oct 2024 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728875425; cv=none; b=TVyQn4Y8b9MmSBVCp4s7UlvziBKpnmUcWNGmND5mWfrxLWtU3rDzb9rf+P1+XIkLechGy/F71frEDR/q6KnwaYEWIYcuCCZ2/WwkIVOG5nj8E5y6RPEVS/WthMeY5DMugAbZ0s4k3kmBwbbF3zgsilac007Ic0WIuLvUN2oHNYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728875425; c=relaxed/simple;
	bh=DdQ/o5IyAE1ef2BCYx1IXwALl3MWzI8TPRzuZrl3jQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bx0gcKospiDcEC9NimPDtETJYhbSpbyD7Jn6hGdzm20wPEsQsGiREshjVpEPmIfdICVBgcG0wouHSEb6dH4pqCCgkv+SU1aqOtCZoDiuRrN21yyE6GLrwWIoup31fcaf+wK2iPaNGobVC1KZX7Ae6BLMiUMDvrSdNHPZ8JumnUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U41PJ2iQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E0NYdo001018;
	Mon, 14 Oct 2024 03:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeAYuDGyuiL1QDxIhtx6FIuHKkO563Nn7tQ/PODSPfY=; b=U41PJ2iQw6SWw75s
	0Wu6y5K3GO0jt+/xL2yL6921Zl5bmNqJ7aIVPYRNpsEooSKqR7pv6zmqmNiVsEIk
	+4wlCXQdwLESfCN1I8/vlpxrM+zvsR1kMrizDaOEntEzpK/cpqKQLRCaMyEeRPcz
	oHBeeM/jl9tLDaa32BLKlipWRymfw8hn+EJVwwgrw8bG9hYR5vBoSkuNqSyda3B2
	U8rROn8qUNYN2o0avgB1lWKKByKxZ0pkOa+3ENdClQaV+vJEZB/QQfs0wZMHOJin
	tYSl3pU5ut/IBDnblyWgz7ikp8ba5Vlr/0y1JWIzoVOE0uJ4DWnAzLX5belhaI2E
	19DzJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd8u1k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:10:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E3A1bE010849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:10:01 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Oct
 2024 20:09:57 -0700
Message-ID: <2224b2fe-4e72-4371-9f0b-d5ee211c2210@quicinc.com>
Date: Mon, 14 Oct 2024 11:09:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm-smmu: Document Qualcomm QCS615 apps
 smmu
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robimarko@gmail.com>, <quic_gurus@quicinc.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
 <20241011063112.19087-3-quic_qqzhou@quicinc.com>
 <af81be27-fdfa-4dec-a18c-56c7022e3c75@kernel.org>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <af81be27-fdfa-4dec-a18c-56c7022e3c75@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wm-Jb0utSsOu_EBBr2vz4zGZn5fUxE4A
X-Proofpoint-ORIG-GUID: wm-Jb0utSsOu_EBBr2vz4zGZn5fUxE4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140022



在 10/11/2024 2:48 PM, Krzysztof Kozlowski 写道:
> On 11/10/2024 08:31, Qingqing Zhou wrote:
>> Add devicetree binding for apps smmu on Qualcomm QCS615 SoC. SMMU function
>> is required by multiple functions including USB/UFS/Ethernet.
> 
> Do not explain what SMMU is, because it is obvious, but explain how this
> hardware differs from everything existing.
OK, will improve the comments in next patch version.
> 
>>
>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 92d350b8e01a..9e62c2cdda08 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -36,6 +36,7 @@ properties:
>>          items:
>>            - enum:
>>                - qcom,qcm2290-smmu-500
>> +              - qcom,qcs615-smmu-500
> 
> This is incomplete? No clocks? No power-domains?
This is APPS SMMU, no clocks and no power-domains are needed for DT.
> 
> Best regards,
> Krzysztof
> 

