Return-Path: <linux-arm-msm+bounces-75958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0515BB888D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 04:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 197491B21B63
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 02:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71DA21C9F9;
	Sat,  4 Oct 2025 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ft3a855I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F83211491
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 02:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759545724; cv=none; b=k7HGI7BZLUw/Rbe4R25GtE7Q6GX+8hZmfSEJOporJS7xLZjx2TZla0HrWoJV/1Cb9Obb3RneUcIPiA8NIa0XQMr1406OnRz+xBz4M5OgtVeZAwDaPeXYRxtsQ8S7bghV5J06PhvbwBh16rYSPipm5eDttN49951UVuzTdo4Lymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759545724; c=relaxed/simple;
	bh=GrG+sZoFKRUNsfWBm/ynu78GdpzwzH9S+BPs1TW4kbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkWujZ9KvRhzm4Z5t8aOZg/pRLZucWdHOHK0R4h+BZ2K+W2e8k3xrFB0ltph77/i0Qj2n7Lpbw6u5R+V5pp8gv333zluL5VviqkrQ9D5xlOP33znkx3/uSGAN6/2RpALbzGOzkkeEmg5mZDnc/9lp4aqaltRHBqa4ykW79qEVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ft3a855I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5940JkmQ023385
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Oct 2025 02:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LKTW72ANVRWqbBbs1orSLC8F5L2PbgtH5ZHTOYbBuc=; b=ft3a855IBg2OWRMS
	nbEgEinUC+Q4mu3cLXd85jjLj7n8OO+Ucb94YSBzV9M5iSWwKetL3Jsq4a017sm3
	cUwHRP5HjLnh0yHLysMi0QaZz40BiJsG+tY4MKyYaSkGLwsw1bDzdS/CGipJqsiY
	7L2gTQb0941neWt3rAVYORT29ZMYfGyPGsjyNAQdgDcOkbEVECBxvw8eeUiRALnq
	ei11ZUNXHGrhrTpevLeGySZ6xGBdvFGGSt/+RjFwqSjvI+U2NTgOodJBAHW9HoQe
	hFrKTcGbHL+aukMz9E71YIsi5Bo7uj2gsJ6GVc9qFoi8h6MsRCr0B67/lsDkNLi1
	WxBtvg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn05j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 02:42:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so2872738b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 19:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759545720; x=1760150520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LKTW72ANVRWqbBbs1orSLC8F5L2PbgtH5ZHTOYbBuc=;
        b=vhaPoicdeH5h0S5vqyI4yPXsqhfHST951gG1t9n2028duQo4t1BkQPiNNufnfeJACD
         tdL4ySURC22M38N+YiRSro6ri/iwTfaw92ynUpuRHbGZ3e3wGn84Cwaj4SEMq18zpuMs
         KNH6245MwUckN/ProGMQ7ZVKTbcQS97q05uGdysL4QeLlyq+cp3cFyTC7b0TkP8EeZFZ
         B879D4J1eAX96gc+wqIQB26yZHTyflugUaNWK4qi/R6as+xc5RRFr3IsXaTUv9YC7D1f
         peK8XfRSyrkCDhUKrr4ARQ732kLrskwMaN9LM+u6pPmq1oEztvwckXmos8dMo4Q754lx
         2fIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtoBxyEssNV4iRjhB88Yn62HTt2mTHnmlfA+bKl6T/qTy8lpA4pSwv62cmS7gtpdTn6LqwrMkbiS03yyHW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdd0u7/8yNS2zAcN/WQLoFMqmmO94nN96YjFGClslzV3iK1Y46
	NEhob0VMieA3GV/rwu4BLyFQX9ar3WkM0QITjPGIFJUrpeGj8eUsV8vZ7Mob+459I4n4YG1XKWk
	MSxBWpTAO6J8QkkT079XrIry1nx+esas/X2xefVap4r7u0/sUUYI6mKR3i3cxPVRwOkXq
X-Gm-Gg: ASbGnctLoVPewI80ctLusnCt52Kq7juYBKHm5h95QN+dfitmPdg5ykU4ej2SKTLygYk
	ZCk200RVEd1YwXKvL5Isr6uwmJHTOouc+FMYR4xK8xm1P3JLF1XLPLx3Ypj+LS+j6DfC+l9lKGy
	P1ceHQyU/y0CZLmONyEbU+fElcqW2ni0fM8Wnwv4dwI8gukgQNezxf4MxwfLByUqn61vPWoX2q1
	LV8RKJlLSfBcPJXxt0yOloMpKglWaM3etUMtK1ZOWZ1efYPYh4IoIcq6cuOTE8UA9s4WPDKITOo
	dsBk52D4HcgaYEOudvK7GmMDoUlxgz5/xS3nBqciayuAtDgGnFNHyQi+sHHRDTEb+V2TeQAtuEm
	Mlw==
X-Received: by 2002:a05:6a00:8c6:b0:781:2538:bfb4 with SMTP id d2e1a72fcca58-78c98d5cb4cmr5364057b3a.10.1759545720378;
        Fri, 03 Oct 2025 19:42:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoqhjBr0QjJZhFy4pINP5TXEFjwtPrvEKpTZgZJvp0XgVHp0FpeliOUWBrj6cq1uLbRLNrvA==
X-Received: by 2002:a05:6a00:8c6:b0:781:2538:bfb4 with SMTP id d2e1a72fcca58-78c98d5cb4cmr5364023b3a.10.1759545719824;
        Fri, 03 Oct 2025 19:41:59 -0700 (PDT)
