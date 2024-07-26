Return-Path: <linux-arm-msm+bounces-27093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F10393D524
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 16:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68DC1F249E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 14:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF77B14A82;
	Fri, 26 Jul 2024 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bttud4a8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BB37494;
	Fri, 26 Jul 2024 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722004273; cv=none; b=E0WD9LuK/Vd0QP3ADkjzkCd7xHpIU9wxhJDr6k+aZSlqPMom+jhw8Tud4hey8kbBvX1igoKRaQjcV9lvryQ+zBEl4but8b95hBbID5xpYSycjWJeCc5vF5tCdvUvABWVGUgSuZc9zT4e+EzRU2CONR6Q3oa/7xOMkO1J14davps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722004273; c=relaxed/simple;
	bh=Ih3QV1RSuxQmyD2qLwWr/3CC/yQ3mKU62ndQTvrkeTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g05BOlvMRyzhjJQgxsjKpPO3TK2+WoAKUywdeeOgPKwHG0zIdRYZHTMx0iLMZ1ORR2eR2wJ9AwDBzJ9JdFK4AFXQC3H7UVlm14rFTp/hagPosG+LAgVPcQcdnoUDICNqtLLgbbjM/Bpv1rb0B7r8JZuLjMmnQngPYmPECKhAZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bttud4a8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QCP1ht025140;
	Fri, 26 Jul 2024 14:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVcAaHss/BAFPqn0NyhXmxr9ea9uAXgczEoc/ZcMMnE=; b=Bttud4a8+USeY06E
	LYEbzq4k/LqVghOJJdN9wRyxeN5fXyHgojUP8G6AiV6LMc991lXV6MddENy2eRGx
	IWP0HrWXJwcSevRl+2xpGIcTxmy2qHIEJGPzJymNw2FaGXQnfGUX1QwRN+x+FXPP
	ekTaT20AGzbvcphG0tvl4PvmvWDwIBP9UVL7OH7ld60HshDzWTGsDCgC7oCKtR0r
	sUI2b0pzwTqW9dF8CKeO4eApx+p//748YTey1zugZ4mq7cnDQ8nJLZGn00+besem
	ZHaTV48zg+ELnpRQx8EhF1o+Sts3TJQpwvze+eYIvXTVHWSn1jfZU6ix/OP/bNEe
	E44pvw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1tw9nqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 14:31:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QEV32A003750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 14:31:03 GMT
Received: from [10.216.52.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 07:30:55 -0700
Message-ID: <14f57121-46f1-4dbe-92fd-e840705b771b@quicinc.com>
Date: Fri, 26 Jul 2024 20:00:42 +0530
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
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <497c9438-5bb3-42d9-9df9-661235a556d2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _r1Rn9Mc33Qm3QhhHOrpSPN3P_NEJN-R
X-Proofpoint-GUID: _r1Rn9Mc33Qm3QhhHOrpSPN3P_NEJN-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407260099



On 7/24/2024 1:38 PM, Krzysztof Kozlowski wrote:
> On 20/07/2024 07:28, Jagadeesh Kona wrote:
>> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
>> sufficient for clock controllers to operate and there is no need to specify
>> the required-opps. Hence remove the required-opps property from the list of
>> required properties for SM8650 camcc and videocc bindings.
>>
>> This fixes:
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
>> 'required-opps' is a required property
>>
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
>> 'required-opps' is a required property
>>
>> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
>> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>> Changes in V2:
>>   - Made required: conditional and dropped required-opps from it only for SM8650 platform
>>   - Dropped Krzysztof Acked-by tag due to above changes
>>   - Link to V1: https://lore.kernel.org/all/20240708130836.19273-1-quic_jkona@quicinc.com/#r
>>
>> .../bindings/clock/qcom,sm8450-camcc.yaml     | 26 +++++++++++++------
>>   .../bindings/clock/qcom,sm8450-videocc.yaml   | 25 +++++++++++++-----
>>   2 files changed, 36 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> index f58edfc10f4c..8698c801ed11 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -21,9 +21,6 @@ description: |
>>       include/dt-bindings/clock/qcom,sm8650-camcc.h
>>       include/dt-bindings/clock/qcom,x1e80100-camcc.h
>>   
>> -allOf:
>> -  - $ref: qcom,gcc.yaml#
>> -
>>   properties:
>>     compatible:
>>       enum:
>> @@ -53,11 +50,24 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> -required:
> 
> You cannot remove required block.
> 
>> -  - compatible
>> -  - clocks
>> -  - power-domains
>> -  - required-opps
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-camcc
>> +    then:
>> +      required:
>> +        - compatible
>> +        - clocks
>> +        - power-domains
>> +    else:
>> +      required:
>> +        - compatible
>> +        - clocks
>> +        - power-domains
>> +        - required-opps
>>   
>>   unevaluatedProperties: false
>>   
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index b2792b4bb554..2e5a061f33d6 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -40,15 +40,26 @@ properties:
>>       description:
>>         A phandle to an OPP node describing required MMCX performance point.
>>   
>> -required:
> 
> No, you cannot remove required block.
> 
> To clarify: there is almost no single binding using your style. Even if
> there is one, then 99 others are using it differently. Do not implement
> things entirely different than everyone else. This is the same for C
> code you send upstream. No difference here...
> 

Thanks Krzysztof for the explanation.

Hi Dmitry,

As we discussed during SM8650 camcc and videocc changes, the MMCX rail's 
minimum voltage level from cmd-db is adequate for these clock 
controllers to operate on SM8650. So, we removed the 'required-opps' 
property from their DT nodes.

Although 'required-opps' will remain in the properties list, it’s not 
mandatory to be present in 'required:' list, as it is dependent on 
cmd-db minimum level. So, can I please go ahead and update these 
bindings to remove 'required-opps' from the 'required:' list, as done in 
v1 of this series.

It seems unconventional to make 'required:' conditional based on the 
platform type.

v1 link:- 
https://lore.kernel.org/all/rbej7rbjiwtgf4reiomtmlv3ef3ljfys5yfzypigrertylucu7@be3v65aeuimb/

Thanks,
Jagadeesh

> Best regards,
> Krzysztof
> 

