Return-Path: <linux-arm-msm+bounces-86172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B4CD544D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0126301A196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082FE30DEC6;
	Mon, 22 Dec 2025 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNXk8MHW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZjzxaox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFFB1E9B1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394813; cv=none; b=mVJZ50rtG6VdU80lhnIHGGbp9IYLqeLPx9VMMrO97gdbuS2hhCZHRp2lPDl9zPS92GLy86Pdcnr9VChU7Hik7gKn8VbySKJmSRHQ7uF6FH5OP2pmb5kzPqnvP3W7Ym9i9GPeHgTYCAh4fXZNqRK8jHjmQwwlO+L4VjoGJ3hogeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394813; c=relaxed/simple;
	bh=BJeOqXkJ+gmd4ey7vsHhoKygIOlUYG3FMgsO3Hglj5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hE3LAscsDhDHiX+dQqPvpuf+/Qa0uI3SOyDbD4p4DqWVzJ6ERzaDxcxg6i/xBATG44PPMnzOvRq10uf4nnMZ8MaZCWahb1jFT7IKm/QkScxmoyAEiSjaN77spMkUifYxKI+wCk3hD19KVMl7WhTJf8YgEwLm5KXA8bLopUJ2Y1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNXk8MHW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZjzxaox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8Mslw3783327
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqF0tpex94rpEoICa6Aj75C9O9nCknYNwHd+NudJrug=; b=NNXk8MHWCtebpRqC
	M8Zghky+FRh469zAi+tkykKpj6fgrx3H17BU+MsyNGF5S/Tws0hPA73FygFTZ6nW
	URmKNvV3/yEDYiIXgBfVD5L8DYRPBG5HJY8hZNHcPRs6MdMsZ9jbTI1MXIa2Yhqq
	L/3UDzfedTj0no+0xurYBeIjWYqzYG4XxdErZfvLq2JD14kYN7mE7T/mQ0QNE/xh
	9t/JD0GXX9FPnW6v8v4/fjDNYcY/Wy4N6RpgKKMdd7p8OHunJ970AYZBNtIKxOad
	bmg+yc5ONttLC2sotabDwiZ/CO6NXTFOy5UK1eUhgno+qkarH0Uat8tpGJp4jhF3
	WdRSjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4egp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:13:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so971395185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394811; x=1766999611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqF0tpex94rpEoICa6Aj75C9O9nCknYNwHd+NudJrug=;
        b=GZjzxaoxuvA9hvu82dTOAmFmCyCIdl3/NIbULn59tI4z97zBqwV0wHmL8EXnjdHxuq
         BNI0EN5ntBP6D9vzx1NIMcOvMibRULkVxM5T2zPRyAnIsAw8xGNtcU4adVdhCLy3Bjf3
         VvcelaF/dijZCLTY9f/5nymmfV4xHFm4ifq7CYJYN/PxrmpaOorT0JaSN3Ja1yoU9Amv
         Z1Qni1vSFDSwg31YDjUtgHf6NG/vXuIFw7lcrKkoeXqbvh2YSGaZVc7bMD5NuVNaFJuN
         8+pbRJRr8HvpbTa3COz5kvCy9w/XhmqbediPMBhp2P1s/6WCdWQDkurF1STFpeDaXptZ
         Admg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394811; x=1766999611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqF0tpex94rpEoICa6Aj75C9O9nCknYNwHd+NudJrug=;
        b=cIgQMh7mD8UuhNZn7hQvwPaTF5xUhXnolYyKchz4vrS6k94I9AdHa9qXgBpP0WTsLz
         YUhtahpwEikHHqL7L2alv2TvGzac2qoLJqI+j1yHRqJo+DZFStI9r6B3NDfA8oDbr27t
         dBDFof1ivQtw09y80n3tAMRgsnPC7OjJlXPVIRV1QSUeXjJoWpObww5qbaDAu5+jtpZE
         L4wtc0ZaKAzijODMei9y4mUbvNp7i86/PqiLuAS9nQnFDxwfxuiNryAyrw3Q6wlsUH3L
         OPBoH4s4OQF/SyM3U9iw4aY6tKOmSBgVwaUxF8Desg8lKsNeZ1H/whiFMf1L3DlMiKxD
         kwbg==
X-Gm-Message-State: AOJu0Yzvhifnqi9bGh9TYjS5nPUc3lmF5tXqU6IoS0T0bgL5RR1Vt141
	ph0nCpOXuWT2MBMNL2OGciJsupsuRN6i1GDMdwSplGTUO99/9YDksbZVnwqwE+JD+NBIMc7VkDe
	KonhDV51Xa4Zb3o2xbLwfr6muWnAY6rUAtq2AydptorncD/OnnK/7vg703dEPUhRUyOKr
