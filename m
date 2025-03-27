Return-Path: <linux-arm-msm+bounces-52665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C69FA7361B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2AB93BEE66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E5819DFA7;
	Thu, 27 Mar 2025 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zS8Gooq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20419F11F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090805; cv=none; b=szLkCF+3TbtObT9ihvJ6PpZZjFBhvkJ+eqB/n/0WpH2RrBtB1OiDyAA4I4tQgMstIeC4Q9lZ3v/R0no6ZTcUGAEC0Rjo2xuKgWQ3LytuaaeprrQcbZVUH8haZboc9q8D5yTwOSontcxU8YqarCDtCP38QUKFp0waBy83xMIK4u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090805; c=relaxed/simple;
	bh=aZI0D9GByNS5niy1zG4DskkgaZ8o9N1YGuTSEvk42eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5oxWXBwsTcNnWZSpvqm44aGR69kldroRq3e1phWChccEX9Bbjt5vc+55F/1+cWdSLLERH9gd5h/jQFExdMcu/XGMzb+ynULKR2/lYNt7HDTIr5MEHi5hiz+yKgOJsJpwFosdpSl+dvaqXZNdzirO1JnqbSrj+gKWQ4URlJLcGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zS8Gooq0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7783785e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743090801; x=1743695601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPWPL7yKTAtHpN1GHn1lwbAF2Bxssj4X5B+0T4l0yZA=;
        b=zS8Gooq08D4tUgk+wHsCFwNDiCiLYi6fvV33yAcYX5MLip6vsYcqiXWXHu5USx7Tyv
         xT2o08RNyfDKI8Wc3INXuaHBx113BNTJ1jnY+beZFianwEXdH/Byxv8h/3x0mf/ABZjw
         H2EXTikR3PwkvheNahDYIanMq4ZggPx2wASppHVm98jGO1S5SgcV4DupkcSFNqsf2Fvt
         h/5jiBbPrcX7sdvCWOjT0R9mq0s3QsEbunibAiZwNRvazAZm1MF3mjjsRZZp9MpnpBkk
         ZMzc0bWPFMIp1BGaFIdymvc3LEFMzwRcj3LlMbZvjw4msm78JfaQxNIosHD9sE1vAvZP
         BbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090801; x=1743695601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPWPL7yKTAtHpN1GHn1lwbAF2Bxssj4X5B+0T4l0yZA=;
        b=s04la94oMccX2eXR7kDQPyzByDeJcgSEI7K6WrAtQZZq1ebhGPoDxf5YAf9MtWnFnb
         EqMobi4qYORDSc4yHzk03OQJagYRsDNrYzOd51SCzkanqeYqdBC/kIxIafhuNBzTyG6F
         QVvTtQYgkfUhBrfrY57xM02ngm+FLzUxkzdGgnhAvgP8SLqP1pNlUF7LVex8ff3iVDVS
         kSClx4m9Wmd5YcCsyGlOnScnyKk6af5pKihzSiAJwWc0LliDmzS+XJ6lmUYRHsfwW6hI
         Z27aqpTTBMYpKCQC5trG+N/m7fnJ4V/F05kyawR6fW56orADyB74qu4QVP9CnQR0+i2l
         7zvw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2tz1jfE1ON/2MMnJ1/1F3G3UnS37BD+1RY/zqYH1xI9JS9mMA0WtNUiiA5whNVrpfrMSduaNBagKkvc7@vger.kernel.org
X-Gm-Message-State: AOJu0YxshD2zTx4qwdx/3KcYUqiawUOEv95ZCcp6TR61jqUIoi/FxmK5
	VuYl8c4uroKy+SUYdoY3rMZqPR8iAfpKBbbLhf0iv4xsAyHW23FZNHmeNzbT2aQ=
