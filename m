Return-Path: <linux-arm-msm+bounces-984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D517EF3AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 14:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 715AAB20B42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 13:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F4030F93;
	Fri, 17 Nov 2023 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoWRHiCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E11D56
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 05:26:33 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso261785166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 05:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700227591; x=1700832391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABUOU8VLEcpuYbTNVJB08d5jU4yF9glHzA9lcTvgLI0=;
        b=WoWRHiCe3HFDF8sJSfeUcc+1ldn8j3nm7WulsQd4BOYTnBOXzIUVzBnWYEO0MaCInK
         sM4guZY9diGUAzd8oRzR/hz2/0/Y9Q8TeMt6PruMtjsoMI3KxMPp5hajwMJZmKvFxV7j
         abU35QTk4RYch8KSLvNf/D4GZjxUt/YEndguGfznWyQwVOklwlW5PsTFz0YyAMEriNEv
         fAFKyvEHzrH6G/gu4UwaEOzDUDbn+Wme/5FLLZywgnFn16T2574VryL7MnZIxT7tiZhf
         R3QRB37gSlR6oKrp/QvSuN1Ru4Fvz0F29q24CygKj4odxq3oBovsucqg6Ig2byJ7xXrO
         pNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700227591; x=1700832391;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABUOU8VLEcpuYbTNVJB08d5jU4yF9glHzA9lcTvgLI0=;
        b=mby0QwqJqb3O18jV29Who6qvjfaEiyilcqQQnSnjEz+46N0KANurPudg/4XtAlZVLo
         tr/sXUGutiqXv6rep3wht9v0mxHKRHdOLo5IYzfJz/WiLp7wNshU0owcAjs++NiwOw4s
         6V+FM756OlCgI3F+sMg2huHVMh1IiSYsLsYrCQgIFJi/UH8MdC+KSYv693laPkMhQRLe
         4CTokETavYCEA8Cm/AIBM63etpLwW0WYZbLKz/Ps4pyilpTq0I5PwMDRt1r0qWuRww3M
         07k13CZW6xYswN2oCzkJfmQmV8GmBE4l0Qw/ChlATSF+D+F520AvPsVkbkHI1X8V5tL9
         Ubvg==
X-Gm-Message-State: AOJu0YzvpXt9zvcjwMEAApBYzZBx+ZMri0bsxq5a56sHgHfLWzyUx7yJ
	HJdOKpFLKmoXZ6mOhUvqEAZS2ckI16dUvqk6V8c=
X-Google-Smtp-Source: AGHT+IFewvmPX+g10sI5CiLoO3CT69uLSUmBI1V9Jnbk0Uyrod1XOK/kdXjF8iQ5VlLc/S1nUZYE9g==
X-Received: by 2002:a17:906:471a:b0:9e2:a56b:a941 with SMTP id y26-20020a170906471a00b009e2a56ba941mr15526001ejq.21.1700227591645;
        Fri, 17 Nov 2023 05:26:31 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p20-20020a170906a01400b009adc77fe164sm789874ejy.66.2023.11.17.05.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 05:26:31 -0800 (PST)
Message-ID: <db6fb37a-d931-4771-85f8-b922c5027bc0@linaro.org>
Date: Fri, 17 Nov 2023 13:26:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ASoC: qcom: q6afe-dai: check ADSP version when
 setting sysclk
Content-Language: en-US
To: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 linux-arm-msm@vger.kernel.org
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
 <20231029165716.69878-4-otto.pflueger@abscue.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231029165716.69878-4-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Otto for the patches.

