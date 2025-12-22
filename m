Return-Path: <linux-arm-msm+bounces-86221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD31CD5B65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD88B3017EC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068663191DE;
	Mon, 22 Dec 2025 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjRHVZd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N59LyUzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749621FF35
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401382; cv=none; b=GdXdH98GGE0asmPj7aC0NmAey8wYLTYPpdLKGXRuDpMWQbdpBeNnE3hJNnbPOHxm+IjWqNBv9nm7BvkZ6qI5k7u5FKmJlT10NnF2JPB1lE1T4Wb5k6PcSpb4Tqiqt+ErX4TugozUGxeeJiaeEeZ5orU/RxBetGHhJwqHrJ6/S7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401382; c=relaxed/simple;
	bh=V58aHeBvB4nTNxTrIGwrE3WLIbUB4XyGJoqOW2PqIao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncoXwjj0xvt4dwFCAne/YuZC90t/uYUm/a3Hv0Kk6CroCKQkO18IcYSrkXOGlxY5Jw+w9bsA0Jf8+ZlBWNjXmGgc5d6hGN/tfQwo8VvlkbymVrSDzAavL+JrrMaqsVq4VvtT9DawtJ472X9CCUDlvcjkm9wviWN4I8nkP0bzQH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjRHVZd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N59LyUzV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8lauG3964461
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=; b=BjRHVZd/3nQ8hnOP
	NhIrhAjKw1Rchi4jS6RJYfv8P26N+OWl/TJesrk2oj4rP6MzGOMx347Xif+vDwgn
	dNZpcn7vpGEGGPSR9T58rFDm/1bYT1CnJ9M5u9CfJwGIBDZvhHrmztxrDZLBZu9m
	wQcwa0cWqlBZqC0kbCKxfyCiwSEYrj+UlZwpIAsCEl85fUz4ETuVSiyVuEQ4ZPsS
	Z1K0pdg1AffVMgjID1hIhv4NFTwDZsJxidqRPzgIFV6efH6bJEMopSFIglJWff50
	grzhbuL/q+3wOpKIn7cXKfMPGmXSaL29WJLKH7TfydIzU95CkEmqrCTHNQXdtwAA
	TC6rjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hg79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:03:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1052157485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766401379; x=1767006179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=;
        b=N59LyUzVpB/0MkOxd0AjLFZK5/Z79Nzo1egC470CPA1tAuHgKXSBHyXxzvQB6CoIy2
         0LLgV31C4NUpcNJvqYvaPJ8Qkx1ZxGIPBqcu/tEgTujWr/7Rbi6dygOer1Er4tK+v7NL
         ZOD4BRMYf6vXipSKwi2wjMOFcxWfGDbn23CIN2NkbfCYRQxEJVRZLXYqiDdpclGBoBfn
         VWNv0rHrk/s8lSTwf1IAgBRw6gorxxsWX4sLQVF6oNNI2LPXFip6Ivpb8s9xnC8m6d7H
         cDoHfbvFh5GrH8KYrQqdJtPuASpuejD9waFNaT7YlLhwrJX2vZb1k9nmow7fZce2bJVn
         pXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401379; x=1767006179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=;
        b=oPsdsR+TH6VUoWGDD/qUkpn748Q2txyPO6MGBo1wZVC3xOFKCylRUdTs8TAKAZgxxy
         zDaOl7IBOBOsJs78uofiMzhGW7Kh+2AqnM5ns3B8gZOs8hqO4g3eoPPNsveDV97AujM+
         76+hV205pboqd+hLpJrPfwelqTqw9SbR3XMkr5jHbnaXZyxiQcEDx/i97F1AeKgyyJov
         RiDlDbtBb9YSKzqBsAL40DmpiIuZ/BXe785o6PgyKDHE+rYuxU+z3TVpTWAS44Xt+BgG
         HfyHK6HM43MUynWWy3rqO6ojKb+EBe6xy1ER79j5K+lCd7HCC99GYcOysOba75DMrpaU
         RdPg==
X-Gm-Message-State: AOJu0YwSWYJR4Mu9ipO3VuUujPmUvFQRUEmSAGgkbcDeZQwUlyOO0+X1
	pnLHI/p/85fi0nypqJxm1CpUe2vDZM1IH+LjqBy5ho4Le0u6nEX+EyZZiCSO+LGYUOpS7EIp4eC
	QERlM9dEJ0hm9PrWVIYA0bj6irSg7NpUrk9xg4OJ8q2lPilPIkH6ZXZn4SAAXJ0GEl7Ro