X-Gm-Gg: AY/fxX6XLfcxv6GMr34xDv+v5twSxOUQYnS6IjnAtzYMsNXSRsypEvnaY2AsMptzlo/
	9wQbRXHLOi2JZGe8x991eoPX19uYm9mf71lQBhMAK0In2oalJzIltZcZfs40iPNBGipC2eK/Je2
	wNlk+5WXF7oQA7bb/Y3NMI2O+/ZXdSKEqT4BOZDKobWKnIqmN0EtF+6dXBZjVA/3gP/bTdgXfCe
	8TwRSjKkKS4TyCY1MDTkBkk3hfpZtOOOf8ekqEB/s/FQSjwaqmdxkJ5HBwYq3ISNGYe7DaaJwud
	p9XcShs3gtp8nZwbPZGGQQANY31gaY0embSGXqJXuhnWK0FLFcbxU5kQW9JxZyQ1AHD4oTr1imI
	b0DhoQLB5GdfvCSLAw/vNSo1GB6i5a5ecQ4GtLIZ8OGD+XfdyN3mmS4209k8YR877O6PqsNC0
X-Received: by 2002:a05:620a:488d:b0:8b2:e8c8:671d with SMTP id af79cd13be357-8c08fab8c1fmr1561110985a.60.1766394810485;
        Mon, 22 Dec 2025 01:13:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAJFOrhua+PwEuHCg/SaU/Wr+jBLNxn41/9mdZDkJu/5KHT1a6R2NUsCuFMyeB3zWinmh0jQ==
X-Received: by 2002:a05:620a:488d:b0:8b2:e8c8:671d with SMTP id af79cd13be357-8c08fab8c1fmr1561109085a.60.1766394810076;
        Mon, 22 Dec 2025 01:13:30 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09678afa6sm802747285a.2.2025.12.22.01.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:13:29 -0800 (PST)
Message-ID: <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 17:13:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfX6ABButLBvSds
 cCUmF+xgVeQTNpKZ8fNlTmN/viEmtxH7sFzPdgIzXaTIjsVH9Lvzu2N2wdL6owxLBmMFAog3zRm
 hOTRfTxmIQMQiSlCWxnnCD0VB+gFFkxFfcIxz2xNbKpGYGGzGX0QfPXq14Mi0FtSBIJi6Y8FXOp
 wzCIBe9R4rVK8nizl48VZsbQ/tS5ipJeJdNANWFEPLG7rO/Ecv6HuC2wB/cnbtSn0/bVTRmYJYk
 gSAAaHafC1sPavWytlvgdrQ1XyyZpOe29U0z5BETbCiH0YTdJHBuH0fWJv/it/CYdT6yeIDj+q1
 J+W77cwyKg7NhsuHJxvLmuVFWHtVHEvj/RlEm70YXMbEHsbsCrErn5dgjaZbCL5WKuy3mAkoF1B
 tnZZFmcs3eq7xLMpcv+veHDbOMtLDkJxnkYVRKB2QQ2R0XaschjsNZWs/WVFfOqhTUCeklw5KNi
 KJbxCE0XE/XjmfI44VQ==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69490bbb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3ub0lqJSln3tGTLoGTkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: kkhJgoBgQVMj34kPPrHQy27GcQrU0fKd
X-Proofpoint-GUID: kkhJgoBgQVMj34kPPrHQy27GcQrU0fKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083



On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
> On 22/12/2025 09:44, Wenmeng Liu wrote:
>> Add the sm6150 CCI device string compatible.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - qcom,sc8280xp-cci
>>                 - qcom,sdm670-cci
>>                 - qcom,sdm845-cci
>> +              - qcom,sm6150-cci
>>                 - qcom,sm6350-cci
>>                 - qcom,sm8250-cci
>>                 - qcom,sm8450-cci
>> @@ -263,6 +264,23 @@ allOf:
>>               - const: cpas_ahb
>>               - const: cci
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6150-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: soc_ahb
> 
> 
> Isn't this just camnoc_axi for this device (pay attention: to this device)?
> 

On this SOC, both soc_ahb and camnoc_axi exist.
Is it suggested that I use the existing ones below?
  - if:
       properties:
         compatible:
           contains:
             enum:
               - qcom,sdm670-cci
     then:
       properties:
         clocks:
           minItems: 4
           maxItems: 4
         clock-names:
           items:
             - const: camnoc_axi
             - const: soc_ahb
             - const: cpas_ahb
             - const: cci


Thanks,
Wenmeng


