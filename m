Return-Path: <linux-arm-msm+bounces-30855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7B96D01B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 09:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6224E282AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 07:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E881192D6E;
	Thu,  5 Sep 2024 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="soqfohpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8FD188A37
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520151; cv=none; b=pwZSDQJ+AHeoHxHXsbId4U4QTKI5wm6fV3bg7CTZImyJopjwJIdyVU09dwT/h+f7GTlZo1vyAtQqmHGwOkDIVnhDLUVnChPZgCMWeIHCxer+y9JxaHJ5eTPj81gYgxDwXjkMtIptxNHFUF9vGboN1HxKfhw3cXdeYD4FozRwVmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520151; c=relaxed/simple;
	bh=HajNEILBB4LpQ5qrTS6oyEUq2nWFUFEfj4Vct4lymWg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PTnnfJGOl0gI0Co3EV9+lB7Vjx8e6FPsEtrKbv+CgpHY3+ujiRP8i5wNLAM+0vz/BNgspnulYla7Gs+GVxLu2Jwi3Rjlv/1mYNxnLpLV+1SKVWf/pBy55KvLGn6QfEdKjHJfiGUsQ0f+fBvi0QZSS2UXtFhFQHqkGwl+j+xQWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=soqfohpc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42c7a384b18so3072495e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725520148; x=1726124948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Bbuf05tKm9Qvab1AkCEZPP/Lhf9RimDxEVIFSjCvS4=;
        b=soqfohpcigvHfO4/iL+zasRvVRVmL9VpMxPuT/A6+1CpiAved9VxEQKnjYAmzTSFp+
         RMPrm3WfuGafWwzvz8xdUU/6R1ZuOi5cCjKjXLkNdtDu4OwxnDESKrnaIxi7Z4b5RSlt
         Byp7nPDdlGMakN0kKUHkNuoXNdbTbY/rqVVrPNN+rjt/bKg7v5DrI/y6MBBpvED81xOa
         Bmh/iQoqtc4eQSUODXoldSyUf4SCaYK0W8zOU3Mry0+IthyTb9RbsUL8mjNb/72uW1WL
         HVOmVUnBg5bsTmWy1ufltd2S/UIpp7H1Q79tul8rfHUdkFet4AfOqMv1k0eNOQYJsqvX
         neCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725520148; x=1726124948;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Bbuf05tKm9Qvab1AkCEZPP/Lhf9RimDxEVIFSjCvS4=;
        b=PV24Myq2LJ5YC1IildRlnUHVqsuUX9FESxBpi4yXjBqhxXP3VX6hz9/VMfvQfzJy/Z
         2QMUT/lfqGisRvdakZo3pP76JLM/SciV/z4fDyvu5lZLZx8hngnTEepjl7S2Caf12sVL
         +JKsBHCN0qISf9Xx5XpsVo+0DKHvJ5klUD4wQWOkylVOH7GECkWtg8NnUcu9oUIonauI
         rgYtHqf1jkbEjyH6zXghH46sa0KZbAp8ds3M43t2udK4md1g0V8HODjkO7g63iWUfu1b
         7fP7y4+MJiifM5+11uVg6EBeVZSWyEntPWk1ledLnR6l4rl3SzRm8yJBvcBnTG9lRMI1
         TziQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSGURt9f8tFSybPZxA71Uzpz8kQ99rViTPuSC5yWbL0dtPBWCIUdDADY1EpFQ/waM1/WoUxDEHI0obZIuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyriqQGZp3YaoF1nQLiL4ZPOd2pQGkC7i+rYB6RJ23FkwTnArY5
	iV6yHco0MiaI4E0pm/+TKqO5jIZQKCEVd5Y6CHATsaRzfo77StW00B0EHmNEBNc=
