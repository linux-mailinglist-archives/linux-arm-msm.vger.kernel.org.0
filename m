Return-Path: <linux-arm-msm+bounces-45966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A05A1A3B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05E0E3A2A5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DF620DD45;
	Thu, 23 Jan 2025 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hR7IhWjr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B51D432F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633663; cv=none; b=GcRRhUH5/yyvYNNoeaGDQ9I7WznKReK1S9Grvzzrfhprg0JoC1edtQKxMmmqFHc4kJX8xRzreRytdNJmJUJJs4qoQ3kqkH2Xnnk3HBdp55ZnG79ljRU+WM0A62pRXVTOeiQK4Va2bQmX2B7mqKNTsuxWSRCcNNFEXR2AZfzhrDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633663; c=relaxed/simple;
	bh=c8mME8/4upVaSVMn/HYomcPevae7lN9Yttgsza1qZzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ukzk0nFc+zXZrB9/4BdVqVG86Ev8RWJ1jHyD9N3W8wziNXhZ9iRWTwmvFsvKrZDGO22+z8o3xxDzBbt+Fy60p92kq2t6Qyt1pYl39n6DDG+fvG3lfoUILFPFqG1d8LremJnQ0qr1TDm6svPhKdwmPcsiKCEBxf1lDqL7subzvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hR7IhWjr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so153147a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737633660; x=1738238460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UrXgfNcQ6BZmp28khrrcZTapIJra0pknsWVwcp8Cp0I=;
        b=hR7IhWjrJhak39VnueU/0sRaZmkKnUhcPPwPnaOuAZB0xu7pih0pCJL9Q3tiJGz2Zi
         kHeljrZdY8wl6fLFFD2RK5PzwvNOldXxQEakB00u3fm/5TVbZsbHxFL1eDQ5Yc55Il+T
         QpYCv0SLMyjvOxS5ZUl0WN5PI1RT26FC6rD8Oin/P20I8X+hoD43uqJaobD+dxPRxFja
         6sM9pJv7xgwyScv9GCC9OvBgDsXRyVt5baG00DqcH2tq8z0Z9A5B5uUamuYfmWGbWie/
         FcSJYY3K37KKUjATyufkdf05u6bhpq3H+lJosOFc+0fH8ecFHyoxO/3VC30lf7y1X6OI
         8Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737633660; x=1738238460;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrXgfNcQ6BZmp28khrrcZTapIJra0pknsWVwcp8Cp0I=;
        b=Um1QINoiKbzL+PamB0ihBd0lwhDQ/+FEKPcvI3QR2HDUmkHsFwZK/dsHHBeenrumN0
         JuQsa93KpuQYtApUYXKBjiCzzj6fdUnd1kKKJaEyhWJzVAtthLTTs+LgvJ9FRXxIbyM+
         5QMHkEhZbZE046SU80zfxxEmjoUmmqSptyGEyZCi1NIS7rVEPLkEEvVl8NLZkDebukoW
         wO98grN3GVHcDyS/KQ3vgm/bZx6YZ0j97bEWrrWkaxJ1Du/UtvhPzmCWK5ryUdfOQuSr
         gdx07J36Ac1Mj13VagjJ6Iw0NJg6/1DLzVu0FH7lF23kbPXGEfDeFsPXfHDH8iaI2+nx
         vsjg==
X-Forwarded-Encrypted: i=1; AJvYcCXdHJ/lhdyZ/3OD7ZAQI4wupUt4teiLDMA4C+ky7dEauY6ZehnPKA6xa2CfIkQB2tdpcH5iDADiPVMh75M/@vger.kernel.org
X-Gm-Message-State: AOJu0YweZoBUh8sMIx7Cycp1BY7SsIpbAhxA3Lkch6MVmxR9kTEbjeMi
	32nboTh1FVtMBnNrztUG5NCYslRlNWb9FWHZyHexJfx40DC5yv1aaixcoSH0bvE=
X-Gm-Gg: ASbGncusHMnj86msgIzgd2a/W+7zLC0wulQG4l+fDbtyMzySlyjNGWiVs2BTaFVqj6a
	4gN4PVlpYlpfBcgIw7zH2XcHb3T7qGB80FVLVBLNoZGK8J1/oQs2onMtVZxmgrkADYoIHkAZKwj
	DEy7LRVl4fGiG4NT+M8ise2EJlDis66ehm5m5TZMPO1NZlu1cc1UUDMUoE4XAfOhYUoQamxa0as
	yLXug03EmNJPQ5aaJbf5Bq92iFuuRVPpGUcMeB4+CEA2C5cDjuRoBzXPdEXRaCoUlyhyodA92dw
	w2B6FMMeTr46pZVFNTEyGDQk
X-Google-Smtp-Source: AGHT+IEsitVWfU5IVEBtY/CVHy0SWHO/li4n3YFF1n+SaKvLEezsi1TezItFJZIyWkUnvPp+b/wlKQ==
X-Received: by 2002:a05:6402:4304:b0:5d0:214b:96b4 with SMTP id 4fb4d7f45d1cf-5dbf1a99e71mr2376218a12.1.1737633660004;
        Thu, 23 Jan 2025 04:01:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670ebfsm10068472a12.18.2025.01.23.04.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 04:00:59 -0800 (PST)
