Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BB7219C16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgGIJ07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 05:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgGIJ05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 05:26:57 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7169CC061A0B
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 02:26:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k6so1594292wrn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=JuVldso0paiNNpeE70aXiVIuVBVXq7NnaalWLtsPgyE=;
        b=g2zrbbiMh28zWxhvEovTQYbOYxVRKRvkFEi4eapb32r0DnhM6oH8wI7UVR2op/IqOk
         3bdOxUieThL0mqwx7uJARmPUSX+f11egsFQjSP8YsFWhfVBIKWVG8dxugmLZWOAuEnk/
         HurqBQ9uWhtxkfx0fa8yuJb3tBbiuPbxf0YwLs5dg53oHUIR+mPMuo9gX+TfbVHEERP5
         RAfvYzAvH0X/VSIITS28pFNyo+K7ERIYPQUO6U8sudjkR/EDZdIe6zZ/xvJ8xbzA7zms
         L4HUTUDMNxlPQ7RfOLYVbM4BrY/6QWspJLOZTQ28E28YQCktwoBq6PDMWOwzuB3OMiZd
         SV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JuVldso0paiNNpeE70aXiVIuVBVXq7NnaalWLtsPgyE=;
        b=uGNuQF0J+F9rj3w4NTzJ9E8iuOUW5IUy9u1rU8ucquX88kjLI8EQPQkK51eF1n0v4A
         fkhPZPqp3RrvNS4p9eCEy6Kp3A+S6d+5w1WtlSD39JxrNQp53Ic6RiHaBa5uoaHuzb+Y
         r5qHB5GW5AVxKRrTHghUUqMjxwJoiPXY9yXVvguV6qOaB8v/UlakZVjbmR2wIBdAZvOs
         pCArIOevhO+eFctSJ4E8V6B95mRqzaRAqagPtZOz8btxuSQaCRajVsjfVeoRBpku15qt
         bZUzWgGizBct9PR1c9QIpVx7eaILu0ctg+dYH/Y3KK/EsfgIUVW1zzvFfflyNcPFFYsp
         ee1g==
X-Gm-Message-State: AOAM531biARkRaUqlyPRdnGdRUHicgBJjQq41xILxS8uwH10xgQNUqWE
        /Ltev47lPtJdYZFvNMVHtV31iA==
X-Google-Smtp-Source: ABdhPJzK8xShJQCN5LAxLqQhGCDhfSrEgWwbsbfvKhPgAxiS+RuSjGxfNp9Fg3WqyOx2zoUAce47Rg==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr61588803wra.165.1594286815863;
        Thu, 09 Jul 2020 02:26:55 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id d18sm4804080wrj.8.2020.07.09.02.26.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:26:55 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-4-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a59dc25f-cac2-5540-f1f4-78fd749c65c9@linaro.org>
Date:   Thu, 9 Jul 2020 10:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-4-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> I2SCTL and DMACTL registers has different bits alignment for newer
> LPASS variants of SC7180 soc. Use REG_FIELD_ID() to define the
> reg_fields in platform specific file and removed shifts and mask
> macros for such registers from header file.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>

Thanks Rohit for doing this, this looks much better now!
I have few minor comments..

> ---
>   sound/soc/qcom/lpass-apq8016.c   |  24 ++++++
>   sound/soc/qcom/lpass-cpu.c       | 163 +++++++++++++++++++++++----------------
>   sound/soc/qcom/lpass-ipq806x.c   |  24 ++++++
>   sound/soc/qcom/lpass-lpaif-reg.h | 157 +++++++++++++++++++------------------
>   sound/soc/qcom/lpass-platform.c  | 151 +++++++++++++++++++++++++++---------
>   sound/soc/qcom/lpass.h           |  53 +++++++++++++
>   6 files changed, 398 insertions(+), 174 deletions(-)
> 

index f0c7e93..f358d12 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -29,6 +29,32 @@
>   #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
>   


