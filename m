Return-Path: <linux-arm-msm+bounces-70109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB3CB2F2BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD6F16F4EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B632EB5BD;
	Thu, 21 Aug 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMK3oWE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739D2EAD1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765903; cv=none; b=eMHpRizsavbC6BmD32Fm0VeaC0dtU26LfuFMqCS3+9kXagpTUBcMOntP9oJYUij1u10BedWAPWoXg/u+9Inam+coG3BkXrlNC2rJ4z0weC+ZZ9w8JSwVnDKRzgPxMnUIi4r7q9N83bw+c+jLubyF9E3Fe/hQWtJ1EjUWjSbf4ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765903; c=relaxed/simple;
	bh=eZGewZmE1n2kwXrwTz+zU0vLkHuK/OFSPIP5fs6SVpY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cu5y/yTJo/GRAyKqJMzlHje5psdfNW+TwezaBBSp+y6iCb3cxU6ztlGyUM43oYnk7yACJDWW153YCc0BgZDc5CN1I6cBQpZS3GzjutNeu974GICScC3z6ko08Rz9DP2RNNXbiTMmD2gveQqu6D7r3sWqJOrXZ9FbVgxAWtp1FRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMK3oWE7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9dc52c430so515549f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765900; x=1756370700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e35TXGgqyRI8INBP5t0V1q1As4RTM7PmDPjdZXWomKk=;
        b=tMK3oWE7YGGeycBHoS1Ynb0qfyGc0zyxjoOd7z/7yeHulZZELI7jzlJuhrwymv5lEC
         xctRV/9ATsvHJb/X8Ldub+g9M3GOCtW7jMuLBKWrztFQWeMN52jx8fvmZ5tLJ+yCJRvU
         e6W9Da4oj1QMQXx1BXdd9OExPzCnROcA9e33Z9TwwC9ajMNFsdQkV4DkJniDJ4AC0Uw3
         bhzvd5M+qY9KttxWd7+yrdeyYomzn2RPQBR2pdplfmKfHKATTRbPSO/gvQlu7KUeuiUI
         wPGt0L7oS5GYGnI/Ejey7cogFevrmHY4pL/C9i7UNgfY3GOCXyFO7L1Q2/25Ny9H8rji
         kb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765900; x=1756370700;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e35TXGgqyRI8INBP5t0V1q1As4RTM7PmDPjdZXWomKk=;
        b=bllkoJlCvikiISZCBFGrlFhB0xrk/KeY7gYNkU8Q9+/ctHs37S+LGpGp8WN+eU4fM2
         FlrDXEfmQQNYx0Njj2TLvE9xXEIGYaQHqzHc7ZDXsGc0jts6tAxnbZWABxTSxA2UFuGs
         ap2cpdsCabggm51/iLlYrl/G50TOOtKY4EhTgZucrqYBY8jvKw5TLaH2d8Hsu+s1jERi
         3gkXpXDOhgD+hJ2FzcHlz4LWrg6XfkJjxcnR1iJNj8IHvOskXxBy/Kv0gJv/7RqwhVAR
         oDBJ9nXmPhYmgp7VpkTnqJqdhd2W3Samr/ebjxG9XrfDgtGL2c+3/Y/cCXoWQVJPvhTA
         wgsw==
X-Forwarded-Encrypted: i=1; AJvYcCUkRdysP+n9PE3FmOjrGTPRSCjip6/VF0Xc9KcfMzKV35/mJE0fLVRik9X2xQVaIUvpl/0ekutnmgkZzV9K@vger.kernel.org
X-Gm-Message-State: AOJu0YxDZoRI9W0RSPVuO2zlfCLq420iZLT2cQY4LaZ/LTJB2V08MoFX
	1GJId+1w8ielFbZRKtwGccWzsCe8EFV/IBQisO+eBxLUSFkTzVOO9E3WasaCWptCCyg=
X-Gm-Gg: ASbGncs3gNXHbw6Kjpfa28qEXjUQj07EqDYy+QV2utaXkoWjwXCgplpa4X1seNwG6Vh
	VdAqAsccq/D/c1JHCNed6oBp7aDq/S9sgkO80149Xgw6Vz8h27XzFhK9EhNGo8aCM/LJZXKMrkr
	7aBf7YQNXrSlIiAJEau+0u1absv5Llxn9TGczoE78tuZTrb/X//6jrWC3a0m09dd3D6aplVkN6d
	S89ardj4uRfPHc1H02R2X9Lqmvq8/fg/ggkLmL+Kdqhf3/jAunWAMUTVjGj/+CWn+wYTBf71A0t
	iHNgZ/Y7DlaIGLuuNuFAPDgsKJhxxVnAniYLSqj1ntYd8IHBtKaSJICA+1FOfZz7XFd92EgGpeE
	8tXF7mnwwA80zVtQ+xE/CoiPJDmPAD9xKgfwAY14UvkH2EYUUaIyI8ubLo7s1Ti3Lz4lIH5jC+p
	U=
X-Google-Smtp-Source: AGHT+IHCmDvlrpMtyQJ+Qx5FBKwm9zvncJZoqNXzaFRrl4GVWwygtQAi0Zs4Firt+PF0PJBLS03WeQ==
X-Received: by 2002:a05:6000:2385:b0:3b8:d893:5230 with SMTP id ffacd0b85a97d-3c4972741e6mr1057551f8f.47.1755765899892;
        Thu, 21 Aug 2025 01:44:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:443c:3616:7f17:f26d? ([2a01:e0a:3d9:2080:443c:3616:7f17:f26d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c19fbsm10830353f8f.41.2025.08.21.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:44:59 -0700 (PDT)
Message-ID: <086d3bce-b8fa-40fd-8efd-9e457bb01650@linaro.org>
Date: Thu, 21 Aug 2025 10:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
 <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
 <f104c9d8-16ae-64c6-4494-49981ef950ea@quicinc.com>
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
In-Reply-To: <f104c9d8-16ae-64c6-4494-49981ef950ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/08/2025 09:56, Vikash Garodia wrote:
> 
> On 8/21/2025 12:51 PM, Dikshita Agarwal wrote:
>>> The change occurs around Aug 14 2024, So I checked the downstream driver
>>> and I found that fixes the encoding:
>>> ===========================><=================================================
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> @@ -863,9 +863,18 @@ static inline
>>>   u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>>>                         u32 frame_width_coded)
>>>   {
>>> -       return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
>>> -                     (((((max_t(u32, (frame_width_coded),
>>> -                                (frame_height_coded)) + 3) >> 2) << 5) +
>>> 256) * 16)), 256);
>>> +       u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0,
>>> vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0, size_left = 0,
>>> size_top = 0;
>>> +
>>> +       vpss_4tap_top = ((((max_t(u32, frame_width_coded,
>>> frame_height_coded) * 2) + 3) >> 2) << 4) + 256;
>>> +       vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
>>> +       vpss_div2_top = (((max_t(u32,frame_width_coded, frame_height_coded)
>>> + 3) >> 2) << 4) + 256;
>>> +       vpss_div2_left = ((((max_t(u32, frame_width_coded,
>>> frame_height_coded)* 2) + 3) >> 2) << 5) + 64;
>>> +       vpss_top_lb = (frame_width_coded + 1) << 3;
>>> +       vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
>>> +       size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
>>> +       size_top = (vpss_4tap_top + vpss_div2_top) * 2;
>>> +
>>> +       return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb,
>>> DMA_ALIGNMENT);
>>>   }
>> Seems this calculation is different for iris3 and iris33, hence you see
>> this issue on SM8650.
>>
>> Updating this calculation in common code will increase the buffer size with
>> from ~400KB to ~2.2 MBs (for 640x480) and even more for higher resolution.
>>
>> @vikash, pls comment if we should update in common code or have this
>> implemented specific for iris33 separately using some ops.
> 
> increasing 1.8 MBs for VGA and assuming it grows further for higher resolution,
> i would recommend to separate it out for line buffer alone.
> 
> Neil,
> We are doing something similar as a preparation for enabling an upcoming SOC,
> maybe let me share the pseudo code offline with you. When you add encode support
> for SM8650, you can raise that change to extend the line buffer calculation for
> iris33.

I don't understand your point, encoding is already enabled with this patchset and
works fine with _old_ firmwares, it just completely fail to encode anything with
the firmware sent on linux-firmware yesterday.

But yes I can provide a fixup patch for vpu33 on top of this serie to be merged in the same
time based on your pseudo code.

Neil

> 
> Regards,
> Vikash


