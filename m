Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67FEA4ECA7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 19:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348604AbiC3RZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 13:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbiC3RZ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 13:25:56 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84022AE5F
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 10:24:10 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id l129so9571760pga.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=czlQvbkyhcIvLLP/kerBjk96Vh15ed44dz1d5B6c270=;
        b=ahzFnfI0hphDf3O+AHBufiZX0BHt092Wy224ems0w1nT2GF3hbO09GHnM1aXPSQXa8
         izSZm98/ey3wEGM4yhGNnOI151Iuceg/i6mHiC2cmoo0pcG+MbRpahKjFvXtnsefeupP
         emsBemXIOKGLevHkR5TK5/wOqklZvueumjohw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=czlQvbkyhcIvLLP/kerBjk96Vh15ed44dz1d5B6c270=;
        b=I7ZpDxh8shzpS8GtCd+nISSvrt/78a07jYrnWutqam3iC8qo8nHkfJn8TuorOPPYbT
         +UN/hQ0r+a+uavtKAahzcSKLL77GX+43cT/eeSKDwYri+0jqFV7gsxl2UpbAWwmbrpul
         WHXUt1BJR6WGzt9g4t8PLK1RYFnht9FTo35DAFS+HXHQj+otVfGs7p7Bn9HDCPbSe83c
         Slsp7hjPqERAaTT/9slX+nNV5LdilItaavq3K1i0GoXNkusCOwKIaj1OAeGiCq7HXhnl
         f1ozFLuih8C3W8MJOOoIXXsPUzvE7jAInSQYckX+nA16LoFf0E9s5M79K2u1bfMjzcTl
         QT9A==
X-Gm-Message-State: AOAM532amDCeaCeOxq4awtgMahs8451J9MwaPEnCFore/x+6xabmuQeC
        QD+K96RFFYsHB+wm9uPV/VNhFg==
X-Google-Smtp-Source: ABdhPJy1cMvbpr6Uu0vAt3g+S0FU168G58nrHSfPAT9H/HOzwsO0LQU4+C4+f6gSMeQOuU/fa0VijA==
X-Received: by 2002:a05:6a00:885:b0:4f4:17d8:be31 with SMTP id q5-20020a056a00088500b004f417d8be31mr438686pfj.57.1648661050000;
        Wed, 30 Mar 2022 10:24:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d50d:daac:acf3:cda6])
        by smtp.gmail.com with UTF8SMTPSA id q20-20020a056a00151400b004fb31b073cesm17568038pfu.109.2022.03.30.10.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 10:24:09 -0700 (PDT)
Date:   Wed, 30 Mar 2022 10:24:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     broonie@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, yuhsuan@chromium.org, judyhsiao@google.com,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [v1] ASoC: qcom: Add driver support for ALC5682I-VS.
Message-ID: <YkSSNypRYqM4PtFB@google.com>
References: <20220330084519.3863856-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220330084519.3863856-1-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 30, 2022 at 04:45:19PM +0800, Judy Hsiao wrote:
> Subject: ASoC: qcom: Add driver support for ALC5682I-VS.

nit: drop period from the subject

> Add Machine driver support for ALC5682I-VS codec.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  sound/soc/qcom/Kconfig  |   2 +
>  sound/soc/qcom/sc7280.c | 104 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 28d0dfb4033c..750653404ba3 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -197,6 +197,8 @@ config SND_SOC_SC7280
>  	select SND_SOC_LPASS_MACRO_COMMON
>  	imply SND_SOC_LPASS_RX_MACRO
>  	imply SND_SOC_LPASS_TX_MACRO
> +	select SND_SOC_RT5682_I2C
> +	select SND_SOC_RT5682S
>  	help
>  	  Add support for audio on Qualcomm Technologies Inc.
>  	  SC7280 SoC-based systems.
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> index bd0bf9c8cb28..a3e6f61e92cb 100644
> --- a/sound/soc/qcom/sc7280.c
> +++ b/sound/soc/qcom/sc7280.c
> @@ -12,14 +12,20 @@
>  #include <sound/jack.h>
>  #include <sound/pcm.h>
>  #include <sound/soc.h>
> +#include <sound/rt5682s.h>
>  #include <linux/soundwire/sdw.h>
>  
> +#include "../codecs/rt5682.h"
> +#include "../codecs/rt5682s.h"
>  #include "common.h"
>  #include "lpass.h"
>  
> +#define DEFAULT_MCLK_RATE              19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
>  struct sc7280_snd_data {
>  	struct snd_soc_card card;
>  	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
> +	u32 pri_mi2s_clk_count;
>  	struct snd_soc_jack hs_jack;
>  	struct snd_soc_jack hdmi_jack;
>  	bool jack_setup;
> @@ -69,6 +75,7 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
>  		pdata->jack_setup = true;
>  	}
>  	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
>  	case LPASS_CDC_DMA_RX0:
>  	case LPASS_CDC_DMA_TX3:
>  		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> @@ -110,11 +117,49 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
>  	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
>  }
>  
> +static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	if (++data->pri_mi2s_clk_count == 1) {
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			LPASS_MCLK0,
> +			DEFAULT_MCLK_RATE,
> +			SNDRV_PCM_STREAM_PLAYBACK);
> +	}
> +	snd_soc_dai_set_fmt(codec_dai,
> +				SND_SOC_DAIFMT_CBS_CFS |
> +				SND_SOC_DAIFMT_NB_NF |
> +				SND_SOC_DAIFMT_I2S);
> +
> +	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
> +					1536000, RT5682_PLL1_FREQ);
> +	if (ret) {
> +		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL1,
> +					RT5682_PLL1_FREQ,
> +					SND_SOC_CLOCK_IN);
> +
> +	if (ret)
> +		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +			ret);

With the current code the function would return 0, I imagine that's not
intended.

> +
> +	return 0;
> +}
> +
