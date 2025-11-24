Return-Path: <linux-arm-msm+bounces-83083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD1C812EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 604594E5542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5D9290D81;
	Mon, 24 Nov 2025 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="E3ssUIU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F329222585
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996224; cv=none; b=R1E4Q/6XvYp+Of0Voy9l7r3LbfCNTDUdxVxVCvIGarXivn0S4RPg2Q4lviDSxDihC0a/2JNo1MMBjSJWXzk4dQNlsrgydg1zPjBztI/jHv/hoBV/a/fkzeRkhGbu3XzYouKB/kIj7n//WTaADUE1RmD8XxbTXxGXYMwqQbJqW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996224; c=relaxed/simple;
	bh=UvCzGx4/Oew8LZ0VLm3hjBFw/6m9gBQxwRkV+A03cRE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ppI8lyvHVfmTX+JLxH3rF8UHMGiYBr3s0x4f+O6mTi3C+hbW13RlAYGogG8RtEypcSF1jcxaoC3io/UB/vEVnUiyWXYHFDNN1Z/4KScFmaeTff684Q5B0IswA5SYHqDvm8w7q8PzYYpYV/5UibkIxV9w1mJJ7kz3J1mRa9AF3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=E3ssUIU9; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8824ce9812cso50085246d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763996221; x=1764601021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kyowUvYjYSzPjKoqi++oj3diDbTf12jpEUOewqm0cc=;
        b=E3ssUIU9C3FpEIxvruCP98x4ffP26wHT+/7K5q/p3gmey+Pl0BqmKJRMJ8XDp1cEa/
         GRSsGgnWW9AfUXYONnawPKfYfycX2JqJ8t5PiqJsBDo+EgxNq0lPNQf0Aay6itnZg78a
         d3lvnh7IIzmjVWcSkkxF8+fb9M/NvVGqXfDJeIhJG2vWVRiA852y9zimvucrU0O2mfqn
         DPnXZ6sMU/b9vhgiJtdZqtmHcVydbzIS97mHWF5cMNRjOc+sHyzKXwa035iJZrFixs0o
         P+v79UzNluvZvnwon+8JvFqANk6qxUo4Nxi0PVIr0iF7jMKJIPm7svbcPLh1htekDXUV
         1mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996221; x=1764601021;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kyowUvYjYSzPjKoqi++oj3diDbTf12jpEUOewqm0cc=;
        b=BV2nxgEEFO8xFO2XIN1qfQM4uWIcc1oswUWBTwNSts1deUSbL+4pB44PxVKzMrPbD2
         3SxsGtD6KbrFiZGcMSTI4mSnN0G2ZMTPrIZFEmCF3TbiIoW7mxaMfCabdSMDasq2fSDP
         zdPEtsNQXxfQ8Rf/NnIFAvTkYeMYjK4viz5WKrIcFZS7qdhkEjbDdS5C5u7nyGEVx9G3
         gtfx1M6iELfL1a7RfNNO98XIVZdMrqaELbPRr0soGyqLCclcvUWz3dmxH6t2h/kO9H/A
         syiW1FBqHJhq7xrnTHQeTu9yWeR9+5cGbcxCu4GKP+DAq9e3UirgtQvooN33orLUxMDE
         CUhA==
X-Forwarded-Encrypted: i=1; AJvYcCVUSR5NNZCHRffchkW9w+OqMagv9dbwal60ky1+xxmczK/qz4vfZeP6p2LHZyLFKCVwq0UuYQdyZTAt2W15@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8HcSZBBEhS2hGgLxh2S7s33WpuLhgsIOmPd5SS2Q/C6q+6vF
	IOSmN1xqikePLXxqGELrgV5LvDyXFTEoFNsQ8JeHBWYaM0t9ZN9wdU1mYJ4sj/J52sk=
