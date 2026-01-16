Return-Path: <linux-arm-msm+bounces-89484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE1D38A69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95C9030145AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096962F1FDA;
	Fri, 16 Jan 2026 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfxGdoj4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eb2ajbyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409613D891
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768607656; cv=none; b=KL/IOgebGRgWOfT3YuIS55c/wi8lOjIVbQI7SRNkU40pXdhfgktdC+pqTFJ2hyLEhDcK/EKnQ+b4/EBA7nqGiu4NGD0ov2VHH0Oy+HB1vQsZhBEbshGcF1orHNGn2e2uIiJtLTo2FBiiVWIp2ZhmCI+tPv70ztAw/a8dfYhnmNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768607656; c=relaxed/simple;
	bh=kan97LklnjYKCuyL76zo6hr8U3H7bfOXIPka4tG2/qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFayz0lbeuSUjDYGj7rjj5N1r9tSk3B9UXteH9Rc9bY9eWt2j4iAGYhMvWo9XliLGUZdISmYQ9XVqUbvYRgh8IWtbNlXrvvhpPgkk6e6thgBTsAo6SomB62HZwSDpy8o2/nKc5oJI34zz9PfIN61PkSAKGbgsd9Di1e8LGofY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfxGdoj4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eb2ajbyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDVxm2825387
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Ekso6wA0t/O6amtjA0Qu4mOiYPpkJfpKPhvQiQQuGw=; b=HfxGdoj4K13IWN2a
	js1Std+bNsExY2nGfagxetRhQHpbR46SWM5m5in8yrkdUQJlbbROP2zHUB4a65er
	tkWeF2jJUJ6c/6GvZzZvTgDAhdSXhFMJKJT+nop8xfkHbJu2apJSd9G0TuKaypXx
	W0PlgYr251V2Yub+pFwKY9lYIQNZIbqSyFc4DOOhzHI9bc+DYllGmfG+NZUvKdaj
	rTARa9natVj5TB+uxZk9XIAkxeEC9SHfAjtR72hHt46ZsyntVAdFK/YcG/sI9V6T
	w0Lw32X/Ch1JX1J60bFC3SGc3Rvh8cXQMVuR+GXGynnv3HUWJ8oFGRg8laLrP1om
	5+g41A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvecrefn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:54:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso2778250eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768607654; x=1769212454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Ekso6wA0t/O6amtjA0Qu4mOiYPpkJfpKPhvQiQQuGw=;
        b=eb2ajbypQ5WPZKHfcQm05w4ZOBdI8wKifSuIUY69APNMFe08rqwBNl3vCEl8EhTQ8c
         WsahwI0bgAw7AC0S1tPebaCPFToHUGcujR26r+gge8032GEziSFnU8DoN8S1r2+BAyjH
         k45aAsn9/hItDWB0HPI96vqDy2wY33d3KXU12YRTHjfEDihJTlpdcYL+M0T5vzdo84w8
         Wdr6j0uUNYZzrl94bsIf+qZZ8QusoQl89SIq5KfgHYL6LfGrgENB5QqowGl+mhZvfmTH
         am6380KR0G95mWovlc30Lih+DIPP0CSOCOMtXvMFeYGkYG0Czr+BWq48lGC/4VZx+Joa
         PP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768607654; x=1769212454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ekso6wA0t/O6amtjA0Qu4mOiYPpkJfpKPhvQiQQuGw=;
        b=XuPTgYoHMZ66g/nzCphhm6dLRdW2+VUZWdWA13Q3HtUzd2/dBdH+XagQjnywPm4P+n
         SJppwYeQ3ngYxk9K1dFb2khhUCxGE97749qx2EoRZWVokxwmTdwF0WnoGrT8tr6A8cX0
         /BdilSdonoIjP0TtfJ9hzh9xmfPR0NIcZfRYAY5T3V6JWVr+PFeh5plcuR8JaRuymVzC
         +geai7VrafKDUDwbYBQJX4VVazNJClToX49Jk8aqRrBSrmFGJ2IA8BJ7xgIA+p1PKFEn
         Pf6yjDaM1Wkxg8QLM7NBmPLgAZq0pb+qQrW2L+SPxiE9QYgUrANDZ6UtMxw3ChjYpq+A
         OrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW61UTe68EcIMI8qnEX9wLf9aI108q5RLdAI+PO23IELWEyk+IndiEmI0udMXeFngoME/d1q4FOQlEUulai@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuhW4kK8ZTQ2F6k4VpeytEpDKhf3DlynCNIum8AgHK4EAGvHt
	jdlQ3ajcHaFqZ6+gEht8MQ8f75r3aNra4ZcBhSq0HLXm5XhLp5wrUfSiNkWBC/kUwPlj9aQBKwQ
	FR/kqMOJGU2MdPhDyZSNRsCr6SEZa6UXBKPgKpa1AsTk0roonGnIByDU6C5MMqS4hYMxB
