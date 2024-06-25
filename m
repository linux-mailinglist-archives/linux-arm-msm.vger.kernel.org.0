Return-Path: <linux-arm-msm+bounces-24103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9EA9168AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 15:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055501F22282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 13:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DB7158D91;
	Tue, 25 Jun 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+GRoz5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F8C14B954
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719321499; cv=none; b=aDl1NrUcNuqoC4CgZ7len20pXdVhf8bMXlkmHLC5iWuBrLeCCVGM/cewTGJcDsu57ASNEJxSjRQmYbD4vFbnMPGIXeUAUiF/fDfyIViq785OIP2wZlEeSVYBcvACiIrhu/0dI4fvwIupvVBj+LJ4S+37N+0rPdi0d8Ualj8bN/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719321499; c=relaxed/simple;
	bh=E5vUhZKhfnLGT6tSDqpyaz/NQWeLpJEsF3zhq+dxwPc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IphjJllBTBkIo6xAuVQ4ec17RvwVDHoFTITkiBMPNILHxIcqBwsoAlmL2lphC3R8Eh0f8RB9NVxB93RpsPeIEbUGVtyd+q1nJawTVieQIYcYdOzzoFsR/3WyGiBKMrCegD5ezIFXXnLXnHhw2t4AOt0CUCgww5r6pyPMbe521l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+GRoz5c; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so253991e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719321495; x=1719926295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uefSQG/mxFIjK0TTS7sVu9h46rtrTN9wB4tex/yXkcs=;
        b=p+GRoz5chj6FiGzaUecVsViefSp2dYudm2BHJGQQIy/miNZaM3vRRtu7kXvSnY0oVp
         MEGZy75Qxgrfx8bHIhBGe7y1z6zvvTtGB+rS36/IazRFtIaK5ychdOmw7+4PUTUkcQsk
         SLutT0/9Ncn3Yz2tOEQBfcfQC07IOize6p3yUNP9iFi0Xvk7KdFiMFI5jhIC6d3sd30R
         AWoFMumihU5hVwbSpnPmd8dhZ4q066kuM4jH2p9652VsaTMJrDSbU5RKifX1n3rvbCOq
         nzxHS6ERWQv6HOBOksLEsGOb0F+GZNXEn7hSvJ5UHrYC6QvnN7FKMCgzfTWffvxTfk+0
         AYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321495; x=1719926295;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uefSQG/mxFIjK0TTS7sVu9h46rtrTN9wB4tex/yXkcs=;
        b=R1mFenlaaHo76w3LYHuj1lJZY/25g7/NxW830TEcYo6iTH4mhTrJe0qn8avWFoYtcE
         VhhGYEplf1bFJKSVn0n3EFfuQ8ZXqcLhhmJk9jQvCF2CggXahPZOuybNXnDKkoAB0AHY
         fxD1DfNzeWdizcnsH6RofZ5P5bmG07yc/oZxM8qfDkhlei47snglagthQ7qxxYAEGd4y
         eaIwxhqIRdLspnEsAL2UWSAR+ThBKGj/B0gI7WrZK21d9v76A6rI9a1b+6kgZciMmrhk
         pR5VX5oJvD+verE1rG7foHkSc3RsJwqAbvh3rIsRQGeCuYPpGB5A5XEJyg28VbGDJv6v
         KZDg==
X-Forwarded-Encrypted: i=1; AJvYcCVx9rOsipSTnTtcz6h/lF6zWowE02+TrbUz/KZSgSMLYk8BXiZDi1Jdzqyku9gbdlo965G6CTuTBijzQy+9o9jA8oDEW/47WC+Ao7b6Nw==
X-Gm-Message-State: AOJu0Yw75Ltxura0klGsZ0QBcApkXdw5v45YEaJXOntRsLBcYGYWyeWX
	F4EvsonSIzMeShr75od/qmrKoHtY/sr6EovRe2JfcKObQxCUS9kSlKOQfJ0V51c=
X-Google-Smtp-Source: AGHT+IEnTpTZ2IlLjKyNQrP0ZdAcA/qO6OAOd4d+supPVqo5E7/xG28f25nQaSpGRJR8gbOuvMWNUA==
X-Received: by 2002:a05:6512:5cf:b0:52c:cb8d:6381 with SMTP id 2adb3069b0e04-52ce063e3f0mr4908932e87.13.1719321494995;
        Tue, 25 Jun 2024 06:18:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a? ([2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b4asm210778585e9.29.2024.06.25.06.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 06:18:14 -0700 (PDT)
Message-ID: <c092ec67-e384-411d-8885-665597547523@linaro.org>
Date: Tue, 25 Jun 2024 15:18:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock
 measure
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-iio@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
 <52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org>
 <1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2024 11:53, Jerome Brunet wrote:
> On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Hi,
>>
>> [+cc people from linux-msm]
>>
>> On 24/06/2024 19:31, Jerome Brunet wrote:
>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>> system clocks.
>>> This drivers aims to replace the one found in
>>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>>> * Access to the measurements through the IIO API:
>>>     Easier re-use of the results in userspace and other drivers
>>> * Controllable scale with raw measurements
>>> * Higher precision with processed measurements
>>> Jerome Brunet (2):
>>>     dt-bindings: iio: frequency: add clock measure support
>>>     iio: frequency: add amlogic clock measure support
>>>    .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>>    drivers/iio/frequency/Kconfig                 |  15 +
>>>    drivers/iio/frequency/Makefile                |   1 +
>>>    drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>>    4 files changed, 868 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>>    create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>>>
>>
>> While I really appreciate the effort, and the code looks cool, the clkmsr is really
>> a debug tool, and I'm not sure IIO is the right place for such debug tool ?
> 
> The reason why I went through the trouble of doing an IIO port is
> because I need that for other purposes than debug. I need to to be able
> to check a frequency from another driver. I don't see a reason to invent
> another API when IIO provide a perfectly good one.
> 
> The HW does measurements. IIO seems like the best place for it.
> 
> For the record, I need this for a eARC support.
> eARC has a PLL that locks on incoming stream. eARC registers show wether
> the PLL is locked or not, but not at which rate. That information is
> needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
> is a life saver in that case.

This is a very interesting use-case, and quite weird nothing is provided
on the eARC side.

So yes it's definitely a valid use-case, but:
- we should keep the debugfs interface, perhaps move it in the iio driver ?
- we should keep a single compatible, so simply update the current bindings with iio cells
- for s4 & c3, it's ok to either add a second reg entry in the bindings

Neil

> 
> Everything that was available through the old driver still is, with more
> precision and more control.
> 
>>
>> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
>> they chose to keep it in userspace until we find an appropriate way to expose
>> this from the kernel the right way.
>>
>> If it enabled us to monitor a frequency input for a product use-case, IIO would be
>> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
>> it's not the best way to expose those clocks.
>>
>> Neil
> 


