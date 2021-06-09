Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA753A15AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 15:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbhFINek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 09:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235173AbhFINej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 09:34:39 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1CCC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 06:32:31 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i94so20475474wri.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=lUdke6htwmhA5dwmH5nqrl72FFCl9nDLwry0d6NYq10=;
        b=R8mGoDMwBBV4hbsRgCugAOZRINIEA08feaDk66tA1/lvBXWu/S4mRWoZjlLTMQUcZb
         B8+GK7X12x72JgBelnNELBMtYhTs4wrfoQDGA/Pzy+e5QoYH4e5G0JJpPwKEp1gn7QPA
         JR8mJ9uO0uI17pQoEOzhV6Hp0ubeniwuLMc/BdnbdXiZgLA6EO9I4ziIrnSWDn3h1nK2
         eljT/7K45PN6HgdIetUOoiIbNLJ0tthL1GCmIrOpOQS/umywKSxrGq1FbEpazIafkUkx
         gFaDXtSIEFArgmBZRXSkSaJvnZE6tb2BsLMBxTNXEmgAR2RbKsl6FC08bkKGqZQOkmfo
         D+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lUdke6htwmhA5dwmH5nqrl72FFCl9nDLwry0d6NYq10=;
        b=ecEpId+QVlZ/I6h8reUxSbD9H550s8UQjvsHG2SkElcrg9Mt18e8KBsZUw5eLt/py4
         +Xe0hzlWvKBRj6mDqduX3U/7NEUb8AjdlIhzFzw3wDZGMVCi78Prepm3X0dHaT1zBlXb
         iwSmYryNvsfmS7mkLAHHri37DR9j/0zIqeB/bw7VFt1pJDAlUgbtWcm+PWpbpF7q9yad
         m4xLGP7y5mwTZjZ1mHe6eevelFsjZg4/N8LK5mvRRINBzQCnXl0HIZc8DR1VK5Lu/2mM
         e/Ycx1Bq+OWL5wQzhnMJxq8+P6vMYs13q8/gdagL4Y9LvS6v3xInWJtgc11Ae2QXW159
         vaPQ==
X-Gm-Message-State: AOAM531a5m0v50UYbHomJarM4igUwf6BTsGh2Vb9NS2rq6T5wM60lucx
        LrrqsEfnJWRgh9r9i1Fk0cKKdg==
X-Google-Smtp-Source: ABdhPJxsmddMb8dvO3dYf14XNfU0myBP9qEVALchMojRiPg7w1K9x7FqpVtDhdvheKH6YNVjevxE0w==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr18312086wrr.292.1623245550059;
        Wed, 09 Jun 2021 06:32:30 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id v18sm26112965wrb.10.2021.06.09.06.32.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 06:32:29 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: qcom: Add four speaker support on MI2S secondary
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210609133039.4648-1-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c2ab81bc-98e8-e833-a8cc-7176ff03809c@linaro.org>
Date:   Wed, 9 Jun 2021 14:32:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210609133039.4648-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/06/2021 14:30, Srinivasa Rao Mandadapu wrote:
> Add four speaker support on MI2S secondary block
> by using I2S SD1 line on gpio52 pin, and add channel map
> control support in the lpass-cpu audio driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



--srini
> Changes Since V2:
> 	-- Added empty entry at the end of channel maps array.
> Changes Since V1:
> 	-- removed set_channel_map/get_channel_map implementation as default kcontrols
> 		added in pcm_new API.
>   sound/soc/qcom/lpass-cpu.c    | 33 +++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-sc7180.c |  1 +
>   sound/soc/qcom/lpass.h        |  2 ++
>   3 files changed, 36 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..aff39c9f6326 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -29,6 +29,15 @@
>   #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
>   
> +/*
> + * Channel maps for Quad channel playbacks on MI2S Secondary
> + */
> +static struct snd_pcm_chmap_elem lpass_quad_chmaps[] = {
> +		{ .channels = 4,
> +		  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL,
> +				SNDRV_CHMAP_FR, SNDRV_CHMAP_RR } },
> +		{ }
> +};
>   static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>   			struct lpaif_i2sctl *i2sctl, struct regmap *map)
>   {
> @@ -324,6 +333,25 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>   
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +				struct snd_soc_dai *dai)
> +{
> +	int ret;
> +	struct snd_soc_dai_driver *drv = dai->driver;
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	if (drvdata->mi2s_playback_sd_mode[dai->id] == LPAIF_I2SCTL_MODE_QUAD01) {
> +		ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +				lpass_quad_chmaps, drv->playback.channels_max, 0,
> +				NULL);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
> +
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> @@ -856,6 +884,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>   			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>   		}
> +		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
> +			LPAIF_I2SCTL_MODE_QUAD01) {
> +			variant->dai_driver[dai_id].playback.channels_min = 4;
> +			variant->dai_driver[dai_id].playback.channels_max = 4;
> +		}
>   	}
>   
>   	/* Allocation for i2sctl regmap fields */
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 8c168d3c589e..77a556b27cf0 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -58,6 +58,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
>   		},
>   		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
>   		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
> +		.pcm_new = lpass_cpu_pcm_new,
>   	}, {
>   		.id = LPASS_DP_RX,
>   		.name = "Hdmi",
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 83b2e08ade06..623ddccdafff 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -259,5 +259,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +				struct snd_soc_dai *dai);
>   
>   #endif /* __LPASS_H__ */
> 
