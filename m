Return-Path: <linux-arm-msm+bounces-40507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162BA9E55AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD437164815
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536F4218851;
	Thu,  5 Dec 2024 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aABsUvef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EDE218821
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402440; cv=none; b=VooUUuES7dbAvB3I2mzUiIZ0F7NiypOJhD/4r0WrZqrk104jtnG1D3iOXhWAhOG6ftnfBX9DL8jlUSK0I8MtrdwWCF5e/oheD5rmfXbsLL7ZLPmWJFuDyR9Y5VEzOLZ9FEdWTH2TGeB09INOQhGLlW0/yTsUU5sUsjPD5i89Avs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402440; c=relaxed/simple;
	bh=/eOgEfxOouU7/NsexcFArdA9e/HQU31dCSo6rXafGRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCz4brKWSIgGdWE0Kt9kWcPfFGT6jW2yiD8zEd7jE9ES/ZNMkhJSkfcJfu7Z5gjXtJAuMQgOhVPghq952hTD/Ytbld/Uz9ijb8JVJmEXkSALLja83V/5Illnq0U+lUlC3xLb4HZztaEX3GeTkXJsBBOqdHemolyq6z298irEHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aABsUvef; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a0300d4cso1104115e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733402437; x=1734007237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AHOhf3fLL/x/+hQTBcTCJ5bZoM08MJO5O0xcjIvEorE=;
        b=aABsUvefCMy/AKasS5GqeSY1YvaR4ydhkVLWxHTmxuHG8uIUWs8Su3wFWv5txHAmTM
         O+r6vAfURwoSb7RHLWaqItOSy48ODcr7DJDQHf6cEWs7MJQeFDxVwcw+AU3GPhATXOF3
         odXQxzvPLsm/1p5iBoyG1DiqXIptk5Dcb9HdOkBQ3G1p1bvzUsPBkZIlbTbXKNsHtJOW
         Eu9beKA8LAieYmdVqb15h5YDYFa1xTKy2K9fZlBRHO46rFe2y3Rht2RjiEm+26CwbtbH
         JvBlvmfSlE7+e80vKolBDwZh4p7q981iQTC1c/roSdgsJJBsD2ZogcYjWAhwm663dX8U
         ySRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733402437; x=1734007237;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHOhf3fLL/x/+hQTBcTCJ5bZoM08MJO5O0xcjIvEorE=;
        b=BqVatT15bVIxl4Zs++C2js2uotDivB52JHVGvGfEBe2vOiNKG8R5BHfcWDABfXwD0D
         sGaFVLNrW30YteAPrK2DZG7DWLkEgdA5spFjycKsx2iKKWSs85OEeVif6Axcmza59C6m
         7L/JJ7yFZhh2oBhxuXuyDYf5a6+3NQ8EE0W2rKsjXM9oDz8CuJRplzxNl0znUZR4UoiQ
         ljjIVImUq2rJugZWdz9n6n7YcjE1hIj8yg3jgFGj8+iPU+J/ODHsb1CbYwZpsRUUJUm0
         a5tl5t7hy8FNEXCl1ISFFmcdBjg3e2zrxURVFHIyVIITRDKC7HkQzKmOIqtIxtdjti+j
         tYUg==
X-Forwarded-Encrypted: i=1; AJvYcCWA8OTvwHXbZ5YdFMMQ//hx96p4OymJJwPga70uV4eow9HeJahLaAkZg+e1JrdyhdyeSrimf/3Mb2+/vYaD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Nlh0kc1UJRsYlKR3vVnFMbtKJMQyXeLmGof/pBrh2K5qOeYp
	fpwZBkseml/5IgcHM2XRrrRbDOS7Ek2LSA02Z5+gkwhFkZtLWNYeqgqlFSGrsf4=
X-Gm-Gg: ASbGncvWVcDjpt7ThGlsmhzgxKVUiKliRDIne6uk8xDSzzOm3jIgw9fqB7y79SFjhaw
	62Gfnu3RqbnyZbL0ha7LOy706vA1MnUnQLme/fle0VdPIsw7BQp6b+jqFz3vVyAb9WyRg19YiG0
	QVfWCrEMH5JDQgbpxCXj2KfVcYyKDrpkcCI6Tet3B13HNm/6WOcyvkJ8UBDYAbn8yMhSgDRBqBr
	Hg3iHeBCewaVEeZJmmvN/4Jhi93JlaWCcpKhj9OTEg/XCSwd0jpZR7slYxZmS+GKHyA4A==
X-Google-Smtp-Source: AGHT+IHIwSY6gV3NERJ/H6TR3OuZZd7LtFCV9IfPTUtZJbD8qsdt3fcL8obWJJGvX184KgtY2y+W1w==
X-Received: by 2002:a05:6000:1541:b0:382:4e71:1a0f with SMTP id ffacd0b85a97d-385fde04982mr3122263f8f.7.1733402436777;
        Thu, 05 Dec 2024 04:40:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219096cdsm1878466f8f.81.2024.12.05.04.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 04:40:36 -0800 (PST)
Message-ID: <9d6b4865-1bf5-45d8-876f-5ec336700e10@linaro.org>
Date: Thu, 5 Dec 2024 13:40:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
 <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2024 13:33, Mark Brown wrote:
> On Thu, Dec 05, 2024 at 09:40:20AM +0100, Krzysztof Kozlowski wrote:
>> Number of DAIs in the codec is not really a binding, because it could
>> grow, e.g. when we implement missing features.  Add the define to the
>> driver, which will replace the one in the binding header.
> 
> This breaks an allmodconfig build:
> 
> /build/stage/linux/sound/soc/codecs/wcd9335.c:162: error: "NUM_CODEC_DAIS" redef
> ined [-Werror]
>   162 | #define NUM_CODEC_DAIS          (AIF4_PB + 1)
>       | 
> In file included from /build/stage/linux/sound/soc/codecs/wcd9335.c:28:
> /build/stage/linux/include/dt-bindings/sound/qcom,wcd9335.h:13: note: this is th
> e location of the previous definition
>    13 | #define NUM_CODEC_DAIS          7
>       | 

Apologies, last minute change hoping 6+1 equals 7, but obviously it does
not.

Best regards,
Krzysztof

