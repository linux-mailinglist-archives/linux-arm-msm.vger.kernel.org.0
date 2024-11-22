Return-Path: <linux-arm-msm+bounces-38732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C09D5703
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C79C2B21FA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 01:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C64A70808;
	Fri, 22 Nov 2024 01:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QhCYiUum"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899E4A31;
	Fri, 22 Nov 2024 01:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732238294; cv=none; b=m4ykE/g15z7PY64Wi6ABhzkghAfegGZ9HteQ1/oyXOszY8h7pyf5n8WNlJLNIBeZyaeeb9BpP6btK0SwuJRPiI3rOnPh77jkPYxs1fPQ+PDGuMNUxIwyiJZubCqV2ITrHwnLefmelo1yOQb9Xh4Tc3TBLasevH1n+o9uBqi0oZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732238294; c=relaxed/simple;
	bh=pGOLy62FxCFEKeqz6sCZk2FzUTkPyehD1XaaUs7vb6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=snRjL81D7oo44KjVFtwhuiIuvsO+PUAUPSyQIxFQnx1aLEmWYUlKtpckDPDxLTzZfErfCewmwlZdYSDOIucru8Zj4SjXVR82gDXxgmbOfVj/d5hc6hhHtG38FzT98EWLnrhLS0oWgEJ9ruuHsgiXHYzjsGTvIxG2t5ZlZpi+Jgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QhCYiUum; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALLpqPE025682;
	Fri, 22 Nov 2024 01:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMMWxQ4o4pGQfV+n7NM8+4Dhggh4FK+HGrIOyuR8t2E=; b=QhCYiUum1FQiL+0u
	A6KGA1RfpXO7YNmQqpxv7JmEQnjQpMpbXrfx03E81cGB1snUVcjHa1P3QLcF1+lj
	1KK+QJkylha7/NXs5t1OZjEYKxYqJDfMkAgqPpDTnob/LYvDbjgcQZ3dTijHFKA0
	caUwzyNXT4b27PIXZqBeTNLLKkU6tqjkX/hjwGz6Wpl+WDM0KtqBSWLecbwWxodo
	ZCt3Ui1Qg+hNYnSiJc5aep8c7gBdVod6uMCZLgUJ43cV3qQau0+kQajxWUrtbtS9
	cp+j2mwuOSbJORDM0JEwqI3PZeeYgR/GvWQJezKKwCIvihjiC64hQkZd3hn+4ImX
	RJTaoQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b0c7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:17:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM1HeMe006525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:17:40 GMT
Received: from [10.253.13.126] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 17:17:33 -0800
Message-ID: <3a7d9e71-bc2f-49c1-a12f-b9c860493c25@quicinc.com>
Date: Fri, 22 Nov 2024 09:17:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: qcom,ethqos: revise description for
 qcs615
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bhupesh
 Sharma" <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_jingyw@quicinc.com>,
        <quic_jsuraj@quicinc.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
 <20241119174156.GA1862978-robh@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <20241119174156.GA1862978-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VPtJT21gOif71Q4xsJj9Yehuzcvm0Drd
X-Proofpoint-ORIG-GUID: VPtJT21gOif71Q4xsJj9Yehuzcvm0Drd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220009



On 2024-11-20 01:41, Rob Herring wrote:
> On Mon, Nov 18, 2024 at 02:16:50PM +0800, Yijie Yang wrote:
>> The core version of EMAC on qcs615 has minor differences compared to that
>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>> and the Power-On Reset (POR) status of the registers isn't entirely
>> consistent with sm8150 either.
>> Therefore, it should be treated as a separate entity rather than a
>> fallback option.
> 
> 'revise description' is not very specific. 'Drop fallback compatible for
> qcom,qcs615-ethqos' would be better.

I will fix it.

> 
> However, this is an ABI change. You could leave the binding/dts alone
> and only change the kernel driver to match on qcom,qcs615-ethqos to
> achieve what you need. If there's a reason why the ABI change is okay,
> then you need to detail that. Did the driver never work? Are there no
> users yet?
> 

Firstly, this patch addresses a correction to my earlier update on the 
dts schema, which can be found here: 
https://lore.kernel.org/all/20241017-schema-v2-1-2320f68dc126@quicinc.com/.
As detailed in the description, the EMAC version present in qcs615 
diverges from that in sm8150, leading me to conclude that the schema 
should not fallback to sm8150, despite successful driver probing. 
Lastly, there are currently no users for qcs615 yet.

>>
>> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 0bcd593a7bd093d4475908d82585c36dd6b3a284..576a52742ff45d4984388bbc0fcc91fa91bab677 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -23,12 +23,9 @@ properties:
>>             - enum:
>>                 - qcom,qcs8300-ethqos
>>             - const: qcom,sa8775p-ethqos
>> -      - items:
>> -          - enum:
>> -              - qcom,qcs615-ethqos
>> -          - const: qcom,sm8150-ethqos
>>         - enum:
>>             - qcom,qcs404-ethqos
>> +          - qcom,qcs615-ethqos
>>             - qcom,sa8775p-ethqos
>>             - qcom,sc8280xp-ethqos
>>             - qcom,sm8150-ethqos
>>
>> -- 
>> 2.34.1
>>

-- 
Best Regards,
Yijie


