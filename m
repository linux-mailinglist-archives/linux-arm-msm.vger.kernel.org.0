Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4013393EDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 10:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhE1IiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 04:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhE1IiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 04:38:13 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4726C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 01:36:38 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q5so2449378wrs.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=V03u/XyZi3pPuRX5LQlb8QPL3m3IaEUB6/fHYvwS6Eg=;
        b=IhPoCNOaFrHxImotr9rEePvVlb9Wt/uvzpY2poaWhCt0r8hA6Y0EUpjovO7BH5iPkL
         EDruzLmZfJcc+Ax2OuQxn5rrAHPE+erAFE2eGQmjRta5x//cPJc9xBPvRGojfScEexB+
         P1lxEhrFkPn7ZfpLVBo8UQkImc6Lt2Acvc9y2h1xgFFVjESwi7+Qvap2ONNcVm8UArlm
         HMPD4aIm6IYjgSbHN2h9KS1zRet1LsGNcY+QU+ytBeP/aohjlA/wv19rd8rUY70JJHVI
         Z8t7NJ2+cM7Y43F9Fw3Rzgr40QvQyrFIpJ1GJhv9UrH9T3D7zcyDC/jCVz0lm6maN8mW
         ktpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V03u/XyZi3pPuRX5LQlb8QPL3m3IaEUB6/fHYvwS6Eg=;
        b=cITs/zuwho4u4c8bnK05hMm5qtsV0isCLOtS5B3ZQIGr+j4RdlDieGUMI8gwandi1L
         eWEnS96aGx0H8XDS/TyRrSwgVOQW8vE4e3/e/iZURcXzDv+084a0wgvRv+hnz6lGTScY
         onvTUfdR21zD3SdJs97mSHjoH1jNbhVChM72F5YPztBtAC1olmhe5MkgCgEBe00DOUl8
         KFQS6CIUiz8e+dEBOe21ouqssV83WqW9RqouaYM+ihS/klEmXRJAdAY18kfkRajNZ1Mb
         pb2EC2XfeMrw/kDABdxMImjCHbi0UrSvXqRLcC5qT88zeYVHuNgNdbQypx0961ZX68Dt
         KRVA==
X-Gm-Message-State: AOAM531QmOd3CEmzX3H+ajLJf8LOv2ARCB9GaJebBv6A32zDzggcC/dh
        L2xehHuIwoH15tjsSR7Zx0AmrA==
X-Google-Smtp-Source: ABdhPJw6ASwJx8tFWYm7xXzM/CV0saZMtFH4llkM7XlWYPBuT3XmqhTIKbzhkmMQWzeXk0irJ/RScA==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr7537375wrq.356.1622190997481;
        Fri, 28 May 2021 01:36:37 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id s2sm11785217wmc.21.2021.05.28.01.36.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 May 2021 01:36:36 -0700 (PDT)
Subject: Re: [PATCH] Asoc: qcom: Add four speaker support on MI2S secondary
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210527073309.28661-1-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <213e1133-0164-03da-1740-c7ca39f3fd8c@linaro.org>
Date:   Fri, 28 May 2021 09:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210527073309.28661-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srinivasa,

On 27/05/2021 08:33, Srinivasa Rao Mandadapu wrote:
> Add four speaker support on MI2S secondary block
> by using I2S SD1 line on gpio52 pin, and add channel map
> control support in the lpass-cpu audio driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c    | 106 +++++++++++++++++++++++++++++++++-
>   sound/soc/qcom/lpass-sc7180.c |   1 +
>   sound/soc/qcom/lpass.h        |   5 ++
>   3 files changed, 111 insertions(+), 1 deletion(-)
> 

This patch looks totally redundant to set_channel_map/get_channel_map 
implementation. You should probably consider adding that support to the 
qcom_lpass_cpu_dai_ops. And let the machine driver set the channel map.

