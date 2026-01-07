Return-Path: <linux-arm-msm+bounces-87787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C102CFC212
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C200C302C13D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A6725FA3B;
	Wed,  7 Jan 2026 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONf2ZUpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222C1FBEA8
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767765441; cv=none; b=l58GjMR5tmRSJsX8436HUmAnWD1pXLhaXW3+nd/9n941uLBrGK7zQVTCUht/d+ySyK0A2H8YBbwY7nSwPD/eis/EnfoSfxw2uleytK9GKYenmVpXlAp3Ju6zv0IS+/PqQKU1P+DG0weqmQeKugADAMIhGqt2tuWYpkBQEEIVtfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767765441; c=relaxed/simple;
	bh=WzuoTu/RQDutR6UUXPFNt/y24uyOreNEZoXFLF1KmnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRYt9kcTsC9rTqvMFFqQs3DvjQmBSQNCINxrUeBBUMAhJ5wXD+5G9q9Y3pimpxr7Z72RCRgCivL9W7qxc4qn7XAJP0QUxPXroU42/9/eAD43fkL5EffzaJwmoVptG45fanA3U8HsIwi6GXLf4uqIEHP7lsClvIbOVWUmgmNzAZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONf2ZUpe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0bb2f093aso14737285ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767765439; x=1768370239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCAOaMP6GeMEUNG9hb1gXak7l2iA5WuTKFQobc/JUxM=;
        b=ONf2ZUpeUiV8crUlzknvpXFGIrdAgS7io1jcWcgWLCIvravDs/qM2o7kW08iDeTuxF
         e6x1Hez+ZJkGYVS9qvgzOBPnw8vts5qL4LKhorCnZ0sOHpD8fC0bTsTv8MmafIFVg4lo
         +28xngcbNwgqt86SHsqKJyv+2Trv+Xk0J6Fm7t786c+n3stJR9UwDKoEwDphMe35NFn9
         HKN9jDkcZIxpdlGyUNjc6DVjf3Gd+fL2noaTOlXYDBRYzhaSNQ7ChMW/8XjzA1N06FA0
         zfMz/wySlikaD1O2Pd2pDtpBlw8fA2/ZzevmCgfb+qnvdoPOUYFn8XyqK/vwFzPNawPR
         8CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765439; x=1768370239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCAOaMP6GeMEUNG9hb1gXak7l2iA5WuTKFQobc/JUxM=;
        b=lpQJEdVabC6WASiqxFkXb+7s9v6lxwP19jrjT71gC6V0G7C2mlopq8BIjtnHsXoj5U
         kxJ9J/qd5SNYF7wMIHWYhRptnYFtm5FZoOVBmk+GiStAuOhPi3w6HQ0+OwPWR0vDZ8JW
         aQpdUGpccgKsOuOJpIdYrWxzHO/2ZbrZ2C0EnOydOCloCVUZ1Lh2sJKge0gKcOKjcK82
         Akb+76Wjf6MrXrTRtPR4+V4m4vyaP8DJYafuFAvIPpyx7bipYDcerqrCt3rx3OWzHH+V
         5VfzJR3xOT/FFSFKi1oWFUZLKzZ/IZWexUL69jDnfSSaAFEq6Ocq3DyBFghynmMwTCeX
         q/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGZT+H1+uQ5JiUK9Jo+2tkqmnMeGJ8sMDDdQAMEpgT9g/57YK+5002Km46w0tGFa3+i7iGlkOiIsGvfsny@vger.kernel.org
X-Gm-Message-State: AOJu0YzehIxkmsCtriDF3ju/NnAQj0nWq/KH9+xwwAgmzFInw6qf+3fb
	rYWwe/ZVYzgydx8se/YOTDLppecNUfTzvvdvzZJmWruGV+M9gsll+1OW
X-Gm-Gg: AY/fxX7tIC+gsziDjvOQSKmJdzqS6rtrNjXgZzVewVnCm3CwPF0XmAzr70DKvA6hXis
	jF8BOLdRlYJA5FXQRHPQA84PVXiAmdtjS6T2eVcyzD+zDqKmjQbOfQ7ZyUeha5zTLo4zkIYRRL3
	Yqodcjjo7vZLPVtF+TJUE+xqvn/OGZQzosVXMXYqrcaDchNRPblH7fU2fkCJHuCPghnVOX1x0qq
	BtVncjk2LLIyJA2ZRTci8CUmVlJoY7ErHbbL0VrJtv2+kH3Dotx3jGErHxzxR1NvXyC7VFLX3/Y
	sXmtG/74nI5HiGpl6/LcQ2U41wNn6dyU1DxjrNedRTydoPo0VokrlVZVo3JlJho8qLh/LrIkJA+
	pmnVsYqOMwJETfthy7hR5AChehdVgDc8P+Xc6WlHRIC1ODKSqdC8DVhb3FxJlZ7u4AoBWxyKo7L
	PWa3m5/pBBmlya694mniKIBiVhLGBhFR9XaQ==
X-Google-Smtp-Source: AGHT+IGfcdGVJZSkWDo21K1vU9MUUBWQ+IBES3Tajafe9cDt1j1Q79XvwK3ZwVKUzIzLH8b7b08n2g==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2a3ee4aaebamr12781305ad.37.1767765438802;
        Tue, 06 Jan 2026 21:57:18 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7912sm38766625ad.67.2026.01.06.21.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:57:18 -0800 (PST)
