Return-Path: <linux-arm-msm+bounces-60044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA50ACAAEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 10:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99696189B82A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA781DDC2C;
	Mon,  2 Jun 2025 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7ooV9LD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001CF19DFA7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854562; cv=none; b=jYa5QYamfrv5okmpe/cV7PUh+uooSxZlGMI7VzwMrKvWZOdHNpYej0oW0oxtj55DRGMhcINB5pVqfWHxzf3mLLhcVzWexYKHpcrtcTnIlRAgFV1wyR+rWTyuOSgVr4udfsRn/JZmrrDFzqEpwit8+pdK+2n09O7zjNBK7kZcXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854562; c=relaxed/simple;
	bh=oTbng+godhHg8e/ijVxCjzCR8UfcEq5jqExNxTsgaw0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HMnh487eW/8fGSufCnsyEeH4BQea3iuZTc8FJZUndCyCFSmfktRVYv/0NMvBpE1CPH5J/xg1xo/jjleGlMSslxF5TzYYua1B7/MLEY9Kfua1WVdyGeIGMQaNCKWAR+tdZdMTvjoApVQHojJSIi5RHDFdWB5jX70dHNfMgGuEmb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7ooV9LD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4508287895dso29342705e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748854559; x=1749459359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QYD6lw/8riHbGeOafpIw3lxHQ0yDfZV96sQp+2PqGY=;
        b=T7ooV9LDEVXpqtiJNqPbW3ZJw0MKhz+yGDQqqPTScxrkYiigunDfx2XmGT+DM4s6i+
         whEdONWixsxje45opmCXf3uaEjEQyT0ACsp38ki9JRBiuwlv2vJZEdJ9oRlh2pzuBTGj
         UpDLjVpIEkYfgpAfBgNozmacdlU/Nf0PEYWXzKVz8jmelZQu8wYVe1pyubZirwXlAtKm
         cEVzYkOHjXM0CdZJv+QQmK1Pgikuap4ULZtfMQEm2w59NBW+5kL2cjUzBZRTZUV3ORcv
         kFyze5gl12g5AD6dKqumV/BqrQ2KSBpF+7YKAIYFY17M4IOvdfFT3BfBwuUSDHIDXRJT
         JpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854559; x=1749459359;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7QYD6lw/8riHbGeOafpIw3lxHQ0yDfZV96sQp+2PqGY=;
        b=VJCnTwU95RJgX7Ec8jX8dISlF2uJ1HKLG3cjiPM1YotLYFrjnhsKkp8Yt5xZ3OaXKt
         gZHR7DWojR9JTY43v4tfZEgg0LFcCdcyyOVGrVeL+9ls1LJgQAQ6aTTuMpznHrInrvUT
         MKhKsYv5vH902F5nYP+vyd7Nvzz32uVm//XptLpLFbmj94jDUzO+lVZYaOuU6Rh1yvov
         f5JLch4+EfizYVvwRgoeRZ0zh2q6QpopCAqG8T45Ict66ZTAOdy6sMHXYYRdUyNm2Y5D
         U6xmTT9a2nl+oF4BzmDxDMFN1HEYIno9C+vIvWQVkI5cjdwZZ4Jn7N2/3llQXWnDIgfL
         iOhw==
X-Forwarded-Encrypted: i=1; AJvYcCW8L2hPO4Zbiv19RmHuKuclaVulwEILzpuz1ht/m60/48qA3Qk3ro/FlefsxxocThX1uHsWU9/8JO3N0uoI@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhs6Oj9MXTbWRH+UGsbUoKDT9EHUECtGOifIxffJy4oOinQb9
	6orxrg3NcmMyvTzJwon9FtadFmK6GCSH6lCYnUooyGApkqe8YWiNCqHvxSFzmti3SvM=
X-Gm-Gg: ASbGncvmsEPjF+i4GBFuxy9gPNzFCL0JOx/IiNHtzTEdiQjPXSw/opQB4exflWs6jbZ
	HKL0r//cmKcdldBQ0bw403M9NKcLDAvgvPKb0ojo0+FwfG/aKJyVXGIE0BJOOW/UmdR/ZWRLkGS
	oL8tbKfCZBhr8pnMB28gxSF5YT2pHRmgdmsGNGydW440aI///hGhEFP3ZrxJJTNB2c2tztZ1r9R
	23NHgOJDpfjdNGU76Rn2fDdnjUfrA1R4HSzoosJdQPeG+tLxpTzRqhHOPzNhRLFHlth49Kw9DVn
	IYmGVPag0c16T3ZWt1SR5tJ9YS9Yv0BGF7TWKnvMBqDgtz3syf1qDx1ke6Q4fRuULRuS/2a/ilI
	8+U+Pe7ahCnECu/XgQjMnr96yZg==