X-Gm-Gg: ASbGncsk52Rf+14hAF2Q1IsOxe3PkIWx7FHAadQC0RjUNRUhohqkRTzxhgpcAA1tfLf
	Wo4ua8jKsXnyuuKuSozFz7AVWS/WRsbpbNcAgagitUDvUV2Q3OCLOH4xirZ4FB1eUexGXBN9Ev4
	FZt/P2/guP24JDBrc2NIw4TSMVeaJoXwLopbWtiANcb7UHw7ePd04bjO4wK5C3gGF6HGCZ94ZY7
	QmPPLgktCO5kR5frAnDXs3MdJ4DqqBo89HhrMTpwNpXAW9uAy8MTaeFUbWMz0lirC37KhMjGoZK
	Yf22afOI3CY/X4B65D36888Ir+xUFKvCHkURykJ7tUkG9bYtyJoCnlL7hFWcKsQfXed97PgXO/e
	51+RAVBGZKz8TkBc1l5PQ/lY6zjQNbMIVJkPF2EdOJzD62CB3jHk6lI0tg+3OUP8LSRptAIC1kO
	CaU2lfuBP+5MCQwk0H3iL8ZB0+8d39/EAi6sQFHon9yk08K0+HANH0fi+e24izqF81ibyh
X-Google-Smtp-Source: AGHT+IFXEvOLebVmElD9s+d7R5b6CttZ1cQA17/cysPWQ1b0GejyzOftge88iR/a0LNSzoxVSgW5Jw==
X-Received: by 2002:a05:6214:20ee:b0:880:40cf:ab8a with SMTP id 6a1803df08f44-8847c527271mr175801856d6.39.1763996220925;
        Mon, 24 Nov 2025 06:57:00 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54cc04sm100966766d6.27.2025.11.24.06.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 06:57:00 -0800 (PST)
Subject: Re: [PATCH 1/6] ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251124064850.15419-1-jonathan@marek.ca>
 <20251124064850.15419-2-jonathan@marek.ca>
 <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>
Date: Mon, 24 Nov 2025 09:55:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/24/25 9:08 AM, Srinivas Kandagatla wrote:
> 
> 
> On 11/24/25 6:45 AM, Jonathan Marek wrote:
>> trigger is atomic (non-schedulable), and soundwire register writes are not
>> safe to run in an atomic context. (bus is locked with a mutex, and qcom
>> driver's callback can also sleep if the FIFO is full).
>>
> Thanks Jonathan for the patch,
> 
> We have nonatomic=1 flag set for all the Qualcomm sound cards, Did you
> hit any schedule while atomic bug?
> 

Right, I missed that. I'm using a different driver which does not set 
nonatomic. But this driver to not need nonatomic - 
mute_unmute_on_trigger is a hack, if there is a timing requirement - 
then it needs to be explicit, the different timing with this flag is not 
reliable).

> 
> 
> In-fact this change has helped suppress most of the click and pop noises
> on laptops, specially with wsa codecs as they accumulate static if the
> ports are kept open without sending any data.
> 

28b0b18d5346 is important to fix the click and pop noises. But the 
useful part is the rest of the commit, not the mute_unmute_on_trigger 
flag. As long as the mute_stream() happens while the soundwire stream is 
enabled (between sdw_enable_stream and sdw_disable_stream), there should 
be no pop click.

AFAIK the pop/click is because of PDM: zeros (soundwire stream off) 
represent the minimum (negative maximum) amplitude, and the soundwire 
stream needs to be enabled to output a zero amplitude (alternating 
ones/zeros). Turning on the amp while the soundwire stream is not 
enabled will cause jumps between the minimum and zero amplitude.

> --srini
> 
> 
>> The important part of fixing the click/pop issue was removing the PA_EN
>> writes from the dapm events, AFAICT this flag doesn't help anyway.
>>
>> Fixes: 28b0b18d5346 ("ASoC: codec: wsa884x: make use of new mute_unmute_on_trigger flag")
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   sound/soc/codecs/wsa884x.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
>> index 2484d4b8e2d94..0218dfc13bc77 100644
>> --- a/sound/soc/codecs/wsa884x.c
>> +++ b/sound/soc/codecs/wsa884x.c
>> @@ -1840,7 +1840,6 @@ static const struct snd_soc_dai_ops wsa884x_dai_ops = {
>>   	.hw_free = wsa884x_hw_free,
>>   	.mute_stream = wsa884x_mute_stream,
>>   	.set_stream = wsa884x_set_stream,
>> -	.mute_unmute_on_trigger = true,
>>   };
>>   
>>   static struct snd_soc_dai_driver wsa884x_dais[] = {
> 

