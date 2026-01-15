Return-Path: <linux-arm-msm+bounces-89290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ABBD29574
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 00:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC8F23014EA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 23:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1278C326954;
	Thu, 15 Jan 2026 23:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAkGSITd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jt6lEK5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F6330D47
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768521098; cv=none; b=Adxmz/oOyugS9OHRtjg3hC0RntfAXZI+FyFvSPmZK+6NXUlEijM9Fg8PR2SNHo2gmHv5tzrpTDGAPflWhBYrsm8GrKsEp3cyTynzyzrW3dPEeJnAw5ixPULo5fOswbSK6b8iSkYBkckCwyYnGrIBsL5/chF3Om2FFuvCd6Piwsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768521098; c=relaxed/simple;
	bh=e7/TJ9q1jpwuoEZ2KE/Ulg650o2nZRoguAmJzxv8Ekc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iy4WvmIpiphv+KiayuCui0gwMwfkWkjIps64Jhsd7P/i3hXRW6GQW7Ae+zAEh0pfaiK4UlmMae2A6CvgOJT73trj5k7BPnIj5DyV4tYRU5vsTZwyb6oj2eZKazOn8T+Pde6Z3u3g/4hKZ0Ra3lN44YqPs0nbhsUqSNxWtWxNvTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAkGSITd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jt6lEK5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMhvbK2819988
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtQxe+AZQJSs++TYSSTE4wMUFQyVbkymd/GwI60xIz8=; b=fAkGSITdOLVDSZgw
	uInoMR/a8vKztMCydd1E1+Z4IXXnkaYXJz3XbhKMDlw/sguh1SFICxOHk+bpvQtt
	gXQ2KH/zro4A1A84uc6/hid70Uxlzi3yKf+j5XlPEcdq+7G96l8Z8pwUi9uTg0IR
	i84J20OQSCoPzQZpA00SiFY8AK89vc4UVRQ9+A6yynrUFUCMCPcQHiOEFkpQxf9g
	oVrvavsRGWVTVGtj5oAID5pjdS7KzNtMTptP0vpG33G3Ty5qmYGjcZ+V3erLgPon
	2rIxRlru+8oL+40HAcSdtVaUqcufNd9m1PT50iVGGhPZPW1wMeI2aNW+1sCTnWsY
	mzAFgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ag4ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:51:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ac363a9465so1765502eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 15:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768521095; x=1769125895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtQxe+AZQJSs++TYSSTE4wMUFQyVbkymd/GwI60xIz8=;
        b=jt6lEK5Rc7POmEYnLIFFUNUHw77eJhrWsiXiastTE7BqF7S5jy6oZGxolaxsLD9gPG
         Wh8enFqfnfjaiEx/ldmtfoOkasm7iiDfvexKGRYosTBEpZ8ZQU0XAbtgtg8CLY/iQuWr
         KgP3GQG2JJ8T4q91FBXXQIA5aavMBC/bozQV9kJDZmki095W327MWmqen8mfYvpvPtR1
         u+NBBu7IrzSpkS335NiLoWBb4bEuaTLFeG74Z9nwQv7skS+pjH20U8wWnoZ6wexhaDEu
         MFRSqKMyTkh5GJyoWbAMTlNMHFetevWPagHoQ36dqbO9ooaG0AhRhq7blOwfbjzxhFaR
         lc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768521095; x=1769125895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtQxe+AZQJSs++TYSSTE4wMUFQyVbkymd/GwI60xIz8=;
        b=vCIYTpHikDMqS5JjfxAK2Co5PS8KTcvOXHC2wI9/EU80eKIk6C+hBceMImTqMLTCat
         TgzXTzrhabMlu6d+CUAFOA/z3SPCFQAi53SNAmccWNRwIO35D1mLw0T3Atqr6C5nckRU
         1tinhqptpYVCer7j64fBJSdeKLStYOXP6gTIfyIStanJChxvXdkjKQhqY1ZeAF+l1SiL
         S2K8i5zCgihvu1aZhSrN1NeSP9GNbea8o8bnH46Wpf7gIM7cdue42Efjra86S128Stry
         WaBIlCImu8/tkZzeVbhYKFPfo6SsMqnGYarHgU+KEYbfB2dZf9TQiT3eCSXFmsRpJY6Q
         m4mA==
