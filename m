Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7046C2C82E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 12:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgK3LKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 06:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgK3LKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 06:10:35 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B001C0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:09:55 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id k10so11657377wmi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=og3JaCFKA1hxe7Er/aULg3U2LUsICgsDGCZfViXEnss=;
        b=aFUJMrQqeG5iB9VwHdntb4vtkcGLRzJBFixJyb8WAuQ/TlJ2e2cypFJkIBARBnQw4j
         ekg3X58hskXvhpwXY7gvmm7Ss21BowKL4WAxZ+gxShspWpZ5v6kk+AGF4OOL7vx+vpiv
         Wd3frz3wCKf+GnU6JSWTxrl/vsckKrH4l7Jb6t2E70VF2G1KL658EwfVcaRLusuUyvJU
         wOBo6l00x0Mk2EHjFl5AnNO9DtWV2L62fQ33vlhiWVvsZ7W7cxgxhjwR9pm4vWkuursA
         WYDvxx/xfK9GsyMy3uX5SbUIdrCUkVJepUhRzR/4Y+Stz/W5rox9xDSMIuFjb8bS0Zk9
         QGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=og3JaCFKA1hxe7Er/aULg3U2LUsICgsDGCZfViXEnss=;
        b=HzNWpCMvaY37/TXIV+ep+bIZpwWnwjWn92+Yf+tIkVzowSftRzOluecR8egLluAfCM
         K4GqFz1G4yUqoxHQh1LLxSiyU6gFkSQ77rp9z33OC2UL5wxF+qNH2I9ccyUKNQdSeNpO
         mRIq4YX2AuXoCLWtox8t3zVMuzVoP5T1jSCmbG3p+fzTbu2TOqwkVDtTSbuLxk+9XUuI
         hDWt9NtbPbrCjpP8OYKZpa1LxNE7YtTa3kXNKjvQWgnKhKnAug8IgbzhTn2nGtZ7AGVV
         GsZDSJnkHupRhnbJb855bT6E8fZO5xE9QFHXUNz6F5OwvlB9pVTVepaUSozZVZbaZMHn
         2XmA==
X-Gm-Message-State: AOAM5337CU9MFJWB1dfv/J+x7EXYJSe12Mv3T7jF9LmRg28Bzft50io4
        xrScF4SnDf/GfZjpZvg3XP0bDw==
X-Google-Smtp-Source: ABdhPJx6vvpCbL6tab1OUGiXTI002xSMilMhovTRPRdlcjtCL4zc3yZHcjJTAqw26ffLwV9N4Mz3yg==
X-Received: by 2002:a05:600c:4101:: with SMTP id j1mr23115058wmi.35.1606734593807;
        Mon, 30 Nov 2020 03:09:53 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id e3sm28205394wro.90.2020.11.30.03.09.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 03:09:53 -0800 (PST)
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK and
 LRCLK in LPAIF invalid state
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4b680d9a-23eb-9746-e11e-1506d35e72c4@linaro.org>
Date:   Mon, 30 Nov 2020 11:09:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/11/2020 04:59, Srinivasa Rao Mandadapu wrote:
> This reverts part of commit b1824968221c
> ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")

This should probably go to Fixes tag!

> 

> To identify LPAIF invalid state after device suspend and resume,
> made I2S and DMA control registers not volatile, which is not necessary.
This comment is bit confusing!

Basically it should be something like
"DMA control registers are not volatile, so remove these from volatile 
registers list"

--srini


> Instead invalid reg state can be handled with regcache APIs.
> The BCLK ref count is necessary to enable clock only it's in disable state.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c      | 20 ++------------------
>   sound/soc/qcom/lpass-platform.c | 11 -----------
>   2 files changed, 2 insertions(+), 29 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af684fd..c5e99c2 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -270,18 +270,6 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
>   	unsigned int id = dai->driver->id;
>   	int ret = -EINVAL;
> -	unsigned int val = 0;
> -
> -	ret = regmap_read(drvdata->lpaif_map,
> -				LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id), &val);
> -	if (ret) {
> -		dev_err(dai->dev, "error reading from i2sctl reg: %d\n", ret);
> -		return ret;
> -	}
> -	if (val == LPAIF_I2SCTL_RESET_STATE) {
> -		dev_err(dai->dev, "error in i2sctl register state\n");
> -		return -ENOTRECOVERABLE;
> -	}
>   
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
> @@ -454,20 +442,16 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
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
> index 80b09de..0e71899 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -452,7 +452,6 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   	unsigned int reg_irqclr = 0, val_irqclr = 0;
>   	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
>   	unsigned int dai_id = cpu_dai->driver->id;
> -	unsigned int dma_ctrl_reg = 0;
>   
>   	ch = pcm_data->dma_ch;
>   	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> @@ -469,17 +468,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   		id = pcm_data->dma_ch - v->wrdma_channel_start;
>   		map = drvdata->lpaif_map;
>   	}
> -	ret = regmap_read(map, LPAIF_DMACTL_REG(v, ch, dir, dai_id), &dma_ctrl_reg);
> -	if (ret) {
> -		dev_err(soc_runtime->dev, "error reading from rdmactl reg: %d\n", ret);
> -		return ret;
> -	}
>   
> -	if (dma_ctrl_reg == LPAIF_DMACTL_RESET_STATE ||
> -		dma_ctrl_reg == LPAIF_DMACTL_RESET_STATE + 1) {
> -		dev_err(soc_runtime->dev, "error in rdmactl register state\n");
> -		return -ENOTRECOVERABLE;
> -	}
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
> 
