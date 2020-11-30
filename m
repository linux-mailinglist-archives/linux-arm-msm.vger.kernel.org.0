Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD982C8315
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 12:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgK3LUD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 06:20:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbgK3LUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 06:20:02 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3B7C0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:19:16 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id x22so18042676wmc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kA1B+3YWtsqZLdoP/PFm3M4IJcbU3ZY5uXa3zxL9D5U=;
        b=kXGC/hkXw3WUjUW8dyzi+KxMgQfPrY9PpqKHsi6N9ndZtsG6e1wl8Up32s/Q/MNzp/
         TG9HDjXySSC8sE2voSaQHmDaGs9ApE6cX2ZNK53ZPBiJ241946+2OdCXXwPPnyrB2g+I
         28BidxQ1k8Au44U2UvYUWh31ljl4YB44MmNzpBNIHXAKL2MNDa3DHBIzbXfbexLzRLoV
         LZWfLOWLBxWYNWAFbrN54yQ203hMABfhBDAabKVsALajqJXsZNN2leThKFjssZbpiSiw
         Z+c5ECJwrCHcsmjolzUkNOdA8OGjcKfgivWeo2E9oLtTVUs9KWRQwfWxaBSN1NwZ9fYe
         bEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kA1B+3YWtsqZLdoP/PFm3M4IJcbU3ZY5uXa3zxL9D5U=;
        b=HsO6AyS7VXIHl0f3rZbdCrfHUWGgIu3Fy9WTeIS6O6H6jgYke7Wc++bvxNhY2Zoj2q
         GaEEDldZkg92lsUEDafQXgfewDYfzLIgMh6taEEv6YorFGymziJoVJDYpySconXiFyqO
         r9MgBirBtNPgwG+i93gnhMonzWEs5SoAYup+ZF1EC28fnoDYvRMHB5uV3qEBnFsBK1Yq
         C9loDfCyS5OiFDFp2VVv3e5Ndyw8XLktrXtIq78RPB5xgQyJwilmVdKEFGctYFsxtLde
         c0fTBmalz0ryEvM6KIO5a7zydq9W4pO+rO2pQNkhRXaO80itU5g65XzI4z3uUzhXOKob
         X3dA==
X-Gm-Message-State: AOAM533/Hw+PJe4clmRZ/kc9yoXfOsKPhlma8vzFAKtJ5MNGEgTyO/pZ
        9yywyRMpN/sQbH9IGRGFauEJbA==
X-Google-Smtp-Source: ABdhPJx7hVSTJ3o2Q+DoAP6jkZgpwx9aW3qQbrc5tsnfxpODLxn1PpVJnz6LFK/zs2NdbZFgj3iJPw==
X-Received: by 2002:a1c:4802:: with SMTP id v2mr14690593wma.13.1606735155159;
        Mon, 30 Nov 2020 03:19:15 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id j14sm26432119wrs.49.2020.11.30.03.19.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 03:19:14 -0800 (PST)
Subject: Re: [PATCH v4 2/2] ASoC: qcom: Add support for playback recover after
 resume
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-3-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <76b8d52f-4f54-734f-683a-72fe62fdd8e4@linaro.org>
Date:   Mon, 30 Nov 2020 11:19:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1606539559-4277-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/11/2020 04:59, Srinivasa Rao Mandadapu wrote:
> To support playback continuation after hard suspend(bypass powerd)
> and resume add component driver ops and do regcache sync.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/qcom/lpass-platform.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0e71899..12764a8 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -827,6 +827,39 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
>   	}
>   }
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
>   static const struct snd_soc_component_driver lpass_component_driver = {
>   	.name		= DRV_NAME,
>   	.open		= lpass_platform_pcmops_open,
> @@ -839,6 +872,8 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>   	.mmap		= lpass_platform_pcmops_mmap,
>   	.pcm_construct	= lpass_platform_pcm_new,
>   	.pcm_destruct	= lpass_platform_pcm_free,
> +	.suspend		= lpass_platform_pcmops_suspend,
> +	.resume			= lpass_platform_pcmops_resume,
>   
>   };
>   
> 