Received: from [10.216.33.177] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a2b9sm6189511b3a.19.2025.10.03.19.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 19:41:59 -0700 (PDT)
Message-ID: <a3158843-dfac-4adc-838a-35bb4b0cbea4@oss.qualcomm.com>
Date: Sat, 4 Oct 2025 08:11:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 3/5] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen3 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, agross@kernel.org,
        andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com>
 <20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com>
 <20250829-classic-dynamic-clam-addbd8@kuoka>
 <5d662148-408f-49e1-a769-2a5d61371cae@oss.qualcomm.com>
 <4e974e77-adfc-49e5-90c8-cf8996ded513@kernel.org>
 <a0e885be-e87d-411a-884e-3e38a0d761e5@oss.qualcomm.com>
 <8c90cc3f-115e-4362-9293-05d9bee24214@linaro.org>
 <5d4edecf-51f3-4d4a-861f-fce419e3a314@oss.qualcomm.com>
 <20250927144757.4d36d5c8@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250927144757.4d36d5c8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX5trGXFSEFGM3
 dUmZnJtaQVQTVt2peud2litfIdKt2v4/TW3tQv9QWf5NCAlHIfFesTsWrSjKS7zn50b3iADsmO+
 qXUWB/OIeBUBxhK7Mi7YiCdw095IgMUFuKIjZzEjse9VobGj+fHpDgfN/N7Kpsa3LGs7U9qGKSZ
 R2fFK3XTXE9AxjpfbxWCNI5EdNr0Yt/eY+oPPofD79kw5Ezbc9S6kizihQ4ZPWf2jlbPyGppaDz
 RepJiMID2Z+XGd4kcrtCsQW+xUPYNGeG5+qjfn1ECEa4eQmuX8qKLUmeEPqhhW1L+pBgKZ/KLRQ
 SDBs6CHKp36D+/w3u6a4RRPXFo0MyjhMsX4Vb0cDzzg73jysZvEI38+LuyRF5aSajQwLQMycR+Z
 Vm15biXsjlLlI999yFO8VNoy9orcrw==
X-Proofpoint-GUID: zy7dt_nKY2M44rMqGfvxpIM934n45_iI
X-Proofpoint-ORIG-GUID: zy7dt_nKY2M44rMqGfvxpIM934n45_iI
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e08979 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=u19HPSzwk6W4tZ9FH_gA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

Hi Jonathan,

On 9/27/2025 7:17 PM, Jonathan Cameron wrote:
> On Fri, 19 Sep 2025 20:17:43 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> Hi Krzysztof,
>>
>> On 9/18/2025 5:45 AM, Krzysztof Kozlowski wrote:
>>> On 18/09/2025 04:47, Jishnu Prakash wrote:  
>>>> Hi Krzysztof,
>>>>
>>>> On 9/17/2025 5:59 AM, Krzysztof Kozlowski wrote:  
>>>>> On 16/09/2025 16:28, Jishnu Prakash wrote:  
>>>>>>> You cannot have empty spaces in ID constants. These are abstract
>>>>>>> numbers.
>>>>>>>
>>>>>>> Otherwise please point me to driver using this constant.  
>>>>>>
>>>>>> These constants are for ADC channel numbers, which are fixed in HW.
>>>>>>
>>>>>> They are used in this driver: drivers/iio/adc/qcom-spmi-adc5-gen3.c,
>>>>>> which is added in patch 4 of this series.
>>>>>>
>>>>>> They can be found in the array named adc5_gen3_chans_pmic[].  
>>>>>
>>>>> Really? So point me to the line there using ADC5_GEN3_VREF_BAT_THERM.
>>>>>  
>>>>
>>>> We may not be using all of these channels right now - we can add them
>>>> later based on requirements coming up. For now, I'll remove the channels
>>>> not used in adc5_gen3_chans_pmic[].  
>>>
>>> You are not implementing the feedback then. Please read it carefully.
>>>   
>>
>> Sorry, I misunderstood - so you actually meant I should remove the
>> empty spaces in the definitions, like this?
>>
>> -#define ADC5_GEN3_VREF_BAT_THERM               0x15
>> +#define ADC5_GEN3_VREF_BAT_THERM 0x15
>>
>> I thought this at first, but I somehow doubted this later, as I saw some
>> other recently added files with empty spaces in #define lines, like:
>>
>> include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h
>> include/dt-bindings/regulator/st,stm32mp15-regulator.h
>>
>> I can make this change, if you prefer this. Please let me know
>> if I'm still missing something.
>>
>> Also please let me know if you want me to remove the unused
>> channels - I would prefer to keep them if there's no issue,
>> as we might need them later.
>>
> He is referring to 0x14 and below not being defined values.  So what
> do they mean if they turn up in the DT?
> 

Thanks for your clarification. To address your first point above, the macros
added here only represent the ADC channel numbers which are supported for
ADC5 Gen3 devices. If there are numbers missing in between (like 0x14),
that is because there exist no valid ADC channels in HW matching those
channel numbers.

For your question above, if any of the undefined channels are used in the DT,
they should ideally be treated as invalid when parsed in the driver probe and
lead to an error. When I checked the code again, I saw we do not have such an
explicit check right now, so I will add that in the next patch series.

And to be clear on which channel numbers are supported, I think it may be
best if, for now, we only add support for the channel numbers referenced in
the array adc5_gen3_chans_pmic[] in drivers/iio/adc/qcom-spmi-adc5-gen3.c.

There are only 18 channel numbers used in this array and I would remove
all channels except for these from the binding files. During parsing, we
would use this array to confirm if an ADC channel added in DT is supported.

In case we need to add support for any more channels later, we could add
their macros in the binding file and update the array correspondingly at
that time.

Does all this sound fine? Please let me know if you have any more concerns
or queries.

Thanks,
Jishnu

> Hence the request for context on how this define is being used so that
> you can get some feedback on how it should be done.
> 
> J
>> Thanks,
>> Jishnu
>>
>>> Best regards,
>>> Krzysztof  
>>
> 


