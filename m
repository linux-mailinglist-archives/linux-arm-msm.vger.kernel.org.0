Return-Path: <linux-arm-msm+bounces-27717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA69449A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 12:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CC891C26570
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 10:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CDE170A18;
	Thu,  1 Aug 2024 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="usKRXty0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95DD2F5
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722509265; cv=none; b=bFZPIlYrOTjsol80nWMaChavmn6Fc1EEGTArpAATCLV60C7PO07jgp8tMhYTkEzhz0o5sJBhY+w7p5KVeyKXbmOxw/RcdJNCN6jP9QF2CE0rbxyWqJHD2Cmbt/pzI1EppcHFmYH9LpfxVdcNHDUmtUMXmZNguH738mrpzuDtNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722509265; c=relaxed/simple;
	bh=hSVSRrz3fsl8s+TtTum1SWINf7gjHKl5ODNPOppJJBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abc4a8OI4LRAxouIZpNkTNIx+ROwIHYo802+Oa/oTZjJH4gWK3at4ngrGChvg85Eg5BSdhWP9N1skEPkuxG9v03h61viYKhJSZzJ0QyUXsTY6VG29D8sBd2N3JYQ/DD/Qh/iQXD/KNhjGfhjOfDfhBrADF5M0sraXL6rWEicukQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=usKRXty0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a83a968ddso958407066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722509262; x=1723114062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z85y/g+9vb81jKmcafP4dvn4vFmY5QR0yXRNZFSsnR8=;
        b=usKRXty0Tl6DGc7zqv6nzKvz6NXTR2yK4G6w+Qhkb6VvyZpihOrUc6d3CE8KInBXZ7
         NQJqMihbz+C2pkIQXkbJ49VSxKRQTsW1KQxRb9K0XGjrQFq0Tmf88cMK7IBqfUpuxFWI
         UtJn5yzXU5+ysu2LfLcX0skhzPgMakqCveB4CMwlrpYc93rR9wFF9VUleuUlO4w7S/B3
         NQM7rpLrhGZ2dJb1k18KeBaD1q5Snbst6W7JSfqKqf7XQPi3Fkv4iPY85u2YoXnXDefo
         B2nwUwWh1/99fQ976EROMLXSEvsP6EGjWn6Pog7vuWVNkPBAyvmoIQZW4TILWlXf3DRq
         8ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722509262; x=1723114062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z85y/g+9vb81jKmcafP4dvn4vFmY5QR0yXRNZFSsnR8=;
        b=IXYmd5YW09EshPTEw4YZv88YZc+8u39FJwXeLJ94giqD6uz8nwGqf+3Kv0g75UT+ko
         ZA92e7jlDKZRMZJfdWPN9sF6DsksgMKc3HIopgn5a95Q7t5NUTtgr6ToH9Rp0C46pRuX
         roEKf1W4rkmQhYgDksm+sCBwtdVeyG7GHIYjSfBU38pxs7OSs2fZ4iYrXVtbmOeEPhCE
         4WcOSDijQIQRbyesvHRFNm5dVV4HPDyZcEh0Au0r2OOXEs3SarkZyteEeumXlX3vlt+N
         xxW50mVa9VFc+5payY5ITGECqev8mwIiq/Sfo9jqMPd52sPv1qqL6oFdOcSzyIdS9WJ2
         dtVg==
X-Forwarded-Encrypted: i=1; AJvYcCX8B361c4iF678SNSFeMCAUsEgUhLVsB2B2pLT06CYTsYvmDvCirHKfs18zEBmoKg7GI78YCK+Ccc+VPHGjILc9XT4gjcnbcKXgYB1VKg==
X-Gm-Message-State: AOJu0YxfPPmFsE9rhkVD6z6spq2ZjhfKvhbYy5X6KHVJSk4ALpM5WzrK
	MiSmP9hT2ru9ZrIIx7ooZIetcItIKbn+wwXVI3el4jw79VmXsvZ1oA1hDhHl588=
X-Google-Smtp-Source: AGHT+IETKes+z6wG81VpgxVv6mHim0SINXPJ9ewGaBVr6boePMQ9az0QkbZ1hzXP5XqyWc05zbL4WA==
X-Received: by 2002:a17:906:c108:b0:a7d:391f:17af with SMTP id a640c23a62f3a-a7daf65a227mr145607566b.51.1722509261910;
        Thu, 01 Aug 2024 03:47:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:31d2:aeb1:18cd:e482])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab4de7asm880932766b.66.2024.08.01.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:47:41 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:47:37 +0200
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
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
Message-ID: <ZqtnyWAXTsSGAg0i@linaro.org>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>

On Wed, Jul 31, 2024 at 05:25:30PM +0200, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Introduce support for audio card on MSM8953 platform.
> Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
> supported by firmware which influence way we set codec clocks.
> SoCs shipping on at least msm-3.18 should use v2 clocks.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: rename functions, add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 5a29adbd3f82..3ed35beb671a 100644
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
> +
>  struct apq8016_sbc_data {
>  	struct snd_soc_card card;
>  	void __iomem *mic_iomux;
> @@ -29,6 +34,7 @@ struct apq8016_sbc_data {
>  	void __iomem *quin_iomux;
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> +	enum afe_clk_api q6afe_clk_ver;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -192,6 +198,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
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
> @@ -215,7 +243,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
>  	return ret;
> @@ -236,7 +264,7 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
>  	if (--data->mi2s_clk_count[mi2s] > 0)
>  		return;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
>  }
> @@ -265,10 +293,12 @@ static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  {
>  	struct snd_soc_dai_link *link;
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
>  	int i;
>  
>  	/* Make it obvious to userspace that QDSP6 is used */
>  	card->components = "qdsp6";
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
>  
>  	for_each_card_prelinks(card, i, link) {
>  		if (link->no_pcm) {
> @@ -279,6 +309,14 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  	}
>  }
>  
> +static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
> +
> +	msm8916_qdsp6_add_ops(card);
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
> +}

Is there a particular reason why you decided to hardcode the
q6afe_clk_ver for the SoCs rather than finishing up the dynamic
detection Otto proposed [1]?

This works for MSM8953 but there are a few SoCs like MSM8909 where
both clock API versions exist (depending on the firmware versions).
If we want to support them at some point, we will need the dynamic
detection anyway. It would be nice to finish up that patch set.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20231029165716.69878-1-otto.pflueger@abscue.de/