X-Gm-Gg: ASbGncu5v2JVdhHH7N3ZDh3tM+Ov3wbSTqoJ28rn362XyCPAHHEsR2vrGSYEU/pJ4cH
	5TTjSMGsog2SPDxabntTylRi6dN9MDXjzCIu43wN5p6yitEdKK1qa+OA/LlunxY8SBgPgeyeYNl
	0EeJgo146vLu89+JzjWJhCGhIPbxtaog4dhhcDVGiSV5wh/w0UtbllbcjlABWpn8Uqpb+t5+0cF
	IiEuj96HtLWdTl/Smzwx5i9V21sN8jbHYRoSC2/gM5Cr5v5do/af21e8ELlQcM4ZPxoBO68rDjm
	6moKYuQRlouSdID+1okXtNGujIRBgVUeUaurL9s1BpYcObxaZVXvVOB1Cv92G8aaVzFXQMyS+Q=
	=
X-Google-Smtp-Source: AGHT+IF0rsorn2DDVURJzAnXZcks95g4PPd1N+aY2Afsm9tUg7aUDyfar1m2VXFCygEcTyP952h82g==
X-Received: by 2002:a05:600c:1e16:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-43d8e6c0616mr7183295e9.13.1743090801523;
        Thu, 27 Mar 2025 08:53:21 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39acf3a9105sm5001550f8f.101.2025.03.27.08.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:53:19 -0700 (PDT)
Message-ID: <e7c3ea4a-1103-46ff-aa9a-bc0da3bdf1b2@linaro.org>
Date: Thu, 27 Mar 2025 15:53:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params
 error path
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
 linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250327154650.337404-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250327154650.337404-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/03/2025 15:46, Alexey Klimov wrote:
> In case of attempts to compress playback something, for instance,
> when audio routing is not set up correctly, the audio DSP is left in
> inconsistent state because we are not doing the correct things in
> the error path of q6asm_dai_compr_set_params().
> 
> So, when routing is not set up and compress playback is attempted
> the following errors are present (simplified log):
> 
> q6routing routing: Routing not setup for MultiMedia-1 Session
> q6asm-dai dais: Stream reg failed ret:-22
> q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
> on 17300000.remoteproc:glink-edge:apr:service@7:dais
> 
> After setting the correct routing the compress playback will always fail:
> 
> q6asm-dai dais: cmd = 0x10db3 returned error = 0x9
> q6asm-dai dais: DSP returned error[9]
> q6asm-dai dais: q6asm_open_write failed
> q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
> on 17300000.remoteproc:glink-edge:apr:service@7:dais
> 
> 0x9 here means "Operation is already processed". The CMD_OPEN here was
> sent the second time hence DSP responds that it was already done.
> 
> Turns out the CMD_CLOSE should be sent after the q6asm_open_write()
> succeeded but something failed after that, for instance, routing
> setup.
> 
> Fix this by slightly reworking the error path in
> q6asm_dai_compr_set_params().
> 
> Tested on QRB5165 RB5 and SDM845 RB3 boards.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5b39363e54cc ("ASoC: q6asm-dai: prepare set params to accept profile change")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

thanks for the patch,

This is now pretty much inline with what we have in non-compressed patch.

LGTM.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 045100c94352..a400c9a31fea 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -892,9 +892,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   
>   		if (ret < 0) {
>   			dev_err(dev, "q6asm_open_write failed\n");
> -			q6asm_audio_client_free(prtd->audio_client);
> -			prtd->audio_client = NULL;
> -			return ret;
> +			goto open_err;
>   		}
>   	}
>   
> @@ -903,7 +901,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   			      prtd->session_id, dir);
>   	if (ret) {
>   		dev_err(dev, "Stream reg failed ret:%d\n", ret);
> -		return ret;
> +		goto q6_err;
>   	}
>   
>   	ret = __q6asm_dai_compr_set_codec_params(component, stream,
> @@ -911,7 +909,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   						 prtd->stream_id);
>   	if (ret) {
>   		dev_err(dev, "codec param setup failed ret:%d\n", ret);
> -		return ret;
> +		goto q6_err;
>   	}
>   
>   	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
> @@ -920,12 +918,21 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   
>   	if (ret < 0) {
>   		dev_err(dev, "Buffer Mapping failed ret:%d\n", ret);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto q6_err;
>   	}
>   
>   	prtd->state = Q6ASM_STREAM_RUNNING;
>   
>   	return 0;
> +
> +q6_err:
> +	q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
> +
> +open_err:
> +	q6asm_audio_client_free(prtd->audio_client);
> +	prtd->audio_client = NULL;
> +	return ret;
>   }
>   
>   static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,