X-Forwarded-Encrypted: i=1; AJvYcCX6pFW+R228RNpKACyZyeydrDpiYXfe3E6uZlE+CsSgYYqTi4rwoOi9AkjP+tK6S8QyUMBrLclu1Fz4+aKH@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFsRGluuY3taQXEO6r6Q+y8ZZud1Qmowcj467EJk093mh7wrk
	BkFOHgFMfn3K7qw28+bxlNHK14ydIJovRL1KWU9rNmXHXRzni9/hPezjtZ8MPEk89oLYlBRdY/k
	vobyFXAna+EaIRwe1J/OnIeMXlG8ysYiOZ+q9BCQI+Qb/2sWFey8vbbcwo4zysluqoiD6
X-Gm-Gg: AY/fxX5pK9euBd5bbmEWKhoj7fl+RIXt5WnCZNBxG1AdfMzGbAlWHb6pT/vrXToh79U
	mvyaraXVLnJptu4/BuT4oePCHK7QdX3NckiY+chOaOyoLHnpWddBefvAtzQn4341V8hrwuONrTE
	o5/Ppq6yVResWgOofnE8bCcP7RCimf4HhIot/OzwlMfotaKUOHRS+JHok1xi06RhPuraVvASKp3
	cRXQlHPjehFGQ+2luQLVU1NEtnQPyqdkl23arNFNDUC+Th9CFOKL27BWfOkwlcsAExhlOzbf649
	Z9MB1F80bviT+xKRO02TBsLPQuEYDwiPDe7OKQ9/WQWoV9RBBjvdB3zad+Gr5c9wZ+UFyukTXGy
	UFT7wjVPL1st2HLDgY6j3Px7AtZ/+ktvGl35raNoojrZ2KvHKo6VBQOLecx1j
X-Received: by 2002:a05:7300:ec0c:b0:2ae:5a13:9e3a with SMTP id 5a478bee46e88-2b6b412acafmr1004555eec.40.1768521095117;
        Thu, 15 Jan 2026 15:51:35 -0800 (PST)
X-Received: by 2002:a05:7300:ec0c:b0:2ae:5a13:9e3a with SMTP id 5a478bee46e88-2b6b412acafmr1004533eec.40.1768521094447;
        Thu, 15 Jan 2026 15:51:34 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b351e38bsm747551eec.14.2026.01.15.15.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 15:51:34 -0800 (PST)
Message-ID: <dc26dc7e-a0c1-44db-b719-1d8f34c2470b@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 15:51:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: U9LDF9WrywoNbh3B0PkG3cNmrHGVxj8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4OSBTYWx0ZWRfX4hksRHmVY3tI
 n18MXshztkRYQwhDbCThMoH7kUiIW/grf5tfrA+p6a7kSpDNXKyJxljjihCGRZZu9azyhbp7Cqk
 h5X3Rs96Bc4z7yLFsiHFzPF+U3vxPagjiW79Mv22P5cFnQUXOOay36mcNeLUs+ZzdM22GWS2CUC
 GM59bg8jayxYY0sRtISuM7xMIQILBgO/PVSGvwOMKAQZZKYGkwPcCu4bAkyYAwzaNPNR83BGvNo
 NJsJv5WMpsd5nqigUs5jIFGyT0WrUCCihV+yLnqDZBax+LhVp283v+QVYltplvhdLcicoPTqu/5
 duCIYKhB3YMMZtzwYhd+8kzv07/e1TXmK5+FrRHKzlvVML2jSelCpCZjCsgr0e9ZIwsfeJxxbMP
 +KFpSCIk3nHhMQFnoPwk8h2fJKaDh+v0OsqOFxYN6MVnOu9cRSp9O10OV0kkZV1tW16IjputwIZ
 PTad9bikekjjmazqMug==
