Return-Path: <linux-arm-msm+bounces-26210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D1D93189A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 18:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1E41C2110F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42941CAB3;
	Mon, 15 Jul 2024 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwEWstVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13B1C6A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061601; cv=none; b=FIO6TxRCYcKs4kb23OXcH1V/H7hs6J4ksXN17FmWY9Oo7roZ9JHUGIAgk4Xb/s5/5nCqIFRSdSzZSqjmdCAMisE9TD2X9GACqBbE45h1vO2AEb2DDLY/zEcT4f0EB5oa0i5S0PXptxcJ2GVjMjRdAPcW030m+r3PPKq/vt1YnVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061601; c=relaxed/simple;
	bh=u4MjrnSVf/buqJOpY2rP5o5zbaep03ngfRQ/3R1Yydk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T/FpjZj2AY3Dysgj+hU1U6uW+dVijr8gprovTPfx5EhdRjo+qUHKHyYpHLtb6aqxpp5iGDHkWa0OLZVHhot6d9UsDfLGitggj0oG8BAT+GQkWUd0IQOc791TOi7jW0e1t1v9OmjQbgd9fn2Tog7a/c0KlI4bW1FmbuMw91um9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwEWstVb; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso59651841fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721061598; x=1721666398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=086b6d+gc7yqfCOplh7mxFF8q3s0UEqs3kxdIOeu14g=;
        b=iwEWstVb7B2mlBazzWPbubumS9ibueBptf9CdP1m5KAg794u1Sm7LJ+ThV/5KUUtXE
         yFClUd2vvhlh2EL/JnZJydwGWqjJIAL+/TAoXvwG1+C0VmeffUKAMb2T9jKE+rKEkIqv
         65W/XLZyTjLZi7PD6mv0/LIDHb4MP1mW8v3TiGbaH/0V/SUhx9HLrnH9fo80T0nI52be
         jpFh08iNocg/vZC+0OaN9fNC9TupIVEIJzDjtlUa4pdm3F2P0OLJA9vzm0pmfKsGf02o
         jPQRS6B3A+mrX4RLUY/e1m7ZZdbA2kfS0rgSZ5u6OWiIImMyWecVKViwZjooOI8nFLQ6
         WlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061598; x=1721666398;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=086b6d+gc7yqfCOplh7mxFF8q3s0UEqs3kxdIOeu14g=;
        b=ZtcxVvCSk/13pLmkCj4PZqUwGKT/Oylej6rHF9vppUmU0JCFRpKXa+r2MmhSZMPQv+
         pKSBQdsGiYEBmD1OuTDiBrnVv15BKnVewLeVZy7/1rlaHC5iXff8RaK/mEVaysF/e+CO
         rPpQC5QsQH/dIZXbzxrT7fVGkisBqVXX3kwePF4cOOnhCE4KF1GWWdt1QrICLTwUbkpO
         ddm/GAmOfEhYEBptUWXhB19R69YVY2II0MDby5HPMnnKvGLx/9edv2bOyKkKWRgCbYYx
         tJcIHM5wrTN1EslJ18GuMBCFOfU/8PQiAFgW28U9LaQcmWqAv+Efo9IaTzD2JN+ck48c
         ojIw==
X-Forwarded-Encrypted: i=1; AJvYcCWdvww3yzfpFxA4xmZK7NtBo6IUE2b3jDhn1fWPGI96eDaPwCJ70KvBwPIxFcvNXolFWrN7iodnJLXk8ndrdRFGO07FyPg1O78snf9Ljw==
X-Gm-Message-State: AOJu0YzrRcN9aVlBRWuHHhF22eJiyw8dWeU4Y3G41CU7BcHtck6WuJgJ
	efgfIN9llXpKmJ9RiE190ZukvDYKkw1SkaF1F+HNcGbcnikzY5TOMQd8mA8mX9U=
X-Google-Smtp-Source: AGHT+IG+XcElSRCGhjUuuzGzjpntRet3YsErGMe3aOi14rgD9n2iYY3pC4eHrBC4f7kKDLM40+7EiA==
X-Received: by 2002:a2e:8012:0:b0:2ec:140c:8985 with SMTP id 38308e7fff4ca-2eef2da7455mr3012311fa.36.1721061597649;
        Mon, 15 Jul 2024 09:39:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4? ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf3bdsm6831119f8f.30.2024.07.15.09.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 09:39:57 -0700 (PDT)
