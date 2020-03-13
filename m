Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1561846A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 13:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgCMMPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 08:15:38 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36394 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbgCMMPh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 08:15:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id g62so10057593wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bEk7S7Dnd0BzCyFDN1a5hqfpt0sia9NmxQj/OgqMtaY=;
        b=ivrnIzrtSb317R27s6UIuB8l1eRMFATY6xEueaZ9KFH+WmhD6bTED40vT+v2Iw+RIT
         +EVGP7Dblt0JJSWK97d1PnXU9wER9/oKLqyqwtD7B84efCSQtQCHA8jaJBpnSf66/qIY
         3HS86wRhMXfS7F4BHpu5Njizex3YV3/kwUq5iDgd/6OJ/vAh5NP7Z3VvwEC5UMeEIiyf
         vtvv1LEKrW/DZIVP6V+anPSt97bHI6iGJRqYCzc5ErM6NJmnZwMy0S9J79jfjq6IXtFj
         UcAVJXqKp5P/6bMtMdWPXl86CIF3O4K/FxOCeXjs1v1/ZrRN08Toh4KimCwUjhdsF8Bp
         BfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bEk7S7Dnd0BzCyFDN1a5hqfpt0sia9NmxQj/OgqMtaY=;
        b=M0MaYH1CB+eoVvIFHJlLN+c8fjv68Mp1mt1yM4FdO6r0jHUMUnNoHNjst7ddk8KBJ2
         j7JJdYO/Xar5y954c7XrfnS3Nf2L8OKLSaldDTVNf/xIKdvEiQ5LkZX2yrcOmpSfuO3B
         wO8dWn+pYUQwyDDErstHnIM4Kh7NInO5GpPe5Ek08rRhDlJkkIyy6a+n/3XoJJrq+ytp
         hTyhFPH7QTCc5J1T025o5Twe477aaYczLh8Si2mEMdDL2+PprKun3bhlvh2z5iY3TXbx
         wj/rGdJ5DmKKMMVmISI4V69JzSmXqvDNgVpGXHoSJkead7UpKgt4NWiM19rhDvBkolr+
         5EKg==
X-Gm-Message-State: ANhLgQ3KdniGE6p++MyOq2I+AJ+Vsr08COE43e2iZxV8j6O1QGs+yW/e
        oUhUlF6LKsStRg4DLyBGlX7LXg==
X-Google-Smtp-Source: ADFU+vsU8bP/cl627H526e80+fYdUA5wijE1PisL9EbmsVGYHyWfszDXSnlk7wtJ3xCHDtXQZgg1/Q==
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr10952728wmi.79.1584101735900;
        Fri, 13 Mar 2020 05:15:35 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id x9sm40720370wrx.0.2020.03.13.05.15.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 05:15:35 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 5/9] ASoC: qcom: q6asm-dai: add support to wma
 decoder
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
 <20200313101627.1561365-6-vkoul@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bb1923d8-8374-4e1b-e211-372406196e09@linaro.org>
Date:   Fri, 13 Mar 2020 12:15:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313101627.1561365-6-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/03/2020 10:16, Vinod Koul wrote:
> Qualcomm DSPs also supports the wma decoder, so add support for wma
> decoder and convert the snd_codec_params to qdsp format.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
>   1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 8f245d03b6f5..53c250778eea 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -627,10 +627,13 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   	int dir = stream->direction;
>   	struct q6asm_dai_data *pdata;
>   	struct q6asm_flac_cfg flac_cfg;
> +	struct q6asm_wma_cfg wma_cfg;
> +	unsigned int wma_v9 = 0;
>   	struct device *dev = c->dev;
>   	int ret;
>   	union snd_codec_options *codec_options;
>   	struct snd_dec_flac *flac;
> +	struct snd_dec_wma *wma;
>   
>   	codec_options = &(prtd->codec_param.codec.options);
>   
> @@ -692,6 +695,67 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   			return -EIO;
>   		}
>   		break;
> +
> +	case SND_AUDIOCODEC_WMA:
> +		wma = &codec_options->wma_d;
> +
> +		memset(&wma_cfg, 0x0, sizeof(struct q6asm_wma_cfg));
> +
> +		wma_cfg.sample_rate =  params->codec.sample_rate;
> +		wma_cfg.num_channels = params->codec.ch_in;
> +		wma_cfg.bytes_per_sec = params->codec.bit_rate / 8;
> +		wma_cfg.block_align = params->codec.align;
> +		wma_cfg.bits_per_sample = prtd->bits_per_sample;
> +		wma_cfg.enc_options = wma->encoder_option;
> +		wma_cfg.adv_enc_options = wma->adv_encoder_option;
> +		wma_cfg.adv_enc_options2 = wma->adv_encoder_option2;
> +
> +		if (wma_cfg.num_channels == 1)
> +			wma_cfg.channel_mask = 4; /* Mono Center */
> +		else if (wma_cfg.num_channels == 2)
> +			wma_cfg.channel_mask = 3; /* Stereo FL/FR */
> +		else
> +			return -EINVAL;
> +
> +		/* check the codec profile */
> +		switch (params->codec.profile) {
> +		case SND_AUDIOPROFILE_WMA9:
> +			wma_cfg.fmtag = 0x161;
> +			wma_v9 = 1;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA10:
> +			wma_cfg.fmtag = 0x166;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA9_PRO:
> +			wma_cfg.fmtag = 0x162;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA9_LOSSLESS:
> +			wma_cfg.fmtag = 0x163;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA10_LOSSLESS:
> +			wma_cfg.fmtag = 0x167;
> +			break;
> +
> +		default:
> +			dev_err(dev, "Unknown WMA profile:%x\n",
> +				params->codec.profile);
> +			return -EIO;
> +		}
> +
> +		if (wma_v9)
> +			ret = q6asm_stream_media_format_block_wma_v9(
> +					prtd->audio_client, &wma_cfg);
> +		else
> +			ret = q6asm_stream_media_format_block_wma_v10(
> +					prtd->audio_client, &wma_cfg);
> +		if (ret < 0) {
> +			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
> +			return -EIO;
> +		}
>   	default:
>   		break;
>   	}
> @@ -791,9 +855,10 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
>   	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
>   	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
>   	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
> -	caps->num_codecs = 2;
> +	caps->num_codecs = 3;
>   	caps->codecs[0] = SND_AUDIOCODEC_MP3;
>   	caps->codecs[1] = SND_AUDIOCODEC_FLAC;
> +	caps->codecs[2] = SND_AUDIOCODEC_WMA;
>   
>   	return 0;
>   }
> 
