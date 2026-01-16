Return-Path: <linux-arm-msm+bounces-89461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89BD38801
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5004301C3F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 20:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4742DE6F8;
	Fri, 16 Jan 2026 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5NjiLj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCqSgoxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC825EF9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596807; cv=none; b=u+95Dem8N8Jb6EgpDthR2Pb67A+m+Uh6lCWWvwZxVAZyCS3jd0PE/w5kgPCau4Cp8Q34rbvk7NMQGP1pDQxve94XDgIomRPhEN2ZOKRiX9Iuml67YfZcbkFOAS7xpGfKksj/zq+7uNnuIsIsKFxm5IypfmSUMN13Ny0AerS0HLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596807; c=relaxed/simple;
	bh=NQAzBt+f0m6u3AyaLWTYa+GjN3QiLKZb2hZ9P0UggJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVkw9MjO1Yb1op0zLd8wueIfLKLPxWiZPuLF0S85cb4x6YIRmLlbuXzEnmYWP9E29rOKAt15wWYyrsB2ke+KX7NDkuephqYzWmjaX+CXYzi+OTF+df+Gx8Z0YlPSNQCeqkjR6tf0aYzgBne/bIfSwUmlifeJrAhlcbJyRAS4dS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5NjiLj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCqSgoxX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKUjbH2484532
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 20:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWaQldqNv27w0LRRXVsBa0F3ClSqPPGePLVqAKt5/YQ=; b=V5NjiLj6SLQg9jV+
	VgEl1f1+oOQcLDU5RMGbv71l9rwnP8xOWu7HOjGj7cU0ycWg7xaQagVbEYfj0VpF
	7BdTZprYP+jt9nTxVV4bxdYhBIpHShUScEvDGzVo1R3heQ6octkhe2az95fFblzA
	kFGpkNfYjU4vtyqfuVVzEWiBWColSs1vaXcxjcE15vN6QzFGP1M4LcZOXUklTGVX
	M160P3lnxZybWGrD90CSFdsLqGAl4lezd1iOV8S4IN4ZG3sLqGofS/GOofNi0l2b
	yRsngRKOuFcTEMx+rYvRmGfIKTYqQ1q/07N/DHmPYFPHb+jzMIoixRDsIG8hGso/
	3nxZGA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvecr2ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 20:53:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2adc3990fecso1769957eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 12:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768596805; x=1769201605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWaQldqNv27w0LRRXVsBa0F3ClSqPPGePLVqAKt5/YQ=;
        b=PCqSgoxX94Ab7HCeMnSbzYhXYPs/qlJaxoQBFGfHoQdf+/HS5OSqFvDvNZUFcHWfBO
         lzR1WbY9dQ7Y7dtqAuPB+5lynuu8CL5FVwNvK7xB+OHuAbP4LNRXiEvA6s9/322ZRlyU
         gd8EorGZBXOXm7BkrNrbJU8bK0m9daBuskCR/OTrlsRB1vp2ux9PpoFFDjzEMsO2tMjr
         1/iEyPRjKqMUm1OqiwDUgITXXlO25vqk8ZBGiX0ym0pT4Wdj/Ho5XKDApJrON9oSBMRr
         SnUSN0EZy9LtIKFKTQJazul6bsIAHli3lTDctmBAf+5npW/ca3vgl7JIFecYbUmaQqvY
         wAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768596805; x=1769201605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWaQldqNv27w0LRRXVsBa0F3ClSqPPGePLVqAKt5/YQ=;
        b=UDbch5dmC2ZKZEVHPW9CXRH63VzUfhS8LTMEkrMj1GNLKfOqt0mx8Cu+QtkqLm09g1
         wNtraNgGQzc9hakoa7jz50PcL39AmNaOL7cGmGw3z862d7HAWxbsYsoPEcW9jFIAwkW7
         seNjWSnhPE+RDA/7alLw0semPzUiP+h8tDD2/tsAnmOB9ksxm4d5NVVd1I52jtClfiFo
         Zb0TatrLA66FB26OqSYHmmoO8OKCoqz0q3ef5y8u4MOkaPZmRkb7mU04lTUCR/XaIl0i
         9WDPDugEOtsM/fyDBBxNF8H3KsmBE2vQJ3lX5MDbbCkhbMuj98bPDoyI36KltGWHm4jJ
         pvsg==
X-Forwarded-Encrypted: i=1; AJvYcCXO82oWYNv0iXxpryxsd4Bn1NzXd43mK7PMeD+PNDwl10uCjxv+fZj7vHIELTCfMyOD1jMJ4Ka+vqdpl/Rj@vger.kernel.org
X-Gm-Message-State: AOJu0Yygb9iGFLqMWJtO4nrj0s53md3BrwOiqvEjRSs4vSXJ7IfTD4sl
	tL7SWXFCcd1TpdTTKUQ2lSnSGwFGRffaosh/q99UetxR4um8aO8u4bA5KBAoD4IbIqVik9qXYM6
	Sr9XCr4rmbN0umFeF6RsB7StezuunqMyCrscJzG5rEpcbCMvypARiIl6Gj5wJ+0TK3Pl3
