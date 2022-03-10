Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D4D4D4458
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Mar 2022 11:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237934AbiCJKRV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 05:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbiCJKRU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 05:17:20 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31521354A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 02:16:19 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so3052779wmp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=04ryZIvTRUDhoUYmcvNQt9Swok7h0slWygeHVa8vqiY=;
        b=Zd+TYWLsSoSNZ4+/oqHc8x5LYljlVmF7e5FaMcx556ItTvBHOLjGkpe92tMUlHeg84
         X2TJbDLtMC75+dpMRAH3b0To67/E5an/De1MrzB0ANAFWByKf1MDsjrwZHLQdJgL/PCl
         mfdgGLZuCT0FL3SnDYD5obVjh0eEykCQwtBWxEQXywF77qF6hpGivHmJ3ibcr5EedMYh
         CzJmC3TRzjVh+D6G1Rz87t+jjp8bQZkrUZTBeFWjPn+PaOL7h0hghF+tk0xVtakvyo6u
         aO95fA5W/7bY8YxsNe/4GByhqCmWH5Ad9Nyyih9514EE8DbPhKoN9epwwmS47fWrGnj7
         gwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=04ryZIvTRUDhoUYmcvNQt9Swok7h0slWygeHVa8vqiY=;
        b=zinZ7QviVS8S6Ji/2aaSUnKY6FZ5a25csAbFfE0x4tmsMNJv19zwfALgIiR7dhnzJz
         ZfFrh2K5tU7TkVpA8n845Ph6lO9NaWZQF8hfUA92GbLSfPiYYYtwUOJ6fRYmNtuLB9Wg
         zLrrXRJP+o56lMcUSsQhbKH7G2yzvY5KNPSHL6nC/KNsa59NwynLyNElJNrQ7zl5b5kl
         XSt6c3PDdpLgxe9s1L2JRRULLfsUiFp57dMGCvadzIFVdTErBJxKO0VHUK1G1ehin09h
         WWTwzl0yP86QkoftGHl5d0ti7yPkHOwVvvugacy1UAcHRX1dQHeD/3qX6xU8qOsJJxEn
         GsBg==
X-Gm-Message-State: AOAM533BuVbLV3Rh7HS84fvRgDHH/97vl/S1gqd5HAorpb1WVkZOZX9q
        +S7dsWcvayY1U86YQgNaSVLe5A==
X-Google-Smtp-Source: ABdhPJyywi34YHOHVhNPxnoUPjmKH7B/IOtSTulhMR1UULi9LtjP9plyHy6KFFq/cJtVWwQ6br/aJA==
X-Received: by 2002:a05:600c:1f15:b0:389:ab64:fe80 with SMTP id bd21-20020a05600c1f1500b00389ab64fe80mr11070007wmb.141.1646907378180;
        Thu, 10 Mar 2022 02:16:18 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id k10-20020adfe3ca000000b001f0329ba94csm5594508wrm.18.2022.03.10.02.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 02:16:17 -0800 (PST)
Message-ID: <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
Date:   Thu, 10 Mar 2022 10:16:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24/12/2021 16:13, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue

Are you saying that we should not be using platform_get_resource(pdev, 
IORESOURCE_IRQ, ...) on drivers that support DT?

> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.

Should this not be fixed in the DT core itself?

> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().

I would prefer this patch to be part of the series that removes IRQ 
resource handling from DT core.


--srini

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi,
> 
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 7040293c2ee8..0f29a08b4c09 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1526,13 +1526,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   	if (IS_ERR(ctrl->base))
>   		return PTR_ERR(ctrl->base);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "no slimbus IRQ resource\n");
> -		return -ENODEV;
> -	}
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
>   
> -	ret = devm_request_irq(dev, res->start, qcom_slim_ngd_interrupt,
> +	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
>   			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
>   	if (ret) {
>   		dev_err(&pdev->dev, "request IRQ failed\n");
