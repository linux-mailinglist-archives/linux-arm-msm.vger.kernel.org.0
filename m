Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C886506720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 10:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345185AbiDSIu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 04:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240652AbiDSIu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 04:50:28 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7576B22B0D
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 01:47:45 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id g18so21401695wrb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3zfxgfhhkGrdZQPttYFIyDKGOpAjycnaX8YYYe3nvMs=;
        b=QMuKTTF4XAeRFnDlBJHu27U50iu6XBNoG05MeKFeLU7LsVVjUcV3ejaRRo+hmzy4HE
         8RGR84YLIk71QD5AQiyRP+u8oMQokSNGjOV2GeZzTXIeNHMYrl62RYagKfoW7/4BX+KF
         C9hVR3VkHU0ESauWkgoubLwV7f0N8V8CxKFQOSGTKkkgEfNubRFW8kfT801AsfBDEl8X
         broAjmmh0Unod0xRCJh7b138tc2H80Cnl9U7AdllLIwQddcei+hpFnZERUtovQtlRIg6
         YAxxTykq5evBHh9fJaw2Sx8sp2Rao0lkkWMBCyOUCVh/qrBePzCPZAAaTK7uhf4Xw479
         BJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3zfxgfhhkGrdZQPttYFIyDKGOpAjycnaX8YYYe3nvMs=;
        b=rpB7DASVV76DEyYnDlLaCWCscW0Y7MVMMNCqSacbMov+0j+pyXEUxEOXhVI3xITQTS
         73+ybzHvbuIJv6GIt6Cj8WUWAxxE2yznUXjuz/j3yPXDHmoMG3ClrRRdHZpG1evZJBlE
         +MggjvFOzpiq9wtknBh9W5s8Zb3eS1hOTexDJUa1jZ2Uwxsyg/X+M0fz1nUjdPeacN7I
         Xz5BjEyzupR1zBkA5lyfnDlwuuIHplXe4DDboIP8pjxxAWWO8Px0qlW0FZ4g1M9VnML0
         OySnxcpi+zQql+Nw9+pT2PCDy2GHZwi3AIFJQjiLa4dqLwCGrikYRotYyau/CmduteHz
         CvaA==
X-Gm-Message-State: AOAM532Vxm+/q0JvEx7Htu1KLXVDoOOU9juPmlM6GeyJzRxjTYBerVAS
        mRVImWT+2d/dUGvFgEnamfZG8Q==
X-Google-Smtp-Source: ABdhPJyGYvopwBZKM+g01h8Kn+VxX+cUxfwLusUKA6MiYSG6VWvCuPXWxSd3hPj8JfuBmWdc2LElng==
X-Received: by 2002:adf:dd8a:0:b0:207:9e5f:fd0a with SMTP id x10-20020adfdd8a000000b002079e5ffd0amr10553750wrl.94.1650358064065;
        Tue, 19 Apr 2022 01:47:44 -0700 (PDT)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id g8-20020a5d4888000000b00207a49fa6a1sm14168011wrq.81.2022.04.19.01.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 01:47:43 -0700 (PDT)
Message-ID: <e48a9b3a-4a9f-3fa7-2bd2-edac34328c37@linaro.org>
Date:   Tue, 19 Apr 2022 09:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] slimbus: qcom: Remove unnecessary print function
 dev_err()
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>, agross@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
References: <20220414014430.19051-1-yang.lee@linux.alibaba.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220414014430.19051-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14/04/2022 02:44, Yang Li wrote:
> The print function dev_err() is redundant because
> platform_get_irq_byname() already prints an error.
> 
> Eliminate the follow coccicheck warning:
> ./drivers/slimbus/qcom-ctrl.c:514:2-9: line 514 is redundant because
> platform_get_irq() already prints an error
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>


Applied thanks,

--srini
> ---
>   drivers/slimbus/qcom-ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index ec58091fc948..c0c4f895d76e 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -510,10 +510,8 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   	}
>   
>   	ctrl->irq = platform_get_irq(pdev, 0);
> -	if (ctrl->irq < 0) {
> -		dev_err(&pdev->dev, "no slimbus IRQ\n");
> +	if (ctrl->irq < 0)
>   		return ctrl->irq;
> -	}
>   
>   	sctrl = &ctrl->ctrl;
>   	sctrl->dev = &pdev->dev;
