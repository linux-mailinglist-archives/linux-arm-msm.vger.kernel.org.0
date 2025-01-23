Return-Path: <linux-arm-msm+bounces-45953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1821A1A30A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 910EB1880274
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5423420E020;
	Thu, 23 Jan 2025 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2xN2ZnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C4381AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632074; cv=none; b=NQjQMzEUN+BpvtXs0/BvyZ1wQsmPBJjTufJObA4GN+n/Xx85yAyjHWYv8qB9SG+zC6ztLAxTpkqtXt1qN+yhAY6GmX17U2ip9+zbah9obxMW8Dhr6+LHvo4/eEkfSTfosplYmESglmO5EeOd+TNU6NNCe2Y5nYamK+IEyia1r8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632074; c=relaxed/simple;
	bh=QA3tANgsy43WsyRsNZKbw0iwwQBQDTp1/vxbKJfETUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2Sr2wmXc93gKrgWSYJXy+jpAR4z4Zyq99A44xfpO3nIcgXGiATmY0pwwCpVfgSmlP73ZYDZsjunN7SKmCKVvUxL+unmHXSz64jHVP4NhnY+MvDDIY4a90lCJImSzYpgj+LN1XqJwU4Ty5siFVEtTHZ8oHhAY9tJdbm5LRdUYaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2xN2ZnF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436203f1203so595955e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632071; x=1738236871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nXZb5O0gwPGCkkfFlyz2rT23SqUdYp/zsp0IQnTJndQ=;
        b=W2xN2ZnFZN9y/0R/qSe54kR+jzioHtUfWQWPs2ADZy90eYPVLMDb5wyUAqD0a+ZmS8
         q4VE/OqLGA1SJy8Pv/mzKeCzVQ3+lRUciBQTxV9YY4N4+jqDVFDparkRD01zh4wYezmT
         aJQMEH4LqNfPguoSt2LPvTeaKslW5SuAsJWVTh7M/LFh/rFc6hiSO9SMRAAiS71Z1GHo
         g7eT6/bAYlEC4OYHsClQAUOZflfGuN/H/IN8cFar/qJ5pJHV5u6J2GYqwUkGRtTUy6M2
         d2Y5AW9IoFo2J2nPfIebCQUF6sVNnYKOc62hRaZQTv9T5KD0d1ITXwVGmNwU6IkxWho5
         patQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632071; x=1738236871;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXZb5O0gwPGCkkfFlyz2rT23SqUdYp/zsp0IQnTJndQ=;
        b=V7xiCscpQv9Axo8dpfYKJqvLR658nD4KK52+XbdqdIz4LcB+ja5vcS4HtwHzUf0p1n
         hmGdzw+6yKidNbfz3gJR5m4e5wPkgNiCxNATzaEwBAkdEyvqYZs8LbKWp/URT0EOoVwF
         UtwKeQ5WI+6aDoG/OCff2KHgWn8ZSYyVmQksoDDfCthYk0SOgvJll0YmNovmNup6xlZQ
         WlrKONbQ8HMaTYL6zWLAzIqlI9TYVQ3D4slSLo9Px3xTbALV2pmL3r12hH139NS+qP5w
         9Boj9kC+HZhnOIADHFfjEtPH6HafylOKGGczv/wabYKaWoK+pLhzM0OigPQFkr+Qn4JO
         gv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGS1Q05eyNe5efwNCZlQQa+e9XOVwzAaStXYqxLxM7DQTKg2NV/qJ9mMCv8gYxOmCxxxqCayfXiYPvuezR@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6OpQIJinWADDDWhKYm/GZaIOnv/Ngw/FcBgdjSf5hC0LkahM
	muK1oLLhV79C2Or2VV7HF8+Mn+4lUVJTjKOo2lqiy1K1SjfZrRxXWuc+cwBdKqY=
X-Gm-Gg: ASbGncuuUOjju8ImoU1V/oZ+CtYKpFABTOAQx+SnJluy0pOaMwTh7ixNCOZpuOmV9Lp
	sSN7DzNMIy+UnRsdkGVJB8nQasJyJwRghazqAkAxt/rZlLfFUswereWRE35qLacSkC7EVv51gIK
	6u7v6vx+mM4dM6R1sQCGRIuqJfbMVxkI8HYAT5nWzo48QV9/gQR6lCI4uwcfURmyR7u8DlWIf54
	9VCufUHKaX8GBAaCvHxszDWrpesy0mZXK0JqJFv/zh56tEVQJTkcDXjhKZ/3xw67UgpfXlql4fZ
	svqscHkuzlJEkPQAgERb3A7e
