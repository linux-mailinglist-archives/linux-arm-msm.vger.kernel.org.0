Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8669022C44A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 13:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgGXLVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 07:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgGXLVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 07:21:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB64BC0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 04:21:48 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f2so7959514wrp.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Yxn5p63f6xRMyNZIKI09U0WQN+ewDSvHCk0EiFeJonw=;
        b=MFQ4I9EYPiUXBME2soPRf0FHybbqt0G73mLbezrYwDF9EkrdbgGj7Ql/TdkrH9A5TN
         byMUVKgWirUxLFsx1EcGnDXrkwzQNypVsr3FEzd13RDYGLi8diuVor5dgnmpyTpWGbvF
         snI1FdnNtl6hG7U1/7BVJVWMZPhEYyEgbqPF3CaKAFZOuCfvNCwcGJ7YtxZssa2rhHWP
         FnWOmXg6UN1Pv/iKqpDA//ISLi0FlQ1XlCGiTNwRP49bHMfwcGp3VmLJlThQoP3HzLai
         b9YKINrFfJgSu8X3G7H/4s1yy5zioHh1m3xO1z8lxVUHE7vwI/SXy1MJ0EdjsIWyio1n
         SPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yxn5p63f6xRMyNZIKI09U0WQN+ewDSvHCk0EiFeJonw=;
        b=ufXW2yRP7Le0V3joE529uuh/VU1QAr2HwZr5mWqmplpjBIiYvipZqy7W8HCGIapTpH
         0J036jeTtKT3RGokcUZ5QfmPeaFklzd1CASvWfMeWIB4q0c5BR0qtyzo7jGGdlpuq92Y
         Ff2efOJVzxQ833leRL9UtRvgZ2MTc3hDfEFCyTy6f2fepxo3iQWfqe41nqR/jeTo50AD
         frS10q8mvBZKIdnuGShLMQPkdbZJTBDG2KgzMVwjj+fq0XFsGlGCBN3n2jO9kIOzY0fC
         RcJCCX99Ga+Ej56uQLogLTIJXTzxrZ2638tPxPWCf9gi7LTxWde1IvLq9UNBi/sD/DvZ
         iOgg==
X-Gm-Message-State: AOAM532HvlUolysKQ41/oyUJZX0O4DH3iuiencwFJIAfQWcqK0G6/Bbl
        zNhgnRv7jsZAopEVrlQXEDdNkQ==
X-Google-Smtp-Source: ABdhPJwk3yJH2k2se0co2uZc0PH6TC0Af1M7TgEssnr7ir+wGzTPfXA1pcbKzdW/TothLmRlWDKafA==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr8736978wrr.342.1595589707519;
        Fri, 24 Jul 2020 04:21:47 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id a10sm14965705wmd.3.2020.07.24.04.21.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2020 04:21:46 -0700 (PDT)
Subject: Re: [PATCH v4 04/12] ASoC: qcom: lpass-platform: fix memory leak
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-5-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1b8f969a-8f88-2928-0b29-9325451d9613@linaro.org>
Date:   Fri, 24 Jul 2020 12:21:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595413915-17867-5-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/07/2020 11:31, Rohit kumar wrote:
> lpass_pcm_data is never freed. Free it in close
> ops to avoid memory leak.
> 
> Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index fb9acfd..b195f3d 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -61,7 +61,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   	int ret, dma_ch, dir = substream->stream;
>   	struct lpass_pcm_data *data;
>   
> -	data = devm_kzalloc(soc_runtime->dev, sizeof(*data), GFP_KERNEL);
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> @@ -118,6 +118,7 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>   	if (v->free_dma_channel)
>   		v->free_dma_channel(drvdata, data->dma_ch);
>   
> +	kfree(data);
>   	return 0;
>   }
>   
> 
