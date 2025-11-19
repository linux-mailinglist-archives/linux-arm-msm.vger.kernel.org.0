Return-Path: <linux-arm-msm+bounces-82415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 39906C6C9E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 04:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34A85386AD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 03:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3498A28C2DD;
	Wed, 19 Nov 2025 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4tTtDLb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiIHTLKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4700F2EA168
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 03:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522851; cv=none; b=tg4zKyzxCbQNjqzpnG0g70kCOOwpVKTR9NTaOX0Jy2NKzIFHuJE7+wQwyzfX3R75soUnbyjL7IG/LXSktvPxhILRtlymCeyD9lxIM5dXqm5WAvQ7tvVw2eRF2WQAaEyTpAC4SchfWEFHKcsEyws0AZSfWZL/b1x1lRYcSv4jzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522851; c=relaxed/simple;
	bh=j/JkXeFjrykUixVstuF8mTC/FZXpCDsjE7+goOQ0VKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBfZ4yedCs6/6lA8ZP1iBeWO/be0MFkTbG1Df4EAfIo6nALhGHyOGWTno4FPU4QUDrs3XWhPWMm6c82X1wWMjs/ZmEIriyiHK8XMFRjVDaX+6UFU3Z/NoB7CN+bkkY6DjPJmjuHKAcjEfiBXYdcmevUeORok66mk5SDC3zvKCY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4tTtDLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiIHTLKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ0KPAj2194373
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 03:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B99eyM2pyVjjBr7YMZGAr4nW3kVXrcOpMgp5ROqw+s=; b=j4tTtDLbgjnoRzYr
	+IOgEHttVcGCJBgvpE/xNLrfqmmTcxoWatkbwAnhbhG5AsKJXYa5Wnj0gtY88Gaj
	pPtNBH550dcOfGRIzaTkTTrkPxBA7WhE2sSVxF4BhlCIdFNj/bk1pGatMceT/jWh
	5QV3/vy/Nbudh/d78VRyOkKzapRxHX+SoSqbU5xJbvMhgyQLUuvwf7+QW4gONJcz
	iYXxd2etORBv3Sc1YQDswdQePRI8W697keLAp18cO7X/PAVED7gq16+sEbLl3gaW
	iBy6m8mmoG/NPn7huCtpAtnYJ0DUQO/UsSwkqVyrbIQ1UC7fOm7CeklxBmdvm/z0
	SZZkrQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3yb57n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 03:27:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295915934bfso101327685ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 19:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763522848; x=1764127648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1B99eyM2pyVjjBr7YMZGAr4nW3kVXrcOpMgp5ROqw+s=;
        b=OiIHTLKtF1ZWtJ9dE2jiVcv4VDqB9ltCCTyjsoTeQLwvdp/jm0sohNvVrcRlYgyQV5
         hBVvMBCZguC2SDwyuID33iD74mq1DtdEteO8WxStjjIUj7jcySDVeG1Cc3cGMae684zP
         mCUKvcuf4qXraEda/2vpiTvIGs284iwTL1g1CKf3Yw7U8OQ7dw7RSQC0HJ6qurgGm0sJ
         wlBzv4Yk25MSwsm0G4l4x5DJAHVPxk4Qb4sGJFteuCnFarj80DZQWLvTrlNoW+twR2fk
         KasYW9H2h1TRGL2OhiFCZmkj4Th6YUHfRA1YJvNkBR+3xm36wDsCk2QsEheWlR4Hb+9Y
         qmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763522848; x=1764127648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B99eyM2pyVjjBr7YMZGAr4nW3kVXrcOpMgp5ROqw+s=;
        b=rJw2hPfCs2P7JJNavPAbL/9cg4uREmLQ6sfKDaWhxk0ozTW4UpC+C8XQnLuEGya2XX
         FAqYHsF+KTzoJFVQHhKY/Ptowl1aASuLX8cB8vFjljJpn4Q+aYcauP6brEWKhejeZGNl
         JcJqIahB42QSP9pcRqHw0adibldRWY2SCmDOsQQ/4u+zNfWsnJjXWMs9+6wSrBHkX9kJ
         YLHHrmR9y0xPKYatclGSW43r4R7BCFQ/IYW0xk6heIiL71H1R5hXrYmUGxssRaiawTLL
         C6G1k1L9qbQ7IqusWhqW0RN5qnzzHBqLYpbH1jmIzATl0CyEPdF2yw4efedu4BB+G1Bg
         O05g==
