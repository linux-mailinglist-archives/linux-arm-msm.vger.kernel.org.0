Return-Path: <linux-arm-msm+bounces-89267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B5D28651
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C958D300E7BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800BB322B90;
	Thu, 15 Jan 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSH/yxzU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VbFEY3t8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19830322533
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508672; cv=none; b=pibCkqP5Ihp6fz7mXgrFKpUV3goh3EURHe8V25tc/pjbTjCWFqzInNLOWhi62FcAx1PfJwja4qp6bWFP6x5+mR0mGBrFxT+Cb0QrOJ2W8haaSeuX1iYmbWJWa1oD4NXwL9UX7NYv5bXm/8HWoc0VNUs+RQIKg5wrdrsKazm6exw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508672; c=relaxed/simple;
	bh=80NwDimbFFYQkOFNNfJ6/FQGmBFIXJdw+XSEIFYWsYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJp9cCdkcXGMfwmvaLn9+1RhODwLXds04yFsm2bPoiFBe3clxfsjxP9mtcHeCBcgdX/K74X4WZxKCD0J20KbXpybBvr3CXZX6xPqzwvPmpDXK1NYQIBk9xvAySa5uAb31vkGY2gA2VnRDT0NmyTntakvMZK0TrA0M61slJJbfEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSH/yxzU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VbFEY3t8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY6pH3202067
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=; b=GSH/yxzUuSAlfv7w
	XlNRF/ZTUud0Ic/j0QMjTeXO/4FatoX18CeV6ekzMoNgbgT3B4wOMusycPJjf8wN
	q1HYZMwcP/tSm0csb2tn6liwlVjZ99eXtH4alkfQkScVgRinHiQCVRkvZ5QA/U5Q
	iv7Ztq16v2IS+VtulJq3vwwSAgLZJx6PgjV6LWW4FxUUvtPUwAcLUm9KZ+HNybrW
	TlDGvDcg7c0UfWmA6ZvK8p+NUlMlhIe7cWooDRyIF7wOjyaE5yw+FKCTHEnGldp9
	SIOXE5AIyvnA4lEHS916Qa+rn1Fd1jtgszjzIIOTGPcWKnALM7HD70VwiBmDzXQx
	oZ4tlA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxhs9rj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:24:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1232dd9a256so2103523c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768508670; x=1769113470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=;
        b=VbFEY3t88lwQGsbbQrJbCr2B0lnSgFBgZtpLyO7NothG9rP6EUOu/Qd4JVe8Tq6a3w
         rTCMglk9LTV1yfxqQrq7Xk/fJcpFph0AcBKw4AVLku4la/zqlGYPBX4hpGKC1ybPbmLy
         BWsl/F3jvcxGZ13u9spCFas6UBr4Ic/nFD1tk3gdmULyP1vvTnEbR3RphjYmNjtfUB92
         b5zo1n/aM/IwMayZCADnEw8Ga8afmNF/zrajvszrw9ufYAdC7l+Bk7rK7t7QeppxB0WR
         wLQTFeC2Ikqw8/49/2jtBk9QiBzpUPTXgqPW1jzdZAbH8uWpgyu3b5i/VUaaf0IAeTUx
         9wlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508670; x=1769113470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=;
        b=V18BCcbLnNov9jQU8qJLO+gr3w8tNg8XPUcFAbXXtgt4QlPqJoRpIPOD3GbcEEJdtM
         MB3xmd6La/N4TJ33sedXS9MgxZAvsYfAYB647lhJIecdU+r/f+9eqfbbWspttd2PAsZd
         L1jFpy4QlND99Km2IGQu312mj+WBr3a+oufZvAlfMx3OaH9YN9XAxp0nr1G4qEvlIdRm
         VuCa9WO+4uSI7tdRrk4VFYfEFXKXhvmIzx1iE9n7VrVm448GdJOjthhzhWh1tQzzIDuz
         Unny+ka1M9CMhkas8aI7a0K5uCfZptr5SyVQ9xJUM1yAyXL0P0UbClbWxJe0QmQqCLXh
         2eng==
X-Gm-Message-State: AOJu0Yw95p/sSusnrYW5sMwPQVozysGxVKoyyhEUEPXeAan488ij6rA9
	CcGc2TJ6K5yN+g8hHSYai4gNnlbJZnw/a+W2MoYp1rLiuaNEqQShIBCseVV+DEnFhe66xB+CJt8
	9cugvv9Fh45buzzYpClpsaiFZZ8RZd7SnhHmpxsTFDVecptComKU5eJQhmTSH2Yn3ugnz
X-Gm-Gg: AY/fxX7UFoigQjvBtIFm9o8KPHljUEBiLyvIGLJ4Ehl/AYhDMJ7szYSa+cP34h3tCbe
	y+/rkCuQQiz4kGtQg1wavulr7ewxDjml/5O7HwW3XCYhudpGJxjfYJ09IDrR9TEENFu0aKvt0Nk
	+N2KMf1gr7d8MRbZdlFEu4d/PR+eh/it7DRZ4UnB/xjU3vI8sTOKTePWDnuSxn2Md2L4eoxHiub
	ghLmmySPlJLLcc17xT+cDZbNiqOH7eQOx/LPBM2K1vZtRasONt3DEnt6Ty0y1jPRb39uxvqUUGq
	yrPOv7oXE4vty7xQqwd6YoaCdUX9FqHIWvpNws+ERN02/ZfOhNZQj5qkB/Tx82eXEEJhU3mC7MU
	ISkbnjvmz91Mpd9SCZhVUp9nqQ5mR9Kzb5ff7cCVLrFD8d5faJv9LVY84cmJH
