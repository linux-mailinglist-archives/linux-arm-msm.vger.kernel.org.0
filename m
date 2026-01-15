Return-Path: <linux-arm-msm+bounces-89249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15997D27DA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5351F30869C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E396B3C197A;
	Thu, 15 Jan 2026 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVxeKx+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhcWMt/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393613C009D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502582; cv=none; b=dvqZEWmAFu8AdTQtENj7CYPqa7oI81p+VCKq5ZcdWaHWgQhmrTqQmrN+Bdpz5EVrHkyTtPP7A3NBToIxi4xohtn0U0gV+o0GH8LtpDYwBfIIjhlnF3ncXpCv/LV90I2S+SvWnmvDUm1T7B7LrdnocJZ6h83uzd63r1CbcnJyeYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502582; c=relaxed/simple;
	bh=8YpsQLmCbLP3e0Yd/CRpMpmAs//vbA2IQfJE2vi0tro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYzseGVYPpnMXMgFW+zwYuNo1Vf8XIVYLM5fuca2XW+mT+RmeUiPQZp30QvQIkQXahTFgKFU3796XyMMrayIDpoCgsW2uT9M8uN9X3gka1gakffnJgjzfFbL7KZftRmT/ukz/AB/7viPtq3l3VFwCVXUwzvX7ttD0ydxU61EZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVxeKx+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhcWMt/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFfxLs2311995
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kc02O+1Ez39YWEQCJjfS+AJ1nMvD2oJXRTtCA80/Nmg=; b=DVxeKx+PG/wGcanv
	lvXtlqW+Y9py0z9vXnvtQ+wbXDb/54ml0GN5hx8K/R+HL6Dyqa7adjO4LdUvtGqm
	eWh0Gf9JCnqVszh5L2CDw/MO50/DcspDfrodQoYtUKzRvF3i08Hiw4CPVTLtzFmR
	7c1qx8NfheYH/XqudzjENBw5Z4o5YSzChpd9VL9LgDTxR3X/Yqcq91lNtFI6bURt
	Z9b9L1siQKPWCs0Z6aMd6s2apjFSAr6Q120YSWymMbiLmxjTkUWuESl7eCwOk5UO
	WOJ+rGzhC/539X7MNN9eH+iRTYlbB9ITG71J2AGAZzFCJw1B3JCtUVvTQMhX9lKn
	WLbhkw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340gn5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:42:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae32686ed0so7971347eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502574; x=1769107374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kc02O+1Ez39YWEQCJjfS+AJ1nMvD2oJXRTtCA80/Nmg=;
        b=LhcWMt/8bUYFNNzhNjTzcGcwBHWYPGDTXekhjXz1NvxMr58ocAWDEmPBHo3rVMTM2q
         12lSLC5D9FDLTEYmL4CeNbKsPi/bBRpam2Hp+KDCwpZ2MyQFb8yTQEm/NVZVm5mqLOhK
         Nm+l9+RsdztAUPpDJ/8xWqs3iYJ9jHIR8w4nC8K2ELoq6AbFWzj3KHgPzpOM0s9PvnGB
         Qf4q9TGfVUa+iV8447KSD5/tZWea0tds3O8xN2mzYAxjw3api1ytoKm9sCWNkzMc1QNs
         iNCogagNv824vZ26YoEe4mnTr++zC45yeGmy5POPAtujBQonZ1BCSIe3oIPheq1PVrEP
         X2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502574; x=1769107374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc02O+1Ez39YWEQCJjfS+AJ1nMvD2oJXRTtCA80/Nmg=;
        b=H07GepGEZx02BKoOYiZ50xwrDrqFwUJiK5sffrQVaKaqdnRXoH4uqAqwjqdoxa+fKx
         m/OzqyA3prtU0bqmS9dK9lvytP0jfLj/WS6CmHOk/nQIwHgZiDiCJfb7TcKGdIL1GRtr
         CoECuOOAXkn3j5GUdGNEIEaMRkW606HOikwpyu8cBtRhGyxFWJfB0YquNlOR7Koz2fOK
         63rZoYnr67vhy1ZrqOGh+LSV0htWEsbH/IkvIA0VyFDAN3ZMS35GJZy3gS556N8dk3TR
         SG9iRAJfSLC2kfiGnLz9OUSYFpew/SAWfdoz4nUoRmIenRyeYxg1HlyVCIFN70PT6Vge
         LhRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBjw1NHJbS5IlmZzF/1WDGjfT8LGeiR5b5RZrlceSre8Iz0F+zAdGYkMjwqRvT6E2Sb4HcXVQ9vLEMItxm@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8/C8dbk09xRF+aFgL5U1jR6PmKqQ+UhNpwmo7WYmm11Mian4
	m9/goRRMctL/+Gt/y0OYJqZHmmyfN/cWp2rXE8g7FDfZgLIdfxJpk9mmyLwWvsUC356JGxTPoOV
	mgj88QjIaceFjsyFGG5Kj0ChIEeYcqZkGUPQxR1XnrzDUiPV0ll0FaGCI3KSIblEO2MsC
