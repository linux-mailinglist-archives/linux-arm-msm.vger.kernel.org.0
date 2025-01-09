Return-Path: <linux-arm-msm+bounces-44636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E24A07BB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84DDA3A24C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBD1223308;
	Thu,  9 Jan 2025 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5u2vOHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE30721D011
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435937; cv=none; b=T1jn8ci8R4p2IguTIoZq0xcLWdekcUoO3XHhRGVNSJYdpvq1i+B0P1YwtaVEz1n37A4OEB8VXf6Th45+OePzPqHAAjYXlIlvksuu6SVkmQmp/cz8b8OHQGAs6sZBiUWbGNvhsjTAdWBQ1/ccT/w211BZizV8pON3UpgkLOjAgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435937; c=relaxed/simple;
	bh=lqV7NlC8CBmeyM4CZrYL3BO5ti8mgWBP40C3kOcztYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBOEIF4hkB7exVUVliqRoNBSwnlFedQMpPLz5fqK0q3eXv+MPp8beNBnum6zPx6LcxQVXKrwMOQhy59Dq83y5cq3lgKeXfoQNeYD7Uc0KhBMd/cCvzopX5M/12/qMZy0bw3z7RwhZ1cNYJ6ajX6OwVgiDF0Snn3eCqB9g0ndbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5u2vOHn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509EEiof007627
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 15:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IpE0gQ3lYM8L+L6h5NNjVxyVSfLJ8rsbS1M0Hbdpwqw=; b=d5u2vOHnRWJFBPuD
	RajXG6+04T4kZCjpQoLdBca6hRh8+61H9zuXHw7N6Xxwqj//ER1w+D8RgvsUcxsI
	qslwbAmqHkGrfg3rIXAbw4laiq1MoCBf1I6oRAeNea6VfLaweAGa/lUHQmmhNu4J
	0FV1P2bFNSLS+kn0c1PL31lOTFGdwj6jq4q45PTXjyU99dhkMwtMKuSOiNpEZt1Q
	5Ywk57+y20hHC0vxbSBuZbF0Ox3eLuS5jLeOQm6tQ97tZrtpju+YOnmsTGKuKQG/
	CPn89qd4bL+8Yjvee0iKzdVHwYQcOUk4NGovX1PpIrJNLJu1mAahgNKSie/zj32i
	ORC4DQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442g2084ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 15:18:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so2496281cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 07:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736435934; x=1737040734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpE0gQ3lYM8L+L6h5NNjVxyVSfLJ8rsbS1M0Hbdpwqw=;
        b=KVa81f6k544TH5zMiXYH7VlYhEfyG6ogLvbGufzRcE4M6ilR+TL2w5ST+XReQqot4G
         UQpQ7QLCq1Q0VJEGB2eimMR/KHFNr+Z45rkYoSeX0SwHGtbobTsMbcRB+/YyYnVd1EuN
         rwNA/ilPNB1embeeTiWX68V1v97e0KXYGaD/ppD2KmYVE1mdu9d0RtImvUgJAMJUpCso
         nkOkhakAYcERkbaR545feQrV5PSKnyVv7kiCu8Cg/hl8Asp8pWdNLk+Lscx8xaZXU73C
         DwNrx7HVC7yllnkHd2fhe10TCMcu0yc5IobfSj9itQn2j5aMjoXw8Pm08qGiYYej8cEP
         8IYg==
X-Forwarded-Encrypted: i=1; AJvYcCUaCyT65Xh37+Jk5OdtIl4Y/XCBCI3dgbEsgmzRZZcYLg2DvHkYh60A3+dfuhQABVALiQIGSL1dMUZ8oQni@vger.kernel.org
X-Gm-Message-State: AOJu0YyET1O5fOX3KXCGpZCIZgBRwfDcmt4Np8Cf8ggLkQ9k4ww0S2VE
	GJ+j4QMZudaShXQPN/IOjsIvpXk9+aab+vR+JpTUetxeJ3cdctzGFHUSkNZupjYwaYrdisjWbM5
	WMouT/BgHgSg6fym5WEahR2WLgyBP7ce8o+OXOy9x13l9Jg/joG5ExUfJHthcXDhR
X-Gm-Gg: ASbGncvAMPG7yr1LJryP9HhMXyCKuji0VuWf2krC6he6bC+2q4v6AEF34BTymEKp1kZ
	jy2Mjn2TRnWkQ1tjK+dPFxeBMBA3OPx/yMO3WiMpmE7JJG9pAGTQausHzfEX0gtjj7T3nkMkU8R
	dmE/Ul2Jzs0aT6S/YOVMV4EPT0Cb0MtzRs9PkQZ/62qN7Y0SyQzJuCMFJkm41HT29pV2WjRFWUC
	DdyqTxd1hlremXHMAo4XRDC3BpdZhl3LDps/6K+rz45RtTck9KAzHoRiALecCJZNIVYopL+ULx4
	pZA5ym3bvWE8N/zHvf2Q0BeTumZT00kj+nk=
