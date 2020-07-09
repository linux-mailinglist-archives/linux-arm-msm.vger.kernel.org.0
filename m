Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4627219C1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 11:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgGIJ1D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 05:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgGIJ1C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 05:27:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE970C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 02:27:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j18so1080779wmi.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FMsIKqz0TQneom1juHBrnPr4+LEkvs5/fxv1IIE3XgY=;
        b=C70Q1X38U223aCxs3FuOSpOTlYanEEPYXT0t+3DaQrYJWv09II/lPp5kqQs7gQ2VcN
         uN2igTC0DKNVTINBl+iTe2eiZIrOVoDJU47iAHJB1cEdHgJerHBzasRcCR6Ck/Cwss2o
         49uYuYdqW2tnrw7c94AbG7DSmTxaROH+jwViikAJfdNJFiQ0aIQvQWiBTR5mAPTC9vvT
         P8akeXqEr8JZ/5Gysl0VTyvZJewLN/pebHicUXKXKalBV/Xn5Q19HnoZ6v+PvtIoRx+/
         HyD0QfsBAIlQwElCRFFWr2fIyZvM8NTZgpeMvSb5K+Ey2WqJOH4khwPyNb2zxVjHzebp
         B79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FMsIKqz0TQneom1juHBrnPr4+LEkvs5/fxv1IIE3XgY=;
        b=dHOsHfwkRrUGiBfWgbE+zsMVKtsgXl7zxOjAdSOuZocxRVkVo3P/52cXPjSkklw1oN
         0VRP2Ux2cLB1Zxfo4m0x5p9JnsgXlFW8KKOd0zFXXjQn5lmc3zqJ6jZL/VCzehDo5Eji
         WydWNdF3iq3+9JPqIFNkMuyiOhac0v07PAfxW+4JpKMjGzc29dA/KsnxEj/hXpOgYSxn
         jLhRfe0yDUG5OBlhAUtkIMLF4J6+63PjvVqgvc0rLvdYLGbNHO0p+oRap7vi24RHbZDU
         9ebQqxXbv67rmjQrd1sYsZoEXTUVbcQHUh1Ch7G2DEm865RD0oGvhbrhzsFyGD/w9kcc
         3VKA==
X-Gm-Message-State: AOAM5331DCTL8ZYxTvZNmIoeN8ngqYRulw0tdSD7nS+mcTHu5dR5TEhf
        GoCHuIGJ/h5J7VK4GZf7kYOpEQ==
X-Google-Smtp-Source: ABdhPJx87vQ0PwnhiI1ahJoRP9NqWJA8+wddTTJt2k6+Vxk0Mt82SqkDwaPOMXauL4B2pMFUp5h+rQ==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr13843098wmk.170.1594286820618;
        Thu, 09 Jul 2020 02:27:00 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 65sm4081184wmd.20.2020.07.09.02.26.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:27:00 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] ASoC: qcom: lpass-platform: Replace card->dev with
 component->dev
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <61b45372-2e84-9695-b99f-4839d507bb4e@linaro.org>
Date:   Thu, 9 Jul 2020 10:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> We are allocating dma memory for component->dev but trying to mmap
> such memory for substream->pcm->card->dev. Replace device argument
> in mmap with component->dev to fix this.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 445ca193..f9424cc 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -472,9 +472,8 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
>   {
>   	struct snd_pcm_runtime *runtime = substream->runtime;
>   
> -	return dma_mmap_coherent(substream->pcm->card->dev, vma,
> -			runtime->dma_area, runtime->dma_addr,
> -			runtime->dma_bytes);
> +	return dma_mmap_coherent(component->dev, vma, runtime->dma_area,
> +				 runtime->dma_addr, runtime->dma_bytes);
>   }
>   
>   static irqreturn_t lpass_dma_interrupt_handler(
> 
