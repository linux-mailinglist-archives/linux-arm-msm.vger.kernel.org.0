Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2B6306296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 18:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344286AbhA0Rtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 12:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344191AbhA0Rtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 12:49:31 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FB3C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 09:48:51 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 190so2262080wmz.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 09:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=fA8V3wK/iXuNUDNxQGGXePONMGKipgMljYi7+GjKWGw=;
        b=a8OhkeDNIrmKqsh/XjliHEErqfLR1649OYBoBGFEvLBOZ+ggHDLSWAX/n6j/z3w97I
         O9tH41Smi3ymg1pzgGeLbzIMLsO1feji4tUOSibpYzaPjyI82MNd0eb9IWB7PxDjg0G0
         oxyBWYBW+1tVrQZsIKJypSvyl4xSYL6BjScCBKZXOj15rIGNmx6Y2hxnOya6A+R0gFYw
         nztYfgt+1rsHdsegI70WVsq2XlPBJoH0aNeyT1TF2D7loXZjMTjNyppoXG6dOigQsqHY
         Yseux6Wu2pv1M40LIaXYKK+8w94rILX4hZXdN1tnWevAeuMKey6Q3DlEpnyb6rlTCzWk
         vZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fA8V3wK/iXuNUDNxQGGXePONMGKipgMljYi7+GjKWGw=;
        b=H+yn3r03rMjo081/fdmu+oVjiEtUHLVVQ4fiLIzx0U4BMAk9LadT1udfMuVejSAD7a
         wYIBl/McWGdsKeEiCTT/9aPT97WKPMc43miKNuhLqoHAufN70ykWOzaSTvvf5e/d2jwg
         5vfBthMkEyC0IA2g7txo7xsNsr/0nlyFm7NqxKr/1uylx2FA1FwsAutMsxgZzbsNoZ9K
         pD5I+D6ef13Cx58mDp8VDdbmQImQJ/cJnbPXkCuNodrbwrCSoCVH23ay7HIwySMor0GU
         /KDZ7igBCQMS1VNgIZ/DI6cWjoKDAaoIhhWKchDrc29OSiRC3sADvEZArGwGp1oRfKoG
         lyeQ==
X-Gm-Message-State: AOAM5321kTlgxXVISfgod3WvZ5eKGLCINlXvrl5Rmme/W3Q+uQa59bkZ
        OoIbnuITCseNVgYk22OjLNlcdQ==
X-Google-Smtp-Source: ABdhPJytQUIw/wSZmG+xRMZTNwB9UYiZ1gjegwsMACvZMcy5esdmS9dTfu0F9n4G/uSGin5bLFQNew==
X-Received: by 2002:a1c:6486:: with SMTP id y128mr5397108wmb.12.1611769730244;
        Wed, 27 Jan 2021 09:48:50 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id e12sm3680787wrs.67.2021.01.27.09.48.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 09:48:49 -0800 (PST)
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Remove bit clock state check
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210127151824.8929-1-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <752d2980-2c84-c03f-7960-b9de8027c4d6@linaro.org>
Date:   Wed, 27 Jan 2021 17:48:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210127151824.8929-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27/01/2021 15:18, Srinivasa Rao Mandadapu wrote:
> No need of BCLK state maintenance from driver side as
> clock_enable and clk_disable API's maintaing state counter.
> 
> One of the major issue was spotted when Headset jack inserted
> while playback continues, due to same PCM device node opens twice
> for playaback/capture and closes once for capture and playback continues.
> 
> It can resolve the errors in such scenarios.
> 
> Fixes: b1824968221c ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> Changes since v1:
>     -- Commit message changed
> 
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
