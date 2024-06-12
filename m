Return-Path: <linux-arm-msm+bounces-22447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47D90554F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 085DA1F23D00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C63617DE39;
	Wed, 12 Jun 2024 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="olJM5ahl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76B17E456
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203081; cv=none; b=TBBGFOW1/Tuo6edGOpK8jjDk5turJnVrUWnEaXItDO4yLXkt3RrVsWAIEbCUl4kY1oi/pgWpcAn+Jx1t4EyGxawnItqsB/8D2FME8N+/a8JZV4AVMHq+yRJon0B+wxinDx2SPun2FJ/ecXMEIL19YNVTiH1dKKrSJoIfEYbNjlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203081; c=relaxed/simple;
	bh=CTYOhhQlTsoO4oIyaYO/EgA0AeZ/eZ/nx2RqqUkiaGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fijtL8Yza50BQN9GjNjlfvR7/mnBZaF6bmgnSDYRQmOpFb4NKLTi1hiYuoxP0EqEDpqRm6QvrShNHEOFrM00kCMniBDtN7iFICbKLXLIYoFFXh0GDZ9LCYHLUf7iuCjSRfEq3T33OK+A1yVYIthYIjq5b7sT+C9CFeHtIXmihAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=olJM5ahl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c68c3f8adso3044916a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718203078; x=1718807878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fjaZfrJZ3QIeFP/iVn+xJccYn+xXruLly+6B31t6tg=;
        b=olJM5ahlzzR1wF810pHdppeEQ5Di8CoM5gBKr34HFMlDgVxL7uWY66ZI789h/qcSof
         GNfgwgBMz1eL7M4xK/FSRRHCfsbIIexPz9yXfHFOxQwrjwktpH0BbpPR4gs5yK0Hyn16
         FhhfJtQjpCrfqmfGnlUGpP5tdSNmuUSYWVAAUEg7lNe3+7QYxvJcm90j5X2n1A2WTMpc
         aMuRxJ+6KOhdlYQGCAJ11S+uzmz2tjiUW6OkOWnjSztPTdQc3ta2lcU2wXTygaUCwgbg
         AIhaPFHwvQdQUMHR8ABhJ2Aurm3WcXi1611yANurk1zNONeUGcyykeQ5ecVqJQScUSFK
         nxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203078; x=1718807878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fjaZfrJZ3QIeFP/iVn+xJccYn+xXruLly+6B31t6tg=;
        b=RvrPFF54YDYlu85VrAoKlla/AtxGjdigu1FmB1WHu1NI/xU/5tgZ5c0xLFKa6usw6d
         q1IeB/uoaxyILAMmWz/6/pMECBRIgyhEJh7bIhvkuZ7zpQqY+DYsPCE94RQeQjnQRQvM
         DYL81kvfBkAPffjnSHy80qUxiKau2ouTV0/13dmf3yJNyhge+VyVrWMoKz+sp+9hYmFH
         p0kQydPFNsP/lZt+UCzFqqbFvh70RvRq41IqGcTeljyanWolLx5ivoZ3nWr6vz1hyKZv
         xRHBSQ3W/AcYV/ZQdgzEkDS/3/ahRG1gCuKDVBgyeENDon/HxiYdXdMsToGfcbLpsQAQ
         wHNw==
X-Forwarded-Encrypted: i=1; AJvYcCXz/0GPv6/AJejJgIN+zCzxFy+BfnC5C0G9oKcG1+cxOu/gONZNF5nfEuPWQ1JBegHiwm2zK6Ji0rZYwExj7Yxrk7ZDZp/E25fxvx3f/A==
X-Gm-Message-State: AOJu0YyYeC05Xtj/yDE/9t6S0fWwhryHUi9cxqh4pKmgQuRTgUg/B/my
	Qhgf43xUbBw4Et3mk2OBRFPSMGo/pU5M0t+bZTx4VTus5/dp6xN1wqYIkwur9c8=
X-Google-Smtp-Source: AGHT+IFaoHUQSMxx6j+MTMcufV4ec8ectABjdUjrL9TYkcI9tXI2C/BHxmQlOwnr29Szys5kmNlntw==
X-Received: by 2002:a17:906:c9c7:b0:a6e:139b:996d with SMTP id a640c23a62f3a-a6f47f5a03emr169143166b.32.1718203077766;
        Wed, 12 Jun 2024 07:37:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f34591542sm248835366b.55.2024.06.12.07.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 07:37:57 -0700 (PDT)
Message-ID: <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>
Date: Wed, 12 Jun 2024 15:37:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.5
 codec version
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org,
 neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-3-srinivas.kandagatla@linaro.org>
 <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/06/2024 12:03, Dmitry Baryshkov wrote:
> On Thu, Jun 06, 2024 at 01:25:59PM +0100, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> LPASS Codec v2.5 has significant changes in the rx register offsets.
>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>> after SM8450 have only Left working.
>>
>> This patch adjusts the registers to accomdate 2.5 changes. With this
>> fixed now L and R are functional on Headset playback.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
>>   1 file changed, 410 insertions(+), 155 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index f35187d69cac..bb8ede0e7076 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>>   
>>   static int rx_macro_probe(struct platform_device *pdev)
>>   {
>> +	struct reg_default *reg_defaults;
>>   	struct device *dev = &pdev->dev;
>>   	kernel_ulong_t flags;
>>   	struct rx_macro *rx;
>>   	void __iomem *base;
>> -	int ret;
>> +	int ret, def_count;
>>   
>>   	flags = (kernel_ulong_t)device_get_match_data(dev);
>>   
>> @@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   		goto err;
>>   	}
>>   
>> +	rx->codec_version = lpass_macro_get_codec_version();
> 
> What guarantees that VA macro has been probed already? If I'm not
> mistaken, we might easily get a default '0' here instead of a correct
> version.

fsgen(Frame sync gen) clk is derived from VA macro, so if we are here 
that means the va macro is probed.

> 
>> +	switch (rx->codec_version) {
>> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
>> +		rx->rxn_reg_offset = 0xc0;
>> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
>> +		if (!reg_defaults)
>> +			return -ENOMEM;
>> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>> +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
>> +		break;
>> +	default:
>> +		rx->rxn_reg_offset = 0x80;
>> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
>> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
>> +		if (!reg_defaults)
>> +			return -ENOMEM;
>> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>> +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
>> +		break;
>> +	}
>> +
>> +	rx_regmap_config.reg_defaults = reg_defaults,
>> +	rx_regmap_config.num_reg_defaults = def_count;
>> +
>>   	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
>>   	if (IS_ERR(rx->regmap)) {
>>   		ret = PTR_ERR(rx->regmap);
>> @@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_clkout;
>>   
>> +	kfree(reg_defaults);
>>   	return 0;
>>   
>>   err_clkout:
>> @@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   err_dcodec:
>>   	clk_disable_unprepare(rx->macro);
>>   err:
>> +	kfree(reg_defaults);
>>   	lpass_macro_pds_exit(rx->pds);
>>   
>>   	return ret;
>> -- 
>> 2.21.0
>>
> 

