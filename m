Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B58B45A286
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 13:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbhKWMbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 07:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235608AbhKWMbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 07:31:00 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C55C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:27:52 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d24so38737696wra.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yk4vffJNmhyLmpnjyEy+b/mnqWZOqNqp4/3VDhbng0o=;
        b=deoRU4qND6iwkrymhQxWiRsIPJt6Q9YvUt6CpsR4Zy4EvDDgjJryYC2M004d31AS2f
         JIsthUToxCI2gAsv22JGRGXE5CXCC7Q0fCtyPdJq2nCJ2YKDW+y/98vgvUK7YFDih0Ui
         fncyP1xsjigRY2N8zEfAvD2p2twvXRNJW2KhOg3Zj4oANO53zAO47xo4z/Vz4fTlWVET
         j1RwQ1Pk14TTKRS/R3nJKY29Hnp79PufxBhdhCkY3Rou1Qd0C7QfC62jk5XEc9cani6q
         QmLWFrRqBQCcgtwlUWKNpqQ1CYllKPMTFgIcxex/CUuHBwL15TJZqnsiZHUnxVOq7a+W
         46mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yk4vffJNmhyLmpnjyEy+b/mnqWZOqNqp4/3VDhbng0o=;
        b=rG11buCapWIn2Ho08aX/3R8Nuxzhwhd48crRmJaYNj7sE31OIrd96Fs4ChMQIDHBy+
         GKFPwwKvcAy8P2Z77t6Jk78845bYDSVC+b24jzYMAL5qfGy3h1qxPaMWyx4qpM8Qc0S7
         Lu+m28g0sOGaiNt3Qu14bHjrOHDsnbnI9nvImB8i3T1XdnVOn1CSZfiDCpEvREVx7Xkh
         KmKhDMveZdDLs7Jvm2qGAhh+xGGQnWy4RuvV2TnzYxAmj0fHjHFPBQ09/t4Lc9/2GWtF
         ENPSochjk9fOG/+Oyj6e9u+f3rmcMpAsGNSZHPy9KsOcZg+GGZYviPEU3o25Rh0mK6om
         dffQ==
X-Gm-Message-State: AOAM532o1FJSCAbArp1H7vfjjb6A5lM4kZQ7fsbyvafqCksS6DBB5gaU
        KdjLubFgrJCm6GyC7gxvC95+dQ==
X-Google-Smtp-Source: ABdhPJyiqQlIw188u1zX7Z4eH7R9n2zOjpbZon5P3wHX349TMpXURB1VSqL0vDN5pxXS4OQS32YmOw==
X-Received: by 2002:a05:6000:168e:: with SMTP id y14mr7169913wrd.178.1637670470556;
        Tue, 23 Nov 2021 04:27:50 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 21sm968731wmj.18.2021.11.23.04.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:27:50 -0800 (PST)
Subject: Re: [PATCH v5 01/10] ASoC: qcom: Move lpass_pcm_data structure to
 lpass header
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
 <1637239714-11211-2-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <958bdcdc-2a33-1b19-a886-68d74d7d9480@linaro.org>
Date:   Tue, 23 Nov 2021 12:27:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637239714-11211-2-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
> Declare lpass_pcm_data structure in lpass header file instead of
> platform source file to make common use of it by other drivers
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 5 -----
>   sound/soc/qcom/lpass.h          | 5 +++++
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index a59e9d2..a44162c 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -18,11 +18,6 @@
>   
>   #define DRV_NAME "lpass-platform"
>   
> -struct lpass_pcm_data {
> -	int dma_ch;
> -	int i2s_port;
> -};
> -
>   #define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
>   #define LPASS_PLATFORM_PERIODS		2
>   
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 67ef497..63aaa6f 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -256,6 +256,11 @@ struct lpass_variant {
>   	int num_clks;
>   };
>   
> +struct lpass_pcm_data {
> +	int dma_ch;
> +	int i2s_port;
> +};
> +
>   /* register the platform driver from the CPU DAI driver */
>   int asoc_qcom_lpass_platform_register(struct platform_device *);
>   int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
> 
