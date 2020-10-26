Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DE629905D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 16:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782892AbgJZPBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 11:01:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38819 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782888AbgJZPBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 11:01:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id n18so12974198wrs.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U97g4DPk37yBTbr4sK3d+QCMl4K1OpjO58zJeloILjc=;
        b=uXgwrHyoB/oVh3VPXCniZeS4cme8VQiCH4mJUmf6fVFsiJN8mC6nzwHz7tC7EytqYj
         CYZOV4+jlcL+Lnwom/Y/MzEXEyGvOsAk4/W2ZB7rIus+ZQdJ/Ks2SNbvhRK8F87shls9
         Lw4JZBQbl9pfHwKgQuaAMIA5khCEmy7TAyQgZNi9hgsm4wgru7pbE447D3lSzDmF+s2t
         k5XtQtIjhJ8JiyGsOK5VdEcFmVWzcEt4Y38gT3sbizazWSA+54IJEjmEYhi+NeVYt9no
         xKIJoIFKtET6z4mPQj08LxJguvP1H5cqHgwChbub9D5MfAWYZ6nPUHuQp25epRa/HGhk
         wLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U97g4DPk37yBTbr4sK3d+QCMl4K1OpjO58zJeloILjc=;
        b=qBXQqI254U3vhJwR45s8kv0S23739xPMQRxVODu8S9/KxJZ4seRCDQitvP9J6rDKQe
         5XI7K/eyAinY5wnAomK1cqiy646V/bntwuX+5eheD80QvN060P1/KfQG0ggREeUH8yAC
         /m0uycy5X1juf89gN5kAD03qBOgPdO6Z+yR704u7b5b3vbI2Fr5HbiAFFyp+mgKo1csQ
         6PxOEroKlGa5oVsbMB8jcw3iApNTcstAoj5J2ShPGuwoYuMsFqy0g4iQtQTEQMKx4t60
         j3/DFqm0KdS0k1sQwCGhJ7kje749B+k4XtIwYsdu8Fzt4HBS9bAlerO7bTgQLmxnRrl2
         H/tA==
X-Gm-Message-State: AOAM531mnH/fWxpO6DTCtW6UlENqlqzxre3IUKqvBfSNMU55xbZYp4BW
        IMl1ZhiEouHGmcVb2ghwjAR/VA==
X-Google-Smtp-Source: ABdhPJwwb/Bivg+EAjiajD6Nc7JOqnZTCvtVkr5/QG5ozwvdx65HSpznlKuBPwU9mfAMsDDOYJjP8g==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr18073433wrm.79.1603724496207;
        Mon, 26 Oct 2020 08:01:36 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id w11sm22317715wrs.26.2020.10.26.08.01.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 08:01:35 -0700 (PDT)
Subject: Re: [PATCH] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1603373219-19374-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <335f1d55-8a85-8501-fd69-0397f44e21af@linaro.org>
Date:   Mon, 26 Oct 2020 15:01:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1603373219-19374-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/10/2020 14:26, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Update SC7180 lpass_variant structure with proper I2S bitwidth
> field bit positions, as bitwidth denotes 0 to 1 bits,
> but previously used only 0 bit.
> 
> Fixes: commit cba62c8b49bead ("Merge series "ASoC: qcom: Add support for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:")
this should be 12 chars long, for this particular fix it should be!

Fixes: 24caf8d9eb108 ("ASoC: qcom: lpass-sc7180: Add platform driver for 
lpass audio")
> 

No empty line after Fixes tag!


> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-sc7180.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index c6292f9e..bc998d5 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -188,7 +188,7 @@ static struct lpass_variant sc7180_data = {
>   	.micmode		= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
>   	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
>   	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
> -	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
> +	.bitwidth		= REG_FIELD_ID(0x1000, 0, 1, 3, 0x1000),
>   
>   	.rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
>   	.rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
> 
--srini