Message-ID: <4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.org>
Date: Mon, 15 Jul 2024 18:39:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: Doug Anderson <dianders@chromium.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
 <ZpUcI3KkIa58zC55@linaro.org>
 <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
 <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
 <6f8f902b-8192-492a-8354-18590c6c2c06@linaro.org>
 <CAD=FV=Ugf-SfJYHzEZ0+ekm4zeXpgUi4XzJTuzuwJN1hjns1CQ@mail.gmail.com>
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
In-Reply-To: <CAD=FV=Ugf-SfJYHzEZ0+ekm4zeXpgUi4XzJTuzuwJN1hjns1CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/07/2024 16:40, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 6:57 AM <neil.armstrong@linaro.org> wrote:
>>
>> On 15/07/2024 15:51, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Jul 15, 2024 at 6:02 AM Neil Armstrong
>>> <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 15/07/2024 14:54, Stephan Gerhold wrote:
>>>>> On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
>>>>>> On 15/07/2024 14:15, Stephan Gerhold wrote:
>>>>>>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
>>>>>>>
>>>>>>> The panel should be handled through the samsung-atna33xc20 driver for
>>>>>>> correct power up timings. Otherwise the backlight does not work correctly.
>>>>>>>
>>>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>>>> partially in that configuration: It works after boot but once the screen
>>>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>>>> will get a warning and can move to the new driver.
>>>>>>>
>>>>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/panel/panel-edp.c | 2 --
>>>>>>>      1 file changed, 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> index 3a574a9b46e7..d2d682385e89 100644
>>>>>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>>>>>>>       EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>>>>>>>       EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>>>>>>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
>>>>>>> -
>>>>>>>       EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>>>>>>>       EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>>>>>>>       EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
>>>>>>>
>>>>>>
>>>>>> How will we handle current/old crd DT with new kernels ?
>>>>>>
>>>>>
>>>>> I think this is answered in the commit message:
>>>>>
>>>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>>>> partially in that configuration: It works after boot but once the screen
>>>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>>>> will get a warning and can move to the new driver.
>>>>>
>>>>> Basically with the entry removed, the panel-edp driver will fallback to
>>>>> default "conservative" timings when using old DTBs. There will be a
>>>>> warning in dmesg, but otherwise the panel will somewhat work just as
>>>>> before. I think this is a good way to remind users to upgrade.
>>>>
>>>> I consider this as a regression
>>>>
>>>>>
>>>>>> Same question for patch 3, thie serie introduces a bindings that won't be valid
>>>>>> if we backport patch 3. I don't think patch should be backported, and this patch
>>>>>> should be dropped.
>>>>>
>>>>> There would be a dtbs_check warning, yeah. Functionally, it would work
>>>>> just fine. Is that reason enough to keep display partially broken for
>>>>> 6.11? We could also apply the minor binding change for 6.11 if needed.
>>>>
>>>> I don't know how to answer this, I'll let the DT maintainer comment this.
>>>>
>>>> The problem is I do not think we can pass the whole patchset as fixes
>>>> for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
>>>>
>>>> Neil
>>>
>>> IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
>>> whenever those folks agree to it. If we're worried about the
>>> dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
>>> through the Qualcomm tree as long as it made it into 6.11-rc1. I have
>>> a hunch that there are going to be more Samsung OLED panels in the
>>> future that will need to touch the same file, but if the change is in
>>> -rc1 it should make it back into drm-misc quickly, right?
>>
>> Not sure the Soc maintainer would accept any patches for -rc1 at this
>> point, but Bjorn can try to push both #3 and #4 as fixes for -rc2.
> 
> Yeah, I guess it's pretty late for -rc1.
> 
> 
>> Not sure #1 would be accepted as fix via any tree, but having a bindings
>> error for a kernel release is not a big deal if in-fine the bindings change
>> has been reviewed and queued for next version.
> 
> In general my understanding is that we don't worry too much about
> temporary bindings errors as long as things meet up in linuxnext and
> get fixed. ...but in this case we're talking about the dts going into
> 6.11 and the bindings in 6.12 which means that v6.11 will be released
> and still have the bindings error. That's non-ideal...
> 
> Can we really not consider the bindings as "Fix" since it's required
> to pass dts validation for the dts patch which is a "Fix"? If we can
> consider this bindings change a Fix then we could land it in
> drm-misc-fixes and then things could meet up nicely I think, right?

Probably, we'll need insight from Krzysztof/Conor/Rob on this point,
and perhaps Maxime aswell.

Neil

> 
> -Doug
> 


