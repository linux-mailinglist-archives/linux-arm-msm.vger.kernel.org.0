Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF63545A290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 13:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236458AbhKWMbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 07:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbhKWMbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 07:31:34 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE76C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:26 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u18so38684035wrg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y+2dhMLktqLvGFcZL0JfDpP42kgRWTSwc0iWLEbRGpY=;
        b=dPMOMM5MzAt9NPK2WuyYvIVUKazML1VSHPp1rShpjjhhvTLE1gPGoSk74ea3wtM7aW
         oZcxFsNL/auXt6RmSrYbc8u2rUGKNxhGEmeWwnaNasf39Z3Jm3zt6LhrKZNopa9aJpIr
         nPPrGN2VXetY3nSOsfpjic8ZXeBYc3vG2zRglWLMmiYrEJwf/L57hSffW2AVhWfvtj9f
         DM9ZbvjtMEqucwNSOdKCXJ5UeQv7Qzp7Sj6U6iMADSqxzgWoS54Nd3HXXMJyEU1AMYYu
         /96o+HvVYfY18KMt/M6y85YxAnakoB6H5ny5vSbTmYhRBZdSPTJPH49SHpIMvoZz/BGe
         IC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y+2dhMLktqLvGFcZL0JfDpP42kgRWTSwc0iWLEbRGpY=;
        b=R8co09wnRRtc4APjQ8sMpPinHUW2iyD7udv64YrjZ6CrIb4so5L3PE65PVqwexohT1
         Ofij/JAv2fFlYuOaja/74kl/FkCKNdW18lJeGJI+QlSdpXpqU8MBHu0FGoBaBvFr/SUI
         j+eIz45rN12UqQPQ25ASZaZceqX65sBZM/n6GOKXWN1NxJ/xI6vupga4iE4qjQexGhrI
         rcxh2SQ0XaLREZciWe4HpGhtxgHWB8f95YygPBOxkPNWfKr43Ctu0TanZde+vhiVAZ4z
         a0TmhUIoGFoETE/9LIjfQ60k/AA/OMCW2PPdsThBj3TX7H55SfTjIT2WClhXp8v+p3EB
         RavQ==
X-Gm-Message-State: AOAM532J5M9BTYkJMWWvVvXX55SE5d9AZ82Prf2wxMy84esJ0EBu8rMl
        JnQEgDn0PRaMQlKzAmnowYcSLQ==
X-Google-Smtp-Source: ABdhPJyWHwpcLjAmX6aVef1dpIvIvbPsAlkjt+u1X+nUahCtZKqq61o/QkVDbMLaTxFFYqkhdIzdsA==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr6836933wrj.84.1637670504721;
        Tue, 23 Nov 2021 04:28:24 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id q24sm978561wmj.21.2021.11.23.04.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:28:24 -0800 (PST)
Subject: Re: [PATCH v5 05/10] ASoC: qcom: Add helper function to get dma
 control and lpaif handle
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5ddc2e60-7145-9579-3f33-91807109ec80@linaro.org>
Date:   Tue, 23 Nov 2021 12:28:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/11/2021 11:46, Srinivasa Rao Mandadapu wrote:
> Add support function to get dma control and lpaif handle to avoid
> repeated code in platform driver
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>

Few minor Nits, but overall it looks good to me.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 90 ++++++++++++++++++++---------------------
>   1 file changed, 43 insertions(+), 47 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index a44162c..59c0884 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -177,6 +177,44 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> +static void __get_lpaif_handle(struct snd_pcm_substream *substream,
> +				struct snd_soc_component *component,
> +				struct lpaif_dmactl **dmactl, int *id, struct regmap **map)
Same indentation is off here.

> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct snd_pcm_runtime *rt = substream->runtime;
> +	struct lpass_pcm_data *pcm_data = rt->private_data;
> +	struct lpass_variant *v = drvdata->variant;
> +	int dir = substream->stream;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	struct lpaif_dmactl *l_dmactl;
> +	struct regmap *l_map;
> +	int l_id;
> +
> +	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> +		l_id = pcm_data->dma_ch;
> +		if (dai_id == LPASS_DP_RX) {
> +			l_dmactl = drvdata->hdmi_rd_dmactl;
> +			l_map = drvdata->hdmiif_map;
> +		} else {
> +			l_dmactl = drvdata->rd_dmactl;
> +			l_map = drvdata->lpaif_map;
> +		}
> +	} else {
> +		l_dmactl = drvdata->wr_dmactl;
> +		l_id = pcm_data->dma_ch - v->wrdma_channel_start;
> +		l_map = drvdata->lpaif_map;
> +	}
> +	if (dmactl)
> +		*dmactl = l_dmactl;
> +	if (id)
> +		*id = l_id;
> +	if (map)
> +		*map = l_map;
> +}
> +
>   static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   					   struct snd_pcm_substream *substream,
>   					   struct snd_pcm_hw_params *params)
> @@ -191,22 +229,12 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   	unsigned int channels = params_channels(params);
>   	unsigned int regval;
>   	struct lpaif_dmactl *dmactl;
> -	int id, dir = substream->stream;
> +	int id;
>   	int bitwidth;
>   	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -		id = pcm_data->dma_ch;
> -		if (dai_id == LPASS_DP_RX)
> -			dmactl = drvdata->hdmi_rd_dmactl;
> -		else
> -			dmactl = drvdata->rd_dmactl;
> -
> -	} else {
> -		dmactl = drvdata->wr_dmactl;
> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
> -	}
> +	__get_lpaif_handle(substream, component, &dmactl, &id, NULL);
error handling is missing.

>   
>   	bitwidth = snd_pcm_format_width(format);
>   	if (bitwidth < 0) {
> @@ -379,24 +407,9 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>   	int ret, id, ch, dir = substream->stream;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -
>   	ch = pcm_data->dma_ch;
> -	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -		if (dai_id == LPASS_DP_RX) {
> -			dmactl = drvdata->hdmi_rd_dmactl;
> -			map = drvdata->hdmiif_map;
> -		} else {
> -			dmactl = drvdata->rd_dmactl;
> -			map = drvdata->lpaif_map;
> -		}
> -
> -		id = pcm_data->dma_ch;
> -	} else {
> -		dmactl = drvdata->wr_dmactl;
> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
> -		map = drvdata->lpaif_map;
> -	}
>   
> +	__get_lpaif_handle(substream, component, &dmactl, &id, &map);
>   	ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
>   				runtime->dma_addr);
>   	if (ret) {
> @@ -444,26 +457,12 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   	struct lpaif_dmactl *dmactl;
>   	struct regmap *map;
>   	int ret, ch, id;
> -	int dir = substream->stream;
>   	unsigned int reg_irqclr = 0, val_irqclr = 0;
>   	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
>   	ch = pcm_data->dma_ch;
> -	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -		id = pcm_data->dma_ch;
> -		if (dai_id == LPASS_DP_RX) {
> -			dmactl = drvdata->hdmi_rd_dmactl;
> -			map = drvdata->hdmiif_map;
> -		} else {
> -			dmactl = drvdata->rd_dmactl;
> -			map = drvdata->lpaif_map;
> -		}
> -	} else {
> -		dmactl = drvdata->wr_dmactl;
> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
> -		map = drvdata->lpaif_map;
> -	}
> +	__get_lpaif_handle(substream, component, &dmactl, &id, &map);
>   
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
> @@ -597,10 +596,7 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -	if (dai_id == LPASS_DP_RX)
> -		map = drvdata->hdmiif_map;
> -	else
> -		map = drvdata->lpaif_map;
> +	__get_lpaif_handle(substream, component, NULL, NULL, &map);
>   
>   	ch = pcm_data->dma_ch;
>   
> 
