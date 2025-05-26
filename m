Return-Path: <linux-arm-msm+bounces-59385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC598AC3AF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98480174111
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22161E1A33;
	Mon, 26 May 2025 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHeIK4FU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BF1E00A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246026; cv=none; b=EqG4PzfV+oG+cDToAUu6Zz1nhfmsPZCEyeuJQtUqSPQdG3x5sQvO9X3U7NV+2Qnw4JhCpxXREy0pe7MmiSSXVPJmBOEsPEVxGIVaqxsWdVy1iZqV5fMB9cGqmrpns8mZ+Biug4fxR4LIZZo3DXQZFwvLYpPlFdA58dNfRK66R0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246026; c=relaxed/simple;
	bh=VzqMQ6BPztDkXD7uvZChlsEo13UPBuBr5teLaXHRfTQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jOeLU1+aYta7Yi3Xoxs29MCbkuaLCkv9QhyvLba9fc/62GDR/YmfDsEBGcoAZQ5Q9iA+4TKwdWVxad0QNopIDsX16mQ+7j04M3cLLlGpzhQXvDCACY4b2KDG7gK1u/9T+NYiyl38EH8WQFe73FuL9ZbbbGa4yfu96RSLi0oduFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHeIK4FU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so13090575e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748246023; x=1748850823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DigRWTVI0uPVJYJftU+HN/4UIE7wd9YCnIfkF7dbku4=;
        b=pHeIK4FU0AsK6ZOpqpILyGRqzNm3RXL7l/x2iPYd5gukRSmWhxb3PztPN5XWk4r0qe
         tvRSypA0/q3LNQKPG3zvIrtSJ6I9Yl7dlYAzpyIUeygAscWcUXnNAZGjuZtlgbOSQPaY
         ZmFGg3WF2x0o5Zhuvdcshg8DFtSPgYTfplIwycYAkdTjTW3ppfYLBMPGjfkutWdvI/yK
         2juV6iPTA3CThk1fAH7RYjNvZ/+tBtHBNkCwfwL72tqIN4l9CJlhATg3tZVfAvUDeqom
         XI71joYXn/Xy9fVaSMyPg6Znc2EdLeeygwrx/7p/crkCY+Zz9J4/jwwaX7MObMV23J95
         6Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246023; x=1748850823;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DigRWTVI0uPVJYJftU+HN/4UIE7wd9YCnIfkF7dbku4=;
        b=qurRddxrBzlkc5cQ8xU5KDtz94lplsEXs1JpqNaq2J0QLM/XL5zIDEb3DuMg4b0tI0
         FxcQHgcKjGRuz1jojodzkb7YKgn2tc3gOlLpYbQGhmZBZKgawDFtGVSqeL0w6Sdj5uXk
         1Y34VukohzDQo0szQ77NP7NFu21DlCsBBDrwz7qntogDXY645G7tR6Sz01LLwFKXk4bm
         GjIttsjB8Mabj9rfQT2PLBzzZ+mIS0CJBmFPrLEfBjVkoBqc1vWCiyl5w1Y1V/8a7b//
         KjY4ltQ57vBZ/jr0dBTlQglX562Eg8+EtXrW9+Jp4Vd4A2vx+HYWbyyE93hxZZ0BWtdT
         AIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFWsnn0FXhYcbuTzuMLXtCjgcj3aIVrAob1O3OTLTudAO989gmQnc/VV2rvFMamFqaF6nR0Jj/bQT5qNVZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+cLztS8ojZJl965y9Sh9kwy/QITA3OqxzZn70HH34rKwwOiEm
	qtisJUDLrPTBibS8mYBvn1iECvrATIDTUbxIv77UFMvEVqAysXg/y1+XHt3jiuM9pJg=
X-Gm-Gg: ASbGnct+08BlcDXV6LYBPJNNYGjDYpMH5x4J6kQ4YLWIVPzBII4t912DY1eBJaFlbZI
	7V64d1ffxlbXw/UsHV+3t+6+ruG6cRgTYBgKQaIO0E4ZDz0s7m/3qPmZdWGgfPI81vTJRujjc/7
	SOezzMI38aX9un1hzB6c0+YAQWPS/upbObtDo7V/7ryUzAqdS08TOMPARw1CAo5SqneGt0QpoYZ
	oRvVxQyhPRA2vapfVv4lQmuNgjP+svfIfl78ehU0CXN4uEf0xej4obVt5wgzvfxSfghDiLPkpIB
	+q4r7BT9WXcLeXALxwZoRTQQECazp9znSAjxVaYZzxdgENlVlO8iQzRUdoW2gLWNtUcglz+h0Ne
	cLfJA2Ojre7Apf8YjS7TonhTZ39+D
