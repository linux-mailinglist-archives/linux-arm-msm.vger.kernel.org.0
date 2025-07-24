Return-Path: <linux-arm-msm+bounces-66475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1A5B106D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09BD3ACB8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1BF23BCFD;
	Thu, 24 Jul 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U2+QkfVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BDF23B63C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350165; cv=none; b=q1zgmgBc6B0HTbO/rGqPMUskiDUnvTUWmf9RLnVK+nCSL0YScZGzx0uNOdnXDx+T3mapGG0wV0+gbzNTP+0wZ58QkJu6maTcheaNhJv3XWCXbRa51/EuUJyifQ4jasvvrQhtR0zCRhNd2Hgw2UPiAhCPZxzcgO5cmToP3GGd41M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350165; c=relaxed/simple;
	bh=LGERl8KUrICyo6kIPzopilgsZPFhDc1lGgYJrFgS8qo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jvKS92760WuC9L5YiHyf4DK0iNvZ7cxWBuTX2D/0Nl8usbi6VndbAr0/OWITOKwh4YJTVH2oQLLOssWiGt0LoJFHFxP1QAhME+TqxKOg2y/gjUdymeFIvnk7/H1nJf2NmkZ1Dr3EOhrqbxLCnK7JRJlRi7kwUqg3OWUMXn4upJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U2+QkfVK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso8219865e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753350160; x=1753954960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z79CaHWu43l5yDjP2x+eJ9/JPd8Ed9Dgxev8omxcjqk=;
        b=U2+QkfVKXGB06MKPbzNL1Oeu3PLWl+7UD11Tn6FM+8gll/solRXBmTqUgIbDTjPGv1
         CyUFfUN+hti3OUqy0cL7+JoZu6yqOwfeT4juHxmbeRoUfJYcB8vEUdVdvmJ2oBvXBXgI
         7zjNixigyXC1Iksh5kPfTVa1Dc+MVVdQiBWGDQV+aD0EYwDmbAkh30rfwBgK7CFtxF+o
         xujxczmKvzeT4uX/V/nD5pg8TNPAAQFmVnCIeNfcTCyAmj3/Fnob3ERLyktGJTSoMjRx
         45O0p5TMa4nJKxZtujnM/ATP+7xBTqowr4hQV3Wt9AEDZZecZz4EW5vw9pHs17bpN0dE
         +1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350160; x=1753954960;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z79CaHWu43l5yDjP2x+eJ9/JPd8Ed9Dgxev8omxcjqk=;
        b=dg/mcG3V9nVHV6NbM5PAmvwKnGanldX7JJG9PTUTwRmDqH+TgMFRRZO5QC3HvJ85xA
         Leuoz7jVdRXgRDI3iOlTYVhhWiKlADMVKuewpJUoXxfTMqe9lh2oRIr07fkHV5ee1VwZ
         zkwMJxx0Pes8nWhLTHoU6Ee7QJoeZfltuLSOstmOOCbVPlCqIyUX/1WcVACLRm78xUTk
         PFDosldvjjPp+DqfEgf9LGoEoPAAChHLbgb2jLHtC84JgqUaZDv/Og7LS4/HbQiY/ux8
         f/9CIvISzl1IObK0IUf8ld4i7xS9WJb+Qpx5QLJeXvF81mgAdCG8N79ryM4YGv7pmH3d
         DZCA==
X-Forwarded-Encrypted: i=1; AJvYcCV+sR5YdNKV4zoVIjKtI6tdRlnxaDVc5UY4tGOmDgatg+tm9/j0xsaQJkbJk9CrlWb7v7rIH8w7t1CDtIJh@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrRKKzz1G0/Hw5vAzlolt2CYMGlsG9hJdlPPJRbATcibNfTAZ
	23Nba99mTgf9emBbNUI6HghQI4xc1kr/wkzOfFVkucPpt+OcQAonK4OM6RzNnkFukRtJEJtd+Ol
	zqj3W
