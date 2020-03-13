Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1E11846A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 13:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgCMMQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 08:16:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37424 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgCMMQE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 08:16:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id a141so10044618wme.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cos0z2ZnLdhgTrKzYZS98WN2zx2uM2u3a3GtghXGyMM=;
        b=uyl+0f2vW+990e+EP5QFGafFeKSM6QnC39sXPkUFRtsjZ8lFkyt4cSw06tKYg+HK7Y
         ynoknG21PmZ/TvatDsuQn4GliguyX86GIMXfgnhFutfl7vOniKKVsLMrfD9rdpt2TCD8
         2XSGU05a343XbQ053KCylLmfd4HvmfJJwI+lCaNqsBjSRDKvmEiCiTfBnG6v3OHXQVbU
         +PzDGeqBKdSEpj9Sny7kT4D4AfaPxX2rsSFn/TT9htkqy0nCSD+c2ZF47PDzlkVedeH9
         ie3gDjsv5pz23lWzXBqZ7LGQn38y+td+eu7eC7m4WMAh9PGuGuN40zOkP7/cfHhILCED
         6Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cos0z2ZnLdhgTrKzYZS98WN2zx2uM2u3a3GtghXGyMM=;
        b=jhaPjnK+tu2YnNnMXDC7bx0d6YnyImQtpp+FglAHGjKX7k19A/uNmZKhEnxLwDqOVI
         UidmXoNibRUdHamVxd+OrjU2WuucioOM3tR67EMtQJhugVTAitt3b9k2vi9dWWyrlN8V
         VlRhLeB6I1IUToYqQobsLWL3LEErNYqAwSqk6Y0ZiBpgGO3xHeA8nuwjMBTjYIHzD97O
         NEytGakT1YRnYw9aGBf/01JQRD93Ii07meFAaqzhNKvdVK5AckUf6VruvQO5t6YaTUhR
         nHZVwFKxzPRlVoT1E6Hq+ceybUP8j6pbn0i1ea7vt724L/AVG8MJ9KtN7A8e7X0Zu1JO
         CkBg==
X-Gm-Message-State: ANhLgQ2NR8wxGgJsNtDVt4ZdzvK++aWcaRKBQV66+AHHY19MYHKyvLhi
        wgdvOa7LpBWpJTmoXUe/RNbxIg==
X-Google-Smtp-Source: ADFU+vuDGoIAUIxQUpdgjLTOoFE9zMYRNI6MCt6NH/LR8YP5yQH95VtC4/lS6iAKjJPkWVF1MOmOMg==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr10605018wmb.35.1584101761142;
        Fri, 13 Mar 2020 05:16:01 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id v14sm43278354wrr.34.2020.03.13.05.15.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 05:16:00 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 8/9] ASoC: qcom: q6asm-dai: add support for ALAC
 and APE decoders
To:     Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-9-vkoul@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <fcee2779-fee8-e3d9-590f-e28fc5880ea0@linaro.org>
Date:   Fri, 13 Mar 2020 12:15:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313101627.1561365-9-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/03/2020 10:16, Vinod Koul wrote:
> Qualcomm DSPs also supports the ALAC and APE decoders, so add support
> for these and convert the snd_codec_params to qdsp format.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
One minor nit, other that,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
>   1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 53c250778eea..948710759824 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -628,12 +628,16 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   	struct q6asm_dai_data *pdata;
>   	struct q6asm_flac_cfg flac_cfg;
>   	struct q6asm_wma_cfg wma_cfg;
> +	struct q6asm_alac_cfg alac_cfg;
> +	struct q6asm_ape_cfg ape_cfg;
>   	unsigned int wma_v9 = 0;
>   	struct device *dev = c->dev;
>   	int ret;
>   	union snd_codec_options *codec_options;
>   	struct snd_dec_flac *flac;
>   	struct snd_dec_wma *wma;
> +	struct snd_dec_alac *alac;
> +	struct snd_dec_ape *ape;
>   
>   	codec_options = &(prtd->codec_param.codec.options);
>   
> @@ -756,6 +760,65 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
>   			return -EIO;
>   		}
> +		break;
> +
> +	case SND_AUDIOCODEC_ALAC:
> +		memset(&alac_cfg, 0x0, sizeof(alac_cfg));
> +		alac = &codec_options->alac_d;
> +
> +		alac_cfg.sample_rate = params->codec.sample_rate;
> +		alac_cfg.avg_bit_rate = params->codec.bit_rate;
> +		alac_cfg.bit_depth = prtd->bits_per_sample;
> +		alac_cfg.num_channels = params->codec.ch_in;
> +
> +		alac_cfg.frame_length = alac->frame_length;
> +		alac_cfg.pb = alac->pb;
> +		alac_cfg.mb = alac->mb;
> +		alac_cfg.kb = alac->kb;
> +		alac_cfg.max_run = alac->max_run;
> +		alac_cfg.compatible_version = alac->compatible_version;
> +		alac_cfg.max_frame_bytes = alac->max_frame_bytes;
> +
> +		switch (params->codec.ch_in) {
> +		case 1:
> +			alac_cfg.channel_layout_tag = (100 << 16) | 1;

We should probably define this layout tag in asm.h
something like:

#define ALAC_CHANNEL_LAYOUT_TAG_Mono (100<<16) | 1
#define ALAC_CHANNEL_LAYOUT_TAG_STEREO (100<<16) | 2

--srini

> +			break;
> +		case 2:
> +			alac_cfg.channel_layout_tag = (101 << 16) | 2;
> +			break;
> +		}
