Return-Path: <linux-arm-msm+bounces-64338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25AAFFF15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4815A13A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 10:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514492980B9;
	Thu, 10 Jul 2025 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ngO6uyn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8928B7C6;
	Thu, 10 Jul 2025 10:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142911; cv=none; b=Su2pfogCcjirXEe2hWiko7qMG56d+zQr4Gz8JyAanhRVBdLRhpl6X/jvYsEGYN2dih5A6PYUyK28Ovs6/+NBSL+QjNo4+KmgXu+yETtlrs1En2+dKVdNTEbQ/fasJxZ7//qRHzVATVKUe95U6SqTseISedU+iIO8t+uDhiz7+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142911; c=relaxed/simple;
	bh=A+9Sz68hzFxOWXlYTrr0jLnxA/21fIK4aonpJxZXUMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fHBoHvMdiG47SYQ/jrfpq7wxoYQVUo6sZvmUqze7IjoPeFQUQqGRNvJFdcMvT9HR5XaSebxtSKo+ktMY5bbJqkBbI/xEYSsFcp4iq8+DnoIivDmv2+El513/muvc+vQh5JWThocgqiF1f4vtf3BMYI08OMWIRHdEFa4Cy26hibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ngO6uyn/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A97I30016625;
	Thu, 10 Jul 2025 10:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tf3urf9uVqztqSfyUPaLE7aNRQmb9rU20q9mQcpzNms=; b=ngO6uyn/9GojR7e6
	qs0WAwVOe6Tma28F8jn0r2Z7jr2kFNgSTwAp5g9vwTd566AXh6yRJ6Snq9GlU41d
	xHlrsifdsyrIO6XEPTNpTbwXGkyz6tfqWHGV4/eXHsme9xx2128z/CkzhX189j4c
	qwagUC+a8FJCEcPcXEt5hpHw7CJ4DsCslpGfhcprNEhvOgLFmT3i7suCOsjc5es/
	TXxzg2RxWwbcr5teoHh6D6kQdtHPTdK8TD28WyCHw1pJ+RdXgRlV2oPIQmoFtjQE
	FWMMWkbUqc1IHJ2BRdVDNW3KhT6zR1XmWV8SJXW001BFcKJtTFwqFJ8RlvTwSfSZ
	mGuIbA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap4k1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 10:21:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AALiff026017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 10:21:44 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 03:21:38 -0700
Message-ID: <80848e86-1c0d-4edf-ac25-006a5cd1779f@quicinc.com>
Date: Thu, 10 Jul 2025 15:50:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: clock: qcom,qcs404-turingcc: Reference
 qcom,gcc.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeff Hugo
	<jeff.hugo@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
 <20250709-gcc-ref-fixes-v1-4-ceddde06775b@quicinc.com>
 <74785dcd-6436-40a6-b747-a4890edc2113@kernel.org>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <74785dcd-6436-40a6-b747-a4890edc2113@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686f9439 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=OnOfrgqvBbQOueBi47sA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7oMePWCFDFo_bjfu_8GD2J1b09EWO55c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA4OCBTYWx0ZWRfX771G0X3zTjn+
 izOg0Pd3JysxSLbyKmHiWovPpi1N+tMWga8ySHyl7pipoIrw0aM+rssH12sqvi5mP7ns1F+D1UE
 I61OlqrdeH8Sz8bB4j3PYObFWW0wh0jehJ/mLdYUQNJyisO2ee+uhE8lZYff7ub+SFrrK+wMJ4u
 y4JLX5hE3vGXnBxKF+t2YI2362aA1SgfsW2GXuSQ/G4LX/IJO7mkN27DhGHEI7eZhxFPETi2Cp7
 gQ9e9vA/yNmos5WtTKHTYgc6vcaBUcP7QFH2WGBks+nVAcNFtC2U/VK3KoBLxRFgc6o8d08Bcjo
 Q18izkAc36HHUb5F/4a6PBHBbwepSkeK+v9EkuO36W0HzJQLQWLessVNVbFlyVzhawPHrj3rc02
 EqlKyylTf/VhYNH8WP0wGhJxltXDDW1NCqGyHntOmV54BKmGQ0RlO+89WMY/JuoTW36/rRUC
X-Proofpoint-GUID: 7oMePWCFDFo_bjfu_8GD2J1b09EWO55c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100088


On 7/9/2025 3:37 PM, Krzysztof Kozlowski wrote:
> On 09/07/2025 11:37, Satya Priya Kakitapalli wrote:
>> Reference the common qcom,gcc.yaml schema to unify the common
>> parts of the binding.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,qcs404-turingcc.yaml | 17 ++++-------------
>>   1 file changed, 4 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml
>> index 033e010754a26bd03e02a364b0a6f36d87a3af62..794984f563fe3eb253aaf7524205097cf0c62711 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml
>> @@ -13,26 +13,17 @@ properties:
>>     compatible:
>>       const: qcom,qcs404-turingcc
>>   
>> -  reg:
>> -    maxItems: 1
>> -
>>     clocks:
>>       maxItems: 1
>>   
>> -  '#clock-cells':
>> -    const: 1
>> -
>> -  '#reset-cells':
>> -    const: 1
>> -
>>   required:
>>     - compatible
>> -  - reg
>>     - clocks
>> -  - '#clock-cells'
>> -  - '#reset-cells'
> No, this becomes now power domain provider without explanation.


My bad, I will drop the files which do not have the power domain cells 
in my next post.


> Don't just blindly copy other people's commits without understanding them.
>
> Best regards,
> Krzysztof

