Return-Path: <linux-arm-msm+bounces-23945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B8914A34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B0C283E61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDC313C677;
	Mon, 24 Jun 2024 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uYB8oiyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B651137750
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719232510; cv=none; b=UcpgNYtb9fiCC/9A4y+7xMkwimI/4fXw/mx3ApeU4HptLVAHg6qQNuycka/lea6LNHfbAdpxFC1d3251DGX8H29W3VAKGbal2io3+0nic86dSNWBwgPCpAK/c3Uy2LaYVXSNSgP1vvJcfXinN/fclVe2qhc4K3LI3L28ucPEOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719232510; c=relaxed/simple;
	bh=rZnyITRnxDG6Nk4huYfxna9K9Qbnrk3RLW9XoXc0NcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+Hmr7YeW4XRhDq2ajwHpESs+1tNiUtWasDw4dPInJjJPoM3OiPMN3B5NVZIQZSYeETEL8bGdC9ZQX5qAV9OPQTAWvhxzQ8Loa1XJoqueMaZgiAUebTjIZmaqyMROzBLKtTZPoEiuisJ8cYWsiev5Ge5lsHPN5/8G06Lg1YrkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uYB8oiyg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-424798859dfso35681895e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719232507; x=1719837307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQUUsxjRwH4QDpNTDMmqo2rmvQGvXKLqsN4S6BTa2C4=;
        b=uYB8oiygQnO6SDSYbpaS8Yr1r8y1wyiwceb5d2HvXDLW7ZSBiKBgmtvwhwCCVSKIYH
         +mhY40eAVt10mW67GzzKn+tWA5+l1sPiqGD7hVH4XbvIWk/pMsusiECYKgug9Pqv+0FS
         FZ37dxqtgQXh/JnKhlzKsw4xgYkXY5/2jSq8pf5k9G23LqLtRnFDe/Kbkg9Wk6tB9orJ
         JjCKVdfLNe8pvhRAWBO/2BduldC8dVv6FeQTc/o0UKIosyUXKL8nPg84BA+Jz+X3HDmZ
         0HzU5SHXRXzwPy1Pwol9VxiE3j1TpsD2idWU3cksGM82g4bWI9SORlfPJLWi80gXO2HU
         W/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232507; x=1719837307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQUUsxjRwH4QDpNTDMmqo2rmvQGvXKLqsN4S6BTa2C4=;
        b=HmgzhW/W0XmVB22F4mmv5DMbgYphPK+37mDUp+JWja0MrOr5Bdn1+TO3E1NHb+dKuP
         6QKIIfo8KoubbpK1/spVvG53+GhZfOvo/8kEKfvIGiCoOwZMiIHhQbyRMBQ7j8SOSPWY
         waHhU+urKJ6iEPoFPF8zCfGeap3ZKxgqQy8dBK/TvRFkKms1eoDZStTX6gI97kU3BpOB
         V3d/ZPQjEdSLPaYQBzY1QCtyroKgMwMRTWn9aO/Ek1dCL2QPsGYc9hkJd/S45r7o9r69
         0tfis+KGIxt1d1Etz856YWuOEVxMTJu5z1gPd1Uj17YrPOITPFUKPlmfm5LKVLURnNIC
         PI9g==
X-Forwarded-Encrypted: i=1; AJvYcCXru+iXZjWJpbx17/k1jTQDV4TX/jhCDSV8ZaPPtcUfqBn6Yz8vwtA3lRi3VNvll/LclhZQq2zyBH85GRVBn/B0pFl3SF87wXabSw8yvA==
X-Gm-Message-State: AOJu0YzPZmCKyoqsUXpUMdWsU4fihKPybfKJGfpfFT0RcYbAKkNXkY0O
	QqQuBfxfx/HhazHHGyfBh7AzCZeeTR7q8daeDZbarLADTML84dnuXt275d8XjRQ=
X-Google-Smtp-Source: AGHT+IF7U0TSjuU2VtHCgQSadIQvNwhYOOe7AZZqFDBcNxrvKuelGClpZLjx79kGC+fjpLQNkiUjVQ==
X-Received: by 2002:a7b:cc89:0:b0:421:7f4d:525f with SMTP id 5b1f17b1804b1-4248cc35da7mr30272805e9.24.1719232506864;
        Mon, 24 Jun 2024 05:35:06 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4248179d506sm131135415e9.6.2024.06.24.05.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 05:35:06 -0700 (PDT)
Message-ID: <fe75671f-c292-44b7-9024-15e0825c55c2@linaro.org>
Date: Mon, 24 Jun 2024 13:35:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manikantan R <quic_manrav@quicinc.com>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
 <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>
 <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2024 21:28, Dmitry Baryshkov wrote:
> On Wed, Jun 19, 2024 at 02:42:01PM GMT, Srinivas Kandagatla wrote:
>> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
>> paths eventhough we enable both of them. Fix this bug by adding proper
>> checks and rearranging some of the common code to able to allow setting
>> both TX0 and TX1 paths
> 
> Same question. What is the observed issue? Corrupted audio? Cracking?
> Under/overruns?

two Issues with existing code which are addressed by these two patches.

-> only one channels gets enabled on VI feedback path instead of 2 
channels. resulting in 1 channel recording instead of 2.
-> rate is not set correctly for the VI record path.


--srini


> 
>>
>> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
>> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
>> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-wsa-macro.c | 112 ++++++++++++++++++++++---------------
>>   1 file changed, 68 insertions(+), 44 deletions(-)
>>
> 