X-Gm-Gg: AY/fxX6XHgAB0CfFcsV+Bmcco695O7RqIcGlJzD4O7iZrod7qSYDgL/OB88KCX/LIMV
	pvanC/BlrWDxzWICIR99/ONd/0LqZtvqLZtznjNcm4uXyql3FkBIYO715080N7yHM14Sjt+IQtM
	vEzOElzKNnbR0q1R+SmdTcomJxFASedkk37EWpLhG5synHOI5bm2N97PXajfjfYR3mei+KDqUGY
	zweFItiH8r5CZphxo1S+ApcoOA5JQ7LhZCyAZ5GuZqSO1P5S9dPW7Eo8S0qbxn+4qvwAime+wha
	l0s70Vh1+dVn7viioWWGapwrC3YJJ0uaL1Q7a5Mit9PQ4vxkR1Oi/ywTo+2Zk2H96OM56xnrzma
	s5h13EbrhOb5hE3+NNoIB6kluZmjLMMxItiRTkOiuZSbm5u3DreqYxTg8lnRG
X-Received: by 2002:a05:693c:2d93:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2b6b3469163mr3076822eec.1.1768596802867;
        Fri, 16 Jan 2026 12:53:22 -0800 (PST)
X-Received: by 2002:a05:693c:2d93:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2b6b3469163mr3076750eec.1.1768596799664;
        Fri, 16 Jan 2026 12:53:19 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c1177sm4248712eec.7.2026.01.16.12.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 12:53:19 -0800 (PST)
Message-ID: <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:53:18 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <aWoVR4oNdIHnksJQ@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KnoT0Wa0jgubh_OWljZnBvBBByDj9fK4
X-Proofpoint-ORIG-GUID: KnoT0Wa0jgubh_OWljZnBvBBByDj9fK4
X-Authority-Analysis: v=2.4 cv=L4YQguT8 c=1 sm=1 tr=0 ts=696aa545 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=4G8C3JpcgD8cdIvRuoQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE1NiBTYWx0ZWRfX+KwDRXmQ+b5O
 2jTr6sLYhHgVXSxCuV8TYiYxmj5iFva57xEDEYUhaaoJciW/pt4vDOAIxeFCCE9tfbsx6toQKV9
 if2MUnvbgIdAGWbBPYaxthYnl3Yc6DH936/lje8xHDEYs9O7okTol5kGKqhwgEfP1mBZPlaku4n
 wzLO7Yj46Bpfp9NQnnxRc/rEM8cljqS/Wnzo7DHUW6dK2Wx9xHkaYl7ga2HamqwOayIyeXASm4c
 TTR+Mr4pA0DcWqzWvSFImtkm41L9Uzhk8LD34BbkXTNBS7uMTyjSD7P0koa8Cj8xH7LszEBVcQm
 4dSLqsPczkuTRnUiQtWL+7EewCXrML58d3+Ib0i/X4BQgubkFzPSZ/b3h86bBFpzay1LwjbJOCT
 wz0UlXLa6+Wo5u/nBCQwM+K2nMMTAZ1zqNpr20iEyI5c5EhKghj22ue4u9Z5xrZr601x7pA945x
 13EEcRsXpwr70KQ5F3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160156

Hello Sudeep,

Thanks for the discussion & feedback.

Wanted to check on below possibilities to disable the SMCCC SOC ID at 
the vendor end, can you help comment?
1. Introduce cmdline option
    We are trying to pursue that in Android Kernel - 
https://android-review.googlesource.com/c/kernel/common/+/3912874
2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry

If any of these other options are agreeable, will send separate patch.

On 1/16/2026 2:39 AM, Sudeep Holla wrote:
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
>>
>> Now, as the user space remain same and is relying on soc0 interface already,
>> user space is broken as SMCCC SOC ID enabled by default which gets compiled
>> into Kernel and takes precedence over vendor driver which is a vendor module
>> in case of Android.
>>
> See below example of lscpu and HMP.
>
>>>>> Aligning the Linux kernel with this
>>>>> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
>>>>> dependencies and improve portability. Any gaps can be addressed by enhancing
>>>>> userspace to correctly parse and consume this information.
>>>> Agree. Updating entire use space would need time and we are looking to see
>>>> if vendor specific interface can be given priority over the standard
>>>> interface.
>>> That statement simply doesn't make sense at all. Your product took all the
>>> effort to implement standards and then you don't want to use it at all.
>>> As per your claims it is not even broken(in terms of data from the sysfs
>>> files), so I don't know what to say here, sorry ?
>> As mentioned above, the requirement was for a non-Linux based OS which
>> impacted Linux Android baseline.
> Read that again and think. If other products can cope and are made to cope
> up with the new SOC_ID interface, why is Linux so special not to follow that
> and fix the userspace to start using new interface. If just getting ID and not
> name is the main issue here, consider moving to the updated spec or patch up
> in the userspace.
>
>>>>>     Given these
>>>>> advantages, why would this approach not be the better long-term solution?
>>>> As mentioned above, existing user space will be broken and fixing existing
>>>> user space is going to take time. As the feature itself is "optional" from SMCCC
>>>> specification, if we can't disable by default, we should at-least have a way
>>>> to disable the feature by other means.
>>>>
>>> The data given to the userspace from the kernel is not broken.
>> Yes, that's well understood.
> Thanks and that dictates the direction of these discussions.
>
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
>>
> It was the case with lscpu too. We didn't disable HMP just because lscpu
> didn't understand or just read cpu0 data. It is exactly the case with
> the userspace tool you are mentioning here. Kernel is not providing wrong
> data.
>
>  From the ABI document in the kernel, it has been marked as socX since its
> initial addition in 2012. So clearly userspace got it wrong and no one
> realised it until now. There is no argument that data provided from the kernel
> is wrong in these discussions. So I have nothing else to add unfortunately.
>
-- 
Kind Regards,
Satya


