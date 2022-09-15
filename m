Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D785BA05C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 19:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiIORYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 13:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiIORYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 13:24:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89C636DD4;
        Thu, 15 Sep 2022 10:24:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF33EB82176;
        Thu, 15 Sep 2022 17:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F4BC433D6;
        Thu, 15 Sep 2022 17:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663262680;
        bh=paDsNWbvAO8y+85965oaCYj9retoGyFuERkgKyXZcBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EFfcX9Unyks5GSjmUqRUkybDWH3h7foM7Ia8s3JXha+HmaSyp1MI+69GtQDTjxvnp
         +MaInwEF3/i6C13921PJnsriv1KAoUzh05K4AHpOpPSy0huKv2ArIBRTGT5kJBtKIi
         Vmx62hG0nEAtMl56SAigNFHQmRSDJwVNgK5q6kGx77WRk1Rw56VziaBZ1OM5w7Af75
         w4xFXO+7frNWLyXk2/drkB3bH/Mz8nmI9p7q0KIPZZKZJ8fx39W4xwrYFkxzri/aMo
         Lx8zkx5p6baLhmWEzr2XndJ0jpQAa/oFsxVZZ2SQ7H9mxqRnBzw6VLOJ+44gwNuPl6
         DOwh9yTGeegpQ==
Date:   Thu, 15 Sep 2022 12:24:37 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/4] ASoC: qcom: sm8250: move some code to common
Message-ID: <20220915172437.7mbelqh77xlogs4b@builder.lan>
References: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
 <20220915125611.22473-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915125611.22473-4-srinivas.kandagatla@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 15, 2022 at 01:56:10PM +0100, Srinivas Kandagatla wrote:
> SM8450 machine driver code can be reused across multiple Qualcomm SoCs,
> At least another 2 of them for now (SM8450 and SM8250XP).

s/SM8250XP/SC8280XP/

Regards,
Bjorn

