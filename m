Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF708305777
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 10:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbhA0JzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 04:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbhA0JwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 04:52:19 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB1BC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 01:51:38 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m187so983014wme.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ZsyXSLBpqyoZDJLOwz36YTbFMR5XUsNbF337fUqt2Cg=;
        b=XM+7AUuC9pRqUpcQ44jgThIg1R06D5+ODzaBzxFVy6O64Bfu3YlokaUj/qZWDDalUp
         H1tJpg6SXSRIcUkpK8HTmhqT1G6g0LpQNcjyvtx05XkcUMVACa4uGoKORoO9VkYU6F67
         XfJHrUU6dlCoDYzyHoGyp4Nd+ZobKt/vswc5d+m3eg9Ru/wvjBAKxow2DqBRLn4pD8T/
         CZCnXmjCH8jTugGpZVNvAV8VELYQhbTLew1vPcjbYx+fP36sZYMuFhhQCB52lR0c0zbo
         fpVdMahWflCeMErqu01wEo9kvYnyiiG4V7dKhoMB40f6EakwJIJnqz/mr/g3O7bMqNce
         bbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZsyXSLBpqyoZDJLOwz36YTbFMR5XUsNbF337fUqt2Cg=;
        b=hBMNe/BanBDIBXtd8OAWVIMPzkgQoh9+Y4n7USB7+i/dr4w2Cogpkm2qVF/Slangqf
         pgJDYX1lqrWP6ZHWzpzq+GSc/81uQNO3kWBSqcaaRXbumqjYCgtDuYt6fLwqVSe1rcW5
         zYNJuKm8CcVnyVhoo2v5OJsKK63R3BLyOo0aGoRBmH+74L4gROpgixDlQIY58xMmSl9w
         29AycUmEt+Yqo3Rau7S2PqwbgmLe9RgxCfBirrXrvrAOAqS/nns15F7WyPBcdLW0Cc1G
         cHMyXxUCaoRrwOwu2HF9F34MEHXQA3wa5G487BKmnL1dh+rK6eOKxqkCoWnFqKN7P9f0
         AB6w==
X-Gm-Message-State: AOAM533wg02lwsGBL4uyn+cKpX4FWwVyQzKPINqAQieo5MPJbFSGHtar
        5Myc1IrtGVf8qSgWOvNNDXAi/w==
X-Google-Smtp-Source: ABdhPJz/BXkWanv6XHkXGTic7kAcimSL/5joj2dCuqTeRbrnaMy0dPjNX+1atXk2Dz/Jdmydy0V3FA==
X-Received: by 2002:a7b:cb8a:: with SMTP id m10mr3359497wmi.127.1611741097661;
        Wed, 27 Jan 2021 01:51:37 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id o17sm2213535wrm.52.2021.01.27.01.51.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 01:51:36 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Remove bit clock state check
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210127063038.1399-1-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <16199fa8-7a87-6e7f-9db6-1d5cd8493d4c@linaro.org>
Date:   Wed, 27 Jan 2021 09:51:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210127063038.1399-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27/01/2021 06:30, Srinivasa Rao Mandadapu wrote:
> No need of BCLK state maintenance from driver side as
> clock_enable and clk_disable API's maintaing state counter.
> 
> One of the major issue was spotted when Headset jack inserted
> while playback continues, due to same PCM device node opens twice
> for playaback/capture and closes once for capture and playback continues.
> 
> It can resolve the errors in such scenarios.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Thanks for the cleanup, yes clk core will take care of this by 
enable_count check!

You should add

Fixes: b1824968221c ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF 
invalid state")


> ---
>   sound/soc/qcom/lpass-cpu.c       | 22 ++++++++--------------
>   sound/soc/qcom/lpass-lpaif-reg.h |  3 ---
>   sound/soc/qcom/lpass.h           |  1 -
>   3 files changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index ae8efbc89af2..a669202e0001 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -286,16 +286,12 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
>   				ret);
>   
> -		if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_DISABLE) {
> -			ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> -			if (ret) {
> -				dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> -				clk_disable(drvdata->mi2s_osr_clk[id]);
> -				return ret;
> -			}
> -			drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_ENABLE;
> +		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +		if (ret) {
> +			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +			clk_disable(drvdata->mi2s_osr_clk[id]);

Can you also remove this unnecessary disable here!


-srini

> +			return ret;
>   		}
> -
>   		break;
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
> @@ -310,10 +306,9 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   		if (ret)
>   			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
>   				ret);
> -		if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_ENABLE) {
> -			clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> -			drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_DISABLE;
> -		}
> +
> +		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> +
>   		break;
>   	}
>   
> @@ -861,7 +856,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>   			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>   		}
> -		drvdata->bit_clk_state[dai_id] = LPAIF_BIT_CLK_DISABLE;
>   	}
>   
>   	/* Allocation for i2sctl regmap fields */
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 405542832e99..c8e1d75340b2 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -60,9 +60,6 @@
>   #define LPAIF_I2SCTL_BITWIDTH_24	1
>   #define LPAIF_I2SCTL_BITWIDTH_32	2
>   
> -#define LPAIF_BIT_CLK_DISABLE		0
> -#define LPAIF_BIT_CLK_ENABLE		1
> -
>   #define LPAIF_I2SCTL_RESET_STATE	0x003C0004
>   #define LPAIF_DMACTL_RESET_STATE	0x00200000
>   
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 2d68af0da34d..83b2e08ade06 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -68,7 +68,6 @@ struct lpass_data {
>   	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
>   	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
>   	int hdmi_port_enable;
> -	int bit_clk_state[LPASS_MAX_MI2S_PORTS];
>   
>   	/* low-power audio interface (LPAIF) registers */
>   	void __iomem *lpaif;
> 
