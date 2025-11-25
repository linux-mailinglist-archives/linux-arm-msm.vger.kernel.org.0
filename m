Return-Path: <linux-arm-msm+bounces-83224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5FC84846
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD693AA968
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAAF30FF33;
	Tue, 25 Nov 2025 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2TPd8o5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961B530FC10
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067079; cv=none; b=GkurF3gabOk6lYcNeql5yY+OOGCReoHk+xY3KCaEDCS+UMnH9JX7PX+OAjsNsPyj9//IuSzx7F1UKt5R2okDrN0Vlz8Vp+JbgcFj7qfwMKmrt9QgxIbLy3M/wJk/b/zBiroizaqN3mDiQ6iCGv+iyIKsEd7iVXDAfesou112TM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067079; c=relaxed/simple;
	bh=3UxvyTKMhFPzKhkKyo9X8C90xMdybEY1oVBD2xExz4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1o+Zl8l+Od26MKNTqYJRuwqQwuhsVU8PteGfaYKe1MpRx9/IdKKSwd2/M10gTnu1jpmzTU14COTJz/W7+0lEAE/Id5cPq6JiZRFeVvhw3d694DNZVGCJ0+d1HktYP9H0ab6WBK8ONA6+FfL2rT6oAwGQvEiwCy4E+z10QuQYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2TPd8o5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so34923505e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764067076; x=1764671876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYC61ScVsBbr1quVLA1nHxdsxXyryY1uNeoSQ6wfNao=;
        b=l2TPd8o54sQLuD5D+loNaR+p6GCTwFqDSjpujLjiPU9n571fSuiRcvqDvPhDdJnKu6
         3GZ+rPlc6wBnBswk6A8AOzG12QnLcBhW/C91L/6NAHy6Lfh+Gp+wCurJxZ0jD99PSQUz
         UXRCubKFDteHI8ND+tBEIKCMNwTvJaCBS8FHq08fMeM4HK+qnlbDdZgVGvhLMBBTVhz9
         Dl7LBJEBkrvXqlIr/vgDXKYZdA6uTmRl4A2Dp/x/yjFXstH/AOD9j21I+GFnKzZFviuT
         Rhlxa3U0YHmnBr8gSTAtSvoSJNTngWELrt35LKAYp28ot2qg/renWq+h/VpenRPTGLNM
         e/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067076; x=1764671876;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYC61ScVsBbr1quVLA1nHxdsxXyryY1uNeoSQ6wfNao=;
        b=SM3XqP4ZV1fEXHCZqnFgdJ+hBFd3cMD+4flnV1SJ5+10LVKVMVyMGUjriAlJ0v9iXV
         NGDbuM9Z8iVQtrBiXouwpeL9JdcJHor0KP9rAbD9yfgS2XrS+tkLcR/WcXyjuOKM+vpa
         4YJkg/jvJw9F5xvwXvQ704Pf6LJyom5md9X6H0VWO34wCisfMVSqMiTJwLFjJ7C7eoom
         hopXWcohW9tfTgBouxRZ8fhAt3QLOJq17c9uZ9vs9d+HFqmS/4cw8MwYX9vfFXW7hx1x
         YsOgnutHdFr7YR33Xwzzj+G+f349mdIN+0gAOFvcAiZyprYDQVFb2SnzklfXu5RAWJ0k
         nRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoOPVzUKUKFDes0FMuvEsDoPxnycJFApEdDvu0XUDKOr+oFaBg6/v/t17hfp3nivZvSJMMObxxkEl3v1P6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfe6bSozXEklbsCDXL+aAfyVGAXtpP1lhd+KSY1ZrZTYP5nCvi
	dbmzzn/wHWawiLofcaRkdkkDsaExB0FtT+ZUgUT+rAUc5Dcoi9ZKzmPpE/82J0H9B4Q=
X-Gm-Gg: ASbGncvQRlHRQfXAEdvkPEzknsW8lizvoh1lSZRuXx3acSh5VuW8o3wl1ND/Z2hU48f
	2JmRxFYyDXSAxcMn/vzK9OntuM7Wz2KOodBbIPKMNdTs97wCHjhPxSynmsi4fXRYi7NA0e0Y4rM
	ay+v0rO7ubygPKAFB1V/8xJzalocac6x0OPINWPirUKhDqpyv6dDQKGKTtqUuNf4EdGWgXWFJa6
	mzdIfRvYLRP0Mnf7K/RDATf2Yltrvs6vyq4iVxNDR/VSNSE8IC87EdtcjPlq6S2K4o61VN348iz
	gg9ZQFPW2ax/4mXSYAPjxUeXOcRruR/D8T179a1FEBDfFAN73q86xufQDQgHCmWGsWk5gDS2kII
	Wv/axaM6al7ISRPpg3nh19FbmMPjOYtYOIo+GeEepDzjAE/DrCB6+eLx0nX+sHSV6wrTYTkFiLx
	fdwg+1aSSkNlClWk77F/NufOG58nc/7ONmZR87Q2rRUB5sB0hqaKJBJugXBUgWHjE=
