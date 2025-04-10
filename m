Return-Path: <linux-arm-msm+bounces-53774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A7DA83B05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BBC1189199F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FF120D503;
	Thu, 10 Apr 2025 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qnrJErkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B28E206F36
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269618; cv=none; b=I+MPaX+geI9M21ZZRcAQzPtDSaMflupWuJWFsJifFAYEvZ8JMUD+6/MOs/geOaFd7k4NhG2l5uXoedp2nqAGe4xBdh66+aFtQjxkH3m5HpsibE0F0F4HvvOaTg20hYmPgf3LsKBPk4m37e3ZdWB1OR6x8clUwK72W9SfbGaj/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269618; c=relaxed/simple;
	bh=jqbeDxGFD7orvHVjEMhqz6f8hAzJMLSz5DriuVNK3As=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QIMv+AuYGBSsduGJeT3fEWgMn9BYUmlTEF8ofrKlrBRjWBSUuJipmUqZffQfscN4UkWfUeabQWPZCTzm3bfiYUwmy19WCORBIKeNG1+lYoTLA1U+SsbZkemhxBRKj8YD4DNU/x3rFCqlprqGDJvQkrSL++3v46bvDLXB0Inabq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qnrJErkT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so5341095e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744269614; x=1744874414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJ274iU3A+WRJulDObAllKIDoCSXEdF+ltb5NDcaCas=;
        b=qnrJErkTKCffJzlQbGS5jRiGYGFU8BlXl9PZsn35ccOdzkJy6Vp/FnP6EUkOKKfzio
         xz0rJpUDMHsch2RfszqS/itUuKLUwdu3nQRJcITIk1EV7cusjlSDT7IwrmeUMRI7dsRq
         GImMkpqCfJUh7g41egMFwlyccRR7ZeOe0L0Zm/geBHFnemKSe+/4tB7yjCrXqUfBuhsU
         veCJTMEJP6QT6ozoTCHjXGzKfFcqFcCBMBm0P6AX1M45j+DnepjMQz7P9iwQtZxnEBGQ
         1r8osvGqRgFykUAuwWt3FW1DRncOsoQLOvemViUDNLpmEmA+sTCJ1DLsXwEry9M8DfAQ
         SKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269614; x=1744874414;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IJ274iU3A+WRJulDObAllKIDoCSXEdF+ltb5NDcaCas=;
        b=VUS5zWUd4e0EuHTugkT7O6KJzqnP8iqZzedDigrDaMj2rhDXhOXJ2fRfTC+Ttemib5
         LUuQuXCIOu2q2h/mbBG86fC6EaTOjTNdm8JwBPscLNXiScOCDC9VieEb7TxlBI/y2mHC
         CPZHEfK4BtCLJzqfqTLYyRg7+uaiyDPpUg2/ZX+71VJeRKowEoNY8tLM3avPW8xiU4IX
         DMfDazFYrwDOi6Z71SXCVY/Wg657IdUAQlNVv1b7oSdQq7rwRf+emmtaGjC8WC4OP13I
         uMZMhX6k1aoNJDTOnY3eY8CEDf9Ob/qY5fDSr/8fNIMn24Dqrf4qPGOKLN33tvJHD+m/
         NH7g==
X-Forwarded-Encrypted: i=1; AJvYcCUFv+Jxs4M/q7XPas577OVFDASa2mFm+3ZzNJAtnFBg/rCycK8uTa215HkkLnwLlOnTY3gYbgm7+5fXNwyd@vger.kernel.org
X-Gm-Message-State: AOJu0YzbsFUp+Z4LN2GPZH0RaqLPXuQh/zIZ5RB6VE1g+V+H/aKrhlYw
	/V15g2ImZHA5iRcHD6Vn9LQLe6vms6kzFj2KevZ67jMQn4wsbhyNq45xCo3v5JY=
