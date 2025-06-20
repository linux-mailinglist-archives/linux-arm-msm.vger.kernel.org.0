Return-Path: <linux-arm-msm+bounces-61879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB01AE1720
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 11:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B6511642AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D659F27F75A;
	Fri, 20 Jun 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AHCFnIGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281312356C7;
	Fri, 20 Jun 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410491; cv=none; b=s6DBL62dofiFp5XQ6DyHr52maBKDlq0/DjoozaAOa/mCghKfSRlQtLQeTWieyWf6n4+SROU9wHtfUbdM6kjXblTvSCAe22ZmbYrCbbQR8OMG83tEyrpcK4JnylAuHTlqy4scKb02YShj5alnvS7Q/fgZTZU/pi3xzgoiYe0fHxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410491; c=relaxed/simple;
	bh=eAH/XWhV0YrJEAGt/Il57b1YBMEoAFiYpmzuX8AHFt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S9aHkGu3Ew+t+w85P+XHf6EfWOqBYaFNPMlQ8h9FJOabknLe4yJnmaXlf3fOT0Li0sxm+Dq2uBEMpXGiZ1nByDzglt/w19k5Z00LYduvbRH5RzaWU3fwrWXZw/A9Unm3XkFx6jbITBiSpce/Y94N3Fj+f6Tpy/Z2WTp9J1NfaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AHCFnIGU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4VgT2018588;
	Fri, 20 Jun 2025 09:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIlhP34fZrQL0p3bEORFQhswmsGeT8lZPBkZZMP17rs=; b=AHCFnIGUFKfKXYWZ
	aS/x5MPtNs0J7TUd/fnYOYr9AwI7lSqFe7Ov/AIbS/wEX9cqgQRNh3NwtdbkJF2C
	ei0mCVUICWGpcds3t+HEMwIIvl72dpejpGGPPh7T7qHqX/x5xwZiU4bwAU2kp3RE
	uVx+OdZTxDtSDhgnD+vbPVpYYPtEDUqt4dTUtEsIF8tKf1j35LYJ8WJi+h4oeJIL
	odQYQi2TdNzBi5sctkAuiBNje/8BwHuv/aNtPudeikvCieCPWTH57+ZHBcATPl7y
	ZYI/LRJBhPv1yodx8b2Vd70BYxJ8dlp4hPO6MeaPH4X/Rc10e/SODMRpz0c4u8Cv
	J0FfzQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d0pcgqe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:08:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K985Bh014393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:08:05 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Jun
 2025 02:07:59 -0700
Message-ID: <9e345e90-58e6-4755-a0af-8e0b4ccd5d44@quicinc.com>
Date: Fri, 20 Jun 2025 14:37:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <d1ffbcf5-967a-4c1e-9f2c-becc5fb6c6ed@quicinc.com>
 <a3796e76-d597-4c0d-ae7c-d042cce564a5@kernel.org>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <a3796e76-d597-4c0d-ae7c-d042cce564a5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XTSWE4Sv_90BkLJb9rPSjfcXl0D6EZSz
X-Authority-Analysis: v=2.4 cv=YKyfyQGx c=1 sm=1 tr=0 ts=685524f5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=fBqTZhuuraqRRh6TpvYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XTSWE4Sv_90BkLJb9rPSjfcXl0D6EZSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2NiBTYWx0ZWRfXy4Gu4uIaBaMU
 lwAjqpLkzirQKGcuMkU0noOto5ZU3gCNj/NSjNQ97Zm2/i6856vPyPG5CE5/YKZfjLoGU0HtIGg
 5+5jA9k8J7Yh2UaW8toGIealWcefe4emBd8fzJqoa0zz9CKwOdpudoGcBpoAmVgtJVIvT8bq2Qb
 nTLMQxfzdoHTErQ5W5gdK7+wHMcztGeySEC/WTLs1YzT51hsagQyDFz7n3K+ocuPiRk8lBVvIps
 8IRJRep8Xjrb3TGyi3xrF9k9c5p1C/xIMjY5w1n2plA+33C8SfsAr+vya8wuWAmczPKg+jWBe72
 o7lCEau0rTMETRtNLlvFu3nIr+0zu507vrClcgJdunr+PZYF3Rq+B09LfsDCBrXlbRfJp8rdIIc
 +iFdrLwtBEfFJ6E6aDUOt8qn+2JUetXoL/Hap29ooVOtrRelXHPFtfBFIdrX5M1cpUV7vMZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200066



On 6/18/2025 2:38 PM, Krzysztof Kozlowski wrote:
> On 18/06/2025 10:38, Sarthak Garg wrote:
>>
>>
>> On 6/18/2025 1:13 PM, Krzysztof Kozlowski wrote:
>>> On 18/06/2025 09:28, Sarthak Garg wrote:
>>>> Introduce a new optional device tree property `max-sd-hs-frequency` to
>>>> limit the maximum frequency (in Hz) used for SD cards operating in
>>>> High-Speed (HS) mode.
>>>>
>>>> This property is useful for platforms with vendor-specific hardware
>>>> constraints, such as the presence of a level shifter that cannot
>>>> reliably support the default 50 MHz HS frequency. It allows the host
>>>> driver to cap the HS mode frequency accordingly.
>>>>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> index 9a7235439759..1976f5f8c401 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> @@ -93,6 +93,16 @@ properties:
>>>>        minimum: 400000
>>>>        maximum: 384000000
>>>>    
>>>> +  max-sd-hs-frequency:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: |
>>>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>>>> +      High-Speed (HS) mode. This is useful for platforms with vendor-specific
>>>> +      limitations, such as the presence of a level shifter that cannot support
>>>> +      the default 50 MHz HS frequency or other.
>>>> +    minimum: 400000
>>>> +    maximum: 50000000
>>>
>>> This might be fine, but your DTS suggests clearly this is SoC compatible
>>> deducible, which I already said at v1.
>>>
>>> So now you send v3 which is the same as v1, so you get the same comments.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Introducing this flag no longer becomes SoC compatible because as per
>> discussions in V2 patchset with Ulf and Konrad this new property can be
>> used by any vendor who wants to limit the HS mode frequency due to any
>> reason. Thats why moved to this generic approach again in V3 as compared
>> to compatible based approach in V2.
> 
> The are no arguments provided in favor, so my review from v1 stays. You
> get the same comments.
> 
> Best regards,
> Krzysztof

@Ulf, @Konrad — since you previously supported the idea of a generic 
property for HS frequency limitation, could you please share your 
thoughts on whether this still seems like a valid approach?

Best regards,
Sarthak