> 
> Move some of the common SoundWire stream specific code to common file
> so that other drivers can use it instead of duplication.
> 
> This patch is to prepare the common driver to be able to add new SoCs support
> with less dupication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/qcom/common.c | 171 ++++++++++++++++++++++++++++++++++++++++
>  sound/soc/qcom/common.h |  35 ++++++++
>  sound/soc/qcom/sm8250.c | 152 ++---------------------------------
>  3 files changed, 213 insertions(+), 145 deletions(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index e53ad84f8ff5..69dd3b504e20 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -3,6 +3,9 @@
>  // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>  
>  #include <linux/module.h>
> +#include <sound/jack.h>
> +#include <linux/input-event-codes.h>
> +#include "qdsp6/q6afe.h"
>  #include "common.h"
>  
>  int qcom_snd_parse_of(struct snd_soc_card *card)
> @@ -177,4 +180,172 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
>  }
>  EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
>  
> +#if IS_ENABLED(CONFIG_SOUNDWIRE)
> +int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
> +			 struct sdw_stream_runtime *sruntime,
> +			 bool *stream_prepared)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	int ret;
> +
> +	if (!sruntime)
> +		return 0;
> +
> +	switch (cpu_dai->id) {
> +	case WSA_CODEC_DMA_RX_0:
> +	case WSA_CODEC_DMA_RX_1:
> +	case RX_CODEC_DMA_RX_0:
> +	case RX_CODEC_DMA_RX_1:
> +	case TX_CODEC_DMA_TX_0:
> +	case TX_CODEC_DMA_TX_1:
> +	case TX_CODEC_DMA_TX_2:
> +	case TX_CODEC_DMA_TX_3:
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	if (*stream_prepared) {
> +		sdw_disable_stream(sruntime);
> +		sdw_deprepare_stream(sruntime);
> +		*stream_prepared = false;
> +	}
> +
> +	ret = sdw_prepare_stream(sruntime);
> +	if (ret)
> +		return ret;
> +
> +	/**
> +	 * NOTE: there is a strict hw requirement about the ordering of port
> +	 * enables and actual WSA881x PA enable. PA enable should only happen
> +	 * after soundwire ports are enabled if not DC on the line is
> +	 * accumulated resulting in Click/Pop Noise
> +	 * PA enable/mute are handled as part of codec DAPM and digital mute.
> +	 */
> +
> +	ret = sdw_enable_stream(sruntime);
> +	if (ret) {
> +		sdw_deprepare_stream(sruntime);
> +		return ret;
> +	}
> +	*stream_prepared  = true;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
> +
> +int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct sdw_stream_runtime **psruntime)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct sdw_stream_runtime *sruntime;
> +	int i;
> +
> +	switch (cpu_dai->id) {
> +	case WSA_CODEC_DMA_RX_0:
> +	case RX_CODEC_DMA_RX_0:
> +	case RX_CODEC_DMA_RX_1:
> +	case TX_CODEC_DMA_TX_0:
> +	case TX_CODEC_DMA_TX_1:
> +	case TX_CODEC_DMA_TX_2:
> +	case TX_CODEC_DMA_TX_3:
> +		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
> +			if (sruntime != ERR_PTR(-ENOTSUPP))
> +				*psruntime = sruntime;
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +
> +}
> +EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_params);
> +
> +int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
> +			 struct sdw_stream_runtime *sruntime, bool *stream_prepared)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case WSA_CODEC_DMA_RX_0:
> +	case WSA_CODEC_DMA_RX_1:
> +	case RX_CODEC_DMA_RX_0:
> +	case RX_CODEC_DMA_RX_1:
> +	case TX_CODEC_DMA_TX_0:
> +	case TX_CODEC_DMA_TX_1:
> +	case TX_CODEC_DMA_TX_2:
> +	case TX_CODEC_DMA_TX_3:
> +		if (sruntime && *stream_prepared) {
> +			sdw_disable_stream(sruntime);
> +			sdw_deprepare_stream(sruntime);
> +			*stream_prepared = false;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
> +#endif
> +
> +int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
> +			    struct snd_soc_jack *jack, bool *jack_setup)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
> +	int rval, i;
> +
> +	if (!*jack_setup) {
> +		rval = snd_soc_card_jack_new(card, "Headset Jack",
> +					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
> +					     SND_JACK_MECHANICAL |
> +					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
> +					     jack);
> +
> +		if (rval < 0) {
> +			dev_err(card->dev, "Unable to add Headphone Jack\n");
> +			return rval;
> +		}
> +
> +		snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_MEDIA);
> +		snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +		snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +		*jack_setup = true;
> +	}
> +
> +	switch (cpu_dai->id) {
> +	case TX_CODEC_DMA_TX_0:
> +	case TX_CODEC_DMA_TX_1:
> +	case TX_CODEC_DMA_TX_2:
> +	case TX_CODEC_DMA_TX_3:
> +		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +			rval = snd_soc_component_set_jack(codec_dai->component,
> +							  jack, NULL);
> +			if (rval != 0 && rval != -ENOTSUPP) {
> +				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> +				return rval;
> +			}
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
>  MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index f05c05b12bd7..c5472a642de0 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
> @@ -5,7 +5,42 @@
>  #define __QCOM_SND_COMMON_H__
>  
>  #include <sound/soc.h>
> +#include <linux/soundwire/sdw.h>
>  
>  int qcom_snd_parse_of(struct snd_soc_card *card);
> +int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
> +			    struct snd_soc_jack *jack, bool *jack_setup);
>  
> +#if IS_ENABLED(CONFIG_SOUNDWIRE)
> +int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
> +			 struct sdw_stream_runtime *runtime,
> +			 bool *stream_prepared);
> +int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct sdw_stream_runtime **psruntime);
> +int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
> +			 struct sdw_stream_runtime *sruntime,
> +			 bool *stream_prepared);
> +#else
> +static inline int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
> +				       struct sdw_stream_runtime *runtime,
> +				       bool *stream_prepared)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
> +					 struct snd_pcm_hw_params *params,
> +					 struct sdw_stream_runtime **psruntime)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
> +				       struct sdw_stream_runtime *sruntime,
> +				       bool *stream_prepared)
> +{
> +	return -ENOTSUPP;
> +}
> +#endif
>  #endif
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 98a2fde9e004..8dbe9ef41b1c 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -27,57 +27,8 @@ struct sm8250_snd_data {
>  static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> -	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> -	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> -	struct snd_soc_card *card = rtd->card;
> -	int rval, i;
> -
> -	if (!data->jack_setup) {
> -		struct snd_jack *jack;
> -
> -		rval = snd_soc_card_jack_new(card, "Headset Jack",
> -					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
> -					     SND_JACK_MECHANICAL |
> -					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> -					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> -					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
> -					     &data->jack);
> -
> -		if (rval < 0) {
> -			dev_err(card->dev, "Unable to add Headphone Jack\n");
> -			return rval;
> -		}
> -
> -		jack = data->jack.jack;
> -
> -		snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_MEDIA);
> -		snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> -		snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> -		snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> -		data->jack_setup = true;
> -	}
> -
> -	switch (cpu_dai->id) {
> -	case TX_CODEC_DMA_TX_0:
> -	case TX_CODEC_DMA_TX_1:
> -	case TX_CODEC_DMA_TX_2:
> -	case TX_CODEC_DMA_TX_3:
> -		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -			rval = snd_soc_component_set_jack(codec_dai->component,
> -							  &data->jack, NULL);
> -			if (rval != 0 && rval != -ENOTSUPP) {
> -				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> -				return rval;
> -			}
> -		}
> -
> -		break;
> -	default:
> -		break;
> -	}
>  
> -
> -	return 0;
> +	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }
>  
>  static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> @@ -121,92 +72,21 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
>  				struct snd_pcm_hw_params *params)
>  {
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -	struct snd_soc_dai *codec_dai;
>  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>  	struct sm8250_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
> -	struct sdw_stream_runtime *sruntime;
> -	int i;
> -
> -	switch (cpu_dai->id) {
> -	case WSA_CODEC_DMA_RX_0:
> -	case RX_CODEC_DMA_RX_0:
> -	case RX_CODEC_DMA_RX_1:
> -	case TX_CODEC_DMA_TX_0:
> -	case TX_CODEC_DMA_TX_1:
> -	case TX_CODEC_DMA_TX_2:
> -	case TX_CODEC_DMA_TX_3:
> -		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -			sruntime = snd_soc_dai_get_stream(codec_dai,
> -							  substream->stream);
> -			if (sruntime != ERR_PTR(-ENOTSUPP))
> -				pdata->sruntime[cpu_dai->id] = sruntime;
> -		}
> -		break;
> -	}
> -
> -	return 0;
>  
> +	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
>  }
>  
> -static int sm8250_snd_wsa_dma_prepare(struct snd_pcm_substream *substream)
> +static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> -	int ret;
> -
> -	if (!sruntime)
> -		return 0;
>  
> -	if (data->stream_prepared[cpu_dai->id]) {
> -		sdw_disable_stream(sruntime);
> -		sdw_deprepare_stream(sruntime);
> -		data->stream_prepared[cpu_dai->id] = false;
> -	}
> -
> -	ret = sdw_prepare_stream(sruntime);
> -	if (ret)
> -		return ret;
> -
> -	/**
> -	 * NOTE: there is a strict hw requirement about the ordering of port
> -	 * enables and actual WSA881x PA enable. PA enable should only happen
> -	 * after soundwire ports are enabled if not DC on the line is
> -	 * accumulated resulting in Click/Pop Noise
> -	 * PA enable/mute are handled as part of codec DAPM and digital mute.
> -	 */
> -
> -	ret = sdw_enable_stream(sruntime);
> -	if (ret) {
> -		sdw_deprepare_stream(sruntime);
> -		return ret;
> -	}
> -	data->stream_prepared[cpu_dai->id]  = true;
> -
> -	return ret;
> -}
> -
> -static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
> -{
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> -
> -	switch (cpu_dai->id) {
> -	case WSA_CODEC_DMA_RX_0:
> -	case WSA_CODEC_DMA_RX_1:
> -	case RX_CODEC_DMA_RX_0:
> -	case RX_CODEC_DMA_RX_1:
> -	case TX_CODEC_DMA_TX_0:
> -	case TX_CODEC_DMA_TX_1:
> -	case TX_CODEC_DMA_TX_2:
> -	case TX_CODEC_DMA_TX_3:
> -		return sm8250_snd_wsa_dma_prepare(substream);
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> +	return qcom_snd_sdw_prepare(substream, sruntime,
> +				    &data->stream_prepared[cpu_dai->id]);
>  }
>  
>  static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
> @@ -216,26 +96,8 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
>  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>  	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
>  
> -	switch (cpu_dai->id) {
> -	case WSA_CODEC_DMA_RX_0:
> -	case WSA_CODEC_DMA_RX_1:
> -	case RX_CODEC_DMA_RX_0:
> -	case RX_CODEC_DMA_RX_1:
> -	case TX_CODEC_DMA_TX_0:
> -	case TX_CODEC_DMA_TX_1:
> -	case TX_CODEC_DMA_TX_2:
> -	case TX_CODEC_DMA_TX_3:
> -		if (sruntime && data->stream_prepared[cpu_dai->id]) {
> -			sdw_disable_stream(sruntime);
> -			sdw_deprepare_stream(sruntime);
> -			data->stream_prepared[cpu_dai->id] = false;
> -		}
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> +	return qcom_snd_sdw_hw_free(substream, sruntime,
> +				    &data->stream_prepared[cpu_dai->id]);
>  }
>  
>  static const struct snd_soc_ops sm8250_be_ops = {
> -- 
> 2.21.0
> 