>   static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>   		unsigned int freq, int dir)
>   {
> @@ -79,12 +105,13 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
>   	snd_pcm_format_t format = params_format(params);
>   	unsigned int channels = params_channels(params);
>   	unsigned int rate = params_rate(params);
>   	unsigned int mode;
> -	unsigned int regval;
> -	int bitwidth, ret;
> +	int bitwidth, ret, regval;

Why is this change?

>   
>   	bitwidth = snd_pcm_format_width(format);
>   	if (bitwidth < 0) {
> @@ -92,28 +119,45 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   		return bitwidth;
>   	}
>   
> -	regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
> -			LPAIF_I2SCTL_WSSRC_INTERNAL;
> +	ret = regmap_fields_write(i2sctl->loopback, id,
> +				 LPAIF_I2SCTL_LOOPBACK_DISABLE);
> +	if (ret) {
> +		dev_err(dai->dev, "error updating loopback field: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_fields_write(i2sctl->wssrc, id,
> +				 LPAIF_I2SCTL_WSSRC_INTERNAL);
> +	if (ret) {
> +		dev_err(dai->dev, "error updating wssrc field: %d\n", ret);
> +		return ret;
> +	}
>   
>   	switch (bitwidth) {
>   	case 16:
> -		regval |= LPAIF_I2SCTL_BITWIDTH_16;
> +		regval = LPAIF_I2SCTL_BITWIDTH_16;
>   		break;
>   	case 24:
> -		regval |= LPAIF_I2SCTL_BITWIDTH_24;
> +		regval = LPAIF_I2SCTL_BITWIDTH_24;
>   		break;
>   	case 32:
> -		regval |= LPAIF_I2SCTL_BITWIDTH_32;
> +		regval = LPAIF_I2SCTL_BITWIDTH_32;
>   		break;
>   	default:
>   		dev_err(dai->dev, "invalid bitwidth given: %d\n", bitwidth);
>   		return -EINVAL;
>   	}
>   
> +	ret = regmap_fields_write(i2sctl->bitwidth, id, regval);
> +	if (ret) {
> +		dev_err(dai->dev, "error updating bitwidth field: %d\n", ret);
> +		return ret;
> +	}
> +
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -		mode = drvdata->mi2s_playback_sd_mode[dai->driver->id];
> +		mode = drvdata->mi2s_playback_sd_mode[id];
>   	else
> -		mode = drvdata->mi2s_capture_sd_mode[dai->driver->id];
> +		mode = drvdata->mi2s_capture_sd_mode[id];
>   
>   	if (!mode) {
>   		dev_err(dai->dev, "no line is assigned\n");
> @@ -175,30 +219,34 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   	}
>   
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		regval |= LPAIF_I2SCTL_SPKMODE(mode);
> +		ret = regmap_fields_write(i2sctl->spkmode, id,
> +					 LPAIF_I2SCTL_SPKMODE(mode));
>   
>   		if (channels >= 2)
> -			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
> +			ret = regmap_fields_write(i2sctl->spkmono, id,
> +						 LPAIF_I2SCTL_SPKMONO_STEREO);
>   		else
> -			regval |= LPAIF_I2SCTL_SPKMONO_MONO;
> +			ret = regmap_fields_write(i2sctl->spkmono, id,
> +						 LPAIF_I2SCTL_SPKMONO_MONO);
>   	} else {
> -		regval |= LPAIF_I2SCTL_MICMODE(mode);
> +		ret = regmap_fields_write(i2sctl->micmode, id,
> +					 LPAIF_I2SCTL_MICMODE(mode));
>   
>   		if (channels >= 2)
> -			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
> +			ret = regmap_fields_write(i2sctl->micmono, id,
> +						 LPAIF_I2SCTL_MICMONO_STEREO);
>   		else
> -			regval |= LPAIF_I2SCTL_MICMONO_MONO;
> +			ret = regmap_fields_write(i2sctl->micmono, id,
> +						 LPAIF_I2SCTL_MICMONO_MONO);
>   	}
>   
> -	ret = regmap_write(drvdata->lpaif_map,
> -			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			   regval);
>   	if (ret) {
> -		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> +		dev_err(dai->dev, "error writing to i2sctl channels mode: %d\n",
> +			ret);
>   		return ret;
>   	}
>   
> -	ret = clk_set_rate(drvdata->mi2s_bit_clk[dai->driver->id],
> +	ret = clk_set_rate(drvdata->mi2s_bit_clk[id],
>   			   rate * bitwidth * 2);
>   	if (ret) {
>   		dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
> @@ -209,41 +257,24 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> -static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
> -		struct snd_soc_dai *dai)
> -{
> -	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> -	int ret;
> -
> -	ret = regmap_write(drvdata->lpaif_map,
> -			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			   0);
> -	if (ret)
> -		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> -
> -	return ret;
> -}

Any particular reason why this function remove
> -
>   static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
>   	int ret;
> -	unsigned int val, mask;
>   
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		val = LPAIF_I2SCTL_SPKEN_ENABLE;
> -		mask = LPAIF_I2SCTL_SPKEN_MASK;
> -	} else  {
> -		val = LPAIF_I2SCTL_MICEN_ENABLE;
> -		mask = LPAIF_I2SCTL_MICEN_MASK;
> +		ret = regmap_fields_write(i2sctl->spken, id,
> +					 LPAIF_I2SCTL_SPKEN_ENABLE);
> +	} else {
> +		ret = regmap_fields_write(i2sctl->micen, id,
> +					 LPAIF_I2SCTL_MICEN_ENABLE);
>   	}
>   
> -	ret = regmap_update_bits(drvdata->lpaif_map,
> -			LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			mask, val);
>   	if (ret)
> -		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> +		dev_err(dai->dev, "error writing to i2sctl enable: %d\n", ret);
>   
>   	return ret;
>   }
...
> @@ -304,7 +326,6 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   	.startup	= lpass_cpu_daiops_startup,
>   	.shutdown	= lpass_cpu_daiops_shutdown,
>   	.hw_params	= lpass_cpu_daiops_hw_params,
> -	.hw_free	= lpass_cpu_daiops_hw_free,
>   	.prepare	= lpass_cpu_daiops_prepare,
>   	.trigger	= lpass_cpu_daiops_trigger,
>   };
> @@ -599,6 +620,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	/* Allocation for i2sctl regmap fields */
> +	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
> +					GFP_KERNEL);
> +
> +	/* Initialize bitfields for dai I2SCTL register */
> +	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
> +						drvdata->lpaif_map);
> +	if (ret) {
> +		dev_err(dev, "error init i2sctl field: %d\n", ret);
> +		return ret;
> +	}
> +
>   	ret = devm_snd_soc_register_component(dev,
>   					      &lpass_cpu_comp_driver,
>   					      variant->dai_driver,

> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 72a3e2f..5258e60 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -12,15 +12,12 @@
...
>   #endif /* __LPASS_LPAIF_REG_H__ */
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 34f7fd1..445ca193 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -50,6 +50,53 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
>   	.fifo_size		=	0,
>   };
>   
...
>   static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   				      struct snd_pcm_substream *substream)
>   {
> @@ -59,9 +106,9 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>   	struct lpass_variant *v = drvdata->variant;
>   	int ret, dma_ch, dir = substream->stream;
> -	struct lpass_pcm_data *data;
> +	struct lpass_pcm_data *data = NULL;
>   
> -	data = devm_kzalloc(soc_runtime->dev, sizeof(*data), GFP_KERNEL);
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);