X-Received: by 2002:a05:7022:2486:b0:119:e569:f865 with SMTP id a92af1059eb24-1244a923b8fmr748796c88.2.1768508669529;
        Thu, 15 Jan 2026 12:24:29 -0800 (PST)
X-Received: by 2002:a05:7022:2486:b0:119:e569:f865 with SMTP id a92af1059eb24-1244a923b8fmr748767c88.2.1768508668948;
        Thu, 15 Jan 2026 12:24:28 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefab3fsm414971c88.12.2026.01.15.12.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 12:24:28 -0800 (PST)
Message-ID: <62a0b363-653e-4bcd-9f17-840d5f276390@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 12:24:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FI4WBuos c=1 sm=1 tr=0 ts=69694cfe cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KxcOn-WUK91iGqjPL20A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: bUqN86wfDNjD_Pl2YQllSK6KSyJYtp8F
X-Proofpoint-ORIG-GUID: bUqN86wfDNjD_Pl2YQllSK6KSyJYtp8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OSBTYWx0ZWRfX/CqfTbWTRwcw
 +qDFxJ2yk4z8Vrqxz9D/Ukns5oRZZVUsLzIQjc4t10ldqv8+DEwP9LwYvMGATVbk/yEaEfUfHWF
 cvuxgP/vlsnlMPv4eQGfLSB1Iw/sDc+Avkn+PkE3TAK7OaIXmrUvLaoK92ZbLgYNzT3bso0l5Jl
 wtw0iGyeEHWZ6/QQLKI2kpJvWp/bEDgw/CUb8cblGs9mqi+RimUngCvCn+yin6CqlEGY/4eLv3c
 MKmeu3GBlouR3eDkpTqrq5uNZFrzT9x1nfID/U+tTTs0AEeYAbz7ZiEdDkz3k0ccNV38XAv+QjL
 rCePOCJk2PXhBIWFJk42LwylyxcQeQ8l5i9iUJJiNamS27X6MipoxB21hBwndUabwq/+IBwSNkT
 cs5haS7UcD9Xos+cS3KdHBsXw6hGzWx6AHEaPdbFlJXsqPNqOaaOnLQiKNBPgb8R8fb22Z4jVub
 vUhfvKAA+feQOg6IAQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150159

Hello Neil,

On 1/14/2026 9:12 AM, Neil Armstrong wrote:
> On 1/13/26 07:24, Satya Durga Srinivasu Prabhala wrote:
>> The ARM SMCCC SoC ID driver is currently enabled by default and 
>> publishes
>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>
>> On platforms where a vendor SoC driver already exposes widely-consumed
>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver 
>> changes
>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>> of a vendor logical ID like "519") and breaks existing userspace 
>> consumers.
>>
>> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
>> prefer SMCCC over a vendor driver can explicitly enable it.
>>
>> This avoids unexpected format changes and keeps the generic SoC sysfs
>> stable on systems that rely on vendor-specific identification.
>>
>> [1]
>> Link: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala 
>> <satya.prabhala@oss.qualcomm.com>
>> ---
>>   drivers/firmware/smccc/Kconfig | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/smccc/Kconfig 
>> b/drivers/firmware/smccc/Kconfig
>> index 15e7466179a6..f830d11ebdca 100644
>> --- a/drivers/firmware/smccc/Kconfig
>> +++ b/drivers/firmware/smccc/Kconfig
>> @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
>>   config ARM_SMCCC_SOC_ID
>>       bool "SoC bus device for the ARM SMCCC SOC_ID"
>>       depends on HAVE_ARM_SMCCC_DISCOVERY
>> -    default y
>> +    default n
>>       select SOC_BUS
>>       help
>>         Include support for the SoC bus on the ARM SMCCC firmware based
>>         platforms providing some sysfs information about the SoC 
>> variant.
>> +      Note: Several vendor platforms provide their own SoC information
>> +      drivers under drivers/soc/*. To avoid conflicting sysfs attribute
>> +      formats in /sys/devices/socX/*, this driver defaults to disabled.
>>
>> ---
>> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
>> change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
>>
>> Best regards,
>
> Disabling it by default impacts other platforms, the arm64 kernel is 
> designed
> to be generic and run on any platform with defconfig and from the same 
> build,
> please don't forget that.

Thanks.

> If you want to ship an arm64 kernel tailored for Qualcomm platforms, 
> you're
> allowed, and you're also allowed to disable ARM_SMCCC_SOC_ID.

Not entirely true. Say in case of Android / GKI, ARM_SMCCC_SOC_ID gets 
enabled
by default and we do not have a way to disable it.

> The soc sysfs interface is designed to support multiple source of 
> information,
> from vendor (like qcom socinfo) and smccc ID. And this is well 
> documented,
> and pretty obvious...

Yes, it is indeed obvious. The point to note is vendor interface existed
from long time and unfortunately user space had made certain assumptions.
All, we need is a way for vendor to choose which interface to be provided
to user space to make sure user space isn't broken.

> Neil

