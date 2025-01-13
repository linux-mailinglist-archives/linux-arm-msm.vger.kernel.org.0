Return-Path: <linux-arm-msm+bounces-44875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E51A0B4FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 018727A41DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 11:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE5A19259F;
	Mon, 13 Jan 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qU4RcTrf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF51C1F00
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766180; cv=none; b=hr1p/Nwbai1PRXWXSY0w9dun0WUGW/JL3p0uL2PIsooOEpdPwLpQBWJFr9h74oQnFigusMD4AJw3f+wo/bhAcydOjAp8RuVwjBhUarIjYAXo4OCUzYsdv40JRIxWjP1tlwpTQgznWb5ILdAPeRHlqipcIZ8eamczNKp+8gSv9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766180; c=relaxed/simple;
	bh=w9bjIDTeYRMRDdhsC4AANMNrvKdOE7QTlPhg/Aq002U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/38M3lsoThl/qJOX6GflHUjVEd1MeB3UqCNlg90njWDYIu3ah7y1eETOkScL05Z+M8U8zhdT0Vxbn75OGJ9ar4oZIFWqcvh5psEuIUcgCrC9MQxrS1lTRH4utZ9vmde4ddUEtGHZLna7PRtQWLvi7jr/c4E2Srf2GCUpH+a7y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qU4RcTrf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43616bf3358so5351935e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 03:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736766177; x=1737370977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z9Dd2XqQ2DPCgpaKqWn0I/p1u51xriQJuHotLaVuG1E=;
        b=qU4RcTrfE2wJ75haoHEkxcLdPyHreP22wPCH2v0p2BePRBpM60yDrJCoRv/PBM3yYj
         cUARkLy3NmTLBUqney6ljBeV6AfxspRwyGdDXEhZunwDFWvjZV6zCfvCZ9wniWt1W+qc
         XGnTixHDrfpqyuxCvhgNixdzTQKNuQi765SwgeT9uxv63jdjVjWYW4rpCCGSk6ziZsoB
         qwB/yExmkJHXSCl7ipMfVXaHvd1UwClLaYhlUH35rhzJBqKBjLVzBM44B0UoN/ogHpva
         lkXRKAJj/Qae+24o1v9f5nNSY9HetW0XrzsoxGY1DSneWRmpeUN+WyLi2hWC/jzlXM0r
         LkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736766177; x=1737370977;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9Dd2XqQ2DPCgpaKqWn0I/p1u51xriQJuHotLaVuG1E=;
        b=KN0WzxE3A0/RSmX+GYL7w53/jBQ+2KTHyKdlJ9UwfEjoAvcRvPZeeElyJWHPEtkcwL
         z5Lvchfenju1rZo3MyUR5oFsBcDiVVD7hfFp+GUXg9DzHuHRS3xCWp1Z+WSTvk65/Ccm
         0DR6HKdqI2VmTIJsktm4cd8K38eWBkV3Fjzx3UHhvUR8AaulinbCqoFZrYdwaReo/NtH
         AjkoSjodMYIDgAu8VWCWRY9XhypT2AE6Xsau3mcgxEmoxniCGPOWkl0o5tFDG9QRS8pn
         y6HpW3YCwUhwOL5zweqJM5HBe5oqK3icJROM5qwH0vG2000w6A+qXEdl5ml3Opol8fyi
         w/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWwuAAm/1nE1JVcR9x2nWWgnaTUqgLMiGaYTG5wnJj0gUJgUmM0/7WvbxphSCTCalKX04J0MMUtqJrRjRqI@vger.kernel.org
X-Gm-Message-State: AOJu0YygAiAV+82wGIAvUTLAHdAItedpR+Cw8brCZUlwzem/MEBZ36wq
	Tf8IXZ6XKqnNLEL3GTT0Z6S/6Pe5n+YANtS7Rx8RfBqiVMT00W/dDv7bmluONpw=
X-Gm-Gg: ASbGncsY0nbZ0QEzjTZwMy8kJU+qeG4gl+K6n+sJgVQ76GXhkXVSmzZbwc2oWOFYrYt
	eEUC9H3KfOFXPKZXnoVOUez9XTFWSyrMOLpBHHKgUMV+QIapu7DTKOspNNIvsRicFvkmYah0aeJ
	7jER8vy90v3zbSYMsquXINnwD+e5EUl1SbrgRJPw99iFxOQvJzO/F7K+VtbP/BJsgj8Z/AA+YmH
	onmg0bfD81ImmssSa08imz5zhpqj9LdWnuALyy2RSVEZ4Lhd6Qp69p5D53QGEGgDWniEnLoom39
X-Google-Smtp-Source: AGHT+IHFmc21g+vgzvqpGaYICtDIioR3gsSRtnb91mx1nSQcVPnQd30y3bfiZ2BQqcxU67HcH0Zl8Q==
X-Received: by 2002:a05:600c:46c3:b0:434:f335:85c with SMTP id 5b1f17b1804b1-436e26f4258mr78966405e9.6.1736766177571;
        Mon, 13 Jan 2025 03:02:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddd013sm176129175e9.24.2025.01.13.03.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:02:56 -0800 (PST)
Message-ID: <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>
Date: Mon, 13 Jan 2025 12:02:54 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2025 09:29, Dmitry Baryshkov wrote:
> On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
>> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
>>> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
>>>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
>>>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
>>>>>> differences worth noting:
>>>>>>
>>>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
>>>>>>    offsets were just switched.  Currently these registers are not used
>>>>>>    in the driver, so the easiest is to document both but keep them
>>>>>>    commented out to avoid conflict.
>>>>>>
>>>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>>>>>>    parents before they are prepared and initial rate is set.  Therefore
>>>>>>    assigned-clock-parents are not working here and driver is responsible
>>>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
>>>>>
>>>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
>>>>
>>>> No - must be gated accross reparent - so opposite.
>>>>
>>>>> CLK_OPS_PARENT_ENABLE ?
>>>>
>>>> Yes, but does not work. Probably enabling parent, before
>>>> assigned-clocks-parents, happens still too early:
>>>>
>>>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
>>>> [    1.623556] PLL(0) lock failed
>>>> [    1.624650] ------------[ cut here ]------------
>>>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
>>>> configuration.
>>>>
>>>> Or maybe something is missing in the DSI PHY PLL driver?
>>>
>>> Do you have the no-zero-freq workaround?
>>
>> Yes, it is necessary also for my variant. I did not include it here, but
>> I should mention it in the cover letter.
> 
> Could you please possibly backtrace the corresponding enable() calls?


It's the same backtrace I shared some time ago in internal discussions:
https://pastebin.com/kxUFgzD9
Unless you ask for some other backtrace?

> I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
> such requirement should be handled by the framework instead of having
> the drivers to manually reparent the clocks.

I don't know how exactly you would like to solve it. The clocks can be
reparented only after some other device specific enable sequence. It's
the third device here, but not reflected in the clocks hierarchy. Maybe
it's the result how entire Display device nodes were designed in the
first place?

Assigned clocks are between DSI PHY and DISP cc, but they are a property
of DSI controller. This looks exactly too specific for core to handle
and drivers, not framework, should manually reparent such clocks.
Otherwise we need
"clk_pre_prepare_callback_if_we_are_called_when_phy_is_disabled" sort of
callback.





Best regards,
Krzysztof

