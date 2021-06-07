Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BB239DED8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 16:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhFGOfb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 10:35:31 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:55892 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFGOfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 10:35:30 -0400
Received: by mail-wm1-f47.google.com with SMTP id g204so10174478wmf.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nS6m0FoskpK8ycN8QLA4hdqiDT6/K9kbC4GMmw4lEgg=;
        b=wuBUUMPo7j+sLLFtnqKUaB82pFJHv99qGo7ClXfEqsZSvuaJUB5BF/A35SoVioEQ//
         XHgydv395SYMXvt+cNyaJQHl+CJ/2O5Dpwb975geOr0WhIe/z0AdvzIg/GVzlngBPhLh
         iOal7WLi6KppWqsBkqrcMdh56ZhC/7MNI7F8VIdv/czQqpkmRqQwt6pamieTWHJpDCW0
         NhiSsOnT0BVvweBvIEbrXcCPArp9x/rAEpRsOfSvHOuuZcmBSted+rUGMieDzYzmQwgO
         Cx53J1e06Edwmn+SniXjCexCf+0r+Pr5IWfHPmPNTuM76ErJiuDtD4Z5Uo2Mi5XjPXQX
         MhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nS6m0FoskpK8ycN8QLA4hdqiDT6/K9kbC4GMmw4lEgg=;
        b=aCwHcgHKhlLr1G6LB3fCN7mIpg7Qam/omGbejnQfiQLrT7MoPDmHCMhBDt85BWVdNz
         s9Y07etlB7qzj/CmZEEIRjCNgRI+v4LlKGZGupNJE1kyUDRTBhDYX5qAn7SAkWeakFEG
         5DjUo6BfutM5YsKd/wcpknNuRApBGYGnveWRwp7LSYHTENwDM9opAKEbGDpeTgdoeJR8
         4LhXlNVJ2D6NQsxEMH6dk+6//ap6KZvMd9CSE86m4ByXYTT8c4Oq5zJtDQNVgDoPcqPW
         YO8sHCkv/4Nmdv9D1qtamUP6JyPK2CNbq65eUxg+TR5F4Wm2s1mLaD/koxJwyTCvUi7t
         YZgQ==
X-Gm-Message-State: AOAM531NKdlTElXmnfN7+E5ymqJdeQHGfyhv2trM27DUXMkxMEvvYWx+
        j1y1Ulc3N4j7UrD5MFCDEOCiew==
X-Google-Smtp-Source: ABdhPJxb4K8fj18KdVF7Jxi2taqHp0HFH+pigd0oQiE21oW8Svcam6ppkiB16UL1xyG+N6jay4+0Zg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr2594914wmq.31.1623076344662;
        Mon, 07 Jun 2021 07:32:24 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 125sm18884963wmb.34.2021.06.07.07.32.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 07:32:24 -0700 (PDT)