X-Gm-Gg: AY/fxX7RfvIRhgKOz+mkoHjVcQtnFDkxenvkdknDpKOZofAQyCVEnAmb83N/S50sxO0
	i7ogZaKoqVqoynVHjgvVht0tkNCOTJuNPavSISatVP8zdVvBjat0/KNH/MnbZcC22PlnpULJcWe
	kMG/HSimyXfK+1qWS/kRmbbx/Nj/pdM+qXDKztVVWGt2UAX0+/QQjQa6H8soGD+q9YwzdU3rb8X
	0h0ncbIae0UltOHrzZSMo865tsXXjmXE+8pMMiNCcCzfuFDwwTZCwy6PvoRqXvXbZ/DtJxzNGPn
	yLVaaiKxDKL5AgD1pN6yKTpqlPmoBYX4hUIBBZiyLZERuKTmKGK3sT3sbjCb3JGJ13HuJZ9kRfA
	/w4Bzxzf8n9R5lyWZN3Tn7yeNEPFlQ+P09y0wX/iv+o5GMJ2LYkiMxu5JbwFxRWfk55VD
X-Received: by 2002:a05:693c:40c4:b0:2b6:bd8c:48f4 with SMTP id 5a478bee46e88-2b6bd8c4caamr1984979eec.10.1768607653737;
        Fri, 16 Jan 2026 15:54:13 -0800 (PST)
X-Received: by 2002:a05:693c:40c4:b0:2b6:bd8c:48f4 with SMTP id 5a478bee46e88-2b6bd8c4caamr1984903eec.10.1768607650057;
        Fri, 16 Jan 2026 15:54:10 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b364579csm3885943eec.23.2026.01.16.15.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 15:54:09 -0800 (PST)
Message-ID: <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:53:57 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
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
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FboPkVdYgiEFzWrRBvSuA9KkuA9nVt4v
X-Proofpoint-ORIG-GUID: FboPkVdYgiEFzWrRBvSuA9KkuA9nVt4v
X-Authority-Analysis: v=2.4 cv=L4YQguT8 c=1 sm=1 tr=0 ts=696acfa6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=91vdWaX_6ZDrg8W_R2AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3OSBTYWx0ZWRfX2vD3PfIaPuIQ
 Zd0m4+VwLBAvFkRFcqNF3mUFC3xFsdka0jamRmU4D5aPI+TBxrargNFqO8ysmLIvTjXL+w1RsjE
 0T0ruwNQGVMrYXZxAMFQ8EV77d3NIcVgp1avSnqxGv8LOU4Uk30nFNdBXwpRuLJTMP2WK1anhdf
 gqrdHZQgvEWuFknkD41qAYDKjvlxsReyfhg6SLSTO4G2IIyXvqhX60NLRpRcaXL/cb3ymiOPxgj
 3TjOGnEFvNaR349Sv3+X899noZkpXeX40Kwb1aLGjvbtFW9q9h5tb8IiLaPT2jVMkgFOQHSK+/L
 566/GPYUe1rqHeE4fQvQg3Ev0T9iFTL2QReKxouDikDsC3ghipqC1/fmuqViPrEBASZbmjvLmxJ
 aJmprmmSACU3bhPZYZ6Mb8u9O4i2M1OmBwqlUPHJjPDSPQP8Gr2glynr6jFw6ujeYvgf5Kkahut
 wfn53WLw3tXm78ohx0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160179

On 1/16/2026 12:53 PM, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> Thanks for the discussion & feedback.
> 
> Wanted to check on below possibilities to disable the SMCCC SOC ID at the vendor end, can you help comment?
> 1. Introduce cmdline option
>    We are trying to pursue that in Android Kernel - https://android-review.googlesource.com/c/kernel/common/+/3912874
> 2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry
> 
> If any of these other options are agreeable, will send separate patch.

You broke the replies by top-posting here. 