X-Google-Smtp-Source: AGHT+IGWdBUcLbcA1h/WiJjqZmIsNuvIOn3f1f5WjTJad311S1FkCQ75ovkfI98vT0bYRt1o41+pIg==
X-Received: by 2002:a05:6000:2389:b0:3a4:d98e:edbb with SMTP id ffacd0b85a97d-3a4d98eef5emr1643661f8f.58.1748246023167;
        Mon, 26 May 2025 00:53:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4ceecddcesm6244589f8f.99.2025.05.26.00.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:53:42 -0700 (PDT)
Message-ID: <408e79e9-4998-4b5c-b378-bd61eda85882@linaro.org>
Date: Mon, 26 May 2025 09:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad
 Pro (caihong)
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
References: <d455a8d0-0a43-4bb5-8592-f22f1835a3c6@linaro.org>
 <20250522100526.914341-1-mitltlatltl@gmail.com>
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
In-Reply-To: <20250522100526.914341-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/05/2025 12:05, Pengyu Luo wrote:
> On Wed, May 21, 2025 at 8:43 PM <neil.armstrong@linaro.org> wrote:
>> On 21/05/2025 10:37, Pengyu Luo wrote:
>>> On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>> On 5/20/25 6:42 PM, Pengyu Luo wrote:
>>>>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
>>>>> platform. Its device codename is "caihong". This patch adds an initial
>>>>> devicetree for basic functionality.
>>>>>
>>>>> Currently working components include:
>>>>> - Backlight
>>>>> - Bluetooth
>>>>> - Battery charging (up to 5v 0.5a) & reporting via pmic-glink (There
>>>>> are many unknown notifications)
>>>>> - Display panel ([1])
>>>>> - Keyboard (via BT)
>>>>> - Power key & volume keys
>>>>> - Touchscreen & stylus ([2])
>>>>> - USB Type-c port
>>>>> - UFS storage
>>>>> - Wi-Fi
>>>>>
>>>>> The following components are currently non-functional:
>>>>> - Audio
>>>>> - Cameras
>>>>> - Charging pump (dual sc8547)
>>>>> - Keyboard (via pogo pin)
>>>>> - Stylus wireless charger (cps8601)
>>>>> - UCSI over GLINK (PPM init fails)
>>>>>
>>>>> [1]: The panel is a dual-DSI, dual-DSC display that requires setting
>>>>>        'slice_per_pkt = 2' in the DPU configuration. The panel driver
>>>>>        will be submitted separately later.
>>>>> [2]: Touchscreen/stylus driver available at:
>>>>>        https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
>>>>>        The downstream driver has been ported and tested locally, but
>>>>>        requires cleanup, it may be submitted separately later.
>>>>
>>>> I have a Lenovo Tab P11 with a nt36523w (-23, not -32) for which I have once
>>>> poked at the driver for.. I see the driver you posted mentions -23 as well,
>>>> please keep me in the loop if you're going to upstream it
>>>>
>>>
>>> I see. Actually, they share the most part of nt36xxx, but with
>>> different memory maps. See
>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/input/touchscreen/nt36xxx/nt36xxx_mem_map.h
>>>
>>>> [...]
>>>>
>>>>> +             /*
>>>>> +              * This memory region is required to initialize the backlight
>>>>> +              * and display for bootloader. Normally, this region is not
>>>>> +              * needed. However, due to limitations in the current mainline
>>>>> +              * KTZ8866 driver, dual backlight ICs cannot be properly
>>>>> +              * initialized.
>>>>> +              *
>>>>> +              * A workaround involving secondary registration was proposed,
>>>>> +              * but rejected by reviewers. This reserved region is kept as
>>>>> +              * a temporary solution until a proper initialization method
>>>>> +              * that satisfies upstream requirements is found.
>>>>> +              */
>>>>> +             splash_region {
>>>>> +                     reg = <0 0xd5100000 0 0x2b00000>;
>>>>> +                     no-map;
>>>>> +             };
>>>>
>>>> I assume this means "if the bootloader sees /reserved-memory/splash_region,
>>>> it keeps the display online" - let's not do that, as underscores are not
>>>> allowed in node names (kernel coding style, not dt syntax)
>>>>
>>>
>>> Right, without it, BL won't initialize backlight and display. We need
>>> it to initialize backlight here since mainline ktz8866 won't program
>>> partial registers properly. If there is no other workaround, I will
>>> remove it to keep kernel coding style.
>>
>> Can't you add a simple-framebuffer for v1 and drop all the DSI stuff until
>> you figured out the backlight and upstreamed the panel driver ?
>>
> 
> I am thinking about it. But still, if backlight can't be properly
> programmed, simple-framebuffer won't help.

Sure but with this version you have simply have no display at all,
so just drop the backlight + dsi stuff for initial patchset, then
when you figured out the backlight and the panel driver update the DT.

Neil

> 
> Best wishes,
> Pengyu