Does this change belong in this patch?

>   	if (!data)
>   		return -ENOMEM;
>   
> @@ -111,13 +158,13 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>   	struct snd_pcm_runtime *runtime = substream->runtime;
>   	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>   	struct lpass_variant *v = drvdata->variant;
> -	struct lpass_pcm_data *data;
> +	struct lpass_pcm_data *data = runtime->private_data;
>   
> -	data = runtime->private_data;
>   	drvdata->substream[data->dma_ch] = NULL;
>   	if (v->free_dma_channel)
>   		v->free_dma_channel(drvdata, data->dma_ch);
>   
> +	kfree(data);
>   	return 0;
>   }
>   
>   
>   	return devm_snd_soc_register_component(&pdev->dev,
>   			&lpass_component_driver, NULL, 0);
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 450020e..4294ec2 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -17,6 +17,28 @@
>   #define LPASS_MAX_MI2S_PORTS			(8)
>   #define LPASS_MAX_DMA_CHANNELS			(8)
>   
...

>   /* Both the CPU DAI and platform drivers will access this data */
>   struct lpass_data {
>   
> @@ -55,6 +77,10 @@ struct lpass_data {
>   	struct clk_bulk_data *clks;
>   	int num_clks;
>   
> +	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
> +	struct lpaif_i2sctl *i2sctl;
> +	struct lpaif_dmactl *rd_dmactl;
> +	struct lpaif_dmactl *wr_dmactl;
>   };
>   
>   /* Vairant data per each SOC */
> @@ -72,6 +98,33 @@ struct lpass_variant {
>   	u32	wrdma_reg_stride;
>   	u32	wrdma_channels;
>   

Above two along with rddma members can be removed, these become 
redundant after adding regmap field!


> +	/* I2SCTL Register fields */
> +	struct reg_field loopback;
> +	struct reg_field spken;
> +	struct reg_field spkmode;
> +	struct reg_field spkmono;
> +	struct reg_field micen;
> +	struct reg_field micmode;
> +	struct reg_field micmono;
> +	struct reg_field wssrc;
> +	struct reg_field bitwidth;
> +
> +	/* RD_DMA Register fields */
> +	struct reg_field rdma_bursten;
> +	struct reg_field rdma_wpscnt;
> +	struct reg_field rdma_intf;
> +	struct reg_field rdma_fifowm;
> +	struct reg_field rdma_enable;
> +	struct reg_field rdma_dyncclk;
> +
> +	/* RD_DMA Register fields */
> +	struct reg_field wrdma_bursten;
> +	struct reg_field wrdma_wpscnt;
> +	struct reg_field wrdma_intf;
> +	struct reg_field wrdma_fifowm;
> +	struct reg_field wrdma_enable;
> +	struct reg_field wrdma_dyncclk;
> +
>   	/**
>   	 * on SOCs like APQ8016 the channel control bits start
>   	 * at different offset to ipq806x
> 
