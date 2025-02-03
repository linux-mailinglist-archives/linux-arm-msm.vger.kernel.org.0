Return-Path: <linux-arm-msm+bounces-46778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C31AA25D2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9DC43ACF4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3B4212D93;
	Mon,  3 Feb 2025 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6t8XjBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE058212D71
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593031; cv=none; b=nvuBdhqkkPDc/J0/Y73/NbT+GH+c8xQ3BqRJGUtxDOOSnizBvDDFBbzBKMjHz8waCpEn0xFee6vlsktsBon8WQ7Ese5W3lEw7a009pZmd676LIwB2FGV2SICmvJV0dpEgAR65zL25/Bk8DsPe4HVTbd0o3lpb9BERzN1mj2Xz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593031; c=relaxed/simple;
	bh=IWZd5hlmNpgXQZ0243k8J0hL5ndXbwMghQLT8bz/dl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kD+o9HreYHfaO+abduQFLnOz3v+i9YGPKo9MWQHc56zwD7jX7EMiYDBH1RsGu654ZhPP20cxLHMq7A4bGYWnbR4mVuzNBtbq3GYbxUGHgzQZyhJ39cXj/qShvBnCfNyPfzeNqXsaCz60ts2VGP3qGL/Aay9B05NXU5m2bVRxHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6t8XjBT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43624b2d453so52361365e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593028; x=1739197828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vWFSQn7DgiKs/FycuACWL8FOOG/NvIUTBk5O9mP/jE=;
        b=g6t8XjBTUXglndFfVqzVdljDbO83j/VyLnqhmpi2yiCIcd+B/JjEO1VX+PSEzhpfB1
         2mm2m3TcpfTFrd9fzqgIcDrHAMEL7FBLxATUFPpDwt68cLnjpvYdGkZSZoNruIsyTNvI
         WEAwBOwKtLarvSMuj9HyVdYnovY6n72IiDUi8//PujcqXANVlmK/NPcL0Ua88hqWv/m9
         N2DQ1WP58EL268ay/gp/QA/MYVysFpwFRtnpUlYlT8XDB0SfP0f84FmgVxkFjv424M2S
         +quj9z1OpbGV2gUERzN2sBjpbAod91jRgKlaTiD7KmUordG9dUCpnYb+0bgQ85X4zEcL
         6OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593028; x=1739197828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vWFSQn7DgiKs/FycuACWL8FOOG/NvIUTBk5O9mP/jE=;
        b=mlG7iwmcasJidYtfr4drE7S4X3o9tbBX99lBCeDeRCXRS7oU6lbQcH7nx2q2ynhZSb
         s04khSpAZlznZ5swTowRUL1OyeuWJwlmOqCZRQ3lz/aPZSa+/pyoC2HXY+s2075tlqN3
         aw6Jac1bWh+84bITLPZGBm+aAtDvUcDzJDwZd3KjIc42HQvFYc8I77e93sHlZ61QWJuz
         UsZUOnq0b8M9BXDuW6BbfE/m/ZjpDrFVac8mYJq6kQnjxZNkw+7KcSPRVj5SpYFldLuu
         bUJvGCucNZR+ltNXAkEs3967Jv8hzIOS8I+DGoeXKbZp1rhKjzeFUgTf+KigrPdAgZK6
         agrw==
X-Forwarded-Encrypted: i=1; AJvYcCUvAqubDNSAWqTFGudgIogLXVHd3qOdiwDUr0kHPQOcfD3btzpmU8F3hMyV0PF5zwXHBCuEbcilXM5fgziV@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOUTHLG+YlP2r2e7hH0sDMekih4rBBXbneYGuMHdYXaBcKeR9
	Z3HqRbbBiF6lju/MM0Ikw+QFFZN8naLrDvAgG8zeIdFEwalM/596nHkoITi7i94=
X-Gm-Gg: ASbGnctwSZj+fKYP2AiR0HCU6fdb8UZ8Skb5yKnd/24oiSbgA9i/p6l+jbYRZOK6hLS
	txgEDXy+CW7sQRZSMyl52Z8Eaz2esYb4KAYXNg0QVlGnBSq5ZkBtptndRhIcXSgEe5Cznugb0CU
	KgxezL3g777B7duk3xqlj0lujQjNvIPpriCLL/CDzJ1Q1/uaEBk+jjXoqoVJPwp+UhCF0X0yzM2
	i4RtFddjtxirfUpRfkgVACnzhCQ8C7m1DFb3ocEHIu9uv90qOsAUC2DZ83bDonuZg8Rq0+/2I8d
	r02NBdxRYEr657Q0d5uyKpujwJ33k65n3A==
X-Google-Smtp-Source: AGHT+IHinY+xh0nJesZnDupVI2Wp4r4N0MF/Fkn9c+8reC2w8xLtTGDIrtM8PVUM9uRToGo6QBxJ7A==
X-Received: by 2002:a05:600c:4fc1:b0:436:1ac2:1acf with SMTP id 5b1f17b1804b1-438dc40d55emr204148275e9.20.1738593027971;
        Mon, 03 Feb 2025 06:30:27 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc81589sm191206255e9.33.2025.02.03.06.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:30:27 -0800 (PST)
Message-ID: <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
Date: Mon, 3 Feb 2025 14:30:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start
 streaming
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 14:17, Mark Brown wrote:
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
> 
> Should we be writing all periods or just the minimum number of periods
> that's configured?  Userspace might not have filled the whole buffer
> yet.
Just minimum number of periods or 1 period. We are queuing up all the 
periods to the DSP, so that we do not have to wait for period interrupt 
to queue the next one. This significantly reduces the latency in queuing 
the periods to dsp.

--srini

