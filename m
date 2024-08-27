Return-Path: <linux-arm-msm+bounces-29649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6D9613FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749FB2848E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 16:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919E11C6893;
	Tue, 27 Aug 2024 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WipV0yn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695FD1CBE8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 16:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776001; cv=none; b=ndN1PUy4+Z4p6m4DRB32MiEhO0v6Av9r25pI5rJssvccEiGpIfgzkrfhgzJIp/Ou89pBGzofvgx1v/8f6vjY+po75K8p+ucAkxyNnAhfwh/+zH/ImQoxj+C1iovU/mQCTjHyFYl4tu0aXAF6TLOBfJQMmD6BqnWTil71E41uSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776001; c=relaxed/simple;
	bh=e8CooLDyjqVzLqCwIuVAsXY+x0H9Iip9UWRM8TAkzXc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F2UNAgO/oNIA67iK8nw8DU+9zdWZT77p5Jvdlzzt76jKG94Wnlfcny4ljgOw4vxc3a4aj9og/Kfei0QJUi4N5E2Ijk8VGdby2vtcS3rU67E/t6uouRsyXjZDhOeF1mfhS01vXgQY80KNuP/1U5YqrJdBOOFLXYLq8B7LN45vmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WipV0yn/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso31267555e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724775998; x=1725380798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8CXfOImNZAPo+0QEI9EfNOPJJp994RZWBU+MZvr+8c=;
        b=WipV0yn/IOr74mX0aWaZnPihkrpRFFyo99+LjPa8YBB2LfRKT/3AL3eMnS6iqA5h/n
         m1gMAIs2oO7HAsZ2lcn9eeRBZbMPzzg26lHgBJ1Y1OHvgv1DTV0T5UToAoGagE7UQJRJ
         Vxt2GLQP0uMX3mZzGzg70Sn2l5rK08K9vqgbODPgzDi3uo619WlGO+gwKY/weXS3Mwyc
         oWKmvY/5WdTDz9nQrzACyTx2/ROOZuFnnA1XYLp1FMmZuHPayqf6D4ArWxXNWZudNlGy
         cnd1wdRP5JlJSBOPJEq2FuxrTvlChyPM4ss6Vu6HB+XnswUG3lEl/Sir6NMaVprU3uyh
         rYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775998; x=1725380798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v8CXfOImNZAPo+0QEI9EfNOPJJp994RZWBU+MZvr+8c=;
        b=mMdc77AoE4tou24ORgFY9gcresvuey5ytBhUEbXxZFMXBdJHUR/8zFpRnkd/KkPIrQ
         8epLvqcEimHNkDZS5VPP2tlbGHmwMAM5GAUwDRITU6reeVy/IYoz845wMGn4B/Re3s9A
         0NhWP9r2wgshg8iW8lCQlxXVCoSmycrJDlDyKpFXmDRPDY++N5OcmZVUR07GTz3n/tKE
         HSx+v44p0XXJHyCaGj87JQtk2haMcgUdT7ZL6CMm9xSrGQ25mBVLoawmM4t+h3/FzpyN
         DUTcfHIZU6ZH6EPPZFGkRtFbTA8BPuSfba6tgHOxgsfuDzaMx+MnpXaSZE36eqq/JxgR
         BM8A==
X-Forwarded-Encrypted: i=1; AJvYcCVn4OBm30wvdxl/NWaki4lg/95j75zXhsDRz+jmzQDInYFX98GrntksihfWRuQhbRht+8yucLllYMQbsuj6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw48YHsNm83CjcYsohkm9+W4XsyzR5v6NvPhO90rpdsrmv6XypQ
	TU/TbswbP0udBbDs+X2n15F/uREHUt6II+z0oGY/PzS1Rz1HLTozNUvbqtBJ7Bw=
X-Google-Smtp-Source: AGHT+IESU8S9DEVBMpyZfWscDxO0CMagekuQ/YRK6C4x9dg34h8I1OCh7vzpCcvK6gT1EZnV3jT6HQ==
X-Received: by 2002:a05:600c:8aa:b0:42a:a749:e6 with SMTP id 5b1f17b1804b1-42b9a471114mr23411325e9.10.1724775996955;
        Tue, 27 Aug 2024 09:26:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cedc:30f:887e:7717? ([2a01:e0a:982:cbb0:cedc:30f:887e:7717])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abefc627asm231269735e9.34.2024.08.27.09.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 09:26:36 -0700 (PDT)
Message-ID: <aa0f4f1c-3043-4b03-8b9f-f9a39f3682aa@linaro.org>
Date: Tue, 27 Aug 2024 18:26:35 +0200
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
 <CAD=FV=XfvD1OniNBrCrA8C6XjOB15fye8EdnniNmgpu4DnpH6w@mail.gmail.com>
 <CAD=FV=Vp1Trv2JeFtqk2=Zhi0B7io5w402GkG_UhYm2q34q8dw@mail.gmail.com>
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
In-Reply-To: <CAD=FV=Vp1Trv2JeFtqk2=Zhi0B7io5w402GkG_UhYm2q34q8dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/08/2024 17:36, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 22, 2024 at 8:49 AM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Mon, Jul 15, 2024 at 6:51 AM Doug Anderson <dianders@chromium.org> wrote:
>>>
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
>>>>>>>     drivers/gpu/drm/panel/panel-edp.c | 2 --
>>>>>>>     1 file changed, 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> index 3a574a9b46e7..d2d682385e89 100644
>>>>>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>>>>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>>>>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>>>>>>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
>>>>>>> -
>>>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>>>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>>>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
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
>>>
>>> Personally I think patch #2 could go in anytime since, as people have
>>> said, things are pretty broken today and the worst that happens is
>>> that someone gets an extra warning. That would be my preference. That
>>> being said, we could also snooze that patch for a month or two and
>>> land it later. There's no real hurry.
>>
>> For now I'm going to snooze this patch for a month just to avoid any
>> controversy. I'll plan to apply it (to drm-misc-next) when I see the
>> device tree patch land. Since the device tree patch should land as a
>> fix that should keep things landing in the correct order. ...and, as
>> per above, the worst case is that if someone has an old DTS and a new
>> kernel then a panel that was already not working well will print a fat
>> warning and startup a bit slower.
>>
>> If somehow I mess up and forget about this patch, feel free to send me
>> a poke when the device tree patch is landed.
> 
> More than a month has passed now. One last warning before I apply this
> revert in a few more days.

It's fine if you apply it now

Neil

> 
> -Doug
> 