Message-ID: <c2bc7ddc-6f43-42bd-8d7e-3367210035e0@linaro.org>
Date: Thu, 23 Jan 2025 13:00:57 +0100
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
 <4adeffe7-ca07-4441-86fe-10a4891b7b4b@linaro.org>
 <uqolptkewqkavtnb6wkc5o6hq6nmqe62mi7y43uu7td7vz722d@ddouvp2z46ti>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <uqolptkewqkavtnb6wkc5o6hq6nmqe62mi7y43uu7td7vz722d@ddouvp2z46ti>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2025 12:42, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 12:34:28PM +0100, Krzysztof Kozlowski wrote:
>> On 13/01/2025 13:13, Dmitry Baryshkov wrote:
>>> On Mon, Jan 13, 2025 at 12:02:54PM +0100, Krzysztof Kozlowski wrote:
>>>> On 13/01/2025 09:29, Dmitry Baryshkov wrote:
>>>>> On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
>>>>>>>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
>>>>>>>>>> differences worth noting:
>>>>>>>>>>
>>>>>>>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
>>>>>>>>>>    offsets were just switched.  Currently these registers are not used
>>>>>>>>>>    in the driver, so the easiest is to document both but keep them
>>>>>>>>>>    commented out to avoid conflict.
>>>>>>>>>>
>>>>>>>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>>>>>>>>>>    parents before they are prepared and initial rate is set.  Therefore
>>>>>>>>>>    assigned-clock-parents are not working here and driver is responsible
>>>>>>>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
>>>>>>>>>
>>>>>>>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
>>>>>>>>
>>>>>>>> No - must be gated accross reparent - so opposite.
>>>>>>>>
>>>>>>>>> CLK_OPS_PARENT_ENABLE ?
>>>>>>>>
>>>>>>>> Yes, but does not work. Probably enabling parent, before
>>>>>>>> assigned-clocks-parents, happens still too early:
>>>>>>>>
>>>>>>>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
>>>>>>>> [    1.623556] PLL(0) lock failed
>>>>>>>> [    1.624650] ------------[ cut here ]------------
>>>>>>>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
>>>>>>>> configuration.
>>>>>>>>
>>>>>>>> Or maybe something is missing in the DSI PHY PLL driver?
>>>>>>>
>>>>>>> Do you have the no-zero-freq workaround?
>>>>>>
>>>>>> Yes, it is necessary also for my variant. I did not include it here, but
>>>>>> I should mention it in the cover letter.
>>>>>
>>>>> Could you please possibly backtrace the corresponding enable() calls?
>>>>
>>>>
>>>> It's the same backtrace I shared some time ago in internal discussions:
>>>> https://pastebin.com/kxUFgzD9
>>>> Unless you ask for some other backtrace?
>>>>
>>>>> I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
>>>>> such requirement should be handled by the framework instead of having
>>>>> the drivers to manually reparent the clocks.
>>>>
>>>> I don't know how exactly you would like to solve it. The clocks can be
>>>> reparented only after some other device specific enable sequence. It's
>>>> the third device here, but not reflected in the clocks hierarchy. Maybe
>>>> it's the result how entire Display device nodes were designed in the
>>>> first place?
>>>>
>>>> Assigned clocks are between DSI PHY and DISP cc, but they are a property
>>>> of DSI controller. This looks exactly too specific for core to handle
>>>> and drivers, not framework, should manually reparent such clocks.
>>>> Otherwise we need
>>>> "clk_pre_prepare_callback_if_we_are_called_when_phy_is_disabled" sort of
>>>> callback.
>>>
>>> What kind of PHY programming is required? Is enabling the PLL enough or
>>> does it need anything else? Are the PLL supplies properly enabled at
>>> this point?
>>>
>>
>> I don't know exactly and checking is tricky. I tried to use
>> CLK_OPS_PARENT_ENABLE - with equivalent code, setting proper parents but
>> without enabling the DSI PHY PLL manually just with
>> CLK_OPS_PARENT_ENABLE - but then you have multiple:
>>
>> dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> 
> This really looks as if a part of the DSI PHY is unpowered. If you are
> sure about your DSI and DSI PHY supplies (and power domains) then I also
> have no other ideas.

Yes, I triple checked them with downstream and with schematics.

The rate setting - which is being discussed/fixed here - is in:
msm_dsi_host_power_on()
which does:

    regulator_bulk_enable()
    pm_runtime_get_sync(&msm_host->pdev->dev);
    ret = cfg_hnd->ops->link_clk_set_rate(msm_host);


If I refactor this code into:

    regulator_bulk_enable()
    pm_runtime_get_sync(&msm_host->pdev->dev);
    MY_NEW_PREPARE_REPARENT_UNPREPARE()
    ret = cfg_hnd->ops->link_clk_set_rate(msm_host);

and use CLK_OPS_PARENT_ENABLE, I still got mentioned errors with calltrace:

dev_pm_opp_set_rate (drivers/opp/core.c:1357)
    ^^^^^^^^ line numbers won't help you, so explaining:
             this is exactly in dsi_link_clk_set_rate_6g
dsi_link_clk_set_rate_6g (drivers/gpu/drm/msm/dsi/dsi_host.c:391)
msm_dsi_host_power_on (drivers/gpu/drm/msm/dsi/dsi_host.c:2520)

This is actually weird, because PHY is powered in this case. I would
consider CLK_OPS_PARENT_ENABLE() to be equal to my clk_prepare_enable
from this patch, but somehow it is not equivalent.

> 
> Abhinav? Any input from your side? Or from Taniya Das?
> 
>>
Best regards,
Krzysztof

