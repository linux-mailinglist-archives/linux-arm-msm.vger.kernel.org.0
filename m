Return-Path: <linux-arm-msm+bounces-46770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B5A25BF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B81B1626FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD6C205E25;
	Mon,  3 Feb 2025 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvgVrmch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3D52010F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591962; cv=none; b=rLySEIOb3Z6JTIV02VaVDKlLjbqbtI9AH4UvHq3NM+s/AvTyXkoAvwYHJ/wKJpfGHCe1hkM9ZRUuH9z0JMl7D112ZNnLhPQ9qGdPk+42RW+NsQjMHT+mQENshLldlD762xJWtvGOD1DwZxJoswFOnr8QdyexP5UA+0qHttz+dqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591962; c=relaxed/simple;
	bh=tsZxVi3hWnfSgdTZWSolIwnNneopaRWe39nLdwQMAoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtAf1avRBNIxlhPDWjluu/UtYlhEfpxpMVWaP/h8bKYcgK62zruqP940lUTXqawG6ysB3VotqwI94y3ykOK/FiRFhZSw0Fw0hCtGbSXXtQCv668Rt5tzBXnKuAoDNM9I17209dovIhk/1TnFndef7ZosrUQAIkZOc50zWuJCEVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IvgVrmch; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38be3bfb045so3648089f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591958; x=1739196758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUjPahpJZ490tF5nS7xvrKmwqtWzzB567d1rXxR9fdw=;
        b=IvgVrmch1fV5tP63yh0ZqdFO5wOkKsKd2FurqHJDCZCXuljPMJFqUg+6sBYrQQMOVx
         o9guUFbL1qVl3cckmizrHh1MPwZ0uYN4yh16XU1IhdrkrXwS6ZETQcu8LbkAUcrCyGiM
         y7xKUdvr5jjHMwozoH6w7NKGX+ZQjIuELGM/O80Ce2Zz3WviHOac60MWjyE7yIK+KDyo
         f4oXHJZk6hhgwKQaM6SLtdCo6d6dv20CJXVW4jyswRHebiw/6rHV32uOYWSRipJ07NOm
         qvxitPmU4OkLfhGKmXGDlKScielOeEX6AgfxjkpDHOdxV3PppNMeyhdHv65VcX46eJyi
         VBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591958; x=1739196758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUjPahpJZ490tF5nS7xvrKmwqtWzzB567d1rXxR9fdw=;
        b=Ac1pLqXGAe9uUZq6rtDDqmvuf/+tDv1uJQILjAL/e1jivvbkGVk09WBTYVGnDtYjBl
         JQtNwyrzFWTumKBWUdBg24Mknmm1n/ttSPWy9c7cilNo826jWsSatMspFsZM2gvI2Jfz
         ISPH8nuFLNl7ygj4QE2IRaImBt89u/AbZE7aS4LBXhoEaZQP6ClmucYaA9r/jPs638zI
         b8RYZSHWtp9QLLjd+c2JwNEtIH2KzVp3rVmd9OcmmPajr/puossR79AnzcDCP4ABP48c
         uXLpy2Fp4+1ZuTRnuquYs4AgmMWCd0FGnFs++C1tk/UPP0w459DzX/aFmr+8P+vbrS+M
         Q/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb0I1o/jqf+8WvnzoNILZ8AVzUy3DEGAeETh6zxlsDA7gI4EGti0TF/42uEapqnwAUGM4dVzZmO9UgNzBD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7uL0LjQikq2qT153Q0VM+K4hrSZ+6vbua/nwXqUbYUSVGXakj
	7K1pZgmeqxitWZQY7I/7SrY8d26UVIRwFO+66HLGR0mM5GrO9k893lzmfePTIaI=
X-Gm-Gg: ASbGnctbgfPOGW2UNsb278WI9o4urkqbzF9dKDVJIT/O+68tgTVFWXubZZUIDsk92NW
	DUsEndu/NKMsUfIaSE5Qr10E8vfTN32zM7ftNwD7l32VtogLTAGaLcz43KNiaYPuO3xhVeGapZK
	RBkSatJVPWZ5+1UeEDRc5E3el4kUpsgayFb9yG8Xi0qLRzTY3VfxXR1k02Nf1UCxlBxzXlyZBGV
	BknklZcVE8pbFEoEJKoEeEnIGZdrCY8B2xXyOkPx+4hVpev0UVwcFRnp9JUVMka8rDNP7ziRpTr
	EssEHZ5942LxK3HEngT4ZOC50SMNgx6cvQ==
X-Google-Smtp-Source: AGHT+IFA8mWEpLmmdVcjuR4koqsoB3sj55W01B83hJSvs3SAyixdmRXxMrYb2kLmMpISqzfZlvuUaw==
X-Received: by 2002:a05:6000:2a5:b0:38b:f3f4:5812 with SMTP id ffacd0b85a97d-38c5a9a62damr16085238f8f.21.1738591957643;
        Mon, 03 Feb 2025 06:12:37 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa2fsm13136123f8f.91.2025.02.03.06.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:12:37 -0800 (PST)
Message-ID: <14f167e6-ea2f-401a-87e9-2722929bd9a2@linaro.org>
Date: Mon, 3 Feb 2025 14:12:36 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start
 streaming
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 14:09, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> With the existing code, we are only setting up one period at a time, in a
>> ping-pong buffer style. This tiggers lot of underruns in the dsp
>> leading to jitter noise during audio playback.
>>
>> Fix this by scheduling all the periods, this will ensure that the dsp
>> has enough buffer feed and ultimatley fixing the underruns and audio
>> distortion.
>>
>> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index c9404b5934c7..148c3fb77168 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
>>   {
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>>   	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> -	int ret = 0;
>> +	int ret = 0, i;
>>   
>>   	switch (cmd) {
>>   	case SNDRV_PCM_TRIGGER_START:
>>   	case SNDRV_PCM_TRIGGER_RESUME:
>>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>   		 /* start writing buffers for playback only as we already queued capture buffers */
>> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> -			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +			for (i = 0; i < runtime->periods; i++)
>> +				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
> 
> So, all errors except the last one are ignored now?

this needs fixing,

thanks for review
--srini
> 
>> +		}
>>   		break;
>>   	case SNDRV_PCM_TRIGGER_STOP:
>>   		/* TODO support be handled via SoftPause Module */
>> -- 
>> 2.39.5
>>
> 

