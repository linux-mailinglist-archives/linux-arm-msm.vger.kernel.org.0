Return-Path: <linux-arm-msm+bounces-2542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6BF7FDD27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 17:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 082A428217B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 16:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D0B39862;
	Wed, 29 Nov 2023 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SYriIKZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBAE10E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 08:35:32 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso9027283a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701275731; x=1701880531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sJSkB0+QhES0yP3XIpOHbXG77b+2UuGTzv8ffaq/mdw=;
        b=SYriIKZO/ShQZl70TFGXuut46JihAGc03MuxcCqF9QeXhSy4EFDYyeu3fm+6fkdrfF
         5VAcnejNee94x0IFbrbAON6TG5nx0mHtlycQwMIQSehjlaClz16WFDJEhZwm/fSXnWqt
         Rn2nHbJ/c+Uns7VSHI0WqhJJkl0ZHsLg41foM/rPJ+6et0xRh++1euKyrKkFQFQu4z7T
         CcKkNAcN5c+BLWTnS3i4491Tz8ssXHNwn2fg1FKhwToaEX69B4vU5zA0qj0YBJ5ITipZ
         Ze6S47cMBI5FrNRj6yi8B5HtQniQEKdCG0OiMpZixZOOmR+DsZlwOKcagDkl7mNblD9f
         +i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701275731; x=1701880531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJSkB0+QhES0yP3XIpOHbXG77b+2UuGTzv8ffaq/mdw=;
        b=iYlpMbz93rlixyCTjz3KNfbXhAlrSS0tVHtnP5FSAIPSESHirnA2Q0Tp7Px5kWiEms
         JcVqAHi7g6o2XW7+FtF5HXsV3kEbEGmM1ijbkkthlrxYDMbNpM1omcrptRw2EbHBK+x9
         5KoMep1S9jgmEV1fiH0l2JQhfPCl2gsJ6TAJmMYOTsQpI1ljuScjuurci/6SiMFROMKY
         UTvSEyvlKdD8Csh7M8ek6uB9f11wxVk2QEhMKocj7RszC3c8efF117nX3k00czgS+aOF
         62DGowNSb0/0paC34mzvu7UPEBpd7zwTQOQS4oPQzDlm4lvHj+xvw7r5d8/NQTKXJN2+
         nOYg==
X-Gm-Message-State: AOJu0YyEh4PKJYX0/XFuYJknLTUOmWb5Cbscpw2s+xdIu25nswTcZCzY
	UKK5BHBqvVmDOSGaYlBxCoZKBA==
X-Google-Smtp-Source: AGHT+IESJuKW4j0TlcxTvXKBVR7YoDo5gHjxsjZScBzekKntGl4G1YiTP3Q/a76Lde8x3Mu+euuR1g==
X-Received: by 2002:a50:fa8c:0:b0:54a:ff96:2cb7 with SMTP id w12-20020a50fa8c000000b0054aff962cb7mr11928639edr.41.1701275731232;
        Wed, 29 Nov 2023 08:35:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id b9-20020a056402350900b0054b7e312b97sm2919928edd.38.2023.11.29.08.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 08:35:30 -0800 (PST)
Message-ID: <5ffed1e6-ac60-42e1-8322-4f5e419ef86d@linaro.org>
Date: Wed, 29 Nov 2023 17:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: Add helper for allocating Soundwire
 stream runtime
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
 <ce46c729-48de-4b71-ace3-9b88f95e8e28@linux.intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ce46c729-48de-4b71-ace3-9b88f95e8e28@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2023 18:39, Pierre-Louis Bossart wrote:
> 
>> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct sdw_stream_runtime *sruntime;
>> +	struct snd_soc_dai *codec_dai;
>> +	int ret, i;
>> +
>> +	sruntime = sdw_alloc_stream(cpu_dai->name);
>> +	if (!sruntime)
>> +		return -ENOMEM;
>> +
>> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
>> +		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
>> +					     substream->stream);
>> +		if (ret < 0 && ret != -ENOTSUPP) {
> 
> I know this is existing code moved into a helper, but out of curiosity
> why is -ENOTSUPP ignored? Isn't this problematic?

This is for all DAI links, so if some don't have set_stream callback, we
assume it is not needed. For example few codecs do not need it because
they are not on Soundwire bus at all and they don't care about the stream.

> 
>> +			dev_err(rtd->dev, "Failed to set sdw stream on %s\n",
>> +				codec_dai->name);
>> +			goto err_set_stream;
>> +		}
>> +	}
> 
> Also should the CPU DAIs also be used to set the stream information?
> it's not clear to me why only the CODEC DAIs are used.

I don't know, we never did. As you pointed out, I am just moving things
around, so I don't really know the original intention.


Best regards,
Krzysztof


