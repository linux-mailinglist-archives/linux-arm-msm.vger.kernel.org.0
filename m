Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB31F42515E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 12:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240976AbhJGKqO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 06:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240917AbhJGKqN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 06:46:13 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3741C061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 03:44:19 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so17620570wrc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3r67xCci0neztBxAHtXQxOTNTLTcg0zp3S6KOv2sEww=;
        b=A/ctinh/LmGU0bsbKYZ/RJWjDQXeWNF+a+WfQF6FgnT58X7zxbi3z3nz4vcyO3uLDv
         n0/9UMH5E07gxO9pEmd5653LWBnY41nANxUa2jmlxRcrxlXz0nXC/Lm9+uE3xKeQQMCs
         f4rzcWofocwJStwmjb5zt11rsKtGxIS0IltojgSk1OJnIwLOpUY+sBmvJ+74pyJKGSOe
         o0fFNMe+Q8B9//7Xe1bL/0g3DJBnvxy5dxwu6SUs2m8Gjg7M2/Xq5/s+YCGFIDYxRLle
         mwJB5nf5rUVBRMRGVxssb5UwrglBHl+0I/4D5CapnpiVuRqG0npW4ilP6RCeqM5g59DH
         wWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3r67xCci0neztBxAHtXQxOTNTLTcg0zp3S6KOv2sEww=;
        b=f9rUZ0+P15F7h6y/TceSJLbmIK7qTSjnEGUIq6Lst9h9RTjawPsQWAsrB09xXyrTEl
         82/gA0whDtBwlZJu3IgxkYisy1KUG7uYPR6RV+DmiZr2le5Zgn4Buw4UD/oz8NrOZ/pn
         Dr2zeQcHm+Tfgpp5VFk7beu4bMgWbMW2ICg7NxOzPhONyo8z8xbc+P1a719vu4UK/Elg
         QFeieDUoEsS9qdP0zHgBfjP+aO9BmJsunCtI1rEg90axBcEH2tZ2xSWgJzuA2plFCazs
         FgQSNcFSY05dZViqTaXQzh0JPTu67r2mvZ0cseYlsCKPIUpIUCtcOMDQJLodXxg9YStO
         Q3rw==
X-Gm-Message-State: AOAM533cJ0d9kMN1CnCKDlsEaX9MI22y7iUCavvcxeVosV0L2RJMo6s3
        FY88qIjmglEXLthFKtWtN3cP7A==
X-Google-Smtp-Source: ABdhPJwQbGU7M7S6lJx3kwLHiGUmc8npWrgEkePais+zSlwLwkIT/lJ377n6zjb5ZkqiTUOpu3TsrQ==
X-Received: by 2002:adf:a48c:: with SMTP id g12mr4379486wrb.341.1633603458528;
        Thu, 07 Oct 2021 03:44:18 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id c25sm5173296wml.37.2021.10.07.03.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 03:44:17 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: dt-bindings: lpass: add binding headers for
 digital codecs
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <04210158-e999-a3a3-ee53-ac9024ab9120@linaro.org>
Date:   Thu, 7 Oct 2021 11:44:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srinivasa,


On 08/09/2021 15:03, Srinivasa Rao Mandadapu wrote:
> Add header defining for lpass internal digital codecs rx,tx and va
> dai node id's.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes since v1:
>      -- Add missing dai node ID's
> 
>   include/dt-bindings/sound/qcom,lpass.h | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 


Mark has already applied v1, 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/include/dt-bindings/sound/qcom,lpass.h?id=bfad37c53ae6168d03ab06868ea44e77995c43d5

Can you please rebase on top of sound-next so that we endup with correct 
defines.

--srini

> diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
> index 7b0b80b..a9404c3 100644
> --- a/include/dt-bindings/sound/qcom,lpass.h
> +++ b/include/dt-bindings/sound/qcom,lpass.h
> @@ -10,6 +10,37 @@
>   
>   #define LPASS_DP_RX	5
>   
> +#define LPASS_CDC_DMA_RX0 6
> +#define LPASS_CDC_DMA_RX1 7
> +#define LPASS_CDC_DMA_RX2 8
> +#define LPASS_CDC_DMA_RX3 9
> +#define LPASS_CDC_DMA_RX4 10
> +#define LPASS_CDC_DMA_RX5 11
> +#define LPASS_CDC_DMA_RX6 12
> +#define LPASS_CDC_DMA_RX7 13
> +#define LPASS_CDC_DMA_RX8 14
> +#define LPASS_CDC_DMA_RX9 15
> +
> +#define LPASS_CDC_DMA_TX0 16
> +#define LPASS_CDC_DMA_TX1 17
> +#define LPASS_CDC_DMA_TX2 18
> +#define LPASS_CDC_DMA_TX3 19
> +#define LPASS_CDC_DMA_TX4 20
> +#define LPASS_CDC_DMA_TX5 21
> +#define LPASS_CDC_DMA_TX6 22
> +#define LPASS_CDC_DMA_TX7 23
> +#define LPASS_CDC_DMA_TX8 24
> +
> +#define LPASS_CDC_DMA_VA_TX0 25
> +#define LPASS_CDC_DMA_VA_TX1 26
> +#define LPASS_CDC_DMA_VA_TX2 27
> +#define LPASS_CDC_DMA_VA_TX3 28
> +#define LPASS_CDC_DMA_VA_TX4 29
> +#define LPASS_CDC_DMA_VA_TX5 30
> +#define LPASS_CDC_DMA_VA_TX6 31
> +#define LPASS_CDC_DMA_VA_TX7 32
> +#define LPASS_CDC_DMA_VA_TX8 33
> +
>   #define LPASS_MCLK0	0
>   
>   #endif /* __DT_QCOM_LPASS_H */
> 
