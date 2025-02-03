Return-Path: <linux-arm-msm+bounces-46767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89472A25BD8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F0E162410
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63513205AC4;
	Mon,  3 Feb 2025 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFCn67Mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76634205AA5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591772; cv=none; b=rXca5T7k/DQ/TJhBNwt7HLdLzzu+4demafKSZrWJYiSestyW/MD7DTZPvnBVmuiBfS+lyVicziMIml4birVbXh7q1Va97ekzaXYyfkT9xSBfxcjHyTFzabmOiRqPzWdQl178371rW6DGjb/+KW6eWAd554W5XGkgLWY30sjBj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591772; c=relaxed/simple;
	bh=BhDJSrHYmdsEXplQFttxlJTvYf2TKpF3zvQiKJnEhX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhmUj2fHzkKIk/7pg0+wFiB+Fd3kbpjftkd30DDH7FjN2PRzR7hrJEKMXVtCsGGWuGtAKy+PWAI1YKrDu4g1GPVuFecjmQv/7K2uSEE9i4fl4XESaZiT5FvsC74EMlovKA2Kw8KMPcNlV0F6wDFu3z/qRUm+r6hUr38HpZ/wsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TFCn67Mh; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4066872e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591768; x=1739196568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H4pmT0xng8YdhycWRMKJfsqizxwuIDbDyEJ81pc8bF0=;
        b=TFCn67MhkpzqQA+g0ir89xZj7fDZ+gMAKDJ6ThfRd26IrFuYoEEMEAManmrbDbOySA
         rLvIttQGiHYHmRG3dIOOLOvmKpreL/Psv0uJ7WQigmHEyOq/iZ7ToGgPFFFG8INO+aTz
         Z9cATybj4kSx2ndQukfzSiDkQ+5Ef/hppwsj1I57d3ocZEPyH9G5ybFwgqaMZQQ9iMcn
         6CFUbBeryZaVw8XFjZzuHLYHqZN8SgQ2I/L0JAeeFx7qh97Jrj8IK0N4lykGY3mbxfnP
         dDvRMk1+6lohlOxLIyflVzeeaN/++s4QVsUs2Ha/6qSYec4x23o0iu+psk7dq+LnhBiL
         WGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591768; x=1739196568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4pmT0xng8YdhycWRMKJfsqizxwuIDbDyEJ81pc8bF0=;
        b=lbk7K3a1kOfnejKaRfEP3iJgZQIKB5hn6wXnVwG+n11rVMndI5zzU6gPK+ou/8Vfru
         lB8zqiPSUEG6Qfd45fTK8BKKOflQiFI4uU3zTBW815t+ORtsSj2Gm9s+wK20tNErKa8I
         HdERly+MnXmWBCJRT8dFKIYW6b7LPF4jR7BbBmt3Xe6iVW5h4WwgonaYNXWAsbR2C1gi
         QOXWuzmRvA/3+e9yHVaFW1RBGqFxJ7DEpIdMMQ3X9n/HjBkcNwcSVafHoy2KBPYyp2N+
         WpE2lEgZDz+L7az1mMWsmfGf5RZkvmMnfHaQI2Uau2aHFjrXypqQoVpRwoYZ9DEsz6Vi
         wgww==
X-Forwarded-Encrypted: i=1; AJvYcCVOk+Pa86hxHYkGAHYhClsYlRHNLH/VJRIqsa9q3OvkJAE4fhwT5Of0ORgFgMHEyDnMdD6s73qRSynlAfO4@vger.kernel.org
X-Gm-Message-State: AOJu0YyogzrhywTJ0nysoP+sWpc2oJCihcVi6aoS1C/jZpGhGAO/7b/s
	0Lt30XyukQk7d0AaWy7nxMTsNurYwtqwJX3sU3m34LjxcSKzwG51oCtw1+ppEMg=
X-Gm-Gg: ASbGncsxk1hgEJh78Hw/aOEBLQG7Psq+ym6iZY0FnlDmPXk+ayr0kMliTbVDfWRUWGS
	Ds/PL36swHm1cKUy+5Ykp8RrTI7egIE/Jzhch37qAkfrTImCa+/bkEKSJZGEvPsgwKRNlVU5QmL
	RrS6zY0QLTF6sdOoKiH4Ax6JyNkkswi/FdFpeYB6UiAxRD3PAXFNv8oY+bsv/NTrV2C8lUplpsn
	tj5RnqXYC+HLJL72UxTegr7IkgX1ByoROzbw3r15kSAMaTgOTU1h0ZFMKa2ziMFB7ULy2d8tujx
	L5C/j3d0fE/AhyifnezZAo3DBcXjWKuCm/Plto0foD6H2reTb91wHujsbx2BdiZqdFoUgn8=
X-Google-Smtp-Source: AGHT+IFtAcXEaVrswkCO/X2ohPvix6C9anq5aWjz8V/6SOYEap4Iiw/P0CbtbcIo2Z8mkkAhqD9zAA==
X-Received: by 2002:a05:6512:3994:b0:542:8d53:5eab with SMTP id 2adb3069b0e04-543ea3c894amr5745670e87.6.1738591768446;
        Mon, 03 Feb 2025 06:09:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0f97sm1303565e87.5.2025.02.03.06.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:09:27 -0800 (PST)
Date: Mon, 3 Feb 2025 16:09:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we
 start streaming
Message-ID: <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>

On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> With the existing code, we are only setting up one period at a time, in a
> ping-pong buffer style. This tiggers lot of underruns in the dsp
> leading to jitter noise during audio playback.
> 
> Fix this by scheduling all the periods, this will ensure that the dsp
> has enough buffer feed and ultimatley fixing the underruns and audio
> distortion.
> 
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index c9404b5934c7..148c3fb77168 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct q6apm_dai_rtd *prtd = runtime->private_data;
> -	int ret = 0;
> +	int ret = 0, i;
>  
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		 /* start writing buffers for playback only as we already queued capture buffers */
> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			for (i = 0; i < runtime->periods; i++)
> +				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);

So, all errors except the last one are ignored now?

> +		}
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  		/* TODO support be handled via SoftPause Module */
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

