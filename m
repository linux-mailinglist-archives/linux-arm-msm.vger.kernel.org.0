Return-Path: <linux-arm-msm+bounces-66653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A7B1197A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A52B7AA332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 08:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3C2205ABA;
	Fri, 25 Jul 2025 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVkarbgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE381DA23
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753430597; cv=none; b=AqmLiJx1RQsT9Wwd45aQsodRhynyBGunwelFw5IaT7hBOFRCKrpoeY+IDCPyLO+VoHflETmCshNYN4ZekLVFgZHNrPw7yCBV8qQpJUk36jxI0V/DivB7tnlGlT/h7QHq6DU+/KN1QNbIClI9UU/gp2wW/l46MpzIygPmc1OyP3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753430597; c=relaxed/simple;
	bh=RiEMJlr5Ad7E7QBTCbokE2mQrnmCQiB4o1Vq9dQ045U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F//rON4p7tWNC6dKEhHOjN4FCb8nVJ8Td+zMDhb8VOf7flUNOQfs9FiuGwntysWy0TKGCuFAgXS5XJphU5emu0cG1+S2LViqYQbp3k7LMLNrRs/mtfHMzCrP8kfyl0UKyvuawKsNGhHnxOTHl5YTJL6JwhK4OX0dq+5Wgq3EtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVkarbgo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLmUwZ009323
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gbtfcu6uHop71TvodFK0hd1UxxiGo/jNtdYvZ92lnfM=; b=kVkarbgoKnPa38Ma
	FauZy9kThbDeL5qmC1NhiM8xZAihknJAwv1jQ88mHvVqbqSOtNdAsDMUh2K5go+P
	53b+33CMaDhhjTIk0JmiYbq5N8DXLotff7IABZUm5IkHjrMw9/INKd0mL6atzhhj
	MqQvrwuTbO1+lmNxFR0+uF3sjreooe6CxUz1jEEN8V6ftB31WAApRkCynP7Rh9iB
	jj2gJCdNX+hv+jZNwjG5sGIJ6v6U+k4EUEAwW/WOnZ9FRyaZ6ed6aDGLY/6hdKOZ
	2txXEJPW3WhUinuBSG2UBuFZp7geuMP1TkILZQlyv3h7FAgq0bKqdBWcIuMSn9c0
	8wo4lQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2t1ab0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:03:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3f76a5ba7fso409799a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 01:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753430593; x=1754035393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gbtfcu6uHop71TvodFK0hd1UxxiGo/jNtdYvZ92lnfM=;
        b=E6OJmuyS4NxFAyhcgk6/fbbYN5UO78OArKSHLzv1hSECYjnqb55HYQOhs6s967gvcC
         nnVWSLcPSA23j9R0WzZtIdJqNoYyQCO2SZs8EnH0qrbvH0uXBbZyd1QNFQ+yP1vqnJUn
         Y9yBDNIZWE60NpU1D1P7mYwpQ+JYDZKg+kahX44ApOTN8NaoLOG0fveSN2YXL6UGrNkA
         49LPqzVuGjePrUM+kkFEl3Wfy01oXHi+eD0whmKI149uNv3fiMkwYi/xluNBglvHTScO
         kZIh3MOFG2bnaUflo9dvz51N3YUeiHmAAj57uxiPJXU1FogXqMPQAapLj+V/Ci3jKChv
         TTVQ==
X-Gm-Message-State: AOJu0YxH8v6DHIfzJL+tOLNVc+hqGkKCi2YW4HyE0Cv6HWRpBQDCg+Q5
	clVp5BDm+WVSnui1IY0mzAX0B6oCbvFsWnzbWm8ynWrYJuDgQJQRhTkGimHflfXTD5U7l6fcvJp
	MHeWtZQrjZkz+ugzrvUu58/CfRxZ6WnH22T+jEGWTECVULv/5ynkIvh8ZGcHS3+CK7eVj
X-Gm-Gg: ASbGncuGQxoVMkh7FgqGl2Uxa+E61g0qbUg+vRfNlGHz+aphDF7fghss2E+GLZ26CEc
	yx2q0Wmsi1CdbcMB9ja0VPZPleM1j1MIZMgj5Y7XZU/G4bLa8m359rvy7SLugOVaWCex83Fu4pm
	/gB9FYhUJJNRM2S4Gtxwi67bLHnsnADBTZnTc+ORtxaImNVrlexoRtwU6q0gJCiZ57bbWpkk3cf
	pwj4QOe48ld36/CltDyP5sXGe5I0oacW2Sp523ysSffw1eEVrVm7jxaemfRReig9uLo4aE5Zbtf
	kz1GuTB7AYrqzh9QBCSQfqi7TmvGd6mFXgkcM7RWgXfiyQu2t5RELje+QYpBwX8IEbde0yoSo0p
	DdjUdxNcC0ls26fkXKH4bJADSY/w=
