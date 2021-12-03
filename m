Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AC746752B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 11:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbhLCKif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 05:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhLCKif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 05:38:35 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3148DC06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 02:35:11 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id o29so1962502wms.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Dec 2021 02:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sc8qBFRkpBmY603LQppPaoS0iorq+tIsz0Rmji+3lf8=;
        b=l5sFEgxcwy2PXro55Ttz1sH75nrROO7rzPV3/9RtZOvYNmFwhY1c/o5et+lcAXVZe7
         DU1aOTMe3uDIRD2qVJaDp0I/25nSmh9yAgii7C2FgUOAe/lBIohWaBB7SkfAV5hqOS4T
         bmUfjJsnose2t2ywqibDGHq8JsMc8lpxEgSAW0Ll9zsrvg0knpICy39dYNZD8WgMEefy
         bqhllGpw5//PqCcfF4FRWPhz3vE7FSkuoYWmbFDRuSICOdGEW+tfLzoznefEfeU3Ef5s
         kBO2BBuTFOgZhxGyyV48hSS7dvlQdmvX9UoEelc+g6h6O4SPMXMZbroE9LEbEqfPZVd9
         8Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sc8qBFRkpBmY603LQppPaoS0iorq+tIsz0Rmji+3lf8=;
        b=uz2dKZ4nmKGpqpF4o/eu7vf3DzLuSiRWxOV/qILc/a4+4YzS4jUx9zLT5/7F++eOkm
         yZHqgdUZdqVUh8YvOQGKh2yqVPt+KaUsmQIF9fNdUKpq7A9d6guLyZLmQ36qlkvjSOFO
         2HZNxJkwFd6Q6MkmTi+DFz/HTbWbxuDnA9asp8H/tm8XoNj9cvExQSMnvqkut+XMokWQ
         6dcdM4S/tE2OMvBHiLoWfisw+hR98xj3asU5x9FfimoB/heZ2Ue4z36xTRfJZFW8ZHge
         x/zYoVA57tsCIMvz4biywhW5OlsmNWB/opRf48/bmK0aNf1XBLcANpehIBFgoaMfrvrj
         g4Yg==
X-Gm-Message-State: AOAM531jfoswc1XqVe2ubuYyqf/6genrNAw5eWGKVNYszc5hzMPA2rAF
        MiD2aCG7i+5jx9w/zN3udvtRsQ==
X-Google-Smtp-Source: ABdhPJx32/9nrOEoHs9RwjfYOrigwc+jwYwDUqVFTM5JTPxB4J0YF7szeUFLpu2ZcBRVWehJxlkThw==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr13868535wmj.169.1638527709660;
        Fri, 03 Dec 2021 02:35:09 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id r11sm2243265wrw.5.2021.12.03.02.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 02:35:09 -0800 (PST)
Subject: Re: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
To:     Stephan Gerhold <stephan@gerhold.net>,
        Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-6-stephan@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
Date:   Fri, 3 Dec 2021 10:35:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211202145505.58852-6-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephan for doing this,

I have tested DB410c this use case in the past using similar patch [1].

Over all it looks good, except one comment.

On 02/12/2021 14:55, Stephan Gerhold wrote:
> The apq8016-sbc-sndcard is designed to be used with the LPASS drivers
> (bypassing the combined audio/modem DSP in MSM8916/APQ8016).
> Make it possible to use QDSP6 audio instead for the msm8916-qdsp6-sndcard.
> 
> This only requires adding some additional hooks that set up the DPCM
> backends correctly. Similar code is already used in drivers for newer
> SoCs such as apq8096.c, sdm845.c and sm8250.c.
> 
> A slightly different initialization sequence is used for the apq8016-sbc
> and msm8916-qdsp6 sound card by defining the apq8016_sbc_add_ops()
> function as device match data.

Other alternative is to reuse card->name populated from "qcom,model" 
property to differentiate between both of these.

This should also help in differentiating UCM configs.


> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Few minor nits, other than that it LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/apq8016_sbc.c | 134 +++++++++++++++++++++++++++++++++--
>   1 file changed, 129 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index ba2a98268ee4..f9d69375320e 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -17,6 +17,9 @@
>   #include <uapi/linux/input-event-codes.h>
>   #include <dt-bindings/sound/apq8016-lpass.h>
>   #include "common.h"
> +#include "qdsp6/q6afe.h"
> +
> +#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
>   
>   struct apq8016_sbc_data {
>   	struct snd_soc_card card;
> @@ -24,6 +27,7 @@ struct apq8016_sbc_data {
>   	void __iomem *spkr_iomux;
>   	struct snd_soc_jack jack;
>   	bool jack_setup;
> +	int mi2s_clk_count[MI2S_COUNT];
>   };
>   
>   #define MIC_CTRL_TER_WS_SLAVE_SEL	BIT(21)
> @@ -38,10 +42,10 @@ struct apq8016_sbc_data {
>   #define SPKR_CTL_TLMM_WS_EN_SEL_MASK	GENMASK(19, 18)
>   #define SPKR_CTL_TLMM_WS_EN_SEL_SEC	BIT(18)
>   #define DEFAULT_MCLK_RATE		9600000
> +#define MI2S_BCLK_RATE			1536000
>   
> -static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
> +static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
>   {
> -	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>   	struct snd_soc_dai *codec_dai;
>   	struct snd_soc_component *component;
>   	struct snd_soc_card *card = rtd->card;
> @@ -49,7 +53,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>   	int i, rval;
>   	u32 value;
>   
> -	switch (cpu_dai->id) {
> +	switch (mi2s) {
>   	case MI2S_PRIMARY:
>   		writel(readl(pdata->spkr_iomux) | SPKR_CTL_PRI_WS_SLAVE_SEL_11,
>   			pdata->spkr_iomux);
> @@ -128,6 +132,13 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> +static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	return apq8016_dai_init(rtd, cpu_dai->id);
> +}
> +
>   static void apq8016_sbc_add_ops(struct snd_soc_card *card)
>   {
>   	struct snd_soc_dai_link *link;
> @@ -137,6 +148,113 @@ static void apq8016_sbc_add_ops(struct snd_soc_card *card)
>   		link->init = apq8016_sbc_dai_init;
>   }
>   
> +static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
> +{
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +	case PRIMARY_MI2S_TX:
> +		return MI2S_PRIMARY;
> +	case SECONDARY_MI2S_RX:
> +	case SECONDARY_MI2S_TX:
> +		return MI2S_SECONDARY;
> +	case TERTIARY_MI2S_RX:
> +	case TERTIARY_MI2S_TX:
> +		return MI2S_TERTIARY;
> +	case QUATERNARY_MI2S_RX:
> +	case QUATERNARY_MI2S_TX:
> +		return MI2S_QUATERNARY;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
> +	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
> +}
> +
> +static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	int mi2s, ret;
> +
> +	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
> +	if (mi2s < 0)
> +		return mi2s;
> +
> +	if (++data->mi2s_clk_count[mi2s] > 1)
> +		return 0;
> +

Am assuming that as you are not setting any DIGITAL CDC clock here you 
might be using an external codec.

> +	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> +	if (ret)
> +		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
> +	return ret;
> +}
> +
> +static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	int mi2s, ret;
> +
> +	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
> +	if (mi2s < 0)
> +		return;
> +
> +	if (--data->mi2s_clk_count[mi2s] > 0)
> +		return;
> +
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
> +	if (ret)
> +		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
> +}
> +
> +static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
> +	.startup = msm8916_qdsp6_startup,
> +	.shutdown = msm8916_qdsp6_shutdown,
> +};
> +
> +static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +					    struct snd_pcm_hw_params *params)
> +{
> +	struct snd_interval *rate = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_interval *channels = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_CHANNELS);
> +	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +
> +	rate->min = rate->max = 48000;
> +	channels->min = channels->max = 2;
> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +
> +	return 0;
> +}
> +
> +static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	/* Make it obvious to userspace that QDSP6 is used */
> +	card->components = "qdsp6";
> +
> +	for_each_card_prelinks(card, i, link) {
> +		if (link->no_pcm) {
> +			link->init = msm8916_qdsp6_dai_init;
> +			link->ops = &msm8916_qdsp6_be_ops;
> +			link->be_hw_params_fixup = msm8916_qdsp6_be_hw_params_fixup;
> +		}
> +	}
> +}
> +
>   static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
>   
>   	SND_SOC_DAPM_MIC("Handset Mic", NULL),
> @@ -148,11 +266,16 @@ static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
>   
>   static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>   {
> +	void (*add_ops)(struct snd_soc_card *card);
>   	struct device *dev = &pdev->dev;
>   	struct snd_soc_card *card;
>   	struct apq8016_sbc_data *data;
>   	int ret;
>   
> +	add_ops = device_get_match_data(&pdev->dev);
> +	if (!add_ops)
> +		return -EINVAL;

We will never hit the error case here because without a match we can not 
even enter the probe function.

--srini
> +
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
> @@ -177,12 +300,13 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>   
>   	snd_soc_card_set_drvdata(card, data);
>   
> -	apq8016_sbc_add_ops(card);
> +	add_ops(card);
>   	return devm_snd_soc_register_card(&pdev->dev, card);
>   }
>   
>   static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
> -	{ .compatible = "qcom,apq8016-sbc-sndcard" },
> +	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
> +	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
> 
[1]: 
https://git.linaro.org/people/srinivas.kandagatla/linux.git/commit/?h=q6dsp-db410c-v5.11-rc6&id=9d62822a5f66cd06a5e6b31f6b841a25c143926c