X-Google-Smtp-Source: AGHT+IGP1SPCHIHtShZFolTs83W/8RAo7k/ZmXFb88XoMpqjN2qSC4HAz5PXdGGYvwwWQcNq0TysUg==
X-Received: by 2002:a05:600c:a08:b0:477:aed0:f401 with SMTP id 5b1f17b1804b1-477c11254damr148828405e9.23.1764067075716;
        Tue, 25 Nov 2025 02:37:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e? ([2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052d9445sm12406665e9.11.2025.11.25.02.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 02:37:55 -0800 (PST)
Message-ID: <7716b83f-409c-4fa8-8232-89d3d1be5dd6@linaro.org>
Date: Tue, 25 Nov 2025 11:37:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
To: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ettore Chimenti <ettore.chimenti@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
 wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
 <af3d3295-1340-417f-8682-7d7e2bc6c812@kernel.org>
 <aSGXu7IhPDNSkYhi@linaro.org>
 <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
 <f8ebe524-1f0a-4f54-96ce-aa36f8659adc@tuxedocomputers.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <f8ebe524-1f0a-4f54-96ce-aa36f8659adc@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 15:09, Georg Gottleuber wrote:
> Hello Krzysztof.
> 
> Am 22.11.25 um 12:15 schrieb Krzysztof Kozlowski:
>> On 22/11/2025 12:00, Stephan Gerhold wrote:
>>> On Sat, Nov 22, 2025 at 11:16:25AM +0100, Krzysztof Kozlowski wrote:
>>>> On 21/11/2025 15:26, Georg Gottleuber wrote:
>>>>> [...]
>>>>> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
>>>>> Snapdragon X Elite SoC (X1E78100).
>>>>>
>>>> [...]
>>>>
>>>>> Because the SoC is now outdated and some functions still do not work as
>>>>> well as customers would expect from the TUXEDO brand, TUXEDO Elite 14 Gen1
>>>>> will not be offered for sale. We would still like to submit our device
>>>>> tree to the mainline kernel and thus contribute to Linux support for a
>>>>> compatible device sold by Medion (SPRCHRGD 14 S1 Elite). At least in
>>>>> Germany, this device was sold in many large stores. (An official press
>>>>> statement will follow on our website.)
>>>>
>>>> For me this is unmergeable, because we do not take stuff which no one
>>>> uses (no one can even use), and I am sad I put effort in reviewing AFTER
>>>> this was known to be cancelled.
> 
> In fact, there are a couple of these TUXEDO devices, some of these are
> already being used by people outside the company (by Linaro). There are
> also considerations to give the engineering samples to
> Linux/ARM-(kernel) enthusiasts.
> 
>>> I don't think we have any requirement to have a large user base in order
>>> to merge changes. There is already support for plenty of cancelled
>>> products with only a few (if any) remaining users in mainline, e.g.
>>>
>>>   - Snapdragon X Elite Dev Kit (x1e001de-devkit), shipped only to a
>>>     handful of users before cancelled
>>>   - All ChromeOS SC7280 devices (including DTB variants for several
>>>     revisions of pre-production samples), never shipped to anyone
>>>
>>
>> I discuss here the timing primarily and I don't know the timing about them.
>>
>>> There are also plenty of internal reference devices that only a handful
>>> of people have access to (MTP, HDK, CRD etc). What makes these any
>>
>> They are still "maintained" and "offered", even if only for handful
>> (like 3000 EACH variant) people. That's the amount of board of each
>> variant, e.g. MTP8750, and all of them run some sort of Linux, even if
>> downstream. So sorry, but 3000 (or whatever number it is) is not handful.
>>
>>> different? Ettore has been actively testing and contributing to the port
>>> for the TUXEDO laptop, so if he wants to continue that, I don't think
>>> anything speaks against merging this device tree.
>>
>> I won't be maintaining it, so not my effort in that, but since you speak
>> about that - maintenance is an effort, thus I decide not to spend it on
>> cancelled products.
>>> In any case, I don't think the time reviewing these changes is wasted:
>>
>> I am happy that you do not find my time wasted, but I disagree on that
>> because knowing this is cancelled, I would probably not care and review
>> products which are not cancelled at this time.
> 
> Do you maintain your position despite the above circumstances?
> 
>>> As Georg wrote, there is also the Medion SPRCHRGD 14 S1 Elite laptop
>>> that uses basically the same hardware design. I'm sure there are (or
>>> eventually will be) users of that device who would appreciate having a
>>> fully-functional device tree ready to use. There is an open issue in one
>>> of the Ubuntu repositories for example [1] to add automatic DTB
>>> selection for it.
>>>
>>> In other words, even if we decide against adding support for the
>>> "x1e80100-tuxedo-elite-14-gen1", the same changes renamed to
>>> "x1e80100-medion-sprchrgd-14-s1" would still be valid and valuable.
>>
>> That's why you send such patches with RFC title and FIRST (literally
>> first) explanation in cover letter WHY, so people can decide.
>>
>>> I wouldn't expect any other changes to be needed, although obviously
>>> someone with access to the device should confirm that before submitting.
>>
>> You still cannot apply my review to that other board, so still wasted
>> time because I would need to review again.
> 
> I understand your frustration, but I'm still learning how to contribute
> to the Linux kernel. However, we may be able to find a constructive
> solution. Here at TUXEDO, we have the necessary Medion device and have
> already adapted the device tree.
> 
> Would you review a patch set for Medion SPRCHRGD 14 S1 Elite?

I think it's worth re-spining this patchset for the Medion SPRCHRGD 14 S1 Elite
with a comment in the DT mentioning the device tree is compatible with
the defunct Tuxedo Elite 14 Gen 1, since the Medion is an actual product
people can buy it's worth it.

I applied to first 3 patches, so you can remove them from the next version.

Neil

> 
> (This device is still on sale and can be found in many large electronics
> stores, at least in Germany.)
> 
> Best regards,
> Georg
> 
>>
>> Best regards,
>> Krzysztof
> 