Subject: Re: [v7] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
To:     Judy Hsiao <judyhsiao@chromium.org>, broonie@kernel.org
Cc:     Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
References: <20210604154545.1198337-1-judyhsiao@chromium.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0085836e-20d5-d74f-5a1e-1a6ea8252d02@linaro.org>
Date:   Mon, 7 Jun 2021 15:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210604154545.1198337-1-judyhsiao@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 04/06/2021 16:45, Judy Hsiao wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> This patch fixes PoP noise of around 15ms observed during audio
> capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
> introducing some delay before capture start.
> 
> Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> (am from https://patchwork.kernel.org/patch/12276369/)
> (also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
> Changes Since V6:
> 	-- Removed clk_disable OSR clock in lpass_cpu_daiops_prepare error case as failure
>             of prepare will result in calling shutdown which should take care of this.
> Changes Since V5:
>          -- Fixed nit.
>          -- Updated `mi2s_was_prepared[dai->driver->id] = true;` after checking for errors.
> Changes Since V4:
>          -- Replaced the __clk_is_enabled(BCLK) check by the self maintained.
>             mi2s_was_prepared bool state.
>          -- Removed unrelated changes.
>          -- Refined comments.
> Changes Since V3:
>          -- Checked BCLK is off before enabling it in lpass_cpu_daiops_prepare as
>             lpass_cpu_daiops_prepare can be called multiple times
>          -- Checked BCLK is on before disabling it in lpass_cpu_daiops_shutdown to
>             fix the WARN. It is because BCLK may not be enabled if
>             lpass_cpu_daiops_prepare is not called before lpass_cpu_daiops_shutdown
>          -- Added more comments
> Changes Since V2:
>          -- Updated comments as per linux style
>          -- Removed unrelated changes
> Changes Since V1:
>          -- Enabled BCLK and LRCLK in dai ops prepare API instead of startup API
>          -- Added comments
> 
>   sound/soc/qcom/lpass-cpu.c | 79 ++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass.h     |  4 ++
>   2 files changed, 83 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af8cb64924a0..647423a6cb57 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -93,8 +93,30 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
>   
>   	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> +	/*
> +	 * Ensure LRCLK is disabled even in device node validation.
> +	 * Will not impact if disabled in lpass_cpu_daiops_trigger()
> +	 * suspend.
> +	 */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
> +	else
> +		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
> +
> +	/*
> +	 * BCLK may not be enabled if lpass_cpu_daiops_prepare is called before
> +	 * lpass_cpu_daiops_shutdown. It's paired with the clk_enable in
> +	 * lpass_cpu_daiops_prepare.
> +	 */
> +	if (drvdata->mi2s_was_prepared[dai->driver->id]) {
> +		drvdata->mi2s_was_prepared[dai->driver->id] = false;
> +		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> +	}
> +
>   	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
>   }
>   
> @@ -275,6 +297,18 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		/*
> +		 * Ensure lpass BCLK/LRCLK is enabled during
> +		 * device resume as lpass_cpu_daiops_prepare() is not called
> +		 * after the device resumes. We don't check mi2s_was_prepared before
> +		 * enable/disable BCLK in trigger events because:
> +		 *  1. These trigger events are paired, so the BCLK
> +		 *     enable_count is balanced.
> +		 *  2. the BCLK can be shared (ex: headset and headset mic),
> +		 *     we need to increase the enable_count so that we don't
> +		 *     turn off the shared BCLK while other devices are using
> +		 *     it.
> +		 */
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   			ret = regmap_fields_write(i2sctl->spken, id,
>   						 LPAIF_I2SCTL_SPKEN_ENABLE);
> @@ -296,6 +330,10 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		/*
> +		 * To ensure lpass BCLK/LRCLK is disabled during
> +		 * device suspend.
> +		 */
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   			ret = regmap_fields_write(i2sctl->spken, id,
>   						 LPAIF_I2SCTL_SPKEN_DISABLE);
> @@ -315,12 +353,53 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	return ret;
>   }
>   
> +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> +		struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
> +	int ret;
> +
> +	/*
> +	 * Ensure lpass BCLK/LRCLK is enabled bit before playback/capture
> +	 * data flow starts. This allows other codec to have some delay before
> +	 * the data flow.
> +	 * (ex: to drop start up pop noise before capture starts).
> +	 */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
> +	else
> +		ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
> +
> +	if (ret) {
> +		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check mi2s_was_prepared before enabling BCLK as lpass_cpu_daiops_prepare can
> +	 * be called multiple times. It's paired with the clk_disable in
> +	 * lpass_cpu_daiops_shutdown.
> +	 */
> +	if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
> +		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +		if (ret) {
> +			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +			return ret;
> +		}
> +		drvdata->mi2s_was_prepared[dai->driver->id] = true;
> +	}
> +	return 0;
> +}
> +
>   const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
>   	.startup	= lpass_cpu_daiops_startup,
>   	.shutdown	= lpass_cpu_daiops_shutdown,
>   	.hw_params	= lpass_cpu_daiops_hw_params,
>   	.trigger	= lpass_cpu_daiops_trigger,
> +	.prepare	= lpass_cpu_daiops_prepare,
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>   
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 83b2e08ade06..7f72214404ba 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -67,6 +67,10 @@ struct lpass_data {
>   	/* MI2S SD lines to use for playback/capture */
>   	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
>   	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
> +
> +	/* The state of MI2S prepare dai_ops was called */
> +	bool mi2s_was_prepared[LPASS_MAX_MI2S_PORTS];
> +
>   	int hdmi_port_enable;
>   
>   	/* low-power audio interface (LPAIF) registers */
> 