X-Gm-Gg: AY/fxX5TQ7oQNu4pdaEimx250ewuObgATOr3yhx1JJGwSI5PcrW6oH4fXB1VtD0Adp+
	TnhrVmlcAZqaimdmJReh+yJ2Jea8uGne5SnPsnrrzGTD3UEpeLCPVpxA/ea15W25YHxvhwz6AXN
	mF8iXT5Gux6jAwYFZmO0kGaLavf6L4WYl/ZcT0tKGImWZzW3Yk/K7zueY8OkJ8Tm9E7c2cbwaQG
	6X8XH9tYrFaX5aT0de19DfuPoG8cdDUUSPRuLx4/r5M7RSgZN48Wkd5Nq1YyNfQkqbq8P5B2lpR
	c1emaXqetqRpZnfZT+ubNBDdxPI2iCI+UtdioBdvft79mYgGF9Xr4PjU5wI146EG1IOQTeNRrq7
	qgPogy9aX2V21rhL3YVdAzCM+uFxabiwAQZnRGay+6JADDeOXJNRVm6g2/EuCiijaMKZkAaq/
X-Received: by 2002:a05:620a:2697:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c08fd32cebmr1637527785a.60.1766401379477;
        Mon, 22 Dec 2025 03:02:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFgc4/mbxP1v0Y6Y+66GXLM/In3vvQag3zr/Bzdv0DzMO4r//tvzBx5y45NhOvo3FD7nI95Q==
X-Received: by 2002:a05:620a:2697:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c08fd32cebmr1637522485a.60.1766401378889;
        Mon, 22 Dec 2025 03:02:58 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ef6a7sm777484085a.55.2025.12.22.03.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:02:58 -0800 (PST)
Message-ID: <a371b7d4-4a6e-4d9c-b86d-14b4cfe7a6eb@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 19:02:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
 <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
 <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
 <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iP-Cnz6st-t9murxqaIi2jqFqx2nlBlt
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69492564 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jtnMdLYT_4TzbHYvX8gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwMCBTYWx0ZWRfX46dRyrwEaTyI
 FjAVIsmlMjdkVUcTcXf+OpubY0HyuKPMObZzUzkOhrQ62nxhUhiyPPf+RI8MGJt00C32hgzBoFZ
 n/fXEvK7P3trDpBrX7NpIPYBKiWPLpLBh6DXnQZ8rTtfY7DJj2DmWVIEVgyoZj7vnGEJex4K2V0
 qLeUNcE2TEMnpWWeK132jMhJsNJIGNkCudVR1Puy1MaVXawOhpSnhmvGS7GJ4GO+QuCyOxcc/YQ
 odHKt6i92dDnnJhfhdKnduC5fXALsfpiCES/P9lGDUevqLdUALL6moztV3UBaoz/NahNPach6lp
 NpdYTa954WuyIgPI8UDdQ5EFeAUGYAj+sBGjmE5aNvyGvohbovt0KdK3eAM7VCF9G+kz1fSXRRq
 e+EQ+a/N10kNvSTjfrGkdJTgW1Lefy4HRz9iJ/Q0jW1Lh4XwlEsajmvTQcvXwK7lcEsbaLKFpmq
 H5lHTUrlT30kf4/qrpQ==
X-Proofpoint-GUID: iP-Cnz6st-t9murxqaIi2jqFqx2nlBlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220100



On 12/22/2025 5:49 PM, Konrad Dybcio wrote:
> On 12/22/25 10:13 AM, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
>>> On 22/12/2025 09:44, Wenmeng Liu wrote:
>>>> Add the sm6150 CCI device string compatible.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> @@ -33,6 +33,7 @@ properties:
>>>>                  - qcom,sc8280xp-cci
>>>>                  - qcom,sdm670-cci
>>>>                  - qcom,sdm845-cci
>>>> +              - qcom,sm6150-cci
>>>>                  - qcom,sm6350-cci
>>>>                  - qcom,sm8250-cci
>>>>                  - qcom,sm8450-cci
>>>> @@ -263,6 +264,23 @@ allOf:
>>>>                - const: cpas_ahb
>>>>                - const: cci
>>>>    +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm6150-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>
>>>
>>> Isn't this just camnoc_axi for this device (pay attention: to this device)?
>>>
>>
>> On this SOC, both soc_ahb and camnoc_axi exist.
>> Is it suggested that I use the existing ones below?
>>   - if:
>>        properties:
>>          compatible:
>>            contains:
>>              enum:
>>                - qcom,sdm670-cci
>>      then:
>>        properties:
>>          clocks:
>>            minItems: 4
>>            maxItems: 4
>>          clock-names:
>>            items:
>>              - const: camnoc_axi
>>              - const: soc_ahb
>>              - const: cpas_ahb
>>              - const: cci
> 
> Are both AXI and the two AHB clocks necessary for the CCI to operate?
> It wasn't the case on other similarly-aged platforms
> 
> Konrad

The test conclusion indicates that all three clocks are necessary.
all of them are necessary.

Thanks,
Wenmeng



