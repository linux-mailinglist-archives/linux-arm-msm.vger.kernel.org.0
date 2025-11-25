Return-Path: <linux-arm-msm+bounces-83353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DFC87B61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 395634E05E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744672F7443;
	Wed, 26 Nov 2025 01:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpM9EkHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hld43QiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC251F956
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764121119; cv=none; b=jur8ivg0JvGyw7a+Pg0zWe3UcG5S5bnTxs5wymeTPNsRFGuWA5SFOfH7ldw7lKCgWqpQ4m2UvqJiu8afhtflYNWi/Hc1n7C/N3Gs98NN6rLK5F5jJ0d2OG1AD0AcTBKLpRlleIuKGqE5++g2r2ed5I2xeWV8tRtz0B6wWy5mKrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764121119; c=relaxed/simple;
	bh=M1UPRAuKvSbO4ONCNmgeSg88PTKcthLXRRbhLKXnMLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKHc8ifFoDeqJQ4onEuExmF15eXPplmhpMK018QXrb1xKa6CYt9QjY+2yWP3vLJiX6+48sxySev4nNiOOciD1TRlRTErxv3ENzgmOww0RXQyRZlIeQbtwsgRkJ9cLzVMEfvbGj0eMa1LeC28pljX385yanE29A+P5HjdMf8ZLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpM9EkHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hld43QiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAgaA3890277
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRiin84cXv/6WsmzTg6DAmsoDqYKyG0tRb9/xUxyOdY=; b=HpM9EkHk+TIVx/6H
	mdpoT4DuRdMLeV/BAUTfy4wkS9iQXCfCvvrhe1prkUto+9Z9LDV1jvIEzeI+4VkU
	NjKcI6HwD8C9U17D9/MoK8gEegGuuJ+DQmLqjOA25so+i34GRmr8OIv7pcVdxosg
	9xcopAu2xxagN88gjryJI7pel4vsFwp2G7Dbl6Jepde9rwKDY82aZnoepfmeRZZu
	mhkRTw7Svh0aolFWeXIMqIOcZhseXjZYXqortTC4i8zcrSDp1d1tzOaCnD/txKKO
	zw9wI6AfJps48wpM5VyAYMisfw+ki/t9PcTVrHIB6snmoffGWxY9BFBio3plgN0U
	F9GpzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme93jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:38:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343daf0f488so6274174a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764121115; x=1764725915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRiin84cXv/6WsmzTg6DAmsoDqYKyG0tRb9/xUxyOdY=;
        b=Hld43QiTcqjv7ku4a6xlBRb955KCUdS4fZT/WmdMKOW2pDxPYRre7AvxWLdWoscqBZ
         HcKCWNkZWc0myLoEgl4t+QPfOYsLY3CPDdR8s4BeUXjq7IYmknLHn3cdr2DdOtqUjq2q
         J5MKrxOA2d6UZ9odRyWDFGRbUT6eQovDzTV4bWOmiCYVAgbOmNCx/wK8KwPpKGVCShqh
         7vcApGsomogcQIsxQoONVBfvxH/ksIpq6tA9YGjJjO58QgEDd0wFL2eYgHRQKMUPQQZK
         19fWy+KzSTihAoEJLXyfu3Xv/cHibXEqOaq30xfzEORhVt5kOjyAP8uAtC1ZzmGZQVrd
         gC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764121115; x=1764725915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRiin84cXv/6WsmzTg6DAmsoDqYKyG0tRb9/xUxyOdY=;
        b=PWspDwlLZfMeGQMZgRi9/ti6aOoEg4lKJvODGoXBLDaqMrBeXR0W/IhI0keOFNZi1A
         VJRUgsbkBZXbgWjfFUuOA8BHGQsYgzUW6xzk3O0Mj9Zgg123uBDHD+qVEyQ0KKYOZ3Rk
         oRxjAH/KyWDUHNWrrgcaubD4Y0mb+1doIPuZqL9atqvaYgeMib81QT8XGWAhhlqnLvsR
         LF8OQ5da4vqkTCisT8UxZ8XHbw7rb7LMHMrvicFQFA4p+Q6f0DzbGG+q3TEGpkk2y3QP
         dOCrZzfOQ4CFsjDoNUVe59gg5klgypQlB3MB2ySC4Dbxt6oq0cjT61tTra3aWjB2yHdP
         Mk4A==