X-Received: by 2002:a05:622a:8028:b0:46c:7148:ded8 with SMTP id d75a77b69052e-46c7148df03mr32244951cf.8.1736435933540;
        Thu, 09 Jan 2025 07:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQdM1xAAebtpapO3eH0OrmElKNtsuALMsy6JPzokd4FMS9zD7xkRDNVKgwgpbbloAePhgZuw==
X-Received: by 2002:a05:622a:8028:b0:46c:7148:ded8 with SMTP id d75a77b69052e-46c7148df03mr32244781cf.8.1736435933161;
        Thu, 09 Jan 2025 07:18:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9564873sm80499266b.111.2025.01.09.07.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 07:18:52 -0800 (PST)
Message-ID: <66754bb1-44cf-4f22-af7b-450d4fede20a@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 16:18:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: setup cpu thermal with idle
 on high temperatures
To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
 <20250103-topic-sm8650-thermal-cpu-idle-v1-1-faa1f011ecd9@linaro.org>
 <qszkxmtrqr62wgd3qx7uctu22w4qrkietasvffinzwmzt7ccum@r26dikuqp7a4>
 <11ca788f-67e6-4e5c-9ace-083b730bc9ce@linaro.org>
 <2xp2xz4w7drpnql5khevz4wenlmiu3omwcilfisb3vvq2jlnwg@tcmjb475kghk>
 <2fcd9a10-ae9e-480f-87a1-5b49e5082ef5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2fcd9a10-ae9e-480f-87a1-5b49e5082ef5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WEywpF4YH6Rr7QvMTzS6CrcEmEyeHKdJ
X-Proofpoint-GUID: WEywpF4YH6Rr7QvMTzS6CrcEmEyeHKdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090122

On 8.01.2025 10:15 AM, Neil Armstrong wrote:
> On 08/01/2025 04:11, Bjorn Andersson wrote:
>> On Tue, Jan 07, 2025 at 09:13:18AM +0100, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 07/01/2025 00:39, Bjorn Andersson wrote:
>>>> On Fri, Jan 03, 2025 at 03:38:26PM +0100, Neil Armstrong wrote:
>>>>> On the SM8650, the dynamic clock and voltage scaling (DCVS) is done in an
>>>>> hardware controlled loop using the LMH and EPSS blocks with constraints and
>>>>> OPPs programmed in the board firmware.
>>>>>
>>>>> Since the Hardware does a better job at maintaining the CPUs temperature
>>>>> in an acceptable range by taking in account more parameters like the die
>>>>> characteristics or other factory fused values, it makes no sense to try
>>>>> and reproduce a similar set of constraints with the Linux cpufreq thermal
>>>>> core.
>>>>>
>>>>> In addition, the tsens IP is responsible for monitoring the temperature
>>>>> across the SoC and the current settings will heavily trigger the tsens
>>>>> UP/LOW interrupts if the CPU temperatures reaches the hardware thermal
>>>>> constraints which are currently defined in the DT. And since the CPUs
>>>>> are not hooked in the thermal trip points, the potential interrupts and
>>>>> calculations are a waste of system resources.
>>>>>
>>>>> Instead, set higher temperatures in the CPU trip points, and hook some CPU
>>>>> idle injector with a 100% duty cycle at the highest trip point in the case
>>>>> the hardware DCVS cannot handle the temperature surge, and try our best to
>>>>> avoid reaching the critical temperature trip point which should trigger an
>>>>> inevitable thermal shutdown.
>>>>>
>>>>
>>>> Are you able to hit these higher temperatures? Do you have some test
>>>> case where the idle-injection shows to be successful in blocking us from
>>>> reaching the critical temp?
>>>
>>> No, I've been able to test idle-injection and observed a noticeable effect
>>> but I had to set lower trip, do you know how I can easily "block" LMH/EPSS from
>>> scaling down and let the temp go higher ?
>>>
>>
>> I don't know how to override that configuration.

I'll try to get some answers. SDM845 seems to expose a couple SCM calls for
this purpose and it's already wired up in drivers/thermal/qcom/lmh.c

>>>> E.g. in X13s (SC8280XP) we opted for relying on LMH/EPSS and define only
>>>> the critical trip for when the hardware fails us.
>>>
>>> It's the goal here aswell
>>>
>>
>> How about simplifying the patch by removing the idle-injection step and
>> just rely on LMH/EPSS and the "critical" trip (at least until someone
>> can prove that there's value in the extra mitigation)?
> 
> OK, but I see value in this idle injection mitigation in that case LMH/EPSS
> fails, the only factor in control of HLOS is by stopping scheduling tasks
> since frequency won't be able to scale anymore.

If LMH fails, your SoC is probably cooked already, anyway :(

I'm not sure why idle injection isn't enabled by default if no other cooling
methods are found. Perhaps that could be discussed with some thermal folks..

> Anyway, I agree it can be added later on, so should I drop the 2 trip points
> and only leave the critical one ?

I think sticking with critical=Tjmax + critical-action = "reboot" may be the
way to go here.

We may want to give some folks a heads up, so they can wire up skin sensors
on their devices ahead of these changes landing tree-wide.

Konrad