X-Proofpoint-GUID: U9LDF9WrywoNbh3B0PkG3cNmrHGVxj8J
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=69697d88 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=ZFde01yRvqAbkRv1oOAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150189

Hello Dmitry,

On 1/15/2026 12:18 PM, Dmitry Baryshkov wrote:

> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
>> Hello Sudeep,
>>
>> Thanks for the feedback.
>>
>> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
>>> On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>> Hello Sudeep,
>>>>
>>>> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
>>>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>>>
>>>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>>>
>>>>> Instead of relying on a vendor-specific SoC driver, we should consider
>>>>> disabling it and using the OS-agnostic SoC information interface provided by
>>>>> the firmware.
>>>> Would like to add some history here. Vendor interface existed [1] even
>>>> before
>>>> SMCCC SMC ID was introduced [2]. And there are several user space entities
>>>> which
>>>> uses the soc0 interface already.
>>> True, but that's not the main point.
>> That is one of the point which needs to be considered in my honest opinion.
>> Vendor driver existed from long time (v3.10 Kernels) in Android
>> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
>> and lot of user space entities in Android depends on soc0 which is not just
>> limited
>> Qualcomm user space, but also, 3rd party ones.
>>
>>>>> The presence of this interface strongly suggests that the
>>>>> firmware is designed to support multiple operating systems or software stacks
>>>>> that already depend on it.
>>>> That is correct. We started seeing the issue with user space when our
>>>> firmware
>>>> started implementing support for SMCCC SOC ID recently for non-Linux based
>>>> product.
>>>> As the firmware remain same across OSes, user space is broken on Linux.
>>> What exactly do you mean by "firmware started implementing support for SMCCC
>>> SOC ID recently for non-Linux based product" ? Does that really mean that
>>> you can change the firmware for Linux based products ? I don't think so and
>>> hence we are in this discussion.
>>>
>>> 1. Either it exists in which case deal with it by disabling vendor driver
>>>      and/or fixing the userspace.
>>>
>>> or
>>>
>>> 2. It doesn't exist which is not a problem.
>> Allow me to add some more details, so far, our firmware hasn't been
>> supporting
>> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
>> started
>> to support the feature and same firmware is used even on Linux Android
>> (android16-6.12)
>> based product.
>>
>> I would say, firmware started supporting the feature on our newer product
>> instead
>> of firmware being updated on any older products.
> These are two different cases. But as you explicitly state that it is
> only for a new products, then you can fix the userspace to check all
> SoC devices. Broken userspace was never _shipped_ on those.

Though it's a new product with updated firmware which supports the SMCCC 
SOC ID,
Kernel & user space remain same (Android16 based) and shared with other 
SoCs.

>> Now, as the user space remain same and is relying on soc0 interface already,
> Why does it have to be the same for new devices?

It's a software stack composition where Kernel & User space is shared 
and expected
to have no changes (shared with other SoCs / Products as well).

>> user space is broken as SMCCC SOC ID enabled by default which gets compiled
>> into Kernel and takes precedence over vendor driver which is a vendor module
>> in case of Android.
>>
>>> The userspace
>>> tool seem to have made a wrong assumption and can't expect the kernel to
>>> magically fix the issue here.
>>>
>>> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
>>> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
>> Sorry, at risk of repeating the same thing again, the user space was using
>> soc0 interface on Linux Android products for a long time base on vendor
>> implementation. While I agree that, user space had some assumptions based
>> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
>> should at-least have a way to disable it (via cmdline) based on vendor
>> requirements.
> How will that command line parameter be set and passed to the kernel?

Either from Device Tree or Bootloader.

>
> A better approach would be to fix the issue where is is broken:
> - Add a switch to the firmware, letting it ignore SMCCC SOC_ID calls
>    (like it was beforehand)
>
> OR
>
> - Fix the userspace
>
> The kernel was never broken, it is not a kernel change that introduced
> the regression. Why are you trying to change the kernel? If it ain't
> broken, don't fix it.

Sure, if we can't do anything in Kernel, we will explore these options.


