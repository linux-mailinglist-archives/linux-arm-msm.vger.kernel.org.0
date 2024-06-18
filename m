Return-Path: <linux-arm-msm+bounces-22962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D33990C38B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 08:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176CB2824F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 06:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBD144375;
	Tue, 18 Jun 2024 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e02IIPvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844C3A1DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692108; cv=none; b=fmA5mwqtTG/7OX+5M1pGpjmLvsNPeq6Va3qmaudIE47TZip6bespR38D72dRHM5iZq3DFwVDuEkmcTGoSkoPLQtqSeJKtVREP/qfnFN4RgwYT/Vu3c8H5/9WrG1cTOCrTcV2q+ckF52HIfi9YjkpXT+Z3TlHfZgYPw1KoX2ghGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692108; c=relaxed/simple;
	bh=xKaJ6dKNtWZaK9H4e8mU6mP2R0VF0IsBskc+vUNlBKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0JBownDgJSOlXW8HQoFdRw2cNV8MwvcVCYriDQZkSALHRQG1tWK1dYOU90IAonbnxBZ3bnKdqdGDltLbMyc+Sayn69b7MP2W4yh3KNSnZv5ouoTmFQp/9A+mUvUQw0fd4afeymPpgi+W+iirCVAzY70ocfUcj43E3osKvOkaFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e02IIPvE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4217136a74dso43368335e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 23:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718692105; x=1719296905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4c3+weL12K+KVxFEFQDkRTc7QlOq6MrqK1Le6NMexDo=;
        b=e02IIPvEs0Ze0jU8ZlK3oH1/2Yq6mtLFg5rs0GRhnQIUODchL98Dh6WWRDANU2zEut
         cfcMN7HjaItVPsR62rdz6GVflQ4LQ/hwvQohqVi1uNwWCM85Py7hyYST/K3LvWdhU+yj
         ObxDXOJYTB8tKwJKbLi4C0EF4MU//YKoqOxnZzc7QnyRA+pFR6wVAU7ErlZ6Rm20SNik
         nl+zs/By/l8IzPQ9Mkr98s4iBX1mqWmXqdAntgxhJvBcVZvuwkHF1coqqBpqmDIbAjQ6
         wkZgJSm9X8QdvK1n/fPXLVQaUUh3peWUR8/K9rntUHLTwsq9SQAc78CE7dzjybynmvqg
         4LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718692105; x=1719296905;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c3+weL12K+KVxFEFQDkRTc7QlOq6MrqK1Le6NMexDo=;
        b=tKB4dtPQpZZEnSEI6mRTzxSBMWhZxxgXYy1He+Dd/Y2At+2N8e8OIf+G8RFjjqb7K6
         REwoQNxJdj13bq+RR+qMjMu4L0vSZCHJOzdoBcBVOHnVJYL78EubvpHNSuvpbONUPzQE
         A1jWCbdAqIxVXYqOQWwdo5ILhYQmrgPVcQ14KrdLcGmEBm0jTX+/V/4U4WinwvL1DMj8
         nwv2XqrQlfoBXyMGCAjJbhpCKremIac/C7+kw1kTV2MbLHWy6xXUztonxvzS/8MByk84
         Tb5NplEg4BqwALq9mlARTkIGLFxQFPDYowIP/hXmlt5MaR36wnYPmS7LEkgMkkcYb4ao
         Ky3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWokFBSq06sXcTDeIVF7bomxYdJqLXQv0ejin91Flf2CkwW/2pTUFe5CM5/VEeJsBVPdw9eafDIQ1qj1F4oGMKkt8V4ajhrLKuEWMVFvQ==
X-Gm-Message-State: AOJu0YyADn6ESosqrj4lGb23kCOmwCjx39OoPYQEl7QbT8nDej6uhcaB
	PpKaHG690ZbG0/NPkhLciVyXKWdIRyZBqgOimobV9TVGamfRmRw9gNbPB3nMvIY=
X-Google-Smtp-Source: AGHT+IH3AuWbwGf+VeVP+mPpME7M931DgDcUY0XUjN04LZnV8GrFtGWyhjMHdwjzYfcVdFyVBpy+XQ==
X-Received: by 2002:a05:600c:1f8d:b0:421:7f4d:5240 with SMTP id 5b1f17b1804b1-42304831c0emr84154825e9.24.1718692105131;
        Mon, 17 Jun 2024 23:28:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9263sm215207365e9.15.2024.06.17.23.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 23:28:24 -0700 (PDT)
Message-ID: <4c517744-87eb-49c0-a2b6-5cb4c7133829@linaro.org>
Date: Tue, 18 Jun 2024 08:28:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: Few constifications (mostly arguments)
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org
References: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
 <c170d555-068a-4927-b997-df74cc88386f@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c170d555-068a-4927-b997-df74cc88386f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 17:11, Mark Brown wrote:
> On Mon, Jun 17, 2024 at 03:03:18PM +0200, Krzysztof Kozlowski wrote:
>> Make few pointers in ASoC functions as pointers to const, so the code is
>> clearer to read, a bit safer and allows further constifications (e.g.
>> placing some data as rodata).
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (6):
>>       ASoC: Constify of_phandle_args in snd_soc_dai_driver
>>       ASoC: Constify of_phandle_args in snd_soc_dai_link_component
>>       ASoC: Constify passed data to core function
>>       ASoC: Constify DAI passed to get_channel_map
>>       ASoC: Constify return of snd_soc_dai_get_pcm_stream()
>>       ALSA: Cleanup trailing white-spaces
> 
> Why is this random ALSA patch which seems off topic for the rest of the
> series mixed in here?

While checking all possible references around ASoC PCM, I apparently
ended up there and spotted things to improve. No dependencies, I should
sent it separately.

Best regards,
Krzysztof