X-Google-Smtp-Source: AGHT+IEplQo8k4ESuQwnk9n5v8xpB7niSmitxukd+9xIdozfLnof1API0E5tJnDMixKh/mzKG4dzPQ==
X-Received: by 2002:a05:600c:4512:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-438b17cf71dmr27769285e9.5.1737632070617;
        Thu, 23 Jan 2025 03:34:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d9871sm60568405e9.25.2025.01.23.03.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 03:34:29 -0800 (PST)
Message-ID: <4adeffe7-ca07-4441-86fe-10a4891b7b4b@linaro.org>
Date: Thu, 23 Jan 2025 12:34:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
 <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
 <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
 <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>
 <5irzvm4socrdjx3zqdxnogpai3bmfb52f63ddr3pisn5aa4jgf@mbc42kb3gyqd>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5irzvm4socrdjx3zqdxnogpai3bmfb52f63ddr3pisn5aa4jgf@mbc42kb3gyqd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2025 13:13, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 12:02:54PM +0100, Krzysztof Kozlowski wrote:
>> On 13/01/2025 09:29, Dmitry Baryshkov wrote:
>>> On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
>>>> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
>>>>> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
>>>>>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
>>>>>>>> differences worth noting:
>>>>>>>>
>>>>>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
>>>>>>>>    offsets were just switched.  Currently these registers are not used
>>>>>>>>    in the driver, so the easiest is to document both but keep them
>>>>>>>>    commented out to avoid conflict.
>>>>>>>>
>>>>>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>>>>>>>>    parents before they are prepared and initial rate is set.  Therefore
>>>>>>>>    assigned-clock-parents are not working here and driver is responsible
>>>>>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
>>>>>>>
>>>>>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
>>>>>>
>>>>>> No - must be gated accross reparent - so opposite.
>>>>>>
>>>>>>> CLK_OPS_PARENT_ENABLE ?
>>>>>>
>>>>>> Yes, but does not work. Probably enabling parent, before
>>>>>> assigned-clocks-parents, happens still too early:
>>>>>>
>>>>>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
>>>>>> [    1.623556] PLL(0) lock failed
>>>>>> [    1.624650] ------------[ cut here ]------------
>>>>>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
>>>>>> configuration.
>>>>>>
>>>>>> Or maybe something is missing in the DSI PHY PLL driver?
>>>>>
>>>>> Do you have the no-zero-freq workaround?
>>>>
>>>> Yes, it is necessary also for my variant. I did not include it here, but
>>>> I should mention it in the cover letter.
>>>
>>> Could you please possibly backtrace the corresponding enable() calls?
>>
>>
>> It's the same backtrace I shared some time ago in internal discussions:
>> https://pastebin.com/kxUFgzD9
>> Unless you ask for some other backtrace?
>>
>>> I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
>>> such requirement should be handled by the framework instead of having
>>> the drivers to manually reparent the clocks.
>>
>> I don't know how exactly you would like to solve it. The clocks can be
>> reparented only after some other device specific enable sequence. It's
>> the third device here, but not reflected in the clocks hierarchy. Maybe
>> it's the result how entire Display device nodes were designed in the
>> first place?
>>
>> Assigned clocks are between DSI PHY and DISP cc, but they are a property
>> of DSI controller. This looks exactly too specific for core to handle
>> and drivers, not framework, should manually reparent such clocks.
>> Otherwise we need
>> "clk_pre_prepare_callback_if_we_are_called_when_phy_is_disabled" sort of
>> callback.
> 
> What kind of PHY programming is required? Is enabling the PLL enough or
> does it need anything else? Are the PLL supplies properly enabled at
> this point?
> 

I don't know exactly and checking is tricky. I tried to use
CLK_OPS_PARENT_ENABLE - with equivalent code, setting proper parents but
without enabling the DSI PHY PLL manually just with
CLK_OPS_PARENT_ENABLE - but then you have multiple:

dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set

So how do you supposed to test it? Any assigned-clocks-xxx will be way
too early. Moving code around? Well, if I move preparing the DSI PLL
clocks out of dsi_link_clk_set_rate_6g, then dsi_link_clk_set_rate_6g()
will fail. Always and CLK_OPS_PARENT_ENABLE does not help because of above.

If you have specific code in mind, I can try it, but I don't see easy
methods to see what has to be enabled exactly because of how everything
is entangled together.

Best regards,
Krzysztof