Message-ID: <10848ac4-4b2a-4e1e-b6b8-d99cbf54c28c@gmail.com>
Date: Wed, 7 Jan 2026 11:27:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/5] backlight: gpio: add support for multiple GPIOs
 for backlight control
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-4-tessolveupstream@gmail.com>
 <pbbqct3a7ft466aerdkm6k5kmwstfgpbegrakfvdxzj2tdpdyu@pws3zzu4sfiq>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <pbbqct3a7ft466aerdkm6k5kmwstfgpbegrakfvdxzj2tdpdyu@pws3zzu4sfiq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05-01-2026 21:08, Bjorn Andersson wrote:
> On Tue, Dec 30, 2025 at 06:32:25PM +0530, Sudarshan Shetty wrote:
>> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
>> single one. This allows panels that require driving several enable pins
>> to be controlled by the backlight framework.
> 
> Can you please elaborate on the problem described here. Preferrably in
> the form described in
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes,
> i.e. start with your problem description, then a description of your
> solution.
> 
> What does it mean for a backlight device to have multiple enable GPIOs?
> 
> 
> PS. The associated binding patch needs to be merged before the
> DeviceTree (dts) changes can be merged, but it would be more efficient
> to upstream them separately - as each set of reviewers could focus on
> their part and you could update the patches based on the feedback from
> each part.
>

Initially, I had included the gpio-backlight driver and binding changes 
together in the v10 patch series. Later I separated these 
gpio-backlight changes and submitted them as individual patches to the respective maintainers.Here is the link to the updated patch series:
https://lore.kernel.org/all/20260105085120.230862-1-tessolveupstream@gmail.com/T/#t
 
> Regards,
> Bjorn
> 
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
>>  1 file changed, 45 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>> index 728a546904b0..037e1c111e48 100644
>> --- a/drivers/video/backlight/gpio_backlight.c
>> +++ b/drivers/video/backlight/gpio_backlight.c
>> @@ -17,14 +17,18 @@
>>  
>>  struct gpio_backlight {
>>  	struct device *dev;
>> -	struct gpio_desc *gpiod;
>> +	struct gpio_desc **gpiods;
>> +	unsigned int num_gpios;
>>  };
>>  
>>  static int gpio_backlight_update_status(struct backlight_device *bl)
>>  {
>>  	struct gpio_backlight *gbl = bl_get_data(bl);
>> +	unsigned int i;
>> +	int br = backlight_get_brightness(bl);
>>  
>> -	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
>> +	for (i = 0; i < gbl->num_gpios; i++)
>> +		gpiod_set_value_cansleep(gbl->gpiods[i], br);
>>  
>>  	return 0;
>>  }
>> @@ -52,6 +56,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>  	struct backlight_device *bl;
>>  	struct gpio_backlight *gbl;
>>  	int ret, init_brightness, def_value;
>> +	unsigned int i;
>>  
>>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>>  	if (gbl == NULL)
>> @@ -62,10 +67,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>  
>>  	def_value = device_property_read_bool(dev, "default-on");
>>  
>> -	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
>> -	if (IS_ERR(gbl->gpiod))
>> -		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
>> -				     "The gpios parameter is missing or invalid\n");
>> +	gbl->num_gpios = gpiod_count(dev, NULL);
>> +	if (gbl->num_gpios == 0)
>> +		return dev_err_probe(dev, -EINVAL,
>> +			"The gpios parameter is missing or invalid\n");
>> +	gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
>> +				   GFP_KERNEL);
>> +	if (!gbl->gpiods)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < gbl->num_gpios; i++) {
>> +		gbl->gpiods[i] =
>> +			devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
>> +		if (IS_ERR(gbl->gpiods[i]))
>> +			return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
>> +					"Failed to get GPIO at index %u\n", i);
>> +	}
>>  
>>  	memset(&props, 0, sizeof(props));
>>  	props.type = BACKLIGHT_RAW;
>> @@ -78,22 +95,34 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	/* Set the initial power state */
>> -	if (!of_node || !of_node->phandle)
>> +	if (!of_node || !of_node->phandle) {
>>  		/* Not booted with device tree or no phandle link to the node */
>>  		bl->props.power = def_value ? BACKLIGHT_POWER_ON
>> -					    : BACKLIGHT_POWER_OFF;
>> -	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
>> -		bl->props.power = BACKLIGHT_POWER_OFF;
>> -	else
>> -		bl->props.power = BACKLIGHT_POWER_ON;
>> +						    : BACKLIGHT_POWER_OFF;
>> +	} else {
>> +		bool all_high = true;
>> +
>> +		for (i = 0; i < gbl->num_gpios; i++) {
>> +			if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {
>> +				all_high = false;
>> +				break;
>> +			}
>> +		}
>> +
>> +		bl->props.power =
>> +			all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
>> +	}
>>  
>>  	bl->props.brightness = 1;
>>  
>>  	init_brightness = backlight_get_brightness(bl);
>> -	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
>> -	if (ret) {
>> -		dev_err(dev, "failed to set initial brightness\n");
>> -		return ret;
>> +
>> +	for (i = 0; i < gbl->num_gpios; i++) {
>> +		ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret,
>> +					"failed to set gpio %u direction\n",
>> +					i);
>>  	}
>>  
>>  	platform_set_drvdata(pdev, bl);
>> -- 
>> 2.34.1
>>