X-Gm-Gg: ASbGnctJ6q72CoyZ8fiRpirwd5a8hxsCg+zB78x4tj7OPtQFw7kgpVwF62I1JygXqHy
	iYcFFYCjQXDWARXQeeXi8E1AL19aCk8zyVNLiHu3l1tZr9eDDutsb6nAMSg/KRQqP72dN0XgMsN
	9VZpGsIOGjQ9pO6Ann+wAqFxgh+suVMJx/xIDFlfzfpXlxvvWBhn5MhSJOgbZtXiGNKDzOvBAlq
	XZal7UBtdG5tZ2VjOSTPFzYsBM/lN2O2uIgIi72MIfY2HcavweVtBJq9yM+nDWWVWNg9Faa7LiO
	6bTZFonn9Bo4vXI6+9ayR12mYE7Yk8bcUDeqvaA8cjB9i6aIfb0fUx6lpAk5UbG5tuajKMD4vuz
	RlQTl4dfY02PAe3CZhA==
X-Google-Smtp-Source: AGHT+IEjKg87MJW86Vkm8yAiXk2B6r4lDCQOEOEiLkchHyB2aDZ+/l0gTgRh2c1C7cL44z+cePMwLg==
X-Received: by 2002:a05:600c:4d98:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43f302237e9mr8042955e9.16.1744269613492;
        Thu, 10 Apr 2025 00:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a13:cd5d:5261:ebfe? ([2a01:e0a:3d9:2080:1a13:cd5d:5261:ebfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20b2c355sm21399015e9.2.2025.04.10.00.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:20:13 -0700 (PDT)
Message-ID: <d43d0b56-83e0-4567-a99a-6611a146954e@linaro.org>
Date: Thu, 10 Apr 2025 09:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 00/20] Add support for HEVC and VP9 codecs in decoder
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <801511ac-78db-476b-8f1d-a478b0b64bcb@linaro.org>
 <72a5b302-5c99-4457-86c8-5fa994c93c4a@linaro.org>
 <054c3ee4-78d3-68b2-0dca-8fc339cbea80@quicinc.com>
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
In-Reply-To: <054c3ee4-78d3-68b2-0dca-8fc339cbea80@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/04/2025 19:59, Vikash Garodia wrote:
> 
> 
> On 4/9/2025 9:56 PM, Neil Armstrong wrote:
>> On 09/04/2025 16:29, Bryan O'Donoghue wrote:
>>> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>>>> Hi All,
>>>>
>>>> This patch series adds initial support for the HEVC(H.265) and VP9
>>>> codecs in iris decoder. The objective of this work is to extend the
>>>> decoder's capabilities to handle HEVC and VP9 codec streams,
>>>> including necessary format handling and buffer management.
>>>> In addition, the series also includes a set of fixes to address issues
>>>> identified during testing of these additional codecs.
>>>>
>>>> These patches also address the comments and feedback received from the
>>>> RFC patches previously sent. I have made the necessary improvements
>>>> based on the community's suggestions.
>>>>
>>>> Changes sinces RFC:
>>>> - Added additional fixes to address issues identified during further
>>>> testing.
>>>> - Moved typo fix to a seperate patch [Neil]
>>>> - Reordered the patches for better logical flow and clarity [Neil,
>>>> Dmitry]
>>>> - Added fixes tag wherever applicable [Neil, Dmitry]
>>>> - Removed the default case in the switch statement for codecs [Bryan]
>>>> - Replaced if-else statements with switch-case [Bryan]
>>>> - Added comments for mbpf [Bryan]
>>>> - RFC:
>>>> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
>>>>
>>>> These patches are tested on SM8250 and SM8550 with v4l2-ctl and
>>>> Gstreamer for HEVC and VP9 decoders, at the same time ensured that
>>>> the existing H264 decoder functionality remains uneffected.
>>>>
>>>> Note: 1 of the fluster compliance test is fixed with firmware [1]
>>>> [1]:
>>>> https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u
>>>>
>>
>> <snip>
>>
>>>> ---
>>>> Dikshita Agarwal (20):
>>>>         media: iris: Skip destroying internal buffer if not dequeued
>>>>         media: iris: Update CAPTURE format info based on OUTPUT format
>>>>         media: iris: Add handling for corrupt and drop frames
>>>>         media: iris: Avoid updating frame size to firmware during reconfig
>>>>         media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>>>>         media: iris: Add handling for no show frames
>>>>         media: iris: Improve last flag handling
>>>>         media: iris: Skip flush on first sequence change
>>>>         media: iris: Prevent HFI queue writes when core is in deinit state
>>>>         media: iris: Remove redundant buffer count check in stream off
>>>>         media: iris: Remove deprecated property setting to firmware
>>>>         media: iris: Fix missing function pointer initialization
>>>>         media: iris: Fix NULL pointer dereference
>>>>         media: iris: Fix typo in depth variable
>>>>         media: iris: Add a comment to explain usage of MBPS
>>>>         media: iris: Add HEVC and VP9 formats for decoder
>>>>         media: iris: Add platform capabilities for HEVC and VP9 decoders
>>>>         media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>>>         media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>>>>         media: iris: Add codec specific check for VP9 decoder drain handling
>>>>
>>>>    drivers/media/platform/qcom/iris/iris_buffer.c     |  22 +-
>>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>>>>    drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>>>    .../platform/qcom/iris/iris_hfi_gen1_command.c     |  44 ++-
>>>>    .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>>>>    .../platform/qcom/iris/iris_hfi_gen1_response.c    |  22 +-
>>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>>>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
>>>>    drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>>>>    drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>>>>    .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>>>>    .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>>>>    .../platform/qcom/iris/iris_platform_sm8550.c      | 143 +++++++-
>>>>    drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +-
>>>>    drivers/media/platform/qcom/iris/iris_vdec.c       | 113 +++---
>>>>    drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>>>>    drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
>>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>>>>    20 files changed, 948 insertions(+), 153 deletions(-)
>>>> ---
>>>> base-commit: 7824b91d23e9f255f0e9d2acaa74265c9cac2e9c
>>>> change-id: 20250402-iris-dec-hevc-vp9-2654a1fc4d0d
>>>>
>>>> Best regards,
>>>
>>> Assuming we merge Neils sm8650 stuff first, which I think we should merge
>>> first, you'll have a subsequent build error to fix [1]
>>
>> I agree, it would be simpler, I prepared a fix to apply on top of this patchset.
> Lets sort out the platform data handling. More so, when i see that the patch you
> are adding more of 8650 specific data into 8550 file.

Not really, I only add iris_set_sm8650_preset_registers()

>>
>>>
>>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris?ref_type=heads
>>>
>>> Testing your series in isolation. I can confirm vp9 decodes also getting some
>>> strange prinouts which we need to follow up to see if they exist with the
>>> baseline driver [2].
>>>
>>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com?ref_type=heads
>>>
>>
>> <snip>
>>
>>> [  126.582170] qcom-iris aa00000.video-codec: session error received
>>> 0x1000006: unknown
>>> [  126.582177] qcom-iris aa00000.video-codec: session error received
>>> 0x4000004: invalid operation for current state
>>
>> With the following on top of the last SM8650 patchet + this patchset, I have the
>> same HEVC errors on SM8650, but VP9 works fine:
>> [  115.185745] qcom-iris aa00000.video-codec: session error received 0x4000004:
>> invalid operation for current state
>> [  115.221058] qcom-iris aa00000.video-codec: session error received 0x1000006:
>> unknown
>>
>> ==========================================><==============================================
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index 65f3accc2fb2..7d5116528fca 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -213,6 +213,22 @@ static void iris_set_sm8550_preset_registers(struct
>> iris_core *core)
>>       writel(0x0, core->reg_base + 0xB0088);
>>   }
>>
>> +static void iris_set_sm8650_preset_registers(struct iris_core *core)
>> +{
>> +    writel(0x0, core->reg_base + 0xB0088);
>> +    writel(0x33332222, core->reg_base + 0x13030);
>> +    writel(0x44444444, core->reg_base + 0x13034);
>> +    writel(0x1022, core->reg_base + 0x13038);
>> +    writel(0x0, core->reg_base + 0x13040);
>> +    writel(0xFFFF, core->reg_base + 0x13048);
>> +    writel(0x33332222, core->reg_base + 0x13430);
>> +    writel(0x44444444, core->reg_base + 0x13434);
>> +    writel(0x1022, core->reg_base + 0x13438);
>> +    writel(0x0, core->reg_base + 0x13440);
>> +    writel(0xFFFF, core->reg_base + 0x13448);
>> +    writel(0x99, core->reg_base + 0xA013C);
>> +}
> This is strange, h264 decoder does not need any of those while VP9 needed it to
> work. I could see the same set of registers in downstream code, but cannot
> recollect now on the need to add those.

