Return-Path: <linux-arm-msm+bounces-32993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0098EAC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 09:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1832A1F21B0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3BE81AB6;
	Thu,  3 Oct 2024 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bwOY1r6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8E3FB8B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727941900; cv=none; b=nHKUnwUmrs3hraqdGUsh8r56QBRiTgwB5i4Th/NwW6ZAOzHNWYL0mCIITNXwD0fIV1kdr7lFL0YOxcmgt+9skceVkOks0UQgxAQIcs1qWflYlwg2+qbSDy9KAkR7IJu5WkolGYRsW3DWaVlZCL63zVxj546I82Eda5ocQ3aOShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727941900; c=relaxed/simple;
	bh=ydi+yMJoIrWERcCHj7eNw6zYh3vKBxrusZVoJeILqiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSK1PLRrHNcYDWH9G1PFDc4ewzZlmLKpu8AaFCV8aH+PEPw6BP6lpAPK0igns7CMn0sRwvwB5Ojp15M9SQm910qtUdfNSTiNJDSUhKglO79e5hr2v7qxAHOVvDcz8XdaRExx1OiEl7k7rnnqGq3uFRZrgE6S3F/KnezGE8WC1kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bwOY1r6V; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2facd990d28so332451fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727941897; x=1728546697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhQYtYQTvcqQ7gamfGk3V+1mCdofGWMjZYXV2kDYS8Q=;
        b=bwOY1r6V+AINluN0HlQ/hfrkZK28K8zkjOU8ewetT+PXS7QP5ZL8f1OW2m6vttpbB5
         I3uc96GMQzapbWbmr14rG6x2ezKyZ37fdY2l3Yfc4O0nJUPnQ6JlPutC/JATPev4SPXg
         ZznMp7a6juD1A2v0DSporyT/5Q9qa9t7WRo80gEZB1HdNwF55gwjb40lwLy2FdaKfXsP
         SQ3x2vWnw5FOZ3XK+yLJUICx/wCoXxHT12Uxph5HM9UvTuTWhBHDKymaiggcnzI1g744
         fjWqARpu8Pku/hgWLzJMbhi/8bNxmNJ+NuFni9YPG+pFiRWQV3SnQdjkgLdb6SRVwpS5
         vRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727941897; x=1728546697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhQYtYQTvcqQ7gamfGk3V+1mCdofGWMjZYXV2kDYS8Q=;
        b=a3GzbIcvygo4Kg4/oeZAo+mGogQPv7T8pItxXALgD0K0q/2x1BlJXGwBx7KDWFKShN
         mZDrAFm5sndLh65hdq+RCkClVUl63m8wtdxIe6JQCEUXFqTW9G6dpYR5hknredgIgGp3
         8Btzfp7lDar16EmWq+1kn/5aTJI6x63aGQZjyPD9egcrX5pA9ARICVGW2ihs60sH4nXk
         Dk1U+oHt4hAtvbhdOSZdznai30L3zkGl6p+i6BYP4JfClLi2T1yWVpzp9P5p7ZXKBnNN
         rT9Oh3+PY/gnuXo49bGecu/0Xf0i0Y88B43v9Mu9sRUBFlgMqx2naaUORcowN3Z+9ITP
         lOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDkgt4kK9SI6wMW8+ciN/i7MFu9Ac2iTel20mPIy8cyAFewPE7mjucQe5EVyX3KEM2bRRELmpfSFDK7bmK@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPZRAAIJrDAY1ewLeeEaQHoDj5MY51T+MboLFdOveV+DSxhP0
	Gu7hO3T7TEnXI/Jc/SikijD4uTsMXEv/rLxy5OwSUxwFo6X9NdQ/YqgKx+SKesg=
