Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC15D2B956C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 15:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgKSOpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 09:45:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbgKSOpR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 09:45:17 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CACC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 06:45:16 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so6990713wme.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 06:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jFYDkK+9+9rtp4yicJead5iuEA75yIxa6yds7cG1Fi8=;
        b=Z7aZA1OAXc4Ng4OopJU87r9TmN7qyRblJJ6G1fuHBmlPvP0xHar7CSA8UyY3XqtKO9
         LKaeEnDw7O1f5uxm1qdWTBdgMEmLLAjVV1GTvgPqBUjQmC6Afu+tIOi0G/h+WOeiPeHV
         Ywpqho3n1vR7KF1mhLlAxRL2xaOHIw0dj7uL1U5L9UjTrCOoLMdGW+zpQgS4bxMhNOSM
         mOskM+Yv2e0MlI69XyUFA6nGicbLd1K8Ix1QLIZqPQO20HIzqK6aNi8vdUjXOEVwTzP2
         EcaVxOcNycpkiI7I76X0wnLUy5j155TiftWF1JxmHjveNukbYuiBFoYlX98EpJBiLUuo
         tQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jFYDkK+9+9rtp4yicJead5iuEA75yIxa6yds7cG1Fi8=;
        b=UByyaA/MzkZ7RfnZOhVnArZu4hQx6MnPIAu3eQnm/juiYNgNit99BXmQR/I/Dallve
         peBjm5nOnVL7EwM9Db/KUM19gzGUbY5QiqPXbASSmErkgiJpLZWcJG5rkKbXi2lYMPkW
         aNlVDnc5GNYhHOjl7LQZFPmRkiX1NXCmzi1lZUxopwnZXklxfTU/XkD6dwGgkuvWJdL4
         e3keUo6Kb7e64JE4vWW/LB7VqXmZuVQ/+MzL87Jh1d11I5YBOFXgZg76RD1RpLthb+ku
         luqWL3oOSJJVHm/N7mu9rCNOjq0pHiCxi5mM8BUBkp9ZgnEv3CAKcCsjXEuGNAcWkEfy
         PGEQ==
X-Gm-Message-State: AOAM532AujxG/U+gWPmeoMxrmvtxamXTgCWZgTWQc76N/eA4iTc4fJ8S
        IvR6FqGx5nxFZKexFhl+FmSD+wac4JLwjbwd
X-Google-Smtp-Source: ABdhPJzit2MRl9F+dgB+mIICFCBRyTGiTGsg97qsv99NEkJnLL2IVy7VbD37fNSiLgsMKUccG7uriQ==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr4866098wmc.36.1605797114545;
        Thu, 19 Nov 2020 06:45:14 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id n123sm73946wmn.38.2020.11.19.06.45.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 06:45:13 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: sm8250: fix HDMI audio playback
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
References: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <72b89b80-d548-4f4d-2da6-a83fd723366e@linaro.org>
Date:   Thu, 19 Nov 2020 14:45:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19/11/2020 12:31, Dmitry Baryshkov wrote:
> Current code does not setup CPU dai (causing -EIO errors on playback)
> and does not pass SND_SOC_DAIFMT_I2S to codec fmt (causing i2s-hifi
> errors). Fix both errors to enable HDMI audio playback on SM8250. Tested
> on RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


Thanks for the Patch, Looks good to me!

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/sm8250.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 35c9ad11edff..314e3e566d6d 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -36,6 +36,7 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   
>   static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>   {
> +	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
>   	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>   	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> @@ -43,10 +44,11 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>   
>   	switch (cpu_dai->id) {
>   	case TERTIARY_MI2S_RX:
> -		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF;
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>   		snd_soc_dai_set_sysclk(cpu_dai,
>   			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
>   			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
>   		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>   		break;
>   	default:
> 
