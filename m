Return-Path: <linux-arm-msm+bounces-46802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B758EA260F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54DF616700B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD88C20C465;
	Mon,  3 Feb 2025 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYNLD2QS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8B20B807
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602299; cv=none; b=LnkSfXlv7xWPVh4tHaPKHEebuySzb9t7GpifAQaiYwS2Sz9UiftO1Mf0FVxUOWu1ndbWIN7BPHaJezw0FBpKBM/5L102FPJrpHCO6ZKmiDHPp0Q9Yv2n4WqKcRv6L50msZnXN4sc6W7ebcb1MSEWyoQrjj4tE+D6bqBwxAx4LKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602299; c=relaxed/simple;
	bh=k+4NjqDATI0U8bN3dLAciAEBVOadw2UR8Z2JdKAVccA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCFAIC7Rf4Ni6aicncuMNuvqR5fKoJAjlUYtznccxzof+lIgKQvPdRFec7QGgVQEahhy9dqJqALV0fdqFe6ljuLHlaB9Ld4X5e9QnpIbOdB7LYoq8E33e9xI4BHIQrNZkhdb1KXebmFd87svUePTDDZ25mLwgUeYZvh9g4luPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYNLD2QS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso32112405e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 09:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738602296; x=1739207096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeAKHkbKI0d+HFqcA1QbgNc0PHZKpaqw+IxJ2Pt3KrI=;
        b=cYNLD2QSSgQi7h/liSDv7EsJbF8aOjW6vSZcAcjQVOotEoT6PLPLdohwA79zdKpnEP
         c5nuMFX6yucvauCT2FRxPbgxPGHEs3A92slKD9DKVar/mClVEEiwHjQ+5E+fd1Y6F30d
         juqR2/gVcVcbC6HFAvxJ3vPrDKQ83o9amxCQX8Tam9TSbZciO9zsuNeXNNJ4R+sYPzeA
         ls8MvFitR/RT0Aw4GMvC+1S+fjZezm6TvfP16O5LZKm91++Doka5c7WV7QPipCZWWp07
         GkszcB9koZkOGV2js2gdXa8SEspwLs03hY6X28e2aNeN4c4w6BrjMkfLcXwd6GmNMe1F
         1YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602296; x=1739207096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeAKHkbKI0d+HFqcA1QbgNc0PHZKpaqw+IxJ2Pt3KrI=;
        b=tv6ect4phDtNBUL0sbXSYNtfPli39TNuvpH34FzYz70Y9miYX6+tFkpag/DUxL3aam
         9u4oXHhPGe26s5MEVWCI3jnIR/gKi34DhfWNqQTjptybbDdgLxvJxDyGhuud40OYr0jp
         S9ps9QRtjTfmCKQK5rdew/lITTczayLtGNjuzQsrhkAslt9IcSjkm5dv3Ycbh25SLXEz
         YfJ306SiulppOPZLuSYziOJH5lB4GyuRpyLcWi4kfTCQo4QCJ1fSbpWWm7d3FeWlal4F
         wUJn31OgBC/iMQyDJZhGdklhWf89aW8kXsz6yfh1SRFv8Sus9dch1TNDAOOL7Hrl8w8d
         GsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSkYhDZD+XNiIdDm82GLgeZwzdQQdeRVtKcQHhhWZtNGGcCutHkTz/L5P1EUwXgARd8cNzGog0o/G21DX7@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUX7cBq3X+IHr/zC0XfGI9WBQ+RVB82go2giLXf/9CuRlqC+8
	/inGDDV0d0a54khveOCBB8WxtTPHIuSIdiX/EhT0ZmeodjNvQhOYSFG++bbMDS0=
X-Gm-Gg: ASbGncv3zlFPaCUqEq/fF6xA2cYPAu3nUJGRYrmzGIAeF58Za2V/UZu04u6kiVu+UkT
	xXSXErPF9RqXrZDH6NK29NWK6Lne09OyJmNOV2qR3FkknFnfcPj8e0duZalEjyH9BHo0FJ0yrq1
	UXY1Dtl7RG52mzNL30KPx7RgB0WiqYbUbWSnC3hBnNA7aUfMaU6F5LdzsqfQJ5q4azgZ8Frl5sO
	qJCy8zo46mZDDVVF7rogosHr4T5lHvhck+CvwpVXqElVb+L7Ywq7+07ZBX+NrY2NUalC+qzTCbl
	UXNhR9FI1j72XB3hncmZs/dm6+w7HQc1GQ==
X-Google-Smtp-Source: AGHT+IF00AdeVSwhqI4DYXX6YY6GZEPGGjTf8EIYSLIpae6mTJ38NVob4I51jvELhrmPQOnQvXZr1w==
X-Received: by 2002:a05:600c:3b94:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-438dc3cc3b1mr206167275e9.15.1738602295518;
        Mon, 03 Feb 2025 09:04:55 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf571sm13099525f8f.82.2025.02.03.09.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 09:04:54 -0800 (PST)
Message-ID: <05263a45-5faf-47c7-9a32-eb8e5114e286@linaro.org>
Date: Mon, 3 Feb 2025 17:04:54 +0000
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
 <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
 <4678ae0d-434e-4e04-bd77-abae1969ff6c@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <4678ae0d-434e-4e04-bd77-abae1969ff6c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 15:07, Mark Brown wrote:
> On Mon, Feb 03, 2025 at 02:30:26PM +0000, Srinivas Kandagatla wrote:
>> On 03/02/2025 14:17, Mark Brown wrote:
>>> On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
> 
>>>> Fix this by scheduling all the periods, this will ensure that the dsp
>>>> has enough buffer feed and ultimatley fixing the underruns and audio
>>>> distortion.
> 
>>> Should we be writing all periods or just the minimum number of periods
>>> that's configured?  Userspace might not have filled the whole buffer
>>> yet.
> 
>> Just minimum number of periods or 1 period. We are queuing up all the
>> periods to the DSP, so that we do not have to wait for period interrupt to
>> queue the next one. This significantly reduces the latency in queuing the
>> periods to dsp.
> 
> What guarantee do you have that the data isn't garbage?

Yes, its possible that some of the last periods might be not be written 
yet by userspace.

We can always add some checks on the available periods to queue to dsp 
something like:

----------------->cut<----------------
avail_periods = (runtime->buffer_size  - 
snd_pcm_playback_avail(runtime))/runtime->period_size;
if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
	for (i = 0; i < avail_periods; i++)
		ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
		if (ret)
			break;
}
----------------->cut<----------------


--srini