X-Google-Smtp-Source: AGHT+IFGtqWGPfN57BbsP+goPfpz21z0hGGf3AAIeBS26xwMEAXiy1urdpZbC1d8JRM7ZNC4sTv2TQ==
X-Received: by 2002:adf:f206:0:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-374bcfe5bd4mr10395488f8f.46.1725520147400;
        Thu, 05 Sep 2024 00:09:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52? ([2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27364sm222939605e9.34.2024.09.05.00.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 00:09:06 -0700 (PDT)
Message-ID: <169e9428-e328-4c2a-b54c-c49852016a81@linaro.org>
Date: Thu, 5 Sep 2024 09:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <d1ceab6e-907a-4939-8be4-6b460d6c594f@linaro.org>
 <f70baa0a-f897-42af-931f-082e8c5c12b6@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <f70baa0a-f897-42af-931f-082e8c5c12b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/09/2024 20:07, Mukesh Kumar Savaliya wrote:
> Thanks Neil !
> 
> On 8/30/2024 1:17 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 29/08/2024 11:24, Mukesh Kumar Savaliya wrote:
>>> This Series adds support to share QUP based I2C SE between subsystems.
>>> Each subsystem should have its own GPII which interacts between SE and
>>> GSI DMA HW engine.
>>>
>>> Subsystem must acquire Lock over the SE on GPII channel so that it
>>> gets uninterrupted control till it unlocks the SE. It also makes sure
>>> the commonly shared TLMM GPIOs are not touched which can impact other
>>> subsystem or cause any interruption. Generally, GPIOs are being
>>> unconfigured during suspend time.
>>>
>>> GSI DMA engine is capable to perform requested transfer operations
>>> from any of the SE in a seamless way and its transparent to the
>>> subsystems. Make sure to enable “qcom,shared-se” flag only while
>>> enabling this feature. I2C client should add in its respective parent
>>> node.
>>>
>>> ---
>>> Mukesh Kumar Savaliya (4):
>>>    dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
>>>    dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
>>>    soc: qcom: geni-se: Export function geni_se_clks_off()
>>>    i2c: i2c-qcom-geni: Enable i2c controller sharing between two
>>>      subsystems
>>>
>>>   .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
>>>   drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
>>>   drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
>>>   drivers/soc/qcom/qcom-geni-se.c               |  4 +-
>>>   include/linux/dma/qcom-gpi-dma.h              |  6 +++
>>>   include/linux/soc/qcom/geni-se.h              |  3 ++
>>>   6 files changed, 74 insertions(+), 9 deletions(-)
>>>
>>
>> I see in downstream that this flag is used on the SM8650 qupv3_se6_i2c,
>> and that on the SM8650-HDK this i2c is shared between the aDSP battmgr and
>> the linux to access the HDMI controller.
>>
>> Is this is the target use-case ?
> Not exactly that usecase. Here making it generic in a way to transfer data which is pushed from two subsystems independently. Consider for example one is ADSP i2c client and another is Linux i2c client. Not sure in what manner battmgr and HDMI sends traffic. we can debug it separately over that email.

Considering battmgr runs in ADSP, it matches this use-case, no ?

>>
>> We have some issues on this platform that crashes the system when Linux
>> does some I2C transfers while battmgr does some access at the same time,
>> the problem is that on the Linux side the i2c uses the SE DMA and not GPI
>> because fifo_disable=0 so by default this bypasses GPI.
>>
>> A temporary fix has been merged:
>> https://lore.kernel.org/all/20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org/
>> but it's clearly not a real solution
>>
> Seems you have added SID for the GPII being used from linux side. Need to know why you have added it and is it helping ? I have sent an email to know more about this issue before 2 weeks.

I've added this because it actually avoids crashing when doing I2C6 transactions over SE DMA, now we need to understand why.

> 
>> What would be the solution to use the shared i2c with on one side battmgr
>> using GPI and the kernel using SE DMA ?
>>
> I have already sent an email on this issue, please respond on it. We shall debug it separately since this feature about sharing is still under implementation as you know about this patch series.

Sorry for the delay, I was technically unable to answer, let me resume it now that I'm able again.

Thanks,
Neil

> 
>> In this case, shouldn't we force using GPI on linux with:
>> ==============><=====================================================================
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index ee2e431601a6..a15825ea56de 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -885,7 +885,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>          else
>>                  fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>>
>> -       if (fifo_disable) {
>> +       if (gi2c->is_shared || fifo_disable) {
>>                  /* FIFO is disabled, so we can only use GPI DMA */
>>                  gi2c->gpi_mode = true;
>>                  ret = setup_gpi_dma(gi2c);
>> ==============><=====================================================================
>>
>> Neil