X-Google-Smtp-Source: AGHT+IHsToBqVbUNMilTW4SpinRZNw6e5FZAwYcVwzdEhGsD/pUrvFcEN8PKq4cxFnZIk0iDQoFTdw==
X-Received: by 2002:a05:651c:a0b:b0:2f7:5c23:98fc with SMTP id 38308e7fff4ca-2fae10b5a84mr10727181fa.11.1727941896742;
        Thu, 03 Oct 2024 00:51:36 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82570a5sm108690e87.119.2024.10.03.00.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:51:35 -0700 (PDT)
Message-ID: <15306731-781e-41ca-b328-74001ceaca0a@linaro.org>
Date: Thu, 3 Oct 2024 10:51:17 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
Content-Language: en-US
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
 <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>
 <2de5f3e7-1fd6-4368-94bc-4eecc8fc6752@quicinc.com>
 <0e38cd39-ba91-48f8-a4ee-c90bf95acdfe@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0e38cd39-ba91-48f8-a4ee-c90bf95acdfe@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/24 17:45, Manikanta Mylavarapu wrote:
> 
> 
> On 9/29/2024 12:06 PM, Manikanta Mylavarapu wrote:
>>
>>
>> On 9/26/2024 3:58 PM, Vladimir Zapolskiy wrote:
>>> Hello Manikanta.
>>>
>>> On 9/26/24 06:43, Manikanta Mylavarapu wrote:
>>>> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
>>>> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
>>>>
>>>> The existing map table is based on 19.2MHz. This patch incorporate
>>>> the clock map table to derive the SCL clock from the 32MHz source
>>>> clock frequency.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>>      - Dropped IPQ5424 from the commit title
>>>>      - Added else part to assign geni_i2c_clk_map_19p2mhz to itr
>>>>      - Dropped MHZ macro and used HZ_PER_MHZ macro
>>>>      - Expanded SE to serial engine
>>>>      - Added the reason for 32MHz clock in commit message
>>>>
>>>>    drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
>>>>    1 file changed, 16 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> index 212336f724a6..22f2a0d83641 100644
>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include <linux/pm_runtime.h>
>>>>    #include <linux/soc/qcom/geni-se.h>
>>>>    #include <linux/spinlock.h>
>>>> +#include <linux/units.h>
>>>>      #define SE_I2C_TX_TRANS_LEN        0x26c
>>>>    #define SE_I2C_RX_TRANS_LEN        0x270
>>>> @@ -146,18 +147,30 @@ struct geni_i2c_clk_fld {
>>>>     * clk_freq_out = t / t_cycle
>>>>     * source_clock = 19.2 MHz
>>>>     */
>>>> -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>>>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>>>>        {KHZ(100), 7, 10, 11, 26},
>>>>        {KHZ(400), 2,  5, 12, 24},
>>>>        {KHZ(1000), 1, 3,  9, 18},
>>>>    };
>>>>    +/* source_clock = 32 MHz */
>>>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>>>> +    {KHZ(100), 7, 14, 18, 40},
>>>> +    {KHZ(400), 4,  3, 11, 20},
>>>> +    {KHZ(1000), 4, 3,  6, 15},
>>>> +};
>>>
>>> Please double check the values.
>>>
>>> This is what I get:
>>> * for 100KHz: 32000000 / (40 * 7) ~ 114286, apparently 32000000 / (40 * 8) would
>>> be a better fit, however it's unclear what would be proper t_high / t_low values,
>>> * for 400KHz: it seems good,
>>> * for 1000KHz: 32000000 / (15 * 4) ~ 533333, which is almost 1/2 of the wanted
>>> bus frequency, so this one looks very wrong.
>>>
>>> Do you have any ideas how to get better bus frequency settings?
>>>
>>
>> Thanks for pointing this out.
>>
>> I will double check and get back with the proper data.
>>
>> Thanks & Regards,
>> Manikanta.
>>
> 
> Based on Qualcomm's internal hardware programming guide, below values need to be used for 100K & 1000K.
> {KHZ(100), 8, 14, 18, 40}
> {KHZ(1000), 2, 3,  6, 15}
> 
> I will update these values in next version.

Great! These values make much more sence, thank you.

--
Best wishes,
Vladimir

