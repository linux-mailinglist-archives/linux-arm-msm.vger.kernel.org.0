Return-Path: <linux-arm-msm+bounces-50416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A60ACA50E6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 23:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30C73ABC76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 22:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AD6266577;
	Wed,  5 Mar 2025 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2uq83Ow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5F1FCF68
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741213049; cv=none; b=PvXE+tjzEge6pSwvcirVQNowWRJ8qKrW7ZzCxAd9LJM+HGyO/Colj+Nch0MPDcsgVzxcIwtS8eGebSh0vVU/+iodlkhPDkzQBJjpEXMpJJ33dDw8Tu72uctv0qcngTC906ybCduL8IdfL703R/YimOjrlVWvAwlKj4rb7cmuf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741213049; c=relaxed/simple;
	bh=0EASBjsKyosgnKgR5LYlE5kSUH+MJui/0SdB/Sv1BfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcbjYnSAxgeoNRN+4crZOEshooVjTlo6CIcwh3WHCSARmvfJiFsBkmzT1WncsePoJmp1agsIjHfIOd1kLWuf6mayUj+Jy+ys5V4iJ/YcPirHNTrwJAVtQKh2csXLt3Xp39qzMCLiofhQTnuslRvb1RLkcG7JTbe3qm1oC1LLs58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2uq83Ow; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab771575040so238865166b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741213044; x=1741817844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05I7Zu62yUz7WtzNJ79+oYpmHE/xDrzeMJzIBYcCoB4=;
        b=b2uq83OwB9ki9tUUbRqfmeWLQFYcDUD68KGCMGgw2qVq5gbwJJNMfyZdHkxeNgku8L
         M5yUcqZjAE3y1nm26Ng3dsyHQO4uTHCGG7xCJxd5/bRchYVFOTUz4GEg2nUua4byZPQq
         hwlaw0CGNMWPIvr9Pj7wof48/j5QUKt4KxM+u6O6QVB1NL2GYmvgJhOPEgiA9Li+7mx4
         vOFn6IKFO/FukHhXNEnwX5a/692UlSL4Cg6DLD0iSbhdwRXjNziBKawlhcMhfeNHGE75
         B142Iifu389obFDsIsCSUzgTd3b3MejpvosPQYKi6pA/sQq2vMIaaNQKnRDBqYq8BKar
         HNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741213044; x=1741817844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05I7Zu62yUz7WtzNJ79+oYpmHE/xDrzeMJzIBYcCoB4=;
        b=D8O5ykm2/WBZM7Bq+5WUdC85uM+UdSnx/sjPAk184Qza3PooZbey6wmXv5gzyrv+Il
         KT4I3f2YWh0sn//h0lriJUTQDvGLxi0IU//oGEljLrzYAJGbLeA2OPcYasl2eL7A8r9E
         AOMGOITFC3G1XYGMv7adr1zm2lAwTT0fM7Zp4AzOwHaK7bk868NKD6VW/U7f/1Bh4HaR
         Dslr071NozhH7ozkkSUQR93dZngDoThMrXwEva7uCDx1I2eXc9iFCO/CwDieXvHEANTz
         yvGPkw/lh68TAvRQmsKWMdGwS8Xc5owc/MqasTPdrWoN4qS9PkjNm70/9VomTZoJU1KL
         dSfg==
X-Forwarded-Encrypted: i=1; AJvYcCXvkfR3aMeXN14PJLI/aqeL3SM4U94Z5Oq2W4JFgK8NhhZD4up1U8mQZSjruimjvMI37dResPwnLhuTujeE@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiNVyCQE86qdux55r8JqEg8Aj9nZbF7co3foICITkTG3VBh6m
	ke0GZrTrQ7Vg4dL8POV9cmEwztw1JdOhSsjdJLimfbHyBURZRKYZtgQLxnMlqN8=
X-Gm-Gg: ASbGncs5DJZxdoTcpRbpAwRbXNaiK2zb8qpByOU58YiTp7Fesh2wJWmSPv6UBskItQ6
	e+oWkYcNZvESZ2jIw39Nd5yRnKr0TRdAGPa+RK16JBsqhL19DztnxbKO+L/mYTgJW37TPxm2pCX
	g1ieWaqbWSDxLuupzCb6SlorNY4i9Qv8a18RpJXjp+corZl15AyJXA/T7O5jW2VaqzNS8xBHEfk
	2O59y8Rx4f/dhPxuzoxrrxUv1acmwbM17QlxFUD67CIFSFiAlmCgc8v7K79YyCIqtH8jYM4/n3r
	o9cc8wSW29wPXGlqXiQU7fk8yQzigILQpVt5oQMQRk5p7iRhHwt21OyPgIg8quBxw7EIUWDrKQe
	y+l4oGI7N51X36C3HtWg7O/o61w==
X-Google-Smtp-Source: AGHT+IFySJJTv+uF4nFVy3MQo13MAKioll0wB0jIBjyasXh3UmkhJxVLukr73dcjkJKsIaPAWkDHfg==
X-Received: by 2002:a17:907:d24:b0:ac1:e45f:9c71 with SMTP id a640c23a62f3a-ac22caa102emr73495566b.1.1741213044551;
        Wed, 05 Mar 2025 14:17:24 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:1352:bac1:449e:9a8e? ([2a0a:ef40:1d11:ab01:1352:bac1:449e:9a8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac117f39e04sm529347966b.94.2025.03.05.14.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 14:17:23 -0800 (PST)
Message-ID: <ea047098-2baf-456a-a57f-b698c0ce1b6e@linaro.org>
Date: Wed, 5 Mar 2025 22:17:22 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Srini,

On 3/4/25 10:57, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> both recording and playback. These patches fix issues by
> 1. Adjusting the fragment size that dsp can service.
> 2. schedule available playback buffers in time for dsp to not hit under runs
> 3. remove some of the manual calculations done to get hardware pointer.
> 
> With these patches, am able to see Audio quality improvements.
> 
> Any testing would be appreciated.

This totally breaks audio on SDM845, and often results in a hard-crash 
to crashdump mode on my OnePlus 6.

Unfortunately I can't get UART logs right now. But I imagine this is 
reproducible on RB3.

Kind regards,
> 
> thanks,
> Srini
> 
> Changes since v2:
> 	- dropped patch which is causing regression with pluseaudio.
> 	- setup period sizes only for capture path
> 	- fix underruns/overruns in dsp pipelines.
> 	- add fixes tag
> 	- add patch to fix buffer alignment
> 
> Changes since v1:
> 	- added new patches to fix the fragment size, pointer
> 	  calculations
> 	- updated to schedule only available buffers.
> 
> Srinivas Kandagatla (6):
>    ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
>    ASoC: q6apm: add q6apm_get_hw_pointer helper
>    ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
>    ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
>    ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
>    ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns
> 
>   sound/soc/qcom/qdsp6/q6apm-dai.c | 63 +++++++++++++++++---------------
>   sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++-
>   sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
>   3 files changed, 53 insertions(+), 31 deletions(-)
> 

-- 
Caleb (they/them)