X-Forwarded-Encrypted: i=1; AJvYcCXr1zXWwWPz7ClBgSY15cG0YmLNEN7v6IKvohzgsOGll/Uypygf+Mce5tJEoMZ8Ljo+6kt0xIRJPEOlT0ZX@vger.kernel.org
X-Gm-Message-State: AOJu0YxmvbrJWf+bXFTOCGDifCmHX5RFrd++iMcK2BGCmyHVso83JsMM
	mOFI+C1RdiOS5MBaFtjKf8RBPpRvlgy/4ninU1xUrSGWBE2Q08GChgg//E5MrMn+HjnBFFkamrU
	mAxE4HZOIsWuMA90LossdtWU+DGxWWw55o5am3uD0ZdzdySxKyJnw0YzfEVMRX2wa/S2c
X-Gm-Gg: ASbGncvS36tI0D6TRdXrkvIMZsFXzQFT56JPte/Um0JrKhx+TLdgHHAZN9TJ4pRoXDj
	jkLXs0Pysmy5mZvUoiyqNv+8H2YnK/aOF1e4UzZpoomL6ykgbu9gwvrdsJbvxP4I4CXmY88fZLx
	31yCTPQNRV0+47j69uUg4MNoGOW55/GjeWfE3lL0+y8tWj4ZQlBHg544Rh63M4CRaw28gCq9vL3
	eVD7mYE2blBB7kIA5bMZeCRu34AUMF6nCvawN/saT/VGqk1fmRFPWhYltHjFHkvTa2CgLUhOb3X
	XKOFMpX/4APFJ2NT1NvP7+nqcYXUK9XmyfRN1A0MuTDS3ht81GZ7FwspeUnDAV74K1Z6pcBd/h6
	AoihI9VJOWEc6EVacACef4hjIOh3VYCWANkFtoTNDyX4gDMzJrPqZPAn9wU4FKMfvVRsOAJ4kcq
	/wbX5qwg==
X-Received: by 2002:a17:90b:3bcc:b0:340:d578:f298 with SMTP id 98e67ed59e1d1-3475ebe6779mr4577232a91.8.1764121114558;
        Tue, 25 Nov 2025 17:38:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnl3WpNL25V7ysTwp85D1roo4NveKbdf4Ks+xR61yY+K0htIlMwxdnvnMinFXWZy8+8SF6FA==
X-Received: by 2002:a17:90b:3bcc:b0:340:d578:f298 with SMTP id 98e67ed59e1d1-3475ebe6779mr4577196a91.8.1764121113837;
        Tue, 25 Nov 2025 17:38:33 -0800 (PST)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a546e1dsm686870a91.1.2025.11.25.17.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 17:38:33 -0800 (PST)
Message-ID: <d3ecfcf7-223f-4a84-8a62-a32981f7b41e@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 18:18:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Provides support for Trigger Generation Unit
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69265a1b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Kj2ZNLPqEkJkSsPOi0QA:9 a=8KGQzfimsMkVHzi2:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxMSBTYWx0ZWRfX6ViWF+6hnU0a
 flFtPIAc+cN0l3ZOkP0seZ4QJaojS0MCE9Qnk8tRuQX58G4Rip8Z917R90edxL2gRCSY0uzplct
 zkvIkt8kkQv+WLHA3M5ouDeDJD+OZ7bthF1fZd2Rk5FdQ8Lsc/fdJi8wZBM45a63fhp6KXXZsFZ
 BAPMifj2Rg7unA5Bdj7Xv0vUKmQtSTgpODh58tA9xH30vChSXWSw4Gqu9sHjzyuZf5G8qZ0DHN+
 L8UPR3CoJ58Vl2gTbD9xf7yvFEHn3eZMSZCnt3eoKushcfBMxp2fy88OB2eFgBvk4eTic7Wnhc3
 16tIfuBp6Y570IWArWpdjrpBfB4WX7a4OWlUmUEYghyCYPi7O7M+su7GghuRLll3dDTxbuDkl8v
 Smr7SHi/rosAMmXhM8KtTE1oReGiXA==