X-Gm-Gg: ASbGncspfP10bmC+Lk6PnCh3JRh3CNkp9X18yZxgtn7/sqP1FQ2OKI0krIxxcA8dc2F
	9F1aAu2WirvPcGqC+DD4EwE/Low60yFIK6T0ZsGZ4ZC+L+mS0BS3xILSLzKh3v5qoX5+MKO+9Ru
	K4+5A3rroa0oK9YBu4knr9yYPAGLOmHTOYnfOeKa9d26S/d9Ic7DKRQdVHMTP7+s+VaiNpIN/X/
	juHsk3tYOwHXabTQEOUoGas1z0akgRqbXggWFeBPd5yDzSENjiL5Nj2VucJqEabZWi71tt2vqJr
	jANXmlArVXwoKBwEWO8TPNc2rno9BZUKTIpzgNMa18JCOi5MqaZNrJJ8Vm8xiCos9064yIiDHEk
	tQRe6f+uXkoipBtbIuWrGgtTpiKoZXwMfcvE3jTy3j30=
X-Google-Smtp-Source: AGHT+IEJiJWWY6AZunf3Qx5trJPQSTvOfmPtKb0jYGN1pLKaCbVpPEh7OudnuPeQBKWruWnGdZ/9gw==
X-Received: by 2002:a05:600c:4e0d:b0:456:2dc1:a603 with SMTP id 5b1f17b1804b1-45868c8f4fbmr51798005e9.5.1753350160391;
        Thu, 24 Jul 2025 02:42:40 -0700 (PDT)
Received: from [172.20.10.3] ([78.246.240.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586ec79441sm13392125e9.2.2025.07.24.02.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 02:42:40 -0700 (PDT)
Message-ID: <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
Date: Thu, 24 Jul 2025 11:42:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
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
In-Reply-To: <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/07/2025 11:32, Dmitry Baryshkov wrote:
> On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
>>
>> On 20/05/2025 10:06, Johan Hovold wrote:
>>> Hi Chris,
>>>
>>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
>>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
>>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>>>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>>>>>>>>         }
>>>>>>>>
>>>>>>>>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>> +
>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
>>>>>>>> +     if (ret < 0) {
>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
>>>>>>>> +                         aux->name, ret);
>>>>>>>> +             return -ENODEV;
>>>>>>>> +     }
>>>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>> +
>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
>>>>>>>> +     if (ret < 0) {
>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
>>>>>>>> +                         aux->name, ret);
>>>>>>>> +             return -ENODEV;
>>>>>>>> +     }
>>>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>> +
>>>>>>>> +     /*
>>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
>>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
>>>>>>>> +      * the sink must use the MIN value as the effective PWM bit count.
>>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
>>>>>>>> +      * correct brightness scaling on compliant eDP panels.
>>>>>>>> +      */
>>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
>>>>>>>
>>>>>>> You never make sure that pn_min <= pn_max so you could end up with
>>>>>>> pn < pn_min on broken hardware here. Not sure if it's something you need
>>>>>>> to worry about at this point.
>>
>> I'm trying to figure out what would be the behavior in this case ?
>>
>> - Warn ?
>> - pn_max = pn_min ?
>> - use BIT_COUNT as-is and ignore MIN/MAX ?
>> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
>> - reverse clamp? clamp(pn, pn_max, pn_min); ?
>> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
> 
> Per the standard, the min >= 1 and max >= min. We don't need to bother
> about anything here.

Yeah, I agree. But I think a:
if (likely(pn_min <= pn_max))
is simple and doesn't cost much...

> 
> On the other hand, I think the patch needs to be updated a bit. If the
> pn value changed after clamping, it makes sense to write it back to
> the DP_EDP_PWMGEN_BIT_COUNT register by jumping to the tail of the
> drm_edp_backlight_probe_max() function

You're right, we need to write it back, but we can't jump to
the tail of the function since it has all the pwmgen logic
in the middle.

Neil

> 
>>
>> Or just bail out ?
>>
>> Neil
>>
>>>>>>
>>>>>> I am honestly not sure. I would hope that devices follow the spec and
>>>>>> there is no need to be too paranoid, but then again we do live in the
>>>>>> real world where things are... not so simple ;-).
>>>>>> I will wait for further feedback from someone who has more experience
>>>>>> with eDP panels than I have.
>>>>>
>>>>> There's always going to be buggy devices and input should always be
>>>>> sanitised so I suggest adding that check before calling clamp() (which
>>>>> expects min <= max) so that the result here is well-defined.
>>>>
>>>> Makes sense, I will do so in the next revision.
>>>
>>> It seems you never got around to respinning this one so sending a
>>> reminder.
>>>
>>> Johan
>>>
>>
> 
> 


