Return-Path: <linux-arm-msm+bounces-24125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F634916DC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D434A28480B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840F9171E75;
	Tue, 25 Jun 2024 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZneuiuVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B8916F91B
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719331667; cv=none; b=QTBwQcJw5n9PO2K47wVdeAsEvmoEqmntKnMDcseXJeYT38pTBVpvbgZkjwm3v2drVO0ONAWlchScGZuVTTV9yhybfym0GtWXg5KBlR+bhYkFq7s26u6xW9RsrJmgZlUspn5j3WX2DWunCEq0XT8qXGc/XoETK1jNOPuu8KP183s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719331667; c=relaxed/simple;
	bh=1qbtk3OuDsg5JykbAutMiYplR43VIqHxiBteHho3YMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dx817+QlSa+fryw7esXtfx2TGgvyxYhtDKJTYnFyDxkRMuwrhup0Xk672Mis2AU6gNolbdaLTL6S3fO6eYj3MwY98GKnz4Q1YTVjy33W67qjDaoAjBcMkdnaQ6Z3mege2TWJuWJUmc60M2lfPo/77u6GEvbBUpXBFu4XWn+dhAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZneuiuVh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso40244135e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719331663; x=1719936463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSwASthEsdX2DteIZwJkoH24oLk9aUfOcBU7wEUFdws=;
        b=ZneuiuVhKGDwXXgwxXWWQQgY4qjniYEkHeYo/aKmlN70D5gwP9PJZlPs+ZUTZjURzZ
         ba5dmdbleR+fcksMUCAuuvg8808cXupJVi/SeFWO9DJIaSuLg1B4CPn+QI7oabKnEx/J
         5PCYjGshsWrL4ZkPjN+IMJYjbUgyktiVtItB11uqpc9qUq/z9yaY2tdkLsawuB5/SCi9
         t7F1PV/75p3KuxitVHXqpmdp22t3TpYH/fGljo/zmjeaaRfhsj0FYoqfOIl1xRTgsB7k
         JGe7cL/J+4cEFdb96D9em1bixo9DWz8YL7MEO1P3wgZH2B0lxLekvOR5evFpuaEHOb+T
         v/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719331663; x=1719936463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSwASthEsdX2DteIZwJkoH24oLk9aUfOcBU7wEUFdws=;
        b=Dv6ysfVcURM9Lz2deXxt4AH6jPYY3oS39jrh6J0GdpBbWLUvFkz8Mu8XWb+Gbw6vtp
         1b3B+paYYur2JtHykumHsBYzW2Kv4aNxbt15kr+oJJd5Nbbx2h/1jCq1Ge7X3VVKCIU+
         nZnKAy+jQ0TSLcSmbFQNmyF+1p+bXs3axZjbHchjYY4zp+3Vv7sxWTT4pquGAiYUQ+TV
         KLip4ppkg3hctNS3jnXZjjAGI7eOPBoIqoZRuF4wkWkafyA1zklOfJyxT2eBcThsC45D
         Lzy5df8Sk6fK6tfSIf+CDytrhfIXsbars6Hw47f9VRt7phQVCMQr+oU5FDL68nsPCDNt
         Z2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFPiK1sXrhPplMn7Q0mJfVkgsGUfLDIRvgycdVWi3G6NSO0KbCk2tmNpHCINuVEhcLZdVbFwR6/43a/mDE4K4zD2cESg8QDekpWTtM9g==
X-Gm-Message-State: AOJu0YykRco5w0ub+3yOcy6c1aGKkL943tydCHND0f/6wRNi7jCEvoI3
	zMNBnxssdrvsVt2u8wrTeEjkyZI6zztzgYZQ7xVNq0Z9XZR97ZVCVIpXFv5PQdM=
X-Google-Smtp-Source: AGHT+IED6hiE5o69v1WtTL3k7eeJk/2D8bpFnp51OGCzoqszKUCYkFDiXdUwLJ7ZvcRqmEegoDc1WQ==
X-Received: by 2002:a05:600c:4618:b0:424:a401:f012 with SMTP id 5b1f17b1804b1-424a401f0d8mr16656025e9.3.1719331663402;
        Tue, 25 Jun 2024 09:07:43 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-424819224fasm182691185e9.46.2024.06.25.09.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 09:07:42 -0700 (PDT)
Message-ID: <a2b8296f-66d0-4b9a-ab3f-895f9ef647a4@linaro.org>
Date: Tue, 25 Jun 2024 17:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of
 v2.1 codec
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2024 17:06, Krzysztof Kozlowski wrote:
> We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
> so handle it as well in all switch cases.
> 
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/codecs/lpass-rx-macro.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 00ecc470ba8b..1c3429f004ed 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -1601,6 +1601,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>   	case LPASS_CODEC_VERSION_1_1:
>   	case LPASS_CODEC_VERSION_1_2:
>   	case LPASS_CODEC_VERSION_2_0:
> +	case LPASS_CODEC_VERSION_2_1:
>   		return rx_pre_2_5_is_rw_register(dev, reg);
>   	case LPASS_CODEC_VERSION_2_5:
>   	case LPASS_CODEC_VERSION_2_6:
> @@ -3639,6 +3640,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>   	case LPASS_CODEC_VERSION_1_1:
>   	case LPASS_CODEC_VERSION_1_2:
>   	case LPASS_CODEC_VERSION_2_0:
> +	case LPASS_CODEC_VERSION_2_1:
>   		controls = rx_macro_def_snd_controls;
>   		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
>   		widgets = rx_macro_def_dapm_widgets;
> @@ -3812,6 +3814,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>   	case LPASS_CODEC_VERSION_1_1:
>   	case LPASS_CODEC_VERSION_1_2:
>   	case LPASS_CODEC_VERSION_2_0:
> +	case LPASS_CODEC_VERSION_2_1:
>   		rx->rxn_reg_stride = 0x80;
>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
>   		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);