X-Gm-Gg: AY/fxX5oqDCmU5JuSmS3Jpzoj6qboGa6dGGO3G74Ff8luok/HWLBvURxcVAChpAz9b1
	ddJJXUP8c1HBw89ue8b5hjynvTkMI9We162iCiAFtDlkK57qBZ/39+cxpZM4hIiTOkRza9ErDah
	BhOlwQW25SyiI2exGnTuncIbeSli7Ld2G0F+JuEfpifbZNkxj+AbmuLfbyd1umbOHcIXQ54oDuh
	k0jQ7Ks5YgcMMm8aQis7DPTMWZP02yw8XL8CbINKhFLmYt60MQCzY/GsdBvVrSzQfbRLwlRbtTY
	jC40hvRP78/8Km2G5lY9ps5a6zKgpuupNEBWxCFNrr2TFyqreF6mcPmCyisMED9FygHHPXa2KcU
	14Vzyo/6debv/Y3RoxuL46XFApgAn40cLr+zBO7CYu2vuLKafxBHz3rZe1d4M
X-Received: by 2002:a05:7300:7493:b0:2b0:4f8e:3273 with SMTP id 5a478bee46e88-2b6b3f2266bmr519153eec.6.1768502573596;
        Thu, 15 Jan 2026 10:42:53 -0800 (PST)
X-Received: by 2002:a05:7300:7493:b0:2b0:4f8e:3273 with SMTP id 5a478bee46e88-2b6b3f2266bmr519106eec.6.1768502573024;
        Thu, 15 Jan 2026 10:42:53 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5c9sm249302eec.22.2026.01.15.10.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 10:42:52 -0800 (PST)
Message-ID: <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:42:51 -0800
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
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com,
        satya.prabhala@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <aWgEDAlglnGrzdR4@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wbR4gaxs6QQmsiFe85F15QSiR23i5QJi
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=6969352e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=ccGef3cnkq0f9B4bJY0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: wbR4gaxs6QQmsiFe85F15QSiR23i5QJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX2pZQ83bbL56f
 IocQIujNrTYAi38gyN5O2+J6xItld+oW8US58qfF0VVux//CzRJVJnb1JqxrAnp8fkCPrjrhhAF
 ECUXPDUIMJetgAZb8PoCZiN/Vq1xzp45KixeEWilVisM/crvrnbcGx9zhuKufJO64Ja5HCcTQ/K
 W+j64bdcZoAvA7wT8YknGc2+kCgVnGHiJXYMwb8utDeUwn2430tht8Ywv3MWvwbbMrV3ylggKi4
 58/IVPKvQ6LTjIs3eNFiV4m6I9hHc8221rmGnXjvUvScaU93L83N/aH2gol7uLQhNOwZEcMwl3q
 TmGx72In1c7eBEJotjEL4CQzIH2BSAjcJvdDYELJf9maqeEAGRn7ZftFMNH+S69dVducYnbOyk0
 2bDU5z4jWl2m2wTVd34jPkb1cneh5gancgJzOy/Xd7thi31e+xYegPKFvHuAxZfGzaQ8xwi2Jya
 vIQF0XRKDgdBAaHHb+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