--srini

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..88a038a107a7 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -28,6 +28,19 @@
>   #define LPASS_CPU_I2S_SD2_3_MASK	GENMASK(3, 2)
>   #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
> +#define LPASS_CHMAP_IDX_UNKNOWN		-1
> +
> +/*
> + * Channel maps for multi-channel playbacks on MI2S Secondary, up to 4 n_ch
> + */
> +static struct snd_pcm_chmap_elem lpass_chmaps[] = {
> +	{ .channels = 2,
> +	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
> +	{ .channels = 4,
> +	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
> +				SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
> +	{ }
> +};
>   
>   static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>   			struct lpaif_i2sctl *i2sctl, struct regmap *map)
> @@ -86,6 +99,9 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
>   		clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>   		return ret;
>   	}
> +	if (drvdata->chmap_info && drvdata->chmap_info->max_channels == 4)
> +		drvdata->chmap_info->chmap = lpass_chmaps;
> +
>   	return 0;
>   }
>   
> @@ -96,6 +112,7 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>   
>   	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>   	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
> +	drvdata->chmap_idx = LPASS_CHMAP_IDX_UNKNOWN;
>   }
>   
>   static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
> @@ -224,9 +241,14 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   				ret);
>   			return ret;
>   		}
> -		if (channels >= 2)
> +		if (channels >= 2) {
>   			ret = regmap_fields_write(i2sctl->spkmono, id,
>   						 LPAIF_I2SCTL_SPKMONO_STEREO);
> +			if (channels == 4)
> +				drvdata->chmap_idx = 1;
> +			else
> +				drvdata->chmap_idx = 0;
> +		}
>   		else
>   			ret = regmap_fields_write(i2sctl->spkmono, id,
>   						 LPAIF_I2SCTL_SPKMONO_MONO);
> @@ -324,6 +346,84 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>   
> +static int lpass_cpu_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned const char *map;
> +	unsigned int i;
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct lpass_data *drvdata = info->private_data;
> +
> +	if (info->max_channels == 2)
> +		map = &lpass_chmaps[0].map[0];
> +	else if (info->max_channels == 4)
> +		map = &lpass_chmaps[1].map[0];
> +
> +	for (i = 0; i < info->max_channels; i++) {
> +		if (drvdata->chmap_idx == LPASS_CHMAP_IDX_UNKNOWN)
> +			ucontrol->value.integer.value[i] = 0;
> +		else
> +			ucontrol->value.integer.value[i] = map[i];
> +	}
> +
> +	return 0;
> +}
> +
> +static int lpass_cpu_chmap_ctl_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int i;
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct lpass_data *drvdata = info->private_data;
> +	unsigned char *map;
> +
> +	if (info->max_channels == 2)
> +		map = &lpass_chmaps[0].map[0];
> +	else if (info->max_channels == 4)
> +		map = &lpass_chmaps[1].map[0];
> +
> +	for (i = 0; i < info->max_channels; i++) {
> +		if (drvdata->chmap_idx == LPASS_CHMAP_IDX_UNKNOWN)
> +			map[i] = 0;
> +		else
> +			map[i] = ucontrol->value.integer.value[i];
> +	}
> +
> +	return 0;
> +}
> +
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +			      struct snd_soc_dai *dai)
> +{
> +	int ret;
> +
> +	struct snd_soc_dai_driver *drv = dai->driver;
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +			snd_pcm_alt_chmaps, drv->playback.channels_max, 0,
> +			&drvdata->chmap_info);
> +	if (ret < 0)
> +		return ret;
> +
> +
> +	/*
> +	 * override handlers
> +	 */
> +	drvdata->chmap_info->private_data = drvdata;
> +	drvdata->chmap_info->kctl->get = lpass_cpu_chmap_ctl_get;
> +	drvdata->chmap_info->kctl->put = lpass_cpu_chmap_ctl_set;
> +
> +	/*
> +	 * default chmap supported is stereo
> +	 */
> +	drvdata->chmap_info->chmap = lpass_chmaps;
> +	drvdata->chmap_idx = LPASS_CHMAP_IDX_UNKNOWN;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
> +
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> @@ -856,6 +956,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>   			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>   		}
> +		if (drvdata->mi2s_playback_sd_mode[dai_id] == LPAIF_I2SCTL_MODE_QUAD01) {
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
> index 83b2e08ade06..fb82591d550c 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -76,6 +76,9 @@ struct lpass_data {
>   	/* regmap backed by the low-power audio interface (LPAIF) registers */
>   	struct regmap *lpaif_map;
>   	struct regmap *hdmiif_map;
> +	struct snd_pcm_chmap *chmap_info;
> +
> +	int chmap_idx;
>   
>   	/* interrupts from the low-power audio interface (LPAIF) */
>   	int lpaif_irq;
> @@ -259,5 +262,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +				struct snd_soc_dai *dai);
>   
>   #endif /* __LPASS_H__ */
> 
