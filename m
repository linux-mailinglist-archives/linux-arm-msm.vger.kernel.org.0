Return-Path: <linux-arm-msm+bounces-8792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54B84008F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 09:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D011F20C1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 08:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DFD54BE8;
	Mon, 29 Jan 2024 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPOPaMl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3DA54BC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706517980; cv=none; b=Gg0Wh+5Mj2Z3L4WNfjZDbYcTjbfF9TEuiOiKQxE1cWiCCxqTOTLbTEyJgNZ/0VizwrKQh6VH/bxMrgNbvOXTHvDQvcWShMamBNQ7Z9ddlRwe00Y5dYo5B5vlpnRYVW36mxa8GiXcrvrlEMxQKcFLDPxfpAh2i80Io39hLF+GQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706517980; c=relaxed/simple;
	bh=3CcUQkJplSAWZQi0wpk1P/jePL1swe+mJdZDZU/kl/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeQj8p5cj562o2e/UxlCW6OkT+NzSakw+/yxIzldLT6UMixF/Yyge9MCS4udfrrOHpOD4VCyygZcAzXGLGpXAUe6LLnJn7rrSGorDRJoYqv8Z/MF44PywHJEc2rSZeUOmWWEzvRDu3XXM2qmXN0SuN+f3QBLy/pFN0x7IyKB6Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPOPaMl5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a30f7c9574eso245683166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 00:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706517976; x=1707122776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIN9Uxh3GqmnyZ27qKSl2rXpIAzPJ++nm03FnGJ+5zg=;
        b=JPOPaMl5txAcpV8h2zSi792n31z/36J2tD2p1tCZAK8FhGkJcNmP4cb2Abv7z/+zkp
         WgV20xdcQEcomlwP2BfgiVtPXqJGAUU3Wg6kux5ukmpfGX1+q0L3wlYNi0Qg7BSmLljP
         ma+RAaVg6sRCYz8tglTaye3dgI1eU4af495jIbQQBY5QlUQvU3cpWJDafRcNaXyhyogJ
         QxtE9uslWKdQqIQK6kSyHmnIc9Gk47W5/U6Kr/jCyMpxeL7dgaeFI4tlki4EkQwAu2L3
         0Ped0kUkSWSxBe9GVvK0a/K/NQTM1DS2Bilz5Tt8d2uUrcJkPacId8aSbKrvV1pJpdvj
         jxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706517976; x=1707122776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIN9Uxh3GqmnyZ27qKSl2rXpIAzPJ++nm03FnGJ+5zg=;
        b=Y6++Z5K0xfsdrZaodbJS8MouLYFNOz98oX+ZduWgYtVuIvcRTb6cvMgVPUG10hvZL6
         MtcpL54nhOK2lHIE2gbxZAbUDC0VTJUTqSsApde7KXTShm3Z6xWVqucswz7nbh29qldq
         gMg+6lW6A60pJlGM2UTX+BX2ohcYN7ptu1xDFS3IGe9iUOsidfJaNiPqs4iBQaBfITsh
         yOv7X5o/CK60rsuTKNC2QcSA0WBa5DzRNfq3OZHMGXJt2VoE+ltEEQvnNJVk7+FoN0dn
         A+L9PHTSZd79p/I1zoTKRdbleZJmI4jaOHYLHGKzeW//zz7E4jX7F1Tb4AbGUPnvZyxy
         H6fA==
X-Gm-Message-State: AOJu0YxTC+70S5hjgbH/pW5j2vENCQLLtinA59ybAWemi8G7dZagXoRX
	9o+0GhvQQfienQ3oQQTOzm9Wa51X40ReqgTEJgQazbOe3lrygB/e7lP1t7TcdSE=
X-Google-Smtp-Source: AGHT+IGbgYZqKJ1ICrrjDjcW6SUy4j7BOdF5HOHXXdTAjzTmDRduFMqPltF+sYjUChhBq/vJ2bq/Yw==
X-Received: by 2002:a17:906:5f95:b0:a31:4405:50b with SMTP id a21-20020a1709065f9500b00a314405050bmr3479624eju.56.1706517976003;
        Mon, 29 Jan 2024 00:46:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vo1-20020a170907a80100b00a35e4b460b1sm221396ejc.222.2024.01.29.00.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 00:46:15 -0800 (PST)
Message-ID: <63e9ab78-3e5a-4d2f-8a67-c002142ca852@linaro.org>
Date: Mon, 29 Jan 2024 09:46:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
To: neil.armstrong@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
 linux-pm@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
 <20240124074527.48869-5-krzysztof.kozlowski@linaro.org>
 <91158620-775e-4db1-9b8e-7154c6d66cd6@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <91158620-775e-4db1-9b8e-7154c6d66cd6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/01/2024 09:27, neil.armstrong@linaro.org wrote:
> On 24/01/2024 08:45, Krzysztof Kozlowski wrote:
>> Devices sharing a reset GPIO could use the reset framework for
>> coordinated handling of that shared GPIO line.  We have several cases of
>> such needs, at least for Devicetree-based platforms.
>>
>> If Devicetree-based device requests a reset line, while "resets"
>> Devicetree property is missing but there is a "reset-gpios" one,
>> instantiate a new "reset-gpio" platform device which will handle such
>> reset line.  This allows seamless handling of such shared reset-gpios
>> without need of changing Devicetree binding [1].
>>
>> To avoid creating multiple "reset-gpio" platform devices, store the
>> Devicetree "reset-gpios" GPIO specifiers used for new devices on a
>> linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
>> controller, GPIO number and GPIO flags) is used to check if reset
>> controller for given GPIO was already registered.
>>
>> If two devices have conflicting "reset-gpios" property, e.g. with
>> different ACTIVE_xxx flags, this would allow to spawn two separate
>> "reset-gpio" devices, where the second would fail probing on busy GPIO
>> request.
>>
>> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Cc: Sean Anderson <sean.anderson@seco.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Depends on previous of change.
>> ---
>>   drivers/reset/core.c             | 215 +++++++++++++++++++++++++++++--
>>   include/linux/reset-controller.h |   4 +
>>   2 files changed, 206 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
>> index 4d5a78d3c085..60a8a33c4419 100644
>> --- a/drivers/reset/core.c
>> +++ b/drivers/reset/core.c
> 
> <snip>
> 
>> +	}
>> +
>> +	ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
>> +					    args->args[1]);
> 
> What would happen with gpio controllers using #gpio-cells = <3> (or more) like allwinner,sun4i-a10-pinctrl.yaml ?
> 
> On this example the flags are args->args[2] so this would probably fail.
> 
> This would also fails badly with #gpio-cells = <1>, args->args[1] value would be undefined.
> 
> You should probably limit to args->args_count == 2 for now.

Hm, good point. Both cells are actually possible, so I need to check it.
Thanks.



Best regards,
Krzysztof