X-Google-Smtp-Source: AGHT+IERLKrJn1bEwrp3LKtii6LGu0HD8bbK3tSawKryKIi92EyAnI21DVniaXqIS0xT91UU9mDP+Q==
X-Received: by 2002:adf:f604:0:b0:3a4:f7ae:77c9 with SMTP id ffacd0b85a97d-3a4f7ae783bmr8182583f8f.5.1748854559244;
        Mon, 02 Jun 2025 01:55:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:cb6:30c6:d7ab:d145? ([2a01:e0a:3d9:2080:cb6:30c6:d7ab:d145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm14297282f8f.68.2025.06.02.01.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:55:58 -0700 (PDT)
Message-ID: <75dde9a2-3c0d-481b-bc73-089ba89a77e0@linaro.org>
Date: Mon, 2 Jun 2025 10:55:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
 <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
 <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
 <htufwjvfgdtav2gtgrytc356py6xqhrffbwjg42sgo7k4zzxof@z4xaf35qz7kq>
 <aa17d7d4-b77d-4a0a-88c3-86255dfbc29d@oss.qualcomm.com>
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
In-Reply-To: <aa17d7d4-b77d-4a0a-88c3-86255dfbc29d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2025 18:56, Konrad Dybcio wrote:
> On 5/28/25 1:22 PM, Dmitry Baryshkov wrote:
>> On Wed, May 28, 2025 at 01:13:26PM +0200, Konrad Dybcio wrote:
>>> On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
>>>> On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
>>>>> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
>>>>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>>>>
>>>>>>> The DisplayPort phy should be left enabled if is still powered on
>>>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>>>>> PHY is not powered off.
>>>>>>
>>>>>> This series doesn't seem to solve the USB side of a problem. When the
>>>>>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
>>>>>> clock, so it needs to be switched to the USB-2 mode.
>>>>>
>>>>> I didn't find issues with that on X13s.. Not sure if it's related, but
>>>>> on the SL7, after plugging in a 4ln DP connection, I need to plug in
>>>>> the USB thumb drive twice for the first time (only in that sequence)
>>>>
>>>> Might be.
>>>>
>>>>> But there's nothing interesting in dmesg and the phy seems to be
>>>>> programmed with the same values on both the initial and the subsequent
>>>>> working plug-in
>>>>
>>>> Please try using a DP dongle with USB 2 passthrough (there are some).
>>>> Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
>>>> devices. Would you be able to see the USB device on a bus?
>>>
>>> I only have a dongle with both display and usb that does 2ln dp
>>> (I tested 4ln dp on a type-c display that I don't think has a hub)
>>>
>>> USB3 - yes, USB2 - no (but it works after a replug)
>>>
>>> Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
>>> at runtime?
>>
>> I think so.
> 
> So after quite some time playing with that, I noticed that the USB2
> device was never actually kicked off the bus.. and works totally fine
> after connecting the display output (2ln DP)
> 
> I was looking at dmesg, checking for discovery/disconnect messages,
> but the device was simply never disconnected (which makes sense given
> repurposing USB3 TX/RX lanes doesn't affect the D+/D- of USB2)
> 
> I also read some docs and learnt that what we call
> qcom,select-utmi-as-pipe-clk is suppossed to be a debug feature
> and is unnecessary to set on USB2.0-only controllers
> 
> The USB controller programming guide though doesn't talk about DP,
> but I'd expect that we may need to set that override for 4lnDP+USB2
> use cases (which I don't have a dongle for)

Yeah basically we need to:
1) power-off the USB3 PHY
2) switch to UTMI clock

In the following states:
- USB safe mode (USB2 lanes may still be connected)
- 4lanes DP mode
- DP-only mode

But for this, the dwc3 should also get USB-C events with an addition mode-switch property.
The flatten DWC3 node now allows that !

Neil

> 
> Konrad