X-Received: by 2002:a05:6a20:3d88:b0:232:813b:8331 with SMTP id adf61e73a8af0-23d6ffe8cdemr1470148637.2.1753430592952;
        Fri, 25 Jul 2025 01:03:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwDBAwcAVmAqN/bBqzL1eUtNkX43ZuhXthRUE59WSNoYyMYG02D7jEEthZPJAa75pLPXHtZA==
X-Received: by 2002:a05:6a20:3d88:b0:232:813b:8331 with SMTP id adf61e73a8af0-23d6ffe8cdemr1470089637.2.1753430592477;
        Fri, 25 Jul 2025 01:03:12 -0700 (PDT)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f6c09a1absm2857148a12.23.2025.07.25.01.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 01:03:12 -0700 (PDT)
Message-ID: <3803aed8-3b32-4a7b-860f-8fe049f5ddee@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 16:03:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
 <20250724-hamoa_initial-v2-1-91b00c882d11@oss.qualcomm.com>
 <d49d2755-2967-4bb9-b789-8be5f138d4cd@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <d49d2755-2967-4bb9-b789-8be5f138d4cd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BMKzrEQG c=1 sm=1 tr=0 ts=68833a42 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=slic9b_SWHWCqRcW-tMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: L4p1vLsmpVKljpizx7PDIppIWJFvVajm
X-Proofpoint-GUID: L4p1vLsmpVKljpizx7PDIppIWJFvVajm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA2NyBTYWx0ZWRfX5gItqLe8w4A4
 0lkP96DxlmHOxNaO7msMbuQXVneeNm+1STORj7gy1/4pXknF1rs1Ve7UL9tZU3Ac9rdUyNe8HbC
 RG4mbBoY4hWAzVAtYIu7uy2gqGR7e+qxmvN6NQ0c9qBCR0t7sKv5e7lTY+VJqFgGh0TtJw1fMkH
 7wK/t/+WbYGNw/8i+28XVlyREOMdoJVbnyAkoYBLOxOelc0jboJnnK1aC1yRZMR5UP9WwykT490
 opFBWaq0YR1TBsEopKMnfMP9ZBLT4Eg7wqkKwdt30fyiz8K0AqKnMiYvJ9nDLz01t/YMe2qyjNB
 BOcOeATWGxGQsA0Ab1/zf4Kif4hXgyhmwISYC6atYu5tJ2mno5QGOMD2I1ZM8MnEGIWW4H8F9XB
 ZCccFDuZJgBB91imhZlf6ihuNNMaAVLOwwi9I+iwuBhtv2FVm0fsO7hg5HrWsrcXSekWtWgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250067



On 2025-07-25 14:55, Krzysztof Kozlowski wrote:
> On 24/07/2025 10:15, Yijie Yang wrote:
>> Document the device tree binding for a new board named "EVK" based on
>> the Qualcomm Hamoa-IoT platform.
> 
> What is hamoa-iot?
> 
> Later patches claim this is a SoM, so explain here why you are not
> expecting it to be used outside of EVK (not following standard SoM rules
> like every other vendor)?

The SoM can be used outside of the EVK. Regarding the standard SoM rules 
you mentioned—are you referring to the expectation that a SoM should 
have its own compatible string, such as 'qcom,hamoa-iot-som'?

> 
>>
>> The "hamoa" name refers to a family of SoCs that share the same silicon
>> die but are offered in multiple speed bins. The specific SoC used in
>> this board is the x1e80100, which represents one such bin within the
>> Hamoa family.
> 
> Isn't this obvious from the schema?

This is the first patch set where the Hamoa code name is introduced, so 
I’d like to clarify the relationship between the Hamoa family and the 
SoC ID. Additionally, I want to explain why the compatible string 
includes both the board’s code name and the SoC name.

> 
>>
>> Although "qcom,hamoa-iot-evk" is introduced as the board-specific
>> compatible, the fallback compatible remains "qcom,x1e80100" to preserve
>> compatibility with existing in-kernel drivers and software that already
>> depend on this identifier.
> 
> Not relevant. This is x1e80100 SoC. We do not explain that
> microsoft,romulus15 is using fallback x1e80100, do we?

Same as above.

> 
> You explain less relevant topics but you do not explain the main
> concerns here. It does not matter how you name your board. Can be hamoa,
> can be lemans - we don't care about board names.
> 

I will add more details to describe the relationship between the board 
and the SoM. This is what people are most concerned about, right?

>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 47a7b1cb3cac1150bcde8c2e2e23f2db256ab082..f004019c5691e0a9a3d56a0e3af395314ceb3745 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1161,6 +1161,7 @@ properties:
>>                 - lenovo,yoga-slim7x
>>                 - microsoft,romulus13
>>                 - microsoft,romulus15
>> +              - qcom,hamoa-iot-evk
>>                 - qcom,x1e80100-crd
>>                 - qcom,x1e80100-qcp
>>             - const: qcom,x1e80100
>>
> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


