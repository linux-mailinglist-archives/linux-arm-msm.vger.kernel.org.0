Return-Path: <linux-arm-msm+bounces-71787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20AB41AFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686005E41C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B1D2E62A6;
	Wed,  3 Sep 2025 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqrXNDbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF928727F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893840; cv=none; b=XDAT/ZURk9pKV5zdps6hg2NdQj34Z0kc3Vn3ldaWHcVtk/M3A6+I9+NDtw+DbjGcqu1KsVqAAFLNuCORU/OvP7l89hNxDtvcrFK3/S9QLLdpg6JIqVzsY9bCb/2dthZ9H1ZpSNP1wpIxMEbVnjtleTkXw36aOabYeTCZnxzw19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893840; c=relaxed/simple;
	bh=zWxl9Sr6da0F+FgQYgftZKubZiEg6j5Exk0NZN4j1b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q5oF4lVZkJxtDIn/JA+RGzxvIJwHOFTMijC5F1t2Hjymx2NBM2tgRRwQGaNAKVzi0gEKRPzPDx4ESrJm7ZXMJYMMuDECtBFwU6bxPvIqwlvvCC1leyalPTgicvdgYwWNQwUgjiPmSGsMYrzqO1XijlAjxPh/YZaFwaCmYrG79qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqrXNDbo; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b046d1cd1fdso6549766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756893836; x=1757498636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nq2yI35kD6p+VHyKDMeG5P0SE7VILz4NHeh1edAL9LY=;
        b=xqrXNDboAe/FHL0SsmD9bjgd4csmB9eIjYvWlxxvXLRKVMGMNd0JdcH436WvwA4IT4
         i9WgqJhoddAnhnA2XOvBwyN+4LBQNpoQrZjBGQ075t7SDx32SXdXUzvdc86xkOXEEkys
         r2/GYkvX/7D4RtHwdThO+kS9XY+pr9INZh8/WZP3enDu+KlZ7FjuWWNP0n0d038t4ZzV
         kR3Nnm/4yfRwzS2z58vhFpZTJqdvyaqyaBW+1wGRQ+0kFpslp3LZlAzOiI0aqUFoj0m5
         6/f2HMSiVVwZnn5LtE5H/un71E+G9lUKVjQhp90LBOGrpBiTyeMfbOw1YPDE6l3Kyxlo
         5uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893836; x=1757498636;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq2yI35kD6p+VHyKDMeG5P0SE7VILz4NHeh1edAL9LY=;
        b=og0xKvUHz9w1DjTFu5iHbvDN8/kzZUhraTQ8du2QtHXpfvwlNidf9ycmPwWUzFnio7
         FbjqYxgAZfw+3UjkVgUszREuz+p6eg0DMwUnCGcHfVwEe8j1iJFWYm111ikIMzfgJOI/
         L4FuIF6BH071pvWDTHkjiWctpi1qEkILweT9hYFXFxqWbqth92SSUb3ajPi4uC58/z1S
         htr4sF2K/LEGp+r1ZYxvaX03rdJWZrxnI8a01hnZMKwzjsUy2SChiG3fWM5ePvdXEktn
         +d+XEey9MGPDsux63hsgHufV0m5QjeQ/sO0NWPZuuRieMEcRehyaupzGgGCz2DwSj2AU
         51gA==
X-Forwarded-Encrypted: i=1; AJvYcCXVXXqw+AlCyHyVVyDMBYLuRL3S1GVjFOobh86OVWA0lJTsFj6Jj/Q5xTW/B7d8/RH9AQzkt0RNeRWZy5G5@vger.kernel.org
X-Gm-Message-State: AOJu0YxM31Pv4lcqhCWBtWY7ViHZBx0gAKZLVA2c0sgJTxjasb24N413
	MkFG0RIEb01RcaSikCCGhJpHCLMFmR0A2pTJ+VG+9y90ZfAsXioiPcf1UC2t7Sas2Tc=
X-Gm-Gg: ASbGncs7rywWp3o/vVEHY3GfB9mcBaXGx0Ngfvr3pQUE3l5/R9sgBsmnxB8kUf2XgIa
	mV/g4WFisxOpnTc+hDHaFkDtvhmxe35yMLzYkeZ0cEdFBkSB3Xa2tIkfj2xdMsNIH4ZEk0msYWE
	B3NCGPlT+xI+xJ94yTOTE95nRKQV/5rQ/XYC85g3xyzwvbpsgnR6KH8cOp11FQKSXAksXhqf+An
	HtJGZvAcZHUXttUh5EVX2EXiHglJcQSXxhe2O7thLIQokvDvAn+xYK2WjHHfO/Uz97FOQ6vVQal
	9O7XSoKUkZsdqUvSsTwD+HrSpNlkqA/26RwNxXp+lLGmdbBP0G38IgLc5aK6/LNjqcUX8oMi/TW
	6I51uT5+ioLA+q0jfKmOTNg9SDCKtHz0ucFdfaRpl6Dflsc209hinrw==
X-Google-Smtp-Source: AGHT+IHwwLrkuoIbCE3SevCtSLBrMSxsijMwNty5Zrfr9laq8AP328QMNjXpn4aVHwbkdv5gDR+qyQ==
X-Received: by 2002:a17:907:e8d:b0:afe:d218:3d21 with SMTP id a640c23a62f3a-aff040b2788mr957125666b.4.1756893836256;
        Wed, 03 Sep 2025 03:03:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b045e576edbsm255447266b.75.2025.09.03.03.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 03:03:55 -0700 (PDT)
Message-ID: <94ade558-90db-4076-92a7-ec9ffd709b71@linaro.org>
Date: Wed, 3 Sep 2025 12:03:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
 <d2d01b40-677c-4ad7-9742-29a40082f40a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <d2d01b40-677c-4ad7-9742-29a40082f40a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2025 11:31, Konrad Dybcio wrote:
> On 8/21/25 4:16 PM, Krzysztof Kozlowski wrote:
>> Speaker Protection is capability of ADSP to adjust the gain during
>> playback to different speakers and their temperature.  This allows good
>> playback without blowing the speakers up.
> 
> exciting!
>>
>> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
>> and sending it as command to the ADSP.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> [...]
> 
>> +struct param_id_sp_op_mode {
>> +	uint32_t operation_mode;
> 
> "u32"

This will be quite inconsistent. See coding style: "you should conform
to the existing choices in that code".

Best regards,
Krzysztof

