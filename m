Return-Path: <linux-arm-msm+bounces-57837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3EAB6C67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62D557A7448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8846A28DD0;
	Wed, 14 May 2025 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMg0kXSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE32343146
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228562; cv=none; b=hD30j7BKvPex/uNzkAtF50jZfUK22XU9ZYKm10euLDJXdU07pkXXZo5qu7xXyWP3d/UglSijp9cSYLADuEgrqNJbe9A2HqLrVk71Hojbi19uOr69YHeIxtT8Q/Uha/tZptZTqU/QQ+SWNZa3Sg+MaG9sKX5nHCtF2Q0jvhsHv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228562; c=relaxed/simple;
	bh=v0BP+1zgyodWFIzVNFNOJIwHPfZxIR3qJHaplc/lVec=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CN6Wq6VVg1qc4zLXzsftzUFKiH/RVEQNcwSGfwZVKB0c8IOO6iXdvqaEe6fLP4naiTFLMPOUI3Rdp9+sZ459bimtm/bZtB1ZIhZVfJfte6GQnrm8Ug3xpEqIjrHdjXZ8nz6rBBJsbPyxeDvf2isEy6mVyhPuERMnZTARU6ZjyS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMg0kXSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuqrp012692
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 13:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yILatwHUR+Jh1zWNHOlot8iZKoX8IiPojYOoJQNfo34=; b=UMg0kXSJ2b8RReZ4
	VTdcPjMNvv14Q++NaKIWl8cFIKa40MmBYlVL0z8KGtTbua9u1BTLvY79tsdagqkZ
	eG9KWQZBMOP9tTfWzmlGXAWI8DtNIJTXv53Hr1meLbT+CTR/N/5Zuvw607UP3KD7
	j6LNo9GrtT9B6jtyacfgaGdAMg+SWhOQ3Q+FGzUPS4nsRp5wNKuViD3ETqQgqUE+
	LtoVCguCBj58cMpuB0Rrxobse8p3g0wtQ41tvq14ruSrn+eY29wyJRIjBlRCAYvC
	frqXYujniYbXb4/DQn2qxWYV3Dp8POFlI7BFGrTmyNoSwQo9xWgt/n16FIM5ZwwV
	hnz+GA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyjt2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 13:15:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22fdf1d9fcaso26237465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228553; x=1747833353;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yILatwHUR+Jh1zWNHOlot8iZKoX8IiPojYOoJQNfo34=;
        b=jDuossPnce5cyCeXFKkUJB3k5CI80Qd6ELAxRvj6OJsX4Ydh+kqfx+5p3kDANIh9OR
         eZZtbIZLCgQmwTcjEz2I//FRwCH41efm+y7C5o1W0YeYLjEp8QAXjoK77AjNL8/yqIyr
         c4lXzTEnQVtSYE7DPVMC+6bdNNzBcG+PooisEDKeW0qi0+f8HUxWvk4HFwE7XdjpQ1nu
         hGnVM3oyZlWdsfAeLUdRpwg2akqp9dS3Nx4teISYCS2xETlfnM0zGU7AFVm2JE28uaIB
         0GJI9YExayZ45+cDE9A9zKzLzaQKG08NF37pPPbhRNRDQ5dCBu2tQiLOnKkH2VAT3wPp
         6j9Q==
X-Gm-Message-State: AOJu0YxjmWFZ5TaVuhpoBwXtQmjsBLdZoAYq6giBeP/f77V6bSPyYi0A
	WRimUSawfcvkmGA7N2pLPNExL3cCT8LcUjaD7vzuy1iHtwPRm8xYUqWGT8pljY4feQEj99mImQ0
	fZeL2QvYUjdb2hUIcUanUiFjqaQ7CfDWt4eJMN/wU377h/os30Bk38XzSij62K5Z6
X-Gm-Gg: ASbGnct2SEzBpRdv+L+54iAm7Lh6jvmRlNcf+drzlRQPq6YMcM4jzJBvBK3sDcZoG6K
	6CKauD46+dJbEjx9KWJNoDEwUTsgLJMGCiMD6pGcBnJktDjeRiJ1J0HcbXNG3uKS7dimjLOo8Si
	F5mALF85X0bFnJZ8gs+FotnI4Z/iDonAmpSRVLz1N670WQv6qDC4zWm+OQsNHuLjBVf0ytgoq/5
	KcBEkGNE5bWr+VhbAxXJpXTI8TgKgQz2xq5uBntUzOV4xOZGQ5w5Cs2cDtMQp2GD2RT4gwkuMvI
	JDZi+56nzisSXNoaAHD9As1oRlEGOy/cHk2sNaxGSGqluH75DTRz
X-Received: by 2002:a17:903:f86:b0:223:4bd6:3863 with SMTP id d9443c01a7336-231980c7733mr54018495ad.10.1747228553546;
        Wed, 14 May 2025 06:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTYFWo98SuyRtqUUetHlRQ5KWCgJktTdVRJBORzPUQiavaZT41cx3IqIQIAnIuysE+QhtScw==