On 29/10/2023 16:57, Otto Pflüger wrote:
> Some older DSP firmware versions only provide AFE_PARAM_ID_*_CLK_CONFIG
> requests for setting clocks, while newer ones only provide the
> incompatible AFE_PARAM_ID_CLOCK_SET. The q6afe driver implements both,
> but requires different clock IDs for the different firmware versions.
> 
> Implement the LPAIF_*_CLK clocks using newer clock IDs when the DSP
> firmware does not support the old clocks so that users don't have to
> care about the firmware version when setting clocks.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>   sound/soc/qcom/qdsp6/q6afe-dai.c | 98 +++++++++++++++++++++++++++-----
>   1 file changed, 84 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index a9c4f896a7df..c66f8ab41d5e 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -14,6 +14,7 @@
>   #include <sound/pcm_params.h>
>   #include "q6dsp-lpass-ports.h"
>   #include "q6dsp-common.h"
> +#include "q6core.h"
>   #include "q6afe.h"
>   
>   
> @@ -443,36 +444,105 @@ static int q6slim_set_channel_map(struct snd_soc_dai *dai,
>   	return 0;
>   }
>   
> +static int q6afe_get_bit_clk_id(unsigned int dai_id)
> +{
> +	switch (dai_id) {
> +	case PRIMARY_MI2S_RX:
> +	case PRIMARY_MI2S_TX:
> +		return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
> +	case SECONDARY_MI2S_RX:
> +	case SECONDARY_MI2S_TX:
> +		return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
> +	case TERTIARY_MI2S_RX:
> +	case TERTIARY_MI2S_TX:
> +		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
> +	case QUATERNARY_MI2S_RX:
> +	case QUATERNARY_MI2S_TX:
> +		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
> +	case QUINARY_MI2S_RX:
> +	case QUINARY_MI2S_TX:
> +		return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
> +
> +	case PRIMARY_TDM_RX_0 ... PRIMARY_TDM_TX_7:
> +		return Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT;
> +	case SECONDARY_TDM_RX_0 ... SECONDARY_TDM_TX_7:
> +		return Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT;
> +	case TERTIARY_TDM_RX_0 ... TERTIARY_TDM_TX_7:
> +		return Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT;
> +	case QUATERNARY_TDM_RX_0 ... QUATERNARY_TDM_TX_7:
> +		return Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT;
> +	case QUINARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		return Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int q6afe_get_osr_clk_id(unsigned int dai_id)
> +{
> +	switch (dai_id) {
> +	case QUINARY_MI2S_RX:
> +	case QUINARY_MI2S_TX:
> +		return Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR;
> +
> +	case QUINARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		return Q6AFE_LPASS_CLK_ID_QUIN_TDM_OSR;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>   static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
>   		int clk_id, unsigned int freq, int dir)
>   {
>   	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
>   	struct q6afe_port *port = dai_data->port[dai->id];
> +	int clk_src;
> +	int clk_root;
> +	bool use_new_clks = q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7;
>   
>   	switch (clk_id) {
>   	case LPAIF_DIG_CLK:
> -		return q6afe_port_set_sysclk(port, clk_id, 0, 5, freq, dir);
> +		if (use_new_clks) {
> +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
Why clk id is changed ? isn't machine driver passing the correct clk id?

> +		} else {
> +			clk_src = 0;
> +			clk_root = 5;
> +		}

> +		break;
>   	case LPAIF_BIT_CLK:
>   	case LPAIF_OSR_CLK:
> -		return q6afe_port_set_sysclk(port, clk_id,
> -					     Q6AFE_LPASS_CLK_SRC_INTERNAL,
> -					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
> -					     freq, dir);
> +		if (use_new_clks) {
> +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +			if (clk_id == LPAIF_OSR_CLK)
> +				clk_id = q6afe_get_osr_clk_id(dai->id);
> +			else
> +				clk_id = q6afe_get_bit_clk_id(dai->id);

same comment, why cant the machine driver pass correct clk id?

This exactly like calling

snd_soc_dai_set_sysclk(cpu_dai, 
Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, 
MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);

from machine driver for PRIM_MI2S bit clk and simillar for OSR.


--srini


> +		} else {
> +			clk_src = Q6AFE_LPASS_CLK_SRC_INTERNAL;
> +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +		}
> +		break;
>   	case Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT ... Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR:
>   	case Q6AFE_LPASS_CLK_ID_MCLK_1 ... Q6AFE_LPASS_CLK_ID_INT_MCLK_1:
>   	case Q6AFE_LPASS_CLK_ID_WSA_CORE_MCLK ... Q6AFE_LPASS_CLK_ID_VA_CORE_2X_MCLK:
> -		return q6afe_port_set_sysclk(port, clk_id,
> -					     Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO,
> -					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
> -					     freq, dir);
> +		clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> +		clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +		break;
>   	case Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT ... Q6AFE_LPASS_CLK_ID_QUIN_TDM_EBIT:
> -		return q6afe_port_set_sysclk(port, clk_id,
> -					     Q6AFE_LPASS_CLK_ATTRIBUTE_INVERT_COUPLE_NO,
> -					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
> -					     freq, dir);
> +		clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_INVERT_COUPLE_NO;
> +		clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +		break;
> +	default:
> +		return 0;
>   	}
>   
> -	return 0;
> +	return q6afe_port_set_sysclk(port, clk_id, clk_src, clk_root, freq, dir);
>   }
>   
>   static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {

