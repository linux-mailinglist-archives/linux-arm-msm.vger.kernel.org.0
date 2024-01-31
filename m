Return-Path: <linux-arm-msm+bounces-9212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B50C843B7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 10:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4050CB294A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBCD6996E;
	Wed, 31 Jan 2024 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzjLKPOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670CD69D0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706694769; cv=none; b=pbP8yJJ/4L+ozLBIHV1kMwVO7IyE8THO2KGbrL3Q9oC403KelDlHGse/GsFw0rufgggzbaFpiGlpzxSJ9SHiNS49f9n4TL+zsCED+WdQ1DXqH+7gtKphYppbMq+5eAyApztkb8yy5nC65cGmMgQwCcz5xm9cXcJvOkCqKQ92e5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706694769; c=relaxed/simple;
	bh=fTIfhqGw1d/HJR+aqs5SB6WwWZFYD2zxuQWrfL/S1dw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RnScPQ/Lw5vKznrwOUztqih36PwEYlfezzmzCVfcyLhlMOJ8Tmvx9xgMesqkFUg7+pHQfIvEu5/I6Vpuym+xEGV6LSl9ji8cHGnUmE67BbUoln7z3rP+aGF+F/bRhv+DlqA9DZixXAujU/3izv2nsPvVOvIRUKIzdb9q9Vx+WQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yzjLKPOU; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d057b6ddfdso21925591fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 01:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706694764; x=1707299564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vy9ag9vSpz3bXWFEemDbbZ5ICpPB9T59zqDCvXFR710=;
        b=yzjLKPOUNm3mJDC3SFmHZl1dctH7oKC138Dz3reVC7HoFSUfQlGcHtGgfGNlaeLM9R
         8fIf789R23hoo6mFHYERKNhPvxvj4nz4I+qII5qTNLjm5FvE3erdHHaT8Y6535qahWvQ
         lacEcFKS8OgMdomLin3kISR+BBxz//VEqnxPO+DVGNDoTeJ06cJ2FpoPVv2ixzw3QM0J
         tjRr8VpKJJnkaoFGnGN/HKqck5nS2QtAGLYD6G75Ki5glrUA5HYDgn/UIKfCpSHgxcnB
         Udj4p7xlhoMSAmqSTxIaiFt5jWQF54cE0PzaP+3SMzMwwGMKkYzzBVUsyGK6uOUDyo2N
         zwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706694764; x=1707299564;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vy9ag9vSpz3bXWFEemDbbZ5ICpPB9T59zqDCvXFR710=;
        b=jzJvM7bVQsaFr+1hb7d16pWwha6JSoaQrg5Bg2+PxIa9hXKKhEOaC4BaSB7sudIhEy
         CkdzgfKFlTY5TkDZ++fYQjqPDDt4lOZ9m2TZq6QRT4y8vQGOWT29v3U3+4SgF3AQTr4d
         OLWrYx9bU+4hfozCwe9UsZxZ/hjJsGRr4y7jNToQ29kTYl9JTExRcPWD/QLKEqBrBXNv
         DAEIHYbDDL3lR2b6oQAP179LuGd7Tm3gl67ONgA1EbxnFO+GpdHjRTgIaCbHEcGtI7VL
         Li/aklUcGHCJroE+YMNrfJNqdJGL8RSqIyH4zCi6al8Y1wzXXqxuKG2FcUfaQ025zON1
         EqHg==
X-Gm-Message-State: AOJu0YyFKu7bxu//lPHI3TmJ5qsAACuhdwwQxbBMnHYmCp4ACYTdzMXi
	jiJiRIO0Of4VC/oYfQ0evytyBVjHh9hga3y8G7TwH2i6r+8x7mEiBUfC0kufIys=
X-Google-Smtp-Source: AGHT+IG6Xu1C1j6SyDZmreNSX8+xfoVcpAMVxiflT3WbYkQ3umBoKf9MN0TWAMy06KSGoLm0U6GKsA==
X-Received: by 2002:a2e:84cd:0:b0:2cf:2db4:cd84 with SMTP id q13-20020a2e84cd000000b002cf2db4cd84mr772150ljh.49.1706694764460;
        Wed, 31 Jan 2024 01:52:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVn6dszHl2gPrVUm94CT0J4a9x7kfsAG5Hj3PD80ZzNLeSwkoamvLdSKKTaKtRk6oSlN90EMwaN63rcgt/tJPc5cFZkCN1yV2ChH0Ujbe57KAWr2E2BgTQ2d8dz5W8p6F/2T89v+tEN8rFblqbb8aJVQ07BvyslkrD8XTmmTn4ZnaQICNStWkmmxswOuUqTyApWOFIDmrgvrWer56bdOTO14h8gY/8GJYnVO+ikOw6ggTQajutJj0oH6qYlUNWB6ZmocLNeTufdb/g+wJwpqWCogykXmnfgx3RUFPcKqXKdI/49WbaBVgm/anhAu+K5cH2iwtQj5A7BP4Muuds6wLD+gmohkhr9w6vzNHy6KJtIAVvkkXZfzMVhUSh0kkNRjB5oRltTV4w2/Qgk/8PFwtIF+YnbRSorbmzqxlmTqCl2jTKWpW8ZATL0xI/LSlNQLjy06ON752/jClZj3CCeENZRjv1vnkWskxO15uWAWiz9OvbEZhT8nx8UwUZ2XELt7wN3V489ZXnhTSdzXytxVx4pd/RXSC3Ml84zhUysoaMS0du2ncpX9fB6Fn3D2wJE+SO4EoaXYDyVjRgkb/HnBX9g9F4YfHjIPQDS+LK5nU+ccR5rNYc8TjttcZHfFn5gqHCUx/fPqekaXMt/G7jgBtYHIYly+Zoy63J53TBMZ+lBww7evLpFrdMUYIiI4pwLFcYu2L0MX8s9GtPXIpHrZgw0iILaA58qzlUSevF7S1znTdvBR/GlzgK2K8gY3jz+Q6ioTvisMTIJeKhZIShhZb5/4lJFBqmm4m+SBkQzwsYCmfMKDZeSYbcxAcBlbTasFfeBeW+9dw==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id di11-20020a056402318b00b0055ef0105f2fsm3426803edb.80.2024.01.31.01.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 01:52:43 -0800 (PST)
Message-ID: <3f906732-74b7-4219-88ee-59509bff8459@linaro.org>
Date: Wed, 31 Jan 2024 10:52:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <6473952d-893d-4591-9bfd-dd983313bee9@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6473952d-893d-4591-9bfd-dd983313bee9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 10:50, Krzysztof Kozlowski wrote:
> On 31/01/2024 09:57, Linus Walleij wrote:
>> Hi Krzysztof,
>>
>> something is odd with the addresses on this patch, because neither GPIO
> 
> Nothing is odd - I use get_maintainers.pl which just don't print your
> names. I can add your addresses manually, no problem, but don't blame
> the contributor that get_maintainers.pl has a missing content-regex. If
> you want to be Cced on usage of GPIOs, you need to be sure that
> MAINTAINERS file has appropriate pattern.
> 
> 
>> maintainer is on CC nor linux-gpio@vger, and it's such a GPIO-related
>> patch. We only saw it through side effects making <linux/gpio/driver.h>
>> optional, as required by this patch.
>>
>> Please also CC Geert Uytterhoeven, the author of the GPIO aggregator.
> 
> 
>>
>> i.e. this:
>>> 2. !GPIOLIB stub:
>>>    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlowski@linaro.org/
>>
>> On Mon, Jan 29, 2024 at 12:53 PM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>
>>> Devices sharing a reset GPIO could use the reset framework for
>>> coordinated handling of that shared GPIO line.  We have several cases of
>>> such needs, at least for Devicetree-based platforms.
>>>
>>> If Devicetree-based device requests a reset line, while "resets"
>>> Devicetree property is missing but there is a "reset-gpios" one,
>>> instantiate a new "reset-gpio" platform device which will handle such
>>> reset line.  This allows seamless handling of such shared reset-gpios
>>> without need of changing Devicetree binding [1].
>>>
>>> To avoid creating multiple "reset-gpio" platform devices, store the
>>> Devicetree "reset-gpios" GPIO specifiers used for new devices on a
>>> linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
>>> controller, GPIO number and GPIO flags) is used to check if reset
>>> controller for given GPIO was already registered.
>>>
>>> If two devices have conflicting "reset-gpios" property, e.g. with
>>> different ACTIVE_xxx flags, this would allow to spawn two separate
>>> "reset-gpio" devices, where the second would fail probing on busy GPIO
>>> request.
>>>
>>> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
>>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> Cc: Sean Anderson <sean.anderson@seco.com>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> (...)
>>
>> In my naive view, this implements the following:
>>
>> reset -> virtual "gpio" -> many physical gpios[0..n]
> 
> It does not, there is no single GPIO here. There is a single reset
> controller, though, but still multiple GPIOs in DTS.
> 
>>
>> So if there was already a way in the kernel to map one GPIO to
>> many GPIOs, the framework could just use that with a simple
>> single GPIO?
>>
>> See the bindings in:
>> Documentation/devicetree/bindings/gpio/gpio-delay.yaml
>>
>> This is handled by drivers/gpio/gpio-aggregator.c.
>>
>> This supports a 1-to-1 map: one GPIO in, one GPIO out, same offset.
>> So if that is extended to support 1-to-many, this problem is solved.
> 
> It does not match the hardware thus I don't know how to implement it in
> DTS while keeping the requirement that we are describing hardware, not
> OS abstractions.
> 
>>
>> Proposed solution: add a single boolean property such as
>> aggregate-all-gpios; to the gpio-delay node, making it provide
>> one single gpio at offset 0 on the consumer side, and refuse any
>> more consumers.
> 
> And how do you solve the reset requirements? The problem is not just to
> share GPIO. The problem is to share in a way that devices operate
> properly when they assert/deassert reset.
> 
>>
>> This will also solve the problem with induced delays on
>> some GPIO lines as I can see was discussed in the bindings,
>> the gpio aggregator already supports that, but it would work
>> fine with a delay being zero as well.
>>
>> This avoids all the hackery with driver stubs etc as well.
> 
> 
> So none of these ideas were posted in previous threads, just because you
> were not CCed (except one thread)?
> 
> https://lore.kernel.org/lkml/20191030120440.3699-1-peter.ujfalusi@ti.com/
> https://lore.kernel.org/all/9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org/
> https://lore.kernel.org/all/20231018100055.140847-1-krzysztof.kozlowski@linaro.org/
> https://social.treehouse.systems/@marcan/111268780311634160
> 

And here:

https://lore.kernel.org/all/CAL_JsqL3oZXJJ5_i4BRGpvWu1X8QFB7OGG=D+zLvvWb=UR1mWg@mail.gmail.com/
which the place where this idea of using resets appeared. I agree that
you were not CCed there, but that only means you miss lei filters or
pattern in MAINTAINERS.

Best regards,
Krzysztof


