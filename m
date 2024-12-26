Return-Path: <linux-arm-msm+bounces-43339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B549FC81C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 06:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2591C162765
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E72150981;
	Thu, 26 Dec 2024 05:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SXbJ1F6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ABF146017;
	Thu, 26 Dec 2024 05:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735189767; cv=none; b=LmUchW8fNKJuxjipUOKOz/RBl3J5kBuTszsKPwBBfM9argm66siCQVe0VBVC/bPqFQ6WxkUCMGzgvVoYohWHKiwxBr2aSdf87FuDwPf8xv15tFmitQxOKM8PdS4jLTfRfb//+r1CaWKt6EbKIVmklaHGTW3Or9tuL483lLa1qig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735189767; c=relaxed/simple;
	bh=jg5YC+mxHmOtn8HtQNj8oTwDZA03WRS8RIsJSSWPmgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WsJ+9uWyyahKdaGbiPx82rCmMqygiTTPEhQ420G/LD73Et0RRJh4FuooHOmwVknq2XW/WWtVyL4WQyVFnRYo6TwijkT1aSJUfEXlbX6poGt/nSq2UhIugzPE0q/FTx90kSEt/fNL0PTwvzU/DF60htdIdQn97zxh/bGTKU/kPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SXbJ1F6k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPMs2Fu008100;
	Thu, 26 Dec 2024 05:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1evF5viwj8q0Qo95378Nk6C7zMyL5fb3Lyi4WXzP7M=; b=SXbJ1F6k1rzOpO3G
	6LE/2rkhkZnqQFkWfjMyJLWDT07Z3mQvNuvFoqo84SwftQgFCxBz/yYeawtnkoT8
	/3vynKFOEUM4AeX8HB/qoh1vG2mqVFEgFlyWGlDJT4fgN9MgoEq6et9bWzLrtIWx
	6yIdP8zQY1VaCt6JBD7GVavymhy7klxQw9kLb2XnHXG32IHsHXmYaJwExGdCGoq9
	nSHx1l+riy93bmwyZpK/ifb0ve45dtODkfRSKZwuYugYmfXLY1w90dQq8XBGTuhb
	oidRXSS5rvgDXBU2wgNiLLe2GcqDrCG0nBh3Bh7TFQvwnO72WraspfRv1mN8zLZK
	CzLlfQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rkhs2m9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 05:08:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ58GgO009016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 05:08:16 GMT
Received: from [10.50.10.232] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 21:08:11 -0800
Message-ID: <53e124ff-62f7-246d-d31f-0f0a9760e4c9@quicinc.com>
Date: Thu, 26 Dec 2024 10:38:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: qcom,prng: document ipq9574,
 ipq5424 and ipq5322
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_mmanikan@quicinc.com>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
 <20241220070036.3434658-2-quic_mdalam@quicinc.com>
 <2irlpuqdsdk3qdmcfkepabaw3z6z4r2v3b2ug7nywqwynhzd5v@rarvfnyugmaj>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <2irlpuqdsdk3qdmcfkepabaw3z6z4r2v3b2ug7nywqwynhzd5v@rarvfnyugmaj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QWbass37-y7rxMei4g7XztXsNaJV0sOf
X-Proofpoint-GUID: QWbass37-y7rxMei4g7XztXsNaJV0sOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260042



On 12/24/2024 3:12 PM, Krzysztof Kozlowski wrote:
> On Fri, Dec 20, 2024 at 12:30:33PM +0530, Md Sadre Alam wrote:
>> Document ipq9574, ipq5424 and ipq5322 compatible for the True Random Number
>> Generator.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>
>> Change in [v2]
>>
>> * Added device tree binding change
>>
>> Change in [v1]
>>
>> * This patch was not included in [v1]
>>
>>   Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
>> index 2c959162e428..7ca1db52bbc5 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
>> @@ -24,6 +24,9 @@ properties:
>>                 - qcom,sm8450-trng
>>                 - qcom,sm8550-trng
>>                 - qcom,sm8650-trng
>> +              - qcom,ipq5332-trng
>> +              - qcom,ipq5424-trng
>> +              - qcom,ipq9574-trng
> 
> Do not add new entries to the end of lists. Keep sorting.
Sure, Will do in next revision.
> 
> Best regards,
> Krzysztof
> 

