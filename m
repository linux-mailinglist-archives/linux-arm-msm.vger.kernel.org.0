Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05C22C64D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 13:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbgK0MJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 07:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgK0MJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 07:09:56 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BDEC0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 04:09:56 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id m6so5335490wrg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Asqct0DSkmui/624U1aTT6HUn2Jr+y44t573X8ecn1I=;
        b=HD0g/xb6TLZtBPVVfmoTpSeb1IQLHkmwP9ZMYhDyLk6bMzNQBR7yjV522waHdonR5d
         eyUizTJEBAWsAIqaTrv0JY7FjHfAmsg/rozRl79/Y8wXJgfYFZhYsZACB1ZQNetmy2PE
         R3x+O0etGRUdcC732kOXg630hGy5sOkpvMnYEn/whuIjuSTFCf34crBSbEX4aucH4t1c
         F4yXxGxRFSEisgheuzx3ODNYfi83aUyhJJsF3pB7WkXVPh164D1zads/oTX0oDK5dQFG
         zLj2vIzAE97wgmBEUK5BDPCLYC3dV9vYws8kzzjDyfzPA+bLkq8Vkk/dlhj1qemuMGdP
         e8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Asqct0DSkmui/624U1aTT6HUn2Jr+y44t573X8ecn1I=;
        b=WL24d2JKLTcU2QJhRW2jV+FovWGCx+7pTfVDbIUa37/KerBun9eZIDetXSjSD7Kc3O
         Iu81pJTGIU8Q8BgMqNk2MipJOLQNhMd3WzKfMag0Xj2eXD/rFRNq/DU6bGd1oMauAZOO
         NYSbpigodW5NGOBWOlGAJy3TMcOgoOYltTWPOnwMJcLdMY6oFuNEAEI9D4M2B40XBkTo
         /BYC5Gh6BEH09huecPL3rxEGrmE2BZPr7nwsgYWY9XqoPjfnihAejTkXEDOW2RpuLTqR
         J/eJu8kZwfrqok4nfmV0HK9qPEFU+nrK1IaA9/vFARaWXtv7pJJdNpSDxB4Y3kLmbKsh
         01gQ==
X-Gm-Message-State: AOAM533y51IJF4psfKcb8exgrTx+1ZahGQTwSHvRZd3Ug4wu6e73uAMd
        fReG20j4onUaRjeM2HmcV5uhMg==
X-Google-Smtp-Source: ABdhPJwk9Q/m7ZsZoPuHbodu+4dr0DtmJ92+OAyIXQLH3mTtHoc3PFsRMoMDRX7Ioh6bQJX2nHIWPg==
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr9907638wro.184.1606478994658;
        Fri, 27 Nov 2020 04:09:54 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id t20sm13916831wmi.3.2020.11.27.04.09.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Nov 2020 04:09:53 -0800 (PST)
Subject: Re: [PATCH v3] ASoC: qcom: Fix playback recover problem in suspend
 resume
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1146040c-5559-f4bf-fafe-eb7468e577a0@linaro.org>
Date:   Fri, 27 Nov 2020 12:09:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27/11/2020 09:56, Srinivasa Rao Mandadapu wrote:
> To support playback continuation after hard suspend(bypass powerd)
>   and resume:
> Prepare device in  platform trigger callback.
> Make I2s and DMA control registers as non volatile.
Looks like there are two changes here, One is fixing the volatile registers!


Other is preparing device after suspend!

Consider splitting them!

> 

Fixes tag is missing here?

> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes Since v1 and v2:
>    -- Subject lines changed
> 
>   sound/soc/qcom/lpass-cpu.c      | 8 ++------
>   sound/soc/qcom/lpass-platform.c | 5 +++--
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af684fd..c99be03 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -454,20 +454,16 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
>   	struct lpass_variant *v = drvdata->variant;
>   	int i;
>   
> -	for (i = 0; i < v->i2s_ports; ++i)
> -		if (reg == LPAIF_I2SCTL_REG(v, i))
> -			return true;
>   	for (i = 0; i < v->irq_ports; ++i)
>   		if (reg == LPAIF_IRQSTAT_REG(v, i))
>   			return true;
>   
>   	for (i = 0; i < v->rdma_channels; ++i)
> -		if (reg == LPAIF_RDMACURR_REG(v, i) || reg == LPAIF_RDMACTL_REG(v, i))
> +		if (reg == LPAIF_RDMACURR_REG(v, i))
>   			return true;
>   
>   	for (i = 0; i < v->wrdma_channels; ++i)
> -		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start) ||
> -			reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
> +		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
>   			return true;
>   
>   	return false;
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 80b09de..2b0a7c1 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -481,8 +481,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   		return -ENOTRECOVERABLE;
>   	}
>   	switch (cmd) {
> -	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
> +		lpass_platform_pcmops_prepare(component, substream);

Can you elaborate the actual issue here?

Are any other registers needs to re-programmed??

Does it make sense to use
regcache_mark_dirty()
regcache_sync() in pm suspend resume path,
instead of calling prepare explicitly?


--srini


> +	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>   		ret = regmap_fields_write(dmactl->enable, id,
>   						 LPAIF_DMACTL_ENABLE_ON);
> @@ -592,7 +593,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
> 