> 
> On 1/16/2026 2:39 AM, Sudeep Holla wrote:
>> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
>>> Hello Sudeep,
>>>
>>> Thanks for the feedback.
>>>
>>> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
>>>> On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>>> Hello Sudeep,
>>>>>
>>>>> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
>>>>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>>>>
>>>>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>>>>
>>>>>> Instead of relying on a vendor-specific SoC driver, we should consider
>>>>>> disabling it and using the OS-agnostic SoC information interface provided by
>>>>>> the firmware.
>>>>> Would like to add some history here. Vendor interface existed [1] even
>>>>> before
>>>>> SMCCC SMC ID was introduced [2]. And there are several user space entities
>>>>> which
>>>>> uses the soc0 interface already.
>>>> True, but that's not the main point.
>>> That is one of the point which needs to be considered in my honest opinion.
>>> Vendor driver existed from long time (v3.10 Kernels) in Android
>>> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
>>> and lot of user space entities in Android depends on soc0 which is not just
>>> limited
>>> Qualcomm user space, but also, 3rd party ones.
>>>
>>>>>> The presence of this interface strongly suggests that the
>>>>>> firmware is designed to support multiple operating systems or software stacks
>>>>>> that already depend on it.
>>>>> That is correct. We started seeing the issue with user space when our
>>>>> firmware
>>>>> started implementing support for SMCCC SOC ID recently for non-Linux based
>>>>> product.
>>>>> As the firmware remain same across OSes, user space is broken on Linux.
>>>> What exactly do you mean by "firmware started implementing support for SMCCC
>>>> SOC ID recently for non-Linux based product" ? Does that really mean that
>>>> you can change the firmware for Linux based products ? I don't think so and
>>>> hence we are in this discussion.
>>>>
>>>> 1. Either it exists in which case deal with it by disabling vendor driver
>>>>      and/or fixing the userspace.
>>>>
>>>> or
>>>>
>>>> 2. It doesn't exist which is not a problem.
>>> Allow me to add some more details, so far, our firmware hasn't been
>>> supporting
>>> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
>>> started
>>> to support the feature and same firmware is used even on Linux Android
>>> (android16-6.12)
>>> based product.
>>>
>>> I would say, firmware started supporting the feature on our newer product
>>> instead
>>> of firmware being updated on any older products.
>>>
>>> Now, as the user space remain same and is relying on soc0 interface already,
>>> user space is broken as SMCCC SOC ID enabled by default which gets compiled
>>> into Kernel and takes precedence over vendor driver which is a vendor module
>>> in case of Android.
>>>
>> See below example of lscpu and HMP.
>>
>>>>>> Aligning the Linux kernel with this
>>>>>> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
>>>>>> dependencies and improve portability. Any gaps can be addressed by enhancing
>>>>>> userspace to correctly parse and consume this information.
>>>>> Agree. Updating entire use space would need time and we are looking to see
>>>>> if vendor specific interface can be given priority over the standard
>>>>> interface.
>>>> That statement simply doesn't make sense at all. Your product took all the
>>>> effort to implement standards and then you don't want to use it at all.
>>>> As per your claims it is not even broken(in terms of data from the sysfs
>>>> files), so I don't know what to say here, sorry ?
>>> As mentioned above, the requirement was for a non-Linux based OS which
>>> impacted Linux Android baseline.
>> Read that again and think. If other products can cope and are made to cope
>> up with the new SOC_ID interface, why is Linux so special not to follow that
>> and fix the userspace to start using new interface. If just getting ID and not
>> name is the main issue here, consider moving to the updated spec or patch up
>> in the userspace.
>>
>>>>>>     Given these
>>>>>> advantages, why would this approach not be the better long-term solution?
>>>>> As mentioned above, existing user space will be broken and fixing existing
>>>>> user space is going to take time. As the feature itself is "optional" from SMCCC
>>>>> specification, if we can't disable by default, we should at-least have a way
>>>>> to disable the feature by other means.
>>>>>
>>>> The data given to the userspace from the kernel is not broken.
>>> Yes, that's well understood.
>> Thanks and that dictates the direction of these discussions.
>>
>>>> The userspace
>>>> tool seem to have made a wrong assumption and can't expect the kernel to
>>>> magically fix the issue here.
>>>>
>>>> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
>>>> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
>>> Sorry, at risk of repeating the same thing again, the user space was using
>>> soc0 interface on Linux Android products for a long time base on vendor
>>> implementation. While I agree that, user space had some assumptions based
>>> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
>>> should at-least have a way to disable it (via cmdline) based on vendor
>>> requirements.
>>>
>> It was the case with lscpu too. We didn't disable HMP just because lscpu
>> didn't understand or just read cpu0 data. It is exactly the case with
>> the userspace tool you are mentioning here. Kernel is not providing wrong
>> data.
>>
>>  From the ABI document in the kernel, it has been marked as socX since its
>> initial addition in 2012. So clearly userspace got it wrong and no one
>> realised it until now. There is no argument that data provided from the kernel
>> is wrong in these discussions. So I have nothing else to add unfortunately.
>>

I believe that point(s) we have not touched upon are following:

There will be thousands of Android applications using the native interfaces
in the playstore in various regions like US and China and so on, which relies
on getting the SOC_ID to understand the product and enable / disable some features.

For example, benchmarks like GeekBench or Antutu may also be reading these
interfaces.

There are apps. in certain regions which are still not updated from "32-bit"
to 64-bit on Android yet as an example and there may be no way to reach out
to those developers to fix but apps. are still used by many users.  

If we need to move all of these third-party applications to this new interface
then we have to "break them" before we fix them. Do we want to have such approach?

We should not have enabled this feature as "default y" in the first place and should
have kept it as "tristate" or kept it disabled in my opinion.

---Trilok Soni


