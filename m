Return-Path: <linux-arm-msm+bounces-27246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FEF93F3FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 037ED280A92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC299145B0B;
	Mon, 29 Jul 2024 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pd/0eOOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1825144D01;
	Mon, 29 Jul 2024 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252391; cv=none; b=pYQvpdGZ69V6ZMCAukoVc151dtLuKgPbMXk5Z2O8UElj97O4BfSxIXHTB1NdC4KN4zq5QBW7Boojy9t9eN2kDLrWDoasGuMqpTQnZABHODSnA79DUBkBZ1YnTOtwNYtRDMAXESDGiEbmceDRveWzLj0RNvmBHT07pS3rDusq9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252391; c=relaxed/simple;
	bh=yLGF8JW3xZw1VqZs1kqaPEUzwEBb9q0j0bkuTrhBDds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YuYKO3Jtdtw2BEOFexjh8h0Hj9MSrNMew6tAltNeJM2v04fz3N8oId+v+9BYy3CNVDOBECS/irG1snbNlxQyCRtUnYnO6tv7lxM6dOVl977OBAzFGY+oDzV4c/dtVzysvj6rtI1Ta3/gVYCQnJ9Bvlk+9svR9Wi5EM4Ft1ogo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pd/0eOOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TALS9v024192;
	Mon, 29 Jul 2024 11:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/hd/iUSykh9ROSYpv2MNvVhqWXLxfQrqoQ+P7j9L60=; b=Pd/0eOOWewLoXQEx
	PVRZA38BqR/pQxksa6z3SjILfA/+dbRU7vUpFYZAPyzrngZ1Vffcv8KG9H0Ixaym
	goCji9rPNOqymwfLx84dXYPJo6ASCM5aSLb9ZptBWJtmdPGIbDE/aLeAvk22lZXZ
	cLyhbf2MkVB8wib6hRpsVdKtZqqO8c0EugoR5siav+Rn7D8C+KSueeRYGrL3CO3O
	CwKsqKTXlEHSmJRRaT8hgZd/RffzTaq7XGo1UxFBDJDdlSOmZF1RpNrLhU3a2n/0
	L+P/ZN1xt+kxvt1Lr31Y/m4JeetPby0NYCIKi7iNVIzbFUJRb1FrgnXJe3ZDjI/W
	xXF0jw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms4341s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 11:25:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TBPwfH024916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 11:25:58 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 04:25:52 -0700
Message-ID: <9a7972b1-ffd7-481e-9962-bb55abef70f9@quicinc.com>
Date: Mon, 29 Jul 2024 16:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: clock: qcom: Remove required-opps from
 required list on SM8650
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        kernel test robot <lkp@intel.com>
References: <20240720052818.26441-1-quic_jkona@quicinc.com>
 <497c9438-5bb3-42d9-9df9-661235a556d2@kernel.org>
 <14f57121-46f1-4dbe-92fd-e840705b771b@quicinc.com>
 <3bc186e8-40fc-4c92-affa-0e0b6cf25153@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <3bc186e8-40fc-4c92-affa-0e0b6cf25153@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F99SInU2x5_7fDg7PApGHkQQ71_J4bCJ
X-Proofpoint-ORIG-GUID: F99SInU2x5_7fDg7PApGHkQQ71_J4bCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290077



On 7/26/2024 8:28 PM, Krzysztof Kozlowski wrote:
> On 26/07/2024 16:30, Jagadeesh Kona wrote:
>>
>>
>> On 7/24/2024 1:38 PM, Krzysztof Kozlowski wrote:
>>> On 20/07/2024 07:28, Jagadeesh Kona wrote:
>>>> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
>>>> sufficient for clock controllers to operate and there is no need to specify
>>>> the required-opps. Hence remove the required-opps property from the list of
>>>> required properties for SM8650 camcc and videocc bindings.
>>>>
>>>> This fixes:
>>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
>>>> 'required-opps' is a required property
>>>>
>>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
>>>> 'required-opps' is a required property
>>>>
>>>> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
>>>> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>> ---
>>>> Changes in V2:
>>>>    - Made required: conditional and dropped required-opps from it only for SM8650 platform
>>>>    - Dropped Krzysztof Acked-by tag due to above changes
>>>>    - Link to V1: https://lore.kernel.org/all/20240708130836.19273-1-quic_jkona@quicinc.com/#r
>>>>
>>>> .../bindings/clock/qcom,sm8450-camcc.yaml     | 26 +++++++++++++------
>>>>    .../bindings/clock/qcom,sm8450-videocc.yaml   | 25 +++++++++++++-----
>>>>    2 files changed, 36 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>>>> index f58edfc10f4c..8698c801ed11 100644
>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>>>> @@ -21,9 +21,6 @@ description: |
>>>>        include/dt-bindings/clock/qcom,sm8650-camcc.h
>>>>        include/dt-bindings/clock/qcom,x1e80100-camcc.h
>>>>    
>>>> -allOf:
>>>> -  - $ref: qcom,gcc.yaml#
>>>> -
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>> @@ -53,11 +50,24 @@ properties:
>>>>      reg:
>>>>        maxItems: 1
>>>>    
>>>> -required:
>>>
>>> You cannot remove required block.
>>>
>>>> -  - compatible
>>>> -  - clocks
>>>> -  - power-domains
>>>> -  - required-opps
>>>> +allOf:
>>>> +  - $ref: qcom,gcc.yaml#
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,sm8650-camcc
>>>> +    then:
>>>> +      required:
>>>> +        - compatible
>>>> +        - clocks
>>>> +        - power-domains
>>>> +    else:
>>>> +      required:
>>>> +        - compatible
>>>> +        - clocks
>>>> +        - power-domains
>>>> +        - required-opps
>>>>    
>>>>    unevaluatedProperties: false
>>>>    
>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>>> index b2792b4bb554..2e5a061f33d6 100644
>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>>> @@ -40,15 +40,26 @@ properties:
>>>>        description:
>>>>          A phandle to an OPP node describing required MMCX performance point.
>>>>    
>>>> -required:
>>>
>>> No, you cannot remove required block.
>>>
>>> To clarify: there is almost no single binding using your style. Even if
>>> there is one, then 99 others are using it differently. Do not implement
>>> things entirely different than everyone else. This is the same for C
>>> code you send upstream. No difference here...
>>>
>>
>> Thanks Krzysztof for the explanation.
>>
>> Hi Dmitry,
>>
>> As we discussed during SM8650 camcc and videocc changes, the MMCX rail's
>> minimum voltage level from cmd-db is adequate for these clock
>> controllers to operate on SM8650. So, we removed the 'required-opps'
>> property from their DT nodes.
> 
> Not sure with whom you discuss. With Dmitry or me. Anyway, I said
> nothing about required-opps, but the "required:" block.
> 
>>
>> Although 'required-opps' will remain in the properties list, it’s not
>> mandatory to be present in 'required:' list, as it is dependent on
>> cmd-db minimum level. So, can I please go ahead and update these
>> bindings to remove 'required-opps' from the 'required:' list, as done in
>> v1 of this series.
>>
>> It seems unconventional to make 'required:' conditional based on the
>> platform type.
>>
> 
> Obviously. But nothing stops you - and there are plenty of examples - of
> requiring one particular property based on the variant.
> 

Thanks Krzysztof for the info.

I will update the change to remove only 'required-opps' from the 
required list and add it back wherever required based on the variant.

Thanks,
Jagadeesh

> Best regards,
> Krzysztof
> 