Yes this is why I added it only to enable support for HEVC and VP9, before we were
using the iris_set_sm8550_preset_registers().

> 
> Regards,
> Vikash
>> +
>>   static const struct icc_info sm8550_icc_table[] = {
>>       { "cpu-cfg",    1000, 1000     },
>>       { "video-mem",  1000, 15000000 },
>> @@ -390,6 +406,7 @@ struct iris_platform_data sm8550_data = {
>>
>>   /*
>>    * Shares most of SM8550 data except:
>> + * - set_preset_registers to iris_set_sm8650_preset_registers
>>    * - vpu_ops to iris_vpu33_ops
>>    * - clk_rst_tbl to sm8650_clk_reset_table
>>    * - controller_rst_tbl to sm8650_controller_reset_table
>> @@ -400,7 +417,7 @@ struct iris_platform_data sm8650_data = {
>>       .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>       .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>       .vpu_ops = &iris_vpu33_ops,
>> -    .set_preset_registers = iris_set_sm8550_preset_registers,
>> +    .set_preset_registers = iris_set_sm8650_preset_registers,
>>       .icc_tbl = sm8550_icc_table,
>>       .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>       .clk_rst_tbl = sm8650_clk_reset_table,
>> @@ -428,20 +445,34 @@ struct iris_platform_data sm8650_data = {
>>       .ubwc_config = &ubwc_config_sm8550,
>>       .num_vpp_pipe = 4,
>>       .max_session_count = 16,
>> -    .max_core_mbpf = ((8192 * 4352) / 256) * 2,
>> -    .input_config_params =
>> -        sm8550_vdec_input_config_params,
>> -    .input_config_params_size =
>> -        ARRAY_SIZE(sm8550_vdec_input_config_params),
>> +    .max_core_mbpf = NUM_MBS_8K * 2,
>> +    .input_config_params_default =
>> +        sm8550_vdec_input_config_params_default,
>> +    .input_config_params_default_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_params_default),
>> +    .input_config_params_hevc =
>> +        sm8550_vdec_input_config_param_hevc,
>> +    .input_config_params_hevc_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
>> +    .input_config_params_vp9 =
>> +        sm8550_vdec_input_config_param_vp9,
>> +    .input_config_params_vp9_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>>       .output_config_params =
>>           sm8550_vdec_output_config_params,
>>       .output_config_params_size =
>>           ARRAY_SIZE(sm8550_vdec_output_config_params),
>>       .dec_input_prop = sm8550_vdec_subscribe_input_properties,
>>       .dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> -    .dec_output_prop = sm8550_vdec_subscribe_output_properties,
>> -    .dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>> -
>> +    .dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
>> +    .dec_output_prop_avc_size =
>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
>> +    .dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
>> +    .dec_output_prop_hevc_size =
>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
>> +    .dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>> +    .dec_output_prop_vp9_size =
>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>>       .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>       .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>>       .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> ==========================================><==============================================
>>
>> Thanks,
>> Neil