X-Proofpoint-GUID: lIcuoDxbj6933GRJiaNqqwetMoCEObW0
X-Proofpoint-ORIG-GUID: lIcuoDxbj6933GRJiaNqqwetMoCEObW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260011

Gentle Reminder.

BRs,
Songwei

On 11/4/2025 2:40 PM, Songwei Chai wrote:
> We propose creating a new qcom directory under drivers/hwtracing
> to host this TGU driver, as well as additional Qualcomm-specific
> hwtracing drivers that we plan to submit in the coming months.
> This structure will help organize vendor-specific implementations
> and facilitate future development and maintenance.
> 
> Feedback from the community on this proposal is highly appreciated.
> 
> - Why we are proposing this:
> 
> TGU has the ability to monitor signal conditions and trigger debug-related
> actions, serving as a programmable hardware component that enhances system
> trace and debug capabilities. Placing it under drivers/hwtracing aligns with
> its function as a trace generation utility.
> 
> We previously attempted to push this driver to drivers/hwtracing/coresight,
> but did not receive support from the maintainers of the CoreSight subsystem.
> The reason provided was: “This component is primarily a part of the
> Qualcomm proprietary QPMDA subsystem, and is capable of operating
> independently from the CoreSight hardware trace generation system.”
> 
> Chat history : https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/
> 
> Given this, we have been considering whether it would be appropriate
> to create a dedicated drivers/hwtracing/qcom directory for
> Qualcomm-related hwtracing drivers. This would follow the precedent set
> by Intel, which maintains its own directory at drivers/hwtracing/intel_th.
> We believe this structure would significantly facilitate
> future submissions of related Qualcomm drivers.
> 
> - Maintenance of drivers/hwtracing/qcom:
> 
> Bjorn, who maintains linux-arm-msm, will be the maintainer of this
> directory — we’ve discussed this with him and he’s aware that his task
> list may grow accordingly. Additionally, Qualcomm engineers familiar with
> the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
> will be available to review incoming patches and support ongoing
> development.
> 
> - Detail for TGU:
> 
> This component can be utilized to sense a plurality of signals and
> create a trigger into the CTI or generate interrupts to processors
> once the input signal meets the conditions. We can treat the TGU’s
> workflow as a flowsheet, it has some “steps” regions for customization.
> In each step region, we can set the signals that we want with priority
> in priority_group, set the conditions in each step via condition_decode,
> and set the resultant action by condition_select. Meanwhile,
> some TGUs (not all) also provide timer/counter functionality.
> Based on the characteristics described above, we consider the TGU as a
> helper in the CoreSight subsystem. Its master device is the TPDM, which
> can transmit signals from other subsystems, and we reuse the existing
> ports mechanism to link the TPDM to the connected TGU.
> 
> Here is a detailed example to explain how to use the TGU:
> 
> In this example, the TGU is configured to use 2 conditions, 2 steps, and
> the timer. The goal is to look for one of two patterns which are generated
> from TPDM, giving priority to one, and then generate a trigger once the
> timer reaches a certain value. In other words, two conditions are used
> for the first step to look for the two patterns, where the one with the
> highest priority is used in the first condition. Then, in the second step,
> the timer is enabled and set to be compared to the given value at each
> clock cycle. These steps are better shown below.
>      
>                |-----------------|
>                |                 |
>                |       TPDM      |
>                |                 |
>                |-----------------|
>                         |
>                         |
>      --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
>      |                  |                                                 |
>      |                  |                          |--------------------| |
>      |    |---- --->    |                          |  Go to next steps  | |
>      |    |             |                |--- ---> |  Enable timer      | |
>      |    |             v                |         |                    | |
>      |    |    |-----------------|       |         |--------------------| |
>      |    |    |                 |  Yes  |                    |           |
>      |    |    |   inputs==0xB   | ----->|                    | <-------- |
>      |    |    |                 |       |                    |      No | |
>      | No |    |-----------------|       |                    v         | |
>      |    |             |                |          |-----------------| | |
>      |    |             |                |          |                 | | |
>      |    |             |                |          |      timer>=3   |-- |
>      |    |             v                |          |                 |   |
>      |    |    |-----------------|       |          |-----------------|   |
>      |    |    |                 |  Yes  |                    |           |
>      |    |--- |   inputs==0xA   | ----->|                    | Yes       |
>      |         |                 |                            |           |
>      |         |-----------------|                            v           |
>      |                                              |-----------------|   |
>      |                                              |                 |   |
>      |                                              |      Trigger    |   |
>      |                                              |                 |   |
>      |                                              |-----------------|   |
>      |  TGU                                                   |           |
>      |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
>                                                               |
>                                                               v
>                                                      |-----------------|
>                                                      |The controllers  |
>                                                      |which will use   |
>                                                      |triggers further |
>                                                      |-----------------|
> 
> steps:
>      1. Reset TGU /*it will disable tgu and reset dataset*/
>      - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu
> 
>      2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>         priority 1 to 0xB = 0b1011.
>      - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step0_priority0/reg0
>      - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step0_priority1/reg0
> 
>      Note:
>          Bit distribution diagram for each priority register
>      |-------------------------------------------------------------------|
>      |   Bits          |       Field Nam   |    Description              |
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      These bits are used to identify the signals we want to sense, with
>      a maximum signal number of 140. For example, to sense the signal
>      0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
>      represents 1010. The remaining bits are set to 1, as we want to use
>      AND gate to summarize all the signals we want to sense here. For
>      rising or falling edge detection of any input to the priority, set
>      the remaining bits to 0 to use an OR gate.
> 
>      3. look for the pattern for priority_i i=0,1.
>      - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg0
>      - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg1
> 
>      |-------------------------------------------------------------------------------|
>      |   Bits          |    Field Nam        |            Description                |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |For each decoded condition, this       |
>      |      24         |       NOT           |inverts the output. If the condition   |
>      |                 |                     |decodes to true, and the NOT field     |
>      |                 |                     |is '1', then the output is NOT true.   |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
>      |                 |                     |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
>      |                 |                     |Conversely, a '0' here requires a '0'  |
>      |                 |                     |from the comparator                    |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      17         |                     |comparator will be actively included in|
>      |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>      |                 |                     |condition.Conversely, a 0 here         |
>      |                 |                     |requires a '0' from the comparator     |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |OR logic will be actively              |
>      |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
>      |                 |    (n=0,1,2,3)      |this particular condition.             |
>      |                 |                     |                                       |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |will need to be '1' to affect the      |
>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
>      |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
>      |                 |                     |requires a '0' from Priority_n OR logic|
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |AND logic will be actively             |
>      |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
>      |                 |  (n=0,1,2,3)        |particular condition.                  |
>      |                 |                     |                                       |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |AND logic will need to be '1' to       |
>      |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
>      |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
>      |                 |                     |a '0' here requires a '0' from         |
>      |                 |                     |Priority_n AND logic.                  |
>      |-------------------------------------------------------------------------------|
>      Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
>      and `0x30` here to activate them.
> 
>      4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
>         are met then the next step will be step 1 and the timer will be enabled.
>      - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg0
>      - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg1
> 
>      |-----------------------------------------------------------------------------|
>      |   Bits          |       Field Nam   |            Description                |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This field defines the next step the   |
>      |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
>      |                 |                   |Condition and Step.                    |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |For each possible output trigger       |
>      |    13           |     TRIGGER       |available, set a '1' if you want       |
>      |                 |                   |the trigger to go active for the       |
>      |                 |                   |associated condition and Step.         |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause BC0 to increment if the|
>      |    9            |     BC0_INC       |associated Condition is decoded for    |
>      |                 |                   |this step.                             |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause BC0 to decrement if the|
>      |    8            |     BC0_DEC       |associated Condition is decoded for    |
>      |                 |                   |this step.                             |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will clear BC0 count value to 0 if|
>      |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
>      |                 |                   |for this step.                         |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause TC0 to increment until |
>      |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
>      |                 |                   |Condition is decoded for this step.    |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause TC0 to pause until     |
>      |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
>      |                 |                   |is decoded for this step.              |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will clear TC0 count value to 0   |
>      |    1            |     TC0_CLEAR     |if the associated Condition is         |
>      |                 |                   |decoded for this step.                 |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will set the done signal to the   |
>      |    0            |     DONE          |TGU FSM if the associated Condition    |
>      |                 |                   |is decoded for this step.              |
>      |-----------------------------------------------------------------------------|
>      Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
>      achieve "jump to step 1 and enable TC0" once the signal is sensed.
> 
>      5. activate the timer comparison for this step.
>      -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1_condition_decode/reg0
> 
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      17         |                     |comparator will be actively included in|
>      |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>      |                 |                     |condition.Conversely, a 0 here         |
>      |                 |                     |requires a '0' from the comparator     |
>      |-------------------------------------------------------------------------------|
>      Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
>      to enable timer comparison.
> 
>      6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
>         has reached the given value.
>      - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/reg0
> 
>      7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>         i.e. when the timer reaches 3.
>      - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/default
> 
>      Note:
>          1. 'default' register allows for establishing the resultant action for
>          the default condition
> 
>          2. Trigger:For each possible output trigger available from
>          the Design document, there are three triggers: interrupts, CTI,
>          and Cross-TGU mapping.All three triggers can occur, but
>          the choice of which trigger to use depends on the user's
>          needs.
> 
>      8. Compare the timer to 3 in step 1.
>      - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg0
> 
>      9. enale tgu
>      - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
> ---
> Link to V6: https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/
> 
> Changes in V7:
> - Move the TGU code location from 'drivers/hwtracing/coresight/' to 'drivers/hwtracing/qcom/'.
> - Rename the spinlock used in the code from 'spinlock' to 'lock'.
> - Perform the 'calculate_array_location' separately, instead of doing it within the function.
> - Update the sender email address.
> ---
> Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/
> 
> Changes in V6:
> - Replace spinlock with guard(spinlock) in tgu_enable.
> - Remove redundant blank line.
> - Update publish date and contact member's name in "sysfs-bus-coresight-devices-tgu".
> ---
> Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/
> 
> Changes in V5:
> - Update publish date and kernel_version in "sysfs-bus-coresight-devices-tgu"
> ---
> Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/
> 
> Changes in V4:
> - Add changlog in coverletter.
> - Correct 'year' in Copyright in patch1.
> - Correct port mechansim description in patch1.
> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
> and set them through reading DEVID register as per Mike's suggestion.
> - Modify tgu_disable func to make it have single return point in patch2 as per
> Mike's suggestion.
> - Use sysfs_emit in enable_tgu_show func in ptach2.
> - Remove redundant judgement in enable_tgu_store in patch2.
> - Correct typo in description in patch3.
> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
> per Mike's suggestion.
> - Remove tgu_dataset_ro definition in patch3
> - Use #define constants with explanations of what they are rather than
> arbitrary magic numbers in patch3 and patch4.
> - Check -EINVAL before using 'calculate_array_location()' in array in patch4.
> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
> - Document the value needed to initiate the reset in pacth7.
> - Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
> - Remove dev_dbg in 'reset_tgu_store' in patch7.
> ---
> Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/
> 
> Changes in V3:
> - Correct typo and format in dt-binding in patch1
> - Rebase to the latest kernel version
> ---
> Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/
> 
> Changes in V2:
>   - Use real name instead of login name,
>   - Correct typo and format in dt-binding and code.
>   - Bring order in tgu_prob(declarations with and without assignments) as per
> Krzysztof's suggestion.
>   - Add module device table in patch2.
>   - Set const for tgu_common_grp and tgu_ids in patch2.
>   - Initialize 'data' in tgu_ids to fix the warning in pacth2.
> ---
> 
> Songwei Chai (7):
>    dt-bindings: arm: Add support for Qualcomm TGU trace
>    qcom-tgu: Add TGU driver
>    qcom-tgu: Add signal priority support
>    qcom-tgu: Add TGU decode support
>    qcom-tgu: Add support to configure next action
>    qcom-tgu: Add timer/counter functionality for TGU
>    qcom-tgu: Add reset node to initialize
> 
>   .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
>   .../devicetree/bindings/arm/qcom,tgu.yaml     |  82 ++
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  18 +
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 737 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  | 252 ++++++
>   8 files changed, 1146 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 