X-Forwarded-Encrypted: i=1; AJvYcCVvtJOQZKnrmjQxKpE4gkOaLV57D0w5ySdwzP48w7vkTYS4/UBfvqkh3YbkKNNVo3XjNKNC029V2CeOZ6Iu@vger.kernel.org
X-Gm-Message-State: AOJu0YyzG4Hl7aQUkpOys5xiuFTeFbtH5pMN3503TI4/6WT7nkvc3+iS
	Bh8JMCE3YjcoLTTNi2C8cpCiVByJPVlCG5thXx2lAUnvqLLCyhdUnaIhUPbQcP/MreLAWdlZmlz
	s0QYoxGabb7NXi+vswao1KS5Qy+crHWjjyX3vfJcqmxdOHJm11Lj3Y++97cuDY9WhZ6KaoP68P5
	boKWs=
X-Gm-Gg: ASbGnctW5iU5viGA2BQnQB3mrNha+d94c8MKBURllTBDPzWF3lB5MRd7yOL9HOnZS8u
	dgH8ScnxYCZnKY4pYxY+sHPMSnrUzZZBgMImqkVArxhpcDXP2eFyAYBZzi9aTPYpYXol++GuMVf
	R19MJwqX6AYYrnwbVDKAycJQlkn0FbtGSuJo5Va1fIPcwGGl9U8xM7uBOw+sozmTAs7zub9RnGf
	t0OGdjULJuQA3ujio3HZDC+EXgOUGIGtm1BWOG4fSRFH8MtggExNvMdIhHcbNEPJGw1SJ2W+NWC
	GRJ4c9MItX9mz+W/VFpK7uxOE6DmSHTRBbI09Be8oLQBYxCbSH3e6WkcZOjetaKxeDaOt8g5jNV
	ZW2edXb1dgt22v4Brk47x47NjH3jWrRqQ59dllUcvNKl4YiAkbahZz+GjIjE49G6Obzsh07JDFE
	YRDyI=
X-Received: by 2002:a17:902:e950:b0:26b:da03:60db with SMTP id d9443c01a7336-2986a6d4cc1mr211548145ad.13.1763522847608;
        Tue, 18 Nov 2025 19:27:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxWyERsQXEZlanNimYrNeV89J9J72BXlWFzdAR+MgJosd6KHFQSPQBcvaj/cXn9rx7li1WCA==
X-Received: by 2002:a17:902:e950:b0:26b:da03:60db with SMTP id d9443c01a7336-2986a6d4cc1mr211547735ad.13.1763522847032;
        Tue, 18 Nov 2025 19:27:27 -0800 (PST)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2345d2sm190824555ad.11.2025.11.18.19.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 19:27:26 -0800 (PST)
Message-ID: <8fa0d7e9-71ec-46e6-a481-83756144e4a7@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 11:27:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Don't enable TRILED when
 configuring PWM
To: Bjorn Andersson <andersson@kernel.org>
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251118-lpg_triled_fix-v2-1-6d1e5831333f@oss.qualcomm.com>
 <7d46k5kmygmgjje3pc3jfebestkksbnq55q44urljkrmtrvwa7@6mxkt7zlmoid>
 <d10f7383-1eeb-44d2-a34f-15e76c3451fe@oss.qualcomm.com>
 <mrdp2ljtmoazowz37zcbirrvrozohnlgtyvwzqedoa3xnbnh6p@4nulist6gmxg>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <mrdp2ljtmoazowz37zcbirrvrozohnlgtyvwzqedoa3xnbnh6p@4nulist6gmxg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAyNCBTYWx0ZWRfX8eWSnlgrsMTj
 ZKGpZWfBP/kgOTLv1PKDMvIrL243110wIl9zWZc3Kzd9+8wlmR/v/PptSHaPpRU4EDlfilCpWZ1
 5NMs9SP1QshOgtlDwmkOnT/tVVrquZ99hGv41ymXnj0g1QCwcDsbDDFJnOywE4EXdn2z9isKFY5
 hrKskuEWZ+tWXZ8SWCSswZNMTDDNTYxLW4DulBr6odQ+WY7G3Indt4pw16wqGr/KQ+h5rBD/8ti
 SfmutDL31I9nSiUdDY6FmDTN6uprfUciwZM3nlMkVR1NvAFy3CRyVbjeVXzF5YjOSZPjamPv2pX
 xlic26S/XEavg7pGHJBRPQqTvnswN7ct8vQetc8ikyr4jsHfXik/Oktci1FA7ihJL9auDGS9ynY
 tBOVTv0fGN/R8MVMsyz2DWQHc3ZV2Q==
X-Proofpoint-GUID: PTEfpRzF5Rdwg7InTRbesKrqaASK2WcE
X-Proofpoint-ORIG-GUID: PTEfpRzF5Rdwg7InTRbesKrqaASK2WcE
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691d3920 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=J4v1UCyc1dEdgwM5DhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190024


