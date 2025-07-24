Return-Path: <linux-arm-msm+bounces-66447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B28B1053C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 883123AB5F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AC92741B1;
	Thu, 24 Jul 2025 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s37Ae/bx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3189229B02
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753348128; cv=none; b=pgE7RfoaDZKHRmgPlNas9UpmSL0NG7DMEXaXoYafTslgqRJ/57YES0qrBgOYZ59aK93na5bzBCff6wwD03g8HKIrh9GopIDODWX5t150DV7VjKWCmg+JBnBlrok8kvjfaK6yap9qVJYsg3zCPDiosyTYY6YtplcqqxEW3BbukDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753348128; c=relaxed/simple;
	bh=idz6neG+xEFW8DuglK0GHFt/ADYPwEFKjyXReN4UL9w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NzcJRHOAUq8K/rOJKqjpVYOAMYYTbm/a5HA1jr/c5wviTSgYAmUR/tIHC/ToFktM2LsyaCSCnRO6VMUCdmgcbe5EXS3KT/fqTbOUX4YJO+wWnWSeh+RoySUTBDAOYd316bZnu2o8LXgNQBYna/OZZW4WjbXb5yraSseKczEx7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s37Ae/bx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso661064f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753348125; x=1753952925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXg4u6HsqNdzWoo2/MvFuCGv7k9hvq/xa7ZnDdDOUkM=;
        b=s37Ae/bxIFBYf/kd6N5C8xa5ctAsHpMWqTYdPidUq/s35LDohsQMhjHcpg0uZ4/8P8
         3e79Ygy3dTyI8NRzBZ86gHOiQC/YnUC8yvsqab1yyILxJ5dL8exv5ifQ2cI/UB1QlRAy
         YSQFmRzgXXF8dJrGWM0OqsuQ3a5OcRiM/kZfNXexCJ49mdcK3yogxou1z45fR0RdVuYs
         R9JerQizrQxcZtCo9V5tqJAoz8JqgZxXX3w/6/gE55d5MdohfQGAkxetYQsMMkRHM9S1
         /HO+s9MOEcx1R2y1T+DiaYDFuyBqGJPpFHt9r4v6AWJfPoi/OLVF+41K4dc5AQwCj14N
         dUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753348125; x=1753952925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VXg4u6HsqNdzWoo2/MvFuCGv7k9hvq/xa7ZnDdDOUkM=;
        b=MITtsqfF0+gvPrLyjtVapl+slcwR18UK1AtdvY+dIb/li0bFaXWgibFiSAGazNWYij
         t9Hhzf1JpOj/4wJpoe5AMJppDiXRL60u3y0pboMfcL9jOeMmvORUDh7tStujvbIOK37v
         VMoZmAvATKO6dKhr+g+dJ/yU/MtumBpR3pRexL4HtyuwYYMz7Zf0J8wHV4wpIWsVVueD
         NbWxiQ5JEgurXaoPDxbvXtEvDiemVPLlT4S8fjeyEDdtc7n5T+1qKFMumRaad9xUcFup
         Ij2yZIRqhGF5mzVpSorOAKM31xuoC/06rfzki0nCcmHXnQxzfV1INduhOKjB4+YXzhuK
         bsYw==
X-Forwarded-Encrypted: i=1; AJvYcCWtQ+bzbywrT5ouSl25/oaECNbelDZ06JsOnjJx8of3obUObQgiYS63hPcGuKej4RWG/0JUwhyrBq276um3@vger.kernel.org
X-Gm-Message-State: AOJu0YxxjJ/T9oj5uYBSNaH9HxaKvNq277VI529II+bWj2MWERzglmIN
	miF+JQlkGxpu35PpjHkox8PkUrqEkXF9nYDOZfkd1fDwcod/C1F79woiXm6d+EuB9OQ=
X-Gm-Gg: ASbGncssZWGd9S0nSbYz4eEXY7PXD9ydMovitQl9i8BhJSGAtgFwgZ3RW2h0CzbQA+H
	uo5zTsma7tHesjCpT10mPzAYeQ4OhLSSIT8eqZg6plJOw8/Abk5ObGVRSVBXKeVulmuio8AsEgV
	26eLG+l99CBHOIJvOk/YSZG7cXCWoYaRsmxVDleFAi4uHIlnhoBlZCdISmfcp0Lyc2ZQjlWHTn/
	EDYDzvVWRU4pJ+DVJAj91Gxljl1tsZpHB1UcjE7p48B3Aiktdtsjl+31jWGavFnSsVVmqvsvQ9Q
	SE0nBFFxkuPOIbJXxhwNQ/TdAz8cL4pSL2JK2mfJnyTjZ3VkgDkxBnC7I7lg0tqqkpiucapNq1u
	5010KxJ963SS6ULq3w1+0bcF8gkXmqwwT
X-Google-Smtp-Source: AGHT+IFKG8HnhbGmxBNTv1ZYLJ7a+SRbz9HKwtsn6vRhAzmT1M6m6ODD7B0jDJBZ+2t3pP6qxWOddg==
X-Received: by 2002:a05:6000:2282:b0:3aa:caea:aa7f with SMTP id ffacd0b85a97d-3b768f2fb02mr4904939f8f.56.1753348125129;
        Thu, 24 Jul 2025 02:08:45 -0700 (PDT)
Received: from [172.20.10.3] ([78.246.240.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad036sm1549921f8f.46.2025.07.24.02.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 02:08:44 -0700 (PDT)
Message-ID: <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
Date: Thu, 24 Jul 2025 11:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
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
In-Reply-To: <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 10:06, Johan Hovold wrote:
> Hi Chris,
> 
> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>>>>>>        }
>>>>>>
>>>>>>        pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>> +
>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
>>>>>> +     if (ret < 0) {
>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
>>>>>> +                         aux->name, ret);
>>>>>> +             return -ENODEV;
>>>>>> +     }
>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>> +
>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
>>>>>> +     if (ret < 0) {
>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
>>>>>> +                         aux->name, ret);
>>>>>> +             return -ENODEV;
>>>>>> +     }
>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>> +
>>>>>> +     /*
>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
>>>>>> +      * the sink must use the MIN value as the effective PWM bit count.
>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
>>>>>> +      * correct brightness scaling on compliant eDP panels.
>>>>>> +      */
>>>>>> +     pn = clamp(pn, pn_min, pn_max);
>>>>>
>>>>> You never make sure that pn_min <= pn_max so you could end up with
>>>>> pn < pn_min on broken hardware here. Not sure if it's something you need
>>>>> to worry about at this point.

I'm trying to figure out what would be the behavior in this case ?

- Warn ?
- pn_max = pn_min ?
- use BIT_COUNT as-is and ignore MIN/MAX ?
- pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
- reverse clamp? clamp(pn, pn_max, pn_min); ?
- generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?

Or just bail out ?

Neil

>>>>
>>>> I am honestly not sure. I would hope that devices follow the spec and
>>>> there is no need to be too paranoid, but then again we do live in the
>>>> real world where things are... not so simple ;-).
>>>> I will wait for further feedback from someone who has more experience
>>>> with eDP panels than I have.
>>>
>>> There's always going to be buggy devices and input should always be
>>> sanitised so I suggest adding that check before calling clamp() (which
>>> expects min <= max) so that the result here is well-defined.
>>
>> Makes sense, I will do so in the next revision.
> 
> It seems you never got around to respinning this one so sending a
> reminder.
> 
> Johan
> 


