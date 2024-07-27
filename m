Return-Path: <linux-arm-msm+bounces-27138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A6593E154
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 00:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28FB281B4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 22:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE76A42058;
	Sat, 27 Jul 2024 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9athftF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29EB38FB0
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 22:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722118957; cv=none; b=DrjqGgHkV1xWA5GwndnsbzUzUuUMwD3VRqTzsWN/oLg9191EyqyuR5tuBtKm84mfK8w2zdn0iBQlZgfH8SwPZb7jEHYbq/ZHDKBFP4Z2vGGOdndAkS7OcLnKdqdgbiUzTKR+7rOgK0oruCvTOaMBs6itbA176FnYx0cSCeYaYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722118957; c=relaxed/simple;
	bh=fDjNUHr6dA8rOXDlgnigy+h72KTsuiW6mnnOcpO2mks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6PoKOAquuuSG8SbYrvdIIHPrgp8NLIOdk7fe6kUzt0mB4CZCTh7lfzaasMExKfnrzpimM7AwLm4H461662XUZM0Q5P7NWCrkEedaeB6oreMJ2a+4uLtBYJVMYI1hg0vp7wlaYgw/q3p3HEaO7HsQqkwGcipB/2yhR8vwqocuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9athftF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f01b8738dso2358202e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 15:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722118954; x=1722723754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmqlrirUFtzyURY6qK3fyfdNBiwmBrDBIWtbVFCj68k=;
        b=i9athftFb3IK36fqslbvcmnAQ2IVj8sK6Mh52pfqUBCgX3WoERtBL9+5ztFVpR5mGw
         4PQnq/6uc/zWab+VEKNuJh+NGuj2UrvOBU/YAM1VugJJiGEmd9TKWVoSzrmEXiUlh9WK
         ZQpdhFfZ/G1piXm9/mwveuZ318WjblQELLd78tKIbXv2TN+Xmlt/TGaiN6eO24pqjKaL
         xEAgEUDJXS+9RQ43DlfTWZ9ypyZEQTTFyyNUkdyWvxy2O4AADzYYmUldCTnKltzTBfFj
         WKPMzh+0id9tNbZwaMghrkAx37nO/aqeBErILlJLZyOY5vJIBtRqcB9i7BQDWnCew5D4
         MbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722118954; x=1722723754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmqlrirUFtzyURY6qK3fyfdNBiwmBrDBIWtbVFCj68k=;
        b=YviuRy6U2c48uRLr13CLRCM4BLHymQ9OHVgCiZaQ3Ye7do38XEtbY0E/v7AHPMs8R1
         Z6yFHoMRUqy1IAt1ABZfVKfCa/RJSbVGmu+HPD65+m67VSgDsYW3H4GHert5USyeQUcV
         es9NJxu2fHIrATgWbIsLxnjnnsblOo4JiA+vwTnDj9OK2SHJG+3vKlgZIeqwJOIHSY77
         T4uuScwq6RhDTnh7c29UvJwIKKOKdYiBwjzy/2s7cqGURKJuZVa5Uc3QOKWuqZeHYzHO
         pQh2mmzcjNTYr7qLNvwIcN8Uk5CL/z2H1t/KMsCDg6R73w6pa1nls/Z4ZPvusXH/2P9/
         kmkA==
X-Forwarded-Encrypted: i=1; AJvYcCW6P01l40oaP15NmRTV2znyIjFQqgtYKay6vBKznPFxW/Dw+oPIA5N6xyDFEPKbJ1FdxH9XM+cY6sWIrH4gmx2UIwyu8f3WuKdxlHP4qw==
X-Gm-Message-State: AOJu0YxryCSA79IE7af8PfDpuyingvO2eXmvW4+1w9HKOu2Gm+boxz2h
	M3aMY2YILgcJAbZb907RyGcG6ydeROkYomtVI8cD4i/OExu5HFLWme6t67+ZOSg=
X-Google-Smtp-Source: AGHT+IF/s11CSBZC1Ioc8fNTDjjnGQIm4OyRZiAH0axmuM5wcvd3DkIFT4ZzI5q6QFp25Q1zWlz7ZA==
X-Received: by 2002:ac2:511c:0:b0:52e:6d71:e8f1 with SMTP id 2adb3069b0e04-5309b2ce524mr2179378e87.53.1722118953841;
        Sat, 27 Jul 2024 15:22:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc40cesm871534e87.28.2024.07.27.15.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 15:22:33 -0700 (PDT)
Date: Sun, 28 Jul 2024 01:22:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 4/4] ASoC: qcom: apq8016_sbc: Add support for
 msm8953/msm8976 SoC
Message-ID: <4ncs2zopzh2qnf4cgb7wnq2ai3vw2zjyhnv4tsgdhu3zqqnvug@63ypk324n3mr>
References: <20240727182031.35069-1-a39.skl@gmail.com>
 <20240727182031.35069-5-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727182031.35069-5-a39.skl@gmail.com>

On Sat, Jul 27, 2024 at 08:20:27PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Introduce support for audio card on MSM8953/MSM8976 platform.
> Main difference between those two is Q6AFE CLK API supported by firmware
> which influence way we enable digital codec clock.
> Either inside machine driver or outside via q6afe-clocks driver.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Add MSM8976, rename functions, add mclk setting,add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 68 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 303dd88206b1..453ca4795603 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -22,6 +22,11 @@
>  
>  #define MI2S_COUNT  (MI2S_QUINARY + 1)
>  
> +enum afe_clk_api {
> +	Q6AFE_CLK_V1,
> +	Q6AFE_CLK_V2
> +};

Are these v1/v2 coming from some msm-N.M kernel? It's not obvious from
the patch, but msm8916 also falls into v1 category. Is that expected?

> +
>  struct apq8016_sbc_data {
>  	struct snd_soc_card card;
>  	void __iomem *mic_iomux;
> @@ -29,6 +34,8 @@ struct apq8016_sbc_data {
>  	void __iomem *quin_iomux;
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> +	enum afe_clk_api q6afe_clk_ver;
> +	bool dig_cdc_mclk_en;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -192,6 +199,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
>  	}
>  }
>  
> +static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
> +{
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
> +		switch (mi2s_id) {
> +		case MI2S_PRIMARY:
> +			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
> +		case MI2S_SECONDARY:
> +			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
> +		case MI2S_TERTIARY:
> +			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
> +		case MI2S_QUATERNARY:
> +			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
> +		case MI2S_QUINARY:
> +			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
> +		default:
> +			break;
> +		}
> +	}
> +	/* If AFE CLK isn't V2 return V1 */
> +	return LPAIF_BIT_CLK;
> +}
> +
>  static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> @@ -214,8 +243,17 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
> +	/*
> +	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
> +	 * so we have to request clock from machine driver using V1 API)
> +	 */
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {

Nit: line feed after &&

> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
> +	}
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
>  	return ret;
> @@ -236,9 +274,16 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
>  	if (--data->mi2s_clk_count[mi2s] > 0)
>  		return;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
> +
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {

Nit: And here too, please.

> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
> +	}
> +
>  }
>  
>  static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
> @@ -279,6 +324,23 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  	}
>  }
>  
> +static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
> +
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
> +	msm8916_qdsp6_add_ops(card);
> +}
> +
> +static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
> +
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
> +	pdata->dig_cdc_mclk_en = true;
> +	msm8916_qdsp6_add_ops(card);
> +}
> +
>  static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
>  	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>  	SOC_DAPM_PIN_SWITCH("Mic Jack"),
> @@ -343,6 +405,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>  static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
>  	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
> +	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
> +	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

