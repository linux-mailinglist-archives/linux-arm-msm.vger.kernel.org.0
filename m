Return-Path: <linux-arm-msm+bounces-26186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47A931634
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3AC2281081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E39018E763;
	Mon, 15 Jul 2024 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EFVoXb5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9424A1741CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721051855; cv=none; b=Z4iGdAyIgpX1fJm6pVvlh4LFMiOIReyZZxTgXqvuLHcPx2HRNISqES9lflWYVbvRMrN9cGWvaGWf4dXIoucGjD+teOJMGqp+tWfBRInufI20a4kFzo1RZVtmNTkAW9KrMBWElW5jW7gTQv4xMRySj9+NY4HlOmJ9IOppxwOf7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721051855; c=relaxed/simple;
	bh=G69dhMihKqI1y+QAIGiAVO8xqyX8K+W8TI3IssZ/CJw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nYamIjgGOuvxOKGNg0Ob1NXh2x5nhPjDGgAVqW0sb7ByghL1mWICvsE37aJVdWbD5+PthQ2zWAc7baHgHIiM9OZy3UIW6F7hAMwdp9pqP81FJMW+Kf2mpkePnB3jIfXFNem4GDOgaTC2S+rxtyL1eHgglHih/fybRp7zbPsCn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EFVoXb5v; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36816ff695dso842126f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721051852; x=1721656652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqmSoh9JB/3hZYySxLznUyX+qQFd5aQoYQGKXDyQDDs=;
        b=EFVoXb5v5qIVoHkTQJ+kM7zaFC5dx/Jl5CNlTq9OgdrWLq3ClBRxlXVrRdhSM+cz4m
         7qf7HIPvuX81IUFSJyVni5YCkJs+YkCzqLvDTzP9I/6YhOt+lhklxOGizraxAnirLN75
         sCxyOBgw4FQK1bEhu7f2+9KwUYz2TqNyr2qjethR+HWqLDcRMu6I0L27Oc+yg/E8M70S
         v8a4iMGgp/tM70XK8eWi78Nosf8ioQSU3UCCvabWtDluu9nrzTwf+/8AHCdTet2z3UG1
         ejk3+7rkjfaGERNEG9GFQOJFGCSQWzkPfvabc1GXtKRQFjZftm7T8YOWLpDW7gDYFWKA
         heEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721051852; x=1721656652;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jqmSoh9JB/3hZYySxLznUyX+qQFd5aQoYQGKXDyQDDs=;
        b=pGNswTwdwdD9uGRGTHHtzhBrhgeHKDAynkThrufgSU2i7JAV5Sl4j7+mHwNLzRD1bb
         q8YvwmwIXgW3QOLlSpFroxqwfmSS3j+NtPyIU/TpBfdNnw8Y96sx59jK17fXBiZHxt/C
         0FNgua9KBLk9AkqjVdT/WoGmGkfsjcI0zYelNoiZf2CBigLszGADY/xlmYJ8+QEMYe0F
         RXwBhWVsDeuq3B5l7BD/CsQg8PPI7G9kBoBAuIJOVGS3ixpdRItm17BQEdna2uQujqtl
         RT+IB8Mh38e2AuV34+1F7yxUPgDGf+CfmZ44flQV0PRGhDB+4DxkPHdNr1dgI+XUYDmg
         gTLA==
X-Forwarded-Encrypted: i=1; AJvYcCV6RsSIbT+E2YL8NBWEAsGxBvvYs2n4OhmKicrg/lKNQFgV4tCzFG8wJxFnU9FhLkGzpgAjLJdDMKoZ0eKC49pFW02NK3s7/UGX87j0Fg==
X-Gm-Message-State: AOJu0YwtBGT/fCo0bMijMrOhq+DR9wkHFHtZHlp1aGNghuR9q+WJBozJ
	6CUSa31sR0anJ4yyLDL5m2Lm2BqKX3iA+NbfiZf+QzRaJuphzH4FWOBVuKjajwU=
X-Google-Smtp-Source: AGHT+IE2nTXTaioYsA/A41U6llM/pzKPMBmM0saB2C1f2cgdXkuwmS9mdBqiFzKuIMT0ybz0qZzRhA==
X-Received: by 2002:adf:ed91:0:b0:367:340e:d6e6 with SMTP id ffacd0b85a97d-367cea96629mr13090106f8f.41.1721051851633;
        Mon, 15 Jul 2024 06:57:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4? ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db038dbsm6413873f8f.95.2024.07.15.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 06:57:31 -0700 (PDT)
Message-ID: <6f8f902b-8192-492a-8354-18590c6c2c06@linaro.org>
Date: Mon, 15 Jul 2024 15:57:30 +0200
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
In-Reply-To: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/07/2024 15:51, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 6:02 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 15/07/2024 14:54, Stephan Gerhold wrote:
>>> On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
>>>> On 15/07/2024 14:15, Stephan Gerhold wrote:
>>>>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
>>>>>
>>>>> The panel should be handled through the samsung-atna33xc20 driver for
>>>>> correct power up timings. Otherwise the backlight does not work correctly.
>>>>>
>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>> partially in that configuration: It works after boot but once the screen
>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>> will get a warning and can move to the new driver.
>>>>>
>>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/panel/panel-edp.c | 2 --
>>>>>     1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>>>> index 3a574a9b46e7..d2d682385e89 100644
>>>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>>>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>>>>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
>>>>> -
>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
>>>>>
>>>>
>>>> How will we handle current/old crd DT with new kernels ?
>>>>
>>>
>>> I think this is answered in the commit message:
>>>
>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>> partially in that configuration: It works after boot but once the screen
>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>> will get a warning and can move to the new driver.
>>>
>>> Basically with the entry removed, the panel-edp driver will fallback to
>>> default "conservative" timings when using old DTBs. There will be a
>>> warning in dmesg, but otherwise the panel will somewhat work just as
>>> before. I think this is a good way to remind users to upgrade.
>>
>> I consider this as a regression
>>
>>>
>>>> Same question for patch 3, thie serie introduces a bindings that won't be valid
>>>> if we backport patch 3. I don't think patch should be backported, and this patch
>>>> should be dropped.
>>>
>>> There would be a dtbs_check warning, yeah. Functionally, it would work
>>> just fine. Is that reason enough to keep display partially broken for
>>> 6.11? We could also apply the minor binding change for 6.11 if needed.
>>
>> I don't know how to answer this, I'll let the DT maintainer comment this.
>>
>> The problem is I do not think we can pass the whole patchset as fixes
>> for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
>>
>> Neil
> 
> IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
> whenever those folks agree to it. If we're worried about the
> dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
> through the Qualcomm tree as long as it made it into 6.11-rc1. I have
> a hunch that there are going to be more Samsung OLED panels in the
> future that will need to touch the same file, but if the change is in
> -rc1 it should make it back into drm-misc quickly, right?

Not sure the Soc maintainer would accept any patches for -rc1 at this
point, but Bjorn can try to push both #3 and #4 as fixes for -rc2.

Not sure #1 would be accepted as fix via any tree, but having a bindings
error for a kernel release is not a big deal if in-fine the bindings change
has been reviewed and queued for next version.

Basically when the -rc is tagged it gets backmerged into drm-misc-next,
so we can backmerge any -rc we want.

> 
> Personally I think patch #2 could go in anytime since, as people have
> said, things are pretty broken today and the worst that happens is
> that someone gets an extra warning. That would be my preference. That
> being said, we could also snooze that patch for a month or two and
> land it later. There's no real hurry.

We can push it now to drm-misc-next so it gets naturally delayed until v6.12

Neil

> 
> -Doug
> 


