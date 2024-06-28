Return-Path: <linux-arm-msm+bounces-24597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A1691BA37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968EA1C214F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D5B14A609;
	Fri, 28 Jun 2024 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VS+1YXtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCA013E037
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563953; cv=none; b=d247R5r9FnYqlo5ebWYA4z2Ufau1ghFB/hAuV/LIh90oh4/b26l0kN6Of1TLoGP4C0KF6gcVeXC+krjNXRhfK0mnGaiXCLjgsQaRvw1K/GsGqr8hvm57cNqT4JZ2Wij9vEh4QDKrreXM6fmr0Gsh4+U8za0QWn0aptxDy5aooPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563953; c=relaxed/simple;
	bh=EGFnHbSq906N7oKz8YVogJ5qSEDCTeL+B05y5ftPt7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObUQFAvuEirF1equp+6Rfj6DHZLvZ97xr1BYqfnZ49FwUtIG24YrP39xIrGlopwydP8y2juE5Rfi7py8oSkfr9eG6xpcTCn3Duf/7Ng9u1rMXgMoZjMfkk8VkJnfCyCrZxtbL90ROsHnhyYfwZs/ph3yYRD/MIswWUYCLGyX7Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VS+1YXtR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-365663f51adso241490f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563950; x=1720168750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=faqJLGcrHT2qoREGOCBGB7RrfwX4OicRX63fHXTW6pE=;
        b=VS+1YXtRPoAHKEMSbYG7llYNL89EWoEYgBD45a+Npwv1X0UlTe8VZOkLplAXFxL9Ot
         mqgDdujVQc6WD5hUD2yeTNoqqYM1UqZq+ICiYOJnobzAMIxL8aHI5q5xzRu12nrzy5c5
         6/pWoV+x7bWbcDvf6glHD5Jd3M4c87J8WN/bI+D1Vo9kgNDVLwCAyGhmSsySANrFB/Lu
         BQb3GOpUco8taJ/pj9aKPJR6/9s2jXe6SSkeabXwlbBZ/N77dn5PuI0FVYhP10xBBkem
         oWak1Ei1O8+R1GZC1Csv/F5h9318T4Jza0DzNVqlQbWjWRFOIQSA09SNl9otRV46Xzf2
         77mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563950; x=1720168750;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faqJLGcrHT2qoREGOCBGB7RrfwX4OicRX63fHXTW6pE=;
        b=jmsYinxFjdDq47LJHBExGg8oMG4QOX0Wx382/NyZ/y8wsyFxHv3gueWRbRUIM8uJXV
         nSO7R5cGGFm9NbLG9Fy56DYoh3Gz/yNa/cZyqDlrPrpaSe1UO7kNbQII3egRbNOto4r6
         Z6foeEZGYIvaix3khOxmXqaMhmWNEi8TOEthzkVEeCvIFAXjuy6Q+7P8uX5oPCrx4U2t
         9eA9PFClyY/TAslvE+6PhNJIATf4ZJn8VgBuENYyUqdm2kV4jR011x6dzNoctfG9oFXh
         VFZko4B8vALs8DN0LW9vbAjFnPt6JW0s4hIrsBZ1DVkrrCMALIgSvqrAeyJRgwOClgKm
         qNsA==
X-Forwarded-Encrypted: i=1; AJvYcCUrwSlTyY1pFdaffWhgmEP7Uti+EkCiKP8ZQS6j2BeuM+QLlp4FlGwlELbk02A5wVgmDW7Gw/bE9FnZVzZphfwCkd4NBxLB90Qfz+/BHg==
X-Gm-Message-State: AOJu0YwV4qVPgKqUZqDq7Wugo+iR68W2eEzYN+YvrBurU3H33pfjJFHL
	Jj+Ok5KzDe/8Wu2LZe5UINP2APe08D9brG6+kwrob5sa30B2xaa+aUxsGyrfe0g=
X-Google-Smtp-Source: AGHT+IELQxuYpftb3+KWM7ekBkKk8cPpFjpXUPU8A6q1t+Fd7TYbD9yzJlZyXvV8OhGPzdBLyOQoJA==
X-Received: by 2002:a5d:59a5:0:b0:366:e685:d0cb with SMTP id ffacd0b85a97d-366e685d27dmr13937863f8f.6.1719563950170;
        Fri, 28 Jun 2024 01:39:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e1481sm1547640f8f.55.2024.06.28.01.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 01:39:09 -0700 (PDT)
Message-ID: <1fa1da22-07a5-4d76-b4c7-fc16e3df4b32@linaro.org>
Date: Fri, 28 Jun 2024 10:39:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
 <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/2024 10:34, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 05:23:44PM GMT, Krzysztof Kozlowski wrote:
>> The driver has static 'struct regmap_config', which is then customized
>> depending on device version.  This works fine, because there should not
>> be two devices in a system simultaneously and even less likely that such
>> two devices would have different versions, thus different regmap config.
>> However code is cleaner and more obvious when static data in the driver
>> is also const - it serves as a template.
>>
>> Mark the 'struct regmap_config' as const and duplicate it in the probe()
>> with devm_kmemdup to allow customizing per detected device variant.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index 59fe76b13cdb..3d8149665439 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
>>  	return rx_is_rw_register(dev, reg);
>>  }
>>  
>> -static struct regmap_config rx_regmap_config = {
>> +static const struct regmap_config rx_regmap_config = {
>>  	.name = "rx_macro",
>>  	.reg_bits = 16,
>>  	.val_bits = 32, /* 8 but with 32 bit read/write */
>> @@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
>>  static int rx_macro_probe(struct platform_device *pdev)
>>  {
>>  	struct reg_default *reg_defaults;
>> +	struct regmap_config *reg_config;
>>  	struct device *dev = &pdev->dev;
>>  	kernel_ulong_t flags;
>>  	struct rx_macro *rx;
>> @@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
>>  		goto err;
>>  	}
>>  
>> -	rx_regmap_config.reg_defaults = reg_defaults;
>> -	rx_regmap_config.num_reg_defaults = def_count;
>> +	reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
>> +				  GFP_KERNEL);
>> +	if (!reg_config) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>>  
>> -	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
>> +	reg_config->reg_defaults = reg_defaults;
>> +	reg_config->num_reg_defaults = def_count;
>> +
>> +	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
>>  	if (IS_ERR(rx->regmap)) {
>>  		ret = PTR_ERR(rx->regmap);
>>  		goto err;
>>  	}
>> +	devm_kfree(dev, reg_config);
>>  	devm_kfree(dev, reg_defaults);
> 
> Seeing devm_kfree in the non-error path makes me feel strange. Maybe
> it's one of the rare occasions when I can say that __free is suitable
> here.

These would have a bit different meaning in such case. The __free would
not clean it in this spot, but on exit from the scope. I wanted to
kfree() here, because the config (and reg_defaults) are not used by past
regmap_init. I mentioned it briefly in previous patch msg.

To me this code is readable and obvious - past this point nothing uses
that allocation. However maybe instead of devm(), the code would be
easier to read if non-devm-malloc + __free()?

Best regards,
Krzysztof


