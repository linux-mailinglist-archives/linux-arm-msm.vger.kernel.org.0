Return-Path: <linux-arm-msm+bounces-27723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F950944A12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 13:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E271C20AAD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C4F18452D;
	Thu,  1 Aug 2024 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yq8ZrD88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7E1662F1
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510506; cv=none; b=sR71otvjJk7qTAXDrq7mk5WFhV6dNCf4WIzBW+qinecMYLqzRLBBEF37OqCF5bA+14UHCzwATscngCVogfmm8rhHVaJc3HF7cE/Qbx6tt8qPeOnqojRroRc9FKPWpHDw79M5mx3s3Z3h5p+gJAVrC7KWjodwwSSHtxabY4zLp80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510506; c=relaxed/simple;
	bh=IzTwNrilBUAlwP925WvEJZboHMLUQHtVa3f+NyNlaK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9TrDAcc5Z7UPdvG68NhkyI5DTh+IxsJGFu8o+HdpMa9gxAIwLFH91kZdFiyGG+nJ9pAkVlm+O2s8+GPqllx4+rMYcP88hRvgXJFl7epykH5pLjj5lGH4J8toNd5EHP723sosVczh1VN6i3q19YPyA9CLbuceI0uDjmrGDqOlfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yq8ZrD88; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7a81bd549eso649483466b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722510502; x=1723115302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FExuf/EqIwu44cXtirgV7vgVSEt4vB1L1sgTb2On32Q=;
        b=Yq8ZrD887ONOyl4wEtu2lGibkCoVD+lyETrjB1OxHCJXnoMhjFIMb0HD2KrNgiEZS1
         Z5ySNdjFKrCqbphmgawAjuHTcWE4AqQkqamRnCU15OHUEAOXo4ny5vYiw50A8bv09eiW
         GG/v6hC7210/9TOKlJ8apE3Z6RqyRxEtcDY3oVm+8/1VoQUxg+qeoROqIOruPfsqDqsU
         6LM44aVieRPCx6f1U82GH7TL7dX1/5dTZbPl7UZcGuLI+JwL742UlH8McGIIayOrpXOy
         DTPm0twDcyx8PabSraq9SQI1j2AeKcTmEfJs9CB9bcQXrgFBA2U4KCAN/qZD9+HGn4vl
         djXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510502; x=1723115302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FExuf/EqIwu44cXtirgV7vgVSEt4vB1L1sgTb2On32Q=;
        b=CtHIBxxNLgtni8wKIKJvNkrN5hWb/eZLvBzVxI3cGukofGmhCZKayr9cYwbcf8JUtm
         JiX1dpkiHUAQYYjdCigJVowfB8C00VfLdzWk6E4uIdeju9RltD3BCuoNNy/2lW7uZhnu
         kYzNdv7LssLea26wa3xpJR3YdZk4oKnen5ROHyuAS30bLYocAI0SPdcrMigY632OOSlv
         +PjPdGbCgh4/g/ELxUd9c3L8hBhiKcP62ZWVmlXl0+TPRoj/4Cr8f9JSfYHCSyLTIRzY
         ovHrG87NOQ32ljCot+giaQ7hhfG5MK5ruMFDgeikB0GBTi7HwXpPp9u9YsjFpU6bLLsY
         c4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUbVyv3eqqqiketHrmL+ALMtyQBCTMI6Idt/QpanVqWHixx6kt24+smpUbd19/NuA3bcznM/LhrZiCUl5cHV1N/MVS/gRQKmYayfOYZUA==
X-Gm-Message-State: AOJu0YwmFpZXLciGy7TMMZj9qzXGZ29fN167iJyCI8+I2Oe9sCMDsXwc
	f/15vB+YOTipyspAy30h5gA/r1EcrmJk8MsKIzNJv9DbT2lEplWoqiUPRGurOvk=
X-Google-Smtp-Source: AGHT+IGqr7N4CpNmN1ermVEFWMT0947mfSXTC3VHJzla+OoRW5oknSUl8o0Y7+o27NpeeOS8sdiOuw==
X-Received: by 2002:a17:907:25c3:b0:a77:e48d:bc8 with SMTP id a640c23a62f3a-a7daf4c8093mr173415166b.21.1722510502384;
        Thu, 01 Aug 2024 04:08:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:31d2:aeb1:18cd:e482])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad90264sm894932366b.148.2024.08.01.04.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:08:22 -0700 (PDT)
Date: Thu, 1 Aug 2024 13:08:20 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/8] ASoC: qcom: apq8016_sbc: Add support for msm8976
 SoC
Message-ID: <ZqtspO9hO0yFus1u@linaro.org>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>

On Wed, Jul 31, 2024 at 05:25:31PM +0200, Adam Skladowski wrote:
> Introduce support for audio card on MSM8976 platform.
> While MSM8976 falls into v1 category with MSM8916, digitial codec clock
> is not available in GCC so we have to set it in machine driver.
> For that reason for V1 clocks new boolean is added to check
> if we need to enable codec clock.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3ed35beb671a..8219d4d55625 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -35,6 +35,7 @@ struct apq8016_sbc_data {
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
>  	enum afe_clk_api q6afe_clk_ver;
> +	bool dig_cdc_mclk_en;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -242,6 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
> +	/*
> +	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
> +	 * so we have to request clock from machine driver using V1 API)
> +	 */
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
> +	    data->dig_cdc_mclk_en) {
> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
> +	}
>  
>  	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
>  	if (ret)
> @@ -267,6 +278,13 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
>  	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
> +
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
> +	    data->dig_cdc_mclk_en) {
> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
> +	}
>  }

I'm a bit confused why this works correctly. The digital codec clock
(mclk) is needed whenever accessing registers of the digital codec
("qcom,msm8916-wcd-digital-codec"). This is why the clock is directly
assigned to it in the DT, so the codec driver can request it when
needed. The startup/shutdown callbacks in this patch are only called
during audio playback, while the codec registers might be accessed any
time e.g. when changing the volume mixers. Perhaps you are lucky not to
hit that, but if the clock is off at that point the device will crash or
hang.

Instead of requesting the clock here, we should assign it to the digital
codec in the DT. I think Otto's series also allowed that for the older
v1 firmware [1]. Can we work towards finishing that up instead? That
should be more reliable.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20231029165716.69878-1-otto.pflueger@abscue.de/