Hello Sudeep,

Thanks for the feedback.

On 1/14/2026 1:01 PM, Sudeep Holla wrote:
> On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
>> Hello Sudeep,
>>
>> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>
>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>
>>> Instead of relying on a vendor-specific SoC driver, we should consider
>>> disabling it and using the OS-agnostic SoC information interface provided by
>>> the firmware.
>> Would like to add some history here. Vendor interface existed [1] even
>> before
>> SMCCC SMC ID was introduced [2]. And there are several user space entities
>> which
>> uses the soc0 interface already.
> True, but that's not the main point.

That is one of the point which needs to be considered in my honest opinion.
Vendor driver existed from long time (v3.10 Kernels) in Android
https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
and lot of user space entities in Android depends on soc0 which is not 
just limited
Qualcomm user space, but also, 3rd party ones.

>>> The presence of this interface strongly suggests that the
>>> firmware is designed to support multiple operating systems or software stacks
>>> that already depend on it.
>> That is correct. We started seeing the issue with user space when our
>> firmware
>> started implementing support for SMCCC SOC ID recently for non-Linux based
>> product.
>> As the firmware remain same across OSes, user space is broken on Linux.
> What exactly do you mean by "firmware started implementing support for SMCCC
> SOC ID recently for non-Linux based product" ? Does that really mean that
> you can change the firmware for Linux based products ? I don't think so and
> hence we are in this discussion.
>
> 1. Either it exists in which case deal with it by disabling vendor driver
>     and/or fixing the userspace.
>
> or
>
> 2. It doesn't exist which is not a problem.

Allow me to add some more details, so far, our firmware hasn't been 
supporting
SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware 
started
to support the feature and same firmware is used even on Linux Android 
(android16-6.12)
based product.

I would say, firmware started supporting the feature on our newer 
product instead
of firmware being updated on any older products.

Now, as the user space remain same and is relying on soc0 interface already,
user space is broken as SMCCC SOC ID enabled by default which gets compiled
into Kernel and takes precedence over vendor driver which is a vendor module
in case of Android.

>>> Aligning the Linux kernel with this
>>> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
>>> dependencies and improve portability. Any gaps can be addressed by enhancing
>>> userspace to correctly parse and consume this information.
>> Agree. Updating entire use space would need time and we are looking to see
>> if vendor specific interface can be given priority over the standard
>> interface.
> That statement simply doesn't make sense at all. Your product took all the
> effort to implement standards and then you don't want to use it at all.
> As per your claims it is not even broken(in terms of data from the sysfs
> files), so I don't know what to say here, sorry ?

As mentioned above, the requirement was for a non-Linux based OS which 
impacted
Linux Android baseline.
>>>    Given these
>>> advantages, why would this approach not be the better long-term solution?
>> As mentioned above, existing user space will be broken and fixing existing
>> user space is going to take time. As the feature itself is "optional" from SMCCC
>> specification, if we can't disable by default, we should at-least have a way
>> to disable the feature by other means.
>>
> The data given to the userspace from the kernel is not broken.

Yes, that's well understood.
> The userspace
> tool seem to have made a wrong assumption and can't expect the kernel to
> magically fix the issue here.
>
> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.

Sorry, at risk of repeating the same thing again, the user space was using
soc0 interface on Linux Android products for a long time base on vendor
implementation. While I agree that, user space had some assumptions based
on vendor implementation, if not disabling the SMCCC SOC ID by default, we
should at-least have a way to disable it (via cmdline) based on vendor
requirements.

Best,
Satya