On 11/19/2025 11:18 AM, Bjorn Andersson wrote:
> On Wed, Nov 19, 2025 at 10:17:44AM +0800, Fenglin Wu wrote:
>> On 11/19/2025 12:27 AM, Bjorn Andersson wrote:
>>> On Tue, Nov 18, 2025 at 10:48:03AM +0800, Fenglin Wu via B4 Relay wrote:
>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>> Sorry, I didn't find the chance to answer your reply yesterday, and then
>>> you sent v2, so I'll have to continue the discussion here.
>>>
>>>> The PWM signal from the LPG channel can be routed to PMIC GPIOs with
>>>> proper GPIO configuration, and it is not necessary to enable the
>>>> TRILED channel in that case. This also applies to the LPG channels
>>>> that mapped to TRILED channels. Additionally, enabling the TRILED
>>>> channel unnecessarily would cause a voltage increase in its power
>>>> supply. Hence remove it.
>>>>
>>>> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
>>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>> ---
>>>> Changes in v2:
>>>> - Check "chan->in_use" flag in lpg_pwm_apply() is not correct, as it
>>>>     indicates the channel is being used as a LED and this PWM API would
>>>>     never get called. Instead, remove the code line which enables TRILED
>>>>     in lpg_pwm_apply() and update the commit text to explain it clearly.
>>>>
>>> I understand that in your case you're routing the PWM signal to a GPIO,
>>> and in that case the TRILED output should be kept disabled.
>>>
>>> But what if I have my load connected to the TRILED and I describe my LPG
>>> channel as a PWM channel? Is this an invalid use case?
>> This is not a valid case. If a load (typically an LED) is connected to any
>> channel of theTRILED module, it means the LPG channel is used for driving an
>> LED, and sub-nodes for the LED devices must be defined. Otherwise, the PWM
>> signal will be gated by the TRILED module. Enabling a TRILED channel not
>> only opens the PWM gate but also activates an internal current sink to
>> manage the load. If you need to output PWM as a control signal, for example
>> for fan control, the hardware should connect the fan control input to a PMIC
>> GPIO. The PWM signal from an LPG channel can be routed there, rather than
>> using a TRILED channel.
> Thanks for elaborating, I think this is an okay stance to take in the
> question. Let's document it (like you propose below) and make the change
> you're proposing.
>
>>> With this patch,
>>> everything will look like it's working, except silently my signal won't
>>> come out.
>>>
>>> I presume there's no additional configuration on the LPG-side for your
>>> use case. We just configure the GPIO to tap into the PWM-signal through
>>> the pinmux settings?
>> That's correct.
>>> Also, if for some reason the triled was enabled by bootloader, you will
>>> now leave it enabled forever. This perhaps isn't a big issue though...
>> In that case, I would assume that the bootloader should also be customized
>> to not enabling any LED if there is not a physical LED device connected to
>> the TRILED channel.
>>> Perhaps none of this matters in practice, and we should just proceed
>>> with your approach. If that's the case, then we should at least document
>>> the behavior.
>> Does it look good if I push a change in the DT binding document to explain
>> this?
>>
>> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
>> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
>> @@ -13,6 +13,10 @@ description: >
>>     The Qualcomm Light Pulse Generator consists of three different hardware
>> blocks;
>>     a ramp generator with lookup table (LUT), the light pulse generator and a
>> three
>>     channel current sink. These blocks are found in a wide range of Qualcomm
>> PMICs.
>> +  The light pulse generator (LPG) can also be used independently to output
>> PWM
>> +  signal for standard PWM applications. In this scenario, the LPG output
>> should
>> +  be routed to a specific PMIC GPIO by setting the GPIO pin mux to the
>> special
>> +  functions indicated in the datasheet.
> I like this. How about continuing this sentence with ", the TRILED
> driver for the channel will not be enabled in this configuration."?
>
> That way we make sure the decided TRILED behavior is documented as well.
>
> Regards,
> Bjorn

Thanks. I will push a change for this soon.

>>   properties:
>>     compatible:
>>
>>> Regards,
>>> Bjorn
>>>
>>>> - Link to v1: https://lore.kernel.org/r/20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com
>>>> ---
>>>>    drivers/leds/rgb/leds-qcom-lpg.c | 4 +---
>>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>>>> index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..e197f548cddb03d079c54c4a0f402402c5d047e2 100644
>>>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>>>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>>>> @@ -2,7 +2,7 @@
>>>>    /*
>>>>     * Copyright (c) 2017-2022 Linaro Ltd
>>>>     * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>     */
>>>>    #include <linux/bits.h>
>>>>    #include <linux/bitfield.h>
>>>> @@ -1247,8 +1247,6 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>>>>    	lpg_apply(chan);
>>>> -	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
>>>> -
>>>>    out_unlock:
>>>>    	mutex_unlock(&lpg->lock);
>>>>
>>>> ---
>>>> base-commit: ea1c4c7e648d1ca91577071fc42fdc219521098c
>>>> change-id: 20251114-lpg_triled_fix-44491b49b340
>>>>
>>>> Best regards,
>>>> -- 
>>>> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>>>

