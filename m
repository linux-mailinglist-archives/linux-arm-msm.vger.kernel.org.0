Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E28C2C8977
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgK3Q1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728813AbgK3Q1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:27:14 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0FBC0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:26:34 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id y74so14735391oia.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=F3m5K07V7x+E6f1xv0bjhonSW/caxdpgnGkGkW9b17E=;
        b=HEpCq6mSJ3mx75Dyowg0APr/0vUer2HMBlpDXN++WEFjEUdN3Lz93+Usi89fYoxZYh
         Lqbz3I6a+3be8GjWwmfBEPApIts95KtG+mGEz9VfibdGxVl+SWfW0xkMCCvJKr/W83mo
         VYHuuwOX7pqEXHu0Mk27luH7nae8RBYwvnSmISW46O7toWLTPL/uclo5ntdlyLNRV48P
         8a3EFNaLEYCMokVrBnEUQ9xmweYWad9LfXJizo/vZFGNQGbac36WPF40vLozwD5bRKsh
         FdZRKHOEfKFjUrRr8Z7haphQLpyC9KProEMvthcMLxGy7mrcdb5lKEnzgaRD6v6AwXUy
         wkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=F3m5K07V7x+E6f1xv0bjhonSW/caxdpgnGkGkW9b17E=;
        b=G0ONC92rg4IIP7UqvKNQINuw+IU26Q5BBL4PQKnL8DEKVnFd81TUffttVYFSbEWeoR
         D1impGoID0I/O5eCjmDv0h4S1z66iNYSbJRmiT0D35u5lyTQ/2B6A3QyW2kkcECIwTj6
         FJJaVn3ljUEQY/zd9WsHa8MCBjmxRQMTN5iJykvJI0RLCcS0eHQYn+ACjPiK4g4k48Sd
         BZ6vDOfyQC7UmaFQm54sDYcHsy/nO4o1cUqjDkTsMrPoMXYylCU2fP+App+vXRh9FyWS
         /ADTntZ5IXaxClxJPrk/UfLWmpm5Mzyo2y93sAvQquylRNRkli7FLt0suMbRDkc+0Ptb
         q/5Q==
X-Gm-Message-State: AOAM531f2A+hSJ5SY9iA4DrNMB0lTcVySmH9+3WYEx5UnOmfSOih/qjh
        nI0sL7dFKVYrv/n/sc8YCrFzUg==
X-Google-Smtp-Source: ABdhPJxPSZTF380ca194SwOsiCnSZzNZOgv1w0h1Evaq9a8BGsa3rk5/2aEqNLzVG1e3ZvHprG+kjA==
X-Received: by 2002:aca:d706:: with SMTP id o6mr15162748oig.28.1606753593951;
        Mon, 30 Nov 2020 08:26:33 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id i1sm9854541ool.43.2020.11.30.08.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:26:33 -0800 (PST)
Subject: Re: [PATCH v4 2/2] ASoC: qcom: Add support for playback recover after
 resume
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-3-git-send-email-srivasam@codeaurora.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <938cb2c1-daed-e322-ca8a-06b54ebb35ff@kali.org>
Date:   Mon, 30 Nov 2020 10:26:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1606539559-4277-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/27/20 10:59 PM, Srinivasa Rao Mandadapu wrote:
> To support playback continuation after hard suspend(bypass powerd)
> and resume add component driver ops and do regcache sync.
>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  sound/soc/qcom/lpass-platform.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0e71899..12764a8 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -827,6 +827,39 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
>  	}
>  }
>  
> +static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
> +{
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct regmap *map;
> +	unsigned int dai_id = component->id;
> +
> +	if (dai_id == LPASS_DP_RX)
> +		map = drvdata->hdmiif_map;
> +	else
> +		map = drvdata->lpaif_map;
> +
> +	regcache_cache_only(map, true);
> +	regcache_mark_dirty(map);
> +
> +	return 0;
> +}
> +
> +static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
> +{
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct regmap *map;
> +	unsigned int dai_id = component->id;
> +
> +	if (dai_id == LPASS_DP_RX)
> +		map = drvdata->hdmiif_map;
> +	else
> +		map = drvdata->lpaif_map;
> +
> +	regcache_cache_only(map, false);
> +	return regcache_sync(map);
> +}
> +
> +
>  static const struct snd_soc_component_driver lpass_component_driver = {
>  	.name		= DRV_NAME,
>  	.open		= lpass_platform_pcmops_open,
> @@ -839,6 +872,8 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>  	.mmap		= lpass_platform_pcmops_mmap,
>  	.pcm_construct	= lpass_platform_pcm_new,
>  	.pcm_destruct	= lpass_platform_pcm_free,
> +	.suspend		= lpass_platform_pcmops_suspend,
> +	.resume			= lpass_platform_pcmops_resume,
>  
>  };
>  

Tested this series on a Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>