X-Received: by 2002:a17:903:f86:b0:223:4bd6:3863 with SMTP id d9443c01a7336-231980c7733mr54017455ad.10.1747228552334;
        Wed, 14 May 2025 06:15:52 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.85.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc680515esm98921705ad.0.2025.05.14.06.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 06:15:51 -0700 (PDT)
Message-ID: <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Date: Wed, 14 May 2025 18:45:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
 <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
 <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
 <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Oy-h7Rdba4Cv6LnY83DF-QDX27CauzCa
X-Proofpoint-ORIG-GUID: Oy-h7Rdba4Cv6LnY83DF-QDX27CauzCa
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824978a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=P+HiGktFAnQmcg2NW2se+w==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=kuMuzYqABaI6PAa4Gd8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExNiBTYWx0ZWRfXyOZkXhQ9SaF3
 11viUKqNB+KovQsOWlB+TV7U7jtDriRd92ANMTImR7NABlppIYnLPF3dZKHBfQcSLdkQmzieI90
 SJBB+rX5UZmuOl3lrrPaqhHKcClfZGGVduq7awOeTHsi3CAHFdJmvhNLhIudN1yXaDb33/Z6Ua+
 C9Ek0365tv5wxo8kC0P6hTR0CouVdVgGp1Nle21pZal7cZGX5EtA7pjEa6k6vmpJg5V0b2P8fCe
 4h0h6SAGwMrs+mRe8Cn2hjZD6sUCpHUCAyjrA49cXV83cajglE1jqBDnxHyESg/MflrbYUhlUrp
 iLqfrE79+VgmtSzD55aLU6DxTMLveyPQPrD6kQUTVKu0NDzA4ULDotyXMv9cU+w2UwQ0YzraLOX
 ubu0pLhhF6x3SwKMwmBEyZuWka2iosFjCeaYMJvVi+W84JYTqw9fZG18B8c9ffhkJWOoCTcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140116


On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>
> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>> +{
>>>>> +    struct regmap *imem;
>>>>> +    unsigned int val;
>>>>> +    int ret;
>>>>> +
>>>>> +    imem = 
>>>>> syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see 
>>>> e.g.
>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in 
>>>> x1e80100.dtsi
>>>>
>>>> That way all platform specifics will live in the DT, requiring no
>>>> hardcode-y driver changes on similar platforms
>>>
>>> Thanks. I thought about this API but it didn't strike that I can use 
>>> the args to fetch and match the value.
>>>
>>> I need a suggestion here. There is a plan to extend this feature to 
>>> other IPQ targets and also support WDIOF_POWERUNDER and 
>>> WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support 
>>> and for other IPQ platforms, we are exploring how to integrate 
>>> WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>
>>>          imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power 
>>> Under value> <Overheat value>>;
>>>
>>> and store these in values args[1], args[2] and args[3] respectively 
>>> and use it for manipulation? If any of the platform doesn't support 
>>> all 3, I can update the bindings and define the number of args as 
>>> required.
>> Let's call the property qcom,restart-reason and only pass the 
>> register value
>>
>> Because we may have any number of crazy combinations of various restart
>> reasons, we can go two paths:
>>
>> 1. promise really really really hard we won't be too crazy with the 
>> number
>>     of possible values and put them in the driver
>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>> `bootstatus-fanfault` etc.
>
>
> Thanks Konrad for the suggestions and the offline discussions.
>
> @Guenter, I need a suggestion here. Currently as part of this series, 
> we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, 
> WDIOF_OVERHEAT reasons.
>
> Once this is done, we do have the custom reason codes like Kernel 
> Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and 
> few many. Is it okay to expose these values also via the bootstatus 
> sysFS by extending the current list of reasons? Since these are 
> outside the scope of watchdog, need your thoughts on this.


Konrad / Guenter,

We had a further discussion on this internally. Outcome is, it wouldn't 
be ideal to hook the custom restart reason codes in watchdog framework, 
since there is no involvement of watchdog in such cases. Also I don't 
find any references to hook the custom values in watchdog's bootstatus.

If this is fine, I'm planning to resend the series to handle only the 
non secure watchdog timeout case. In that case, as suggested by Konrad, 
everything will be handled in DT like below to avoid the device data.

imem,phandle = <&phandle <imem_offset> <value>>;

Kindly share your thoughts and inputs on this to proceed further.


>
>
>>
>> I'd much prefer to go with 1 really.. If we used nvmem, we could have 
>> a map
>> of cell names to restart reasons, but we've already established IMEM is
>> volatile and we shouldn't mess up the convention just because that
>> subsystem has nicer APIs..
>>
>> Unless we rename the subsystem to `fuses`, `magic-values` or something..
>> +Srini? :P
>>
>> Konrad

